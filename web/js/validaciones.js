window.onload = iniciar;
function iniciar() {
    document.getElementById("enviar").addEventListener('click', validar, 'false');
}


function validaNombre() {
    var elemento = document.getElementById("nombre");
    if (!elemento.checkValidity()) {
    if (elemento.validity.valueMissing) {
        error2(elemento, "Debe introducir un nombre")
    }
    if (elemento.validity.patternMismatch) {
        error2(elemento, "El nombre debe tener entre 2 y 20 letras");
    }
    // error(elemento);
    return false;
    }
    return true;
}
function validaTelefono() {
    var elemento = document.getElementById("telefono");
    if (!elemento.checkValidity()) {
           if (elemento.validity.valueMissing) {
        error2(elemento, "Debe introducir un número de telefono")
    }
    if (elemento.validity.patternMismatch) {
        error2(elemento, "El telefono debe tener 9 dìgitos");
    }
        return false;
    }
    return true;
}
function validaApellidoP() {
    var elemento = document.getElementById("apellidoP");
    if (!elemento.checkValidity()) {
           if (elemento.validity.valueMissing) {
        error2(elemento, "Debe introducir un apellido")
    }
    if (elemento.validity.patternMismatch) {
        error2(elemento, "El apellido debe tener entre 4 y 20 letras");
    }
        return false;
    }
    return true;
}
function validaApellidoM() {
    var elemento = document.getElementById("apellidoM");
    if (!elemento.checkValidity()) {
        if (elemento.validity.valueMissing) {
        error2(elemento, "Debe introducir un apellido")
    }
    if (elemento.validity.patternMismatch) {
        error2(elemento, "El apellido debe tener entre 4 y 20 letras");
    }
        return false;
    }
    return true;
}
function validaEmail() {
    var elemento = document.getElementById("email");
    if (!elemento.checkValidity()) {
        if (elemento.validity.valueMissing) {
        error2(elemento, "Debe introducir un correo electrónico")
    }
    if (elemento.validity.patternMismatch) {
        error2(elemento, "Debe introducir una dirección de correo electrónico válida");
    }
        return false;
    }
    return true;
}
function validaDireccion() {
    var elemento = document.getElementById("direccion");
    if (!elemento.checkValidity()) {
        if (elemento.validity.valueMissing) {
        error2(elemento, "Debe introducir una dirección")
    }
    if (elemento.validity.patternMismatch) {
        error2(elemento, "Debe introducir al menos 10 caracteres");
    }
        return false;
    }
    return true;
}
function validaDNI() {
    var elemento = document.getElementById("dni");
    if (!elemento.checkValidity()) {
        if (elemento.validity.valueMissing) {
        error2(elemento, "Ingresa un número de identificación")
    }
    if (elemento.validity.patternMismatch) {
        error2(elemento, "Debe ingresar 8 dígitos");
    }
        return false;
    }
    return true;
}
function validaClave() {
    var elemento = document.getElementById("clave");
    if (!elemento.checkValidity()) {
        if (elemento.validity.valueMissing) {
        error2(elemento, "Ingresa una contraseña")
    }
    if (elemento.validity.patternMismatch) {
        error2(elemento, "La contraseña debe contener entre 5 y 10 caracteres");
    }
        return false;
    }
    return true;
}

function validar(e) {
    if (validaNombre() && validaApellidoP() && validaApellidoM() && validaEmail() && validaTelefono() && validaDireccion() && validaDNI() && validaClave() &&
            confirm("pulsa aceptar si deseas culminar con el registro"))
    {
        return true;
    } else {
        e.preventDefault();
        return false;
    }
}

function error(elemento) {
    document.getElementById("mensajeError").innerHTML =
            elemento.validationMessage;
    elemento.className = "form-control";
    elemento.focus();
}

function error2(elemento,mensaje){
    document.getElementById("mensajeError").innerHTML= mensaje;
    elemento.className="form-control";
    elemento.focus();
    
            
}

function borrarError() {
    var formulario = document.forms[0];
    for (var i = 0; i < formulario.elements.length; i++) {
        formulario.elements[i].className = "";
    }
}