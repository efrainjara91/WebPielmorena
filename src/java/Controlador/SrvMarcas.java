package Controlador;

import DAO.DAOMarca;
import Modelo.Marcas;
import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "SrvMarcas", urlPatterns = {"/Marcas"})
public class SrvMarcas extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String accion = "";

        if (request.getParameter("accion") != null) {
            accion = request.getParameter("accion");
            switch (accion) {
                case "listar":
                    this.listarMarcas(request, response);

                    break;
                case "nu":
                    request.setAttribute("accion", "registrar");
                    this.presentarFormulario(request, response);
                case "registrar":
                    this.registrarMarcas(request, response);
                    break;
                case "pr":
                    this.presentarMarcas(request, response);
                    break;
                case "ac":
                    this.actualizarMarcas(request, response);
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

    private void listarMarcas(HttpServletRequest request, HttpServletResponse response) {
        DAOMarca dao = new DAOMarca();
        List<Marcas> marcas = null;

        try {
            marcas = dao.listar();
            request.setAttribute("marca", marcas);
        } catch (Exception e) {
            request.setAttribute("msje", "No se pudo listar las categorias");
        } finally {
            dao = null;
        }
        try {
            this.getServletConfig().getServletContext().getRequestDispatcher("/vistas/Marcas.jsp"
            ).forward(request, response);
        } catch (Exception e) {
            request.setAttribute("msje", "No se pudo realizar la operacion");
        }
    }

    private void presentarFormulario(HttpServletRequest request, HttpServletResponse response) {
        try {
            this.getServletConfig().getServletContext().
                    getRequestDispatcher("/vistas/nuevamarca.jsp").forward(request, response);
        } catch (Exception e) {
            request.setAttribute("msje", "No se pudo realizar la operacion");
        }
    }

    private void registrarMarcas(HttpServletRequest request, HttpServletResponse response) {
        DAOMarca dao;
        Marcas marc = null;

        if (request.getParameter("txtMarca") != null) {
            marc = new Marcas();
            marc.setNombre(request.getParameter("txtMarca"));
            if (request.getParameter("chkVigencia") != null) {
                marc.setVigencia(true);
            } else {
                marc.setVigencia(false);
            }
            dao = new DAOMarca();
            try {
                dao.registrar(marc);
                response.sendRedirect("Marcas?accion=listar");
            } catch (Exception e) {
                request.setAttribute("msje", "No se pudo registrar la marca");
                request.setAttribute("marca", marc);
                request.setAttribute("accion", "registrar");
                this.presentarFormulario(request, response);
            } finally {
            }
        }
    }

    private void presentarMarcas(HttpServletRequest request, HttpServletResponse response) {
        DAOMarca dao;
        Marcas marcas;

        if (request.getParameter("cod") != null) {
            marcas = new Marcas();
            marcas.setId_Marca(Integer.parseInt(request.getParameter("cod")));

            dao = new DAOMarca();
            try {
                marcas = dao.leer(marcas);
                if (marcas != null) {
                    request.setAttribute("marca", marcas);
                } else {
                    request.setAttribute("msje", "No se encontró la marca");
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

    private void actualizarMarcas(HttpServletRequest request, HttpServletResponse response) {
        DAOMarca daoMarca;
        Marcas marcas;

        if (request.getParameter("hCodigo") != null
                && request.getParameter("txtMarca") != null) {
            marcas = new Marcas();
            marcas.setId_Marca(Integer.parseInt(request.getParameter("hCodigo")));
            marcas.setNombre(request.getParameter("txtMarca"));
            if (request.getParameter("chkVigencia") != null) {
                marcas.setVigencia(true);
            } else {
                marcas.setVigencia(false);
            }
            daoMarca = new DAOMarca();
            try {
                daoMarca.actualizar(marcas);
                response.sendRedirect("Marcas?accion=listar");
            } catch (Exception e) {
                request.setAttribute("msje",
                        "No se pudo actualizar la marca");
                request.setAttribute("marca", marcas);
                request.setAttribute("accion", "ac");
                this.presentarFormulario(request, response);
            } finally {
            }
        }
    }

    private void cambiarVigencia(HttpServletRequest request, HttpServletResponse response) {
        DAOMarca dao;
        Marcas mar;
        try {
            dao = new DAOMarca();
            mar = new Marcas();

            if (request.getParameter("cambiar").equals("act")) {
                mar.setVigencia(false);
            } else {
                mar.setVigencia(true);
            }

            if (request.getParameter("cod") != null) {
                mar.setId_Marca(Integer.parseInt(request.getParameter("cod")));
                dao.cambiarVigencia(mar);
            }
        } catch (Exception e) {
            request.setAttribute("msj", e.getMessage());
        }
        this.listarMarcas(request, response);
    }
}



