package DAO;

import Config.Conexion;
import Modelo.Cargos;
import Modelo.DocumentoIdentidad;
import Modelo.Empleados;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class DAOEmpleado
        extends Conexion {

    public Empleados identificar(Empleados empleado) throws Exception {
        Empleados emp= new Empleados();
        ResultSet rs = null;
        String sql = "select E.idEmpleado, E.nombres, E.apellidos, E.numIdentificación, E.telefono, E.dirección, E.nombreUsuario, E.clave,E.estado, C.nombreCargo ,"
               + " D.nombre from Empleado E inner join cargo C on E.idCargo = C.idCargo INNER JOIN documentoidentidad D on E.idDocumentoIdentidad = D.idDocumentoIdentidad "
                + "WHERE E.estado = 1 AND E.clave = '"
                + empleado.getClave() + "' AND E.nombreUsuario = '" + empleado.getNombreUsuario()+ "'";
        try {
            this.conectar(false);
            rs = this.ejecutarOrdenDatos(sql);
            if (rs.next() == true) {               
                emp.setId_Empleados(rs.getInt("idEmpleado"));
                emp.setNombre(rs.getString("nombres"));
                emp.setApellidos(rs.getString("apellidos"));
                emp.setNumDocumento(rs.getString("numIdentificación"));
                emp.setCelular(rs.getString("telefono"));
                emp.setDireccion(rs.getString("dirección"));
                emp.setNombreUsuario(rs.getString("nombreUsuario"));
                emp.setClave(rs.getString("clave"));
                emp.setVigencia(rs.getBoolean("estado"));
                emp.setCargo(new Cargos());
                emp.getCargo().setDescripcion(rs.getString("nombreCargo"));
                emp.setDocumentoIdentidad(new DocumentoIdentidad());
                emp.getDocumentoIdentidad().setNombre(rs.getString("nombre"));
                
                emp.setVigencia(true);
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

        return emp;
    }

    public Empleados permiso(int idEmpleado) throws Exception {
        ResultSet rs = null;
        Empleados empleados = null;
        String sql = "Select E.nombres + ' ' +E.apellidos  as usuario, C.idCargo, C.nombreCargo "
                + "from Empleado E inner join Cargo C on E.idCargo = C.idCargo "
                + "where E.idEmpleado= " + idEmpleado + " and E.vigencia = 1";
        try {
            this.conectar(false);
            rs = this.ejecutarOrdenDatos(sql);
            if (rs.next() == true) {
                empleados = new Empleados();
                empleados.setNombreUsuario(rs.getString("usuario"));
                empleados.setCargo(new Cargos());
                empleados.getCargo().setDescripcion(rs.getString("nombreCargo"));
                empleados.setVigencia(true);
            }

        } catch (Exception e) {
            empleados = null;
            throw e;
        } finally {
            if (rs != null && rs.isClosed() == false) {
                rs.close();
            }
            rs = null;
        }
        return empleados;
    }

    public void actualizar(Empleados empleados) throws Exception {
        String sql;

        sql = "UPDATE empleado SET nombres = '" + empleados.getNombre()
                + "', apellidos = '" + empleados.getApellidos()
                + "', numIdentificación = '" + empleados.getNumDocumento()
                + "', telefono = '" + empleados.getCelular()
                + "', dirección = '" + empleados.getDireccion()
                + "', nombreUsuario = '" + empleados.getNombreUsuario()
                + "', clave = '" + empleados.getClave()
                + "', estado = " + (empleados.isVigencia() == true ? "1" : "0")
                + ", idCargo =  " + empleados.getCargo().getCodigo()
                + ", idDocumentoIdentidad =  " + empleados.getDocumentoIdentidad().getCodigo()
                + " WHERE idEmpleado = " + empleados.getId_Empleados();

      try {
            this.conectar(false);
            this.ejecutarOrden(sql);
        } catch (Exception e) {
            throw e;
        } finally {
        }
    }

    public Empleados leer(Empleados empleados) throws Exception {
        Empleados empl = null;
        ResultSet rs = null;
        String sql = "select p.nombres, p.apellidos, p.numIdentificación, p.telefono,p.dirección,p.nombreUsuario,p.clave,p.estado, p.idCargo, p.idDocumentoIdentidad from empleado p "
                + "where p.idEmpleado = " + empleados.getId_Empleados();

        try {
            this.conectar(false);
            rs = this.ejecutarOrdenDatos(sql);
            if (rs.next() == true) {
                empl = new Empleados();
                empl.setId_Empleados(empleados.getId_Empleados());
                empl.setNombre(rs.getString("nombres"));
                empl.setApellidos(rs.getString("apellidos"));
                empl.setNumDocumento(rs.getString("numIdentificación"));
                empl.setCelular(rs.getString("telefono"));
                empl.setDireccion(rs.getString("dirección"));
                empl.setNombreUsuario(rs.getString("nombreUsuario"));
                empl.setClave(rs.getString("clave"));
                empl.setVigencia(rs.getBoolean("estado"));
                empl.setCargo(new Cargos());
                empl.getCargo().setCodigo(rs.getInt("idCargo"));
                empl.setDocumentoIdentidad(new DocumentoIdentidad());
                empl.getDocumentoIdentidad().setCodigo(rs.getInt("idDocumentoIdentidad"));
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

        return empl;
    }

    public void registrar(Empleados empleado) throws Exception {
        String sql;
        sql = "INSERT INTO empleado (nombres, apellidos, numIdentificación,"
                + " telefono, dirección, nombreUsuario,"
                + " clave, estado, idCargo, idDocumentoIdentidad) "
                + "VALUES('" + empleado.getNombre() + "', '"
                + empleado.getApellidos() + "', '"
                + empleado.getNumDocumento() + "', '"
                + empleado.getCelular() + "', '"
                + empleado.getDireccion() + "', '"
                + empleado.getNombreUsuario() + "', '"
                + empleado.getClave() + "', "
                + (empleado.isVigencia() == true ? "1" : "0")
                + ", " + empleado.getCargo().getCodigo()
                + ", " + empleado.getDocumentoIdentidad().getCodigo() + ")";
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

    public List<Empleados> listar() throws Exception {
        List<Empleados> empleados;
        Empleados emp;
        ResultSet rs = null;
        String sql = "select E.idEmpleado, E.nombres, E.apellidos, E.numIdentificación, E.telefono, E.dirección, E.nombreUsuario, E.clave,E.estado, C.nombreCargo,"
                + "D.nombre from Empleado E inner join cargo C on E.idCargo = C.idCargo INNER JOIN documentoidentidad D on E.idDocumentoIdentidad = D.idDocumentoIdentidad";

        try {
            this.conectar(false);
            rs = this.ejecutarOrdenDatos(sql);
            empleados = new ArrayList<>();
            while (rs.next() == true) {
                emp = new Empleados();
                emp.setId_Empleados(rs.getInt("idEmpleado"));
                emp.setNombre(rs.getString("nombres"));
                emp.setApellidos(rs.getString("apellidos"));
                emp.setNumDocumento(rs.getString("numIdentificación"));
                emp.setCelular(rs.getString("telefono"));
                emp.setDireccion(rs.getString("dirección"));
                emp.setNombreUsuario(rs.getString("nombreUsuario"));
                emp.setClave(rs.getString("clave"));
                emp.setVigencia(rs.getBoolean("estado"));
                emp.setCargo(new Cargos());
                emp.getCargo().setDescripcion(rs.getString("nombreCargo"));
                emp.setDocumentoIdentidad(new DocumentoIdentidad());
                emp.getDocumentoIdentidad().setNombre(rs.getString("nombre"));
                empleados.add(emp);
            }
        } catch (Exception e) {
            throw e;
        } finally {
            if (rs != null && rs.isClosed() == false) {
                rs.close();
            }
            rs = null;
        }
        return empleados;
    }
      public void cambiarVigencia(Empleados empl) throws Exception {
        String sql = "UPDATE empleado SET estado = "
                    + (empl.isVigencia() == true ? "1" : "0")
                    + " WHERE idEmpleado = " + empl.getId_Empleados();
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
