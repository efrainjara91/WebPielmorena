
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

                                        <li class="treeview">
                                            <a href="#">
                                                <i class="fa fa-lock"></i> <span>Administrar accesos</span>
                                                <i class="fa fa-angle-left pull-right"></i>
                                            </a>
                                            <ul class="treeview-menu menu-open">
                                                <li class=""><a href="cargos?accion=listar"><i class="glyphicon glyphicon-briefcase"></i> Cargos</a></li>


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
                                                <a href="proveedor?accion=listar" class="btn btn-default">
                                                    <i class="fa fa-align-justify"></i> Ver listado</a>                                              
                                            </div>
                                        </div>
                                    </div>
                                </section>
                                <section class="content">
                                    <div class="box">
                                        <div class="box-header with-border">
                                            <i class="fa fa-edit"></i> <h3 class="box-title">Registrar Proveedor</h3>  
                                            <c:if test="${msje != ''}">
                                                <div>${msje}</div>
                                            </c:if>
                                        </div>
                                        <form class="" name="formulario1" action="proveedor?accion=${accion}" method="post">
                                            <input type="hidden" name="hCodigo" value="${proveedor.idProveedor}">
                                            <div class="row">
                                                <div class="col-lg-12 left">
                                                    <div class="box-body">
                                                        <div class="col-lg-12 col-sm-12 col-md-12 col-xs-12">
                                                            <label>Los campos con (*) son obligatorios</label>
                                                        </div>

                                                        <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                                            <div class="form-group">
                                                                <label>Nombre (*):</label>
                                                                <input id="txtNombre" type="text" maxlength="100" name="txtNombre" required="" class="form-control" placeholder="Razón Social" autofocus="" 
                                                                       value="${proveedor.nombre}"/>
                                                            </div>
                                                        </div>
                                                        <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                                            <div class="form-group">
                                                                <label>Representante :</label>
                                                                <input id="txtRepresentante" type="text" maxlength="100" name="txtRepresentante"  class="form-control" placeholder="Nombre de Representante" autofocus="" 
                                                                       value="${proveedor.nombreRepresentante}"/>
                                                            </div>
                                                        </div>
                                                        <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                                            <div class="form-group">
                                                                <label>Cargo :</label>
                                                                <input id="txtCargo" type="text" maxlength="30" name="txtCargo" class="form-control" placeholder="Cargo del Representante"
                                                                       value="${proveedor.cargo}"/>
                                                            </div>
                                                        </div>
                                                    </div>

                                                </div>
                                                <div class="col-lg-12 left">
                                                    <div class="box-body">
                                                        <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                                            <div class="form-group">
                                                                <label>Tipo Proveedor :</label>
                                                                <input id="txtTipoProveedor" type="text" maxlength="80" name="txtTipoProveedor" class="form-control" placeholder="Rubro del Proveedor"
                                                                       value="${proveedor.tipoProveedor}"/>
                                                            </div>
                                                        </div>
                                                        <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                                            <div class="form-group">
                                                                <label>RUC (*):</label>
                                                                <input id="txtRUC" type="text" maxlength="11" name="txtRUC" required="" class="form-control" placeholder="Número de documento" 
                                                                       value="${proveedor.RUC}"/>
                                                            </div>
                                                        </div>
                                                        <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                                            <div class="form-group">  
                                                                <label>Dirección :</label>
                                                                <input id="txtRUC" type="text" maxlength="70" name="txtDireccion"  class="form-control" placeholder="Dirección del Proveedor"
                                                                       value="${proveedor.direccion}"/>
                                                            </div>
                                                        </div>
                                                    </div>

                                                </div>
                                                <div class="col-lg-12 left">
                                                    <div class="box-body">


                                                        <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                                            <div class="form-group">
                                                                <label>Celular :</label>
                                                                <input id="txtCelular" type="text" maxlength="12" name="txtCelular" class="form-control" placeholder="Ingrese el teléfono"
                                                                       value="${proveedor.telefono}" />
                                                            </div>
                                                        </div>

                                                        <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                                            <div class="form-group">
                                                                <label>Estado:</label>
                                                                <div class="checkbox">
                                                                    <label>
                                                                        <input type="checkbox" name="chkVigencia" 
                                                                               <c:out value="${proveedor.estado == false ?
                                                                                               'unchecked' : 'checked'}"
                                                                                      default="" />>Activo
                                                                    </label>
                                                                </div>

                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="box-footer"> 
                                                <div class="col-lg-8 col-md-8 col-sm-12 col-xs-12 left">
                                                    <button class="btn btn-success" type="submit"><i class="fa fa-floppy-o"></i> Registrar</button>
                                                    <button type="reset" class="btn btn-danger"><i class="fa fa-close red"></i> Cancelar</button>
                                                    <hr>
                                                    <span class="lead text-primary"></span>
                                                </div>
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


                            <!--<script type="text/javascript">
                                                                    //1) Definir Las Variables Correspondintes
                                                                    var opt_1 = new Array("-- Seleccione --", "Chachapoyas", "Bagua", "Bongará", "Condorcanqui", "Luya", "Rodríguez de Mendoza", "Utcubamba");
                                                                    var opt_2 = new Array("-- Seleccione --", "Huaraz", "Aija", "Antonio Raymondi", "Asunción", "Bolognesi", "Carhuaz", "Carlos Fermín Fitzcarrald", "Casma", "Corongo", "Huari", "Huarmey", "Huaylas", "Luzuriaga", "Ocros", "Pomabamba", "Recuay", "Santa", "Sihuas", "Yungay");
                                                                    var opt_3 = new Array("-- Seleccione --", "Abancay", "Andahuaylas", "Antabamba", "Aymaraes", "Cotabambas", "Chincheros", "Grau");
                                                                    var opt_4 = new Array("-- Seleccione --", "Arequipa", "Camaná", "Caravelí", "Caylloma", "Condesuyos", "Islay", "La Uniòn");



                                                                    // 2) crear una funcion que permita ejecutar el cambio dinamico

                                                                    function cambia() {
                                                                        var cosa;
                                                                        //Se toma el vamor de la "cosa seleccionada"
                                                                        cosa = document.formulario1.cboDepartamento[document.formulario1.cboDepartamento.selectedIndex].value;
                                                                        //se chequea si la "cosa" esta definida
                                                                        if (cosa != 0) {
                                                                            //selecionamos las cosas Correctas
                                                                            mis_opts = eval("opt_" + cosa);
                                                                            //se calcula el numero de cosas
                                                                            num_opts = mis_opts.length;
                                                                            //marco el numero de opt en el select
                                                                            document.formulario1.cboProvincia.length = num_opts;
                                                                            //para cada opt del array, la pongo en el select
                                                                            for (i = 0; i < num_opts; i++) {
                                                                                document.formulario1.cboProvincia.options[i].value = mis_opts[i];
                                                                                document.formulario1.cboProvincia.options[i].text = mis_opts[i];
                                                                            }
                                                                        } else {
                                                                            //si no habia ninguna opt seleccionada, elimino las cosas del select
                                                                            document.formulario1.cboProvincia.length = 1;
                                                                            //ponemos un guion en la unica opt que he dejado
                                                                            document.formulario1.cboProvincia.options[0].value = "-";
                                                                            document.formulario1.cboProvincia.options[0].text = "-";
                                                                        }
                                                                        //hacer un reset de las opts
                                                                        document.formulario1.cboProvincia.options[0].selected = true;

                                                                    }



                            </script>
                            -->