<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<html>
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta http-equiv="Content-Type" content="text/html" charset="UTF-8">
        <title>Piel Morena Shop</title>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
        <link rel="icon" type="image/png" href="dist/img/pielicon2.png">
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.2/css/all.css" integrity="sha384-oS3vJWv+0UjzBfQzYUhtDYW+Pj2yciDJxpsK1OYPAYjqT085Qq/1cq5FLXAZQ7Ay" crossorigin="anonymous">
        <link rel="stylesheet" href="https://cdn.datatables.net/1.10.19/css/jquery.dataTables.min.css">
        <link rel="stylesheet" href="https://cdn.datatables.net/buttons/1.5.6/css/buttons.dataTables.min.css">
    </head>
    <body>      
        <section class="mt-4 ml-4 mr-4">  
            <h3 class="col-md-5"> Reporte | Filtro de Ventas</h3> 
            <form class="">
                <div class="row">         
                    <div class="col-md-6">                    
                        <label>Buscar Por Periodo de Fechas</label>
                        <div class="row">
                            <div class="col-md-6">
                                <input type="date" name="fecha1" class="form-control">
                            </div>
                            <div class="col-md-6">
                                <input type="date" name="fecha2" class="form-control">
                            </div>                            
                        </div>                                
                    </div>                    
                    <div class="col-md-3">                    
                        <label>Buscar Por Cliente</label>
                        <div class="row">
                            <div class="col-md-12">
                                <input type="text" name="txtCodigoCliente" class="form-control" placeholder="Ingrese Codigo">
                            </div>                                                
                        </div>                                
                    </div>                    
                    <div class="col-md-3">                    
                        <label>Buscar Por Empleado</label>
                        <div class="row">
                            <div class="col-md-12">
                                <input type="text" name="txtCodigoEmpleado" class="form-control" placeholder="Ingrese Codigo">
                            </div>                                                
                        </div>                                
                    </div>                    
                    <div class="col-md-3">                      
                        <div class="row">
                            <div class="col-md-12 card-body">
                                <button type="submit" name="accion" value="GenerarReporte" class="btn btn-primary">Generar Reporte</button>
                            </div>                                                
                        </div>                                
                    </div>                    
                </div> 
            </form>
            <!--Modal Para Agreagr Nuevo-->                  
            <div class="modal fade bd-example-modal-lg" id="exampleModalCenter" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
                <div class="modal-dialog modal-dialog-centered modal-dialog modal-lg" role="document">
                    <div class="modal-content">
                        <form action="proveedor?accion=re">
                            <div class="modal-header">
                                <h5 class="modal-title" id="exampleModalLongTitle">Agregar Proveedor</h5>
                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                    <span aria-hidden="true">&times;</span>
                                </button>
                            </div>
                            <div class="modal-body">
                                <div class="row">                              
                                    <div class="form-group d-flex col-md-6">
                                        <div class="col-md-3 text-right">
                                            <label>Nombres</label>
                                        </div>
                                        <div class="col-md-9">
                                            <input type="text" name="txtNombre" class="form-control">
                                        </div>                                     
                                    </div>
                                    <div class="form-group d-flex col-md-6">
                                        <div class="col-md-3 text-right">
                                            <label>RUC</label>
                                        </div>
                                        <div class="col-md-9">
                                            <input type="text" name="txtRuc" class="form-control">
                                        </div>                                     
                                    </div>
                                    <div class="form-group d-flex col-md-6">
                                        <div class="col-md-3 text-right">
                                            <label>Represe</label>
                                        </div>
                                        <div class="col-md-9">
                                            <input type="text" name="txtRepresentante" class="form-control">
                                        </div>                                     
                                    </div>
                                    <div class="form-group d-flex col-md-6">
                                        <div class="col-md-3 text-right">
                                            <label>Tipo</label>
                                        </div>
                                        <div class="col-md-9">
                                            <input type="text" name="txtTipo" class="form-control">
                                        </div>                                     
                                    </div>
                                    <div class="form-group d-flex col-md-6">
                                        <div class="col-md-3 text-right">
                                            <label>Telefono</label>
                                        </div>
                                        <div class="col-md-9">
                                            <input type="text" name="txtTelefono" class="form-control">
                                        </div>                                     
                                    </div>
                                    <div class="form-group d-flex col-md-6">
                                        <div class="col-md-3 text-right">
                                            <label>Direccion</label>
                                        </div>
                                        <div class="col-md-9">
                                            <input type="text" name="txtDireccion" class="form-control">
                                        </div>                                     
                                    </div>
                                    <div class="form-group d-flex col-md-6">
                                        <div class="col-md-3 text-right">
                                            <label>Estado</label>
                                        </div>
                                        <div class="col-md-9">
                                            <input type="text" name="txtEstado" class="form-control">
                                        </div>                                     
                                    </div>                                                                                                
                                    <div class="form-group d-flex col-md-6">
                                        <div class="col-md-3 text-right">
                                            <label>Cargo</label>
                                        </div>
                                        <div class="col-md-9">
                                            <input type="text" name="txtCargo" class="form-control">
                                        </div>                                     
                                    </div>                                                                                                
                                </div>
                            </div> 
                            <div class="modal-footer">
                                <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                                <button type="button" class="btn btn-primary">Guardar Proveedor</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
            <br>
            <div class="">                              
                <table class="table table-hover" id="TablaProveedor">
                    <thead class="thead-light">
                        <tr class="text-center">
                            <th>#</th>
                            <th>Codigo</th>
                            <th>Tipo Comprobante</th>
                            <th>Nro Serie</th>
                            <th>Fecha</th>  
                            <th>Monto</th>
                            <th>Cliente</th>
                            <th>Vendedor</th>
                            <th>Estado</th> 
                        </tr>
                    </thead>
                    <c:forEach var="prov" items="${proveedor}" varStatus="iteracion">                                                    
                        <tr class="text-center">
                            <td>${iteracion.index + 1}</td>
                            <td>${prov.nombre}</td>
                            <td>${prov.RUC}</td>
                            <td>${prov.nombreRepresentante}</td>
                            <td>${prov.tipoProveedor}</td>
                            <td>${prov.telefono}</td>
                            <td>${prov.direccion}</td>
                            <td>${prov.estado == false ? 'Inactivo' : 'Activo'}</td>
                            <td><a href="
                                   <c:url value="proveedor">
                                       <c:param name="accion" value="pr" />
                                       <c:param name="cod" value="${prov.idProveedor}"/>
                                   </c:url>">
                                    <button class="btn btn-warning" data-toggle="tooltip" title="" data-original-title="Editar">
                                        <i class="fa fa-edit"></i>
                                    </button>
                                </a>
                            </td>
                        </tr>                                                    
                    </c:forEach>                                               
                </table>               
            </div>                  

        </section>        
        <script src="https://code.jquery.com/jquery-3.4.1.js" integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU=" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
        <script src="https://cdn.datatables.net/1.10.19/js/jquery.dataTables.min.js" type="text/javascript"></script>
        <script src="https://cdn.datatables.net/buttons/1.5.6/js/dataTables.buttons.min.js" type="text/javascript"></script>
        <script src="https://cdn.datatables.net/buttons/1.5.6/js/buttons.flash.min.js" type="text/javascript"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jszip/3.1.3/jszip.min.js" type="text/javascript"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.53/pdfmake.min.js" type="text/javascript"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.53/vfs_fonts.js" type="text/javascript"></script>
        <script src="https://cdn.datatables.net/buttons/1.5.6/js/buttons.html5.min.js" type="text/javascript"></script>
        <script src="https://cdn.datatables.net/buttons/1.5.6/js/buttons.print.min.js" type="text/javascript"></script>
        <script src="" type="text/javascript"></script>

        <!-- código JS propìo-->    
        <script type="text/javascript">
            $(document).ready(function () {
                $('#TablaProveedor').DataTable({
                    dom: 'Bfrtip',
                    buttons: [
                        //'copy', 'csv', 'excel', 'pdf', 'print'
                        'excel', 'pdf', 'print'
                    ]
                });
            });
        </script>
    </body>
</html>

