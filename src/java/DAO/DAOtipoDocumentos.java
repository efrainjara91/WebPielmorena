package DAO;

import Config.Conexion;
import Modelo.DocumentoIdentidad;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class DAOtipoDocumentos
        extends Conexion {

    public void registrar(DocumentoIdentidad documentoIdentidad) throws Exception {
        String sql;

        sql = "INSERT INTO documentoidentidad (nombre)"
                + "VALUES('" + documentoIdentidad.getNombre() + "')";

        try {
            this.conectar(false);
            this.ejecutarOrden(sql);
        } catch (Exception e) {
            throw e;
        } finally {
        }
    }

    public void actualizar(DocumentoIdentidad documentoIdentidad) throws Exception {
        String sql;

        sql = "UPDATE documentoidentidad SET nombre = '" + documentoIdentidad.getNombre() + "' WHERE idDocumentoIdentidad = " + documentoIdentidad.getCodigo();

        try {
            this.conectar(false);
            this.ejecutarOrden(sql);
        } catch (Exception e) {
            throw e;
        } finally {

        }
    }
    
    
    public DocumentoIdentidad leer(DocumentoIdentidad documentoIdentidad) throws Exception {
        DocumentoIdentidad doc = null;
        ResultSet rs = null;
        String sql = "SELECT nombre FROM documentoidentidad  WHERE idDocumentoIdentidad = " + documentoIdentidad.getCodigo();

        try{
            this.conectar(false);
            rs = this.ejecutarOrdenDatos(sql);
            if (rs.next() == true) {
                doc = new DocumentoIdentidad();
                doc.setCodigo(documentoIdentidad.getCodigo());
                doc.setNombre(rs.getString("nombre"));
            }
        } catch (Exception e) {
            throw e;
        }finally{
            if (rs != null && rs.isClosed() == false) {
                rs.close();
            }
            rs = null;
            }
        return doc;

    }
    
    public List<DocumentoIdentidad> listar() throws Exception {
        List<DocumentoIdentidad> documentos;
        DocumentoIdentidad doc;
        ResultSet rs = null;
        String sql = "SELECT idDocumentoIdentidad, nombre FROM documentoidentidad ORDER BY idDocumentoIdentidad";        
        try {
       this.conectar(false);
            rs = this.ejecutarOrdenDatos(sql);         
            documentos = new ArrayList<>();
            while (rs.next() == true) {
                doc = new DocumentoIdentidad();
                doc.setCodigo(rs.getInt("idDocumentoIdentidad"));
                doc.setNombre(rs.getString("nombre"));
                documentos.add(doc);
            }
  }catch (Exception e){
            throw e;
        }finally{
            if (rs != null && rs.isClosed() == false) {
                rs.close();
            }
            rs = null;
        }
        return documentos;
    }
     public void eliminar(String id) throws Exception {
    String sql;

    sql = "DELETE FROM documentoidentidad WHERE idDocumentoIdentidad = " +id;

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
