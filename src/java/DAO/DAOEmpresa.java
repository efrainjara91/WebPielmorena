package DAO;

import Config.Conexion;
import Modelo.Empleados;
import Modelo.Empresa;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class DAOEmpresa   
        extends Conexion{

    public void registrar(Empresa empresa) throws Exception {
        Conexion con;
        Connection cn = null;
        Statement st = null;
        String sql;

        sql = "INSERT INTO Empresa (nombre_empresa, direccion, telefono, impuesto, porcentaje_impuesto, vigencia) "
                + "VALUES('" + empresa.getNombre() + "', '"
                + empresa.getDireccion() + "', '"
                + empresa.getTelefono() + "', '"
                + empresa.getImpuesto() + "', "
                + empresa.getPorcentaje() + ", "
                + (empresa.isVigencia() == true ? "1" : "0") + ")";

        con = new Conexion();
        try {
           // cn = con.conectar();
            st = cn.createStatement();
            st.executeUpdate(sql);
        } catch (Exception e) {
            throw e;
        } finally {
            if (st != null && st.isClosed() == false) {
                st.close();
            }
            st = null;
            if (cn != null && cn.isClosed() == false) {
                cn.close();
            }
            cn = null;
        }
    }
    
    public void actualizar(Empresa empresa) throws Exception{
        Conexion con;
        Connection cn = null;
        Statement st =  null; 
        String sql;
        
        sql = "UPDATE Empresa SET nombre_empresa = '"+empresa.getNombre()
                +"', direccion = '" +empresa.getDireccion()
                +"', telefono = '" +empresa.getTelefono()
                +"', impuesto = '" +empresa.getImpuesto()
                +"', porcentaje_impuesto = " +empresa.getPorcentaje()
                +", vigencia = " +(empresa.isVigencia() == true ? "1" : "0")
                +" WHERE idEmpresa = "+empresa.getCodigo();
        
        con = new Conexion();
        try{
           // cn = con.conectar();
            st = cn.createStatement();
            st.executeUpdate(sql);
        }catch (Exception e){
            throw e;
        }finally{
            if (st!=null && st.isClosed()==false) {
                st.close();
            }
            st = null;
            if (cn!=null && cn.isClosed()==false) {
                cn.close();
            }
            cn = null;
        }
    }
    public Empresa leer(Empresa empresa) throws Exception{
        Empresa emp = null;
        Conexion con;
        Connection cn = null;
        Statement st = null;
        ResultSet rs = null;
        String sql ="SELECT E.nombre_empresa, E.direccion, E.telefono, E.impuesto, E.porcentaje_impuesto, E.vigencia "
                + "FROM Empresa E WHERE E.idEmpresa = "+ empresa.getCodigo();
        
        con = new Conexion();
        try{
           // cn = con.conectar();
            st = cn.createStatement();
            rs = st.executeQuery(sql);
            if(rs.next() == true){
                emp = new Empresa();
                emp.setCodigo(empresa.getCodigo());
                emp.setNombre(rs.getString("nombre_empresa"));
                emp.setDireccion(rs.getString("direccion"));
                emp.setTelefono(rs.getString("telefono"));
                emp.setImpuesto(rs.getString("impuesto"));
                emp.setPorcentaje(rs.getDouble("porcentaje_impuesto"));
                emp.setVigencia(rs.getBoolean("vigencia"));
            }
        }catch (Exception e){
            throw e;
        }finally{
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
        return emp;
    }

    public List<Empresa> listar() throws Exception {
        List<Empresa> empresa;
        Empresa empr;
        Conexion con;
        Connection cn = null;
        Statement st = null;
        ResultSet rs = null;
        String sql = "SELECT E.idEmpresa, E.nombre_empresa, E.direccion,E.telefono,E.impuesto,E.porcentaje_impuesto, "
                + "E.vigencia, E.idEmpleado as Empleado FROM Empresa E ORDER BY E.nombre_empresa";

        con = new Conexion();
        try {
          //  cn = con.conectar();
            st = cn.createStatement();
            rs = st.executeQuery(sql);
            empresa = new ArrayList<>();
            while (rs.next() == true) {
                empr = new Empresa();
                empr.setCodigo(rs.getInt("idEmpresa"));
                empr.setNombre(rs.getString("nombre_empresa"));
                empr.setDireccion(rs.getString("direccion"));
                empr.setTelefono(rs.getString("telefono"));
                empr.setImpuesto(rs.getString("impuesto"));
                empr.setPorcentaje(rs.getDouble("porcentaje_impuesto"));
                empr.setEmpleado(new Empleados());
                empr.getEmpleado().setNombre(rs.getString("Empleado"));
                empr.setVigencia(rs.getBoolean("Vigencia"));
                empresa.add(empr);
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
        return empresa;
    }
}
