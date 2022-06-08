package DAO;

import Config.Conexion;
import Modelo.Categorias;
import Modelo.Marcas;
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

public class DAOProducto extends Conexion {

    Connection con;
    Conexion cn = new Conexion();
    PreparedStatement ps;
    ResultSet rs;
    int r = 0;
    

    public void registrar(Productos producto) throws Exception {
        String sql;
        sql = "INSERT INTO producto (nombre, foto,descripcion,precioCompra,precio,stock, estado,destacado, idCategoria, idMarca) "
                + "VALUES('" + producto.getNombre() + "', '"
                + producto.getImagen() + "', '"
                + producto.getDescripcion() + "', "
                + producto.getPreciocompra() + ", "
                + producto.getPrecio() + ", "
                + producto.getStock() + ", "
                + (producto.isVigencia() == true ? "1" : "0")
                + ", " + (producto.isDestacado() == true ? "1" : "0")
                + "," + producto.getCategoria().getCodigo()
                + ", " + producto.getMarca().getId_Marca() + ")";
        try {
            this.conectar(false);
            this.ejecutarOrden(sql);
            this.cerrar(true);
        } catch (Exception e) {
            this.cerrar(false);
            throw e;
        } finally {
        }
    }

    public int AgregarNuevoProducto(Productos p) {
        String sql = "insert into Producto(nombre,foto,descripcion,precio,stock,PrecioCompra,estado)values(?,?,?,?,?,?,?)";
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

//    public List listarProd() {
//        List lista = new ArrayList();
//        String sql = "select * from producto";
//        try {
//            ps = getConnection().prepareStatement(sql);
//            rs = ps.executeQuery();
//            while (rs.next()) {
//                Productos p = new Productos();
//                p.setId_Producto(rs.getInt(1));
//                p.setNombre(rs.getString(2));
//                p.setImagen(rs.getString(3));
//                // p.setFoto(rs.getBinaryStream());
//                p.setDescripcion(rs.getString(4));
//                p.setPreciocompra(rs.getDouble(5));
//                p.setPrecio(rs.getDouble(6));
//                p.setStock(rs.getInt(7));
//                lista.add(p);
//            }
//        } catch (Exception e) {
//        }
//        return lista;
//    }
    public void actualizarStock(int cant, int id) {
        String sql = "update producto set stock=? where idProducto=?";
        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            ps.setInt(1, cant);
            ps.setInt(2, id);
            ps.executeUpdate();
        } catch (Exception e) {
        }
    }

