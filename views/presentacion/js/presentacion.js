var tabla;

$(document).ready(function(){
   
  
   refreshTable();
})

function refreshTable(){
  tabla = $("#tblRegistros").DataTable({
    language: {
      processing: "Traitement en cours...",
      search: "Buscar por:",
      lengthMenu: "Mostrar _MENU_ Elementos",
      info: "Mostrando _START_ a _END_ de _TOTAL_ Elementos",
      infoEmpty: "Mostrando 0 registros de 0 registros encontrados",
      infoFiltered: "(filtr&eacute; de _MAX_ &eacute;l&eacute;ments au total)",
      infoPostFix: "",
      loadingRecords: "Chargement en cours...",
      zeroRecords:
        "<span class='text-danger'>No se encontro ningún elemento.</span>",
      emptyTable:
        "<span class='text-danger' id='texto-rojo'>No se encontro ningún registro disponible.</span>",
      paginate: {
        next: "Siguiente",
        previous: "Anterior",
      },
      aria: {
        sortAscending: ": activer pour trier la colonne par ordre croissant",
        sortDescending: ": activer pour trier la colonne par ordre décroissant",
      },
    },
    responsive: true,
    ajax: {
      url: "presentacion/listarPresentacion",
      type: "GET",
      dataSrc: "",
    },
    columns: [
      { data: "N°" },
      { data: "DESCRIPCION" },
      {
        defaultContent: `<button class='editar btn badge bg-info'> Editar</button> `,
      },
    ],
  });
      obtenerData("#tblRegistros tbody", tabla);
}
$("#btnGuardar").click(function(){
   var id=$("#idPresentacion").val();
   var descripcion=$("#descripcion").val();
   if(id==""){
    if(descripcion==""){
        $( "#descripcion" ).focus();
       
        console.log("Ingrese Datos");
    }else{
         registrar();
    }
  
   }else{
    actualizar();
    
   }
  
 
})

function registrar(){
    var data=$("#frmRegistro").serialize();
    $.ajax({
        type:"POST",
        url:"presentacion/Registrar",
        data:data,
        dataType:"JSON",
        success:function(r){
            if(r.respuesta==true){
               
                tabla.ajax.reload(); 
                resetForm();
                $("#modalAgregar").modal('hide');
            }else{
                Swal.fire(r.mensaje,'Error de Registro','error');
                resetForm();
            }
          
        },
        error:function(r){
          
            console.log(r);
        }
    })
  
}
function obtenerData(tbody, table){
    $(tbody).on("click","button.editar",function(){
        var data=table.row($(this).parents("tr")).data();
        $("#idPresentacion").val(data.CODIGO_PRESENTACION);
        $("#descripcion").val(data.DESCRIPCION);
        $("#modalAgregar").modal('show');
       
    })
}
function actualizar(){
    var data=$("#frmRegistro").serialize();
    $.ajax({
        type:"POST",
        url:"presentacion/Actualizar",
        data:data,
        dataType:"JSON",
        success:function(r){
            if(r.respuesta==true){
                
                 tabla.ajax.reload();
                 resetForm();
                 $("#modalAgregar").modal('hide');
            }else{
                
                resetForm();
            }
        },
        error:function(r){
           
            console.log(r);
        }

    })  
   
  

}
function resetForm(){
    $("#idCategoria").val("");
    $("#descripcion").val("");
 

}