<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width,initial-scale=1.0"/>

        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.2/css/all.css" integrity="sha384-oS3vJWv+0UjzBfQzYUhtDYW+Pj2yciDJxpsK1OYPAYjqT085Qq/1cq5FLXAZQ7Ay" crossorigin="anonymous">


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


        <script async src="https://www.googletagmanager.com/gtag/js?id=GA_TRACKING_ID"></script>
        <title>Piel Morena Shop</title>
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


                            <li><a href="clientes?accion=nuevo"><i class="fa fa-user-plus"></i>Registro</a></li>

                            <li><a href="./Controlador?accion=carrito" alt="Ver Carrito"><i class="fa fa-shopping-cart"><span class="badge">${cont}</span></i></a></li>


                        </ul>


                    </div>

                    <div class="col-md-3 search-area">
                        <form class="navbar-form navbar-left" role="search" action="search-result.php" method="get">
                            <input type="hidden" name="_csrf" value="5f9564efbb2b718db21f3da3e6288cec" />					
                            <div class="form-group">
                                <input type="text" class="form-control search-top" placeholder="Search Product" name="search_text">
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

                                        <li><a href="<c:url value="Categorias">
                                                   <c:param name="accion" value="getId" />
                                                   <c:param name="cod" value="${cat.codigo}" />
                                               </c:url>">${cat.nombreCategoria}</a></li>
                                        </c:forEach>    
                                    <!--<ul>-->

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



        <div>
            <center><h1 text="center">Formulario de Registro</h1></center>

        </div>
        <style>
            .mensajeError{
                color: #FF0000;             
            }
        </style>
        <div class="page">
            <div class="container">
                <div class="row">
                    <div class="col-md-12">
                        <div class="user-content">
                            <center><p style="color: #ff0000">${sessionScope['mensajeError']}</p></center>
                                
                            <form action="clientes?accion=nuevo" method="post" id="formulario">
                                <div class="row">
                                    <div class="col-md-2"></div>
                                    <div class="col-md-8">
                                        <div class="col-md-6 form-group">
                                            <label for="">Nombres *</label>
                                            <input type="text" name="txtNombre" id="nombre" maxlength="20" class="form-control"  placeholder="Nombre" pattern="[A-Za-záéíóúÁÉÍÓÚ\s]+{2,20}"
                                                   title="Introduce entre 2 y 20 letras" required />
                                        </div>
                                        <div class="col-md-6 form-group">
                                            <label for="">Apellido Paterno*</label>
                                            <input type="text" name="txtApellidoP" id="apellidoP" class="form-control" maxlength="20" required="" placeholder="Apellido Paterno"
                                                   pattern="[A-Za-záéíóúÁÉÍÓÚ\s]+{4,20}" title="Introduce entre 4 y 20 letras">
                                        </div>
                                        <div class="col-md-6 form-group">
                                            <label for="">Apellido Materno*</label>
                                            <input type="text" name="txtApellidoM" id="apellidoM" class="form-control" required="" placeholder="Apellido Materno"
                                                   pattern="[A-Za-záéíóúÁÉÍÓÚ\s]+{4,20}" title="Introduce entre 4 y 20 letras">
                                        </div>
                                        <div class="col-md-6 form-group">
                                            <label for="">Email *</label>
                                            <input type="email" id="email" name="txtCorreo" class="form-control" required="" maxlength="30" placeholder="example@cieloluana.com"
                                                   pattern="[A-Za-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,3}" />
                                        </div>
                                        <div class="col-md-6 form-group">
                                            <label for="">Telefono *</label>
                                            <input type="text" name="txtCelular" id="telefono" class="form-control" maxlength="9" required="" placeholder="939272190" pattern="[0-9]{9}"
                                                   title="Número de 9 cifras" >
                                        </div>
                                        <div class="col-md-6 form-group">
                                            <label>Fecha Nacimiento</label>
                                            <input type="date" name="txtFechaNac" class="form-control">
                                        </div>
                                        <div class="col-md-12 form-group">
                                            <label for="">Dirección *</label>
                                            <input type="text" name="txtDireccion" id="direccion" maxlength="100" required="" class="form-control" cols="30" rows="10" style="height:70px;"
                                                   pattern="[A-Za-z0-9áéíóúÁÉÍÓÚ\s]{10,100}" title="Introduce entre 10 y 100 caracteres"/>
                                        </div>
                                        <div class="col-md-6 form-group">
                                            <label>Tipo Documento *</label>                                   
                                            <select id="cboTDocumento"  name="cboTipoDocumento" required="" class="form-control">
                                                <option value="">Seleccione un documento</option>
                                                <c:forEach items="${documento}" var="doc">
                                                    <option value="${doc.codigo}"  
                                                            <c:if test="${doc.codigo == cliente.getDocumentoIdentidad().codigo}">
                                                                selected
                                                            </c:if>
                                                            >${doc.nombre}</option>
                                                </c:forEach>
                                            </select>  
                                        </div>

                                        <div class="col-md-6 form-group">
                                            <label>N° Documento *</label>
                                            <input type="text" name="txtDocumento" id="dni" class="form-control" required="" placeholder="73059476" maxlength="8"
                                                   pattern="[0-9]{8}" title="Número de 8 cifras">
                                        </div>
                                        <div class="col-md-6 form-group">
                                            <label>Género</label>
                                            <select name="cboGenero" class="form-control">
                                                <option>Masculino</option>
                                                <option>Femenino</option>
                                            </select>
                                        </div>
                                        <div class="col-md-6 form-group">
                                            <label>Contraseña*</label>
                                            <input type="password" name="txtClave" id="clave" class="form-control" required=""  maxlength="10" placeholder="Contraseña"
                                                   pattern="[0-9A-Za-z]{5,10}" title="Introduce entre 5 y 10 caracteres">
                                        </div>
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
                                        <div class="col-md-6 form-group">
                                            <p id="mensajeError" class="mensajeError"></p>
                                            <input type="submit" class="btn btn-primary" value="enviar" id="enviar">
                                            <input type="reset" class="btn btn-danger" value="borrar" id="borrar">
                                        </div>
                                    </div>
                                </div>                        
                            </form>
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
                        Copyright © 2019. All Rights Reserved.			
                    </div>
                </div>
            </div>
        </div>

        <a href="#" class="scrollup">
            <i class="fa fa-angle-up"></i>
        </a>
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
                                    <c:out value="${msje!= '' ? msje : ''}" />
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
        <script src="js/validaciones.js"></script>
                <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>


    </body>
</html>