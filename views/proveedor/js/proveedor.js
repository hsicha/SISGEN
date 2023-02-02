var tabla;
$(document).ready(function(){
    listar()
})


// validamos solo numeros
function valideKey(evt){
    
    // code is the decimal ASCII representation of the pressed key.
    var code = (evt.which) ? evt.which : evt.keyCode;
    
    if(code==8) { // backspace.
      return true;
    } else if(code>=48 && code<=57) { // is a number.
      return true;
    } else{ // other keys.
      return false;
    }
}

$('#btnBuscar').on('click',function(){
   nDoc=$("#documento").val();
if(nDoc.length==8){
    $.ajax({
        url:"consultaDni/consultarDni",
        type:'POST',
        data:'dni='+nDoc,
        dataType:'JSON',
        success:function(respuesta){
            if(respuesta.numeroDocumento==nDoc){
                $("#rucdni").val(respuesta.numeroDocumento);
                $("#tipocontribuyente").val(1);
                $("#tipodocumento").val(respuesta.tipoDocumento);
                $("#razonsocial").val(respuesta.nombre);
                $("#representante").val("-");
                $("#direccion").val(respuesta.direccion);
                $("#telefono").val("-");
                $("#email").val("-");
                $("#documento").val("");
            }else{
                Swal.fire(respuesta.error,'Mensaje de error','error');
                $("#documento").val("");
                $("#documento").focus();
            }
        }
    
       })
    
}else if(nDoc.length==11){
    $.ajax({
        url:"consultaRuc/consultarRuc",
        type:'POST',
        data:'ruc='+nDoc,
        dataType:'JSON',
        success:function(respuesta){
            if(respuesta.numeroDocumento==nDoc){
                $("#rucdni").val(respuesta.numeroDocumento);
                $("#tipocontribuyente").val(2);
                $("#tipodocumento").val(respuesta.tipoDocumento);
                $("#razonsocial").val(respuesta.nombre);
                $("#representante").val("-");
                $("#direccion").val(respuesta.direccion);
                $("#telefono").val("-");
                $("#email").val("-");
                $("#documento").val("");
            }else{
                Swal.fire(respuesta.error,'Mensaje de error','error');
                $("#documento").val("");
                $("#documento").focus();
            }
        }
    
       })
    
}
else{
    Swal.fire("Documento ingresado no es valido",'mensaje',"error");
    $("#documento").val("");
    $("#documento").focus();
}


})
/// crud de proveedores
function listar(){
    if ($(".lms_table_active").length) {
     tabla= $(".lms_table_active").DataTable({
        bLengthChange: true,
        bDestroy: true,
        language: {
          search: "Buscar por",
          lengthMenu:    "Mostrar _MENU_ Elementos",
          info:           "Mostrando _START_ a _END_ de _TOTAL_ Elementos",
          infoEmpty:      "Mostrando 0 registros de 0 registros encontrados",
          paginate: {
            next: "<i class='ti-arrow-right'></i>",
            previous: "<i class='ti-arrow-left'></i>",
          },
        },
        columnDefs: [{ visible: false }],
        responsive: true,
        searching: true,
        "ajax":{
          "url":"proveedor/listar",
          "type":"GET",
          "dataSrc":""
      },
      "columns":[
        {"data":"N°"},
        {"data":"CONTRIBUYENTE"},
        {"data":"DOCUMENTO"},
        {"data":"RUC"},
        {"data":"RAZON_SOCIAL"},
        {"data":"DIRECCION"},
        {"data":"REPRESENTANTE"},
        {"data":"TELEFONO"},
        {"data":"EMAIL"}, 
    {   "data": null,
                render: function(data, type, row){
                    return ` <div class="action_btns d-flex">
                    <a href="javascript:void(0)" onclick="enviarData(`+data['ID_PROVEEDOR']+`);" class="action_btn mr_10 edit">
                      <i class="far fa-edit"></i>
                    </a>
                    <a href="javascript:void(0)"  onclick=eliminarData(`+data['ID_PROVEEDOR']+`) class="action_btn del">
                      <i class="fas fa-trash"></i>
                    </a>
                  </div>`
                }
              
            }
      ]
      });
    }
  }
  $("#frmRegistro").submit(function(e){
    if($('#idProveedor').val()==0){
        Insertar();
    }else{
      Actualizar();
    }
   e.preventDefault();
  
  })
  
  // codigo para registrar datos
  function Insertar(){
    console.log("metodo Insertar");
    var data=$("#frmRegistro").serialize();
    $.ajax({
      type:'POST',
      url:'proveedor/Registrar',
      data:data,
      dataType:'JSON',
      success:function(r){
        if(r.respuesta==true){
          console.log(r)
          Swal.fire(r.mensaje,'Mensaje de confirmación','success'); 
          tabla.ajax.reload();
          resetForm();
          $("#modalAgregar").modal('hide');
      }else{
          Swal.fire(r.mensaje,'Error de Registro','error');
          $('#codigo').focus();
      }
      
    
    },
    error:function(r){
      console.log("error:...." +r);
    }
  
  
    })
  }
  function enviarData(valor){
    

      $.ajax({
        method:'POST',
        url:'proveedor/obtenerData',
        data:{idProveedor:valor},
        dataType:'json',
        success:function(respuesta){
          console.log("obteniendo datos... " + respuesta)
          $('#idProveedor').val(respuesta[0][0]);
          $('#tipocontribuyente').val(respuesta[0][1]);
          $('#tipodocumento').val(respuesta[0][2]);
          $("#rucdni").val(respuesta[0][3]);
          $('#razonsocial').val(respuesta[0][4]);
          $('#representante').val(respuesta[0][5]);
          $('#direccion').val(respuesta[0][6]);
          $('#telefono').val(respuesta[0][7]);
          $('#email').val(respuesta[0][8]);
          $("#modalAgregar").modal('show');
          console.log("ID ESTA CON DATOS...." +  $('#idProveedor').val(respuesta[0][0]))
        },
        error:function(respuesta){
          console.log(respuesta);
        }
        
      })

  
  
  
   
  }
  
  
  
  
  
  
  // codigo para obtener data y enviar al formulario
  
  // codigo para actualizar producto
  function Actualizar(){
    console.log("metodo actualizar");
    var data=$("#frmRegistro").serialize();
    $.ajax({
      type:'POST',
      url:'proveedor/Actualizar',
      data:data,
      dataType:'JSON',
      success:function(r){
        if(r.respuesta==true){
          console.log(r)
          Swal.fire(r.mensaje,'Mensaje de confirmación','success'); 
          tabla.ajax.reload();
          resetForm();
          $("#modalAgregar").modal('hide');
      }else{
          Swal.fire(r.mensaje,'Error de Registro','error');
          $('#codigo').focus();
      }
    },
    error:function(r){
      console.log(r);
    }
  
  
    })
  }
function eliminarData(valor){

    Swal.fire({
      title: 'estas seguro de eliminar a ',
      text:'Mnesaje de Advertencia',
      icon: 'warning',
      showCancelButton: true,
      confirmButtonColor: '#3085d6',
      cancelButtonColor: '#d33',
      cancelButtonText: 'NO',
      confirmButtonText: 'SI'
    }).then((result) => {
      if (result.isConfirmed) {
        Swal.fire(
          EliminarP(valor)
         
        )
      }
    })
    
}
  function EliminarP(valor){
    console.log("metodo eliminar");
   $.ajax({
      url:'proveedor/Eliminar',
      type:"POST",
      data:{idProveedor:valor},
      dataType:'JSON',
      success:function(r){
        if(r.respuesta==true){
          Swal.fire(r.mensaje,'Mensaje de confirmación','success')
          tabla.ajax.reload();
          resetForm();
        }else{
          Swal.fire(r.mensaje,'Mensaje de Error','error')
        }
      },
      error:function(r){
        console.log(r);
      }
  
   })
  }
  function resetForm(){
    $("#frmRegistro").trigger('reset');
  }
  
  $("#nuevo").on('click',function(){
    resetForm();
  })
  $("#cancelar").on('click',function(){
    resetForm();
  })