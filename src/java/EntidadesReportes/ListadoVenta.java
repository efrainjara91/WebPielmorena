
package EntidadesReportes;


public class ListadoVenta {
    
private int codigo;
  private String tipoDocumento;
  private int serie;
  private int numero;
  private double total;
  private boolean vigencia;

  public ListadoVenta() {
  }
  
  public ListadoVenta(int codigo, String tipoDocumento, int serie, int numero, double total) {
    this.codigo = codigo;
    this.tipoDocumento = tipoDocumento;
    this.serie = serie;
    this.numero = numero;
    this.total = total;
  }

  public boolean isVigencia() {
    return vigencia;
  }

  public void setVigencia(boolean vigencia) {
    this.vigencia = vigencia;
  }
  
  public String getNombreDocumento(){
    String nombre = "";
    switch( this.tipoDocumento){
      case "B" : nombre = "Ticket"; break;
      case "F" : nombre = "Factura"; break;
    }
    return nombre;
  }
  public String getDocumento(){
    return this.getNombreDocumento() + " " 
            + this.serie + " - " + this.numero ; 
  }
  
  public int getCodigo() {
    return codigo;
  }

  public void setCodigo(int codigo) {
    this.codigo = codigo;
  }

  public String getTipoDocumento() {
    return tipoDocumento;
  }

  public void setTipoDocumento(String tipoDocumento) {
    this.tipoDocumento = tipoDocumento;
  }

  public int getSerie() {
    return serie;
  }

  public void setSerie(int serie) {
    this.serie = serie;
  }

  public int getNumero() {
    return numero;
  }

  public void setNumero(int numero) {
    this.numero = numero;
  }

  public double getTotal() {
    return total;
  }

  public void setTotal(double total) {
    this.total = total;
  }
  
}
