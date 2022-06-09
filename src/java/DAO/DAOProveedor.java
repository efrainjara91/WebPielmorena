package DAO;

import Config.Conexion;
import Modelo.Proveedor;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class DAOProveedor extends Conexion {

    Connection con;
    Conexion cn = new Conexion();
    PreparedStatement ps;
    ResultSet rs;

    public void registrar(Proveedor proveedor) throws Exception {
        String sql;

        sql = "INSERT INTO proveedor (NombreProveedor, nombreRrepresentante, cargo, tipoProveedor, telefono, RUC,direccion,estado) "
                + "VALUES('" + proveedor.getNombre() + "', '"
                + proveedor.getNombreRepresentante() + "', '"
                + proveedor.getCargo() + "', '"
                + proveedor.getTipoProveedor() + "', '"
                + proveedor.getTelefono() + "', '"
                + proveedor.getRUC() + "', '"
                + proveedor.getDireccion() + "',"
                + (proveedor.isEstado() == true ? "1" : "0") + ")";

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

    public Proveedor leer(Proveedor proveedor) throws Exception {
        Proveedor prov = null;
        ResultSet rs = null;
        String sql = "select p.NombreProveedor, p.nombreRrepresentante, p.cargo, p.tipoProveedor, p.telefono, p.RUC,p.direccion,p.estado from Proveedor P "
                + "where p.idProveedor = " + proveedor.getIdProveedor();

        try {
            this.conectar(false);
            rs = this.ejecutarOrdenDatos(sql);
            if (rs.next() == true) {
                prov = new Proveedor();
                prov.setIdProveedor(proveedor.getIdProveedor());
                prov.setNombre(rs.getString("NombreProveedor"));
                prov.setNombreRepresentante(rs.getString("nombreRrepresentante"));
                prov.setCargo(rs.getString("cargo"));
                prov.setTipoProveedor(rs.getString("tipoProveedor"));
                prov.setTelefono(rs.getString("telefono"));
                prov.setRUC(rs.getString("RUC"));
                prov.setDireccion(rs.getString("direccion"));
                prov.setEstado(rs.getBoolean("estado"));

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

        return prov;
    }
    public List<Proveedor> listar() throws Exception {
        List<Proveedor> proveedor = null;
        Proveedor prov;
        ResultSet rs = null;
        String sql = "select P.idProveedor, P.NombreProveedor, P.nombreRrepresentante,P.tipoProveedor, P.telefono, P.RUC,P.direccion, P.estado from Proveedor P";
        try {
//            this.conectar(false);
//            rs = this.ejecutarOrdenDatos(sql);
            con = cn.getConnection();
            ps=con.prepareStatement(sql);
            rs=ps.executeQuery();
            proveedor = new ArrayList<>();
            while (rs.next() == true) {
                prov = new Proveedor();
                prov.setIdProveedor(rs.getInt("idProveedor"));
                prov.setNombre(rs.getString("NombreProveedor"));
                prov.setNombreRepresentante(rs.getString("nombreRrepresentante"));
                prov.setTipoProveedor(rs.getString("tipoProveedor"));
                prov.setTelefono(rs.getString("telefono"));
                prov.setRUC(rs.getString("RUC"));
                prov.setDireccion(rs.getString("direccion"));
                prov.setEstado(rs.getBoolean("estado"));
                proveedor.add(prov);
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
        return proveedor;
    }

    public List<Proveedor> listarActivos() throws Exception {
        List<Proveedor> proveedor = null;
        Proveedor prov;
        ResultSet rs = null;
        String sql = "select P.idProveedor, P.NombreProveedor, P.nombreRrepresentante,P.tipoProveedor, P.telefono, P.RUC,P.direccion, P.estado from Proveedor P where P.estado=1";
        try {
//            this.conectar(false);
//            rs = this.ejecutarOrdenDatos(sql);
            con = cn.getConnection();
            ps=con.prepareStatement(sql);
            rs=ps.executeQuery();
            proveedor = new ArrayList<>();
            while (rs.next() == true) {
                prov = new Proveedor();
                prov.setIdProveedor(rs.getInt("idProveedor"));
                prov.setNombre(rs.getString("NombreProveedor"));
                prov.setNombreRepresentante(rs.getString("nombreRrepresentante"));
                prov.setTipoProveedor(rs.getString("tipoProveedor"));
                prov.setTelefono(rs.getString("telefono"));
                prov.setRUC(rs.getString("RUC"));
                prov.setDireccion(rs.getString("direccion"));
                prov.setEstado(rs.getBoolean("estado"));
                proveedor.add(prov);
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
        return proveedor;
    }

    public void actualizar(Proveedor proveedor) throws Exception {
        String sql;

        sql = "UPDATE proveedor SET NombreProveedor = '" + proveedor.getNombre()
                + "', nombreRrepresentante = '" + proveedor.getNombreRepresentante()
                + "', cargo = '" + proveedor.getCargo()
                + "', tipoProveedor =  '" + proveedor.getTipoProveedor()
                + "', telefono =  '" + proveedor.getTelefono()
                + "', RUC =  '" + proveedor.getRUC()
                + "', direccion =  '" + proveedor.getDireccion()
                + "', estado = " + (proveedor.isEstado() == true ? "1" : "0")
                + " WHERE idProveedor = " + proveedor.getIdProveedor();

        try {
            this.conectar(false);
            this.ejecutarOrden(sql);
        } catch (Exception e) {
            throw e;
        } finally {
        }
    }
    
    public void cambiarVigencia(Proveedor prov) throws Exception {
        String sql = "UPDATE proveedor SET estado = "
                + (prov.isEstado()== true ? "1" : "0")
                + " WHERE idProveedor = " + prov.getIdProveedor();
        try {
            this.conectar(false);
            this.ejecutarOrden(sql);
            this.cerrar(true);
        } catch (Exception e) {
            throw e;
        } finally {
        }
    }
}
