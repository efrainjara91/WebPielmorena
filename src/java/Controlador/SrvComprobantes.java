package Controlador;

import DAO.DAOComprobantes;
import DAO.DAOtipoDocumentos;
import Modelo.Comprobantes;
import Modelo.DocumentoIdentidad;
import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "SrvComprobantes", urlPatterns = {"/comprobantes"})
public class SrvComprobantes extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int idComprobante=0;
        String accion = "";
        if (request.getParameter("accion") != null) {
            accion = request.getParameter("accion");

            switch (accion) {
                case "listar":
                    this.listarComprobantes(request, response);
                    break;
                case "nu":
                    request.setAttribute("accion", "registrar");
                    this.presentarFormulario(request, response);
                    break;
                case "registrar":
                    this.registrarComprobante(request, response);
                    break;
                case "pr":
                    this.presentarComprobante(request, response);
                    break;
                case "ac":
                    this.actualizarComprobante(request, response);
                case "eliminar":
                    this.eliminarComprobante(request, response);
                    break;
                    
                    case "nuevoDoc":
                    request.setAttribute("accion", "reDoc");
                    this.presentarFormularioDocumentos(request, response);
                    break;
                case "reDoc":
                    this.registrarDocumentos(request, response);
                    break;
                case "prDoc":
                    this.presentarDocumentos(request, response);
                    break;
                case "acDoc":
                    this.actualizarDocumentos(request, response);
                case "eliminarDoc":
                   this.eliminarDocumentos(request, response);
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

    private void listarComprobantes(HttpServletRequest request, HttpServletResponse response) {
        DAOComprobantes dao = new DAOComprobantes();
        List<Comprobantes> comprobantes = null;
        this.cargarDocumentos(request);
        try {
            comprobantes = dao.listar();
            request.setAttribute("comprobantes", comprobantes);
        } catch (Exception e) {
            request.setAttribute("msje", "No se pudo listar los comprobantes");
        } finally {
            dao = null;
        }
        try {
            this.getServletConfig().getServletContext().getRequestDispatcher("/vistas/comprobantes.jsp"
            ).forward(request, response);
        } catch (Exception e) {
            request.setAttribute("msje", "No se pudo realizar la operacion");
        }
    }

    private void presentarFormulario(HttpServletRequest request, HttpServletResponse response) {
        try {
            this.getServletConfig().getServletContext().
                    getRequestDispatcher("/vistas/nuevocomprobante.jsp").forward(request, response);
        } catch (Exception e) {
            request.setAttribute("msje", "No se pudo realizar la operacion");
        }
    }

    private void registrarComprobante(HttpServletRequest request, HttpServletResponse response) {
        DAOComprobantes dao;
        Comprobantes compr = null;

        if (request.getParameter("txtNombre") != null) {
            compr = new Comprobantes();
            compr.setNombre(request.getParameter("txtNombre"));

            dao = new DAOComprobantes();
            try {
                dao.registrar(compr);
                response.sendRedirect("comprobantes?accion=listar");
            } catch (Exception e) {
                request.setAttribute("msje", "No se pudo registrar el comprobante");
                request.setAttribute("comprobantes", compr);
                request.setAttribute("accion", "registrar");
                this.presentarFormulario(request, response);
            } finally {
            }
        }
    }

    private void presentarComprobante(HttpServletRequest request, HttpServletResponse response) {
        DAOComprobantes dao;
        Comprobantes compr;

        if (request.getParameter("cod") != null) {
            compr = new Comprobantes();
            compr.setCodigo(Integer.parseInt(request.getParameter("cod")));

            dao = new DAOComprobantes();
            try {
                compr = dao.leer(compr);
                if (compr != null) {
                    request.setAttribute("comprobantes", compr);
                } else {
                    request.setAttribute("msje", "No se encontró el comprobante");
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

    private void actualizarComprobante(HttpServletRequest request, HttpServletResponse response) {
        DAOComprobantes dao;
        Comprobantes comprobantes;

        if (request.getParameter("hCodigo") != null
                && request.getParameter("txtNombre") != null) {
            comprobantes = new Comprobantes();
            comprobantes.setCodigo(Integer.parseInt(request.getParameter("hCodigo")));
            comprobantes.setNombre(request.getParameter("txtNombre"));

            dao = new DAOComprobantes();
            try {
                dao.actualizar(comprobantes);
                response.sendRedirect("comprobantes?accion=listar");
            } catch (Exception e) {
                request.setAttribute("msje",
                        "No se pudo actualizar el comprobante");
                request.setAttribute("comprobantes", comprobantes);
                request.setAttribute("accion", "ac");
                this.presentarFormulario(request, response);
            } finally {
            }
        }
    }

    private void eliminarComprobante(HttpServletRequest request, HttpServletResponse response) {
        String id = request.getParameter("cod");
        DAOComprobantes dao;
        dao = new DAOComprobantes();
        try {
            dao.eliminar(id);
            response.sendRedirect("comprobantes?accion=listar");

        } catch (Exception e) {
            request.setAttribute("msje",
                    "No se pudo eliminar el comprobante");
        }
    }

    private void cargarDocumentos(HttpServletRequest request) {
        DAOtipoDocumentos dao = new DAOtipoDocumentos();
        List<DocumentoIdentidad> doc = null;

        try {
            doc = dao.listar();
            request.setAttribute("documento", doc);
        } catch (Exception e) {
            request.setAttribute("msje", "No se puede cargar los documentos");
        } finally {
            doc = null;
            dao = null;
        }   
    }

    private void presentarFormularioDocumentos(HttpServletRequest request, HttpServletResponse response) {
       try {
            this.getServletConfig().getServletContext().
                    getRequestDispatcher("/vistas/nuevodocumento.jsp").forward(request, response);
        } catch (Exception e) {
            request.setAttribute("msje", "No se pudo realizar la operacion");
        }  
    }

    private void registrarDocumentos(HttpServletRequest request, HttpServletResponse response) {
        DAOtipoDocumentos dao;
        DocumentoIdentidad doc = null;

        if (request.getParameter("txtNombre") != null) {
            doc = new DocumentoIdentidad();
            doc.setNombre(request.getParameter("txtNombre"));

            dao = new DAOtipoDocumentos();
            try {
                dao.registrar(doc);
                response.sendRedirect("comprobantes?accion=listar");
            } catch (Exception e) {
                request.setAttribute("msje", "No se pudo registrar el documento");
                request.setAttribute("documento", doc);
                request.setAttribute("accion", "reDoc");
                this.presentarFormulario(request, response);
            } finally {
            }
        }
    }

    private void presentarDocumentos(HttpServletRequest request, HttpServletResponse response) {
        DAOtipoDocumentos dao;
        DocumentoIdentidad doc;

        if (request.getParameter("cod") != null) {
            doc = new DocumentoIdentidad();
            doc.setCodigo(Integer.parseInt(request.getParameter("cod")));

            dao = new DAOtipoDocumentos();
            try {
                doc = dao.leer(doc);
                if (doc != null) {
                    request.setAttribute("comprobantes", doc);
                } else {
                    request.setAttribute("msje", "No se encontró el documento");
                }
            } catch (Exception e) {
                request.setAttribute("msje", "No se pudo acceder a la base de datos");
            }
        } else {
            request.setAttribute("msje", "No se tiene el parámetro necesario");
        }
        request.setAttribute("accion", "acDoc");
        this.presentarFormulario(request, response); }

    private void actualizarDocumentos(HttpServletRequest request, HttpServletResponse response) {
          DAOtipoDocumentos dao;
        DocumentoIdentidad doc;

        if (request.getParameter("hCodigo") != null
                && request.getParameter("txtNombre") != null) {
            doc = new DocumentoIdentidad();
            doc.setCodigo(Integer.parseInt(request.getParameter("hCodigo")));
            doc.setNombre(request.getParameter("txtNombre"));

            dao = new DAOtipoDocumentos();
            try {
                dao.actualizar(doc);
                response.sendRedirect("comprobantes?accion=listar");
            } catch (Exception e) {
                request.setAttribute("msje",
                        "No se pudo actualizar el documento");
                request.setAttribute("comprobantes", doc);
                request.setAttribute("accion", "acDoc");
                this.presentarFormulario(request, response);
            } finally {
            }
        } 
    }

    private void eliminarDocumentos(HttpServletRequest request, HttpServletResponse response) {
          String id = request.getParameter("cod");
        DAOtipoDocumentos dao;
        dao = new DAOtipoDocumentos();
        try {
            dao.eliminar(id);
            response.sendRedirect("comprobantes?accion=listar");

        } catch (Exception e) {
            request.setAttribute("msje",
                    "No se pudo eliminar el documento");
        }  }

}
