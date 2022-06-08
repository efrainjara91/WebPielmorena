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

                            <!-- Left side column. contains the logo and sidebar -->
                            <aside class="main-sidebar">
                                <!-- sidebar: style can be found in sidebar.less -->
                                <section class="sidebar">
                                    <!-- Sidebar user panel -->
                                    <div class="user-panel">
                                        <div class="pull-left image">
                                            <img src="dist/img/admin.png" class="img-circle" alt="User Image">
                                        </div>
                                        <div class="pull-left info">
                                            <p>${empleado.getNombreCompleto()}</p>
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
                                        <li class="active">
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
                                                <a href="clientes?accion=listar" class="btn btn-default">
                                                    <i class="fa fa-align-justify"></i> Ver listado</a>                                              
                                            </div>
                                        </div>
                                    </div>
                                </section>
                                <section class="content">
                                    <div class="box">
                                        <div class="box-header with-border">
                                            <i class="fa fa-edit"></i> <h3 class="box-title">Clientes</h3>  
                                            <c:if test="${msje != ''}">
                                                <div>${msje}</div>
                                            </c:if>
                                        </div>
                                        <form class="" action="clientes?accion=${accion}" method="post" onsubmit="return validarCliente();">
                                            <input type="hidden" name="hCodigo" value="${cliente.idCliente}">
                                            <div class="row">
                                                <div class="col-lg-12 left">
                                                    <div class="box-body">
                                                        <div class="col-lg-12 col-sm-12 col-md-12 col-xs-12">
                                                            <label>Los campos con (*) son obligatorios</label>
                                                        </div>

                                                        <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                                            <div class="form-group">
                                                                <label>Nombre (*):</label>
                                                                <input id="txtNombre" type="text" maxlength="100" required="" name="txtNombre" class="form-control" placeholder="Nombre de Cliente" autofocus="" 
                                                                       required="" value="${cliente.nombres}">
                                                            </div>
                                                        </div>
                                                        <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                                            <div class="form-group">
                                                                <label>Apellido Paterno (*):</label>
                                                                <input id="txtRepresentante" type="text" maxlength="20" name="txtApellidoP"  class="form-control" placeholder="Apellido Paterno" required="" 
                                                                       value="${cliente.apellido_paterno}">
                                                            </div>
                                                        </div>
                                                        <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                                            <div class="form-group">
                                                                <label>Apellido Materno (*):</label>
                                                                <input id="txtCargo" type="text" maxlength="20" name="txtApellidoM"  class="form-control" placeholder="Apellido Materno" required="" 
                                                                       value="${cliente.apellido_materno}">
                                                            </div>
                                                        </div>
                                                    </div>

                                                </div>
                                                <div class="col-lg-12 left">
                                                    <div class="box-body">
                                                        <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
                                                            <div class="form-group">
                                                                <label>Tipo Documento (*):</label>
                                                                <select id="cboTDocumento"  name="cboTipoDocumento" class="form-control" required="">
                                                                    <option value="">Seleccione un documento</option>
                                                                    <c:forEach items="${documento}" var="doc">
                                                                        <option value="${doc.codigo}"  
                                                                                <c:if test="${doc.codigo == cliente.getDocumentoIdentidad().codigo}">
                                                                                    selected
                                                                                </c:if>
                                                                                >${doc.nombre}</option>
                                                                    </c:forEach>-
                                                                </select>

                                                            </div>

                                                        </div>
                                                        <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
                                                            <div class="form-group">
                                                                <label>Documento (*):</label>
                                                                <input type="text" name="txtDocumento" id="dni" class="form-control" required="" placeholder="73059476" maxlength="8"
                                                   pattern="[0-9]{8}" title="Número de 8 cifras" value="${cliente.numIdentificación}">
                                                            </div>
                                                        </div>
                                                    </div>

                                                </div>
                                                <div class="col-lg-12 left">
                                                    <div class="box-body">
                                                        <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                                            <div class="form-group">  
                                                                <label>Email (*):</label>
                                                                <input type="email" maxlength="50" name="txtCorreo"  placeholder="ejemplo@cieloluana.com" class="form-control" required=""
                                                                       value="${cliente.correo_electrónico}">
                                                                <!-- <select class="form-control" name="cboDepartamento" onchange="cambia()">
                                                                       <option value="0">-- Seleccione --</option>
                                                                       <option value="1">01 Amazonas</option>
                                                                       <option value="2">02 Áncash</option>
                                                                       <option value="3">03 Apurímac</option>
                                                                       <option value="4">04 Arequipa</option>
                                                                       <option value="5">05 Ayacucho</option>
                                                                       <option value="6">06 Cajamarca</option>
                                                                       <option value="7">07 Callao</option>
                                                                       <option value="8">08 Cusco</option>
                                                                       <option value="9">09 Huancavelica</option>
                                                                       <option value="10">10 Huánuco</option>
                                                                       <option value="11">11 Ica</option>
                                                                       <option value="12">12 Junín</option>
                                                                       <option value="13">13 La Libertad</option>
                                                                       <option value="14">14 Lambayeque</option>
                                                                       <option value="15">15 Lima</option>
                                                                       <option value="16">16 Loreto</option>
                                                                       <option value="17">17 Madre de Dios</option>
                                                                       <option value="18">18 Moquegua</option>
                                                                       <option value="19">19 Pasco</option>
                                                                       <option value="20">20 Piura</option>
                                                                       <option value="21">21 Puno</option>
                                                                       <option value="22">22 San Martín</option>
                                                                       <option value="23">23 Tacna</option>
                                                                       <option value="24">24 Tumbes</option>
                                                                       <option value="25">25 Ucayali</option>
                                                                   </select> -->


                                                            </div>
                                                        </div>

                                                        <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                                            <div class="form-group">    
                                                                <label>Clave (*):</label>
                                                                <input id="clave" type="password" maxlength="20" name="txtClave"  placeholder="Contraseña" class="form-control" required=""
                                                                       value="${cliente.clave}">
                                                            </div>
                                                        </div>
                                                        <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                                            <div class="form-group">
                                                                <label>Género</label>
                                                                <select name="cboGenero" class="form-control">
                                                                    <option>Masculino</option>
                                                                    <option>Femenino</option>
                                                                </select>
                                                            </div>    
                                                        </div>
                                                    </div>

                                                </div>
                                                <div class="col-lg-12 left">
                                                    <div class="box-body">

                                                        <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                                            <div class="form-group">
                                                                <label>Celular</label>
                                                                <input id="celular" type="text" maxlength="9" name="txtCelular" class="form-control" placeholder="999999999" autofocus="" 
                                                                       value="${cliente.celular}">
                                                            </div>
                                                        </div>
                                                        <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                                            <div class="form-group">
                                                                <label>Fecha Nacimiento :</label>
                                                                <input id="fechaNac" type="date" class="form-control" name="txtFechaNac"  data-inputmask="'alias': 'dd/mm/yyyy'" data-mask="" placeholder="dd/mm/yyyy"
                                                                       value="${cliente.fecha_nacimiento}">
                                                            </div>
                                                        </div> 

                                                        <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                                            <div class="form-group">
                                                                <label>Dirección :</label>
                                                                <input type="text" maxlength="100" name="txtDireccion"  class="form-control" placeholder="calle marte 120 - Santa Victoria" 
                                                                       value="${cliente.getDireccion()}">
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col-lg-12 left">
                                                    <div class="box-body">

                                                        <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                                            <div class="form-group hidden">
                                                                <label>Estado :</label>
                                                                <div class="checkbox">
                                                                    <label>
                                                                        <input type="checkbox" name="chkVigencia" 
                                                                               <c:out value="${cliente.isEstado() == false ?
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
                                                    <button class="btn btn-success" type="submit"  value="enviar" id="enviar"><i class="fa fa-floppy-o"></i> Registrar</button>
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

                            <script src="jquery/jquery-3.3.1.min.js"></script>	 	
                            <script src="popper/popper.min.js"></script>	 	 	

                            <!--    Plugin sweet Alert 2  -->
                            <script src="plugins/sweetAlert2/sweetalert2.all.min.js"></script>
                            <script src="codigo.js"></script>
                            <script src="validar.js"></script>    
                            <script src="js/validaciones.js"></script>


                            </body>
                            </html>
                            <%
                                } else {
                                    response.sendRedirect("admin.jsp");
                                }
                            %>

