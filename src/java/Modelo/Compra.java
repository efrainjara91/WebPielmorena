package Modelo;

import java.util.List;

public class Compra {

    Integer id;
    Integer idproveedor;
    Integer idempleado;
    String fecha;
    Double monto;
    String Numserie;
    Integer idcomprobante;
    String estado;
    private double igv;

    String proveedor;
    String empleado;
    String comprobante;

    private List<DetalleCompra> detalleCompras;

    public Compra() {
    }

    public Compra(Integer id, Integer idproveedor, Integer idempleado, String fecha, Double monto, String Numserie, Integer idcomprobante, String estado, String proveedor, String empleado, String comprobante, List<DetalleCompra> detalleCompras) {
        this.id = id;
        this.idproveedor = idproveedor;
        this.idempleado = idempleado;
        this.fecha = fecha;
        this.monto = monto;
        this.Numserie = Numserie;
        this.idcomprobante = idcomprobante;
        this.estado = estado;
        this.proveedor = proveedor;
        this.empleado = empleado;
        this.comprobante = comprobante;
        this.detalleCompras = detalleCompras;
    }

    public double getIgv() {
        return igv;
    }

    public void setIgv(double igv) {
        this.igv = igv;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getIdproveedor() {
        return idproveedor;
    }

    public void setIdproveedor(Integer idproveedor) {
        this.idproveedor = idproveedor;
    }

    public Integer getIdempleado() {
        return idempleado;
    }

    public void setIdempleado(Integer idempleado) {
        this.idempleado = idempleado;
    }

    public String getFecha() {
        return fecha;
    }

    public void setFecha(String fecha) {
        this.fecha = fecha;
    }

    public Double getMonto() {
        return monto;
    }

    public void setMonto(Double monto) {
        this.monto = monto;
    }

    public String getNumserie() {
        return Numserie;
    }

    public void setNumserie(String Numserie) {
        this.Numserie = Numserie;
    }

    public Integer getIdcomprobante() {
        return idcomprobante;
    }

    public void setIdcomprobante(Integer idcomprobante) {
        this.idcomprobante = idcomprobante;
    }

    public String getEstado() {
        return estado;
    }

    public void setEstado(String estado) {
        this.estado = estado;
    }

    public String getProveedor() {
        return proveedor;
    }

    public void setProveedor(String proveedor) {
        this.proveedor = proveedor;
    }

    public String getEmpleado() {
        return empleado;
    }

    public void setEmpleado(String empleado) {
        this.empleado = empleado;
    }

    public String getComprobante() {
        return comprobante;
    }

    public void setComprobante(String comprobante) {
        this.comprobante = comprobante;
    }

    public List<DetalleCompra> getDetalleCompras() {
        return detalleCompras;
    }

    public void setDetalleCompras(List<DetalleCompra> detalleCompras) {
        this.detalleCompras = detalleCompras;
    }

}
