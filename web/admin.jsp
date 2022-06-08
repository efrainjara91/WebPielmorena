<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>


<!DOCTYPE html>
<html lang="es">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login</title>
        <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">    <!--===============================================================================================-->
        <link href="css/style.css" rel="stylesheet" type="text/css"/>    </head>
    <link rel="stylesheet" href="//netdna.bootstrapcdn.com/bootstrap/3.1.1/css/bootstrap.min.css">

    <script src="http://code.jquery.com/jquery-1.11.0.min.js"></script>
    <body>
        <div class="wrapper fadeInDown">
            <div id="formContent">
                <!-- Tabs Titles -->

                <!-- Icono -->
                <div class="fadeIn first p-4 text-center">
                    <img src="images/logo2.png" id="icon" alt="User Icon" />                    
                    <h1>Login</h1>
                </div>
                <!-- Formulario Login-->
                <c:out value="${msje!= '' ? msje : ''}" />
                <form action="LoginControlador" method="POST">
                    <input type="text" id="usuario"  class="fadeIn second" name="txtNombre" placeholder="usuario">

                    <input type="password" id="password" value="" class="fadeIn third" name="txtClave" placeholder="contraseña">
                    <span id="show-hide-passwd" action="hide" class="glyphicon glyphicon glyphicon-eye-open"></span>



                    <input type="submit" class="fadeIn fourth"  name="accion" value="Iniciar Sesion" onclick="validar();">
                </form>

                <!-- Cambiar Contraseña -->
                <div id="formFooter">
                    <a class="underlineHover" href="#">Se Olvidó la Contraseña?</a>
                </div>

            </div>
        </div>
        <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
        <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
        <script src="js/validar.js" type="text/javascript"></script>
        <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>

        <!--<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>-->
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
        <!-- <script>
             function validar() {
                 var usuario = document.getElementById('usuario');
                 var pass = document.getElementById("password");
 
                 if ((usuario.value == "") || (pass.value == "")) {
                     window.alert("Los campos usuario y contraseña no pueden estar vacios");
                 } else {
                     window.alert("Bienvenido al Sistema :)");
                 }
             }
         </script>-->
    </body>
</html>
