
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page session="true"%>

<html>
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <title>Piel Morena Shop</title>
        <!-- Tell the browser to be responsive to screen width -->
        <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
        <!-- Bootstrap 3.3.7 -->
        <link rel="icon" type="../image/png" href="../dist/img/piel.png">

        <!-- Font Awesome -->
        <link rel="stylesheet" href="../bower_components/font-awesome/css/font-awesome.min.css">

        <!-- Theme style -->
        <link rel="stylesheet" href="../dist/css/AdminLTE.min.css">
        <link rel="stylesheet" href="../dist/css/skins/_all-skins.min.css">
        <link rel="stylesheet" type="text/css" href="../dist/css/datatables.min.css"/>
        <link rel="stylesheet" href="../dist/css/diseño.css">

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
                                <img src="../dist/img/admin.png" class="user-image" alt="User Image">
                                <span class="hidden-xs">${empleado.getNombreCompleto()} </span>
                            </a>
                            <ul class="dropdown-menu">

                                <!-- User image -->
                                <li class="user-header">
                                    <img src="../dist/img/admin.png" class="img-circle" alt="User Image">
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
                                        <img src="../dist/img/admin.png" class="img-circle" alt="User Image">
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
                                        <a href="../Principal.jsp">
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
                                            <li class=""><a href="Cargo.jsp"><i class="glyphicon glyphicon-briefcase"></i> Cargos</a></li>


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
                                            <a href="Marcas?accion=nu" class="btn btn-success">
                                                <i class="fa fa-plus"></i> Nueva Marca</a>                                              
                                        </div>
                                    </div>
                                </div>

                            </section>
                            <section class="content">

                                <div class="row">
                                    <div class="col-md-12">

                                        <div class="nav-tabs-custom">
                                            <ul class="nav nav-tabs">
                                                <li class="active"><a href="#tab_1" data-toggle="tab">Logo</a></li>
                                                <li><a href="#tab_2" data-toggle="tab">Favicon</a></li>
                                                <li><a href="#tab_3" data-toggle="tab">Pie de página &amp; Contacto</a></li>

                                            </ul>
                                            <div class="tab-content">
                                                <div class="tab-pane active" id="tab_1">


                                                    <form class="form-horizontal" action="" method="post" enctype="multipart/form-data">
                                                        <div class="box box-info">
                                                            <div class="box-body">
                                                                <div class="form-group">
                                                                    <label for="" class="col-sm-2 control-label">Imagen actual</label>
                                                                    <div class="col-sm-6" style="padding-top:6px;">
                                                                        <img src="../assets/uploads/logo.jpg" class="existing-photo" style="height:80px;">
                                                                    </div>
                                                                </div>
                                                                <div class="form-group">
                                                                    <label for="" class="col-sm-2 control-label">Nueva foto</label>
                                                                    <div class="col-sm-6" style="padding-top:6px;">
                                                                        <input type="file" name="photo_logo">
                                                                    </div>
                                                                </div>
                                                                <div class="form-group">
                                                                    <label for="" class="col-sm-2 control-label"></label>
                                                                    <div class="col-sm-6">
                                                                        <button type="submit" class="btn btn-success pull-left" name="form1">Actualizar Logo</button>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </form>




                                                </div>
                                                <div class="tab-pane" id="tab_2">

                                                    <form class="form-horizontal" action="" method="post" enctype="multipart/form-data">
                                                        <div class="box box-info">
                                                            <div class="box-body">
                                                                <div class="form-group">
                                                                    <label for="" class="col-sm-2 control-label">Imagen actual</label>
                                                                    <div class="col-sm-6" style="padding-top:6px;">
                                                                        <img src="../assets/uploads/favicon.png" class="existing-photo" style="height:40px;">
                                                                    </div>
                                                                </div>
                                                                <div class="form-group">
                                                                    <label for="" class="col-sm-2 control-label">Nueva fotoo</label>
                                                                    <div class="col-sm-6" style="padding-top:6px;">
                                                                        <input type="file" name="photo_favicon">
                                                                    </div>
                                                                </div>
                                                                <div class="form-group">
                                                                    <label for="" class="col-sm-2 control-label"></label>
                                                                    <div class="col-sm-6">
                                                                        <button type="submit" class="btn btn-success pull-left" name="form2">Actualizar Favicon</button>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </form>


                                                </div>
                                                <div class="tab-pane" id="tab_3">

                                                    <form class="form-horizontal" action="" method="post">
                                                        <div class="box box-info">
                                                            <div class="box-body">
                                                                
                                                                <div class="form-group">
                                                                    <label for="" class="col-sm-2 control-label">Píe de página - Acerca de Nosotros </label>
                                                                    <div class="col-sm-9">
                                                                        <textarea class="form-control" name="contact_map_iframe" style="height:200px;">Piel Morena</textarea>
                                                                    </div>
                                                                </div>
                                                                <div class="form-group">
                                                                    <label for="" class="col-sm-2 control-label">Píe de página - Copyright </label>
                                                                    <div class="col-sm-9">
                                                                        <input class="form-control" type="text" name="footer_copyright" value="Copyright © 2017. All Rights Reserved.">
                                                                    </div>
                                                                </div>                              
                                                                <div class="form-group">
                                                                    <label for="" class="col-sm-2 control-label">Contacto </label>
                                                                    <div class="col-sm-6">
                                                                        <textarea class="form-control" name="contact_address" style="height:140px;">Aguas Verdes.</textarea>
                                                                    </div>
                                                                </div>
                                                                <div class="form-group">
                                                                    <label for="" class="col-sm-2 control-label">Email de Contacto </label>
                                                                    <div class="col-sm-6">
                                                                        <input type="text" class="form-control" name="contact_email" value="info@cieloluana.com">
                                                                    </div>
                                                                </div>
                                                                <div class="form-group">
                                                                    <label for="" class="col-sm-2 control-label">Telefono de Contacto</label>
                                                                    <div class="col-sm-6">
                                                                        <input type="text" class="form-control" name="contact_phone" value="999999999">
                                                                    </div>
                                                                </div>
                                                                
                                                                <div class="form-group">
                                                                    <label for="" class="col-sm-2 control-label">Mapa Contacto</label>
                                                                    <div class="col-sm-9">
                                                                        <textarea class="form-control" name="contact_map_iframe" style="height:200px;">&lt;iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d387142.84040262736!2d-74.25819605476612!3d40.70583158628177!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x89c24fa5d33f083b%3A0xc80b8f06e177fe62!2sNew+York%2C+NY%2C+USA!5e0!3m2!1sen!2sbd!4v1485712851643" width="600" height="450" frameborder="0" style="border:0" allowfullscreen&gt;&lt;/iframe&gt;</textarea>
                                                                    </div>
                                                                </div>
                                                                <div class="form-group">
                                                                    <label for="" class="col-sm-2 control-label"></label>
                                                                    <div class="col-sm-6">
                                                                        <button type="submit" class="btn btn-success pull-left" name="form3">Actualizar</button>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </form>
                                                </div>
                                                <div class="tab-pane" id="tab_7">

                                                    <table class="table table-bordered">
                                                        <tbody><tr>
                                                        <form action="" method="post" enctype="multipart/form-data"></form>
                                                        <td style="width:50%">
                                                            <h4>Existing Login Page Banner</h4>
                                                            <p>
                                                                <img src="../assets/uploads/banner_login.jpg" alt="" style="width: 100%;height:auto;"> 
                                                            </p>                                        
                                                        </td>
                                                        <td style="width:50%">
                                                            <h4>Change Login Page Banner</h4>
                                                            Select Photo<input type="file" name="photo">
                                                            <input type="submit" class="btn btn-primary btn-xs" value="Change" style="margin-top:10px;" name="form7_1">
                                                        </td>

                                                        </tr>
                                                        <tr>
                                                        <form action="" method="post" enctype="multipart/form-data"></form>
                                                        <td style="width:50%">
                                                            <h4>Existing Registration Page Banner</h4>
                                                            <p>
                                                                <img src="../assets/uploads/banner_registration.jpg" alt="" style="width: 100%;height:auto;">  
                                                            </p>                                        
                                                        </td>
                                                        <td style="width:50%">
                                                            <h4>Change Registration Page Banner</h4>
                                                            Select Photo<input type="file" name="photo">
                                                            <input type="submit" class="btn btn-primary btn-xs" value="Change" style="margin-top:10px;" name="form7_2">
                                                        </td>

                                                        </tr>
                                                        <tr>
                                                        <form action="" method="post" enctype="multipart/form-data"></form>
                                                        <td style="width:50%">
                                                            <h4>Existing Forget Password Page Banner</h4>
                                                            <p>
                                                                <img src="../assets/uploads/banner_forget_password.jpg" alt="" style="width: 100%;height:auto;">   
                                                            </p>                                        
                                                        </td>
                                                        <td style="width:50%">
                                                            <h4>Change Forget Password Page Banner</h4>
                                                            Select Photo<input type="file" name="photo">
                                                            <input type="submit" class="btn btn-primary btn-xs" value="Change" style="margin-top:10px;" name="form7_3">
                                                        </td>

                                                        </tr>
                                                        <tr>
                                                        <form action="" method="post" enctype="multipart/form-data"></form>
                                                        <td style="width:50%">
                                                            <h4>Existing Reset Password Page Banner</h4>
                                                            <p>
                                                                <img src="../assets/uploads/banner_reset_password.jpg" alt="" style="width: 100%;height:auto;">   
                                                            </p>                                        
                                                        </td>
                                                        <td style="width:50%">
                                                            <h4>Change Reset Password Page Banner</h4>
                                                            Select Photo<input type="file" name="photo">
                                                            <input type="submit" class="btn btn-primary btn-xs" value="Change" style="margin-top:10px;" name="form7_4">
                                                        </td>

                                                        </tr>

                                                        <tr>
                                                        <form action="" method="post" enctype="multipart/form-data"></form>
                                                        <td style="width:50%">
                                                            <h4>Existing Search Page Banner</h4>
                                                            <p>
                                                                <img src="../assets/uploads/banner_search.jpg" alt="" style="width: 100%;height:auto;">  
                                                            </p>                                        
                                                        </td>
                                                        <td style="width:50%">
                                                            <h4>Change Search Page Banner</h4>
                                                            Select Photo<input type="file" name="photo">
                                                            <input type="submit" class="btn btn-primary btn-xs" value="Change" style="margin-top:10px;" name="form7_6">
                                                        </td>

                                                        </tr>


                                                        <tr>
                                                        <form action="" method="post" enctype="multipart/form-data"></form>
                                                        <td style="width:50%">
                                                            <h4>Existing Cart Page Banner</h4>
                                                            <p>
                                                                <img src="../assets/uploads/banner_cart.jpg" alt="" style="width: 100%;height:auto;">  
                                                            </p>                                        
                                                        </td>
                                                        <td style="width:50%">
                                                            <h4>Change Cart Page Banner</h4>
                                                            Select Photo<input type="file" name="photo">
                                                            <input type="submit" class="btn btn-primary btn-xs" value="Change" style="margin-top:10px;" name="form7_7">
                                                        </td>

                                                        </tr>


                                                        <tr>
                                                        <form action="" method="post" enctype="multipart/form-data"></form>
                                                        <td style="width:50%">
                                                            <h4>Existing Checkout Page Banner</h4>
                                                            <p>
                                                                <img src="../assets/uploads/banner_checkout.jpg" alt="" style="width: 100%;height:auto;">  
                                                            </p>                                        
                                                        </td>
                                                        <td style="width:50%">
                                                            <h4>Change Checkout Page Banner</h4>
                                                            Select Photo<input type="file" name="photo">
                                                            <input type="submit" class="btn btn-primary btn-xs" value="Change" style="margin-top:10px;" name="form7_8">
                                                        </td>

                                                        </tr>

                                                        <tr>
                                                        <form action="" method="post" enctype="multipart/form-data"></form>
                                                        <td style="width:50%">
                                                            <h4>Existing Product Category Page Banner</h4>
                                                            <p>
                                                                <img src="../assets/uploads/banner_product_category.jpg" alt="" style="width: 100%;height:auto;">  
                                                            </p>                                        
                                                        </td>
                                                        <td style="width:50%">
                                                            <h4>Change Product Category Page Banner</h4>
                                                            Select Photo<input type="file" name="photo">
                                                            <input type="submit" class="btn btn-primary btn-xs" value="Change" style="margin-top:10px;" name="form7_9">
                                                        </td>

                                                        </tr>

                                                        <tr>
                                                        <form action="" method="post" enctype="multipart/form-data"></form>
                                                        <td style="width:50%">
                                                            <h4>Existing Blog Page Banner</h4>
                                                            <p>
                                                                <img src="../assets/uploads/banner_blog.jpg" alt="" style="width: 100%;height:auto;">  
                                                            </p>                                        
                                                        </td>
                                                        <td style="width:50%">
                                                            <h4>Change Blog Page Banner</h4>
                                                            Select Photo<input type="file" name="photo">
                                                            <input type="submit" class="btn btn-primary btn-xs" value="Change" style="margin-top:10px;" name="form7_10">
                                                        </td>

                                                        </tr>
                                                        </tbody></table>

                                                </div>








                                                <div class="tab-pane" id="tab_9">
                                                    <form class="form-horizontal" action="" method="post">
                                                        <div class="box box-info">
                                                            <div class="box-body">
                                                                <div class="form-group">
                                                                    <label for="" class="col-sm-2 control-label">PayPal - Business Email </label>
                                                                    <div class="col-sm-5">
                                                                        <input type="text" name="paypal_email" class="form-control" value="biz111@shop.com">
                                                                    </div>
                                                                </div>
                                                                <div class="form-group">
                                                                    <label for="" class="col-sm-2 control-label">Stripe - Public Key </label>
                                                                    <div class="col-sm-5">
                                                                        <input type="text" name="stripe_public_key" class="form-control" value="pk_test_0SwMWadgu8DwmEcPdUPRsZ7b">
                                                                    </div>
                                                                </div>
                                                                <div class="form-group">
                                                                    <label for="" class="col-sm-2 control-label">Stripe - Secret Key </label>
                                                                    <div class="col-sm-5">
                                                                        <input type="text" name="stripe_secret_key" class="form-control" value="sk_test_TFcsLJ7xxUtpALbDo1L5c1PN">
                                                                    </div>
                                                                </div>
                                                                <div class="form-group">
                                                                    <label for="" class="col-sm-2 control-label">Bank Information </label>
                                                                    <div class="col-sm-5">
                                                                        <textarea name="bank_detail" class="form-control" cols="30" rows="10">Bank Name: ABC Bank
