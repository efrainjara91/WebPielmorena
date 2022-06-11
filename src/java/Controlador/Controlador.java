package Controlador;

import Config.Fecha;
import Modelo.Carrito;
import Modelo.Clientes;
import DAO.DAOCliente;
import Modelo.CompraOnline;
import DAO.ComprasDAO;
import DAO.DAOCategoria;
import DAO.DAOMarca;
import DAO.DAOProducto;
import DAO.DAOtipoDocumentos;

import Modelo.DetalleCompraOnline;
import Modelo.Pago;
import Modelo.Productos;
import DAO.ProductoDAO;
import Modelo.Categorias;
import Modelo.DocumentoIdentidad;
import Modelo.Marcas;
import java.io.File;
import java.io.IOException;
import java.util.ArrayList;

import java.util.Calendar;
import java.util.GregorianCalendar;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileItemFactory;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

public class Controlador extends HttpServlet {

    Pago pago = new Pago();
    Clientes cl = new Clientes();
    DAOCliente cldao = new DAOCliente();
    DAOCategoria catedao = new DAOCategoria();
    Categorias cate = new Categorias();
    Marcas mar = new Marcas();

    ComprasDAO cdao = new ComprasDAO();
    ProductoDAO pdao = new ProductoDAO();

    Productos p = new Productos();
    int item = 0;
    int cantidad = 1;
    double subtotal = 0.0;
    double totalPagar = 0.0;
    DAOtipoDocumentos comdao = new DAOtipoDocumentos();

    List<Carrito> listaProductos = new ArrayList<>();
    List productos = new ArrayList();
    List productosDestacados = new ArrayList();
    List productos_por_categoria = new ArrayList();

    String logueo = " Iniciar Sesion";
    String correo = " Iniciar Sesion";
    String doc = "Iniciar Sesion";

    String comprar = "Inicia Sesión para poder comprar";
    int idcompra;
    int idpago;
    double montopagar;
    int idProducto = 0;

    Carrito car = new Carrito();

