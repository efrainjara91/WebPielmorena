package DAO;

import Config.Conexion;
import Modelo.Marcas;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class DAOMarca
        extends Conexion {

    public void registrar(Marcas marca) throws Exception {
        String sql;

        sql = "INSERT INTO Marca (Marca, Estado) "
                + "VALUES('" + marca.getNombre() + "',"
                + (marca.isVigencia() == true ? "1" : "0") + ")";

        try {
            this.conectar(false);
            this.ejecutarOrden(sql);
        } catch (Exception e) {
            throw e;
        } finally {
        }
    }

    public void actualizar(Marcas marca) throws Exception {
        String sql;

        sql = "UPDATE Marca SET Marca = '" + marca.getNombre()
                + "', Estado = " + (marca.isVigencia() == true ? "1" : "0")
                + " WHERE idMarca = " + marca.getId_Marca();

        try {
            this.conectar(false);
            this.ejecutarOrden(sql);
        } catch (Exception e) {
            throw e;
        } finally {

        }
    }

    public void cambiarVigencia(Marcas marc) throws Exception {
        String sql = "UPDATE marca SET estado = "
                + (marc.isVigencia() == true ? "1" : "0")
                + " WHERE idMarca = " + marc.getId_Marca();
        try {
            this.conectar(false);
            this.ejecutarOrden(sql);
            this.cerrar(true);
        } catch (Exception e) {
            throw e;
        } finally {
        }
    }

    public Marcas leer(Marcas marca) throws Exception {
        Marcas mar = null;
        ResultSet rs = null;
        String sql = "SELECT M.marca, M.estado FROM Marca M WHERE M.idMarca = " + marca.getId_Marca();

        try {
            this.conectar(false);
            rs = this.ejecutarOrdenDatos(sql);
            if (rs.next() == true) {
                mar = new Marcas();
                mar.setId_Marca(marca.getId_Marca());
                mar.setNombre(rs.getString("marca"));
                mar.setVigencia(rs.getBoolean("estado"));
            }
        } catch (Exception e) {
            throw e;
        } finally {
            if (rs != null && rs.isClosed() == false) {
                rs.close();
            }
            rs = null;
        }
        return mar;
    }

    public List<Marcas> listar() throws Exception {
        List<Marcas> marcas;
        Marcas mar;
        ResultSet rs = null;
        String sql = "SELECT M.idMarca, M.Marca, M.estado FROM Marca M ORDER BY M.idMarca";
        try {
            this.conectar(false);
            rs = this.ejecutarOrdenDatos(sql);
            marcas = new ArrayList<>();
            while (rs.next() == true) {
                mar = new Marcas();
                mar.setId_Marca(rs.getInt("idMarca"));
                mar.setNombre(rs.getString("Marca"));
                mar.setVigencia(rs.getBoolean("Estado"));
                marcas.add(mar);
            }
        } catch (Exception e) {
            throw e;
        } finally {
            if (rs != null && rs.isClosed() == false) {
                rs.close();
            }
            rs = null;
        }
        return marcas;
    }

    public List<Marcas> contarMarcas() throws Exception {
        List<Marcas> categorias;
        Marcas mar;
        ResultSet rs = null;
        String sql = "SELECT COUNT(idMarca) as Marca FROM marca WHERE estado=1";

        try {
            this.conectar(false);
            rs = this.ejecutarOrdenDatos(sql);
            categorias = new ArrayList<>();
            while (rs.next() == true) {
                mar = new Marcas();
                mar.setContar(rs.getInt("Marca"));
                categorias.add(mar);
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
}
