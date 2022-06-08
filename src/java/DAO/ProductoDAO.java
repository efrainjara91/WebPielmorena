package DAO;

import Config.Conexion;
import Modelo.Productos;
import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.InputStream;
import java.io.OutputStream;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.http.HttpServletResponse;

public class ProductoDAO extends Conexion {

    Connection con;
    Conexion cn = new Conexion();
    PreparedStatement ps;
    ResultSet rs;
    int r = 0;

    public List buscar(String nombre) {
        List list = new ArrayList();
        String sql = "select * from producto where Nombres like '%" + nombre + "%'";
        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                Productos p = new Productos();
                p.setId_Producto(rs.getInt(1));
                p.setNombre(rs.getString(2));
                p.setImagen(rs.getString(3));
//               p.setFoto(rs.getBinaryStream(3));
                p.setDescripcion(rs.getString(4));
                p.setPrecio(rs.getDouble(5));
                p.setStock(rs.getInt(6));
                list.add(p);
            }
        } catch (Exception e) {
        }
        return list;
    }

    public Productos listarId(int id) {
        Productos p = new Productos();
        String sql = "select * from producto where IdProducto=" + id;
        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                p.setId_Producto(rs.getInt(1));
                p.setNombre(rs.getString(2));
                p.setImagen(rs.getString(3));
                p.setDescripcion(rs.getString(4));
                p.setPrecio(rs.getDouble(5));
                p.setStock(rs.getInt(6));
                p.setPreciocompra(rs.getDouble(7));

            }
        } catch (Exception e) {
        }
        return p;
    }

    public List listar() {
        List lista = new ArrayList();
        String sql = "select * from producto";
        try {
            ps = getConnection().prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                Productos p = new Productos();
                p.setId_Producto(rs.getInt(1));
                p.setNombre(rs.getString(2));
                p.setImagen(rs.getString(3));
                // p.setFoto(rs.getBinaryStream());
                p.setDescripcion(rs.getString(4));
                p.setPrecio(rs.getDouble(5));
                p.setStock(rs.getInt(6));
                p.setPreciocompra(rs.getDouble(7));

                lista.add(p);
            }
        } catch (Exception e) {
        }
        return lista;
    }

    public List listarDestacados() {
        List lista = new ArrayList();
        String sql = "select * from producto p WHERE P.stock > 0 and P.estado=1 and P.destacado=1";
        try {
            ps = getConnection().prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                Productos p = new Productos();
                p.setId_Producto(rs.getInt(1));
                p.setNombre(rs.getString(2));
                p.setImagen(rs.getString(3));
                // p.setFoto(rs.getBinaryStream());
                p.setDescripcion(rs.getString(4));
                p.setPrecio(rs.getDouble(5));
                p.setStock(rs.getInt(6));
                p.setPreciocompra(rs.getDouble(7));

                lista.add(p);
            }
        } catch (Exception e) {
        }
        return lista;
    }

    public void listarImg(int id, HttpServletResponse response) {
        String sql = "select * from producto where idProducto=" + id;
        InputStream inputStream = null;
        OutputStream outputStream = null;
        BufferedInputStream bufferedInputStream = null;
        BufferedOutputStream bufferedOutputStream = null;
        response.setContentType("image/*");
        try {
            outputStream = response.getOutputStream();
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            if (rs.next()) {
                inputStream = rs.getBinaryStream("Foto");
            }
            bufferedInputStream = new BufferedInputStream(inputStream);
            bufferedOutputStream = new BufferedOutputStream(outputStream);
            int i = 0;
            while ((i = bufferedInputStream.read()) != -1) {
                bufferedOutputStream.write(i);
            }
        } catch (Exception e) {
        }
    }

    public int AgregarNuevoProducto(Productos p) {
        String sql = "insert into producto(nombre,foto,descripcion,precio,stock,precioCompra,estado)values(?,?,?,?,?,?,?)";
        try {
            ps = getConnection().prepareStatement(sql);
            ps.setString(1, p.getNombre());
            ps.setString(2, p.getImagen());
            ps.setString(3, p.getDescripcion());
            ps.setDouble(4, p.getPrecio());
            ps.setInt(5, p.getStock());
            ps.setDouble(6, p.getPreciocompra());
            ps.setBoolean(7, p.isVigencia());
            ps.executeUpdate();
        } catch (Exception e) {
        }
        return r;
    }

//    public List<Productos> listarProductosporCategoria(int idProd) throws Exception {
//        List<Productos> productos = null;
//        Productos prod;
//        ResultSet rs = null;
//
//        String sql = "SELECT p.*"
//                + "FROM Producto  P JOIN Categoria C"
//                + "ON p.idCategoria = c.idCategoria"
//                + "WHERE c.idCategoria = " + producto.getCodigo() +
//                + "Order By P.idProducto";
//
//        try {
//            this.conectar(false);
//            rs = this.ejecutarOrdenDatos(sql);
//            productos = new ArrayList<>();
//            con = cn.getConnection();
//            ps = con.prepareStatement(sql);
//            rs = ps.executeQuery();
//            while (rs.next() == true) {
//                prod = new Productos();
//                prod.setId_Producto(rs.getInt("idProducto"));
//                prod.setNombre(rs.getString("nombre"));
//                prod.setDescripcion(rs.getString("descripcion"));
//                prod.setImagen(rs.getString("Foto"));
//
//                prod.setPreciocompra(rs.getDouble("PrecioCompra"));
//                prod.setPrecio(rs.getDouble("precio"));
//                prod.setStock(rs.getInt("stock"));
//                prod.setVigencia(rs.getBoolean("estado"));
//                prod.setCategoria(new Categorias());
//                prod.getCategoria().setNombreCategoria(rs.getString("Categoria"));
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
