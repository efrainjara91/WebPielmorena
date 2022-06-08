<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <!-- Meta Tags -->
        <meta name="viewport" content="width=device-width,initial-scale=1.0"/>
        <meta http-equiv="content-type" content="text/html; charset=UTF-8"/>

        <!-- Favicon -->
        <link rel="icon" type="image/png" href="assets/uploads/favicon.png">
        <link href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN" crossorigin="anonymous">
        <!--<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">

        <!-- Stylesheets -->
        <link rel="stylesheet" href="assets/css/bootstrap.min.css">
        <link rel="stylesheet" href="assets/css/font-awesome.min.css">
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
        <title>Piel Morena Shop</title>

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


        <div class="header">
            <div class="container">
                <div class="row inner">
                    <div class="col-md-4 logo">
                        <a href="#"><img src="assets/uploads/logocalzado1.png" alt="logo image"></a>
                    </div>

                    <div class="col-md-5 right">
                        <ul>

                            <li class="dropdown-toggle" data-toggle="dropdown"><a ><i class="fa fa-sign-in"></i> ${logueo}</a></li>
                            <div class="dropdown-menu text-center dropdown-menu-right">
                                <li><a class="dropdown-item center" href="#"><img src="img/user.png" alt="60" height="60"/></a>    
                                    <a class="dropdown-item" href="#" data-toggle="modal" data-target="#myModal">${correo}</a>
                                    <div class="dropdown-divider"></div>
                                    <a class="dropdown-item" href="Controlador?accion=MisCompras">Mis Compras</a>

                                    <div class="dropdown-divider"></div>
                                    <a class="dropdown-item" href="./Controlador?accion=Salir"> <i class="fa fa-arrow-right"> Salir</i></a>  </li>
                                <a class="dropdown-item" href="#"> </a>                      
                            </div>


                            <!--<li><a href="cliente2?accion=nu"><i class="fa fa-user-plus"></i>Registro</a></li>-->

                            <li><a href="./Controlador?accion=carrito" alt="Ver Carrito"><i class="fa fa-shopping-cart"><span class="badge">${cont}</i></a></li>


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

        <div class="nav">
            <div class="container">
                <div class="row">
                    <div class="col-md-12 pl_0 pr_0">
                        <div class="menu-container">
                            <div class="menu">
                                <ul>
                                    <li><a class="nav-link" href="./Controlador?accion=Nuevo"><i class="fa fa-home"></i> Inicio<span class="sr-only">(current)</span></a></li>
                                        <c:forEach var="cat" items="${categorias}" varStatus="iteracion">                                                    

                                        <li><a href="<c:url value="Controlador">
                                                   <c:param name="accion" value="getId" />
                                                   <c:param name="cod" value="${cat.codigo}" />
                                               </c:url>">${cat.nombreCategoria}</a></li>
                                        </c:forEach>    
                                    <!--<ul>-->


                                    </li>
                                    <li><a href="#">Acerca de Nosotros</a></li>
                                    <li><a href="#">P&R</a></li>

                                    <li><a href="#">Contáctanos</a></li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>


        <div class="page-banner" style="background-image: url(assets/uploads/banner-calzado.png)">
            <div class="inner">

                <h1 ></h1> 

            </div>
        </div>
        <div class="page">
            <div class="container">
                <div class="row">

                    <div class="col-md-3">
                        <h3>Categorias</h3>

                        <div id="left" class="span3">
                            <c:forEach var="cat" items="${categorias}" varStatus="iteracion">   


                                <ul id="menu-group-1" class="nav menu">
                                    <li class="cat-level-1 deeper parent">
                                        <a class="" href="#">

                                            <a href="<c:url value="Controlador">
                                                   <c:param name="accion" value="getId" />
                                                   <c:param name="cod" value="${cat.codigo}" />
                                               </c:url>">
                                                <span data-toggle="collapse" data-parent="#menu-group-1" href="#cat-lvl1-id-1" class="sign"><i class="fa fa-plus"></i></span>
                                                <span class="lbl">${cat.nombreCategoria}</span>  </a>
                                        </a>

                                        <ul class="children nav-child unstyled small collapse" id="cat-lvl1-id-1">
                                        </ul>
                                    </li>
                                </ul>

                            </c:forEach>   

                            <div class="ad-section pt_50">
                                <img src="assets/uploads/ad-6.png" alt="banner">        
                            </div>

                        </div>  


                    </div>

                    <c:if test="${msje != ''}">
                        <div>${msje}</div>
                    </c:if>

                    <div class="col-md-9">

                        <h3>Todos los productos</h3>
                        <div class="product product-cat">

                            <div class="row">
                                <c:forEach var="p" items="${productos}" varStatus="iteracion">
                                    <div class="col-md-4 item item-product-cat">
                                        <div class="inner">
                                            <div class="thumb">
                                                <div class="photo" ><img src="${p.getImagen()}" width="270" height="270"></div>
                                                <div class="overlay"></div>
                                            </div>
                                            <div class="text">
                                                <h3>${p.getNombre()}</h3>  
                                                <h4><a class="">S/. ${p.getPrecio()}</a></h4>
                                                <h5 class="col-sm-12" text:center>${p.getDescripcion()}</h5>   

                                                <a href="Controlador?accion=AgregarCarrito&id=${p.getId_Producto()}" class="btn btn-default">Agregar a Carrito<i class="fa fa-cart-plus"></i></a>
                                                <a href="Controlador?accion=Comprar&id=${p.getId_Producto() }" class="btn btn-danger" >Comprar</a>  
                                            </div>
                                        </div>
                                    </div>
                                </c:forEach>

                            </div>

                        </div>

                    </div>

                </div>
            </div>
        </div>
    </div>




    <section class="footer-main">
        <div class="container">
            <div class="row">
                <div class="col-md-3 col-sm-6 footer-col">
                    <h3>Servicio al Cliente</h3>
                    <div class="row">
                        <div class="col-md-12">

                            <p>Preguntas Frecuentes</p>
                            <p>Cambios y Devoluciones</p>
                            <p>Términos y Condiciones</p>
                            <p>Política de Privacidad</p>
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
                    <h3>CONTÁCTANOS</h3>
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


    <div class="footer-bottom">
        <div class="container">
            <div class="row">
                <div class="col-md-12 copyright">
                    Copyright © 2019. All Rights Reserved.			</div>
            </div>
        </div>
    </div>


    <a href="#" class="scrollup">
        <i class="fa fa-angle-up"></i>
    </a>
    <!--Modal Iniciar Sesión!-->
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
                                            <label>Contraseña</label>
                                            <input type="password" name="txtpass" class="form-control" required=""  placeholder="Password">
                                        </div>                                   
                                        <button type="submit" name="accion" value="Validar" class="btn btn-danger btn-block">Iniciar</button>
                                    </form>
                                </div>                        
                            </div> 
                        </div>
                    </div>
                </div>
            </div>
        </div>


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