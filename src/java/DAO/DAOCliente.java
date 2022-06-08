package DAO;

import Config.Conexion;
import Modelo.Clientes;
import Modelo.DocumentoIdentidad;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class DAOCliente
        extends Conexion {

    Connection con;
    Conexion cn = new Conexion();
    PreparedStatement ps;
    ResultSet rs;
    

    
    //Metodo para consultar si el email recibido ya esta registrado
    public boolean isEmailRegistered(String email) throws SQLException{
        String sql = "SELECT * FROM cliente WHERE correo_electrónico='"+email+"'";
        PreparedStatement ps = conexion.prepareStatement(sql);
        ResultSet rs = ps.executeQuery();
 
        return rs.next();
    }
  
    public void registrar(Clientes cliente) throws Exception {
        String sql;
        sql = "INSERT INTO cliente (nombres, direccion, apellido_paterno, apellido_materno, correo_electrónico,clave, numIdentificación, genero, celular,fecha_nacimiento,estado,idDocumentoIdentidad) "
                + "VALUES('" + cliente.getNombres() + "', '"
                + cliente.getDirección()+ "', '"
                + cliente.getApellido_paterno() + "', '"
                + cliente.getApellido_materno() + "', '"
                + cliente.getCorreo_electrónico() + "', '"
                + cliente.getClave() + "', '"
                + cliente.getNumIdentificación() + "', '"
                + cliente.getGenero() + "', '"
                + cliente.getCelular() + "', '"
                + cliente.getFecha_nacimiento() + "', "
                + (cliente.isEstado() == true ? "1" : "0")
                + ", " + cliente.getDocumentoIdentidad().getCodigo() + ")";
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

    public void actualizar(Clientes clientes) throws Exception {
        String sql;

        sql = "UPDATE Cliente SET nombres = '" + clientes.getNombres()
                + "', apellido_paterno = '" + clientes.getApellido_paterno()
                + "', direccion = '" + clientes.getDirección()
                + "', apellido_materno = '" + clientes.getApellido_materno()
                + "', correo_electrónico = '" + clientes.getCorreo_electrónico()
                + "', clave = '" + clientes.getClave()
                + "', numIdentificación = '" + clientes.getNumIdentificación()
                + "', genero = '" + clientes.getGenero()
                + "', celular = '" + clientes.getCelular()
                + "', fecha_nacimiento = '" + clientes.getFecha_nacimiento()
                + "', estado = " + (clientes.isEstado() == true ? "1" : "0")
                + ", idDocumentoIdentidad =  " + clientes.getDocumentoIdentidad().getCodigo()
                + " WHERE idCliente = " + clientes.getIdCliente();

        try {
            this.conectar(false);
            this.ejecutarOrden(sql);
        } catch (Exception e) {
            throw e;
        } finally {
        }
    }

    public Clientes leer(Clientes clientes) throws Exception {
        Clientes cli = null;
        ResultSet rs = null;
        String sql = "SELECT C.nombres,C.apellido_paterno,C.apellido_materno,C.direccion,C.correo_electrónico,C.clave,C.numIdentificación, "
                + "C.genero,C.celular,C.fecha_nacimiento,C.estado,C.idDocumentoIdentidad FROM cliente C "
                + "where C.idCliente = " + clientes.getIdCliente();
        try {
            this.conectar(false);
            rs = this.ejecutarOrdenDatos(sql);
            if (rs.next() == true) {
                cli = new Clientes();
                cli.setIdCliente(clientes.getIdCliente());
                cli.setNombres(rs.getString("nombres"));
                cli.setApellido_paterno(rs.getString("apellido_paterno"));
                cli.setApellido_materno(rs.getString("apellido_materno"));
                cli.setDirección(rs.getString("direccion"));
                cli.setCorreo_electrónico(rs.getString("correo_electrónico"));
                cli.setClave(rs.getString("clave"));
                cli.setNumIdentificación(rs.getString("numIdentificación"));
                cli.setGenero(rs.getString("genero"));
                cli.setCelular(rs.getString("celular"));
                cli.setFecha_nacimiento(rs.getString("fecha_nacimiento"));
                cli.setEstado(rs.getBoolean("estado"));
                cli.setDocumentoIdentidad(new DocumentoIdentidad());
                cli.getDocumentoIdentidad().setCodigo(rs.getInt("idDocumentoIdentidad"));
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

        return cli;
    }

    public List<Clientes> listar() throws Exception {
        List<Clientes> clientes;
        Clientes cli;
        ResultSet rs = null;
        String sql = "SELECT C.idCliente,C.nombres,C.apellido_paterno,C.apellido_materno,C.correo_electrónico,C.direccion,C.clave,"
                + "C.numIdentificación, C.genero,C.celular,C.fecha_nacimiento,C.estado FROM cliente C";

        
//         String sql = "SELECT C.idCliente,C.nombres,C.apellido_paterno,C.apellido_materno,C.correo_electrónico,C.clave,"
//                + "C.numIdentificación, C.genero,C.celular,C.fecha_nacimiento,C.estado,D.nombre as Documento  FROM cliente C INNER JOIN documentoidentidad D on C.idDocumentoIdentidad = D.idDocumentoIdentidad";

        try {
            this.conectar(false);
            rs = this.ejecutarOrdenDatos(sql);
            clientes = new ArrayList<>();
            while (rs.next() == true) {
                cli = new Clientes();
                cli.setIdCliente(rs.getInt("idCliente"));
                cli.setNombres(rs.getString("nombres"));
                cli.setApellido_paterno(rs.getString("apellido_paterno"));
                cli.setApellido_materno(rs.getString("apellido_materno"));
                cli.setCorreo_electrónico(rs.getString("correo_electrónico"));
                cli.setDirección(rs.getString("direccion"));
                cli.setClave(rs.getString("clave"));
                cli.setNumIdentificación(rs.getString("numIdentificación"));
                cli.setGenero(rs.getString("genero"));
                cli.setCelular(rs.getString("celular"));
                cli.setFecha_nacimiento(rs.getString("fecha_nacimiento"));
                cli.setEstado(rs.getBoolean("estado"));
//                cli.setDocumentoIdentidad(new DocumentoIdentidad());
//                cli.getDocumentoIdentidad().setNombre(rs.getString("Documento"));
                clientes.add(cli);
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
        return clientes;
    }
    public List<Clientes> listarActivos() throws Exception {
        List<Clientes> clientes;
        Clientes cli;
        ResultSet rs = null;
        String sql = "SELECT C.idCliente,C.nombres,C.apellido_paterno,C.apellido_materno,C.correo_electrónico,C.direccion,C.clave,"
                + "C.numIdentificación, C.genero,C.celular,C.fecha_nacimiento,C.estado FROM cliente C where C.estado=1";

        
//         String sql = "SELECT C.idCliente,C.nombres,C.apellido_paterno,C.apellido_materno,C.correo_electrónico,C.clave,"
//                + "C.numIdentificación, C.genero,C.celular,C.fecha_nacimiento,C.estado,D.nombre as Documento  FROM cliente C INNER JOIN documentoidentidad D on C.idDocumentoIdentidad = D.idDocumentoIdentidad";

        try {
            this.conectar(false);
            rs = this.ejecutarOrdenDatos(sql);
            clientes = new ArrayList<>();
            while (rs.next() == true) {
                cli = new Clientes();
                cli.setIdCliente(rs.getInt("idCliente"));
                cli.setNombres(rs.getString("nombres"));
                cli.setApellido_paterno(rs.getString("apellido_paterno"));
                cli.setApellido_materno(rs.getString("apellido_materno"));
                cli.setCorreo_electrónico(rs.getString("correo_electrónico"));
                cli.setDirección(rs.getString("direccion"));
                cli.setClave(rs.getString("clave"));
                cli.setNumIdentificación(rs.getString("numIdentificación"));
                cli.setGenero(rs.getString("genero"));
                cli.setCelular(rs.getString("celular"));
                cli.setFecha_nacimiento(rs.getString("fecha_nacimiento"));
                cli.setEstado(rs.getBoolean("estado"));
//                cli.setDocumentoIdentidad(new DocumentoIdentidad());
//                cli.getDocumentoIdentidad().setNombre(rs.getString("Documento"));
                clientes.add(cli);
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
        return clientes;
    }

    public Clientes Validar(String email, String pass) {
        String sql = "select * from cliente where correo_electrónico=? and clave=?";
        Clientes c = new Clientes();
        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            ps.setString(1, email);
            ps.setString(2, pass);
            rs = ps.executeQuery();
            while (rs.next()) {
                c.setIdCliente(rs.getInt(1));
                c.setNumIdentificación(rs.getString(2));
                c.setNombres(rs.getString(3));
                c.setDirección(rs.getString(4));
                c.setCorreo_electrónico(rs.getString(5));
                c.setClave(rs.getString(6));
            }
        } catch (Exception e) {
        }
        return c;
    }

    public int AgregarCliente(Clientes c) {
        String sql = "INSERT INTO cliente (numIdentificación, nombres, direccion, correo_electrónico, clave, estado, apellido_paterno, apellido_materno, genero, celular, fecha_nacimiento)values(?,?,?,?,?,?)";
        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            ps.setString(1, c.getNumIdentificación());
            ps.setString(2, c.getNombres());
            ps.setString(3, c.getDirección());
            ps.setString(4, c.getCorreo_electrónico());
            ps.setString(5, c.getClave());
            ps.setBoolean(6, c.isEstado());
            ps.executeUpdate();
        } catch (Exception e) {
        }
        return 1;
    }

    public void cambiarVigencia(Clientes cli) throws Exception {
        String sql = "UPDATE cliente SET estado = "
                + (cli.isEstado() == true ? "1" : "0")
                + " WHERE idCliente = " + cli.getIdCliente();
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
