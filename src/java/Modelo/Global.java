
package Modelo;

import java.io.InputStream;


public class Global{
    private int codigo;
    private String nombre_empresa;
    private String nombre_impuesto;
    private double porcentaje_impuesto;

    public int getCodigo() {
        return codigo;
    }

    public void setCodigo(int codigo) {
        this.codigo = codigo;
    }

    public String getNombre_empresa() {
        return nombre_empresa;
    }

    public void setNombre_empresa(String nombre_empresa) {
        this.nombre_empresa = nombre_empresa;
    }

    public String getNombre_impuesto() {
        return nombre_impuesto;
    }

    public void setNombre_impuesto(String nombre_impuesto) {
        this.nombre_impuesto = nombre_impuesto;
    }

    public double getPorcentaje_impuesto() {
        return porcentaje_impuesto;
    }

    public void setPorcentaje_impuesto(double porcentaje_impuesto) {
        this.porcentaje_impuesto = porcentaje_impuesto;
    }
    
  
}
