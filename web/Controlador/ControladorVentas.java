package Controlador;

import Config.Fecha;
import Config.GenerarSerie;
import DAO.DAOCategoria;
import DAO.DAOCliente;
import DAO.DAOComprobantes;
import DAO.DAOProducto;
import DAO.DAOVenta;
import Modelo.Categorias;
import Modelo.Clientes;
import Modelo.Comprobantes;
import Modelo.DetalleVenta;
import Modelo.Empleados;
import Modelo.Productos;
import Modelo.ProductosTicket;
import Modelo.Venta;
import java.io.IOException;
import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class ControladorVentas extends HttpServlet {

    DAOProducto pdao = new DAOProducto();
    DAOCliente cdao = new DAOCliente();
    DAOComprobantes comdao = new DAOComprobantes();
    DAOVenta vdao = new DAOVenta();
    Productos pro = new Productos();

    List<Venta> listaVentas = new ArrayList<>();
    List<Productos> listaProductos = new ArrayList<>();
    List<ProductosTicket> listaProductosTicket = new ArrayList<>();
    int id;
    int cantidad = 1;
    double total;
    double subTotal;
    double igv;
    double subtototal;
    double totalPagar;
    DecimalFormat df = new DecimalFormat("#");

    String NumeroSerie;
    Fecha fecha = new Fecha();
    int cvalor = 0;
    int dvalor = 0;
    String cli;
    String tipocomp;
    //PARAMETROS DE REPORTE
    int idc = 0;
    int ide = 0;
    String f1 = "";
    String f2 = "";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            request.setAttribute("productos", pdao.listarProductosConStock());
            request.setAttribute("cliente", cdao.listarActivos());
            request.setAttribute("comprobante", comdao.listarCompTicket());
        } catch (Exception e) {
        }
        String accion = request.getParameter("accion");
        HttpSession sesion = request.getSession();
        sesion.setAttribute("dvalor", dvalor);
        sesion.setAttribute("cvalor", cvalor);
        sesion.setAttribute("nomclie", cli);
        sesion.setAttribute("tipocompro", tipocomp);
        if (request.getParameter("accion") != null) {
            accion = request.getParameter("accion");
            switch (accion) {
                case "NuevaVenta":
                    NumeroSerieComprobate(request);
                    listarTicket(request);
                    request.getRequestDispatcher("vistas/Ventas.jsp").forward(request, response);
                    break;
                case "ListarVentas":
                    this.listarVentas(request, response);
                    this.mostrarCategoria(request, response);
                    break;
                case "SeleccionarCliente":
                    cvalor = Integer.parseInt(request.getParameter("valor1"));
                    cli = request.getParameter("nomclie");
                    sesion.setAttribute("cvalor", cvalor);
                    sesion.setAttribute("nomclie", cli);
                    NumeroSerieComprobate(request);
                    request.getRequestDispatcher("ControladorPrincipal?accion=Listar").forward(request, response);
                    break;
                case "SeleccionarComprobante":
                    dvalor = Integer.parseInt(request.getParameter("valor2"));
                    tipocomp = request.getParameter("tipocompro");
                    sesion.setAttribute("dvalor", dvalor);
                    sesion.setAttribute("tipocompro", tipocomp);
                    NumeroSerieComprobate(request);
                    request.getRequestDispatcher("ControladorPrincipal?accion=Listar").forward(request, response);
                    break;
                case "AgregarProductoaTicket":
                    cantidad = 1;
                    int pos = 0;
                    id = Integer.parseInt(request.getParameter("cod"));
                    if (listaProductosTicket.size() > 0) {
                        for (int i = 0; i < listaProductosTicket.size(); i++) {
                            if (listaProductosTicket.get(i).getId() == id) {
                                pos = i;
                            }
                        }
                        if (listaProductosTicket.get(pos).getId() == id) {
                            cantidad = listaProductosTicket.get(pos).getCant() + cantidad;
                            total = listaProductosTicket.get(pos).getPrecioVenta() * cantidad;
                            listaProductosTicket.get(pos).setCant(cantidad);
                            listaProductosTicket.get(pos).setPrecioTotal(total);
                        } else {
                            Productos p = pdao.listarId(id);
                            ProductosTicket pb = new ProductosTicket();
                            pb.setId(id);
                            pb.setDescripcion(p.getNombre());
                            pb.setCant(cantidad);
                            pb.setPrecioVenta(p.getPrecio());
                            total = cantidad * p.getPrecio();
                            pb.setPrecioTotal(total);
                            listaProductosTicket.add(pb);
                        }
                    } else {
                        Productos p = pdao.listarId(id);
                        ProductosTicket pb = new ProductosTicket();
                        pb.setId(id);
                        pb.setDescripcion(p.getNombre());
                        pb.setCant(cantidad);
                        pb.setPrecioVenta(p.getPrecio());
                        total = cantidad * p.getPrecio();
                        pb.setPrecioTotal(total);
                        listaProductosTicket.add(pb);
                    }
                    listarTicket(request);
                    request.getRequestDispatcher("vistas/Ventas.jsp").forward(request, response);
                    break;
                case "ActualizarCantidad":
                    String[] arreglo;
                    arreglo = request.getParameterValues("arreglo[]");
                    id = Integer.parseInt(arreglo[0]);
                    int cant = Integer.parseInt(arreglo[1]);
                    for (int i = 0; i < listaProductosTicket.size(); i++) {
                        if (listaProductosTicket.get(i).getId() == id) {
                            listaProductosTicket.get(i).setCant(cant);
                            subTotal = listaProductosTicket.get(i).getPrecioVenta() * cant;
                            listaProductosTicket.get(i).setPrecioTotal(subTotal);
                        }
                    }
                    break;
                case "Delete":
                    id = Integer.parseInt(request.getParameter("id"));
                    for (int i = 0; i < listaProductosTicket.size(); i++) {
                        if (listaProductosTicket.get(i).getId() == id) {
                            listaProductosTicket.remove(i);
                        }
                    }
                    listarTicket(request);
                    request.getRequestDispatcher("vistas/Ventas.jsp").forward(request, response);
                    break;
                case "GenerarVenta":
                    //Este Buble es para Actualizar Stock
                    for (int s = 0; s < listaProductosTicket.size(); s++) {
                        pro = new Productos();
                        cantidad = listaProductosTicket.get(s).getCant();
                        int idpro = listaProductosTicket.get(s).getId();
                        pro = pdao.listarId(idpro);
                        int sa = pro.getStock() - cantidad;
                        pdao.actualizarStock(sa, idpro);
                    }
                    //-------------------

                    if (totalPagar != 0) {
                        //Agregando el IdPEdido dentro dle objeto
                        Clientes pe = new Clientes();
                        pe.setIdCliente(cvalor);
                        //Agregando el IdEmpleado dentro dle objeto
                        Empleados em = new Empleados();
                        em.setId_Empleados(1);
                        //Agregando el IdComprobante dentro dle objeto
                        Comprobantes com = new Comprobantes();
                        com.setCodigo(dvalor);
                        //Iniciando el Objeto Venta
                        Venta v = new Venta();
                        //Agreagndo todos los valores dentro del Objeto}
                        v.setIdEmpleados(em);
                        v.setIdCliente(pe);
                        v.setNumeroSerie(NumeroSerie);
                        v.setFechaVenta(fecha.FechaBD());
                        v.setIgv(igv);
                        v.setMontoventa(totalPagar);
                        v.setEstado(true);
                        v.setIdComprobante(com);
                        List<DetalleVenta> detale = new ArrayList<>();
                        //Agregar Valores dentro de la Variable Lista                   
                        for (int i = 0; i < listaProductosTicket.size(); i++) {
                            DetalleVenta dv = new DetalleVenta();
                            Productos pdo = new Productos();
                            pdo.setId_Producto(listaProductosTicket.get(i).getId());
                            dv.setProducto(pdo);
                            dv.setCantidad(listaProductosTicket.get(i).getCant());
                            dv.setPrecioUnitario(listaProductosTicket.get(i).getPrecioVenta());
                            detale.add(dv);
                        }
                        //Aqui todo el Detalle Colocando dentro del objeto venta en sus campo Detalle
                        v.setDetalleVentas(detale);
                        //Ejecutando el Metodo Registrar
                        try {
                            vdao.registrar(v);
                        } catch (Exception e) {
                            System.err.println("" + e);
                        }
                        request.getRequestDispatcher("/imprimirComprobante.jsp").forward(request, response);
                    } else {
                        request.getRequestDispatcher("ControladorPrincipal?accion=NuevaVenta").forward(request, response);
                    }
                    listaProductosTicket = new ArrayList<>();
                    NumeroSerieComprobate(request);
                    limpiar();
                    break;
                case "Cancelar":
                    listaProductosTicket = new ArrayList<>();
                    limpiar();
                    request.getRequestDispatcher("ControladorPrincipal?accion=NuevaVenta").forward(request, response);
                    break;
                case "ReporteVentas1":
                    try {
                        idc = Integer.parseInt(request.getParameter("txtCodigoCliente"));
                        listaVentas = vdao.listarporCliente(idc);
                    } catch (Exception e) {
                        System.err.println("ErrorVentaReporte" + e);
                    }
                    this.mostrarCategoria(request, response);
                    request.setAttribute("ListaVentas", listaVentas);
                    request.getRequestDispatcher("ControladorPrincipal?accion=DetalleReporte").forward(request, response);
                    break;
                case "ReporteVentas2":
                    try {
                        ide = Integer.parseInt(request.getParameter("txtCodigoEmpleado"));
                        listaVentas = vdao.listarporEmpleado(ide);
                    } catch (Exception e) {
                        System.err.println("ErrorVentaReporte" + e);
                    }
                    this.mostrarCategoria(request, response);

                    request.setAttribute("ListaVentas", listaVentas);
                    request.getRequestDispatcher("ControladorPrincipal?accion=DetalleReporte").forward(request, response);
                    break;
                case "ReporteVentas3":
                    try {
                        f1 = request.getParameter("fecha1");
                        f2 = request.getParameter("fecha2");
                        listaVentas = vdao.listarporFechas(f1, f2);
                    } catch (Exception e) {
                        System.err.println("ErrorVentaReporte" + e);
                    }
                    this.mostrarCategoria(request, response);
                    request.setAttribute("ListaVentas", listaVentas);
                    request.getRequestDispatcher("ControladorPrincipal?accion=DetalleReporte").forward(request, response);
                    break;
                case "ReporteVentas4":
                    this.presentarReportePorTipoDoc(request, response);
                    this.mostrarCategoria(request, response);
                    request.getRequestDispatcher("ControladorPrincipal?accion=DetalleReporte").forward(request, response);
                    break;
                case "ReporteVentas5":
                    this.obtenerDatos(request, response);
                    this.mostrarCategoria(request, response);
                    request.getRequestDispatcher("ControladorPrincipal?accion=DetalleReporte").forward(request, response);
                    break;
                case "DetalleReporte":
                    request.getRequestDispatcher("/vistas/ListadeVentas.jsp").forward(request, response);
                    
                    break;
                case "detalle":
                    this.capturarDetalle(request, response);
                    break;
                case "verDetalle":
                    this.mostrarDetalles(request, response);
                    break;
                case "verCategoria":
                    this.mostrarCategoria(request, response);
                    break;
                default:
                    request.getRequestDispatcher("ControladorPrincipal?accion=NuevaVenta").forward(request, response);
                    throw new AssertionError();
            }

        } else if (request.getParameter("cambiar") != null) {
            this.cambiarVigencia(request, response);
        } else {
            request.setAttribute(
                    "msje", "No se indicó la operación a realizar");
            this.getServletConfig().getServletContext().getRequestDispatcher("/WEB-INF/vistas/error.jsp"
            ).forward(request, response);
        }
    }

    public void listarTicket(HttpServletRequest request) {
        HttpSession httpSession = request.getSession();
        subTotal = 0.0;
        igv = 0.0;

        totalPagar = 0.0;
        for (int i = 0; i < listaProductosTicket.size(); i++) {
            subTotal = subTotal + listaProductosTicket.get(i).getPrecioTotal();
        }

//        igv = subTotal * 0.18;

        subTotal = subTotal - igv;
      totalPagar = subTotal;

        httpSession.setAttribute("SubTotal", df.format(subTotal));
        httpSession.setAttribute("IGV", df.format(igv));
        httpSession.setAttribute("TotalPagar", df.format(totalPagar));
        httpSession.setAttribute("listaProductosTicket", listaProductosTicket);
        request.setAttribute("NumeroSerie", NumeroSerie);
    }

    public void NumeroSerieComprobate(HttpServletRequest request) {
        HttpSession Session = request.getSession();
        NumeroSerie = vdao.numerodeVenta();
        if (NumeroSerie == null) {
            NumeroSerie = "00000001";
            request.setAttribute("NumeroSerie", NumeroSerie);
        } else {
            int incre = Integer.parseInt(NumeroSerie);
            GenerarSerie gs = new GenerarSerie();
            NumeroSerie = gs.GenerarSerie(incre);
            Session.setAttribute("NumeroSerie", NumeroSerie);
        }
    }

    public void limpiar() {
        cvalor = 0;
        dvalor = 0;
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

    private void listarVentas(HttpServletRequest request, HttpServletResponse response) {
        DAOVenta dao = new DAOVenta();
        List<Venta> vta = null;
        try {
            this.mostrarCategoria(request, response);

            vta = dao.listar();
            request.setAttribute("ListaVentas", vta);
        } catch (Exception e) {
            request.setAttribute("msje", "No se pudo listar las ventas" + e.getMessage());
        } finally {
            dao = null;
        }
        try {
            this.getServletConfig().getServletContext().getRequestDispatcher("/vistas/ListadeVentas.jsp").forward(request, response);
        } catch (Exception e) {
            request.setAttribute("msje", "No se pudo realizar la operacion");
        }
    }

    private void cambiarVigencia(HttpServletRequest request, HttpServletResponse response) {
        DAOVenta dao;
        Venta vta;
        try {
            dao = new DAOVenta();
            vta = new Venta();

            if (request.getParameter("cambiar").equals("act")) {
                vta.setEstado(true);
            } else {
                vta.setEstado(false);
            }

            if (request.getParameter("cod") != null) {
                vta.setIdventa(Integer.parseInt(request.getParameter("cod")));
                dao.cambiarVigencia(vta);
            }
        } catch (Exception e) {
            request.setAttribute("msj", e.getMessage());
        }
        this.listarVentas(request, response);
    }

    private void capturarDetalle(HttpServletRequest request, HttpServletResponse response) {
        DAOVenta dao;
        Venta vent;
        List<DetalleVenta> detalles;
        this.mostrarCategoria(request, response);
        if (request.getParameter("cod") != null) {
            vent = new Venta();
            vent.setIdventa(Integer.parseInt(request.getParameter("cod")));

            dao = new DAOVenta();
            try {
                detalles = dao.listarDetalles(vent);
                request.setAttribute("detalles", detalles);
            } catch (Exception e) {
                request.setAttribute("msje", e.getMessage() + "No se mostrar los detalles del producto seleccionado");

            }
            this.mostrarDetalles(request, response);
        }
    }

    private void mostrarDetalles(HttpServletRequest request, HttpServletResponse response) {
        try {
            this.getServletConfig().getServletContext().getRequestDispatcher(
                    "/vistas/detalleVenta.jsp"
            ).forward(request, response);
        } catch (Exception e) {
        }
    }

    private void presentarReportePorTipoDoc(HttpServletRequest request, HttpServletResponse response) {
        DAOVenta dao = new DAOVenta();
        List<Venta> report = null;
        String buscar;

        if (request.getParameter("cboTipoDoc") != null) {
            buscar = request.getParameter("cboTipoDoc");
            try {
                report = dao.listarVigentes(buscar);
                request.setAttribute("ListaVentas", report);
                request.setAttribute("error", "");
            } catch (Exception e) {
                request.setAttribute("error", "No se pudo acceder al servidor");
            }

        }
    }

    private void mostrarCategoria(HttpServletRequest request, HttpServletResponse response) {
        DAOCategoria dao = new DAOCategoria();
        List<Categorias> categorias = null;

        try {
            categorias = dao.listar();
            request.setAttribute("categorias", categorias);
        } catch (Exception e) {
            request.setAttribute("msje", "No se pudo listar las categorias" + e.getMessage());
        }
    }

    private void obtenerDatos(HttpServletRequest request, HttpServletResponse response) {
        DAOVenta dao = new DAOVenta();
        List<Venta> productos = null;
        Categorias cat;

        if (request.getParameter("cboCategoria") != null) {
            cat = new Categorias();
            cat.setCodigo(Integer.parseInt(
                    request.getParameter("cboCategoria")));
            try {
                productos = dao.listarProductosPorCategoria(cat);
                request.setAttribute("ListaVentas", productos);
                request.setAttribute("error", "");
            } catch (Exception e) {
                request.setAttribute("error", "No se pudo acceder al servidor");
            }
        }
    }
}
