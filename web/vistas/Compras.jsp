<%@page import="Modelo.Empleados"%>
<%@page import="java.util.List"%>
<%@page import="Config.Fecha"%>
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

        <!-- Theme style -->
        <!-- Theme style -->
        <link rel="stylesheet" href="dist/css/AdminLTE.min.css">
        <link rel="stylesheet" href="dist/css/skins/_all-skins.min.css">
        <link rel="stylesheet" type="text/css" href="dist/css/datatables.min.css"/>
        <link rel="stylesheet" href="dist/css/diseño.css">

        <link rel="stylesheet" href="https://cdn.datatables.net/buttons/1.5.6/css/buttons.dataTables.min.css"> 

        <link rel="stylesheet" type="text/css" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
        <link rel="stylesheet" type="text/css" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.5.0/css/font-awesome.min.css">

        <link rel="stylesheet" href="https://cdn.datatables.net/1.10.19/css/jquery.dataTables.min.css">
        <link href="dist/css/select2.css" rel="stylesheet" type="text/css"/>

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
                                            <li class=""><a href="Marcas?accion=listar"><i class="fa fa-tags"></i> Marcas</a></li>
                                        </ul>
                                    </li>

                                    <li class="treeview active">
                                        <a href="#">
                                            <i class="glyphicon glyphicon-arrow-right"></i>
                                            <span>Compras</span>
                                            <span class="label label-primary pull-right">C

                                            </span>
                                        </a>
                                        <ul class="treeview-menu">
                                            <li class="active"><a href="ControladorCompras?accion=NuevaCompra" ><i class="glyphicon glyphicon-plus-sign"></i> Nueva Compra</a></li>
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

                                </div>

                            </section>
                            <section class="content">

                                <div class="box">    
                                    <div class="box-header with-border">             
                                        <h3 class="box-title">Registrar Compra</h3>
                                    </div>
                                    <div class="box-body">
                                        <div class="mt-1 ml-4 mr-4">

                                            <div class="row cabecera">                 
                                                <div class="form-group col-md-3">
                                                    <label class="control-label">Proveedor</label>
                                                    <select class="form-control" name="cboProveedor" id="cboProveedor" required="">
                                                        <option value="">Seleccione Proveedor</option>
                                                        <c:forEach items="${proveedores}" var="prov">
                                                            <option value="${prov.idProveedor}"  
                                                                    <c:if test="${prov.idProveedor == pcvalor}">
                                                                        selected
                                                                    </c:if>
                                                                    >${prov.nombre}</option>
                                                        </c:forEach>
                                                    </select>
                                                </div>
                                                <div class="form-group col-md-3">
                                                    <label class="control-label">Tipo Comprobante</label>
                                                    <select class="form-control" name="cboDocumento" id="cboDocumento" required="">
                                                        <option value="">Seleccione Comprobante</option>
                                                        <c:forEach items="${comprobante}" var="compro">
                                                            <option  value="${compro.codigo}"  
                                                                     <c:if test="${compro.codigo == dcvalor}">
                                                                         selected
                                                                     </c:if>
                                                                     >${compro.nombre}</option>
                                                        </c:forEach>

                                                    </select>
                                                </div>
                                                <div class="form-group col-md-3">
                                                    <label class="control-label">Factura N°</label>
                                                    <input type="text" required="" id="NroFactura" maxlength="9" class="form-control text-center" style="height: 35px;" name="txtSerie" value="${NroFactura}"  placeholder="Ingrese Nº Factura">
                                                </div> 


                                                <div class="form-group col-md-3">
                                                    <%
                                                        Fecha fecha = new Fecha();
                                                    %>
                                                    <label class="control-label">Fecha</label>
                                                    <input type="text" class="form-control datepicker text-center" style="height: 35px; font-size: 20px" name="txtFecha" value="<%= fecha.Fecha()%>" readonly="readonly">

                                                </div>                           
                                                <div class="form-group col-md-3">
                                                    <!--<label>Agregar Producto</label><br>-->
                                                    <button class="btn btn-info btn-block" type="button" data-toggle="modal" data-target="#buscarproductos"><i class="fa fa-search"></i> Buscar Producto</button>
                                                </div>

                                            </div>         

                                            <!-- Modal -->
                                            <div class="modal fade" id="buscarproductos" tabindex="-1" role="dialog">
                                                <div class="modal-dialog modal-lg" role="document">
                                                    <div class="modal-content">
                                                        <div class="modal-header">
                                                            <h4 class="modal-title"><i class="fa fa-suitcase"></i> Productos</h4>
                                                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                                <span aria-hidden="true">&times;</span>
                                                            </button>                            
                                                        </div>
                                                        <div class="modal-body">
                                                            <div class="table-responsive" >  
                                                                <table class="table table table-borderless" id="myTable" data-page-length='04'>
                                                                    <thead>
                                                                        <tr class="warning">
                                                                            <th></th>
                                                                            <th>Producto</th>
                                                                            <th>Imagen</th>
                                                                            <th>Stock</th>
                                                                            <th>Descripcion</th>                                          
                                                                            <th>Marca</th>                                        
                                                                        </tr>
                                                                    </thead>  
                                                                    <c:forEach var="prod" items="${productos}" varStatus="iteracion"  >
                                                                        <tr>
                                                                            <!--<td>${iteracion.index + 1}</td>-->
                                                                            <td class="text-center">
                                                                                <a href="ControladorCompras?accion=AgregarProductoaFactura&cod=${prod.id_Producto}" class="btn btn-warning" data-toggle="tooltip" title="" data-original-title="Agregar al detalle">
                                                                                    <i class="fa fa-check">Agregar</i>
                                                                                </a> 
                                                                            </td> 
                                                                            <td>${prod.nombre}</td>
                                                                            <td><img src="${prod.getImagen()}" width="80" height="80"></td>

                                                                            <td>${prod.stock}</td>
                                                                            <td class="text-center">${prod.descripcion}</td>                                            
                                                                            <td class="text-center">${prod.marca.nombre}</td>                                                                                  
                                                                        </tr>
                                                                    </c:forEach> 
                                                                </table>
                                                            </div>   
                                                        </div>                     
                                                    </div>
                                                </div>
                                            </div>
                                            <!--Tabla-->
                                            <div class="row">
                                                <div class="col-md-9">
                                                    <table class="table table-borderless">
                                                        <thead class="thead-light">
                                                            <tr>
                                                                <th class="text-center">N°</th>                                
                                                                <th class="text-center">DESCRIPCION</th>
                                                                <th class="text-center">CANTIDAD</th>
                                                                <th class="text-center">PRECIO</th>                                
                                                                <th class="text-center for">ACCION</th>
                                                            </tr>  
                                                        </thead>
                                                        <tbody>
                                                            <c:forEach var="det" items="${listaProductosFactura}" varStatus="iteracion">
                                                                <tr>
                                                                    <td class="text-center">${iteracion.index + 1}</td>                                
                                                                    <td>${det.descripcion}</td>
                                                                    <td style="width: 5%"> 
                                                                        <input type="hidden" id="idpro" value="${det.id}">
                                                                        <input type="number" id="Cantidad" value="${det.cant}" class="form-control text-center">
                                                                    </td>
                                                                    <td style="width: 20%" class="text-center">
                                                                        <input type="hidden" id="idpro" value="${det.id}">
                                                                        <input type="text" id="Precio" value="${det.precioCompras}"class="form-control text-center">
                                                                    </td>                                  
                                                                    <td class="text-center for" style="width: 5%">                                                                        
                                                                        <a href="ControladorCompras?accion=Delete&id=${det.id}" class="btn btn-danger btn-sm"><i class="fa fa-trash"></i> Eliminar</a>
                                                                    </td>
                                                                </tr>
                                                            </c:forEach>
                                                        </tbody>
                                                    </table>
                                                </div>                
                                                <div class="col-md-3">                    
                                                    <div class="card">                       
                                                        <div class="card-body">
                                                            TotalPagar
                                                            <input value="${monto}" type="text" class="form-control" readonly="">
                                                            <br>
                                                            <a href="ControladorCompras?accion=RegistrarCompra" type ="submit" class="btn btn-success btn-block">Registrar</a>
                                                            <a href="ControladorCompras?accion=Cancelar" class=" btn btn-danger btn-block" >Cancelar</a>
                                                        </div>                        
                                                    </div>             
                                                </div>
                                            </div>

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

                        <script src="https://code.jquery.com/jquery-3.4.1.js" integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU=" crossorigin="anonymous"></script>
                        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
                        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
                        <script src="https://cdn.datatables.net/1.10.19/js/jquery.dataTables.min.js" type="text/javascript"></script>
                        <script src="dist/js/select2.js"></script>  


                        <script>
                            $(document).ready(function () {
                                $('#myTable').DataTable();
                            });
                        </script>
                        <script>
                            $(document).ready(function () {
                                $("tr #Cantidad").change(function () {
                                    var idp = $(this).parent().find("#idpro").val();
                                    var url = "ControladorCompras?accion=ActualizarCantidad";
                                    var cantidad = $(this).parent().find("#Cantidad").val();
                                    $("tr #Cantidad").load(url, {"arreglo[]": [idp, cantidad]});
                                    location.href = "ControladorCompras?accion=Listar";
                                });
                                $("tr #Precio").click(function () {
                                    var idp = $(this).parent().find("#idpro").val();
                                    var url = "ControladorCompras?accion=ActualizarPrecio";
                                    var precio = $(this).parent().find("#Precio").val();
                                    $("tr #Cantidad").load(url, {"arreglo[]": [idp, precio]});
                                    location.href = "ControladorCompras?accion=Listar";
                                });
                            });
                        </script> 
                        <%
                            int var1 = (Integer) session.getAttribute("pcvalor");
                            int var2 = (Integer) session.getAttribute("dcvalor");

                        %>
                        <script>
                            //Selecccionar Cliente y Tipo de Documento
                            $(document).ready(function () {
                                $('#cboProveedor').select2();
                                $('#cboDocumento').select2();
                                //Cliente
                                $('select#cboProveedor').on('change', function () {
                                    var valor1 = $(this).val();
                                    var texto1 = $("#cboProveedor option:selected").text();
                                    var url = "ControladorCompras?accion=SeleccionarProveedor";
                                    $.ajax({
                                        type: 'POST',
                                        url: url,
                                        data: {"valor1": valor1, "nomprov": texto1},
                                        success: function (res) {
                                        }
                                    });
                                }).on('change', function () {
                                }).find("option[value='<%= var1%>']").prop("selected", true);
                                ///Comprobante
                                $('select#cboDocumento').on('change', function () {
                                    var valor2 = $(this).val();
                                    var texto2 = $("#cboDocumento option:selected").text();
                                    var url = "ControladorCompras?accion=SeleccionarComprobante";
                                    $.ajax({
                                        type: 'POST',
                                        url: url,
                                        data: {"valor2": valor2, "tipocompro": texto2},
                                        success: function (res) {
                                        }
                                    });
                                }).on('change', function () {
                                }).find("option[value='<%= var2%>']").prop("selected", true);

                                $("div #NroFactura").on('change', function () {
                                    var numFac = $(this).val();
                                    var url = "ControladorCompras?accion=AgregarNumeroFactura";
                                    $.ajax({
                                        type: 'POST',
                                        url: url,
                                        data: "numeroFAC=" + numFac,
                                        success: function (res) {
                                        }
                                    });
                                });
                            });

                        </script> 
                        </body>
                        </html>
                        <%
                            } else {
                                response.sendRedirect("admin.jsp");
                            }
                        %>