

var tabla;
$(document).ready(function(){
  listar();
  validarFormulario();
})


function lisarCategoria(){
  $.ajax({
    url:"producto/listarCategory",
    type:"GET",
    dataType:"JSON",
    success:function(data){
      for(i=0;i<data.length;i++){
        $("#prueba").append('<option value="'+data[0][0]+'" >'+data[i][1]+'</option>')
      }
    }
  })
}
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
        "url":"producto/refresh",
        "type":"GET",
        "dataSrc":""
    },
    "columns":[
      {"data":"N°"},
      {"data":"CODIGO"},
      {"data":"PRODUCTO"},
      {"data":"MARCA"},
      {"data":"STK_MIN"},
      {"data":"STOCK"},
      {"data":"PRECIO_MAYOR"},
      {"data":"PRECIO_MENOR"},
      {"data":"CATEGORIA"},
      {   "data": null,
                render: function(data, type, row){
                    return ` <div class="action_btns d-flex">
                    <a href="javascript:void(0)" onclick="enviarData(`+data['ID_PRODUCTO']+`);" class="action_btn mr_10 edit">
                      <i class="far fa-edit"></i>
                    </a>
                    <a href="javascript:void(0)"  onclick=eliminarData(`+data['ID_PRODUCTO']+`) class="action_btn del">
                      <i class="fas fa-trash"></i>
                    </a>
                  </div>`
                }
              
            }
    ]
    });
  }
}




function validarFormulario(){
  $("#moneda").on("change",function(){
    if($("#moneda").val()==''){
      $("#moneda").css("border","1px solid #f00");
      $("#moneda").focus();
    }else{
      $("#moneda").css("border","1px solid #14B76E");
     
    }
  })
  $("#categoria").on("change",function(){
    if($("#categoria").val()==""){
      $("#categoria").css("border","1px solid #f00");
      $("#moneda").focus();
    }else{
      $("#categoria").css("border","1px solid #14B76E");
      $("#codigo").focus();
      if($("#codigo").val()==''){
        $("#codigo").css("border","1px solid #f00");
      }else{
        $("#codigo").css("border","1px solid #14b76e");
      }
    }
  })
  $("#codigo").on("keyup",function(){
    if($('#codigo').val()==''){
      $('#codigo').css("border","1px solid #f00");
      $('#codigo').focus();
    }else{
      $('#descripcion').css("border","1px solid #f00");
      $('#codigo').css("border","1px solid #14b76e");
    }
  })
  $('#codigo').on('change',function(){
    if($('#codigo').val()==''){
      $('#codigo').css("border","1px solid #f00");
      $('#codigo').focus();
    }else{
      $('#codigo').css("border","1px solid #14b76e");
    }
    $('#descripcion').focus();
    if($('#descripcion').val()==''){
      $('#descripcion').css("border","1px solid #f00");
    }else{
      $('#descripcion').css("border","1px solid #14b76e");
    }
  })
  $('#descripcion').on('keyup',function(){
   if($('#descripcion').val()==''){
    $('#descripcion').css("border","1px solid #f00");
    $('#descripcion').focus();
   }else{
    $('#marca').css("border",'1px solid #f00');
    $('#descripcion').css("border","1px solid #14b76e");
   }
  })
  $('#descripcion').on('change',function(){
  if($('#descripcion').val()==''){
    $('#descripcion').css("border","1px solid #f00");
    $('#descripcion').focus();
  }else{
    $('#descripcion').css("border","1px solid #14b76e");
  }
  $('#marca').focus();
  if($('#marca').val()==''){
    $('#marca').css("border","1px solid #f00");
  }else{
    $('#marca').css("border","1px solid #14b76e");
  }
  })
  $('#marca').on('change',function(){
    if($('#marca').val()==''){
      $('#marca').css("border","1px solid #f00");
      $('#marca').solid();
    }else{
      $('#marca').css("border","1px solid #14b76e");
    }
    $('#presentacion').focus();
    if($('#presentacion').val()==''){
      $('#presentacion').css("border","1px solid #f00");
    }else{
      $('#presentacion').css("border","1px solid #14b76e");
    }
  
  })
  $('#presentacion').on('change',function(){
    if($('#presenatcion').val()==''){
      $('#presentacion').css("border","1px solid #f00");
      $('#presentacion').focus();
    }else{
      $('#presentacion').css("border","1px solid #14b76e");
    }
    $('#umedida').focus();
    if($('#umedida').val()==''){
      $('#umedida').css("border","1px solid #f00");
    }else{
      $('#umedida').css("border","1px solid #14b76e");
    }
  })
  $('#umedida').on('change',function(){
    if($('#umedida').val()==''){
      $('#umedida').css("border","1px solid #f00");
      $('#umedida').focus();
    }else{
      $('#umedida').css("border","1px solid #14b76e");
    }
    $('#stock').focus();
    if($('#stock').val()<=0){
      $('#stock').css("border","1px solid #f00");
    }else{
      $('#sotck').css("border","1px solid #14b76e");
    }
  
  })
  $('#stock').on('keyup',function(){
    if($('#stock').val()<=0){
      $('#stock').css("border","1px solid #f00");
      $('#stock').focus();
    }else{
      $('#stock').css("border","1px solid #14b76e");
      $('#preciomayor').css("border","1px solid #f00"); 
    }
  })
  $('#stock').on('change',function(){
    if($('#stock').val()<=0){
      $('#stock').css("border","1px solid #f00")
    }else{
      $('#stock').css("border","1px solid #14b76e");
    }
    $('#preciomayor').focus();
    if($('#preciomayor')<=0){
      $('#preciomayor').css("border","1px solid #f00"); 
    }else{
      $('#preciomayor').css("border","1px solid #14b76e"); 
    }

  })
  $('#preciomayor').on('keyup',function(){
    if($('#preciomayor')<=0){
      $('#preciomayor').css("border","1px solid #f00"); 
      $('#preciomayor').focus();
    }else{
      $('#preciomayor').css("border","1px solid #14b76e"); 
      $('#preciomenor').css("border","1px solid #f00");
    }
  })
  $('#preciomayor').on('change',function(){
    if($('#preciomayor')<=0){
      $('#preciomayor').css("border","1px solid #f00"); 
    }else{
      $('#preciomayor').css("border","1px solid #14b76e"); 
    }
    $('#preciomenor').focus();
    if($('#preciomenor').val<=0){
        $('#preciomenor').css("border","1px solid #f00"); 
      }else{
        $('#preciomenor').css("border","1px solid #14b76e");  
    }
  })
  $('#preciomenor').on('keyup',function(){
    if($('#preciomenor')<=0){
      $('#preciomenor').css("border","1px solid #f00"); 
      $('#preciomenor').focus();
    }else{
      $('#preciomenor').css("border","1px solid #14b76e"); 
      $('#preciocompra').css("border","1px solid #f00");
    }
  })
  $('#preciomenor').on('change',function(){
    if($('#preciomenor')<=0){
      $('#preciomenor').css("border","1px solid #f00"); 
    }else{
      $('#preciomenor').css("border","1px solid #14b76e"); 
    }
    $('#preciocompra').focus();
    if($('#preciocompra')<=0){
      $('#preciocompra').css("border","1px solid #f00"); 
    }else{
      $('#preciocompra').css("border","1px solid #14b76e"); 
    }
  })

  $('#preciocompra').on('keyup',function(){
    if($('#preciocompra')<=0){
      $('#preciocompra').css("border","1px solid #f00"); 
      $('#preciocompra').focus();
    }else{
      $('#preciomenor').css("border","1px solid #14b76e"); 
    }
  })

}




