
//<-----variables globales------>
var aData={}
var cont=0;
var detalles=0;
var valor_igv=1.18
var idcompras=0;
$("#btnGuardar").show();
$("#comprobante").prop("disabled",true)
$("#TipoPago").prop("disabled",true)
$("#nserie").prop("disabled",true)
$("#ncomprobante").prop("disabled",true)
$("#fecha").prop("disabled",true)
$("#documento").prop("disabled",true)
$("#btnBuscar").prop("disabled",true)
//<----fin de las variables globales------->

$( function() {
  var fecha = new Date();
  document.getElementById("fecha").value = fecha.toJSON().slice(0, 10);

listarComboTipo();
listarComboTipoDoc()
    $( "#buscar" ).autocomplete({
      source: function( request, response ) {
        $.ajax( {
          url: "compras/autocompleteP",
          type:'GET',
          dataType: "json",
       
          success: function( data ) {
            console.log('data ' +data)
            
           aData=$.map(data,function(value, key){
            return{
                label:value.Codigo+ ' - '+ value.Producto +' - '+ value.Marca +' - '+ value.Stock,
                cod:value.IdProd,
                codigo:value.Codigo,
                producto:value.Producto,
                precio:value.Precio
            };
           });
            //console.log(aData);
            var results=$.ui.autocomplete.filter(aData,request.term);
            response(results);
          }
        } );
      },
      select:function(event, ui){
      codigo =ui.item.cod
      producto=ui.item.producto;
      cantidad=1
      precio=new Decimal(ui.item.precio).toNumber();
      importe=parseInt(cantidad)*(precio)
      //console.log(precioDecimal);
      console.log("contador inicial " + cont)
      var fila='<tr class="filas" id="fila'+cont+'">'
       fila+="<td>"+'<input type="text" style="width:50px; height:25px; " name="cantidad[]" id="cantidad" value="'+cantidad+'" class="text-center">'+"</td>"
       fila+="<td>"+'<input type="hidden" name="idProducto[]" value="'+codigo+'">'+producto+"</td>"
       fila+="<td>"+'<input type="hidden"  style="width:60px; height:25px; " name="precio[]" id="precio" value="'+precio+'" class="text-center">'+precio+ "</td>"
       fila+="<td>"+ '<input type="hidden" name="importe[]" id="importe" value="'+importe+'">'+'<span name="importe" id="importe'+cont+'">'+importe.toFixed(2)+'</span>'+"</td>"
       fila+="<td>"+'<div class="action_btns d-flex"> <a href="javascript:void(0)"  class="action_btn " id="delete"  onclick="eliminarDetalle('+cont+')"><i class="fas fa-trash"></i></a></div>'+"</td>"
       fila+="</tr>"
       cont++;
       detalles=detalles+1
       console.log("Imprimiendo detalles : " + detalles)
       $("#tdata").append(fila)
      calculos();
  
        setTimeout(function(){
          $("#buscar").val('');
        }, 500);
        calculos();
      }
    
 
    } );

    //autocompletado de proveedores
    $( "#documento" ).autocomplete({
      source: function( request, response ) {
        $.ajax( {
          url: "compras/autocompletePrv",
          type:'GET',
          dataType: "json",
       
          success: function( data ) {
            console.log('data ' +data)
            
           aData=$.map(data,function(value, key){
            return{
                label:value.Ruc+ ' - '+ value.Razon_Social,
                codigo:value.IdProveedor,
                Ruc:value.Ruc,
                proveedor:value.Razon_Social,
            };
           });
            //console.log(aData);
            var results=$.ui.autocomplete.filter(aData,request.term);
            response(results);
          }
        } );
      },
      select:function(event, ui){
        $("#idProveedor").val(ui.item.codigo)
      }
 
    } );
      //fin del autocompletado de proveedores
   
  } );


  $(document).on("keyup","#cantidad",function(){
    
  calculos();

  })


function calculos(){
  var cant = document.getElementsByName("cantidad[]");
  var prec = document.getElementsByName("precio[]");
  var sub = document.getElementsByName("importe");

  for (var i = 0; i <cant.length; i++) {
    var inpC=cant[i];
    var inpP=prec[i];
    var inpS=sub[i];
     console.log("CANTIDAD.." +inpC.value)
    inpS.value= inpC.value * inpP.value;
    console.log(inpS.value)
    document.getElementsByName("importe")[i].innerHTML = inpS.value.toFixed(2);
  }
  calcularTotales();
  }

  function calcularTotales(){
  	var sub = document.getElementsByName("importe");
  	var total = 0.0;
  	for (var i = 0; i <sub.length; i++) {
		total += document.getElementsByName("importe")[i].value;
	}
	$("#totalPagar").html("S/. " + new Decimal(total).toNumber().toFixed(2));
  //calculamos el sub total mas igv y el total 
  ImpTotal=total
   base=new Decimal(ImpTotal).dividedBy(valor_igv).toNumber();
   $("#subtotals").html( "S/. "+base.toFixed(2))
   $("#base").val(base.toFixed(2))
   igv=new Decimal(ImpTotal).sub(base).toNumber();
   $("#igv").html("S/." +igv.toFixed(2))
   $("#igv_final").val(igv.toFixed(2))
   totalPagar=new Decimal(base).plus(igv).toNumber();
   $("#totals").html("S/. " + totalPagar.toFixed(2));
   $("#total_final").val(totalPagar.toFixed(2))
    evaluar();
  }
