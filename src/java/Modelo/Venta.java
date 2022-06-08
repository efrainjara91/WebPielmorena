package Modelo;

import java.util.List;

public class Venta {

    private int idventa;
    private Clientes idCliente;
    private Empleados idEmpleados;
    private String numeroSerie;
    private String fechaVenta;
    private double igv;
    private boolean estado;
    private double montoventa;
    private Comprobantes idComprobante;
    private int contar;

    private List<DetalleVenta> detalleVentas;

    public Venta() {
    }

    public Venta(int idventa, Clientes idCliente, Empleados idEmpleados, String numeroSerie, String fechaVenta, double igv, Boolean estado, double montoventa, Comprobantes idComprobante, List<DetalleVenta> detalleVentas) {
        this.idventa = idventa;
        this.idCliente = idCliente;
        this.idEmpleados = idEmpleados;
        this.numeroSerie = numeroSerie;
        this.fechaVenta = fechaVenta;
        this.igv = igv;
        this.estado = estado;
        this.montoventa = montoventa;
        this.idComprobante = idComprobante;
        this.detalleVentas = detalleVentas;
    }

    

    public int getIdventa() {
        return idventa;
    }

    public void setIdventa(int idventa) {
        this.idventa = idventa;
    }

    public Clientes getIdCliente() {
        return idCliente;
    }

    public void setIdCliente(Clientes idCliente) {
        this.idCliente = idCliente;
    }

    public Empleados getIdEmpleados() {
        return idEmpleados;
    }

    public void setIdEmpleados(Empleados idEmpleados) {
        this.idEmpleados = idEmpleados;
    }

    public String getNumeroSerie() {
        return numeroSerie;
    }

    public void setNumeroSerie(String numeroSerie) {
        this.numeroSerie = numeroSerie;
    }

    public String getFechaVenta() {
        return fechaVenta;
    }

    public void setFechaVenta(String fechaVenta) {
        this.fechaVenta = fechaVenta;
    }

    public double getIgv() {
        return igv;
    }

    public void setIgv(double igv) {
        this.igv = igv;
    }

    public boolean isEstado() {
        return estado;
    }

    public void setEstado(boolean estado) {
        this.estado = estado;
    }

    public int getContar() {
        return contar;
    }

    public void setContar(int contar) {
        this.contar = contar;
    }

  

   
    public double getMontoventa() {
        return montoventa;
    }

    public void setMontoventa(double montoventa) {
        this.montoventa = montoventa;
    }

    public Comprobantes getIdComprobante() {
        return idComprobante;
    }

    public void setIdComprobante(Comprobantes idComprobante) {
        this.idComprobante = idComprobante;
    }

    public List<DetalleVenta> getDetalleVentas() {
        return detalleVentas;
    }

    public void setDetalleVentas(List<DetalleVenta> detalleVentas) {
        this.detalleVentas = detalleVentas;
    }


   
}