$("#frmRegistro").submit(function(e){
  if($('#idProducto').val()==0){
      Insertar();
  }else{
    Actualizar();
  }
   
 
 e.preventDefault();

})

// codigo para registrar datos
function Insertar(){
  var data=$("#frmRegistro").serialize();
  $.ajax({
    type:'POST',
    url:'producto/Registrar',
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
function enviarData( valor){

    $.ajax({
      method:'POST',
      url:'producto/obtenerData',
      data:{idProducto:valor},
      dataType:'json',
      success:function(respuesta){
        console.log("obteniendo datos... " + respuesta)
        $('#idProducto').val(respuesta[0][0]);
        $('#moneda').val(respuesta[0][1]);
        $('#categoria').val(respuesta[0][2]);
        $('#codigo').val(respuesta[0][3]);
        $('#descripcion').val(respuesta[0][4]);
        $('#marca').val(respuesta[0][5]);
        $('#stkminimo').val(respuesta[0][6]);
        $('#presentacion').val(respuesta[0][7]);
        $('#umedida').val(respuesta[0][8]);
        $('#stock').val(respuesta[0][9]);
        $('#preciomayor').val(respuesta[0][10]);
        $('#preciomenor').val(respuesta[0][11]);
        $('#preciocompra').val(respuesta[0][12]);
        $("#modalAgregar").modal('show');
        console.log("ID ESTA CON DATOS...." +  $('#idProducto').val(respuesta[0][0]))
      },
      error:function(respuesta){
        console.log(respuesta);
      }
      
    })
}






// codigo para obtener data y enviar al formulario

// codigo para actualizar producto
function Actualizar(){
  var data=$("#frmRegistro").serialize();
  $.ajax({
    type:'POST',
    url:'producto/Actualizar',
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

function eliminarData(valor) {

  Swal.fire({
    title: 'estas seguro de eliminar a ',
    text: 'Mensaje de Confirmación',
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
    url:'producto/Eliminar',
    type:"POST",
    data:{idProducto:valor},
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