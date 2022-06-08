
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page session="true"%>
<%
    if (session.getAttribute("empleado") != null) {
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
        <link rel="stylesheet" href="bower_components/bootstrap/dist/css/bootstrap.min.css">
        <!-- Font Awesome -->
        <link rel="stylesheet" href="bower_components/font-awesome/css/font-awesome.min.css">
        <!-- Ionicons -->
        <link rel="stylesheet" href="bower_components/Ionicons/css/ionicons.min.css">
        <!-- jvectormap -->
        <link rel="stylesheet" href="bower_components/jvectormap/jquery-jvectormap.css">
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
            <a href="Principal.jsp" class="logo">
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
                                <span class="hidden-xs">${empleado.getNombreCompleto()} </span>
                            </a>
                            <ul class="dropdown-menu">

                                <!-- User image -->
                                <li class="user-header">
                                    <img src="dist/img/admin.png" class="img-circle" alt="User Image">
                                    <p>
                                        ${empleado.getNombreUsuario()}           
                                        <small>${empleado.getCargo().getDescripcion()}</small>
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
                                        <p> ${empleado.getNombreCompleto()}</p>
                                        <a href="#"><i class="fa fa-circle text-success"></i> Online</a>
                                    </div>
                                </div>
                                <!-- sidebar menu: : style can be found in sidebar.less -->
                                <ul class="sidebar-menu" data-widget="tree">
                                    <li class="header">MENÚ PRINCIPAL</li>
                                    <li>
                                        <a href="Principal.jsp">
                                            <i class="fa fa-home"></i><span>Inicio</span>           
                                        </a>
                                    </li>
                                    <li class="treeview">
                                        <a href="#">
                                            <i class="glyphicon glyphicon-th-large"></i>
                                            <span>Almacén</span>
                                            <span class="pull-right-container">
                                                <i class="fa fa-angle-left pull-right"></i>
                                            </span>
                                        </a>
                                        <ul class="treeview-menu">
                                            <li><a href="productos?accion=listar"><i class="fa fa-cube"></i> Productos</a></li>
                                            <li><a href="Categorias?accion=listar"><i class="fa fa-bookmark-o"></i> Categorias</a></li>
                                            <li><a href="Marcas?accion=listar"><i class="fa fa-tags"></i> Marcas</a></li>
                                        </ul>
                                    </li>

                                    <li class="treeview">
                                        <a href="#">
                                            <i class="glyphicon glyphicon-arrow-right"></i>
                                            <span class="label label-primary pull-right">C
                                            </span>
                                            <span>Compras</span>       
                                        </a>
                                        <ul class="treeview-menu">
                                            <li><a href="ControladorCompras?accion=NuevaCompra" ><i class="glyphicon glyphicon-plus-sign"></i> Nueva Compra</a></li>
                                            <li><a href="proveedor?accion=listar"><i class="fa fa-circle-o"></i> Proveedores</a></li>
                                        </ul>
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
                                            <li><a href="ControladorPrincipal?accion=NuevaVenta" ><i class="fa fa-cart-plus"></i> Nueva Venta</a></li>


                                        </ul>
                                    </li>

                                    <li>
                                        <a href="Empleado?accion=listar">
                                            <i class="fa fa-user"></i> <span>Empleados</span>
                                            <span class="pull-right-container">     
                                            </span>
                                        </a>
                                    </li>
                                    <li>
                                        <a href="clientes?accion=listar">
                                            <i class="fa fa-group"></i> <span>Clientes</span>
                                            <span class="pull-right-container">     
                                            </span>
                                        </a>
                                    </li>
                                    <li class="treeview active">
                                        <a href="#">
                                            <i class="glyphicon glyphicon-signal"></i> <span>Reportes</span>
                                            <i class="fa fa-angle-left pull-right"></i>
                                        </a>
                                        <ul class="treeview-menu menu-open" style="">
                                            <li class=""><a href="ControladorPrincipal?accion=ListarVentas"><i class="fa fa-bar-chart"></i> Reporte de ventas</a></li>
                                            <li class="active"><a href="ControladorCompras?accion=ListarCompras"><i class="fa fa-bar-chart"></i> Reporte de Compras</a></li>
                                        </ul>
                                    </li>
                                    <li class="treeview">
                                        <a href="#">
                                            <i class="fa fa-wrench"></i> <span>Configuración</span>

                                            <i class="fa fa-angle-left pull-right"></i>

                                        </a>
                                        <ul class="treeview-menu">
                                            <li><a href="comprobantes?accion=listar"><i class="fa fa-circle-o"></i> Tipo Documento</a></li>
                                        </ul>
                                    </li>

                                    <li class="treeview">
                                        <a href="#">
                                            <i class="fa fa-lock"></i> <span>Administrar accesos</span>
                                            <i class="fa fa-angle-left pull-right"></i>
                                        </a>
                                        <ul class="treeview-menu menu-open">
                                            <li><a href="cargos?accion=listar"><i class="glyphicon glyphicon-briefcase"></i> Cargos</a></li>


                                        </ul>
                                    </li>
                                    <!-- <li class="header">CARRITO DE COMPRAS</li> -->

                                    <!--<li class="treeview">
                                        <a href="#">
                                            <i class="glyphicon glyphicon-globe"></i> <span>Tienda Online</span>
                                            <i class="fa fa-angle-left pull-right"></i>
                                        </a>
                                        <ul class="treeview-menu menu-open">
                                            <li class=""><a href="vistas/SettingsOnline.jsp"><i class="fa fa-circle-o"></i>Configuración</a></li>
                                            <li class=""><a href="Controlador?accion=Nuevo"  target="_blank"><i class="fa fa-eye"></i>Ver tienda</a></li>
                                        </ul>
                                    </li>-->

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
                                        <h3 class="box-title">Generar Reporte de Compras</h3>
                                    </div>
                                    <div class="box-body">
                                        <section class="mt-4 ml-3 mr-3">      
                                            <div class="row">  
                                                <div class="col-md-3">    
                                                    <form action="ControladorCompras" method="POST" >
                                                        <label>Buscar Por Proveedor</label>                       
                                                        <div class="">
                                                            <input required="" type="text" name="txtCodigoProveedor" class="form-control" placeholder="Ingrese Codigo">
                                                        </div>
                                                        <div class="">
                                                            <button type="submit" name="accion" value="ReporteCompras1" class="btn btn-primary btn-block">Generar</button>
                                                        </div>                  
                                                    </form>
                                                    <form action="ControladorCompras" >
                                                        <label>Buscar Por Empleado</label>                       
                                                        <div class="">
                                                            <input required="" type="text" name="txtCodigoEmpleado" class="form-control" placeholder="Ingrese Codigo">
                                                        </div>  
                                                        <div class="">
                                                            <button type="submit" name="accion" value="ReporteCompras2" class="btn btn-primary btn-block">Generar Reporte</button>
                                                        </div>                       
                                                    </form>  
                                                    <form action="ControladorCompras" >                                   
                                                        <label>Reporte Por Fechas</label>
                                                        <input required="" type="date" name="fecha1" class="form-control">
                                                        <input required="" type="date" name="fecha2" class="form-control">
                                                        <button type="submit" name="accion" value="ReporteCompras3" class="btn btn-primary btn-block">Generar</button>
                                                    </form>                

                                                </div>
                                                <div class="col-md-9 table-responsive">
                                                    <table class="table table-bordered table-striped dataTable table-hover" id="TablaVentass" class="display">
                                                        <thead class="thead-light">
                                                            <tr class="text-center">                           
                                                                <th>Cod</th>
                                                                <th>Proveedor</th>
                                                                <th>Tipo</th>
                                                                <th>N°</th>
                                                                <th>Fecha</th>  
                                                                <th>Monto</th>          
                                                                <th>Empleado</th>          
                                                                <th></th>                             
                                                            </tr>
                                                        </thead>
                                                        <c:forEach var="compra" items="${ListaCompras}" varStatus="iteracion">                                                    
                                                            <tr class="text-center" style="font-size: 14px">
                                                                <!--<td>${iteracion.index + 1}</td>-->
                                                                <td>${compra.id}</td>
                                                                <td>${compra.proveedor}</td>
                                                                <td>${compra.comprobante}</td>
                                                                <td>${compra.getNumserie()}</td>                        
                                                                <td>${compra.fecha}</td>                        
                                                                <td>S/. ${compra.monto}</td>                       
                                                                <td>${empleado.nombre}</td>                       
                                                                <td>
                                                                    <a href="<c:url value="ControladorCompras">
                                                                    <c:param name="accion" value="detalle" />
                                                                    <c:param name="cod" value="${compra.id}" />
                                                                    </c:url>" class="btn btn-success" type="button" data-toggle="tooltip" title=""  data-original-title="Ver Detalles" data-toggle="modal" data-target="#verDetalles"><i class="fa fa-eye"></i></a>
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

                        </div>

                        <!-- /.content-wrapper -->

                        <footer class="main-footer">
                            <div class="pull-right hidden-xs">
                                <b>Version</b> 1.0
                            </div>
                            <strong>Copyright &copy; 2022-2099 <a href="#">QuantumGroup</a>.</strong> Todos los derechos 
                            reservados.
                        </footer>
                        <!-- jQuery 3 -->
                        <script src="bower_components/jquery/dist/jquery.min.js"></script>
                        <!-- Bootstrap 3.3.7 -->
                        <script src="bower_components/bootstrap/dist/js/bootstrap.min.js"></script>
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

                        <script type="text/javascript" src="dist/js/datatables.min.js"></script>

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

                        <!-- código JS propìo-->    
                        <script type="text/javascript" src="main.js"></script>  
                        </body>
                        </html>
  <%
                            } else {
                                response.sendRedirect("admin.jsp");
                            }
                        %>