    public void actualizarPrecioCompra(double prec, int id) {
        String sql = "update producto set precioCompra=? where idProducto=?";
        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            ps.setDouble(1, prec);
            ps.setInt(2, id);
            ps.executeUpdate();
        } catch (Exception e) {
        }
    }

    public void actualizar(Productos producto) throws Exception {
        String sql;

        sql = "UPDATE Producto SET nombre = '" + producto.getNombre()
                + "', descripcion = '" + producto.getDescripcion()
                + "', PrecioCompra = " + producto.getPreciocompra()
                + ", precio = " + producto.getPrecio()
                + ", Foto = '" + producto.getFoto()
                + "', estado = " + (producto.isVigencia() == true ? "1" : "0")
                + ", destacado = " + (producto.isDestacado() == true ? "1" : "0")
                + ", idCategoria =  " + producto.getCategoria().getCodigo()
                + ", idMarca =  " + producto.getMarca().getId_Marca()
                + " WHERE idProducto = " + producto.getId_Producto();

        try {
            this.conectar(false);
            this.ejecutarOrden(sql);
        } catch (Exception e) {
            throw e;
        } finally {
        }
    }

    public Productos leer(Productos producto) throws Exception {
        Productos prod = null;
        ResultSet rs = null;
        String sql = "select p.nombre, p.descripcion, p.Foto, p.precioCompra,p.precio,p.estado,p.destacado, p.idCategoria, p.idMarca from Producto p "
                + "where p.idProducto = " + producto.getId_Producto();

        try {
            this.conectar(false);
            rs = this.ejecutarOrdenDatos(sql);
            if (rs.next() == true) {
                prod = new Productos();
                prod.setId_Producto(producto.getId_Producto());
                prod.setNombre(rs.getString("nombre"));
                prod.setDescripcion(rs.getString("descripcion"));
                prod.setFoto(rs.getBinaryStream("Foto"));
                prod.setPreciocompra(rs.getDouble("precioCompra"));
                prod.setPrecio(rs.getDouble("precio"));
                prod.setVigencia(rs.getBoolean("estado"));
                prod.setDestacado(rs.getBoolean("destacado"));
                prod.setCategoria(new Categorias());
                prod.getCategoria().setCodigo(rs.getInt("idCategoria"));
                prod.setMarca(new Marcas());
                prod.getMarca().setId_Marca(rs.getInt("idMarca"));
            }
            rs.close();
            this.cerrar(true);
        } catch (Exception e) {
            this.cerrar(false);
            throw e;
        } finally {
            if (rs != null && rs.isClosed() == false) {
                rs.close();
            }
            rs = null;
        }

        return prod;
    }

    public List<Productos> mostrarProductosxCategoria(Productos producto) throws Exception {
        List<Productos> productos = null;

        Productos prod;
        ResultSet rs = null;
        String sql = "SELECT P.Nombre, P.descripcion,P.precio,p.foto,c.categoria \n"
                + "            FROM categoria C JOIN Producto P ON P.idCategoria = C.idCategoria\n"
                + "              WHERE c.idCategoria = " + producto.getId_Producto()
                + "           GROUP BY P.Nombre, p.descripcion, p.precio,p.foto,c.categoria";

        try {
            this.conectar(false);
            rs = this.ejecutarOrdenDatos(sql);
            productos = new ArrayList<>();

            while (rs.next() == true) {
                prod = new Productos();
                prod.setId_Producto(rs.getInt("idProducto"));
                prod.setNombre(rs.getString("nombre"));
                prod.setDescripcion(rs.getString("descripcion"));
                prod.setPrecio(rs.getDouble("precio"));

                prod.setImagen(rs.getString("Foto"));

                //prod.setPreciocompra(rs.getDouble("PrecioCompra"));
//                prod.setStock(rs.getInt("stock"));
//                prod.setVigencia(rs.getBoolean("estado"));
                prod.setCategoria(new Categorias());
                prod.getCategoria().setNombreCategoria(rs.getString("Categoria"));

                productos.add(prod);
            }
            rs.close();
            this.cerrar(true);
        } catch (Exception e) {
            this.cerrar(false);
            throw e;
        } finally {
            if (rs != null && rs.isClosed() == false) {
                rs.close();
            }
            rs = null;
        }
        return productos;
    }

    public List<Productos> listar() throws Exception {
        List<Productos> productos = null;
        Productos prod;
        ResultSet rs = null;

        String sql = "select P.idProducto, P.nombre, P.descripcion, P.precio, P.stock, P.Foto, P.PrecioCompra, P.estado,P.destacado,"
                + " C.categoria as Categoria, M.marca as Marca "
                + "from Producto P inner join Categoria C on "
                + "C.idCategoria = P.idCategoria inner join "
                + "Marca M on M.idMarca = P.idMarca "
                + "Order By P.idProducto";

        try {
//            this.conectar(false);
//            rs = this.ejecutarOrdenDatos(sql);
            productos = new ArrayList<>();
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next() == true) {
                prod = new Productos();
                prod.setId_Producto(rs.getInt("idProducto"));
                prod.setNombre(rs.getString("nombre"));
                prod.setDescripcion(rs.getString("descripcion"));
                prod.setImagen(rs.getString("Foto"));

                prod.setPreciocompra(rs.getDouble("PrecioCompra"));
                prod.setPrecio(rs.getDouble("precio"));
                prod.setStock(rs.getInt("stock"));
                prod.setVigencia(rs.getBoolean("estado"));
                prod.setDestacado(rs.getBoolean("destacado"));
                prod.setCategoria(new Categorias());
                prod.getCategoria().setNombreCategoria(rs.getString("Categoria"));
                prod.setMarca(new Marcas());
                prod.getMarca().setNombre(rs.getString("Marca"));
                productos.add(prod);
            }
            rs.close();
            this.cerrar(true);
        } catch (Exception e) {
            this.cerrar(false);
            throw e;
        } finally {
            if (rs != null && rs.isClosed() == false) {
                rs.close();
            }
            rs = null;
        }
        return productos;
    }

    public List<Productos> listarProductosConStock() throws Exception {
        List<Productos> productos = null;
        Productos prod;
        ResultSet rs = null;

        String sql = "select P.idProducto, P.nombre,P.Foto, P.descripcion, P.precio, P.stock, P.PrecioCompra, P.estado,"
                + " C.categoria as Categoria, M.marca as Marca "
                + "from Producto P inner join Categoria C on "
                + "C.idCategoria = P.idCategoria inner join "
                + "Marca M on M.idMarca = P.idMarca "
                + "WHERE P.stock > 0 "
                + "Order By P.idProducto";

        try {
//            this.conectar(false);
//            rs = this.ejecutarOrdenDatos(sql);
            productos = new ArrayList<>();
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next() == true) {
                prod = new Productos();
                prod.setId_Producto(rs.getInt("idProducto"));
                prod.setNombre(rs.getString("nombre"));
                prod.setDescripcion(rs.getString("descripcion"));
                prod.setImagen(rs.getString("Foto"));

                prod.setPreciocompra(rs.getDouble("PrecioCompra"));
                prod.setPrecio(rs.getDouble("precio"));
                prod.setStock(rs.getInt("stock"));
                prod.setVigencia(rs.getBoolean("estado"));
                prod.setCategoria(new Categorias());
                prod.getCategoria().setNombreCategoria(rs.getString("Categoria"));
                prod.setMarca(new Marcas());
                prod.getMarca().setNombre(rs.getString("Marca"));
                productos.add(prod);
            }
            rs.close();
            this.cerrar(true);
        } catch (Exception e) {
            this.cerrar(false);
            throw e;
        } finally {
            if (rs != null && rs.isClosed() == false) {
                rs.close();
            }
            rs = null;
        }
        return productos;
    }

    public Productos listarId(int id) {
        String sql = "SELECT * FROM producto where idProducto=" + id;
        Productos p = new Productos();
        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                p.setId_Producto(rs.getInt(1));
                p.setNombre(rs.getString(2));
                p.setDescripcion(rs.getString(3));
                p.setFoto(rs.getBinaryStream(4));
                p.setPrecio(rs.getDouble("precio"));
                p.setPreciocompra(rs.getDouble("PrecioCompra"));
                p.setStock(rs.getInt("stock"));
            }
        } catch (Exception e) {

        }
        return p;
    }

    public void listarImg(int id, HttpServletResponse response) {
        String sql = "select * from Producto where idProducto=" + id;
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

    public List<Productos> listarVigentes() throws Exception {
        List<Productos> productos = null;
        Productos prod;
        ResultSet rs = null;

        String sql = "select P.idProducto, P.nombre, P.descripcion, "
                + " C.categoria as Categoria , M.marca as Marca "
                + "from Producto P inner join Categoria C on "
                + "C.idCategoria = P.idCategoria inner join "
                + "Marca M on M.idMarca = P.idMarca "
                + "WHERE P.Vigencia = 1"
                + "Order By P.idProducto";

        try {
            this.conectar(false);
            rs = this.ejecutarOrdenDatos(sql);
            productos = new ArrayList<>();
            while (rs.next() == true) {
                prod = new Productos();
                prod.setId_Producto(rs.getInt("idProducto"));
                prod.setNombre(rs.getString("nombre"));
                prod.setCategoria(new Categorias());
                prod.getCategoria().setNombreCategoria(rs.getString("Categoria"));
                prod.setMarca(new Marcas());
                prod.getMarca().setNombre(rs.getString("Marca"));
                productos.add(prod);
            }
            rs.close();
            this.cerrar(true);
        } catch (Exception e) {
            this.cerrar(false);
            throw e;
        } finally {
            if (rs != null && rs.isClosed() == false) {
                rs.close();
            }
            rs = null;
        }
        return productos;
    }


    public List<Productos> contarProductos() throws Exception {
        List<Productos> productos;
        Productos prod;
        ResultSet rs = null;
        String sql = "SELECT COUNT(idProducto) as Producto FROM producto WHERE estado=1";

        try {
            this.conectar(false);
            rs = this.ejecutarOrdenDatos(sql);
            productos = new ArrayList<>();
            while (rs.next() == true) {
                prod = new Productos();
                prod.setContar(rs.getInt("Producto"));
                productos.add(prod);
            }
        } catch (Exception e) {
            throw e;
        } finally {
            if (rs != null && rs.isClosed() == false) {
                rs.close();
            }
            rs = null;
        }
        return productos;
    }

    public List<Productos> listarDestacados() throws Exception {
        List<Productos> productos = null;
        Productos prod;
        ResultSet rs = null;

        String sql = "select P.idProducto, P.nombre, P.descripcion, P.precio, P.stock, P.Foto, P.estado,P.destacado"
                + " C.categoria as Categoria, M.marca as Marca "
                + "from Producto P inner join Categoria C on "
                + "C.idCategoria = P.idCategoria inner join "
                + "Marca M on M.idMarca = P.idMarca "
                + "WHERE P.stock > 0 and P.estado=1 and P.destacado=1"
                + "Order By P.idProducto";

        try {
//            this.conectar(false);
//            rs = this.ejecutarOrdenDatos(sql);
            productos = new ArrayList<>();
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next() == true) {
                prod = new Productos();
                prod.setId_Producto(rs.getInt("idProducto"));
                prod.setNombre(rs.getString("nombre"));
                prod.setDescripcion(rs.getString("descripcion"));
                prod.setImagen(rs.getString("Foto"));
                prod.setPrecio(rs.getDouble("precio"));
                prod.setStock(rs.getInt("stock"));
                prod.setVigencia(rs.getBoolean("estado"));
                prod.setDestacado(rs.getBoolean("destacado"));
                prod.setCategoria(new Categorias());
                prod.getCategoria().setNombreCategoria(rs.getString("Categoria"));
                prod.setMarca(new Marcas());
                prod.getMarca().setNombre(rs.getString("Marca"));
                productos.add(prod);
            }
            rs.close();
            this.cerrar(true);
        } catch (Exception e) {
            this.cerrar(false);
            throw e;
        } finally {
            if (rs != null && rs.isClosed() == false) {
                rs.close();
            }
            rs = null;
        }
        return productos;
    }

    public List<Productos> ProductosPorCategoria(Categorias categoria) throws Exception {

        List<Productos> prods;
        Productos prod;
        ResultSet rs = null;
        String sql = "SELECT P.idProducto, P.Nombre,P.foto, P.descripcion, P.precio, P.stock, P.PrecioCompra, P.estado FROM Producto P WHERE P.estado = 1 and p.idCategoria = " + categoria.getCodigo();

        try {
            this.conectar(false);
            rs = this.ejecutarOrdenDatos(sql);
            prods = new ArrayList<>();
            while (rs.next() == true) {
                prod = new Productos();
               prod.setId_Producto(rs.getInt("P.idProducto"));
                prod.setNombre(rs.getString("P.nombre"));
                prod.setDescripcion(rs.getString("P.descripcion"));
                prod.setImagen(rs.getString("P.foto"));
                prod.setPrecio(rs.getDouble("P.precio"));
                prod.setStock(rs.getInt("P.stock"));
                prod.setVigencia(rs.getBoolean("P.estado"));
                prods.add(prod);
            }
        } catch (Exception e) {
            throw e;
        } finally {
            if (rs != null && rs.isClosed() == false) {
                rs.close();
            }
            rs = null;
        }
        return prods;
    }

}
