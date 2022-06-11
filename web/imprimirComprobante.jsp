<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="Config.Fecha"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="Config.Conexion"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">

    <head profile="http://www.mypage.com/">
        <TITLE>Metados en la Web</TITLE>
        <META name="author" content="Ronald Irigoín">
        <META name="copyright" content="&copy; 2019 upeu Corp.">
        <META name="keywords" content="empresarial,instrucciones,catálogos">
        <META name="date" content="1994-11-06T08:49:37+00:00">
    </head>

    <title>JSP Page</title>    
</head>
<body>
    <%        Fecha fecha = new Fecha();
        /* int contador = 0;
        Conexion cn = new Conexion();
        Connection con;
        PreparedStatement ps;
        ResultSet rs;
        con = cn.getConnection();
        String sql = "SELECT p.nombre, dv.cantidad, dv.precioventa,"
                + " dv.precioventa*dv.cantidad as 'total' from detalleventa dv INNER JOIN venta v "
                + "INNER JOIN producto p WHERE dv.idventa=v.idventa and dv.idProducto=p.idProducto"
                + "  and v.idventa=26";
        ps = con.prepareStatement(sql);
        rs = ps.executeQuery();*/
    %>
    <div class="container mt-4">
        <div class="row">         
            <div class="col-md-5">         
                <div class="card" style="width: 500px"> 
                    <p class="text-center">  
                        <br>
                        
                        ${tipocompro} NRO: ${NumeroSerie} - FECHA:<%= fecha.Fecha()%><br>
                        PIEL MORENA | HERNANDARIAS-AP<br>  
                        RUC: 2943444-0<br>
                        CLIENTE: ${nomclie} <br>                                                     
                    </p> 
                    <div class="ml-4 mr-4">                                                  
                        <table class="table table-borderless">
                            <thead>
                                <tr>
                                    <th>#</th>
                                    <th>Producto</th>
                                    <th>Cantidad</th>
                                    <th>Precio</th>
                                    <th>Total</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach var="det" items="${listaProductosTicket}" varStatus="iteracion">
                                    <tr>
                                        <td>${iteracion.index + 1}</td>                                            
                                        <td>${det.descripcion}
                                        <td>${det.cant}</td>
                                        <td class="text-center">${det.precioVenta}</td>
                                        <td class="text-center">${det.precioTotal}</td>                                           
                                    </tr>
                                </c:forEach>
                            </tbody>
                        </table>  
                        <hr>                                                     
                        <table class="table table-borderless">                            
                            <tbody class="text-right">                                
                                <tr>                                   
                                    <td>Subtotal:</td>
                                    <td>${SubTotal}</td>
                                    <td>Total:</td>
                                    <td>${TotalPagar}</td>
                                </tr>                                                                      
                            </tbody>
                        </table>   
                        <div class="text-center">
                            <p>Vendedor: ${empleado.getNombreCompleto()} Cod: ${empleado.numDocumento}</p>
                        </div>

                    </div>  

                    <br>
                </div> 
                        <br>
                        <br>
                        <a href="ControladorPrincipal?accion=NuevaVenta" class="btn btn-success"><span class="fa fa-arrow-circle-left" >Regresar</span></a>
            </div>
        </div>            
    </div> 
</div> 
<script>
    window.print();
</script>
</body>
</html>
