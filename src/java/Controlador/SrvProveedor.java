package Controlador;

import DAO.DAOProveedor;
import Modelo.Proveedor;
import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "SrvProveedor", urlPatterns = {"/proveedor"})
public class SrvProveedor extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String accion = "";
        if (request.getParameter("accion") != null) {
            accion = request.getParameter("accion");
            switch (accion) {
                case "listar":
                    this.listarProveedores(request, response);
                    break;
                case "nu":
                    request.setAttribute("accion", "re");
                    this.presentarFormulario(request, response);
                    break;
                case "re":
                    this.registrarProveedor(request, response);
                    break;
                case "pr":
                    this.presentarProveedor(request, response);
                    break;
                case "ac":
                    this.actualizarProveedor(request, response);
                    break;
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

    private void listarProveedores(HttpServletRequest request, HttpServletResponse response) {
        DAOProveedor dao = new DAOProveedor();
        List<Proveedor> prov = null;
        try {
            prov = dao.listar();
            request.setAttribute("proveedor", prov);
        } catch (Exception e) {
            request.setAttribute("msje", "No se pudo listar los proveedores" + e.getMessage());
        } finally {
            dao = null;
        }
        try {
            this.getServletConfig().getServletContext().getRequestDispatcher("/vistas/proveedor.jsp").forward(request, response);
        } catch (Exception e) {
            request.setAttribute("msje", "No se pudo realizar la operacion");
        }
    }

    private void presentarFormulario(HttpServletRequest request, HttpServletResponse response) {
        try {
            this.getServletConfig().getServletContext().
                    getRequestDispatcher("/vistas/nuevoproveedor.jsp"
                    ).forward(request, response);
        } catch (Exception e) {
            request.setAttribute("msje", "No se pudo realizar la operacion");
        }
    }

    private void registrarProveedor(HttpServletRequest request, HttpServletResponse response) {
        DAOProveedor dao;
        Proveedor prov = null;
        prov = new Proveedor();
        prov.setNombre(request.getParameter("txtNombre"));
        prov.setNombreRepresentante(request.getParameter("txtRepresentante"));
        prov.setCargo(request.getParameter("txtCargo"));
        prov.setTipoProveedor(request.getParameter("txtTipoProveedor"));
        prov.setRUC(request.getParameter("txtRUC"));
        prov.setTelefono(request.getParameter("txtCelular"));
        prov.setDireccion(request.getParameter("txtDireccion"));

        if (request.getParameter("chkVigencia") != null) {
            prov.setEstado(true);
        } else {
            prov.setEstado(false);
        }
        dao = new DAOProveedor();
        try {
            dao.registrar(prov);
            response.sendRedirect("proveedor?accion=listar");
        } catch (Exception e) {
            request.setAttribute("msje",
                    "No se pudo registrar el proveedor" + e.getMessage());
            request.setAttribute("proveedor", prov);
            request.setAttribute("accion", "re");
            this.presentarFormulario(request, response);
        } finally {
        }

    }

    private void presentarProveedor(HttpServletRequest request, HttpServletResponse response) {
        DAOProveedor dao;
        Proveedor prov;

        if (request.getParameter("cod") != null) {
            prov = new Proveedor();
            prov.setIdProveedor(Integer.parseInt(request.getParameter("cod")));

            dao = new DAOProveedor();
            try {
                prov = dao.leer(prov);
                if (prov != null) {
                    request.setAttribute("proveedor", prov);
                } else {
                    request.setAttribute("msje", "No se encontró el proveedor");
                }
            } catch (Exception e) {
                request.setAttribute("msje", "No se pudo acceder a la base de datos" + e.getMessage());
            }
        } else {
            request.setAttribute("msje", "No se tiene el parámetro necesario");
        }
        request.setAttribute("accion", "ac");
        this.presentarFormulario(request, response);
    }

    private void actualizarProveedor(HttpServletRequest request, HttpServletResponse response) {
        DAOProveedor dao;
        Proveedor prov = null;

        if (request.getParameter("hCodigo") != null
                && request.getParameter("txtNombre") != null
                && request.getParameter("txtRUC") != null
                && request.getParameter("txtCelular") != null) {

            prov = new Proveedor();
            prov.setIdProveedor(Integer.parseInt(request.getParameter("hCodigo")));
            prov.setNombre(request.getParameter("txtNombre"));
            prov.setNombreRepresentante(request.getParameter("txtRepresentante"));
            prov.setCargo(request.getParameter("txtCargo"));
            prov.setTipoProveedor(request.getParameter("txtTipoProveedor"));
            prov.setRUC(request.getParameter("txtRUC"));
            prov.setTelefono(request.getParameter("txtCelular"));
            prov.setDireccion(request.getParameter("txtDireccion"));

            if (request.getParameter("chkVigencia") != null) {
                prov.setEstado(true);
            } else {
                prov.setEstado(false);
            }
            dao = new DAOProveedor();
            try {
                dao.actualizar(prov);
                response.sendRedirect("proveedor?accion=listar");
            } catch (Exception e) {
                request.setAttribute("msje",
                        "No se pudo actualizar el proveedor" + e.getMessage());
                request.setAttribute("proveedor", prov);
                request.setAttribute("accion", "ac");
                this.presentarFormulario(request, response);
            } finally {
            }
        }
    }

    private void cambiarVigencia(HttpServletRequest request, HttpServletResponse response) {
        DAOProveedor dao;
        Proveedor prov;
        try {
            dao = new DAOProveedor();
            prov = new Proveedor();

            if (request.getParameter("cambiar").equals("act")) {
                prov.setEstado(false);
            } else {
                prov.setEstado(true);
            }

            if (request.getParameter("cod") != null) {
                prov.setIdProveedor(Integer.parseInt(request.getParameter("cod")));
                dao.cambiarVigencia(prov);
            }
        } catch (Exception e) {
            request.setAttribute("msj", e.getMessage());
        }
        this.listarProveedores(request, response);
    }

}
