
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
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


        <!-- SWEET ALERT-->
        <link rel="stylesheet" href="plugins/sweetAlert2/sweetalert2.min.css">
        <link rel="stylesheet" href="plugins/animate.css/animate.css">  


    </head>
    <body class="hold-transition skin-blue fixed sidebar-mini">
        <div class="wrapper">

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
                                        <li class="treeview">
                                            <a href="#">
                                                <i class="fa fa-wrench"></i> <span>Configuración</span>

                                                <i class="fa fa-angle-left pull-right"></i>

                                            </a>
                                            <ul class="treeview-menu">
                                                <li><a href="comprobantes?accion=listar"><i class="fa fa-circle-o"></i> Tipo Documento</a></li>
                                            </ul>
                                        </li>

                                        <li class="treeview active">
                                            <a href="#">
                                                <i class="fa fa-lock"></i> <span>Administrar accesos</span>
                                                <i class="fa fa-angle-left pull-right"></i>
                                            </a>
                                            <ul class="treeview-menu menu-open">
                                                <li class="active"><a href="cargos?accion=listar"><i class="glyphicon glyphicon-briefcase"></i> Cargos</a></li>


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
                                        <div class="col-xs-10 col-md-5 ">
                                            <div class="btn-group pull-right">
                                                <a href="cargos?accion=listar" class="btn btn-default">
                                                    <i class="fa fa-align-justify"></i> Ver listado</a>                                              
                                            </div>
                                        </div>
                                    </div>
                                </section>
                                <section class="content">
                                    <div class="box">
                                        <div class="box-header with-border">
                                            <i class="fa fa-edit"></i> <h3 class="box-title">Cargos</h3>  

                                        </div>
                                        <!-- /.box-header -->
                                        <!-- form start -->



                                        <form class="form-horizontal" action="cargos?accion=${accion}" method="post" onsubmit="return validarCargo();">
                                            <input  type="hidden" name="hCodigo" value="${cargo.codigo}">
                                            <div class="box-body">

                                                <div class="form-group">
                                                    <label class="col-sm-2 control-label">Cargo</label>
                                                    <div class="col-sm-4 input-group">
                                                        <span class="input-group-addon"><i class="fa  fa-folder"></i></span>
                                                        <input id="nombre" type="text" class="form-control" placeholder="Nombre del Cargo" name="txtNombre" maxlength="10"
                                                               value="${cargo.descripcion}">
                                                    </div>
                                                </div>

                                                <div class="form-group">
                                                    <div class="col-sm-offset-2 col-sm-10">
                                                        <div class="checkbox">
                                                            <label>
                                                                <input type="checkbox" name="chkVigencia" 
                                                                       <c:out value="${cargo.vigencia == false ?
                                                                                       'unchecked' : 'checked'}"
                                                                              default="" />>Vigente
                                                            </label>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <!-- /.box-body -->
                                            <div class="box-footer">
                                                <button type="reset" class="btn btn-danger"><i class="fa fa-close red"></i> Cancelar</button>
                                                <button type="submit" id="" name="btnRegistrar" value="Registrar" class="btn btn-success"><i class="fa fa-floppy-o"></i> Registrar</button></i>

                                            </div>
                                            <!-- /.box-footer -->
                                        </form>
                                    </div>
                                </section> 

                            </div>
                            <!-- /.content-wrapper -->

                            <footer class="main-footer">
                                <div class="pull-right hidden-xs">
                                    <b>Version</b> 1.0
                                </div>
                                <strong>Copyright &copy; 2022-2099 <a href="principal.jsp">QuantumGroup</a>.</strong> Todos los derechos 
                                reservados.
                            </footer>
                            <script src="dist/js/adminlte.min.js"></script>
                            <script src="bower_components/jquery/dist/jquery.min.js"></script>
                            <script src="bower_components/bootstrap/dist/js/bootstrap.min.js"></script>
                            <script src="dist/js/adminlte.min.js"></script>


                            <script src="jquery/jquery-3.3.1.min.js"></script>	 	
                            <script src="popper/popper.min.js"></script>	 	 	

                            <!--    Plugin sweet Alert 2  -->
                            <script src="plugins/sweetAlert2/sweetalert2.all.min.js"></script>

                            <script src="codigo.js">


                            </script> 
                            <script src="validar.js">

                            </script>



                            </body>
                            </html>
                            <%
                                } else {
                                    response.sendRedirect("admin.jsp");
                                }
                            %>

