function validarCargo() {
    var nombre;
    nombre = document.getElementById("nombre").value;

    if (nombre === "") {
        Swal.fire('Por favor ingresa un nombre');
 return false;
    }
   
}
;

function  validarCategoria() {
    var cat;
    cat = document.getElementById("cat").value;

    if (cat === "") {
        Swal.fire('Por favor ingresa un nombre');
  return false;
    }
  
}
;

$("#btnCatk").click(function(){
    /*Swal.fire({
        //error
        type: 'error',
        title: 'Error',
        text: '¡Algo salió mal!',        
    });*/
    Swal.fire({        
        type: 'success',
        title: 'Éxito',
        text: '¡Perfecto!',        
    });
});	

function  validarMarca() {
    var marc;
    marc = document.getElementById("marc").value;

    if (marc === "") {
        Swal.fire('Por favor ingresa un nombre');
  return false;
    }
  
}
;

function  validarCliente() {
    var txtNombre, txtRepresentante, txtCargo, documento, email, clave, confClave, cboTipo_Documento, celular, fechaNac;
    txtNombre = document.getElementById("txtNombre").value;
    txtRepresentante = document.getElementById("txtRepresentante").value;
    txtCargo = document.getElementById("txtCargo").value;

    documento = document.getElementById("documento").value;
    email = document.getElementById("email").value;
    clave = document.getElementById("clave").value;
    confClave = document.getElementById("confClave").value;
    fechaNac = document.getElementById("fechaNac").value;

    if (txtNombre === "" || txtRepresentante === "" || txtCargo === "" || documento === "" || email === "" || clave === "" || confClave === "" || cboTipo_Documento === "" || fechaNac === "") {
        Swal.fire('Complete los Campos Obligatorios')
        return false;
    }

};



function  validarComprobante() {
    var nomComprobante;
    nomComprobante = document.getElementById("nomComprobante").value;

    if (nomComprobante === "") {
        Swal.fire('Por favor ingresa un nombre');
        return false;
    }
    
};


function  validarDocumento() {
    var Tdocumento;
    Tdocumento = document.getElementById("Tdocumento").value;

    if (Tdocumento === "") {
        Swal.fire('Por favor ingresa un nombre');
    return false;
    }
               
};

function validarEmpleado(){
    var txtNombre, txtApellidos,txtDocumento,usuario,contraseña,confContra;
    
    txtNombre = document.getElementById("txtNombre").value;
    txtApellidos = document.getElementById("txtApellidos").value;
    txtDocumento = document.getElementById("txtDocumento").value;
    usuario = document.getElementById("usuario").value;
    contraseña = document.getElementById("contraseña").value;
    confContra = document.getElementById("confContra").value;
    
    if(txtNombre === "" || txtApellidos === "" || txtDocumento === "" || usuario === "" || contraseña === "" || confContra === ""){
           Swal.fire('Por favor complete Todos los Campos Obligatorios')
     return false;
    }
   
};

function  validarProducto(){
    var nomP,Descripcion;
    nomP = document.getElementById("nomP").value;
    
    if(nomP === "" || Descripcion === ""){
          Swal.fire('Ingresa nombre del producto')
    return false;
    }
    
}