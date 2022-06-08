package DAO;

import Config.Conexion;
import EntidadesReportes.CantidadInventario;
import EntidadesReportes.Inventario;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class DAOInventario   
        extends Conexion{
    public List<Inventario> listar() throws Exception {
        List<Inventario> inventario;
        Inventario inv;
        Conexion con;
        Connection cn = null;
        Statement st = null;
        ResultSet rs = null;
        String sql = "select idProducto, nombre as Producto, descripcion as Descripcion, "
                + "precio_compra as PrecioCompra, precio_venta as PrecioVenta, "
                + "stock as Stock, SUM(precio_compra  * stock) as Total from Producto "
                + "group by idProducto, nombre, descripcion, precio_compra, precio_venta,stock "
                + " ORDER BY idProducto desc";

        con = new Conexion();
        try {
           // cn = con.conectar();
            st = cn.createStatement();
            rs = st.executeQuery(sql);
            inventario = new ArrayList<>();
            while (rs.next() == true) {
                inv = new Inventario();
                inv.setIdProducto(rs.getInt("idProducto"));
                inv.setProducto(rs.getString("Producto"));
                inv.setDescripcion(rs.getString("descripcion"));
                inv.setPrecioCompra(rs.getDouble("PrecioCompra"));
                inv.setPrecioVenta(rs.getDouble("PrecioVenta"));
                inv.setStock(rs.getInt("Stock"));
                inv.setTotal(rs.getDouble("Total"));
                inventario.add(inv);
            }
        } catch (Exception e) {
            throw e;
        } finally {
            if (rs != null && rs.isClosed() == false) {
                rs.close();
            }
            rs = null;
            if (st != null && st.isClosed() == false) {
                st.close();
            }
            st = null;
            if (cn != null && cn.isClosed() == false) {
                cn.close();
            }
            cn = null;
        }
        return inventario;
    }
    
     public List<CantidadInventario> CantProductos() throws Exception {
        List<CantidadInventario> cantInventario;
        CantidadInventario inv;
        Conexion con;
        Connection cn = null;
        Statement st = null;
        ResultSet rs = null;
        String sql = "Select COUNT(idProducto) as CantProd from Producto";

        con = new Conexion();
        try {
         //   cn = con.conectar();
            st = cn.createStatement();
            rs = st.executeQuery(sql);
            cantInventario = new ArrayList<>();
            while (rs.next() == true) {
                inv = new CantidadInventario();
                inv.setIdProducto(rs.getInt("idProducto"));
                cantInventario.add(inv);
            }
        } catch (Exception e) {
            throw e;
        } finally {
            if (rs != null && rs.isClosed() == false) {
                rs.close();
            }
            rs = null;
            if (st != null && st.isClosed() == false) {
                st.close();
            }
            st = null;
            if (cn != null && cn.isClosed() == false) {
                cn.close();
            }
            cn = null;
        }
        return cantInventario;
    }

}
