package Controlador;

import Config.Fecha;
import Config.GenerarSerie;
import DAO.DAOCompras;
import DAO.DAOComprobantes;
import DAO.DAOProducto;
import DAO.DAOProveedor;
import Modelo.Compra;
import Modelo.Comprobantes;
import Modelo.DetalleCompra;
import Modelo.Empleados;
import Modelo.ProdComProveedor;
import Modelo.Productos;
import Modelo.Proveedor;

import java.io.IOException;
import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class ControladorCompras extends HttpServlet {

    DAOProducto pdao = new DAOProducto();
    DAOProveedor pvdao = new DAOProveedor();
    DAOComprobantes comdao = new DAOComprobantes();

    DAOCompras cdao = new DAOCompras();
    DecimalFormat df = new DecimalFormat("#");
    //----------------------------
    int cantidad = 1;
    double precioCompra = 0;
    int id;
    double monto;
    double subtotal;
    int pcvalor;
    int dcvalor;
    String proveedor;
    String comprobante;
    String NumeroSerie;
    List<ProdComProveedor> listaProductosFactura = new ArrayList<>();
    List<Productos> listaProductos = new ArrayList<>();
    List<Proveedor> listaProveedores = new ArrayList<>();
    Productos pro = new Productos();
    Fecha fecha = new Fecha();

    //PARAMETROS DE REPORTE----------
    int idcprov = 0;
    int ide = 0;
    String f1 = "";
    String f2 = "";

    List<Compra> listaCompras = new ArrayList<>();

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            listaProductos = pdao.listar();
            listaProveedores = pvdao.listarActivos();
            request.setAttribute("productos", listaProductos);
            request.setAttribute("proveedores", listaProveedores);
            request.setAttribute("comprobante", comdao.listar());
            request.setAttribute("NroFactura", NumeroSerie);
        } catch (Exception e) {
        }
        String accion = request.getParameter("accion");
        HttpSession sessioncom = request.getSession();
        sessioncom.setAttribute("pcvalor", pcvalor);
        sessioncom.setAttribute("dcvalor", dcvalor);
        sessioncom.setAttribute("proveedor", proveedor);
        sessioncom.setAttribute("tipocompro", comprobante);
        switch (accion) {
            case "NuevaCompra":
                listarFactura(request);
                request.getRequestDispatcher("vistas/Compras.jsp").forward(request, response);
                break;
            case "ListarCompras":
                this.listarCompras(request, response);
                break;
            case "SeleccionarProveedor":
                pcvalor = Integer.parseInt(request.getParameter("valor1"));
                proveedor = request.getParameter("nomprov");
                sessioncom.setAttribute("pcvalor", pcvalor);
                sessioncom.setAttribute("proveedor", proveedor);
                request.getRequestDispatcher("ControladorCompras?accion=Listar").forward(request, response);
                break;
            case "SeleccionarComprobante":
                dcvalor = Integer.parseInt(request.getParameter("valor2"));
                comprobante = request.getParameter("tipocompro");
                sessioncom.setAttribute("dcvalor", dcvalor);
                sessioncom.setAttribute("tipocompro", comprobante);
                request.getRequestDispatcher("ControladorCompras?accion=Listar").forward(request, response);
                break;
            case "AgregarNumeroFactura":
                NumeroSerie = request.getParameter("numeroFAC");
                request.setAttribute("NroFactura", NumeroSerie);
                request.getRequestDispatcher("vistas/Compras.jsp").forward(request, response);
                break;
            case "AgregarProductoaFactura":
                cantidad = 1;
                int pos = 0;
                id = Integer.parseInt(request.getParameter("cod"));
                if (listaProductosFactura.size() > 0) {
                    for (int i = 0; i < listaProductosFactura.size(); i++) {
                        if (listaProductosFactura.get(i).getId() == id) {
                            pos = i;
                        }
                    }
                    if (listaProductosFactura.get(pos).getId() == id) {
                        cantidad = listaProductosFactura.get(pos).getCant() + cantidad;
                        subtotal = listaProductosFactura.get(pos).getPrecioCompras() * cantidad;
                        listaProductosFactura.get(pos).setCant(cantidad);
                        listaProductosFactura.get(pos).setPrecioSubtotal(subtotal);
                    } else {
                        Productos p = pdao.listarId(id);
                        ProdComProveedor pb = new ProdComProveedor();
                        pb.setId(id);
                        pb.setDescripcion(p.getNombre());
                        pb.setCant(cantidad);
                        pb.setPrecioCompras(p.getPreciocompra());
                        subtotal = cantidad * p.getPreciocompra();
                        pb.setPrecioSubtotal(subtotal);
                        listaProductosFactura.add(pb);
                    }
                } else {
                    Productos p = pdao.listarId(id);
                    ProdComProveedor pb = new ProdComProveedor();
                    pb.setId(id);
                    pb.setDescripcion(p.getNombre());
                    pb.setCant(cantidad);
                    pb.setPrecioCompras(p.getPreciocompra());
                    subtotal = cantidad * p.getPreciocompra();
                    pb.setPrecioSubtotal(subtotal);
                    listaProductosFactura.add(pb);
                }
                listarFactura(request);
                request.getRequestDispatcher("ControladorCompras?accion=NuevaCompra").forward(request, response);
                break;
            case "ActualizarCantidad":
                String[] arreglo;
                arreglo = request.getParameterValues("arreglo[]");
                id = Integer.parseInt(arreglo[0]);
                int cant = Integer.parseInt(arreglo[1]);
                for (int i = 0; i < listaProductosFactura.size(); i++) {
                    if (listaProductosFactura.get(i).getId() == id) {
                        listaProductosFactura.get(i).setCant(cant);
                        subtotal = listaProductosFactura.get(i).getPrecioCompras() * cant;
                        listaProductosFactura.get(i).setPrecioSubtotal(subtotal);
                    }
                }
                break;
            case "ActualizarPrecio":
                String[] ar;
                ar = request.getParameterValues("arreglo[]");
                id = Integer.parseInt(ar[0]);
                double precio = Double.parseDouble(ar[1]);
                for (int i = 0; i < listaProductosFactura.size(); i++) {
                    if (listaProductosFactura.get(i).getId() == id) {
                        listaProductosFactura.get(i).setPrecioCompras(precio);
                        subtotal = listaProductosFactura.get(i).getCant() * precio;
                        listaProductosFactura.get(i).setPrecioSubtotal(subtotal);
                    }
                }
                break;
            case "Delete":
                id = Integer.parseInt(request.getParameter("id"));
                for (int i = 0; i < listaProductosFactura.size(); i++) {
                    if (listaProductosFactura.get(i).getId() == id) {
                        listaProductosFactura.remove(i);
                    }
                }
                listarFactura(request);
                request.getRequestDispatcher("vistas/Compras.jsp").forward(request, response);
                break;
            case "RegistrarCompra":
                //Este Buble es para Actualizar Stock
                for (int s = 0; s < listaProductosFactura.size(); s++) {
                    pro = new Productos();
                    cantidad = listaProductosFactura.get(s).getCant();
                    precioCompra = listaProductosFactura.get(s).getPrecioCompras();
                    int idpro = listaProductosFactura.get(s).getId();
                    pro = pdao.listarId(idpro);
                    int sa = pro.getStock() + cantidad;
                    double precioCompra = pro.getPreciocompra() + this.precioCompra;
                    pdao.actualizarStock(sa, idpro);
                    pdao.actualizarPrecioCompra(precioCompra, idpro);
                }
                //-------------------
                if (monto != 0) {
                    //Agregando el IdPEdido dentro dle objeto
//                    Proveedor pro = new Proveedor();
//                    pro.setIdProveedor(pcvalor);
                    //Agregando el IdEmpleado dentro dle objeto

                    Empleados em = (Empleados) sessioncom.getAttribute("empleado");

                    //Agregando el IdComprobante dentro dle objeto
                    Comprobantes fac = new Comprobantes();
                    fac.setCodigo(dcvalor);
                    //Iniciando el Objeto Venta
                    Compra com = new Compra();
                    //Agreagndo todos los valores dentro del Objeto}
                    com.setIdproveedor(pcvalor);
                    com.setIdempleado(em.getId_Empleados());
                    com.setFecha(fecha.FechaBD());
                    com.setMonto(monto);
                    com.setNumserie(NumeroSerie);
                    com.setIdcomprobante(dcvalor);
                    com.setEstado("1");

                    List<DetalleCompra> detalle = new ArrayList<>();
                    //Agregar Valores dentro de la Variable Lista                   
                    for (int i = 0; i < listaProductosFactura.size(); i++) {
                        DetalleCompra dv = new DetalleCompra();
                        Productos pdo = new Productos();
                        pdo.setId_Producto(listaProductosFactura.get(i).getId());
                        dv.setProducto(pdo);
                        dv.setCantidad(listaProductosFactura.get(i).getCant());
                        dv.setPrecioUnitario(listaProductosFactura.get(i).getPrecioCompras());
                        detalle.add(dv);
                    }
                    //Aqui todo el Detalle Colocando dentro del objeto venta en sus campo Detalle
                    com.setDetalleCompras(detalle);
                    //Ejecutando el Metodo Registrar
                    try {
                        cdao.registrar(com);
                        listaProductosFactura = new ArrayList<>();
                    } catch (Exception e) {
                        System.err.println("Errorrrr" + e);
                    }
                    request.getRequestDispatcher("ControladorCompras?accion=ListarCompras").forward(request, response);
                } else {
                    request.getRequestDispatcher("ControladorCompras?accion=NuevaCompra").forward(request, response);
                }
                listaProductosFactura = new ArrayList<>();
                limpiar();
                break;
            case "Cancelar":
                listaProductosFactura = new ArrayList<>();
                limpiar();
                request.getRequestDispatcher("ControladorCompras?accion=NuevaCompra").forward(request, response);
                break;
            case "ReporteCompras1":
                try {
                    idcprov = Integer.parseInt(request.getParameter("txtCodigoProveedor"));
                    listaCompras = cdao.listarporProveedor(idcprov);
                } catch (Exception e) {
                    System.err.println("ErrorVentaReporte" + e);
                }
                request.setAttribute("ListaCompras", listaCompras);
                request.getRequestDispatcher("ControladorCompras?accion=DetalleCompras").forward(request, response);
                break;
            case "ReporteCompras2":
                try {
                    ide = Integer.parseInt(request.getParameter("txtCodigoEmpleado"));
                    listaCompras = cdao.listarporEmpleado(ide);
                } catch (Exception e) {
                    System.err.println("ErrorVentaReporte" + e);
                }
                request.setAttribute("ListaCompras", listaCompras);
                request.getRequestDispatcher("ControladorCompras?accion=DetalleCompras").forward(request, response);
                break;
            case "ReporteCompras3":
                try {
                    f1 = request.getParameter("fecha1");
                    f2 = request.getParameter("fecha2");
                    listaCompras = cdao.listarporFechas(f1, f2);
                } catch (Exception e) {
                    System.err.println("ErrorVentaReporte" + e);
                }
                request.setAttribute("ListaCompras", listaCompras);
                request.getRequestDispatcher("ControladorCompras?accion=DetalleCompras").forward(request, response);
                break;
            case "DetalleCompras":
                request.getRequestDispatcher("/vistas/ListadeCompras.jsp").forward(request, response);
                break;
            case "detalle":
                this.capturarDetalle(request, response);
                break;
            case "verDetalle":
                this.mostrarDetalles(request, response);
                break;
            default:
                request.getRequestDispatcher("ControladorCompras?accion=NuevaCompra").forward(request, response);
                throw new AssertionError();
        }

    }

    public void limpiar() {
        pcvalor = 0;
        dcvalor = 0;
        NumeroSerie = "";
    }

    public void listarFactura(HttpServletRequest request) {
        HttpSession httpSession = request.getSession();
        monto = 0.0;
        for (int i = 0; i < listaProductosFactura.size(); i++) {
            monto = monto + listaProductosFactura.get(i).getPrecioSubtotal();
        }
        httpSession.setAttribute("monto", df.format(monto));
        httpSession.setAttribute("listaProductosFactura", listaProductosFactura);
        request.setAttribute("NumeroSerie", NumeroSerie);
    }

    public void NumeroSerieComprobante(HttpServletRequest request) {
        HttpSession Session = request.getSession();
        NumeroSerie = cdao.numerodeVenta();
        if (NumeroSerie == null) {
            NumeroSerie = "00000001";
            Session.setAttribute("NumeroSerieCompras", NumeroSerie);
        } else {
            int incre = Integer.parseInt(NumeroSerie);
            GenerarSerie gs = new GenerarSerie();
            NumeroSerie = gs.GenerarSerie(incre);
            Session.setAttribute("NumeroSerieCompras", NumeroSerie);
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

    private void listarCompras(HttpServletRequest request, HttpServletResponse response) {
        DAOCompras dao = new DAOCompras();
        List<Compra> compra = null;
        try {
            compra = dao.listar();
            request.setAttribute("ListaCompras", compra);
        } catch (Exception e) {
            request.setAttribute("msje", "No se pudo listar las compras" + e.getMessage());
        } finally {
            dao = null;
        }
        try {
            this.getServletConfig().getServletContext().getRequestDispatcher("/vistas/ListadeCompras.jsp").forward(request, response);
        } catch (Exception e) {
            request.setAttribute("msje", "No se pudo realizar la operacion");
        }
    }

    private void capturarDetalle(HttpServletRequest request, HttpServletResponse response) {
        DAOCompras dao;
        Compra comp;
        List<DetalleCompra> detalles;
        if (request.getParameter("cod") != null) {
            comp = new Compra();
            comp.setId(Integer.parseInt(request.getParameter("cod")));

            dao = new DAOCompras();
            try {
                detalles = dao.listarDetallesCompra(comp);
                request.setAttribute("detallesCompras", detalles);
            } catch (Exception e) {
                request.setAttribute("msje", e.getMessage());
            }
            this.mostrarDetalles(request, response);//Presenta el formulario de listado..
        }
    }

    private void mostrarDetalles(HttpServletRequest request, HttpServletResponse response) {
        try {
            this.getServletConfig().getServletContext().getRequestDispatcher("/vistas/detalleCompras.jsp").forward(request, response);
        } catch (Exception e) {
        }
    }

}
