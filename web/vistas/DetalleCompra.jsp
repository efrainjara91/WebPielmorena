<%@page import="java.text.DateFormat"%>
<%@page import="java.util.Locale"%>
<%@page import="Config.Fecha"%>
<%@page import="java.util.GregorianCalendar"%>
<%@page import="java.util.Calendar"%>
<%@page import="java.util.Date"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>


<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">

        <!-- Favicon -->
        <link rel="icon" type="image/png" href="assets/uploads/favicon.png">

        <!-- Stylesheets -->
        <link rel="stylesheet" href="assets/css/bootstrap.min.css">
        <link rel="stylesheet" href="assets/css/font-awesome.min.css">
        <link href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN" crossorigin="anonymous">
        <link rel="stylesheet" href="assets/css/owl.carousel.min.css">
        <link rel="stylesheet" href="assets/css/owl.theme.default.min.css">
        <link rel="stylesheet" href="assets/css/jquery.bxslider.min.css">
        <link rel="stylesheet" href="assets/css/magnific-popup.css">
        <link rel="stylesheet" href="assets/css/rating.css">
        <link rel="stylesheet" href="assets/css/spacing.css">
        <link rel="stylesheet" href="assets/css/bootstrap-touch-slider.css">
        <link rel="stylesheet" href="assets/css/animate.min.css">
        <link rel="stylesheet" href="assets/css/tree-menu.css">
        <link rel="stylesheet" href="assets/css/select2.min.css">
        <link rel="stylesheet" href="assets/css/main.css">
        <link rel="stylesheet" href="assets/css/responsive.css">
        <script src="https://cdnjs.cloudflare.com/ajax/libs/modernizr/2.8.3/modernizr.min.js"></script>

        <script type="text/javascript" src="//platform-api.sharethis.com/js/sharethis.js#property=5993ef01e2587a001253a261&product=inline-share-buttons"></script>

        <script async src="https://www.googletagmanager.com/gtag/js?id=GA_TRACKING_ID"></script>
        <title class="tittle">Carrito de Compras</title>

    </head>
    <body> 
        <div class="top">
            <div class="container">
                <div class="row">
                    <div class="col-md-6 col-sm-6 col-xs-12">
                        <div class="left">
                            <ul>
                                <li><i class="fa fa-phone"></i> 939272190</li>
                                <li><i class="fa fa-envelope-o"></i> info@cieloluana.com</li>
                            </ul>
                        </div>
                    </div>
                    <div class="col-md-6 col-sm-6 col-xs-12">
                        <div class="right">
                            <ul>
                                <li><a href="#"><i class="fa fa-facebook"></i></a></li>
                                <li><a href="#"><i class="fa fa-twitter"></i></a></li>
                                <li><a href="#"><i class="fa fa-linkedin"></i></a></li>
                                <li><a href="#"><i class="fa fa-pinterest"></i></a></li>
                                <li><a href="#"><i class="fa fa-youtube"></i></a></li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <div class="menutop">
            <div class="header">
                <div class="container">
                    <div class="row inner">
                        <div class="col-md-4 logo">
                            <a href="#"><img src="assets/uploads/logocalzado1.png" alt="logo image"></a>
                        </div>

                        <div class="col-md-5 right">
                            <ul>  <li class="dropdown-toggle" data-toggle="dropdown"><a ><i class="fa fa-sign-in"></i>${logueo}</a></li>
                                <div class="dropdown-menu text-center dropdown-menu-right">
                                    <li><a class="dropdown-item center" href="#"><img src="img/user.png" alt="60" height="60"/></a>    
                                        <a class="dropdown-item" href="#" data-toggle="modal" data-target="#myModal">${correo}</a>
                                        <div class="dropdown-divider"></div>
                                        <a class="dropdown-item" href="Controlador?accion=MisCompras">Mis Compras</a>

                                        <div class="dropdown-divider"></div>
                                        <a class="dropdown-item" href="./Controlador?accion=Salir"> <i class="fa fa-arrow-right"> Salir</i></a>  </li>
                                    <a class="dropdown-item" href="#"> </a>                      
                                </div>
                                <li><a href="clientes?accion=nuevo"><i class="fa fa-user-plus"></i>Registro</a></li>

                                <li><a href="./Controlador?accion=carrito" alt="Ver Carrito">
                                        <i class="fa fa-shopping-cart"><span class="badge">${cont}</span></i></a>
                                </li>

                            </ul>
                        </div>

                        <div class="col-md-3 search-area">
                        <form class="navbar-form navbar-left"  action="" method="post">
                            <div class="form-group">
                                <input type="text" class="form-control search-top" placeholder="Buscar Producto" name="">
                            </div>
                            <button type="submit" class="btn btn-danger">Buscar</button>
                        </form>
                    </div>
                    </div>
                </div>
            </div>
        </div>

        <div class="nav">
            <div class="container">
                <div class="row">
                    <div class="col-md-12 pl_0 pr_0">
                        <div class="menu-container">
                            <div class="menu">
                                <ul>
                                    <li><a class="nav-link" href="./Controlador?accion=Nuevo"><i class="fa fa-home"></i> Inicio<span class="sr-only">(current)</span></a></li>
                                        <c:forEach var="cat" items="${categorias}" varStatus="iteracion">                                                    

                                        <li><a href="<c:url value="Categorias">
                                                   <c:param name="accion" value="getId" />
                                                   <c:param name="cod" value="${cat.codigo}" />
                                               </c:url>">${cat.nombreCategoria}</a></li>
                                        </c:forEach>    
                                    <!--<ul>-->

                                    <li><a href="#">Acerca de Nosotros</a></li>
                                    <li><a href="#">P&R</a></li>
                                    <li><a href="#">Cont??ctanos</a></li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>


        <%--<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarTogglerDemo03" aria-controls="navbarTogglerDemo03" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <a class="navbar-brand" href="#"><i>Piel Morena Store</i></a>
            <div class="collapse navbar-collapse" id="navbarTogglerDemo03">
                <ul class="navbar-nav mr-auto mt-2 mt-lg-0">
                    <li class="nav-item active">
                        <a class="nav-link" href="./Controlador?accion=Nuevo"><i class="fas fa-home"></i> Home<span class="sr-only">(current)</span></a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="./Controlador?accion=home"><i class="fas fa-plus-circle"></i> Ofertas del Dia</a>
                    </li>                   
                    <li class="nav-item">
                        <a class="nav-link" href="./Controlador?accion=home"><i class="fas fa-plus-circle"></i> Seguir Comprando</a>
                    </li>                  
                </ul>                                            
                <ul class="navbar-nav btn-group my-2 my-lg-0" role="group">
                    <a style="color: white; cursor: pointer" class="dropdown-toggle" data-toggle="dropdown">
                        <i class="fas fa-user-tie"></i> ${logueo}</a>
                    <div class="dropdown-menu text-center dropdown-menu-right">
                        <a class="dropdown-item" href="#"><img src="img/user.png" alt="60" height="60"/></a>                        
                        <a class="dropdown-item" href="#">${user}</a>
                        <a class="dropdown-item" href="#" data-toggle="modal" data-target="#myModal">${correo}</a>
                        <div class="dropdown-divider"></div>
                        <a class="dropdown-item" href="Controlador?accion=MisCompras">Mis Compras</a>
                        <div class="dropdown-divider"></div>
                        <a class="dropdown-item" href="Controlador?accion=Salir"> <i class="fas fa-arrow-right"> Salir</i></a>                        
                    </div>
                </ul>     
            </div>
        </nav>--%>
        <div class="container mt-4">                 
            <div class="card"> 
                <div class="card-header d-flex">
                    <h2>Detalle</h2>
                    <a href="Controlador?accion=MisCompras" class="pt-2 pl-4"><i class="badge" style="background: tomato">Regresar</i></a>
                </div>   
                <div class="card-body">
                    <table class="table tab-pane">
                        <thead class="thead-light">
                            <tr class="text-center">
                                <th>CODIGO COMPRA</th>                               
                                <th>Articulo</th>
                                <th>Cantidad</th>
                                <th>Precio Compra</th>                                                   
                                <th></th>                                                   
                            </tr>
                        </thead>
                        <tbody>
                              <c:forEach var="pro" items="${myDetalle}">
                                <tr class="text-center">
                                    <td>C00${pro.getIdcompra()}</td> 
                                    <td>
                                        <label><i>${pro.producto.nombre}</i></label><br>                                      
                                        <img src="${pro.producto.imagen}" width="80" height="60">
                                    </td>                                                                
                                    <td>${pro.getCantidad()}</td>
                                    <td>${pro.getPrecioCompra()}</td>                                                                                                      

                                </tr>
                            </c:forEach>
                        </tbody>
                    </table> 
                </div>
                <div class="card-footer d-flex">
                    <label class="col-sm-9 text-right mt-1">Monto Total de la Compra</label>
                    <input type="text" class=" text-center form-control col-sm-3" readonly="" value="???${montoPagar}0" style="font-size: 20px; font-family: monospace">
                </div>
            </div>          
        </div> 
        <br>
        <br>
        <br>
        <br>
        <br>
        <br>
        <br>
        <br>
        <br>

        <section class="footer-main">
            <div class="container">
                <div class="row">
                    <div class="col-md-3 col-sm-6 footer-col">
                        <h3>Servicio al Cliente</h3>
                        <div class="row">
                            <div class="col-md-12">

                                <p>Preguntas Frecuentes</p>
                                <p>Cambios y Devoluciones</p>
                                <p>T??rminos y Condiciones</p>
                                <p>Pol??tica de Privacidad</p>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-3 col-sm-6 footer-col">
                        <h3>SOBRE NOSOTROS</h3>
                        <div class="row">
                            <div class="col-md-12">

                                <p>Nuestra Empresa</p>
                            </div>
                        </div>
                    </div>


                    <div class="col-md-3 col-sm-6 footer-col">
                        <h3>CONT??CTANOS</h3>
                        <div class="contact-item">
                            <div class="text">Lambayeque,Chiclayo-Chiclayo</div>
                        </div>
                        <div class="contact-item">
                            <div class="text">939272190</div>
                        </div>
                        <div class="contact-item">
                            <div class="text">info@cieloluana.com</div>
                        </div>
                    </div>

                </div>
            </div>

        </section>
        <!--<section class="fb-footer-bottom" >
            <div class="fb-footer-bottom__container">
        <!-- footer Copyright
        <div class="fb-footer-bottom__copyright">
            <small class="fb-footer-bottom__copyright__rights">?? Todos los derechos reservados</small>
            <small class="fb-footer-bottom__copyright__address">
                Cielo Luana S.A.C - Av. Aguas Verdes - Chiclayo - Lambayeque<br>
                Tel??fono: 939272190<br>
                <br>
            </small>
        </div>

    </div>



