
package Modelo;

public class ProductosTicket {
    int id;
    String descripcion;
    int cant;
    double precioVenta;
    double precioTotal;

    public ProductosTicket() {
    }

    public ProductosTicket(int id, String descripcion, int cant, double precioVenta, double precioTotal) {
        this.id = id;
        this.descripcion = descripcion;
        this.cant = cant;
        this.precioVenta = precioVenta;
        this.precioTotal = precioTotal;
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

    public double getPrecioVenta() {
        return precioVenta;
    }

    public void setPrecioVenta(double precioVenta) {
        this.precioVenta = precioVenta;
    }

    public double getPrecioTotal() {
        return precioTotal;
    }

    public void setPrecioTotal(double precioTotal) {
        this.precioTotal = precioTotal;
    }
    
}
