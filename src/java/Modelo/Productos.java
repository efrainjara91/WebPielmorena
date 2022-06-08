package Modelo;

import java.io.InputStream;

public class Productos {

    private int id_Producto;
    private String nombre;
    private String imagen;
    InputStream foto;
    private String descripcion;
    private double precio;
    private double preciocompra;
    private int stock;
    private boolean vigencia;
    private Categorias categoria;
    private Marcas marca;
    private int contar;
    private boolean destacado;
    public Productos() {
    }

    public Productos(int id_Producto, String nombre, String imagen, String descripcion, double precio, double preciocompra, int stock, InputStream foto, boolean vigencia, Categorias categoria, Marcas marca) {
        this.id_Producto = id_Producto;
        this.nombre = nombre;
        this.imagen = imagen;
        this.descripcion = descripcion;
        this.precio = precio;
        this.preciocompra = preciocompra;
        this.stock = stock;
        this.foto = foto;
        this.vigencia = vigencia;
        this.categoria = categoria;
        this.marca = marca;
    }

    public int getContar() {
        return contar;
    }

    public boolean isDestacado() {
        return destacado;
    }

    public void setDestacado(boolean destacado) {
        this.destacado = destacado;
    }

    public void setContar(int contar) {
        this.contar = contar;
    }

    
    public String getImagen() {
        return imagen;
    }

    public void setImagen(String imagen) {
        this.imagen = imagen;
    }


    

    public int getId_Producto() {
        return id_Producto;
    }

    public void setId_Producto(int id_Producto) {
        this.id_Producto = id_Producto;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getDescripcion() {
        return descripcion;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }

    public double getPrecio() {
        return precio;
    }

    public void setPrecio(double precio) {
        this.precio = precio;
    }

    public double getPreciocompra() {
        return preciocompra;
    }

    public void setPreciocompra(double preciocompra) {
        this.preciocompra = preciocompra;
    }

    public int getStock() {
        return stock;
    }

    public void setStock(int stock) {
        this.stock = stock;
    }

    public InputStream getFoto() {
        return foto;
    }

    public void setFoto(InputStream foto) {
        this.foto = foto;
    }

    public boolean isVigencia() {
        return vigencia;
    }

    public void setVigencia(boolean vigencia) {
        this.vigencia = vigencia;
    }

    public Categorias getCategoria() {
        return categoria;
    }

    public void setCategoria(Categorias categoria) {
        this.categoria = categoria;
    }

    public Marcas getMarca() {
        return marca;
    }

    public void setMarca(Marcas marca) {
        this.marca = marca;
    }

 
}
