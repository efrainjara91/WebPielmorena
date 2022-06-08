package Controlador;

import DAO.DAOCargo;
import DAO.DAOEmpleado;
import DAO.DAOtipoDocumentos;
import Modelo.Cargos;
import Modelo.DocumentoIdentidad;
import Modelo.Empleados;
import bean.DAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet(name = "SrvEmpleado", urlPatterns = {"/Empleado"})
public class SrvEmpleado extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String accion = "";

        if (request.getParameter("accion") != null) {
            accion = request.getParameter("accion");
            switch (accion) {
                case "listar":
                    this.listarEmpleados(request, response);
                    break;
                case "nu":
                    request.setAttribute("accion", "registrar");
                    this.presentarFormulario(request, response);
                    break;
                case "registrar":
                    this.registrarEmpleado(request, response);
                    break;
                case "pr":
                    this.presentarEmpleado(request, response);
                    break;
                case "ac":
                    this.actualizarEmpleado(request, response);
                    break;
                case "id":
                    this.presentarLogin(request, response);
                    break;
                case "ve":
                    this.verificarIdentidad(request, response);
                    break;
                case "ce":
                    this.cerrarSesion(request, response);
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
//       String uid = request.getParameter("uid");
//		String pass = request.getParameter("pass");
//		PrintWriter out = response.getWriter();
//		
//		if(uid.equals(pass)){
//			
//			out.println("<script src='https://cdnjs.cloudflare.com/ajax/libs/limonte-sweetalert2/6.11.4/sweetalert2.all.js'></script>");
//			out.println("<script src='https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js'></script>");
//			out.println("<script>");
//			out.println("$(document).ready(function(){");
//			out.println("swal ( 'WELCOME' ,  'successfull !' ,  'success' );");
//			out.println("});");
//			out.println("</script>");
//			
//			RequestDispatcher rd = request.getRequestDispatcher("home.jsp");
//			rd.include(request, response);
//		}else{
//			out.println("<script src='/Sweet_JS/sweetalert2.js'></script>");
//			out.println("<script src='https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js'></script>");
//			out.println("<script>");
//			out.println("$(document).ready(function(){");
//			out.println("swal ( 'incorrect id or password !' ,  ' ' ,  'error' );");
//			out.println("});");
//			out.println("</script>");
//			RequestDispatcher rd = request.getRequestDispatcher("index.jsp");
//			rd.include(request, response);
//		}
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

    private void listarEmpleados(HttpServletRequest request, HttpServletResponse response) {
        DAOEmpleado dao = new DAOEmpleado();
        List<Empleados> empleado = null;

        try {
            empleado = dao.listar();
            request.setAttribute("lisEmpleado", empleado);
        } catch (Exception e) {
            request.setAttribute("msje", "No se pudo listar los empleados");
        } finally {
            dao = null;
        }
        try {
            this.getServletConfig().getServletContext().getRequestDispatcher("/vistas/Empleado.jsp"
            ).forward(request, response);
        } catch (Exception e) {
            request.setAttribute("msje", "No se pudo realizar la operacion");
        }
    }

    private void presentarFormulario(HttpServletRequest request, HttpServletResponse response) {
        try {
            this.cargarTipodocumento(request);
            this.cargarCargos(request);
            this.getServletConfig().getServletContext().
                    getRequestDispatcher("/vistas/nuevoempleado.jsp").forward(request, response);
        } catch (Exception e) {
            request.setAttribute("msje", "No se pudo realizar la operacion");
        }
    }

    private void cargarTipodocumento(HttpServletRequest request) {
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

    private void cargarCargos(HttpServletRequest request) {
        DAOCargo dao = new DAOCargo();
        List<Cargos> cargo = null;

        try {
            cargo = dao.listar();
            request.setAttribute("cargos", cargo);
        } catch (Exception e) {
            request.setAttribute("msje", "No se puede cargar los cargos");
        } finally {
            cargo = null;
            dao = null;
        }
    }

    private void registrarEmpleado(HttpServletRequest request, HttpServletResponse response) {
        HttpSession errormsje = request.getSession(true);
        String usuario = request.getParameter("txtUsuario");

        DAOEmpleado dao;
        Empleados empl = null;
        DocumentoIdentidad doc;
        Cargos car;

        if (request.getParameter("cboTipoDocumento") != null
                && request.getParameter("cboCargo") != null
                && request.getParameter("txtNombre") != null
                && request.getParameter("txtApellidos") != null
                && request.getParameter("txtDocumento") != null
                && request.getParameter("txtDireccion") != null
                && request.getParameter("txtUsuario") != null
                && request.getParameter("txtCelular") != null) {

            empl = new Empleados();
            empl.setNombre(request.getParameter("txtNombre"));
            empl.setApellidos(request.getParameter("txtApellidos"));
            empl.setNumDocumento(request.getParameter("txtDocumento"));
            empl.setDireccion(request.getParameter("txtDireccion"));
            empl.setCelular(request.getParameter("txtCelular"));
            empl.setNombreUsuario(request.getParameter("txtUsuario"));
            empl.setClave(request.getParameter("txtDocumento"));

            doc = new DocumentoIdentidad();
            doc.setCodigo(Integer.parseInt(request.getParameter("cboTipoDocumento")));
            empl.setDocumentoIdentidad(doc);

            car = new Cargos();
            car.setCodigo(Integer.parseInt(request.getParameter("cboCargo")));
            empl.setCargo(car);

            if (request.getParameter("chkVigencia") != null) {
                empl.setVigencia(true);
            } else {
                empl.setVigencia(false);
            }
            dao = new DAOEmpleado();
            try {
                DAO d = new DAO();
                d.conectar();
                if (d.isAccountRegistered(usuario)) {
                    errormsje.setAttribute("errormsje", "nombre de usuario en uso, por favor ingrese otro nombre de usuario");
                    response.sendRedirect("Empleado?accion=nu");

                } else {
                    //Legado a este punto significa que todo esta correcto, por lo tanto ingreso a la DB
                    dao.registrar(empl);
                    response.sendRedirect("Empleado?accion=listar");
                    errormsje.setAttribute("errormsje", null);

                }
                d.desconectar();
                // dao.registrar(empl);
                // response.sendRedirect("Empleado?accion=listar");
            } catch (Exception e) {
                request.setAttribute("msje",
                        "No se pudo registrar el empleado" + e.getMessage());
                request.setAttribute("regEmpleado", empl);
                request.setAttribute("accion", "registrar");
                this.presentarFormulario(request, response);
            } finally {
            }
        }
    }

    private void presentarEmpleado(HttpServletRequest request, HttpServletResponse response) {
        DAOEmpleado dao;
        Empleados empl;

        if (request.getParameter("cod") != null) {
            empl = new Empleados();
            empl.setId_Empleados(Integer.parseInt(request.getParameter("cod")));

            dao = new DAOEmpleado();
            try {
                empl = dao.leer(empl);
                if (empl != null) {
                    request.setAttribute("regEmpleado", empl);
                } else {
                    request.setAttribute("msje", "No se encontró el empleado");
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

    private void actualizarEmpleado(HttpServletRequest request, HttpServletResponse response) {
        DAOEmpleado dao;
        Empleados empl = null;
        DocumentoIdentidad doc;
        Cargos car;
        if (request.getParameter("hCodigo") != null
                && request.getParameter("cboTipoDocumento") != null
                && request.getParameter("cboCargo") != null
                && request.getParameter("txtNombre") != null
                && request.getParameter("txtApellidos") != null
                && request.getParameter("txtDocumento") != null
                && request.getParameter("txtDireccion") != null
                && request.getParameter("txtUsuario") != null
                && request.getParameter("txtClave") != null
                && request.getParameter("txtCelular") != null) {

            empl = new Empleados();
            empl.setId_Empleados(Integer.parseInt(request.getParameter("hCodigo")));
            empl.setNombre(request.getParameter("txtNombre"));
            empl.setApellidos(request.getParameter("txtApellidos"));
            empl.setNumDocumento(request.getParameter("txtDocumento"));
            empl.setDireccion(request.getParameter("txtDireccion"));

            empl.setNombreUsuario(request.getParameter("txtUsuario"));
            empl.setClave(request.getParameter("txtClave"));
            empl.setCelular(request.getParameter("txtCelular"));

            doc = new DocumentoIdentidad();
            doc.setCodigo(Integer.parseInt(request.getParameter("cboTipoDocumento")));
            empl.setDocumentoIdentidad(doc);

            car = new Cargos();
            car.setCodigo(Integer.parseInt(request.getParameter("cboCargo")));
            empl.setCargo(car);

            if (request.getParameter("chkVigencia") != null) {
                empl.setVigencia(true);
            } else {
                empl.setVigencia(false);
            }
            dao = new DAOEmpleado();
            try {
                dao.actualizar(empl);
                response.sendRedirect("Empleado?accion=listar");
            } catch (Exception e) {
                request.setAttribute("msje",
                        "No se pudo actualizar el empleado" + e.getMessage());
                request.setAttribute("regEmpleado", empl);
                request.setAttribute("accion", "ac");
                this.presentarFormulario(request, response);
            } finally {
            }
        }
    }

    private void presentarLogin(HttpServletRequest request, HttpServletResponse response) {
        try {
            this.getServletConfig().getServletContext().
                    getRequestDispatcher("/WEB-INF/vistas/admin/identificar.jsp"
                    ).forward(request, response);
        } catch (Exception e) {
            try {
                response.sendRedirect("error.jsp");
            } catch (Exception ex) {
            }
        }
    }

    private void verificarIdentidad(HttpServletRequest request, HttpServletResponse response) {
        DAOEmpleado dao;
        Empleados empl;

        if (request.getParameter("txtNombre") != null
                && request.getParameter("txtClave") != null) {

            empl = new Empleados();
            empl.setNombreUsuario(request.getParameter("txtNombre"));
            empl.setClave(request.getParameter("txtClave"));

            dao = new DAOEmpleado();
            try {
                empl = dao.identificar(empl);
                if (empl != null) {
                    request.getSession().setAttribute("empleado", empl);

                    this.getServletConfig().getServletContext().
                            getRequestDispatcher("/inicio.jsp"
                            ).forward(request, response);
                } else {
                    request.setAttribute("msje", "Credenciales no válidas");
                    this.getServletConfig().getServletContext().
                            getRequestDispatcher("/login.jsp"
                            ).forward(request, response);
                }
            } catch (Exception e) {
                request.setAttribute("empleado", empl);
                request.setAttribute("msje", "No se pudo realizar la verificación" + e.getMessage());
                try {
                    this.getServletConfig().getServletContext().
                            getRequestDispatcher("/login.jsp"
                            ).forward(request, response);
                } catch (Exception ex) {
                }
            }

        }
    }

    private void cambiarVigencia(HttpServletRequest request, HttpServletResponse response) {
        DAOEmpleado dao;
        Empleados empl;
        try {
            dao = new DAOEmpleado();
            empl = new Empleados();

            if (request.getParameter("cambiar").equals("act")) {
                empl.setVigencia(false);
            } else {
                empl.setVigencia(true);
            }

            if (request.getParameter("cod") != null) {
                empl.setId_Empleados(Integer.parseInt(request.getParameter("cod")));
                dao.cambiarVigencia(empl);
            }

        } catch (Exception e) {
            request.setAttribute("msj", e.getMessage());
        }
        this.listarEmpleados(request, response);
    }

    private void cerrarSesion(HttpServletRequest request, HttpServletResponse response) {
        request.getSession().setAttribute("empleado", null);
        request.getSession().removeAttribute("empleado");
        request.getSession().invalidate();
        try {
            request.getRequestDispatcher("admin.jsp").forward(request, response);

        } catch (Exception e) {
        }
    }

}
