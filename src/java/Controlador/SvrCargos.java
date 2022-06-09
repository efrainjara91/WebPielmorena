
package Controlador;

import DAO.DAOCargo;
import Modelo.Cargos;
import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "SvrCargos", urlPatterns = {"/cargos"})
public class SvrCargos extends HttpServlet {


    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
         String accion = "";
        if (request.getParameter("accion") != null) {
            accion = request.getParameter("accion");

            switch (accion) {
                case "listar":
                    this.listarCargos(request, response);
                    break;
                case "nu":
                    request.setAttribute("accion", "registrar");
                    this.presentarFormulario(request, response);
                case "registrar":
                    this.registrarCargo(request, response);
                    break;
                case "pr":
                   this.presentarCargo(request, response);
                    break;
                case "ac":
                   this.actualizarCargo(request, response);
            }
        } else {

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

    private void listarCargos(HttpServletRequest request, HttpServletResponse response) {
         DAOCargo dao = new DAOCargo();
        List<Cargos> cargo = null;

        try {
            cargo = dao.listar();
            request.setAttribute("cargos", cargo);
        } catch (Exception e) {
            request.setAttribute("msje", "No se pudo listar los cargos" + e.getMessage());
        } finally {
            dao = null;
        }
        try {
            this.getServletConfig().getServletContext().getRequestDispatcher("/vistas/Cargo.jsp"
            ).forward(request, response);
        } catch (Exception e) {
            request.setAttribute("msje", "No se pudo realizar la operacion");
        } }

    private void presentarFormulario(HttpServletRequest request, HttpServletResponse response) {
         try {
            this.getServletConfig().getServletContext().
                    getRequestDispatcher("/vistas/nuevocargo.jsp").forward(request, response);
        } catch (Exception e) {
            request.setAttribute("msje", "No se pudo realizar la operacion");
        }   
    }


    private void registrarCargo(HttpServletRequest request, HttpServletResponse response) {
        DAOCargo dao;
        Cargos car = null;

        if (request.getParameter("txtNombre") != null) {
            car = new Cargos();
            car.setDescripcion(request.getParameter("txtNombre"));
            if (request.getParameter("chkVigencia") != null) {
                car.setVigencia(true);
            } else {
                car.setVigencia(false);
            }
            dao = new DAOCargo();
            try {
                dao.registrar(car);
                response.sendRedirect("cargos?accion=listar");
            } catch (Exception e) {
                request.setAttribute("msje", "No se pudo registrar el cargo");
                request.setAttribute("cargos", car);
                request.setAttribute("accion", "registrar");
                this.presentarFormulario(request, response);
            } finally {
            }
        }
   }

    private void presentarCargo(HttpServletRequest request, HttpServletResponse response) {
        DAOCargo dao;
        Cargos ca;

        if (request.getParameter("cod") != null) {
            ca = new Cargos();
            ca.setCodigo(Integer.parseInt(request.getParameter("cod")));

            dao = new DAOCargo();
            try {
                ca = dao.leer(ca);
                if (ca != null) {
                    request.setAttribute("cargo", ca);
                } else {
                    request.setAttribute("msje", "No se encontró el cargo");
                }
            } catch (Exception e) {
                request.setAttribute("msje", "No se pudo acceder a la base de datos");
            }
        } else {
            request.setAttribute("msje", "No se tiene el parámetro necesario");
        }
        request.setAttribute("accion", "ac");
        this.presentarFormulario(request, response);  }

    private void actualizarCargo(HttpServletRequest request, HttpServletResponse response) {
       DAOCargo daoCat;
        Cargos ca;

        if (request.getParameter("hCodigo") != null
                && request.getParameter("txtNombre") != null) {
            ca = new Cargos();
            ca.setCodigo(Integer.parseInt(request.getParameter("hCodigo")));
            ca.setDescripcion(request.getParameter("txtNombre"));
            if (request.getParameter("chkVigencia") != null) {
                ca.setVigencia(true);
            } else {
                ca.setVigencia(false);
            }
            daoCat = new DAOCargo();
            try {
                daoCat.actualizar(ca);
                response.sendRedirect("cargos?accion=listar");
            } catch (Exception e) {
                request.setAttribute("msje",
                        "No se pudo actualizar el cargo");
                request.setAttribute("cargos", ca);
                request.setAttribute("accion", "ac");
                this.presentarFormulario(request, response);
            } finally {
            }
        }
    }   

}
