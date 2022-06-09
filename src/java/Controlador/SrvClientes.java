package Controlador;

import DAO.DAOCategoria;
import DAO.DAOCliente;
import DAO.DAOtipoDocumentos;
import Modelo.Categorias;
import Modelo.Clientes;
import Modelo.DocumentoIdentidad;
import bean.DAO;
import java.io.IOException;

import java.util.Calendar;
import java.util.GregorianCalendar;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet(name = "SrvClientes", urlPatterns = {"/clientes"})
public class SrvClientes extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String accion = "";
        if (request.getParameter("accion") != null) {
            accion = request.getParameter("accion");

            switch (accion) {
                case "listar":
                    this.listarClientes(request, response);
                    break;
                case "nu":
                    request.setAttribute("accion", "registrar");
                    this.presentarFormulario(request, response);
                    break;
                case "registrar":
                    this.registrarCliente(request, response);
                    break;
                case "pr":
                    this.presentarCliente(request, response);
                    break;
                case "ac":
                    this.actualizarCliente(request, response);
                    break;
                case "nuevo":
                    request.setAttribute("accion", "re");
                    this.presentarFormularioWeb(request, response);
                case "re":
                    this.registrarClienteWeb(request, response);
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

    private void listarClientes(HttpServletRequest request, HttpServletResponse response) {
        DAOCliente dao = new DAOCliente();
        List<Clientes> cliente = null;

        try {
            cliente = dao.listar();
            request.setAttribute("cliente", cliente);
        } catch (Exception e) {
            request.setAttribute("msje", "No se pudo listar los clientes");
        } finally {
            dao = null;
        }
        try {
            this.getServletConfig().getServletContext().getRequestDispatcher("/vistas/clientes.jsp"
            ).forward(request, response);
        } catch (Exception e) {
            request.setAttribute("msje", "No se pudo realizar la operacion");
        }
    }

    private void presentarFormulario(HttpServletRequest request, HttpServletResponse response) {
        try {
            this.cargarTipodocumento(request);
            this.getServletConfig().getServletContext().
                    getRequestDispatcher("/vistas/nuevocliente.jsp"
                    ).forward(request, response);
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

    private void registrarCliente(HttpServletRequest request, HttpServletResponse response) {
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
            cli.setClave(request.getParameter("txtClave"));
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
                request.getRequestDispatcher("clientes?accion=listar").forward(request, response);
            } catch (Exception e) {
                request.setAttribute("msje", "No se pudo registrar el cliente" + e.getMessage());
                request.setAttribute("cliente", cli);
                request.setAttribute("accion", "registrar");
            } finally {
            }
        }
    }

    private void presentarCliente(HttpServletRequest request, HttpServletResponse response) {
        DAOCliente dao;
        Clientes cli;

        if (request.getParameter("cod") != null) {
            cli = new Clientes();
            cli.setIdCliente(Integer.parseInt(request.getParameter("cod")));

            dao = new DAOCliente();
            try {
                cli = dao.leer(cli);
                if (cli != null) {
                    request.setAttribute("cliente", cli);
                } else {
                    request.setAttribute("msje", "No se encontró el cliente");
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

    private void actualizarCliente(HttpServletRequest request, HttpServletResponse response) {
        DAOCliente dao;
        Clientes cli = null;
        DocumentoIdentidad doc;

        if (request.getParameter("hCodigo") != null
                && request.getParameter("cboTipoDocumento") != null
                && request.getParameter("cboGenero") != null
                && request.getParameter("txtNombre") != null
                && request.getParameter("txtApellidoP") != null
                && request.getParameter("txtApellidoM") != null
                && request.getParameter("txtDocumento") != null
                && request.getParameter("txtCorreo") != null
                && request.getParameter("txtClave") != null
                && request.getParameter("txtFechaNac") != null
                && request.getParameter("txtFechaNac") != null
                && request.getParameter("txtDireccion") != null) {

            cli = new Clientes();
            cli.setIdCliente(Integer.parseInt(request.getParameter("hCodigo")));
            cli.setNombres(request.getParameter("txtNombre"));
            cli.setApellido_paterno(request.getParameter("txtApellidoP"));
            cli.setApellido_materno(request.getParameter("txtApellidoM"));
            cli.setNumIdentificación(request.getParameter("txtDocumento"));
            cli.setCorreo_electrónico(request.getParameter("txtCorreo"));
            cli.setClave(request.getParameter("txtClave"));
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
                dao.actualizar(cli);
                response.sendRedirect("clientes?accion=listar");
            } catch (Exception e) {
                request.setAttribute("msje",
                        "No se pudo actualizar el cliente" + e.getMessage());
                request.setAttribute("clientes", cli);
                request.setAttribute("accion", "ac");
                this.presentarFormulario(request, response);
            } finally {
            }
        }
    }

    private void cambiarVigencia(HttpServletRequest request, HttpServletResponse response) {
        DAOCliente dao;
        Clientes cli;
        try {
            dao = new DAOCliente();
            cli = new Clientes();

            if (request.getParameter("cambiar").equals("act")) {
                cli.setEstado(false);
            } else {
                cli.setEstado(true);
            }

            if (request.getParameter("cod") != null) {
                cli.setIdCliente(Integer.parseInt(request.getParameter("cod")));
                dao.cambiarVigencia(cli);
            }

        } catch (Exception e) {
            request.setAttribute("msj", e.getMessage());
        }
        this.listarClientes(request, response);
    }

    private void presentarFormularioWeb(HttpServletRequest request, HttpServletResponse response) {
        try {
            this.cargarTipodocumento(request);
            this.listarCategorias(request, response);

            this.getServletConfig().getServletContext().
                    getRequestDispatcher("/Registro.jsp").forward(request, response);
        } catch (Exception e) {
            request.setAttribute("msje", "No se pudo realizar la operacion");
        }
    }

    private void registrarClienteWeb(HttpServletRequest request, HttpServletResponse response) {
        HttpSession mensajeError = request.getSession(true);
        String emailUsuario = request.getParameter("txtCorreo");

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
            cli.setClave(request.getParameter("txtClave"));
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
                DAO d = new DAO();

                d.conectar();
                if (d.isEmailRegistered(emailUsuario)) {
                    mensajeError.setAttribute("mensajeError", "Error, Esta direccion de correo ya fue registrada");
                    response.sendRedirect("clientes?accion=nuevo");
                } else {
                    //Legado a este punto significa que todo esta correcto, por lo tanto ingreso a la DB
                    dao.registrar(cli);
                    request.getRequestDispatcher("Controlador?accion=carrito").forward(request, response);
                    mensajeError.setAttribute("mensajeError", null);
                }
                d.desconectar();

                // dao.registrar(cli);
                // request.getRequestDispatcher("Controlador?accion=carrito").forward(request, response);
            } catch (Exception e) {
                request.setAttribute("msje", "No se pudo registrar el cliente" + e.getMessage());
                request.setAttribute("cliente", cli);
                request.setAttribute("accion", "re");
                this.presentarFormularioWeb(request, response);
            } finally {
            }
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
}
