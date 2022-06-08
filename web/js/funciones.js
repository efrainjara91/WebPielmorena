$(document).ready(function () {
    $("tr #deleteDocumento").click(function (e) {
        e.preventDefault();
        var idDoc = $(this).parent().find('#item2').val();        
        swal({
            title: "Está Seguro de Eliminar?",
            text: "Una Vez Eliminado, Deberá Agregar de nuevo!",
            icon: "warning",
            buttons: true,
            dangerMode: true
        }).then((willDelete) => {
            if (willDelete) {
                eliminarDoc(idDoc);
                swal(" ¡Oh! ¡Registro Borrado! ", {
                    icon: "success",
                }).then((willDelete) => {
                    if (willDelete) {
                        parent.location.href = "comprobantes?accion=listar";
                    }
                });
            }
        });
    });
    function eliminarDoc(idDoc) {
        var url = "comprobantes?accion=eliminarDoc&cod=" + idDoc;
        console.log("hol");
        $.ajax({
            type: 'POST',
            url: url,
            async: true,
            success: function (r) {
            }
        });
    }

    }); 
    
    
$(document).ready(function () {
    $("tr #deleteComprob").click(function (e) {
        e.preventDefault();
        var idComprob = $(this).parent().find('#codigo').val();        
        swal({
            title: "Está Seguro de Eliminar?",
            text: "Una Vez Eliminado, Deberá Agregar de nuevo!",
            icon: "warning",
            buttons: true,
            dangerMode: true
        }).then((willDelete) => {
            if (willDelete) {
                eliminarCompr(idComprob);
                swal(" ¡Oh! ¡Registro Borrado! ", {
                    icon: "success",
                }).then((willDelete) => {
                    if (willDelete) {
                        parent.location.href = "comprobantes?accion=listar";
                    }
                });
            }
        });
    });
    function eliminarCompr(idComprob) {
        var url = "comprobantes?accion=eliminar&cod=" + idComprob;
        console.log("hol");
        $.ajax({
            type: 'POST',
            url: url,
            async: true,
            success: function (r) {
            }
        });
    }

    });    






$(document).ready(function () {
    $("tr #deleteItem").click(function (e) {
        e.preventDefault();
        var idp = $(this).parent().find('#item2').val();        
        swal({
            title: "Esta Seguro de Eliminar?",
            text: "Una una Vez Eliminado, Debera Agregar de Nuevo!",
            icon: "warning",
            buttons: true,
            dangerMode: true
        }).then((willDelete) => {
            if (willDelete) {
                eliminar(idp);
                swal(" ¡Oh! ¡Registro Borrado! ", {
                    icon: "success",
                }).then((willDelete) => {
                    if (willDelete) {
                        parent.location.href = "Controlador?accion=carrito";
                    }
                });
            }
        });
    });
    function eliminar(idp) {
        var url = "Controlador?accion=deleteProducto&id=" + idp;
        console.log("hol");
        $.ajax({
            type: 'POST',
            url: url,
            async: true,
            success: function (r) {
            }
        });
    }

    $("tr #Cant").click(function (e) {
        var idp = $(this).parent().find('#item1').val();
        var cantidad = $(this).parent().find('#Cant').val();
        var url = "Controlador?accion=updateCantidad";
        console.log(idp, cantidad);
        $.ajax({
            type: 'POST',
            url: url,
            data: "id=" + idp + "&cantidad=" + cantidad,
            success: function (data, textStatus, jqXHR) {
                parent.location.href = "Controlador?accion=carrito";
            }
        });
    });    
   
});

$(document).ready(function () {
    $("#activarCate").click(function (e) {
        e.preventDefault();
        var idc = $(this).parent().find('#item').val();        
        swal({
            title: "Esta Seguro de Activar esta Categoria?",
            text: "Una una Vez Activado, Se Volverá a mostrar en un nuevo registro de producto!",
            icon: "warning",
            buttons: true,
            dangerMode: true
        }).then((willDelete) => {
            if (willDelete) {
                activarCat(idc);
                swal(" ¡Oh! ¡Categoria Activada! ", {
                    icon: "success",
                }).then((willDelete) => {
                    if (willDelete) {
                        parent.location.href = "Categorias?accion=listar";
                    }
                });
            }
        });
    });
});
function activarCat(idc) {
        var url = "Categorias?cambiar=des&cod=" + idc;
        console.log("hol");
        $.ajax({
            type: 'POST',
            url: url,
            async: true,
            success: function (r) {
            }
        });
    }
    
