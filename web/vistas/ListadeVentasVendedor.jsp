
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page session="true"%>
<%
  if (session.getAttribute("vendedor") != null) {
%>
<html>
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <title>Piel Morena Shop</title>
        <!-- Tell the browser to be responsive to screen width -->
        <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
        <!-- Bootstrap 3.3.7 -->
        <link rel="icon" type="image/png" href="dist/img/pielicon2.png">

        <!-- Theme style -->
        <!-- Theme style -->
        <link rel="stylesheet" href="dist/css/AdminLTE.min.css">
        <link rel="stylesheet" href="dist/css/skins/_all-skins.min.css">
        <link rel="stylesheet" type="text/css" href="dist/css/datatables.min.css"/>
        <link rel="stylesheet" href="dist/css/diseño.css">

        <link rel="stylesheet" href="https://cdn.datatables.net/buttons/1.5.6/css/buttons.dataTables.min.css"> 

        <link rel="stylesheet" type="text/css" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
        <link rel="stylesheet" type="text/css" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.5.0/css/font-awesome.min.css">

    </head>
    <body class="hold-transition skin-blue fixed sidebar-mini">


        <header class="main-header">

            <!-- Logo -->
            <a href="#" class="logo">
                <!-- mini logo for sidebar mini 50x50 pixels -->
                <span class="logo-mini"><b>C</b>CL</span>
                <!-- logo for regular state and mobile devices -->
                <span class="logo-lg"><b>Piel Morena</b></span>
            </a>

            <!-- Header Navbar: style can be found in header.less -->
            <nav class="navbar navbar-static-top">
                <!-- Sidebar toggle button-->
                <a href="#" class="sidebar-toggle" data-toggle="push-menu" role="button">
                    <span class="sr-only">Toggle navigation</span>
                </a>
                <!-- Navbar Right Menu -->
                <div class="navbar-custom-menu">
                    <ul class="nav navbar-nav">

                        <li class="dropdown user user-menu">
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown" aria-expanded="false">
                                <img src="dist/img/admin.png" class="user-image" alt="User Image">
                                <span class="hidden-xs">${vendedor.getNombreCompleto()} </span>
                            </a>
                            <ul class="dropdown-menu">

                                <!-- User image -->
                                <li class="user-header">
                                    <img src="dist/img/admin.png" class="img-circle" alt="User Image">
                                    <p>
                                        ${vendedor.getNombreUsuario()}           
                                        <small>${vendedor.getCargo().getDescripcion()}</small>
                                    </p>
                                </li>

                                <!-- Menu Footer-->
                                <li class="user-footer">
                                    <div class="pull-left">

                                    </div>
                                    <div class="pull-right">
                                        <a data-toggle="modal" href="#logout" class="btn btn-danger btn-flat"><i class="fa fa-power-off"></i>  Salir</a>
                                        <!--<a href="Empleado?accion=ce" class="btn btn-danger btn-flat"><i class="fa fa-power-off"></i> Salir</a>-->
                                    </div>
                                </li>
                            </ul>
                        </li>

                        </nav>
                        </header>
                        <!-- Left side column. contains the logo and sidebar -->
                        <div class="modal fade in" id="logout" aria-hidden="false">
                            <div class="modal-dialog">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">×</span></button>
                                        <h4 class="modal-title"><i class="fa fa-sign-out"> Salir</i></h4>
                                    </div>
                                    <div class="modal-body">
                                        <p>¿Seguro que quieres salir? </p>
                                    </div>
                                    <div class="modal-footer">
                                        <a type="button" class="btn btn-danger" href="Empleado?accion=ce">Si, Salir</a>
                                        <button type="button" class="btn btn-default" data-dismiss="modal">Cancelar</button>
                                    </div>
                                </div><!-- /.modal-content -->
                            </div><!-- /.modal-dialog -->
                        </div>

                        <aside class="main-sidebar">
                            <!-- sidebar: style can be found in sidebar.less -->
                            <section class="sidebar">
                                <!-- Sidebar user panel -->
                                <div class="user-panel">
                                    <div class="pull-left image">
                                        <img src="dist/img/admin.png" class="img-circle" alt="User Image">
                                    </div>
                                    <div class="pull-left info">
                                        <p> ${vendedor.getNombreCompleto()}</p>
                                        <a href="#"><i class="fa fa-circle text-success"></i> Online</a>
                                    </div>
                                </div>
                                <!-- sidebar menu: : style can be found in sidebar.less -->
                                <ul class="sidebar-menu" data-widget="tree">
                                    <li class="header">MENÚ PRINCIPAL</li>
                                    <li>
                                        <a href="formsVendedor.jsp">
                                            <i class="fa fa-home"></i><span>Inicio</span>           
                                        </a>
                                    </li>
                                    
                                    
                                    <li class="treeview">
                                        <a href="#">
                                            <i class="glyphicon glyphicon-shopping-cart"></i>
                                            <span>Ventas</span>
                                            <span class="pull-right-container">
                                                <i class="fa fa-angle-left pull-right"></i>
                                            </span>
                                        </a>
                                        <ul class="treeview-menu">
                                            <li><a href="ControladorVentasVendedor?accion=NuevaVenta"><i class="fa fa-cart-plus"></i> Nueva Venta</a></li>


                                        </ul>
                                    </li>

                                   
                                    <li class="treeview active">
                                        <a href="#">
                                            <i class="glyphicon glyphicon-signal"></i> <span>Reportes</span>
                                            <i class="fa fa-angle-left pull-right"></i>
                                        </a>
                                        <ul class="treeview-menu menu-open" style="">
                                            <li class="active"><a href="ControladorVentasVendedor?accion=ListarVentas" ><i class="fa fa-bar-chart"></i> Reporte de Ventas</a></li>
                                        </ul>
                                    </li>

                            </section>
                            <!-- /.sidebar -->
                        </aside>


                        <div class="content-wrapper">    
                            <section class="content-header">
                                <div class="row">
                                    <div class="col-xs-12 col-md-3">

                                    </div>
                                    <div class="col-md-3 hidden-xs"></div>
                                    <div class="col-xs-2 col-md-1">


                                    </div>

                                </div>


                            </section>
                            <section class="content">
                                <div class="box">    
                                    <div class="box-header with-border">             
                                        <h3 class="box-title">Generar Reporte de Ventas</h3>
                                    </div>
                                    <div class="box-body">
                                        <section class="mt-4 ml-3 mr-3">      
                                            <div class="row">  
                                                <div class="col-md-3">    
                                                    <form action="ControladorVentasVendedor" >
                                                        <label>Buscar Por Cliente</label>                       
                                                        <div class="">
                                                            <input required="" type="text" name="txtCodigoCliente" class="form-control" placeholder="Ingrese Codigo">
                                                        </div>
                                                        <div class="">
                                                            <button type="submit" name="accion" value="ReporteVentas1" class="btn btn-primary btn-block">Generar</button>
                                                        </div>                  
                                                    </form>
                                                    <form action="ControladorVentasVendedor" >                                   
                                                        <label>Reporte Por Periodo de Fechas</label>
                                                        <input required="" type="date" name="fecha1" class="form-control">
                                                        <input required="" type="date" name="fecha2" class="form-control">
                                                        <button type="submit" name="accion" value="ReporteVentas3" class="btn btn-primary btn-block">Generar</button>
                                                    </form>                  
                                                    <form action="ControladorVentasVendedor" >
                                                        <label>Buscar Por Empleado</label>                       
                                                        <div class="">
                                                            <input required="" type="text" name="txtCodigoEmpleado" class="form-control" placeholder="Ingrese Codigo">
                                                        </div>  
                                                        <div class="">
                                                            <button type="submit" name="accion" value="ReporteVentas2" class="btn btn-primary btn-block">Generar Reporte</button>
                                                        </div>                       
                                                    </form>  
                                                    <form action="ControladorVentasVendedor">
                                                        <label>Buscar Por Tipo Documento</label>  
                                                        <select class="form-control" name="cboTipoDoc" required="">
                                                            <option value="">Seleccione Documento</option>
                                                            <option value="1">Boleta</option>
                                                            <option value="2">Factura</option>
                                                            <option value="3">Guia Remision</option>
                                                        </select>
                                                        <button type="submit" name="accion" value="ReporteVentas4" class="btn btn-primary btn-block">Generar Reporte</button>
                                                    </form>

                                                    <form action="ControladorVentasVendedor">
                                                        <label>Buscar Por Categoria</label>  
                                                        <select name="cboCategoria" class="form-control" required="">
                                                            <option value="" >Seleccione</option>

                                                            <c:forEach items="${categorias}" var="cat">                                                               
                                                                <option value="${cat.codigo}">${cat.nombreCategoria}</option>
                                                            </c:forEach>
                                                        </select>
                                                        <button type="submit" name="accion" value="ReporteVentas5" class="btn btn-primary btn-block">Generar Reporte</button>
                                                    </form>
                                                </div>
                                                <div class="col-md-9 table-responsive">
                                                    <table class="table table-bordered table-striped dataTable table-hover" id="TablaVentass" class="display">
                                                        <thead class="thead-light">
                                                            <tr class="text-center">                           
                                                                <th>Cod</th>
                                                                <th>Cliente</th>
                                                                <th>Tipo</th>
                                                                <th>Serie</th>
                                                                <th>Fecha</th>  
                                                                <th>Monto</th>                                                
                                                                <th>Estado</th>                                                
                                                                <th></th>                             
                                                            </tr>
                                                        </thead>
                                                        <c:forEach var="venta" items="${ListaVentas}" varStatus="iteracion">                                                    
                                                            <tr class="text-center" style="font-size: 14px">
                                                                <!--<td>${iteracion.index + 1}</td>-->
                                                                <td>${venta.idventa}</td>
                                                                <td>${venta.idCliente.nombres}</td>
                                                                <td>${venta.idComprobante.nombre}</td>
                                                                <td>${venta.numeroSerie}</td>                        
                                                                <td>${venta.fechaVenta}</td>                        
                                                                <td>₲ ${venta.montoventa}</td>                       
                                                                <c:if test="${venta.estado == true}">
                                                                    <td>
                                                                        <span class="badge bg-green active">ACEPTADO</span></td> 
                                                                    </c:if>
                                                                    <c:if test="${venta.estado == false}">
                                                                    <td>
                                                                        <span class="badge bg-red active">ANULADA</span></td> 
                                                                    </c:if>                       
                                                                <td>

                                                                    <a href="<c:url value="ControladorVentasVendedor">
                                                                           <c:param name="accion" value="detalle" />
                                                                           <c:param name="cod" value="${venta.idventa}" />
                                                                       </c:url>" class="btn btn-success" type="button" data-toggle="tooltip" title=""  data-original-title="Ver Detalles" data-toggle="modal" data-target="#verDetalles"><i class="fa fa-eye"></i></a>

                                                                    <c:choose>
                                                                        <c:when test="${venta.isEstado() == true}">
                                                                            <input type="hidden" id="id" value="${venta.idventa}">
                                                                            <a id="AnularVenta" href="ControladorVentasVendedor?cambiar=des&cod=${venta.idventa}" class="btn btn-danger"  data-toggle="tooltip" title="Anular Venta" data-original-title="Desactivar">
                                                                                <i class="fa fa-times-circle"></i></a>
                                                                            </c:when>
                                                                            <%--<c:otherwise>
                                                                            <input type="hidden" id="id" value="${venta.idventa}">
                                                                            <a id="" href="ControladorVentasVendedor?cambiar=act&cod=${venta.idventa}" class="btn btn-primary" data-toggle="tooltip" title="Activar" data-original-title="Activar">
                                                                                <i class="glyphicon glyphicon-eye-open"></i></a>
                                                                            </c:otherwise>--%>
                                                                        </c:choose></td> 
                                                                </td>                                                             
                                                            </tr>                                                    
                                                        </c:forEach>                                               
                                                    </table>                  
                                                </div>                       
                                            </div>                  
                                        </section>        
                                    </div>
                                    <!-- /.box-body -->
                                    <div class="box-footer">
                                        <!--Pie de página-->
                                    </div>
                                    <!-- /.box-footer-->
                                </div>
                            </section>
                            <!-- Modal -->
                            <div class="modal fade" id="verDetalles" tabindex="-1" role="dialog">
                                <div class="modal-dialog modal-lg" role="document">
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <h4 class="modal-title"><i class="fa fa-suitcase"></i> Detalles</h4>
                                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                <span aria-hidden="true">&times;</span>
                                            </button>                            
                                        </div>
                                        <div class="modal-body">
                                            <div class="table-responsive" >  
                                                <table class="table table table-borderless" id="myTable" data-page-length='04'>
                                                    <thead>
                                                        <tr class="warning">
                                                            <th>Nº</th>
                                                            <th>Producto</th>
                                                            <th>Cantidad</th>
                                                            <th>Precio Unitario</th>
                                                            <th>Monto Total</th>                                       
                                                        </tr>
                                                    </thead>  
                                                    <c:forEach var="det" items="${detalles}" varStatus="iteracion">
                                                        <tr>
                                                            <td>${iteracion.index + 1}</td>
                                                            <td>${det.producto.nombre}</td>
                                                            <td>${det.cantidad}</td>
                                                            <td>${det.precioUnitario}</td>
                                                            <td>S/ ${det.total}0</td>
                                                        </tr>
                                                    </c:forEach> 
                                                </table>
                                            </div>   
                                        </div>                     
                                    </div>
                                </div>
                            </div>

                        </div>

                        <div class="content-wrapper">


                        </div>
                        <!-- /.content-wrapper -->

                        <footer class="main-footer">
                            <div class="pull-right hidden-xs">
                                <b>Version</b> 1.0
                            </div>
                            <strong>Copyright &copy; 2022-2099 <a href="#">QuantumGroup</a>.</strong> Todos los derechos 
                            reservados.
                        </footer>
                        <script src="bower_components/jquery/dist/jquery.min.js"></script>
                        <!-- Bootstrap 3.3.7 -->
                        <script src="../bower_components/bootstrap/dist/js/bootstrap.min.js"></script>
                        <!-- FastClick -->
                        <script src="bower_components/fastclick/lib/fastclick.js"></script>
                        <!-- AdminLTE App -->
                        <script src="dist/js/adminlte.min.js"></script>
                        <!-- Sparkline -->
                        <script src="bower_components/jquery-sparkline/dist/jquery.sparkline.min.js"></script>
                        <!-- jvectormap  -->
                        <script src="plugins/jvectormap/jquery-jvectormap-1.2.2.min.js"></script>
                        <script src="plugins/jvectormap/jquery-jvectormap-world-mill-en.js"></script>
                        <!-- SlimScroll -->
                        <script src="bower_components/jquery-slimscroll/jquery.slimscroll.min.js"></script>
                        <!-- ChartJS -->
                        <script src="bower_components/chart.js/Chart.js"></script>
                        <!-- AdminLTE dashboard demo (This is only for demo purposes) -->
                        <script src="dist/js/pages/dashboard2.js"></script>
                        <!-- AdminLTE for demo purposes -->
                        <script src="dist/js/demo.js"></script>

                        <script src="jquery/jquery-3.3.1.min.js"></script>
                        <script src="popper/popper.min.js"></script>
                        <script src="bootstrap/js/bootstrap.min.js"></script>

                        <!-- datatables JS -->
                        <script type="text/javascript" src="datatables/datatables.min.js"></script>    

                        <!-- para usar botones en datatables JS -->  
                        <script src="datatables/Buttons-1.5.6/js/dataTables.buttons.min.js"></script>  
                        <script src="datatables/JSZip-2.5.0/jszip.min.js"></script>    
                        <script src="datatables/pdfmake-0.1.36/pdfmake.min.js"></script>    
                        <script src="datatables/pdfmake-0.1.36/vfs_fonts.js"></script>
                        <script src="datatables/Buttons-1.5.6/js/buttons.html5.min.js"></script>

                        <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
                        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
                        <!-- <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
 
                        <!-- código JS propìo-->    
                        <script type="text/javascript" src="main.js"></script>  
                        <script src="js/funciones.js" type="text/javascript"></script>

                        </body>
                        </html>
<%
  } else {
    response.sendRedirect("admin.jsp");
  }
%>