package Controlador;

import DAO.DAOGlobal;
import Modelo.Global;
import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "SrvGlobal", urlPatterns = {"/global"})
public class SrvGlobal extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String accion = "";
        if (request.getParameter("accion") != null) {
            accion = request.getParameter("accion");

            switch (accion) {
                case "listar":
                    this.listarEmpresa(request, response);
                    break;
                case "nu":
                    request.setAttribute("accion", "registrar");
                    this.presentarFormulario(request, response);
                case "pr":
                    this.presentarDatos(request, response);
                    break;
                case "ac":
                    this.actualizarEmpresa(request, response);
                    break;
            }
        } else {
            request.setAttribute(
                    "msje", "No se indicó la operación a realizar");
            this.getServletConfig().getServletContext().getRequestDispatcher("/WEB-INF/vistas/error.jsp"
            ).forward(request, response);
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

    private void listarEmpresa(HttpServletRequest request, HttpServletResponse response) {
        DAOGlobal dao = new DAOGlobal();
        List<Global> global = null;

        try {
            global = dao.listar();
            request.setAttribute("global", global);
        } catch (Exception e) {
            request.setAttribute("msje", "No se pudo listar la empresa");
        } finally {
            dao = null;
        }
        try {
            this.getServletConfig().getServletContext().getRequestDispatcher("/vistas/global.jsp"
            ).forward(request, response);
        } catch (Exception e) {
            request.setAttribute("msje", "No se pudo realizar la operacion");
        }
    }

    private void presentarFormulario(HttpServletRequest request, HttpServletResponse response) {
        try {
            this.getServletConfig().getServletContext().
                    getRequestDispatcher("/vistas/modificarempresa.jsp").forward(request, response);
        } catch (Exception e) {
            request.setAttribute("msje", "No se pudo realizar la operacion");
        }
    }

    private void presentarDatos(HttpServletRequest request, HttpServletResponse response) {
        DAOGlobal dao;
        Global cat;

        if (request.getParameter("cod") != null) {
            cat = new Global();
            cat.setCodigo(Integer.parseInt(request.getParameter("cod")));

            dao = new DAOGlobal();
            try {
                cat = dao.leer(cat);
                if (cat != null) {
                    request.setAttribute("global", cat);
                } else {
                    request.setAttribute("msje", "No se encontró la empresa");
                }
            } catch (Exception e) {
                request.setAttribute("msje", "No se pudo acceder a la base de datos");
            }
        } else {
            request.setAttribute("msje", "No se tiene el parámetro necesario");
        }
        request.setAttribute("accion", "ac");

        this.presentarFormulario(request, response);
    }

    private void actualizarEmpresa(HttpServletRequest request, HttpServletResponse response) {
        DAOGlobal dao;
        Global glob;

        if (request.getParameter("hCodigo") != null
                && request.getParameter("txtEmpresa") != null 
                && request.getParameter("txtNombre_Impuesto") != null 
                && request.getParameter("txtPorcentaje_Impuesto") != null) {
            glob = new Global();
            glob.setCodigo(Integer.parseInt(request.getParameter("hCodigo")));
            glob.setNombre_empresa(request.getParameter("txtEmpresa"));
            glob.setNombre_impuesto(request.getParameter("txtNombre_Impuesto"));
            glob.setPorcentaje_impuesto(Double.parseDouble(request.getParameter("txtPorcentaje_Impuesto")));
            
            dao = new DAOGlobal();
            try {
                dao.actualizar(glob);
                response.sendRedirect("global?accion=listar");
            } catch (Exception e) {
                request.setAttribute("msje",
                        "No se pudo actualizar la empresa" + e.getMessage());
                request.setAttribute("global", glob);
                request.setAttribute("accion", "ac");
                this.presentarFormulario(request, response);
            } finally {
            }
        }
    } 
}