Account Number: 1222320234444
Branch Name: NY Branch
Country: USA</textarea>
                                                                    </div>
                                                                </div>
                                                                <div class="form-group">
                                                                    <label for="" class="col-sm-2 control-label"></label>
                                                                    <div class="col-sm-6">
                                                                        <button type="submit" class="btn btn-success pull-left" name="form9">Update</button>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </form>
                                                </div>


                                                <div class="tab-pane" id="tab_10">
                                                    <form class="form-horizontal" action="" method="post">
                                                        <div class="box box-info">
                                                            <div class="box-body">
                                                                <div class="form-group">
                                                                    <label for="" class="col-sm-2 control-label">Code before &lt;/head&gt; tag </label>
                                                                    <div class="col-sm-8">
                                                                        <textarea name="before_head" class="form-control" cols="30" rows="10">&lt;script async src="https://www.googletagmanager.com/gtag/js?id=GA_TRACKING_ID"&gt;&lt;/script&gt;
&lt;script&gt;
  window.dataLayer = window.dataLayer || [];
  function gtag(){dataLayer.push(arguments);}
  gtag('js', new Date());

  gtag('config', 'GA_TRACKING_ID');
&lt;/script&gt;</textarea>
                                                                    </div>
                                                                </div>
                                                                <div class="form-group">
                                                                    <label for="" class="col-sm-2 control-label">Code after &lt;body&gt; tag </label>
                                                                    <div class="col-sm-8">
                                                                        <textarea name="after_body" class="form-control" cols="30" rows="10">&lt;div id="fb-root"&gt;&lt;/div&gt;
