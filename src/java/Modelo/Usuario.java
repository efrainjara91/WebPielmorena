package Modelo;

public class Usuario {

    public int codigo;
    private String nombre;
    private String clave;
    private boolean Vigencia;

    public int getCodigo() {
        return codigo;
    }

    public void setCodigo(int codigo) {
        this.codigo = codigo;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getClave() {
        return clave;
    }

    public void setClave(String clave) {
        this.clave = clave;
    }

    public boolean isVigencia() {
        return Vigencia;
    }

    public void setVigencia(boolean Vigencia) {
        this.Vigencia = Vigencia;
    }
    
    
}
