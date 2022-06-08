<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

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
                                            <i class="fa fa-th"></i>
                                            <span>Compras</span>
                                            <span class="label label-primary pull-right">C

                                            </span>
                                        </a>
                                        <ul class="treeview-menu">
                                            <li><a href="ingresos?accion=listar"><i class="fa fa-circle-o"></i> Ingresos</a></li>
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
                                                <li><a href="ventas?accion=nu"><i class="fa fa-cart-plus"></i> Nueva Venta</a></li>
                                              

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
                                    <li class="treeview">
                                        <a href="#">
                                            <i class="glyphicon glyphicon-signal"></i> <span>Reportes</span>
                                            <i class="fa fa-angle-left pull-right"></i>
                                        </a>
                                        <ul class="treeview-menu menu-open" style="">
                                            <li class=""><a href="ControladorPrincipal?accion=ListarVentas" ><i class="fa fa-bar-chart"></i> Reporte de Ventas</a></li>
                                            <li class=""><a href="ControladorCompras?accion=ListarCompras" ><i class="fa fa-bar-chart"></i> Reporte de Compras</a></li>
                                        </ul>
                                    </li>
                                    <li class="treeview active">
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
                                            <li class=""><a href="Cargo.jsp"><i class="glyphicon glyphicon-briefcase"></i> Cargos</a></li>


                                        </ul>
                                    </li>
                                    <!--<li class="treeview">
                                        <a href="#">
                                            <i class="fa fa-lock"></i> <span>Tienda Online</span>
                                            <i class="fa fa-angle-left pull-right"></i>
                                        </a>
                                        <ul class="treeview-menu menu-open">
                                            <li class=""><a href="#"><i class="fa fa-circle-o"></i>Páginas</a></li>
                                            <li class=""><a href="#"><i class="fa fa-circle-o"></i>Productos</a></li>
                                            <li class=""><a href="#"><i class="fa fa-circle-o"></i>Coleciones</a></li>
                                            <li class=""><a href="../index.jsp"  target="_blank"><i class="fa fa-eye"></i>Ver tienda</a></li>


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
                                    <div class="col-xs-10 col-md-5 ">
                                        <div class="btn-group pull-right">
                                                                                        
                                        </div>
                                    </div>
                                </div>


                            </section>
                            <section class="content">
                                <style>
                                    .rokarock{
                                        color:white;
                                        font-size: 11px;
                                        font-family: arial;
                                        }
                                </style>
                                <div class="box">    
                                    <div class="box-header with-border">             
                                        <h3 class="box-title">Configuración General</h3>
                                    </div>
                                    <div class="box-body">
                                        <div class="table-responsive" >                                 
                                            <table class="table table-bordered table-striped dataTable table-hover" id="global" class="display">
                                                <thead>
                                                    <tr>
                                                        <th>#</th>
                                                        <th>Empresa</th>
                                                        <th>Impuesto</th>
                                                        <th>Impuesto%</th>
                                                        <th>Acciones</th> 
                                                    </tr>
                                                </thead>
                                                <c:forEach var="glob" items="${global}" varStatus="iteracion">                                                    
                                                    <tr>
                                                        <td>${iteracion.index + 1}</td>
                                                        <td>${glob.nombre_empresa}</td>
                                                        <td>${glob.nombre_impuesto}</td>
                                                        <td>${glob.porcentaje_impuesto}</td>
                                                        
                                                   
                                                <td><a href="<c:url value="global">
                                                               <c:param name="accion" value="pr" />
                                                               <c:param name="cod" value="${glob.codigo}" />
                                                           </c:url>"><button class="btn btn-warning" data-toggle="tooltip" title="" data-original-title="Editar">
                                                        <i class="fa fa-pencil"></i></button></a></td>
                                                    </tr>                                                    
                                                </c:forEach>                                               
                                            </table>
                                        </div>
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
                        <script type ="text/javascript">
                            $(document).ready(function () {
                                $('#global').DataTable({
                                    "language": {
                                        "sProcessing": "Procesando...",
                                        "sLengthMenu": "Mostrar _MENU_ registros",
                                        "sZeroRecords": "No se encontraron resultados",
                                        "sEmptyTable": "Ningún dato disponible en esta tabla",
                                        "sInfo": "Mostrando registros del _START_ al _END_ de un total de _TOTAL_ registros",
                                        "sInfoEmpty": "Mostrando registros del 0 al 0 de un total de 0 registros",
                                        "sInfoFiltered": "(filtrado de un total de _MAX_ registros)",
                                        "sInfoPostFix": "",
                                        "sSearch": "Buscar:",
                                        "sUrl": "",
                                        "sInfoThousands": ",",
                                        "sLoadingRecords": "Cargando...",
                                        "oPaginate": {
                                            "sFirst": "Primero",
                                            "sLast": "Último",
                                            "sNext": "Siguiente",
                                            "sPrevious": "Anterior"
                                        },
                                        "oAria": {
                                            "sSortAscending": ": Activar para ordenar la columna de manera ascendente",
                                            "sSortDescending": ": Activar para ordenar la columna de manera descendente"
                                        }
                                    }

                                });
                            });
                        </script>
                        <script type="text/javascript" src="dist/js/datatables.min.js"></script>
                        </body>
                        </html>