function evaluar(){
  if (detalles>0)
    {
      $("#btnGuardar").show();
      $("#comprobante").prop("disabled",false)
      $("#comprobante").css("border", "1px solid #f00");
    }
    else
    {
     deshabilitar();
     limpiar();

   
      cont=0;
    }
}

function eliminarDetalle(indice){
  $("#fila" + indice).remove();
  calcularTotales();
  detalles=detalles-1;
  evaluar();
}
function deshabilitar(){
  $("#btnGuardar").show(); 
  $("#comprobante").prop("disabled",true)
  $("#TipoPago").prop("disabled",true)
  $("#nserie").prop("disabled",true)
  $("#ncomprobante").prop("disabled",true)
  $("#fecha").prop("disabled",true)
  $("#documento").prop("disabled",true)
  $("#btnBuscar").prop("disabled",true)
  $("#comprobante").css("border", "1px ");
   $("#TipoPago").css("border", "1px ");

  
  
}
function limpiar(){
     //limpiamos los campos
     $("#comprobante").val("")
     $("#TipoPago").val("")
     $("#nserie").val("")
     $("#ncomprobante").val("")
     $("#fecha").val("")
     $("#documento").val("")
     $("#idProveedor").val("")
     $(".filas").remove();
     $("#base").val("S/. 00.00")
     $("#igv").val("S/. 00.00");
     $("#totals").val("S/. 00.00");
     $("#totalPagar").val("S/. 00.00");

}
  


// metodo para consulta de datos reniec y sunat para proveedores
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
                $("#modalAgregar").modal('show')
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
                $("#modalAgregar").modal('show')
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

function listarComboTipo(){
  $.ajax({
    url:'compras/cargarTipoCon',
    type:'GET',
    dataType:'JSON',
    dataSrc:'',
    success:function(data){
      for(i=0; i<data.length;i++){
        console.log(data[i]['Id']);
        console.log(data[i]['Descripcion']);
        $("#tipocontribuyente").append('<option value="'+data[i]["Id"]+'">'+data[i]['Descripcion']+'</option>');
      }
    },
    error:function(data){
      console.log("ERROR " +data);
    }
  })
}


function listarComboTipoDoc(){
  $.ajax({
    url:'compras/cargarTipoDoc',
    type:'GET',
    dataType:'JSON',
    dataSrc:'',
    success:function(data){
      for(i=0; i<data.length;i++){
        console.log(data[i]['Id']);
        console.log(data[i]['Descripcion']);
        $("#tipodocumento").append('<option value="'+data[i]["Id"]+'">'+data[i]['Descripcion']+'</option>');
      }
    },
    error:function(data){
      console.log("ERROR " +data);
    }
  })
}
$("#tipocontribuyente").on('change',function(){
  var cod = document.getElementById("tipocontribuyente").value;
alert(cod);
})


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
       
        Swal.fire(r.mensaje,'Mensaje de confirmación','success');
        $("#idProveedor").val(r.id)
        $("#documento").val(r.ruc + "-"+r.nombre);
        resetForm();
        $("#modalAgregar").modal('hide');
    }else{
        Swal.fire(r.mensaje,'Error de Registro','error');
        $('#codigo').focus();
    }
    
  
  },
  error:function(r){
    console.log(r.responseText);
  }


  })
}
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

function resetForm(){
  $("#frmRegistro").trigger('reset');
}

$("#nuevo").on('click',function(){
  resetForm();
})
$("#cancelar").on('click',function(){
  resetForm();
})

$("#btnGuardar").click(function(){

  // datos de la tabla compras
  if(detalles==0 ){
     showMessages(
       "debe agregar al menos un producto al carrito !!",
       "danger",
       '<i class="fas fa-minus-circle"></i>'
     );
  }else{
     if ($("#documento").val()=="") {
        showMessages(
       "debe ingresar un proveedor !!",
       "danger",
       '<i class="fas fa-minus-circle"></i>'  );
       $("#comprobante").css("border", "1px solid #f00");
       $("#documento").focus();
   

    }else{
       InsertarCompra();
      InseertarDetalle();
       showMessages("Compra Registrada con éxito", "success", '<i class="fas fa-check-circle"></i>' );
        limpiar();
        deshabilitar();
     
    }

  }

  
    
})

