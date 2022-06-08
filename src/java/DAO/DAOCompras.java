package DAO;

import Config.Conexion;
import Modelo.Clientes;
import Modelo.Compra;
import Modelo.Comprobantes;
import Modelo.DetalleCompra;
import Modelo.Empleados;
import Modelo.Productos;
import Modelo.Venta;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import java.util.ArrayList;
import java.util.List;

public class DAOCompras {

    Conexion con = new Conexion();
    Connection cn;
    ResultSet rs;
    PreparedStatement ps;
    String sql;

    public String numerodeVenta() {
        String ncompra = "";
        sql = "select max(NumeroSerie) from compras";
        try {
            cn = con.getConnection();
            ps = cn.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                ncompra = rs.getString(1);
            }
        } catch (Exception e) {
        }
        return ncompra;
    }

    public void registrar(Compra compra) throws Exception {
        int codigoCompra;
        sql = "INSERT INTO compras(idProveedor,idEmpleado,fecha,monto, NumeroSerie,idComprobante,estado)values(?,?,?,?,?,?,?)";
        try {
            cn = con.getConnection();
            ps = cn.prepareStatement(sql);
            //1: registrar la venta (el servidor asigna codigo)
            ps.setInt(1, compra.getIdproveedor());
            ps.setInt(2, compra.getIdempleado());
            ps.setString(3, compra.getFecha());
            ps.setDouble(4, compra.getMonto());
            ps.setString(5, compra.getNumserie());
            ps.setInt(6, compra.getIdcomprobante());
            ps.setString(7, compra.getEstado());
            ps.executeUpdate();

            //2. averiguar el codigo generado
            sql = "SELECT @@IDENTITY AS idcompra";
            rs = ps.executeQuery(sql);
            rs.next();
            codigoCompra = rs.getInt("idcompra");
            rs.close();
            //3. varias veces segun sea necesario
            //3.1 registar cada detalle
            for (DetalleCompra detalle : compra.getDetalleCompras()) {
                sql = "INSERT into detalle_compras(idCompras, IdProducto, cantidad, precioCompra) VALUES(" + codigoCompra + ", "
                        + detalle.getProducto().getId_Producto() + ","
                        + detalle.getCantidad() + ","
                        + detalle.getPrecioUnitario() + ")";

                ps.executeUpdate(sql);
            }
            cn.commit();
        } catch (Exception e) {
            cn.rollback();
            throw e;
        } finally {
            if (ps != null && ps.isClosed() == false) {
                ps.close();
            }
            ps = null;
            if (rs != null && rs.isClosed() == false) {
                rs.close();
            }
            rs = null;
            if (cn != null && cn.isClosed() == false) {
                cn.close();
            }
            cn = null;
        }
    }
    
    public List listar() throws Exception {
        List<Compra> compr = new ArrayList<>();
        sql = "SELECT c.idcompra, com.nombre,c.NumeroSerie,c.fecha,\n"
                + "c.monto,prov.NombreProveedor,e.nombres,c.estado FROM compras c ,empleado e ,proveedor prov \n"
                + ",comprobante com where c.idEmpleado = e.idEmpleado and c.idProveedor=prov.idProveedor and c.idComprobante=com.idComprobante";
        try {
            cn = con.getConnection();
            ps = cn.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                Compra compra = new Compra();
                compra.setId(rs.getInt("c.idcompra"));
                compra.setComprobante(rs.getString("com.nombre"));
                compra.setNumserie(rs.getString("c.NumeroSerie"));
                compra.setFecha(rs.getString("c.fecha"));
                compra.setMonto(rs.getDouble("c.monto"));
                compra.setProveedor(rs.getString("prov.NombreProveedor"));
                compra.setEmpleado(rs.getString("e.nombres"));
                compra.setEstado(rs.getString("c.estado"));
                compr.add(compra);
            }
        } catch (Exception e) {
            System.err.println("Erroror:" + e);
        } finally {
            if (rs != null && rs.isClosed() == false) {
                rs.close();
            }
            rs = null;
            if (ps != null && ps.isClosed() == false) {
                ps.close();
            }
            ps = null;
            if (cn != null && cn.isClosed() == false) {
                cn.close();
            }
            cn = null;
        }
        return compr;
    }


    public List listarporProveedor(int idP) throws Exception {
        List<Compra> compras = new ArrayList<>();
        sql = "SELECT c.idcompra, p.NombreProveedor, c.fecha,c.monto,c.NumeroSerie,com.nombre, c.estado\n"
                + "FROM compras c INNER JOIN proveedor p INNER JOIN empleado e INNER JOIN comprobante com\n"
                + "on c.idProveedor=p.idProveedor and c.idEmpleado=e.idEmpleado and c.idComprobante=com.idComprobante\n"
                + "where c.idProveedor=" + idP;
        try {
            cn = con.getConnection();
            ps = cn.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                Compra compra = new Compra();
                compra.setId(rs.getInt("c.idcompra"));
                compra.setProveedor(rs.getString("p.NombreProveedor"));
                compra.setFecha(rs.getString("c.fecha"));
                compra.setMonto(rs.getDouble("c.monto"));
                compra.setNumserie(rs.getString("NumeroSerie"));
                compra.setComprobante(rs.getString("com.nombre"));
                compra.setEstado(rs.getString("c.estado"));
                compras.add(compra);
            }
        } catch (Exception e) {
            throw e;
        } finally {
            if (rs != null && rs.isClosed() == false) {
                rs.close();
            }
            rs = null;
            if (ps != null && ps.isClosed() == false) {
                ps.close();
            }
            ps = null;
            if (cn != null && cn.isClosed() == false) {
                cn.close();
            }
            cn = null;
        }
        return compras;
    }

    public List listarporEmpleado(int idE) throws Exception {
        List<Compra> compras = new ArrayList<>();
        sql = "SELECT c.idcompra, p.NombreProveedor, c.fecha,c.monto,c.NumeroSerie,com.nombre, c.estado\n"
                + "FROM compras c INNER JOIN proveedor p INNER JOIN empleado e INNER JOIN comprobante com\n"
                + "on c.idProveedor=p.idProveedor and c.idEmpleado=e.idEmpleado and c.idComprobante=com.idComprobante\n"
                + "where c.idEmpleado=" + idE;
        try {
            cn = con.getConnection();
            ps = cn.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                Compra compra = new Compra();
                compra.setId(rs.getInt("c.idcompra"));
                compra.setProveedor(rs.getString("p.NombreProveedor"));
                compra.setFecha(rs.getString("c.fecha"));
                compra.setMonto(rs.getDouble("c.monto"));
                compra.setNumserie(rs.getString("c.NumeroSerie"));
                compra.setComprobante(rs.getString("com.nombre"));
                compra.setEstado(rs.getString("c.estado"));
                compras.add(compra);
            }
        } catch (Exception e) {
            throw e;
        } finally {
            if (rs != null && rs.isClosed() == false) {
                rs.close();
            }
            rs = null;
            if (ps != null && ps.isClosed() == false) {
                ps.close();
            }
            ps = null;
            if (cn != null && cn.isClosed() == false) {
                cn.close();
            }
            cn = null;
        }
        return compras;
    }

    public List listarporFechas(String f1, String f2) throws Exception {
        List<Compra> compras = new ArrayList<>();
        sql = "SELECT c.idcompra, p.NombreProveedor, c.fecha,c.monto,c.NumeroSerie,com.nombre, c.estado\n"
                + "FROM compras c INNER JOIN proveedor p INNER JOIN empleado e INNER JOIN comprobante com\n"
                + "on c.idProveedor=p.idProveedor and c.idEmpleado=e.idEmpleado and c.idComprobante=com.idComprobante\n"
                + "where c.fecha BETWEEN '" + f1 + "' and '" + f2 + "'";
        try {
            cn = con.getConnection();
            ps = cn.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                Compra compra = new Compra();
                compra.setId(rs.getInt("c.idcompra"));
                compra.setProveedor(rs.getString("p.NombreProveedor"));
                compra.setFecha(rs.getString("c.fecha"));
                compra.setMonto(rs.getDouble("c.monto"));
                compra.setNumserie(rs.getString("NumeroSerie"));
                compra.setComprobante(rs.getString("com.nombre"));
                compra.setEstado(rs.getString("c.estado"));
                compras.add(compra);
            }
        } catch (Exception e) {
            throw e;
        } finally {
            if (rs != null && rs.isClosed() == false) {
                rs.close();
            }
            rs = null;
            if (ps != null && ps.isClosed() == false) {
                ps.close();
            }
            ps = null;
            if (cn != null && cn.isClosed() == false) {
                cn.close();
            }
            cn = null;
        }
        return compras;
    }
    
    public List<DetalleCompra> listarDetallesCompra(Compra compra) throws Exception {
        List<DetalleCompra> detalle = new ArrayList<>();
        sql = "SELECT P.nombre as Producto, P.foto, DC.cantidad, DC.precioCompra, SUM( DC.cantidad * DC.precioCompra) AS Total "
                + "FROM compras C INNER JOIN detalle_compras DC INNER JOIN Producto P "
                + "on C.idcompra=dc.idCompras and P.idProducto=DC.idproducto "
                + "WHERE C.estado = 1 and DC.idCompras = '" + compra.getId() + "' "
                + "GROUP BY p.nombre, P.foto, dc.cantidad, dc.precioCompra";
        try {
            cn = con.getConnection();
            ps = cn.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                DetalleCompra det = new DetalleCompra();
                det.setProducto(new Productos());
                det.getProducto().setNombre(rs.getString("Producto"));
                det.getProducto().setImagen(rs.getString("foto"));
                det.setCantidad(rs.getInt("cantidad"));
                det.setPrecioUnitario(rs.getDouble("precioCompra"));
                //det.setTotal(rs.getDouble("Total"));
                detalle.add(det);
            }
        } catch (Exception e) {
            throw e;
        } finally {
            if (rs != null && rs.isClosed() == false) {
                rs.close();
            }
            rs = null;
            if (ps != null && ps.isClosed() == false) {
                ps.close();
            }
            ps = null;
            if (cn != null && cn.isClosed() == false) {
                cn.close();
            }
            cn = null;
        }
        return detalle;
    }


}
