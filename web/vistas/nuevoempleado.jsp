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
        <script src="http://code.jquery.com/jquery-1.11.0.min.js"></script>
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
                                                <li><a href="ControladorPrincipal?accion=NuevaVenta"><i class="fa fa-cart-plus"></i> Nueva Venta</a></li>


                                            </ul>
                                        </li>

                                        <li class="active">
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
                                                <a href="Empleado?accion=listar" class="btn btn-default">
                                                    <i class="fa fa-align-justify"></i> Ver listado</a>                                              
                                            </div>
                                        </div>
                                    </div>
                                </section>
                                <section class="content">
                                    <div class="box">
                                        <form class="" action="Empleado?accion=${accion}" method="post">
                                            <input type="hidden" name="hCodigo" value="${regEmpleado.getId_Empleados()}">
                                            

                                            <div class="box-header with-border">
                                                <center><p style="color: #ff0000">${sessionScope['errormsje']}</p></center>
                                                <i class="fa fa-edit"></i> <h3 class="box-title">Empleados</h3>  
                                            </div>
                                            <div class="row">
                                                <div class="col-lg-12 left">
                                                    <div class="box-body">
                                                        <div class="col-lg-12 col-sm-12 col-md-12 col-xs-12">
                                                            <label>Los campos con (*) son obligatorios</label>
                                                        </div>

                                                        <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
                                                            <div class="form-group">
                                                                <label>Nombre (*):</label>
                                                                <input id="txtNombre" required="" type="text" maxlength="100" name="txtNombre"  class="form-control" placeholder="Nombre de Empleado" 
                                                                       autofocus=""  value="${regEmpleado.nombre}">
                                                            </div>
                                                        </div>
                                                        <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
                                                            <div class="form-group">
                                                                <label>Apellidos (*):</label>
                                                                <input id="txtApellidos" type="text" maxlength="100" name="txtApellidos"   class="form-control" placeholder="Apellidos" required="" 
                                                                       value="${regEmpleado.apellidos}">
                                                            </div>
                                                        </div>
                                                    </div>

                                                </div>
                                                <div class="col-lg-12 left">
                                                    <div class="box-body">
                                                        <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
                                                            <div class="form-group">
                                                                <label>Tipo Documento (*):</label>
                                                                <select required="" id="cboTipoDocumento" name="cboTipoDocumento" class="form-control">
                                                                    <option value="">Seleccione</option>
                                                                    <c:forEach items="${documento}" var="doc">
                                                                        <option value="${doc.codigo}"  
                                                                                <c:if test="${doc.codigo == 
                                                                                              regEmpleado.getDocumentoIdentidad().codigo}">
                                                                                      selected
                                                                                </c:if>
                                                                                >${doc.nombre}</option>
                                                                    </c:forEach>
                                                                </select>
                                                            </div>

                                                        </div>
                                                        <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
                                                            <div class="form-group">
                                                                <label>Documento (*):</label>
                                                                <input id="txtDocumento" type="text" maxlength="8" name="txtDocumento"  class="form-control" placeholder="Número de documento" required="" 
                                                                       value="${regEmpleado.numDocumento}">
                                                            </div>
                                                        </div>
                                                    </div>

                                                </div>
                                                <div class="col-lg-12 left">
                                                    <div class="box-body">

                                                        <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
                                                            <div class="form-group">
                                                                <label>Dirección :</label>
                                                                <input id="txtDireccion" type="text" maxlength="100" name="txtDireccion" class="form-control" placeholder="Ingrese Dirección" 
                                                                       value="${regEmpleado.direccion}">
                                                            </div>
                                                        </div>
                                                        <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
                                                            <div class="form-group">
                                                                <label>Celular :</label>
                                                                <input id="txtCelular" type="text" maxlength="9" name="txtCelular" class="form-control" placeholder="Ingrese el teléfono" 
                                                                       value="${regEmpleado.celular}">
                                                            </div>
                                                        </div>
                                                    </div>

                                                </div>
                                                <div class="col-lg-12 left">
                                                    <div class="box-body">
                                                        <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                                            <div class="form-group">  
                                                                <label>Usuario (*):</label>
                                                                <input id="usuario" type="text" maxlength="20" name="txtUsuario"  placeholder="Nombre Usuario" class="form-control" required=""
                                                                       value="${regEmpleado.nombreUsuario}">


                                                            </div>
                                                        </div>

                                                        <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">

                                                            <label for="pass">Clave :</label>
                                                            <div class="input-group">
                                                                <input class="form-control" type="password" maxlength="20"  name="txtClave" placeholder="Contraseña"
                                                                       data-toggle="tooltip" title="Este campo esta deshabilitado.La contraseña del empleado es igual al Número de Documento" 
                                                                       value="${regEmpleado.getClave()}"/>
                                                                <span id="show-hide-passwd" action="hide" class="input-group-addon glyphicon glyphicon glyphicon-eye-open"></span>
                                                            </div>

                                                        </div>
                                                        <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                                            <div class="form-group">
                                                                <label>Cargo (*):</label>
                                                                <select required="" id="cboCargo" name="cboCargo" class="form-control" required="">
                                                                    <c:forEach items="${cargos}" var="ca">
                                                                        <option value="${ca.codigo}"  
                                                                                <c:if test="${ca.codigo == 
                                                                                              regEmpleado.cargo.codigo}">
                                                                                      selected
                                                                                </c:if>
                                                                                >${ca.descripcion}</option>
                                                                    </c:forEach>
                                                                </select>
                                                            </div>
                                                        </div>
                                                    </div>

                                                </div>

                                                <div class="col-lg-12 left">
                                                    <div class="box-body">

                                                        <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                                            <label>Permisos:</label>
                                                            <ul style="list-style: none;" id="permission"><li> <input class="js-switch" id="checks" type="checkbox" name="permission[]" value="1">Dashboard</li><li> <input class="js-switch" id="checks" type="checkbox" name="permission[]" value="2">Almacen</li><li> <input class="js-switch" id="checks" type="checkbox" name="permission[]" value="3">Compras</li><li> <input class="js-switch" id="checks" type="checkbox" name="permission[]" value="4">Ventas</li><li> <input class="js-switch" id="checks" type="checkbox" name="permission[]" value="5">Acceso</li><li> <input class="js-switch" id="checks" type="checkbox" name="permission[]" value="6">Consulta Compras</li><li> <input class="js-switch" id="checks" type="checkbox" name="permission[]" value="7">Consulta Ventas</li><li> <input class="js-switch" id="checks" type="checkbox" name="permission[]" value="8">Configuracion</li><li> <input class="js-switch" id="checks" type="checkbox" name="permission[]" value="9">Inventario</li></ul>
                                                        </div>

                                                        <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                                            <div class="form-group">
                                                                <label>Estado :</label>
                                                                <div class="checkbox">
                                                                    <label>
                                                                        <input type="checkbox" name="chkVigencia" 
                                                                               <c:out value="${regEmpleado.isVigencia() == false ?
                                                                                               'unchecked' : 'checked'}"
                                                                                      default="" />>Activo
                                                                    </label>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>

                                                </div>
                                            </div>
                                            <!-- /.box-body -->
                                            <div class="box-footer">
                                                <button type="reset" class="btn btn-danger"><i class="fa fa-close red"></i> Cancelar</button>
                                                <button type="submit" name="btnRegistrar"  class="btn btn-primary"><i class="fa fa-check"></i> Registrar</button></i>

                                            </div>
                                            <!-- /.box-footer-->
                                        </form>
                                    </div>

                                    <!-- /.box -->

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
                            <!-- Bootstrap 3.3.7 -->
                            <script src="bower_components/bootstrap/dist/js/bootstrap.min.js"></script>

                            <!-- AdminLTE App -->
                            <script src="dist/js/adminlte.min.js"></script>

                            <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
                            <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
                            <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>


                            <!-- código JS propìo-->    
                            <script src="js/funciones.js" type="text/javascript"></script>

                            <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
                            <script>
                                $(document).on('ready', function () {
                                    $('#show-hide-passwd').on('click', function (e) {
                                        e.preventDefault();
                                        var current = $(this).attr('action');
                                        if (current == 'hide') {
                                            $(this).prev().attr('type', 'text');
                                            $(this).removeClass('glyphicon-eye-open').addClass('glyphicon-eye-close').attr('action', 'show');
                                        }
                                        if (current == 'show') {
                                            $(this).prev().attr('type', 'password');
                                            $(this).removeClass('glyphicon-eye-close').addClass('glyphicon-eye-open').attr('action', 'hide');
                                        }
                                    })
                                })
                            </script>
                            </body>
                            </html>

                            <%
                                } else {
                                    response.sendRedirect("admin.jsp");
                                }
                            %>