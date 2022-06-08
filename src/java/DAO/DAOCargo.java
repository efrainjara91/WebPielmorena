package DAO;

import Config.Conexion;
import Modelo.Cargos;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class DAOCargo
        extends Conexion {

    public void registrar(Cargos cargos) throws Exception {
        String sql;

        sql = "INSERT INTO cargo (nombreCargo, vigencia) "
                + "VALUES('" + cargos.getDescripcion() + "',"
                + (cargos.isVigencia() == true ? "1" : "0") + ")";

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
    public Cargos leer(Cargos cargos) throws Exception {
        Cargos cat = null;
        ResultSet rs = null;
        String sql = "SELECT nombreCargo, vigencia FROM cargo  WHERE idCargo = " + cargos.getCodigo();

        try {
            this.conectar(false);
            rs = this.ejecutarOrdenDatos(sql);
            if (rs.next() == true) {
                cat = new Cargos();
                cat.setCodigo(cargos.getCodigo());
                cat.setDescripcion(rs.getString("nombreCargo"));
                cat.setVigencia(rs.getBoolean("vigencia"));
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
    
    public void actualizar(Cargos cargos) throws Exception {
        String sql;

        sql = "UPDATE cargo SET nombreCargo = '" + cargos.getDescripcion()
                + "', vigencia = " + (cargos.isVigencia() == true ? "1" : "0")
                + " WHERE idCargo = " + cargos.getCodigo();

        try {
            this.conectar(false);
            this.ejecutarOrden(sql);
        } catch (Exception e) {
            throw e;
        } finally {
        }
    }

    public List<Cargos> listar() throws Exception {
        List<Cargos> cargos;
        Cargos ca;
        ResultSet rs = null;
        String sql = "SELECT idCargo, nombreCargo, vigencia FROM cargo"
                + " ORDER BY idCargo";

        try {
            this.conectar(false);
            rs = this.ejecutarOrdenDatos(sql);
            cargos = new ArrayList<>();
            while (rs.next() == true) {
                ca = new Cargos();
                ca.setCodigo(rs.getInt("idCargo"));
                ca.setDescripcion(rs.getString("nombreCargo"));
                ca.setVigencia(rs.getBoolean("vigencia"));

                cargos.add(ca);
            }
        } catch (Exception e) {
            throw e;
        } finally {
            if (rs != null && rs.isClosed() == false) {
                rs.close();
            }
            rs = null;
        }
        return cargos;
    }
    
    public List<Cargos> listarVigente() throws Exception {
        List<Cargos> cargos;
        Cargos ca;
        ResultSet rs = null;
        String sql = "SELECT idCargo, nombreCargo, vigencia FROM cargo "
                + "WHERE vigencia = 1"
                + "ORDER BY idCargo";

        try {
            this.conectar(false);
            rs = this.ejecutarOrdenDatos(sql);
            cargos = new ArrayList<>();
            while (rs.next() == true) {
                ca = new Cargos();
                ca.setCodigo(rs.getInt("idCargo"));
                ca.setDescripcion(rs.getString("nombreCargo"));
                ca.setVigencia(rs.getBoolean("vigencia"));

                cargos.add(ca);
            }
        } catch (Exception e) {
            throw e;
        } finally {
            if (rs != null && rs.isClosed() == false) {
                rs.close();
            }
            rs = null;
        }
        return cargos;
    }

}