$("#documento").on ('keyup',function(){
  if($("#documento").val()==""){
     $("#documento").css("border", "1px solid #f00");
     $("#documento").focus();
  }else{
     $("#documento").css("border", "1px solid #14b76e");
  }
 
})
function InsertarCompra(){

  idProveedor = $("#idProveedor").val();
  comprobante = $("#comprobante").val();
  nserie = $("#nserie").val();
  ncomprobante = $("#ncomprobante").val();
  TipoPago = $("#TipoPago").val();
  fecha=$("#fecha").val();
  total = $("#total_final").val();
  // se crea  el objeto para enviar al servidor
  var compras=
  {
    // vabecera
    idProveedor:idProveedor,
    comprobante:comprobante,
    nserie:nserie,
    ncomprobante:ncomprobante,
    TipoPago:TipoPago,
    fecha:fecha,
    total:total,
    }
console.log(compras);
 $.ajax({
   type: "POST",
   url: "compras/Registrar",
   data: compras,
   dataType:"JSON",
   success:function(data){
    if(data.respuesta==true){
     console.log(data.respuesta)
    }else{
      console.log(data.respuesta);
    }
   },
   error:function(data){
    console.log(data.responseText);
    console.log(data.id);

   }
 });
 
}

function InseertarDetalle(){

    var idProducto = document.getElementsByName("idProducto[]");
    var cantidad = document.getElementsByName("cantidad[]");
    var precio = document.getElementsByName("precio[]");
    var importe = document.getElementsByName("importe[]");
    for (i = 0; i < idProducto.length; i++) {
      var idP = idProducto[i];
      var prec = precio[i];
      var cant = cantidad[i];
      var imp = importe[i];
      var array = [idP.value, prec.value, cant.value, imp.value];
      console.log(array);

      $.ajax({
        type: "POST",
        url: "compras/Registrar_Detalle",
        data: { arrayProd: array },
        dataType: "JSON",
        success: function (data) {
          if (data.respuesta == true) {
           console.log(data)
          } else {
            console.log(data);
          }
        },
        error: function (data) {
          showMessages(
            data.responseText,
            "danger",
            '<i class="fas fa-minus-circle"></i>'
          );
          console.log(data.responseText);
        },
      });
    }
      
 

}
//validar formulario de compras
$("#comprobante").on("change",function(){
  if($("#comprobante").val()==""){
    $("#comprobante").css("border","1px solid #f00");
    $("#TipoPago").val("");
     $("#TipoPago").css("border", "1px solid #f00");
    $("#comprobante").focus();
    //deshabilitamos los campos y limpiamos
    limpiar();
     $("#comprobante").prop("disabled", false);
     $("#TipoPago").prop("disabled", true);
     $("#nserie").prop("disabled", true);
     $("#ncomprobante").prop("disabled", true);
     $("#fecha").prop("disabled", true);
     $("#documento").prop("disabled", true);
     $("#btnBuscar").prop("disabled", true);
     $("#comprobante").css("border", "1px ");
     $("#TipoPago").css("border", "1px ");
  }else{
    $("#comprobante").css("border","1px solid #14b76e");
    $("#TipoPago").prop("disabled",false);
    $("#TipoPago").val("CONTADO");
    $("#TipoPago").css("border", "1px solid #14b76e");
  }
  if($("#comprobante").val()=="BOLETA"){
    $("#nserie").val("B001");
    $("#ncomprobante").val("0000001");
    $("#nserie").css("border", "1px solid #14b76e");
    $("#ncomprobante").css("border", "1px solid #14b76e");

    $("#nserie").prop("disabled", false);
    $("#ncomprobante").prop("disabled", false);
    $("#fecha").prop("disabled", false);
    $("#documento").prop("disabled", false);
     $("#documento").css("border", "1px solid #f00");
      $("#documento").focus();
  }
  else{
     if($("#comprobante").val()=="FACTURA"){
       $("#nserie").val("F001");
       $("#ncomprobante").val("0000001");
       $("#nserie").css("border", "1px solid #14b76e");
       $("#ncomprobante").css("border", "1px solid #14b76e");
        $("#nserie").prop("disabled", false);
        $("#ncomprobante").prop("disabled", false);
        $("#fecha").prop("disabled", false);
        $("#documento").prop("disabled", false);
          $("#documento").css("border", "1px solid #f00");
          $("#documento").focus();
     }else{
      if($("#comprobante").val()=="PROFORMA"){
         $("#nserie").val("P001");
         $("#ncomprobante").val("0000001");
         $("#nserie").css("border", "1px solid #14b76e");
         $("#ncomprobante").css("border", "1px solid #14b76e");
          $("#nserie").prop("disabled", false);
          $("#ncomprobante").prop("disabled", false);
          $("#fecha").prop("disabled", false);
          $("#documento").prop("disabled", false);
           $("#documento").css("border", "1px solid #f00");
            $("#documento").focus();
      }
  }
   
  }


});

function showMessages( message,cssClass,icon){
    const div=document.createElement('div');
     const span = document.createElement("span");
     span.innerHTML = icon+ '<strong>'+" "+ message+'</strong> ';
    span.style.fontSize="15px"
    div.className=`alert text-center alert-${cssClass} mt-2`;
    div.appendChild(span)
    const container = document.querySelector(".main_content_iner");
   const app= document.querySelector("#App");
    container.insertBefore(div,app);
    setTimeout(function(){
        document.querySelector('.alert').remove();

    },2000)
 }

