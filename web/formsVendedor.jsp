<%@page import="Modelo.Dashboard"%>
<%@page import="Modelo.Venta"%>
<%@page import="java.util.List"%>
<%@page import="DAO.DAODashboard"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
        <!-- Font Awesome -->
        <link rel="stylesheet" href="bower_components/font-awesome/css/font-awesome.min.css">

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
        <div class="wrapper">

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
                                    <span class="hidden-xs">${empleado.getNombreCompleto()} </span>
                                </a>
                                <ul class="dropdown-menu">
                                    <!-- User image -->
                                    <li class="user-header">
                                        <img src="dist/img/admin.png" class="img-circle" alt="User Image">
                                        <p>${empleado.getNombreUsuario()}         
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
                        </ul>
                    </div>
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
                            <a type="button" class="btn btn-danger" href="LoginControlador?accion=Salir">Si, Salir</a>
                            <button type="button" class="btn btn-default" data-dismiss="modal">Cancelar</button>
                        </div>
                    </div><!-- /.modal-content -->
                </div><!-- /.modal-dialog -->
            </div>

            <!--Menu Lateral-->
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
                        <li class="active" id="liInicio">
                            <a href="formsVendedor.jsp" >
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
                                <li><a href="ControladorVentasVendedor?accion=NuevaVenta" ><i class="glyphicon glyphicon-plus-sign"></i> Nueva Venta</a></li>
                            </ul>
                        </li>
                        
                        
                        <li class="treeview">
                            <a href="#">
                                <i class="glyphicon glyphicon-signal"></i> <span>Reportes</span>
                                <i class="fa fa-angle-left pull-right"></i>
                            </a>
                            <ul class="treeview-menu menu-open" style="">
                                <li class=""><a href="ControladorVentasVendedor?accion=ListarVentas" ><i class="fa fa-bar-chart"></i> Reporte de Ventas</a></li>                            </ul>
                        </li>
                        
                </section>
                <!-- /.sidebar -->

            </aside>
                            

            <!-- Content Wrapper. Contenido -->
            <div class="content-wrapper">
                <section class="content-header">
                    <h1>
                        Pagina Principal
                        <!--<small>Panel Control</small>-->
                    </h1>
                    <ol class="breadcrumb">
                        <li><a href="#"><i class="fa fa-dashboard"></i> Inicio</a></li>
                        <!--<li class="active">Dashboard</li>-->
                    </ol>
                </section>
                <section class="content">
                    <!-- Small boxes (Stat box) -->
                    <div class="row">
                       <div class="col-lg-3 col-xs-6">
                                <!-- small box -->
                                <div class="small-box bg-red">
                                    <div class="inner">
                                        <%
                                            DAODashboard daoVentas = new DAODashboard();
                                            List<Venta> ventas = null;
                                            int i = 1;

                                            try {
                                                ventas = daoVentas.contarVentas();
                                                for (Venta dash : ventas) {
                                                    out.print("<h3>" + dash.getContar()+ "</h3>");

                                                    i++;
                                                }

                                            } catch (Exception e) {
                                                out.print("<tr><td colspan=\"3\">"
                                                        + e.getMessage() + "No se pudo listar la cantidad de ventas</td></tr>");
                                            } finally {
                                                daoVentas = null;
                                                if (ventas != null) {
                                                    ventas.clear();
                                                }
                                                ventas = null;
                                            }
                                        %>

                                        <p>Número de Ventas</p>
                                    </div>
                                    <div class="icon">
                                        <i class="ion ion-pie-graph"></i>
                                    </div>
                                    <a href="ControladorVentasVendedor?accion=ListarVentas" class="small-box-footer">más detalles <i class="fa fa-arrow-circle-right"></i></a>
                                </div>
                            </div>
                                        
                                        <div class="col-md-12">
                                <div class="box">
                                    <div class="box-header">
                                        <h3 class="box-title">Top 5 Productos más vendidos </h3>
                                    </div>
                                    <div class="box-body no-padding">
                                        <table class="table table-condensed">
                                            <thead>
                                                <tr>
                                                    <th>#</th>
                                                    <th>Producto</th>
                                                    <th># Ventas </th>
                                                </tr>
                                            </thead>
                                        <%
                                            DAODashboard dao = new DAODashboard();
                                            List<Dashboard> dashboard = null;
                                            int ii = 1;

                                            try {
                                                dashboard = dao.listar();
                                                for (Dashboard dash : dashboard) {
                                                    out.print("<tr>"
                                                            + "<td>" + ii + "</td>"
                                                            + "<td>" + dash.getNombre() + "</td>"
                                                            + "<td>" + dash.getCantProducts() + "</td>"
                                                            + "</tr>");

                                                    ii++;
                                                }

                                            } catch (Exception e) {
                                                out.print("<tr><td colspan=\"3\">"
                                                        + e.getMessage() + "No se pudo listar los productos</td></tr>");
                                            } finally {
                                                dao = null;
                                                if (dashboard != null) {
                                                    dashboard.clear();
                                                }
                                                dashboard = null;
                                            }
                                        %>
                                    </table>
                                </div>
                            </div>
                        </div>
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
    </body>
</html>

<%
  } else {
    response.sendRedirect("admin.jsp");
  }
%>