package Controlador;

import DAO.DAOCategoria;
import DAO.DAOMarca;
import DAO.DAOProducto;
import Modelo.Categorias;
import Modelo.Marcas;
import Modelo.Productos;
import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileItemFactory;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

@MultipartConfig
@WebServlet(name = "SrvProducto", urlPatterns = {"/productos"})
public class SrvProducto extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String accion = "";

        if (request.getParameter("accion") != null) {
            accion = request.getParameter("accion");
            switch (accion) {
                case "listar":
                    this.listarProductos(request, response);
                    request.getRequestDispatcher("/vistas/Productos.jsp").forward(request, response);
                    break;
                case "nu":
                    request.setAttribute("accion", "re");
                    this.presentarFormulario(request, response);
                    break;
                case "re":
                    this.registrarProducto(request, response);
                    break;
                case "pr":
                    this.presentarProducto(request, response);
                    break;
                case "ac":
                    this.actualizarProducto(request, response);
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

    private void listarProductos(HttpServletRequest request, HttpServletResponse response) {
        DAOProducto dao = new DAOProducto();
        List<Productos> productos = null;

        try {
            productos = dao.listar();
            request.setAttribute("productos", productos);
        } catch (Exception e) {
            request.setAttribute("msje", "No se pudo listar los productos" + e.getLocalizedMessage());
        } finally {
            dao = null;
        }

    }

    private void presentarFormulario(HttpServletRequest request, HttpServletResponse response) {
        try {
            this.cargarCategorias(request);
            this.cargarMarcas(request);
            this.getServletConfig().getServletContext().
                    getRequestDispatcher("/vistas/nuevoproducto.jsp"
                    ).forward(request, response);
        } catch (Exception e) {
            request.setAttribute("msje", "No se pudo realizar la operacion");
        }
    }

    private void cargarCategorias(HttpServletRequest request) {
        DAOCategoria dao = new DAOCategoria();
        List<Categorias> cats = null;

        try {
            cats = dao.listarVigentes();
            request.setAttribute("categorias", cats);
        } catch (Exception e) {
            request.setAttribute("msje", "No se puede cargar las categorias");
        } finally {
            cats = null;
            dao = null;
        }
    }

    private void cargarMarcas(HttpServletRequest request) {
        DAOMarca dao = new DAOMarca();
        List<Marcas> marca = null;

        try {
            marca = dao.listar();
            request.setAttribute("marcas", marca);
        } catch (Exception e) {
            request.setAttribute("msje", "No se puede cargar las marcas");
        } finally {
            marca = null;
            dao = null;
        }
    }

    private void registrarProducto(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
    
        DAOProducto daoProd;
        Productos prod = null;
        Categorias cate;
        Marcas mar;

        if (request.getParameter("cboCategoria") != null
                && request.getParameter("cboMarca") != null
                && request.getParameter("txtNombre") != null
                && request.getParameter("txtPrecioVenta") != null
                && request.getParameter("txtPrecioCompra") != null
                && request.getParameter("stock") != null
                && request.getParameter("txtDescripcion") != null) {

            prod = new Productos();
            prod.setNombre(request.getParameter("txtNombre"));
            prod.setDescripcion(request.getParameter("txtDescripcion"));

             //GUARDAR FOTO
            Part part = request.getPart("txtFoto");//Nombre de nuestro input de tipo file.
            String nombreArchivo = Paths.get(part.getSubmittedFileName()).getFileName().toString(); //Conseguir el nombre del archivo
            File file = new File("C:\\xampp\\htdocs\\imagenes\\" + nombreArchivo);
            Files.copy(part.getInputStream(), file.toPath(), StandardCopyOption.REPLACE_EXISTING);

            prod.setImagen("http://localhost:8083/imagenes/" + nombreArchivo);
            prod.setPrecio(Double.parseDouble(request.getParameter("txtPrecioVenta")));
            prod.setPreciocompra(Double.parseDouble(request.getParameter("txtPrecioCompra")));
            prod.setStock(Integer.parseInt(request.getParameter("stock")));

            cate = new Categorias();
            cate.setCodigo(Integer.parseInt(request.getParameter("cboCategoria")));
            prod.setCategoria(cate);
            mar = new Marcas();
            mar.setId_Marca(Integer.parseInt(request.getParameter("cboMarca")));
            prod.setMarca(mar);

            if (request.getParameter("chkVigencia") != null) {
                prod.setVigencia(true);
            } else {
                prod.setVigencia(false);
            }
             if (request.getParameter("chkDestacado") != null) {
                prod.setDestacado(true);
            } else {
                prod.setDestacado(false);
            }
            daoProd = new DAOProducto();
            try {
                daoProd.registrar(prod);
                response.sendRedirect("productos?accion=listar");
            } catch (Exception e) {
                request.setAttribute("msje",
                        "No se pudo registrar el producto" + e.getMessage());
                request.setAttribute("producto", prod);
                request.setAttribute("accion", "re");
                this.presentarFormulario(request, response);
            } finally {
            }
        }
    }

    private void presentarProducto(HttpServletRequest request, HttpServletResponse response) {
        DAOProducto dao;
        Productos prod;

        if (request.getParameter("cod") != null) {
            prod = new Productos();
            prod.setId_Producto(Integer.parseInt(request.getParameter("cod")));

            dao = new DAOProducto();
            try {
                prod = dao.leer(prod);
                if (prod != null) {
                    request.setAttribute("producto", prod);
                } else {
                    request.setAttribute("msje", "No se encontró el producto");
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

    private void actualizarProducto(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        DAOProducto daoProd;
        Productos prod = null;
        Categorias cate;
        Marcas mar;

        if (request.getParameter("hCodigo") != null
                && request.getParameter("cboCategoria") != null
                && request.getParameter("cboMarca") != null
                && request.getParameter("txtNombre") != null
                && request.getParameter("txtPrecioVenta") != null
                && request.getParameter("txtPrecioCompra") != null
                && request.getParameter("stock") != null
                && request.getParameter("txtDescripcion") != null) {

            prod = new Productos();
            prod.setId_Producto(Integer.parseInt(request.getParameter("hCodigo")));
            prod.setNombre(request.getParameter("txtNombre"));
            prod.setDescripcion(request.getParameter("txtDescripcion"));
            
            prod.setPrecio(Double.parseDouble(request.getParameter("txtPrecioVenta")));
            prod.setPreciocompra(Double.parseDouble(request.getParameter("txtPrecioCompra")));

            cate = new Categorias();
            cate.setCodigo(Integer.parseInt(request.getParameter("cboCategoria")));
            prod.setCategoria(cate);

            mar = new Marcas();
            mar.setId_Marca(Integer.parseInt(request.getParameter("cboMarca")));
            prod.setMarca(mar);

            if (request.getParameter("chkVigencia") != null) {
                prod.setVigencia(true);
            } else {
                prod.setVigencia(false);
            }
            
             if (request.getParameter("chkDestacado") != null) {
                prod.setDestacado(true);
            } else {
                prod.setDestacado(false);
            }
            daoProd = new DAOProducto();
            try {
                daoProd.actualizar(prod);
                response.sendRedirect("productos?accion=listar");
            } catch (Exception e) {
                request.setAttribute("msje",
                        "No se pudo actualizar el producto" + e.getMessage());
                request.setAttribute("producto", prod);
                request.setAttribute("accion", "ac");
                this.presentarFormulario(request, response);
            } finally {
            }
        }
    }
}
