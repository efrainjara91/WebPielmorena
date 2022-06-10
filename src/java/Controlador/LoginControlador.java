package Controlador;

import DAO.DAOCategoria;
import DAO.DAOEmpleado;
import DAO.DAOMarca;
import DAO.DAOProducto;
import DAO.DAOVenta;
import Modelo.Categorias;
import Modelo.Empleados;

import java.io.IOException;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class LoginControlador extends HttpServlet {

    DAOEmpleado edao = new DAOEmpleado();
    Empleados e = new Empleados();
    String user;
    String pass;
    DAOCategoria daocat = new DAOCategoria();
    DAOMarca daomar = new DAOMarca();
    DAOProducto daoProd = new DAOProducto();
    DAOVenta daoVenta = new DAOVenta();

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            String accion = request.getParameter("accion");
            HttpSession sesion = request.getSession();
            request.setAttribute("categoria", daocat.contarCategorias());
            request.setAttribute("marcas", daomar.contarMarcas());
            request.setAttribute("producto", daoProd.contarProductos());
            request.setAttribute("venta", daoVenta.contarTotalDeVentas());

            switch (accion) {
                case "Iniciar Sesion":
                    try {
                        user = request.getParameter("txtNombre");
                        pass = request.getParameter("txtClave");
                        e.setNombreUsuario(user);
                        e.setClave(pass);
                        e = edao.identificar(e);

                        if (e.getNombreUsuario() != null && e.getCargo().getDescripcion().equals("VENDEDOR")) {
                            sesion.setAttribute("vendedor", e);
                            request.getRequestDispatcher("formsVendedor.jsp").forward(request, response);

                        } else if (e.getNombreUsuario() != null) {
                            sesion.setAttribute("empleado", e);
                            request.getRequestDispatcher("Principal.jsp").forward(request, response);
                        } else if (e.getNombreUsuario() != null && e.getCargo().getDescripcion().equals("VENDEDOR")) {
                            sesion.setAttribute("gerente", e);
                            request.getRequestDispatcher("formsGerente.jsp").forward(request, response);
                        } else {
                            request.setAttribute("msje", "Credenciales no válidas");
                            sesion.invalidate();
                            request.getRequestDispatcher("admin.jsp").forward(request, response);
                        }
//                    if (e.getNombreUsuario() != null && e.isVigencia() == true) {
//                        sesion.setAttribute("empleado", e);
//
//                        request.getRequestDispatcher("Principal.jsp").forward(request, response);
//
//                    } else {
//                        request.setAttribute("msje", "Usuario Inactivo");
//                        sesion.invalidate();
//                        request.getRequestDispatcher("admin.jsp").forward(request, response);
//                    }

                    } catch (Exception e) {
                        System.err.println("" + e);
                    }
                    break;
                case "Salir":
                    sesion.invalidate();
                    request.getRequestDispatcher("admin.jsp").forward(request, response);
                    break;
                default:
                    request.getRequestDispatcher("admin.jsp").forward(request, response);
                    throw new AssertionError();
            }
        } catch (Exception ex) {
            Logger.getLogger(LoginControlador.class.getName()).log(Level.SEVERE, null, ex);
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

 
}