$(document).ready(function () {
    $("#desactivarCate").click(function (e) {
        e.preventDefault();
        var idc = $(this).parent().find('#item').val();        
        swal({
            title: "Esta Seguro de Desactivar esta Categoria?",
            text: "Una una Vez Desactivada, No se mostrará en un nuevo registro de producto!",
            icon: "warning",
            buttons: true,
            dangerMode: true
        }).then((willDelete) => {
            if (willDelete) {
                desactivarCat(idc);
                swal(" ¡Oh! ¡Categoria Desactivada! ", {
                    icon: "success",
                }).then((willDelete) => {
                    if (willDelete) {
                        parent.location.href = "Categorias?accion=listar";
                    }
                });
            }
        });
    });
});
function desactivarCat(idc) {
        var url = "Categorias?cambiar=act&cod=" + idc;
        console.log("hol");
        $.ajax({
            type: 'POST',
            url: url,
            async: true,
            success: function (r) {
            }
        });
    }
    
    
    
    $(document).ready(function () {
    $("#activarMarca").click(function (e) {
        e.preventDefault();
        var idmarc = $(this).parent().find('#id').val();        
        swal({
            title: "Esta Seguro de Activar esta Marca?",
            text: "Una una Vez Activado, Se Volverá a mostrar en un nuevo registro de producto!",
            icon: "warning",
            buttons: true,
            dangerMode: true
        }).then((willDelete) => {
            if (willDelete) {
                activarMarc(idmarc);
                swal(" ¡Oh! ¡Marca Activada! ", {
                    icon: "success",
                }).then((willDelete) => {
                    if (willDelete) {
                        parent.location.href = "Marcas?accion=listar";
                    }
                });
            }
        });
    });
});
function activarMarc(idmarc) {
        var url = "Marcas?cambiar=des&cod=" + idmarc;
        console.log("hol");
        $.ajax({
            type: 'POST',
            url: url,
            async: true,
            success: function (r) {
            }
        });
    }
    
$(document).ready(function () {
    $("#desactivarMarca").click(function (e) {
        e.preventDefault();
        var idmarc = $(this).parent().find('#id').val();        
        swal({
            title: "Esta Seguro de Desactivar esta Marca?",
            text: "Una una Vez Desactivada, No se mostrará en un nuevo registro de producto!",
            icon: "warning",
            buttons: true,
            dangerMode: true
        }).then((willDelete) => {
            if (willDelete) {
                desactivarMarc(idmarc);
                swal(" ¡Oh! ¡Marca Desactivada! ", {
                    icon: "success",
                }).then((willDelete) => {
                    if (willDelete) {
                        parent.location.href = "Marcas?accion=listar";
                    }
                });
            }
        });
    });
});
function desactivarMarc(idmarc) {
        var url = "Marcas?cambiar=act&cod=" + idmarc;
        console.log("hol");
        $.ajax({
            type: 'POST',
            url: url,
            async: true,
            success: function (r) {
            }
        });
    }
    
    
    
    
    
    
    
    
    
    
    $(document).ready(function () {
    $("tr #activarCliente").click(function (e) {
        e.preventDefault();
        var idcli = $(this).parent().find('#valor').val();        
        swal({
            title: "Está Seguro de Activar el Cliente?",
            text: "Si lo haces, será posible realizar ventas a este cliente",
            icon: "warning",
            buttons: true,
            dangerMode: true
        }).then((willDelete) => {
            if (willDelete) {
                activarCli(idcli);
                swal(" ¡Oh! ¡Cliente Activado! ", {
                    icon: "success",
                }).then((willDelete) => {
                    if (willDelete) {
                        parent.location.href = "clientes?accion=listar";
                    }
                });
            }
        });
    });
});
function activarCli(idcli) {
        var url = "clientes?cambiar=des&cod=" + idcli;
        console.log("hol");
        $.ajax({
            type: 'POST',
            url: url,
            async: true,
            success: function (r) {
            }
        });
    }
    