    Fecha fechaSistem = new Fecha();

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        try {
            request.setAttribute("documento", comdao.listar());
            HttpSession session = request.getSession();
            session.setAttribute("logueo", logueo);
            session.setAttribute("correo", correo);
            session.setAttribute("comprar", comprar);
            session.setAttribute("ci", doc);

            productos = pdao.listar();
            productosDestacados = pdao.listarDestacados();

            request.setAttribute("prodDestacados", productosDestacados);
            String accion = request.getParameter("accion");

            switch (accion) {
                case "carrito":
                    totalPagar = 0.0;
                    item = 0;
                    request.setAttribute("Carrito", listaProductos);
                    for (int i = 0; i < listaProductos.size(); i++) {
                        totalPagar = totalPagar + listaProductos.get(i).getSubTotal();
                        listaProductos.get(i).setItem(item + i + 1);
                        // session.setAttribute("carrito", listaProductos);
                    }
                    request.setAttribute("cont", listaProductos.size());
                    this.listarCategorias(request, response);
                    request.setAttribute("totalPagar", totalPagar);

                    request.getRequestDispatcher("vistas/carrito.jsp").forward(request, response);

                    break;
                case "Comprar":
                    agregarCarrito(request);
                    request.getRequestDispatcher("Controlador?accion=carrito").forward(request, response);
                    this.listarCategorias(request, response);

                    break;
                case "AgregarCarrito":
                    this.listarCategorias(request, response);
                    agregarCarrito(request);
                    request.setAttribute("cont", listaProductos.size());
                    request.getRequestDispatcher("Controlador?accion=home").forward(request, response);
                    break;
                case "deleteProducto":
                    idProducto = Integer.parseInt(request.getParameter("id"));
                    if (listaProductos != null) {
                        for (int j = 0; j < listaProductos.size(); j++) {
                            if (listaProductos.get(j).getIdProducto() == idProducto) {
                                listaProductos.remove(j);
                            }
                        }
                    }
                    break;
                case "updateCantidad":
                    idProducto = Integer.parseInt(request.getParameter("id"));
                    int cant = Integer.parseInt(request.getParameter("cantidad"));
                    for (int j = 0; j < listaProductos.size(); j++) {
                        if (listaProductos.get(j).getIdProducto() == idProducto) {
                            listaProductos.get(j).setCantidad(cant);
                            listaProductos.get(j).setSubTotal(listaProductos.get(j).getPrecioCompra() * cant);
                        }
                    }
                    break;

                case "Validar":
                    String email = request.getParameter("txtemail");
                    String pass = request.getParameter("txtpass");

                    cl = cldao.Validar(email, pass);
                    if (cl.getIdCliente() != 0) {
                        logueo = cl.getNombres();
                        correo = cl.getCorreo_electrónico();
                        doc = cl.getNumIdentificación();
                        if (cl.getCorreo_electrónico() != null) {
                            session.setAttribute("cliente", cl);
                            request.getRequestDispatcher("Controlador?accion=carrito").forward(request, response);

                        } else {
                            request.setAttribute("msje", "Credenciales no válidas");
                            session.invalidate();
                            request.getRequestDispatcher("clientes?accion=nuevo").forward(request, response);
                        }
                    }
                    request.getRequestDispatcher("Controlador?accion=carrito").forward(request, response);
                    break;
                case "Registrar":
                    this.registrarCliente(request, response);
                    //request.getRequestDispatcher("Controlador?accion=carrito").forward(request, response);
                    break;
                case "Nuevo":
                    this.listarCategorias(request, response);

                    request.getRequestDispatcher("Controlador?accion=home").forward(request, response);
                    agregarCarrito(request);
                    listaProductos = new ArrayList();
                    request.setAttribute("cont", listaProductos.size());

                    break;
                case "Buscar":
                    String nombre = request.getParameter("txtbuscar");
                    productos = pdao.buscar(nombre);
                    request.setAttribute("cont", listaProductos.size());
                    request.setAttribute("productos", productos);
                    request.getRequestDispatcher("index.jsp").forward(request, response);
                    break;
                case "RealizarPago":
                    montopagar = totalPagar;
                    if (cl.getIdCliente() != 0 && montopagar > 0) {
                        cdao.Pagar(montopagar);
                        request.getRequestDispatcher("Controlador?accion=carrito").forward(request, response);
                    } else {
                        montopagar = 0;
                        request.getRequestDispatcher("Controlador?accion=carrito").forward(request, response);
                    }
                    break;
                case "GenerarCompra":
                    this.listarCategorias(request, response);

                    idpago = cdao.IdPago();
                    if (cl.getIdCliente() != 0 && listaProductos.size() != 0 && montopagar > 0) {
                        if (totalPagar > 0.0) {
                            CompraOnline co = new CompraOnline();
                            co.setIdCliente(cl.getIdCliente());
                            co.setFecha(fechaSistem.FechaBD());
                            co.setMonto(totalPagar);
                            co.setIdPago(idpago);
                            co.setEstado("Cancelado - En Proceso de Envio");
                            cdao.guardarCompra(co);
                            montopagar = 0;

                            idcompra = cdao.IdCompra();
                            for (int i = 0; i < listaProductos.size(); i++) {
                                DetalleCompraOnline dc = new DetalleCompraOnline();
                                dc.setIdcompra(idcompra);
                                dc.setIdproducto(listaProductos.get(i).getIdProducto());
                                dc.setCantidad(listaProductos.get(i).getCantidad());
                                dc.setPrecioCompra(listaProductos.get(i).getPrecioCompra());
                                cdao.guardarDetalleCompra(dc);
                            }
                            listaProductos = new ArrayList<>();
                            List compra = cdao.misCompras(cl.getIdCliente());
                            request.setAttribute("myCompras", compra);
                            request.getRequestDispatcher("vistas/comprasWeb.jsp").forward(request, response);
                        } else {
                            request.getRequestDispatcher("Controlador?accion=home").forward(request, response);
                        }
                    } else {
                        request.getRequestDispatcher("Controlador?accion=carrito").forward(request, response);
                    }
                    break;
                case "MisCompras":
                    this.listarCategorias(request, response);

                    if (cl.getIdCliente() != 0) {
                        List compra = cdao.misCompras(cl.getIdCliente());
                        request.setAttribute("myCompras", compra);
                        request.getRequestDispatcher("vistas/comprasWeb.jsp").forward(request, response);
                    } else if (listaProductos.size() > 0) {
                        request.getRequestDispatcher("Controlador?accion=carrito").forward(request, response);
                    } else {
                        request.getRequestDispatcher("Controlador?accion=home").forward(request, response);
                    }
                    break;
                case "verDetalle":
                    this.listarCategorias(request, response);

                    totalPagar = 0.0;
                    int idcompras = Integer.parseInt(request.getParameter("idcompra"));
                    List<DetalleCompraOnline> detalle = cdao.Detalle(idcompras);
                    request.setAttribute("myDetalle", detalle);
                    for (int i = 0; i < detalle.size(); i++) {
                        totalPagar = totalPagar + (detalle.get(i).getPrecioCompra() * detalle.get(i).getCantidad());
                    }
                    request.setAttribute("montoPagar", totalPagar);
                    request.getRequestDispatcher("vistas/DetalleCompra.jsp").forward(request, response);
                    break;
                case "NuevoProducto":
                    this.cargarCategorias(request, response);
                    this.cargarMarcas(request, response);
                    request.setAttribute("productos", productos);
                    request.getRequestDispatcher("vistas/addProducto.jsp").forward(request, response);
                    break;

                case "GuardarProducto":
                    ArrayList<String> pro = new ArrayList<>();
                    try {
                        FileItemFactory factory = new DiskFileItemFactory();
                        ServletFileUpload fileUpload = new ServletFileUpload(factory);
                        List items = fileUpload.parseRequest(request);
                        for (int i = 0; i < items.size(); i++) {
                            FileItem fileItem = (FileItem) items.get(i);
                            if (!fileItem.isFormField()) {
                                File file = new File("C:\\xampp\\htdocs\\imagenes\\" + fileItem.getName());
                                fileItem.write(file);
                                p.setImagen("http://localhost:80/imagenes/" + fileItem.getName());
                            } else {
                                pro.add(fileItem.getString());
                            }
                        }
                        p.setNombre(pro.get(0));
                        p.setDescripcion(pro.get(1));
                        p.setPrecio(Double.parseDouble(pro.get(2)));
                        p.setStock(Integer.parseInt(pro.get(3)));
                        p.setPreciocompra(Double.parseDouble(pro.get(4)));
                        p.setVigencia(true);
                        //p.setCategoria(Integer.parseInt(pro.get(6)));

//                        cate = new Categorias();
//                        cate.setCodigo(Integer.parseInt(pro.get(6)));
//                        p.setCategoria(cate);
//                        
//                        mar = new Marcas();
//                        mar.setId_Marca(Integer.parseInt(pro.get(7)));
//                        p.setMarca(mar);
                        pdao.AgregarNuevoProducto(p);

                    } catch (Exception e) {
                        request.setAttribute("msje",
                                "No se pudo registrar el producto" + e.getLocalizedMessage());
                    }
                    request.getRequestDispatcher("Controlador?accion=NuevoProducto").forward(request, response);
                    break;
                case "Salir":
                    listaProductos = new ArrayList();
                    cl = new Clientes();
                    session.invalidate();
                    logueo = "Iniciar Sesion";
                    correo = "Iniciar Sesion";
                    doc = "Iniciar Sesion";
                    request.getRequestDispatcher("Controlador?accion=Salirr").forward(request, response);
                    break;

                case "getId":
                    this.productosxCategoria(request, response);
                    break;
                case "ver":
                    this.listadoProductos_categoria(request, response);
                    break;
                default:
                    request.setAttribute("cont", listaProductos.size());
                    request.setAttribute("productos", productos);
                    request.getRequestDispatcher("index.jsp").forward(request, response);
            }
        } catch (Exception ex) {
            Logger.getLogger(Controlador.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

    public void agregarCarrito(HttpServletRequest request) {
        cantidad = 1;
        int pos = 0;
        int idpp = Integer.parseInt(request.getParameter("id"));
        if (listaProductos.size() > 0) {
            for (int i = 0; i < listaProductos.size(); i++) {
                if (listaProductos.get(i).getIdProducto() == idpp) {
                    pos = i;
                }
            }
            if (idpp == listaProductos.get(pos).getIdProducto()) {
                cantidad = listaProductos.get(pos).getCantidad() + cantidad;
                subtotal = listaProductos.get(pos).getPrecioCompra() * cantidad;
                listaProductos.get(pos).setCantidad(cantidad);
                listaProductos.get(pos).setSubTotal(subtotal);
            } else {
                car = new Carrito();
                p = pdao.listarId(idpp);
                car.setIdProducto(p.getId_Producto());
                car.setNombres(p.getNombre());
                car.setImagen(p.getImagen());
                car.setDescripcion(p.getDescripcion());
                car.setPrecioCompra(p.getPrecio());
                car.setCantidad(cantidad);
                subtotal = cantidad * p.getPrecio();
                car.setSubTotal(subtotal);
                listaProductos.add(car);
            }
        } else {
            car = new Carrito();
            p = pdao.listarId(idpp);
            car.setIdProducto(p.getId_Producto());
            car.setNombres(p.getNombre());
            car.setImagen(p.getImagen());
            car.setDescripcion(p.getDescripcion());
            car.setPrecioCompra(p.getPrecio());
            car.setCantidad(cantidad);
            subtotal = cantidad * p.getPrecio();
            car.setSubTotal(subtotal);
            listaProductos.add(car);
        }
    }

    private void listarCategorias(HttpServletRequest request, HttpServletResponse response) {
        DAOCategoria dao = new DAOCategoria();
        List<Categorias> categorias = null;

        try {
            categorias = dao.listarMenus();
            request.setAttribute("categorias", categorias);
        } catch (Exception e) {
            request.setAttribute("msje", "No se pudo listar las categorias");
        } finally {
            dao = null;
        }
    }

    private void registrarCliente(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        DAOCliente dao;
        Clientes cli = null;
        DocumentoIdentidad doc;

        if (request.getParameter("cboTipoDocumento") != null
                && request.getParameter("cboGenero") != null
                && request.getParameter("txtNombre") != null
                && request.getParameter("txtApellidoP") != null
                && request.getParameter("txtApellidoM") != null
                && request.getParameter("txtDocumento") != null
                && request.getParameter("txtCorreo") != null
                && request.getParameter("txtClave") != null
                && request.getParameter("txtFechaNac") != null
                && request.getParameter("txtCelular") != null) {

            cli = new Clientes();
            cli.setNombres(request.getParameter("txtNombre"));
            cli.setApellido_paterno(request.getParameter("txtApellidoP"));
            cli.setApellido_materno(request.getParameter("txtApellidoM"));
            cli.setNumIdentificación(request.getParameter("txtDocumento"));
            cli.setCorreo_electrónico(request.getParameter("txtCorreo"));
            
            cli.setCelular(request.getParameter("txtCelular"));
            cli.setDirección(request.getParameter("txtDireccion"));

            Calendar c = new GregorianCalendar();
            String dia = Integer.toString(c.get(Calendar.DATE));
            String mes = Integer.toString(c.get(Calendar.MONTH) + 1);
            String anio = Integer.toString(c.get(Calendar.YEAR));
            String fecha = anio + "-" + mes + "-" + dia;

            cli.setFecha_nacimiento(fecha);

            if (request.getParameter("cboGenero").equals("Masculino")) {
                cli.setGenero("M");
            }
            if (request.getParameter("cboGenero").equals("Femenino")) {
                cli.setGenero("F");
            }
            doc = new DocumentoIdentidad();
            doc.setCodigo(Integer.parseInt(request.getParameter("cboTipoDocumento")));
            cli.setDocumentoIdentidad(doc);

            if (request.getParameter("chkVigencia") != null) {
                cli.setEstado(true);
            } else {
                cli.setEstado(false);
            }
            dao = new DAOCliente();
            try {
                dao.registrar(cli);
                request.getRequestDispatcher("Controlador?accion=carrito").forward(request, response);
            } catch (Exception e) {
                request.setAttribute("msje", "No se pudo registrar el cliente" + e.getMessage());
                request.setAttribute("cliente", cli);
                request.setAttribute("accion", "registrar");
            } finally {
            }
        }
    }

    private void cargarCategorias(HttpServletRequest request, HttpServletResponse response) {
        DAOCategoria dao = new DAOCategoria();
        List<Categorias> cats = null;

        try {
            cats = dao.listarVigentes();
            request.setAttribute("categorias", cats);
        } catch (Exception e) {
            request.setAttribute("msje", "No se puede cargar las categorias");
        } finally {
            cats = null;
            dao = null;
        }
    }

    private void cargarMarcas(HttpServletRequest request, HttpServletResponse response) {
        DAOMarca dao = new DAOMarca();
        List<Marcas> marca = null;

        try {
            marca = dao.listar();
            request.setAttribute("marcas", marca);
        } catch (Exception e) {
            request.setAttribute("msje", "No se puede cargar las marcas");
        } finally {
            marca = null;
            dao = null;
        }
    }

    private void productosxCategoria(HttpServletRequest request, HttpServletResponse response) {
        this.verCategoriasMenu(request, response);
        DAOProducto dao2 = new DAOProducto();
        List<Productos> productos;
        Categorias cat;
        if (request.getParameter("cod") != null) {
            cat = new Categorias();
            cat.setCodigo(Integer.parseInt(request.getParameter("cod")));

            try {
                productos = dao2.ProductosPorCategoria(cat);
                request.setAttribute("productos", productos);
            } catch (Exception e) {
                request.setAttribute("msje", e.getMessage() + "No se mostrar los detalles del producto seleccionado");

            }
            this.listadoProductos_categoria(request, response);
        }
    }

    private void listadoProductos_categoria(HttpServletRequest request, HttpServletResponse response) {
        request.setAttribute("cont", listaProductos.size());
        this.verCategoriasMenu(request, response);

        try {
            this.getServletConfig().getServletContext().
                    getRequestDispatcher("/vistas/productos_por_categoria.jsp"
                    ).forward(request, response);
        } catch (Exception e) {
            request.setAttribute("msje", "No se pudo realizar la operacion");
        }
    }

    private void verCategoriasMenu(HttpServletRequest request, HttpServletResponse response) {
        DAOCategoria dao = new DAOCategoria();
        List<Categorias> categorias = null;

        try {
            categorias = dao.listarMenus();
            request.setAttribute("categorias", categorias);
        } catch (Exception e) {
            request.setAttribute("msje", "No se pudo listar las categorias");
        } finally {
            dao = null;
        }
    }
}
