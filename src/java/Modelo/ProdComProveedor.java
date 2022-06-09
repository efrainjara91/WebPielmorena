package Modelo;

public class ProdComProveedor {
    int id;
    String descripcion;
    int cant;
    double precioCompras; 
    double precioSubtotal; 

    public ProdComProveedor() {
    }

    public ProdComProveedor(int id, String descripcion, int cant, double precioCompras, double precioSubtotal) {
        this.id = id;
        this.descripcion = descripcion;
        this.cant = cant;
        this.precioCompras = precioCompras;
        this.precioSubtotal = precioSubtotal;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getDescripcion() {
        return descripcion;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }

    public int getCant() {
        return cant;
    }

    public void setCant(int cant) {
        this.cant = cant;
    }

    public double getPrecioCompras() {
        return precioCompras;
    }

    public void setPrecioCompras(double precioCompras) {
        this.precioCompras = precioCompras;
    }

    public double getPrecioSubtotal() {
        return precioSubtotal;
    }

    public void setPrecioSubtotal(double precioSubtotal) {
        this.precioSubtotal = precioSubtotal;
    }

   
    
}
