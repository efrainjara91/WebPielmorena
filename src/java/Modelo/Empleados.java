
package Modelo;

public class Empleados {
   private int Id_Empleados;
   private String Nombre;
   private String Apellidos;
   private String numDocumento;
   private String Celular;
   private String Direccion;
   private String NombreUsuario;
   private String Clave;
   private boolean Vigencia;
   private DocumentoIdentidad documentoIdentidad;
   private Cargos cargo;

   public String getNombreCompleto(){
       return this.Nombre+" "+this.Apellidos;
   }
   
    public int getId_Empleados() {
        return Id_Empleados;
    }

    public void setId_Empleados(int Id_Empleados) {
        this.Id_Empleados = Id_Empleados;
    }

    public String getNombre() {
        return Nombre;
    }

    public void setNombre(String Nombre) {
        this.Nombre = Nombre;
    }

    public String getApellidos() {
        return Apellidos;
    }

    public void setApellidos(String Apellidos) {
        this.Apellidos = Apellidos;
    }

    public String getNumDocumento() {
        return numDocumento;
    }

    public void setNumDocumento(String numDocumento) {
        this.numDocumento = numDocumento;
    }

    public DocumentoIdentidad getDocumentoIdentidad() {
        return documentoIdentidad;
    }

    public void setDocumentoIdentidad(DocumentoIdentidad documentoIdentidad) {
        this.documentoIdentidad = documentoIdentidad;
    }

 

    public String getCelular() {
        return Celular;
    }

    public void setCelular(String Celular) {
        this.Celular = Celular;
    }

    public String getDireccion() {
        return Direccion;
    }

    public void setDireccion(String Direccion) {
        this.Direccion = Direccion;
    }

    public String getNombreUsuario() {
        return NombreUsuario;
    }

    public void setNombreUsuario(String NombreUsuario) {
        this.NombreUsuario = NombreUsuario;
    }

    public String getClave() {
        return Clave;
    }

    public void setClave(String Clave) {
        this.Clave = Clave;
    }

    public boolean isVigencia() {
        return Vigencia;
    }

    public void setVigencia(boolean Vigencia) {
        this.Vigencia = Vigencia;
    }

    public Cargos getCargo() {
        return cargo;
    }

    public void setCargo(Cargos cargo) {
        this.cargo = cargo;
    }
    
     
}
