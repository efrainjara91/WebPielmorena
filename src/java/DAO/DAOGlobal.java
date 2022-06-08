package DAO;

import Config.Conexion;
import Modelo.Global;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class DAOGlobal
        extends Conexion {

    public void actualizar(Global global) throws Exception {
        String sql;

        sql = "UPDATE global SET nombre_empresa = '" + global.getNombre_empresa()
                + "', nombre_impuesto= '" + global.getNombre_impuesto()
                + "', porcentaje_impuesto= "+ global.getPorcentaje_impuesto()
                + " WHERE idGlobal = " + global.getCodigo();

        try {
            this.conectar(false);
            this.ejecutarOrden(sql);
        } catch (Exception e) {
            throw e;
        } finally {

        }

    }
    public Global leer(Global global) throws Exception {
        Global cat = null;
        ResultSet rs = null;
        String sql = "SELECT nombre_empresa, nombre_impuesto,porcentaje_impuesto FROM global   WHERE idGlobal = " + global.getCodigo();

        try {
            this.conectar(false);
            rs = this.ejecutarOrdenDatos(sql);
            if (rs.next() == true) {
                cat = new Global();
                cat.setCodigo(global.getCodigo());
                cat.setNombre_empresa(rs.getString("nombre_empresa"));
                cat.setNombre_impuesto(rs.getString("nombre_impuesto"));
                cat.setPorcentaje_impuesto(rs.getDouble("porcentaje_impuesto"));
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
    
     public List<Global> listar() throws Exception {
       List<Global> global;
        Global glob;
        ResultSet rs = null;
        String sql = "SELECT idGlobal,nombre_empresa, nombre_impuesto,porcentaje_impuesto FROM global ORDER BY idGlobal";

        try {
            this.conectar(false);
            rs = this.ejecutarOrdenDatos(sql);
            global = new ArrayList<>();
            while (rs.next() == true) {
                glob = new Global();
                glob.setCodigo(rs.getInt("idGlobal"));
                glob.setNombre_empresa(rs.getString("nombre_empresa"));
                glob.setNombre_impuesto(rs.getString("nombre_impuesto"));
                glob.setPorcentaje_impuesto(rs.getDouble("porcentaje_impuesto"));
             
                global.add(glob);
            }
        } catch (Exception e) {
            throw e;
        } finally {
            if (rs != null && rs.isClosed() == false) {
                rs.close();
            }
            rs = null;
        }
        return global;
    }
}