$(document).ready(function () {
    $("tr #desactivarCliente").click(function (e) {
        e.preventDefault();
        var idcli = $(this).parent().find('#valor').val();        
        swal({
            title: "Esta Seguro de Desactivar el Cliente?",
            text: "Si lo haces, no será posible realizar ventas a este cliente",
            icon: "warning",
            buttons: true,
            dangerMode: true
        }).then((willDelete) => {
            if (willDelete) {
                desactivarCliente(idcli);
                swal(" ¡Oh! ¡Cliente Desactivado! ", {
                    icon: "success",
                }).then((willDelete) => {
                    if (willDelete) {
                        parent.location.href = "clientes?accion=listar";
                    }
                });
            }
        });
    });
});
function desactivarCliente(idcli) {
        var url = "clientes?cambiar=act&cod=" + idcli;
        console.log("hol");
        $.ajax({
            type: 'POST',
            url: url,
            async: true,
            success: function (r) {
            }
        });
    }
    
    
    
    
    
    
$(document).ready(function () {
    $("#AnularVenta").click(function (e) {
        e.preventDefault();
        var idvta = $(this).parent().find('#id').val();        
        swal({
            title: "Esta Seguro de Anular esta venta?",
            text: "Una una Vez Anulado, no se podrá activar!",
            icon: "warning",
            buttons: true,
            dangerMode: true
        }).then((willDelete) => {
            if (willDelete) {
                anularVenta(idvta);
                swal("¡Venta Anulada! ", {
                    icon: "success",
                }).then((willDelete) => {
                    if (willDelete) {
                        parent.location.href = "ControladorPrincipal?accion=ListarVentas";
                    }
                });
            }
        });
    });
});
function anularVenta(idvta) {
        var url = "ControladorPrincipal?cambiar=des&cod=" + idvta;
        console.log("hol");
        $.ajax({
            type: 'POST',
            url: url,
            async: true,
            success: function (r) {
            }
        });
    }
    
    
    
$(document).ready(function () {
    $("#activarProv").click(function (e) {
        e.preventDefault();
        var idc = $(this).parent().find('#item').val();        
        swal({
            title: "Esta Seguro de Activar el Proveedor?",
            text: "Usted podrá hacer compras nuevamente a este proveedor",
            icon: "warning",
            buttons: true,
            dangerMode: true
        }).then((willDelete) => {
            if (willDelete) {
                activarProv(idc);
                swal(" ¡Proveedor Activado! ", {
                    icon: "success",
                }).then((willDelete) => {
                    if (willDelete) {
                        parent.location.href = "proveedor?accion=listar";
                    }
                });
            }
        });
    });
});
function activarProv(idc) {
        var url = "proveedor?cambiar=des&cod=" + idc;
        console.log("hol");
        $.ajax({
            type: 'POST',
            url: url,
            async: true,
            success: function (r) {
            }
        });
    }
    
$(document).ready(function () {
    $("#desactivarProv").click(function (e) {
        e.preventDefault();
        var idc = $(this).parent().find('#item').val();        
        swal({
            title: "Esta Seguro de Desactivar el Proveedor?",
            text: "Si lo hace, no podrá hacer más a compras a este proveedor",
            icon: "warning",
            buttons: true,
            dangerMode: true
        }).then((willDelete) => {
            if (willDelete) {
                desactivarProv(idc);
                swal(" ¡Proveedor Desactivado! ", {
                    icon: "success",
                }).then((willDelete) => {
                    if (willDelete) {
                        parent.location.href = "proveedor?accion=listar";
                    }
                });
            }
        });
    });
});
function desactivarProv(idc) {
        var url = "proveedor?cambiar=act&cod=" + idc;
        console.log("hol");
        $.ajax({
            type: 'POST',
            url: url,
            async: true,
            success: function (r) {
            }
        });
    }