&lt;script&gt;(function(d, s, id) {
  var js, fjs = d.getElementsByTagName(s)[0];
  if (d.getElementById(id)) return;
  js = d.createElement(s); js.id = id;
  js.src = "//connect.facebook.net/en_US/sdk.js#xfbml=1&amp;version=v2.10&amp;appId=323620764400430";
  fjs.parentNode.insertBefore(js, fjs);
}(document, 'script', 'facebook-jssdk'));&lt;/script&gt;</textarea>
                                                                    </div>
                                                                </div>
                                                                <div class="form-group">
                                                                    <label for="" class="col-sm-2 control-label">Code before &lt;/body&gt; tag </label>
                                                                    <div class="col-sm-8">
                                                                        <textarea name="before_body" class="form-control" cols="30" rows="10">&lt;!--Start of Tawk.to Script--&gt;
&lt;script type="text/javascript"&gt;
var Tawk_API=Tawk_API||{}, Tawk_LoadStart=new Date();
(function(){
var s1=document.createElement("script"),s0=document.getElementsByTagName("script")[0];
s1.async=true;
s1.src='https://embed.tawk.to/5a7c31ded7591465c7077c48/default';
s1.charset='UTF-8';
s1.setAttribute('crossorigin','*');
s0.parentNode.insertBefore(s1,s0);
})();
&lt;/script&gt;
&lt;!--End of Tawk.to Script--&gt;</textarea>
                                                                    </div>
                                                                </div>
                                                                <div class="form-group">
                                                                    <label for="" class="col-sm-2 control-label"></label>
                                                                    <div class="col-sm-6">
                                                                        <button type="submit" class="btn btn-success pull-left" name="form10">Update</button>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </form>
                                                </div>



                                                <div class="tab-pane" id="tab_11">
                                                    <h3>Advertisements On and Off</h3>
                                                    <form class="form-horizontal" action="" method="post">
                                                        <div class="box box-info">
                                                            <div class="box-body">
                                                                <div class="form-group">
                                                                    <label for="" class="col-sm-3 control-label">Above Welcome </label>
                                                                    <div class="col-sm-4">
                                                                        <select name="ads_above_welcome_on_off" class="form-control" style="width:auto;">
                                                                            <option value="1" selected="">On</option>
                                                                            <option value="0">Off</option>
                                                                        </select>
                                                                    </div>
                                                                </div>      
                                                                <div class="form-group">
                                                                    <label for="" class="col-sm-3 control-label">Above Featured Product </label>
                                                                    <div class="col-sm-4">
                                                                        <select name="ads_above_featured_product_on_off" class="form-control" style="width:auto;">
                                                                            <option value="1" selected="">On</option>
                                                                            <option value="0">Off</option>
                                                                        </select>
                                                                    </div>
                                                                </div>
                                                                <div class="form-group">
                                                                    <label for="" class="col-sm-3 control-label">Above Latest Product </label>
                                                                    <div class="col-sm-4">
                                                                        <select name="ads_above_latest_product_on_off" class="form-control" style="width:auto;">
                                                                            <option value="1" selected="">On</option>
                                                                            <option value="0">Off</option>
                                                                        </select>
                                                                    </div>
                                                                </div>
                                                                <div class="form-group">
                                                                    <label for="" class="col-sm-3 control-label">Above Popular Product </label>
                                                                    <div class="col-sm-4">
                                                                        <select name="ads_above_popular_product_on_off" class="form-control" style="width:auto;">
                                                                            <option value="1" selected="">On</option>
                                                                            <option value="0">Off</option>
                                                                        </select>
                                                                    </div>
                                                                </div>
                                                                <div class="form-group">
                                                                    <label for="" class="col-sm-3 control-label">Above Testimonial </label>
                                                                    <div class="col-sm-4">
                                                                        <select name="ads_above_testimonial_on_off" class="form-control" style="width:auto;">
                                                                            <option value="1" selected="">On</option>
                                                                            <option value="0">Off</option>
                                                                        </select>
                                                                    </div>
                                                                </div>
                                                                <div class="form-group">
                                                                    <label for="" class="col-sm-3 control-label">Category Page Sidebar </label>
                                                                    <div class="col-sm-4">
                                                                        <select name="ads_category_sidebar_on_off" class="form-control" style="width:auto;">
                                                                            <option value="1" selected="">On</option>
                                                                            <option value="0">Off</option>
                                                                        </select>
                                                                    </div>
                                                                </div>                                    
                                                                <div class="form-group">
                                                                    <label for="" class="col-sm-3 control-label"></label>
                                                                    <div class="col-sm-6">
                                                                        <button type="submit" class="btn btn-success pull-left" name="form11">Update</button>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </form>
                                                </div>



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

                        <script src="../bower_components/jquery/dist/jquery.min.js"></script>
                        <!-- Bootstrap 3.3.7 -->
                        <script src="../bower_components/bootstrap/dist/js/bootstrap.min.js"></script>
                        <!-- FastClick -->
                        <script src="../bower_components/fastclick/lib/fastclick.js"></script>
                        <!-- AdminLTE App -->
                        <script src="../dist/js/adminlte.min.js"></script>
                        <!-- Sparkline -->
                        <script src="../bower_components/jquery-sparkline/dist/jquery.sparkline.min.js"></script>
                        <!-- jvectormap  -->
                        <script src="../plugins/jvectormap/jquery-jvectormap-1.2.2.min.js"></script>
                        <script src="../plugins/jvectormap/jquery-jvectormap-world-mill-en.js"></script>
                        <!-- SlimScroll -->
                        <script src="../bower_components/jquery-slimscroll/jquery.slimscroll.min.js"></script>
                        <!-- ChartJS -->
                        <script src="../bower_components/chart.js/Chart.js"></script>
                        <!-- AdminLTE dashboard demo (This is only for demo purposes) -->
                        <script src="../dist/js/pages/dashboard2.js"></script>
                        <!-- AdminLTE for demo purposes -->
                        <script src="../dist/js/demo.js"></script>

                        </body>
                        </html>