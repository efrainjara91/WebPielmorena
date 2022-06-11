package DAO;

import Config.Conexion;
import Modelo.Comprobantes;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class DAOComprobantes
        extends Conexion {

    public void registrar(Comprobantes comprobante) throws Exception {
        String sql;

        sql = "INSERT INTO comprobante (nombre)"
                + "VALUES('" + comprobante.getNombre() + "')";

        try {
            this.conectar(false);
            this.ejecutarOrden(sql);
        } catch (Exception e) {
            throw e;
        } finally {
        }
    }

    public void actualizar(Comprobantes comprobante) throws Exception {
        String sql;

        sql = "UPDATE comprobante SET nombre = '" + comprobante.getNombre() + "' WHERE idComprobante = " + comprobante.getCodigo();

        try {
            this.conectar(false);
            this.ejecutarOrden(sql);
        } catch (Exception e) {
            throw e;
        } finally {

        }
    }

    public Comprobantes leer(Comprobantes comprobantes) throws Exception {
        Comprobantes compr = null;
        ResultSet rs = null;
        String sql = "SELECT nombre FROM comprobante  WHERE idComprobante = " + comprobantes.getCodigo();

        try {
            this.conectar(false);
            rs = this.ejecutarOrdenDatos(sql);
            if (rs.next() == true) {
                compr = new Comprobantes();
                compr.setCodigo(comprobantes.getCodigo());
                compr.setNombre(rs.getString("nombre"));
            }
        } catch (Exception e) {
            throw e;
        } finally {
            if (rs != null && rs.isClosed() == false) {
                rs.close();
            }
            rs = null;
        }
        return compr;

    }

    public List<Comprobantes> listarCompTicket() throws Exception {
        List<Comprobantes> proveedor;
        Comprobantes compr;
        ResultSet rs = null;
        String sql = "SELECT * from comprobante c where c.idComprobante = 1 ";
        try {
            this.conectar(false);
            rs = this.ejecutarOrdenDatos(sql);
            proveedor = new ArrayList<>();
            while (rs.next() == true) {
                compr = new Comprobantes();
                compr.setCodigo(rs.getInt("idComprobante"));
                compr.setNombre(rs.getString("nombre"));
                proveedor.add(compr);
            }
        } catch (Exception e) {
            throw e;
        } finally {
            if (rs != null && rs.isClosed() == false) {
                rs.close();
            }
            rs = null;
        }
        return proveedor;
    }
     public List<Comprobantes> listar() throws Exception {
        List<Comprobantes> proveedor;
        Comprobantes compr;
        ResultSet rs = null;
        String sql = "SELECT * from comprobante ";
        try {
            this.conectar(false);
            rs = this.ejecutarOrdenDatos(sql);
            proveedor = new ArrayList<>();
            while (rs.next() == true) {
                compr = new Comprobantes();
                compr.setCodigo(rs.getInt("idComprobante"));
                compr.setNombre(rs.getString("nombre"));
                proveedor.add(compr);
            }
        } catch (Exception e) {
            throw e;
        } finally {
            if (rs != null && rs.isClosed() == false) {
                rs.close();
            }
            rs = null;
        }
        return proveedor;
    }

    public void eliminar(String id) throws Exception {
        String sql;

        sql = "DELETE FROM comprobante WHERE idComprobante = " + id;

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
}
