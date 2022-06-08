package DAO;

import Config.Conexion;
import Modelo.Categorias;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class DAOCategoria
        extends Conexion {
  Conexion con = new Conexion();
    Connection cn;
    ResultSet rs;
    PreparedStatement ps;
    String sql;

    public void registrar(Categorias categoria) throws Exception {
        String sql;

        sql = "INSERT INTO categoria (categoria, estado,mostrar)"
                + "VALUES('" + categoria.getNombreCategoria() + "',"
                + (categoria.isVigencia() == true ? "1" : "0") + ", "
                + (categoria.isMostrar() == true ? "1" : "0") + ")";

        try {
            this.conectar(false);
            this.ejecutarOrden(sql);
        } catch (Exception e) {
            throw e;
        } finally {
        }
    }

    public void actualizar(Categorias categoria) throws Exception {
        String sql;

        sql = "UPDATE categoria SET categoria = '" + categoria.getNombreCategoria()
                + "', estado = " + (categoria.isVigencia() == true ? "1" : "0")
                + ", mostrar = " + (categoria.isMostrar() == true ? "1" : "0")
                + " WHERE idCategoria = " + categoria.getCodigo();

        try {
            this.conectar(false);
            this.ejecutarOrden(sql);
        } catch (Exception e) {
            throw e;
        } finally {
        }
    }

    public void cambiarVigencia(Categorias cate) throws Exception {
        String sql = "UPDATE categoria SET estado = "
                + (cate.isVigencia() == true ? "1" : "0")
                + " WHERE idCategoria = " + cate.getCodigo();
        try {
            this.conectar(false);
            this.ejecutarOrden(sql);
            this.cerrar(true);
        } catch (Exception e) {
            throw e;
        } finally {
        }
    }

    public Categorias leer(Categorias categoria) throws Exception {
        Categorias cat = null;
        ResultSet rs = null;
        String sql = "SELECT C.categoria, C.estado, C.mostrar FROM categoria C  WHERE C.idCategoria = " + categoria.getCodigo();

        try {
            this.conectar(false);
            rs = this.ejecutarOrdenDatos(sql);
            if (rs.next() == true) {
                cat = new Categorias();
                cat.setCodigo(categoria.getCodigo());
                cat.setNombreCategoria(rs.getString("categoria"));
                cat.setVigencia(rs.getBoolean("estado"));
                cat.setMostrar(rs.getBoolean("mostrar"));
            }
        } catch (Exception e) {
            throw e;
        } finally {
            if (rs != null && rs.isClosed() == false) {
                rs.close();
            }
            rs = null;
        }
        return cat;
    }

    public List<Categorias> listar() throws Exception {
        List<Categorias> categorias;
        Categorias cat;
        ResultSet rs = null;
        String sql = "SELECT C.idCategoria, C.categoria, C.estado, C.mostrar FROM Categoria C ORDER BY C.idCategoria";

        try {
            this.conectar(false);
            rs = this.ejecutarOrdenDatos(sql);
            categorias = new ArrayList<>();
            while (rs.next() == true) {
                cat = new Categorias();
                cat.setCodigo(rs.getInt("idCategoria"));
                cat.setNombreCategoria(rs.getString("categoria"));
                cat.setVigencia(rs.getBoolean("estado"));
                cat.setMostrar(rs.getBoolean("mostrar"));

                categorias.add(cat);
            }
        } catch (Exception e) {
            throw e;
        } finally {
            if (rs != null && rs.isClosed() == false) {
                rs.close();
            }
            rs = null;
        }
        return categorias;
    }

    public List<Categorias> listarMenus() throws Exception {
        List<Categorias> categorias;
        Categorias cat;
        ResultSet rs = null;
        String sql = "SELECT C.idCategoria, C.categoria,C.mostrar, C.estado FROM Categoria C WHERE C.estado=1 and C.mostrar=1 ORDER BY C.idCategoria";

        try {
            this.conectar(false);
            rs = this.ejecutarOrdenDatos(sql);
            categorias = new ArrayList<>();
            while (rs.next() == true) {
                cat = new Categorias();
                cat.setCodigo(rs.getInt("idCategoria"));
                cat.setNombreCategoria(rs.getString("categoria"));
                cat.setVigencia(rs.getBoolean("estado"));
                cat.setMostrar(rs.getBoolean("mostrar"));

                categorias.add(cat);
            }
        } catch (Exception e) {
            throw e;
        } finally {
            if (rs != null && rs.isClosed() == false) {
                rs.close();
            }
            rs = null;
        }
        return categorias;
    }

    public List<Categorias> listarVigentes() throws Exception {
        List<Categorias> categorias;
        Categorias cat;
        ResultSet rs = null;
        String sql = "SELECT C.idCategoria, C.categoria, C.estado FROM Categoria C WHERE C.estado=1 ORDER BY C.idCategoria";

        try {
            this.conectar(false);
            rs = this.ejecutarOrdenDatos(sql);
            categorias = new ArrayList<>();
            while (rs.next() == true) {
                cat = new Categorias();
                cat.setCodigo(rs.getInt("idCategoria"));
                cat.setNombreCategoria(rs.getString("categoria"));
                cat.setVigencia(rs.getBoolean("estado"));

                categorias.add(cat);
            }
        } catch (Exception e) {
            throw e;
        } finally {
            if (rs != null && rs.isClosed() == false) {
                rs.close();
            }
            rs = null;
        }
        return categorias;
    }
    public List<Categorias> contarCategorias() throws Exception {
        List<Categorias> categorias;
        Categorias cat;
        ResultSet rs = null;
        String sql = "SELECT COUNT(idCategoria) as Categoria FROM categoria where estado=1";

        try {
            this.conectar(false);
            rs = this.ejecutarOrdenDatos(sql);
            categorias = new ArrayList<>();
            while (rs.next() == true) {
                cat = new Categorias();
                cat.setContar(rs.getInt("Categoria"));
                categorias.add(cat);
            }
        } catch (Exception e) {
            throw e;
        } finally {
            if (rs != null && rs.isClosed() == false) {
                rs.close();
            }
            rs = null;
        }
        return categorias;
    }

//    public List<Productos> mostrarProductosxCategoria(Categorias producto) throws Exception {
//        List<Productos> productos = null;
//
//        Productos prod;
//        ResultSet rs = null;
//        String sql = "SELECT P.Nombre, P.descripcion,P.precio,p.foto,c.categoria \n" +
//"            FROM categoria C JOIN Producto P ON P.idCategoria = C.idCategoria\n" +
//"              WHERE c.idCategoria = " + producto.getCodigo() +
//"           GROUP BY P.Nombre, p.descripcion, p.precio,p.foto,c.categoria";
//
//        try {
//            this.conectar(false);
//            rs = this.ejecutarOrdenDatos(sql);
//            productos = new ArrayList<>();
//
//            while (rs.next() == true) {
//                prod = new Productos();
//                prod.setId_Producto(rs.getInt("idProducto"));
//                prod.setNombre(rs.getString("nombre"));
//                prod.setDescripcion(rs.getString("descripcion"));
//                prod.setImagen(rs.getString("Foto"));
//
//                //prod.setPreciocompra(rs.getDouble("PrecioCompra"));
//                prod.setPrecio(rs.getDouble("precio"));
//                prod.setStock(rs.getInt("stock"));
//                prod.setVigencia(rs.getBoolean("estado"));
//                prod.setCategoria(new Categorias());
//                prod.getCategoria().setNombreCategoria(rs.getString("Categoria"));
//
//                productos.add(prod);
//            }
//            rs.close();
//            this.cerrar(true);
//        } catch (Exception e) {
//            this.cerrar(false);
//            throw e;
//        } finally {
//            if (rs != null && rs.isClosed() == false) {
//                rs.close();
//            }
//            rs = null;
//        }
//        return productos;
//    }
    
    
   
}