</section>-->
        <div class="footer-bottom">
            <div class="container">
                <div class="row">
                    <div class="col-md-12 copyright">
                        Copyright ?? 2019. All Rights Reserved.			
                    </div>
                </div>
            </div>
        </div>
        <!-- Modal Iniciar Session o Registrarse -->
        <div class="modal fade" id="myModal" tabindex="-1" role="dialog">
            <div class="modal-dialog modal-lg modal-dialog-centered" role="document">
                <div class="container col-lg-9">                   
                    <div class="modal-content">                   
                        <div class="pr-2 pt-1">                         
                            <button type="button" class="close" data-dismiss="modal">
                                <span aria-hidden="true">&times;</span>
                            </button>                    
                        </div>
                        <div class="text-center">                         
                            <img src="img/user.png" width="100" height="100">                         
                        </div>
                        <div class="modal-header text-center">                      
                            <ul class="nav nav-pills">                           
                                <li class="nav-item">
                                    <a class="nav-link active" data-toggle="pill" href="#pills-iniciar">Iniciar Sesion</a>
                                </li>
                                <!--<li class="nav-item">
                                    <a class="nav-link" data-toggle="pill" href="#pills-registrar">Registrarse</a>
                                </li>  -->                        
                            </ul>  
                        </div>
                        <div class="modal-body"> 
                            <div class="tab-content" id="pills-tabContent">
                                <!-- Iniciar Session -->
                                <div class="tab-pane fade show active" id="pills-iniciar" role="tabpanel">
                                    <p style="color: #ff0000">${sessionScope['error']}</p>
                                    <form action="Controlador">
                                        <div class="form-group">
                                            <label>Email</label>
                                            <input type="email" name="txtemail" class="form-control" required="" placeholder="email@cieloluana.com" autofocus="">
                                        </div>
                                        <div class="form-group">
                                            <label>Contrase??a</label>
                                            <input type="password" name="txtpass" class="form-control" required=""  placeholder="Password">
                                        </div>                                   
                                        <button type="submit" name="accion" value="Validar" class="btn btn-danger btn-block">Iniciar</button>
                                    </form>
                                </div>
                                <!-- Registrarse -->
                                <%--<div class="tab-pane fade" id="pills-registrar" role="tabpanel">
                                            <p style="color: #ff0000">${sessionScope['error']}</p>

                                    <form action="Register" method="post">                                       
                                        <div class="form-group">
                                            <label>Nombres</label>
                                            <input type="text" name="txtNombre" class="form-control" placeholder="Jeancito" required="">
                                        </div>
                                        <div class="row">
                                            <div class="col-md-6">
                                                <div class="form-group">
                                                    <label>Apellido Paterno</label>
                                                    <input type="text" name="txtApellidoP" class="form-control" placeholder="Moncayito">
                                                </div> 

                                            </div>
                                            <div class="col-md-6">
                                                <div class="form-group">
                                                    <label>Apellido Materno</label>
                                                    <input type="text" name="txtApellidoM" class="form-control" placeholder="Ramos">
                                                </div> 

                                            </div>                                          
                                        </div>
                                        <div class="row">
                                            <div class="col-md-6">
                                                <div class="form-group">
                                                    <label>Tipo Documento</label>
                                                    <select id="cboTDocumento"  name="cboTipoDocumento" class="form-control">
                                                        <option value="0">Seleccione un documento</option>
                                                        <c:forEach items="${documento}" var="doc">
                                                            <option value="${doc.codigo}"  
                                                                    <c:if test="${doc.codigo == cliente.getDocumentoIdentidad().codigo}">
                                                                        selected
                                                                    </c:if>
                                                                    >${doc.nombre}</option>
                                                        </c:forEach>
                                                    </select>
                                                </div>                                               
                                            </div>
                                            <div class="col-md-6">
                                                <div class="form-group">
                                                    <label>N?? Doc</label>
                                                    <input type="text" name="txtDocumento" class="form-control" placeholder="73059476" maxlength="8">
                                                </div>
                                            </div>                                          
                                        </div>
                                        <div class="form-group">
                                            <label>Fecha Nacimiento</label>
                                            <input type="date" name="txtFechaNac" class="form-control">
                                        </div>
                                        <div class="form-group">
                                            <label>Email address</label>
                                            <input type="email" name="txtCorreo" class="form-control" placeholder="example@cieloluana.com">
                                        </div>
                                        <div class="form-group">
                                            <label>Password</label>
                                            <input type="password" name="txtClave" class="form-control" placeholder="Password">
                                        </div>
                                        <div class="form-group">
                                            <label>Direccion</label>
                                            <input type="text" name="txtDireccion" class="form-control" placeholder="Chiclayo - La Victoria">
                                        </div>
                                        <div class="row">
                                            <div class="col-md-6">
                                                <div class="form-group">
                                                    <label>G??nero</label>
                                                    <select name="cboGenero" class="form-control">
                                                        <option>Masculino</option>
                                                        <option>Femenino</option>
                                                    </select>
                                                </div>
                                            </div>
                                            <div class="col-md-6">
                                                <div class="form-group">
                                                    <label>Telefono</label>
                                                    <input type="text" name="txtCelular" class="form-control" placeholder="939272190" maxlength="9">
                                                </div>
                                            </div>                                          
                                        </div>
                                        
                                        <div class="form-group hidden">
                                            <label>Estado :</label>
                                            <div class="checkbox">
                                                <label>
                                                    <input type="checkbox" name="chkVigencia" 
                                                           <c:out value="${cliente.isEstado() == false ?
                                                                           'unchecked' : 'checked'}"
                                                                  default="" />>Vigente
                                                </label>
                                            </div>
                                        </div>
                                        <button type="submit" name="accion" value="Registrar" class="btn btn-danger btn-block">Crear Cuenta</button>
                                    </form>
                                </div>--%>                          
                            </div> 
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!-- Modal de Pago -->
        <div class="modal fade" id="myModalPago" tabindex="-1" role="dialog">
            <div class="modal-dialog modal-dialog-centered" role="document">         
                <div class="modal-content">                   
                    <div class="modal-header text-center"> 
                        <label><i class="fa-dollar-sign"></i>Realizar Pago</label>
                        <button type="button" class="close" data-dismiss="modal">
                            <span aria-hidden="true">&times;</span>
                        </button>  
                    </div>
                    <div class="modal-body"> 
                        <div class="tab-content" id="pills-tabContent">
                            <!-- Metodo Pago -->
                            <div class="tab-pane fade show active" id="pills-iniciar" role="tabpanel">
                                <form action="Controlador">
                                    <div class="form-group">
                                        <label>Card address</label>
                                        <input type="text" class="form-control" required="" placeholder="9999-9999-9999-9999">
                                    </div>
                                    <div class="form-group">
                                        <label>Codigo Seguridad</label>
                                        <input type="text" class="form-control" required="" placeholder="xxxx">
                                    </div>
                                    <div class="form-group">
                                        <label>Monto</label>
                                        <input type="text" name="txtmonto" value="$.${totalPagar}0" class="form-control h1">
                                    </div>                                   
                                    <button type="submit" name="accion" value="RealizarPago" class="btn btn-info btn-block">Pagar</button>
                                </form>
                            </div>

                        </div> 
                    </div>
                </div>
            </div>
        </div>
        <a href="#" class="scrollup">
            <i class="fa fa-angle-up"></i>
        </a>
        <script src="https://code.jquery.com/jquery-3.4.1.js" integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU=" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
        <script src="js/index.js" type="text/javascript"></script>

        <script src="assets/js/jquery-2.2.4.min.js"></script>
        <script src="assets/js/bootstrap.min.js"></script>
        <script src="https://js.stripe.com/v2/"></script>
        <script src="assets/js/megamenu.js"></script>
        <script src="assets/js/owl.carousel.min.js"></script>
        <script src="assets/js/owl.animate.js"></script>
        <script src="assets/js/jquery.bxslider.min.js"></script>
        <script src="assets/js/jquery.magnific-popup.min.js"></script>
        <script src="assets/js/rating.js"></script>
        <script src="assets/js/jquery.touchSwipe.min.js"></script>
        <script src="assets/js/bootstrap-touch-slider.js"></script>
        <script src="assets/js/select2.full.min.js"></script>
        <script src="assets/js/custom.js"></script>
    </body>
</html>
