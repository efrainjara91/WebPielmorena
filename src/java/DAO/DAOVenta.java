package DAO;

import Config.Conexion;
import Modelo.DetalleVenta;
import Modelo.Productos;
import Modelo.Venta;
import EntidadesReportes.ListadoVenta;
import Modelo.Categorias;
import Modelo.Clientes;
import Modelo.Comprobantes;
import Modelo.Empleados;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class DAOVenta extends Conexion {

    Conexion con = new Conexion();
    Connection cn;
    ResultSet rs;
    PreparedStatement ps;
    String sql = "";

    public String numerodeVenta() {
        String nventa = "";
        sql = "select max(serie_comprobante) from venta";
        try {
            cn = con.getConnection();
            ps = cn.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                nventa = rs.getString(1);
            }
        } catch (Exception e) {
        }
        return nventa;
    }

    public void registrar(Venta venta) throws Exception {
        int codigoVenta;
        sql = "INSERT INTO venta(idEmpleado,IdCliente,serie_comprobante,fecha,impuesto,total,estado,idComprobante)values(?,?,?,?,?,?,?,?)";
        try {
            //cn = con.conectar();
//            cn.setAutoCommit(false);
            cn = con.getConnection();
            ps = cn.prepareStatement(sql);
            //1: registrar la venta (el servidor asigna codigo)
            ps.setInt(1, venta.getIdEmpleados().getId_Empleados());
            ps.setInt(2, venta.getIdCliente().getIdCliente());
            ps.setString(3, venta.getNumeroSerie());
            ps.setString(4, venta.getFechaVenta());
            ps.setDouble(5, venta.getIgv());
            ps.setDouble(6, venta.getMontoventa());
            ps.setBoolean(7, venta.isEstado());
            ps.setInt(8, venta.getIdComprobante().getCodigo());
            ps.executeUpdate();

            //2. averiguar el codigo generado
            sql = "SELECT @@IDENTITY AS idventa";
            rs = ps.executeQuery(sql);
            rs.next();
            codigoVenta = rs.getInt("idventa");
            rs.close();
            //3. varias veces segun sea necesario
            //3.1 registar cada detalle
            for (DetalleVenta detalle : venta.getDetalleVentas()) {
                sql = "INSERT into detalle_ventas(idventa, idproducto, cantidad, precioventa) VALUES(" + codigoVenta + ", "
                        + detalle.getProducto().getId_Producto() + ","
                        + detalle.getCantidad() + ","
                        + detalle.getPrecioUnitario() + ")";

                ps.executeUpdate(sql);
            }
            cn.commit();
        } catch (Exception e) {
            System.err.println("Errorrr:" + e);
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
        List<Venta> ventas = new ArrayList<>();
        sql = "SELECT v.idventa, com.nombre,v.serie_comprobante,v.fecha,\n"
                + "v.total,c.nombres,e.nombres,v.estado FROM venta v ,empleado e ,cliente c \n"
                + ",comprobante com where v.idEmpleado = e.idEmpleado and v.IdCliente=c.idCliente and v.idComprobante=com.idComprobante";
        try {
            cn = con.getConnection();
            ps = cn.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                Venta venta = new Venta();
                venta.setIdventa(rs.getInt("v.idventa"));
                venta.setIdComprobante(new Comprobantes());
                venta.getIdComprobante().setNombre(rs.getString("com.nombre"));
                venta.setNumeroSerie(rs.getString("v.serie_comprobante"));
                venta.setFechaVenta(rs.getString("v.fecha"));
                venta.setMontoventa(rs.getDouble("v.total"));
                venta.setIdCliente(new Clientes());
                venta.getIdCliente().setNombres(rs.getString("c.nombres"));
                venta.setIdEmpleados(new Empleados());
                venta.getIdEmpleados().setNombre(rs.getString("e.nombres"));
                venta.setEstado(rs.getBoolean("v.estado"));
                ventas.add(venta);
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
        return ventas;
    }

    public List listarporCliente(int idC) throws Exception {
        List<Venta> ventas = new ArrayList<>();
        sql = "SELECT v.idventa, com.nombre, v.serie_comprobante,v.fecha,\n"
                + "v.total,c.nombres, e.nombres,v.estado\n"
                + "FROM venta v INNER JOIN empleado e INNER JOIN cliente c\n"
                + "INNER JOIN comprobante com on v.idEmpleado=e.idEmpleado\n"
                + "and v.IdCliente=c.idCliente and v.idComprobante=com.idComprobante\n"
                + "WHERE v.idCliente=" + idC;
        try {
            cn = con.getConnection();
            ps = cn.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                Venta venta = new Venta();
                venta.setIdventa(rs.getInt("v.idventa"));
                venta.setIdComprobante(new Comprobantes());
                venta.getIdComprobante().setNombre(rs.getString("com.nombre"));
                venta.setNumeroSerie(rs.getString("v.serie_comprobante"));
                venta.setFechaVenta(rs.getString("v.fecha"));
                venta.setMontoventa(rs.getDouble("v.total"));
                venta.setIdCliente(new Clientes());
                venta.getIdCliente().setNombres(rs.getString("c.nombres"));
                venta.setIdEmpleados(new Empleados());
                venta.getIdEmpleados().setNombre(rs.getString("e.nombres"));
                venta.setEstado(rs.getBoolean("v.estado"));
                ventas.add(venta);
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
        return ventas;
    }

    public List listarporEmpleado(int idE) throws Exception {
        List<Venta> ventas = new ArrayList<>();
        sql = "SELECT v.idventa, com.nombre, v.serie_comprobante,v.fecha,\n"
                + "v.total,c.nombres, e.nombres,v.estado\n"
                + "FROM venta v INNER JOIN empleado e INNER JOIN cliente c\n"
                + "INNER JOIN comprobante com on v.idEmpleado=e.idEmpleado\n"
                + "and v.IdCliente=c.idCliente and v.idComprobante=com.idComprobante\n"
                + "WHERE v.idEmpleado=" + idE;
        try {
            cn = con.getConnection();
            ps = cn.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                Venta venta = new Venta();
                venta.setIdventa(rs.getInt("v.idventa"));
                venta.setIdComprobante(new Comprobantes());
                venta.getIdComprobante().setNombre(rs.getString("com.nombre"));
                venta.setNumeroSerie(rs.getString("v.serie_comprobante"));
                venta.setFechaVenta(rs.getString("v.fecha"));
                venta.setMontoventa(rs.getDouble("v.total"));
                venta.setIdCliente(new Clientes());
                venta.getIdCliente().setNombres(rs.getString("c.nombres"));
                venta.setIdEmpleados(new Empleados());
                venta.getIdEmpleados().setNombre(rs.getString("e.nombres"));
                venta.setEstado(rs.getBoolean("v.estado"));
                ventas.add(venta);
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
        return ventas;
    }

    public List listarporFechas(String f1, String f2) throws Exception {
        List<Venta> ventas = new ArrayList<>();
        sql = "SELECT v.idventa, com.nombre, v.serie_comprobante,v.fecha,\n"
                + "v.total,c.nombres, e.nombres,v.estado\n"
                + "FROM venta v INNER JOIN empleado e INNER JOIN cliente c\n"
                + "INNER JOIN comprobante com on v.idEmpleado=e.idEmpleado\n"
                + "and v.IdCliente=c.idCliente and v.idComprobante=com.idComprobante\n"
                + "WHERE v.fecha \n"
                + "BETWEEN '" + f1 + "' and '" + f2 + "'";
        try {
            cn = con.getConnection();
            ps = cn.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                Venta venta = new Venta();
                venta.setIdventa(rs.getInt("v.idventa"));
                venta.setIdComprobante(new Comprobantes());
                venta.getIdComprobante().setNombre(rs.getString("com.nombre"));
                venta.setNumeroSerie(rs.getString("v.serie_comprobante"));
                venta.setFechaVenta(rs.getString("v.fecha"));
                venta.setMontoventa(rs.getDouble("v.total"));
                venta.setIdCliente(new Clientes());
                venta.getIdCliente().setNombres(rs.getString("c.nombres"));
                venta.setIdEmpleados(new Empleados());
                venta.getIdEmpleados().setNombre(rs.getString("e.nombres"));
                venta.setEstado(rs.getBoolean("v.estado"));
                ventas.add(venta);
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
        return ventas;
    }

    public void cambiarVigencia(Venta venta) throws Exception {
        String sql = "UPDATE venta SET estado = "
                + (venta.isEstado() == true ? "1" : "0")
                + " WHERE idventa = " + venta.getIdventa();
        try {
            this.conectar(false);
            this.ejecutarOrden(sql);
            this.cerrar(true);
        } catch (Exception e) {
            throw e;
        } finally {
        }

    }

//    public List<DetalleVenta> listarDetalles() throws Exception {
//        List<DetalleVenta> detalles;
//        DetalleVenta det;
//        Conexion con;
//        Connection cn = null;
//        Statement st = null;
//        ResultSet rs = null;
//        String sql = "Select P.nombre, DV.cantidad, DV.precioUnitario, M.marca, C.categoria "
//                + "from Producto P inner join Detalle_Venta DV on P.idProducto = DV.idProducto inner join Marca M on M.idMarca = P.idMarca inner join Categoria C "
//                + "on C.idCategoria = P.idCategoria";
//
//        con = new Conexion();
//        try {
//            // cn = con.conectar();
//            st = cn.createStatement();
//            rs = st.executeQuery(sql);
//            detalles = new ArrayList<>();
//            while (rs.next() == true) {
//                det = new DetalleVenta();
//                det.setProducto(new Productos());
//                det.getProducto().setNombre(rs.getString("Nombre"));
//                det.setCantidad(rs.getInt("Cantidad"));
//                det.setPrecioUnitario(rs.getDouble("PrecioUnitario"));
//
//                detalles.add(det);
//            }
//        } catch (Exception e) {
//            throw e;
//        } finally {
//            if (rs != null && rs.isClosed() == false) {
//                rs.close();
//            }
//            rs = null;
//            if (st != null && st.isClosed() == false) {
//                st.close();
//            }
//            st = null;
//            if (cn != null && cn.isClosed() == false) {
//                cn.close();
//            }
//            cn = null;
//        }
//        return detalles;
//    }
    public List<DetalleVenta> listarDetalles(Venta venta) throws Exception {
        List<DetalleVenta> detalles = new ArrayList<>();
        DetalleVenta det;
        ResultSet rs = null;
        String sql = "SELECT P.nombre as Producto, P.foto, DV.cantidad, DV.precioVenta, SUM( DV.cantidad * DV.precioVenta) AS Total "
                + "FROM venta v INNER JOIN detalle_ventas DV INNER JOIN Producto P "
                + "on v.idventa=dv.idventa and P.idProducto=DV.idproducto  "
                + "WHERE V.estado = 1 and DV.idventa = '" + venta.getIdventa() + "'"
                + "GROUP BY p.nombre, P.foto, dv.cantidad, dv.precioventa";

        try {
            this.conectar(false);
            rs = this.ejecutarOrdenDatos(sql);
            detalles = new ArrayList<>();
            while (rs.next() == true) {
                det = new DetalleVenta();
                det.setProducto(new Productos());
                det.getProducto().setNombre(rs.getString("Producto"));
                det.getProducto().setImagen(rs.getString("foto"));
                det.setCantidad(rs.getInt("cantidad"));
                det.setPrecioUnitario(rs.getDouble("precioVenta"));
                //det.setTotal(rs.getDouble("Total"));
                detalles.add(det);
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
        return detalles;
    }

    public List<Venta> listarProductosPorCategoria(Categorias categoria) throws Exception {

        List<Venta> prods;
        Venta prod;
        ResultSet rs = null;
        String sql = "SELECT v.idventa, com.nombre, v.serie_comprobante,v.fecha, v.total, c.nombres, e.nombres, v.estado\n"
                + "FROM venta v INNER JOIN empleado e INNER JOIN cliente c\n"
                + "INNER JOIN comprobante com INNER JOIN producto p INNER JOIN detalle_ventas dv on v.idEmpleado=e.idEmpleado\n"
                + "and v.IdCliente=c.idCliente and v.idComprobante=com.idComprobante and v.idventa = dv.idventa and p.idProducto = dv.idproducto\n"
                + "WHERE v.estado = 1 and p.idCategoria = " + categoria.getCodigo();

        try {
            this.conectar(false);
            rs = this.ejecutarOrdenDatos(sql);
            prods = new ArrayList<>();
            while (rs.next() == true) {
                prod = new Venta();
                prod.setIdventa(rs.getInt("v.idventa"));
                prod.setIdComprobante(new Comprobantes());
                prod.getIdComprobante().setNombre(rs.getString("com.nombre"));
                prod.setNumeroSerie(rs.getString("v.serie_comprobante"));
                prod.setFechaVenta(rs.getString("v.fecha"));
                prod.setMontoventa(rs.getDouble("v.total"));
                prod.setIdCliente(new Clientes());
                prod.getIdCliente().setNombres(rs.getString("c.nombres"));
                prod.setIdEmpleados(new Empleados());
                prod.getIdEmpleados().setNombre(rs.getString("e.nombres"));
                prod.setEstado(rs.getBoolean("v.estado"));
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

    public List<Venta> listarVigentes(String tipoDoc) throws Exception {
        List<Venta> tipodoc = null;
        Venta tp;
        ResultSet rs = null;
        String sql = "SELECT v.idventa, com.nombre, v.serie_comprobante,v.fecha,\n"
                + "v.total,c.nombres, e.nombres,v.estado\n"
                + "FROM venta v INNER JOIN empleado e INNER JOIN cliente c\n"
                + "INNER JOIN comprobante com on v.idEmpleado=e.idEmpleado\n"
                + "and v.IdCliente=c.idCliente and v.idComprobante=com.idComprobante\n"
                + "WHERE v.idComprobante=" + tipoDoc;

        try {
            this.conectar(false);
            rs = this.ejecutarOrdenDatos(sql);
            tipodoc = new ArrayList<>();
            while (rs.next() == true) {
                tp = new Venta();
                tp.setIdventa(rs.getInt("v.idventa"));
                tp.setIdComprobante(new Comprobantes());
                tp.getIdComprobante().setNombre(rs.getString("com.nombre"));
                tp.setNumeroSerie(rs.getString("v.serie_comprobante"));
                tp.setFechaVenta(rs.getString("v.fecha"));
                tp.setMontoventa(rs.getDouble("v.total"));
                tp.setIdCliente(new Clientes());
                tp.getIdCliente().setNombres(rs.getString("c.nombres"));
                tp.setIdEmpleados(new Empleados());
                tp.getIdEmpleados().setNombre(rs.getString("e.nombres"));
                tp.setEstado(rs.getBoolean("v.estado"));
                tipodoc.add(tp);
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
        return tipodoc;
    }

    public List<Venta> contarTotalDeVentas() throws Exception {
        List<Venta> ventas;
        Venta vta;
        ResultSet rs = null;
        String sql = "SELECT COUNT(idventa) as total FROM venta WHERE estado=1";

        try {
            this.conectar(false);
            rs = this.ejecutarOrdenDatos(sql);
            ventas = new ArrayList<>();
            while (rs.next() == true) {
                vta = new Venta();
                vta.setContar(rs.getInt("total"));
                ventas.add(vta);
            }
        } catch (Exception e) {
            throw e;
        } finally {
            if (rs != null && rs.isClosed() == false) {
                rs.close();
            }
            rs = null;
        }
        return ventas;
    }

    
}
