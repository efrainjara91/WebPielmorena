package Controlador;

import DAO.DAOCategoria;
import DAO.DAOProducto;
import Modelo.Categorias;
import Modelo.Productos;
import java.io.IOException;
import static java.lang.System.out;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "SrvCategoria", urlPatterns = {"/Categorias"})
public class SrvCategoria extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int idCategoria = 0;
        String accion = "";
        if (request.getParameter("accion") != null) {
            accion = request.getParameter("accion");

            switch (accion) {
                case "listar":
                    this.listarCategorias(request, response);
                    break;
                case "nu":
                    request.setAttribute("accion", "registrar");
                    this.presentarFormulario(request, response);
                case "registrar":
                    this.registrarCategorias(request, response);
                    break;
                case "pr":
                    this.presentarCategoria(request, response);
                    break;
                case "ac":
                    this.actualizarCategoria(request, response);

                case "getId":
                    this.productosxCategoria(request, response);
                    break;
                case "ver":
                    this.listadoProductos_categoria(request, response);
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

    private void listarCategorias(HttpServletRequest request, HttpServletResponse response) {
        DAOCategoria dao = new DAOCategoria();
        List<Categorias> categorias = null;

        try {
            categorias = dao.listar();
            request.setAttribute("categorias", categorias);
        } catch (Exception e) {
            request.setAttribute("msje", "No se pudo listar las categorias");
        } finally {
            dao = null;
        }
        try {
            this.getServletConfig().getServletContext().getRequestDispatcher("/vistas/Categorias.jsp"
            ).forward(request, response);
        } catch (Exception e) {
            request.setAttribute("msje", "No se pudo realizar la operacion");
        }
    }

    private void presentarFormulario(HttpServletRequest request, HttpServletResponse response) {
        try {
            this.getServletConfig().getServletContext().
                    getRequestDispatcher("/vistas/nuevacategoria.jsp").forward(request, response);
        } catch (Exception e) {
            request.setAttribute("msje", "No se pudo realizar la operacion");
        }
    }

    private void registrarCategorias(HttpServletRequest request, HttpServletResponse response) {

        DAOCategoria dao;
        Categorias cat = null;

        if (request.getParameter("txtNombre") != null) {

            cat = new Categorias();
            cat.setNombreCategoria(request.getParameter("txtNombre"));
            if (request.getParameter("chkVigencia") != null) {
                cat.setVigencia(true);
            } else {
                cat.setVigencia(false);
            }
            if (request.getParameter("chkMostrar") != null) {
                cat.setMostrar(true);
            } else {
                cat.setMostrar(false);
            }
            dao = new DAOCategoria();
            try {
                dao.registrar(cat);
                response.sendRedirect("Categorias?accion=listar");
            } catch (Exception e) {
                request.setAttribute("msje", "No se pudo registrar la categoria");
                request.setAttribute("categoria", cat);
                request.setAttribute("accion", "registrar");
                this.presentarFormulario(request, response);
            } finally {
            }
        }

    }

    private void presentarCategoria(HttpServletRequest request, HttpServletResponse response) {
        DAOCategoria dao;
        Categorias cat;

        if (request.getParameter("cod") != null) {
            cat = new Categorias();
            cat.setCodigo(Integer.parseInt(request.getParameter("cod")));

            dao = new DAOCategoria();
            try {
                cat = dao.leer(cat);
                if (cat != null) {
                    request.setAttribute("categoria", cat);
                } else {
                    request.setAttribute("msje", "No se encontró la categoria");
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

    private void actualizarCategoria(HttpServletRequest request, HttpServletResponse response) {
        DAOCategoria daoCat;
        Categorias cat;

        if (request.getParameter("hCodigo") != null
                && request.getParameter("txtNombre") != null) {
            cat = new Categorias();
            cat.setCodigo(Integer.parseInt(request.getParameter("hCodigo")));
            cat.setNombreCategoria(request.getParameter("txtNombre"));
            if (request.getParameter("chkVigencia") != null) {
                cat.setVigencia(true);
            } else {
                cat.setVigencia(false);
            }

            if (request.getParameter("chkMostrar") != null) {
                cat.setMostrar(true);
            } else {
                cat.setMostrar(false);
            }
            daoCat = new DAOCategoria();
            try {
                daoCat.actualizar(cat);
                response.sendRedirect("Categorias?accion=listar");
            } catch (Exception e) {
                request.setAttribute("msje",
                        "No se pudo actualizar la categoria");
                request.setAttribute("categoria", cat);
                request.setAttribute("accion", "ac");
                this.presentarFormulario(request, response);
            } finally {
            }
        }
    }

    private void cambiarVigencia(HttpServletRequest request, HttpServletResponse response) {
        DAOCategoria dao;
        Categorias cate;
        try {
            dao = new DAOCategoria();
            cate = new Categorias();

            if (request.getParameter("cambiar").equals("act")) {
                cate.setVigencia(false);
            } else {
                cate.setVigencia(true);
            }

            if (request.getParameter("cod") != null) {
                cate.setCodigo(Integer.parseInt(request.getParameter("cod")));
                dao.cambiarVigencia(cate);
            }
        } catch (Exception e) {
            request.setAttribute("msj", e.getMessage());
        }
        this.listarCategorias(request, response);
    }

    private void verCategoriasMenu(HttpServletRequest request, HttpServletResponse response) {
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

    private void productosxCategoria(HttpServletRequest request, HttpServletResponse response) {
        DAOProducto dao2 = new DAOProducto();
        List<Productos> productos;
        Categorias cat;

        this.verCategoriasMenu(request, response);

        if (request.getParameter("cod") != null) {
            cat = new Categorias();
            cat.setCodigo(Integer.parseInt(request.getParameter("cod")));

            try {
                productos = dao2.ProductosPorCategoria(cat);
                request.setAttribute("productos", productos);
            } catch (Exception e) {
                request.setAttribute("msje", e.getMessage() + "No se mostrar los detalles del producto seleccionado");

            }
            this.listadoProductos_categoria(request, response);
        }
    }

    private void listadoProductos_categoria(HttpServletRequest request, HttpServletResponse response) {
        try {
            this.getServletConfig().getServletContext().
                    getRequestDispatcher("/vistas/productos_por_categoria.jsp"
                    ).forward(request, response);
        } catch (Exception e) {
            request.setAttribute("msje", "No se pudo realizar la operacion");
        }
    }

}
