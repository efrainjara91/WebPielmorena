package Modelo;

public class Clientes {

    private int idCliente;
    private String nombres;
    private String apellido_paterno;
    private String apellido_materno;
    private String correo_electronico;
    private String clave;
    private String numIdentificación;
    private String genero;
    private String celular;
    private String fecha_nacimiento;
    private DocumentoIdentidad documentoIdentidad;
    private String dirección;
    private boolean Estado;
    private String doc;
    

    public Clientes() {
    }

    public Clientes(int idCliente, String nombres, String apellido_paterno, String apellido_materno, String correo_electronico, String clave, String numIdentificación, String genero, String celular, String fecha_nacimiento, DocumentoIdentidad documentoIdentidad, String dirección, boolean Estado, String doc) {
        this.idCliente = idCliente;
        this.nombres = nombres;
        this.apellido_paterno = apellido_paterno;
        this.apellido_materno = apellido_materno;
        this.correo_electronico = correo_electronico;
        this.clave = clave;
        this.numIdentificación = numIdentificación;
        this.genero = genero;
        this.celular = celular;
        this.fecha_nacimiento = fecha_nacimiento;
        this.documentoIdentidad = documentoIdentidad;
        this.dirección = dirección;
        this.Estado = Estado;
        this.doc = doc;
    }

    public String getDoc() {
        return doc;
    }

    public void setDoc(String doc) {
        this.doc = doc;
    }

    public int getIdCliente() {
        return idCliente;
    }

    public void setIdCliente(int idCliente) {
        this.idCliente = idCliente;
    }

    public String getNombres() {
        return nombres;
    }

    public void setNombres(String nombres) {
        this.nombres = nombres;
    }

    public String getApellido_paterno() {
        return apellido_paterno;
    }

    public void setApellido_paterno(String apellido_paterno) {
        this.apellido_paterno = apellido_paterno;
    }

    public String getApellido_materno() {
        return apellido_materno;
    }

    public void setApellido_materno(String apellido_materno) {
        this.apellido_materno = apellido_materno;
    }

    public String getCorreo_electrónico() {
        return correo_electronico;
    }

    public void setCorreo_electrónico(String correo_electrónico) {
        this.correo_electronico = correo_electrónico;
    }

    public String getClave() {
        return clave;
    }

    public void setClave(String clave) {
        this.clave = clave;
    }

    public String getNumIdentificación() {
        return numIdentificación;
    }

    public void setNumIdentificación(String numIdentificación) {
        this.numIdentificación = numIdentificación;
    }

    public String getGenero() {
        return genero;
    }

    public void setGenero(String genero) {
        this.genero = genero;
    }

    public String getCelular() {
        return celular;
    }

    public void setCelular(String celular) {
        this.celular = celular;
    }

    public String getFecha_nacimiento() {
        return fecha_nacimiento;
    }

    public void setFecha_nacimiento(String fecha_nacimiento) {
        this.fecha_nacimiento = fecha_nacimiento;
    }

    public DocumentoIdentidad getDocumentoIdentidad() {
        return documentoIdentidad;
    }

    public void setDocumentoIdentidad(DocumentoIdentidad documentoIdentidad) {
        this.documentoIdentidad = documentoIdentidad;
    }

    public String getDirección() {
        return dirección;
    }

    public void setDirección(String dirección) {
        this.dirección = dirección;
    }

    public boolean isEstado() {
        return Estado;
    }

    public void setEstado(boolean Estado) {
        this.Estado = Estado;
    }

    
   
}
