package Modelo;

public class Categorias {

    private int codigo;
    private String nombreCategoria;
    private boolean vigencia;
    private boolean mostrar;
    private int contar;

   
    public int getContar() {
        return contar;
    }

    public void setContar(int contar) {
        this.contar = contar;
    }

    public boolean isVigencia() {
        return vigencia;
    }

    public boolean isMostrar() {
        return mostrar;
    }

    public void setMostrar(boolean mostrar) {
        this.mostrar = mostrar;
    }

    public void setVigencia(boolean vigencia) {
        this.vigencia = vigencia;
    }

    public int getCodigo() {
        return codigo;
    }

    public void setCodigo(int codigo) {
        this.codigo = codigo;
    }

    public String getNombreCategoria() {
        return nombreCategoria;
    }

    public void setNombreCategoria(String nombreCategoria) {
        this.nombreCategoria = nombreCategoria;
    }

}
