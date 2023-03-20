

var tabla;
$(document).ready(function(){
    listar_users();
    carga_perfil();

})
function valideKey(evt) {
  // code is the decimal ASCII representation of the pressed key.
  var code = evt.which ? evt.which : evt.keyCode;

  if (code == 8) {
    // backspace.
    return true;
  } else if (code >= 48 && code <= 57) {
    // is a number.
    return true;
  } else {
    // other keys.
    return false;
  }
}
function listar_users(){
      if ($(".lms_table_active").length) {
        tabla = $(".lms_table_active").DataTable({
          bLengthChange: true,
          bDestroy: true,
          language: {
            search: "Buscar por",
            lengthMenu: "Mostrar _MENU_ Elementos",
            info: "Mostrando _START_ a _END_ de _TOTAL_ Elementos",
            infoEmpty: "Mostrando 0 registros de 0 registros encontrados",
            paginate: {
              next: "<i class='ti-arrow-right'></i>",
              previous: "<i class='ti-arrow-left'></i>",
            },
          },
          columnDefs: [{ visible: false }],
          responsive: true,
          searching: true,
          ajax: {
            url: "usuario/listarUsers",
            type: "GET",
            dataSrc: "",
          },
          columns: [
            { data: "N" },
            { data: "USUARIO" },
            { data: "NOMBRES" },
            { data: "PERFIL" },

            {
              data: null,
              render: function (data, type, row) {
                if (data["ESTADO"] == 1) {
                  return (
                    `<a href="javascript:void(0)" onclick=estado(` + data["CODIGO"] + `,` + data["ESTADO"] +`)><span class="badge rounded-pill bg-primary">ACTIVO</span></a> `
                  );
                } else {
                  return (
                    `<a href="javascript:void(0)  onclick=estado(` +
                    data["CODIGO"] +
                    `,` +
                    data["ESTADO"] +
                    `)><span class="badge rounded-pill bg-danger">DESACTIVADO</span></a> `
                  );
                }
              },
            },
            {
              data: null,
              render: function (data, type, row) {
                return (
                  ` <div class="action_btns d-flex">
                    <a href="javascript:void(0)"  onclick=eliminarData(` +data["CODIGO"] +`) class="action_btn del">
                      <i class="fas fa-trash"></i>
                    </a>
                  </div>`
                );
              },
            },
          ],
        });
      }

}
function carga_perfil(){
    $.ajax({
      url: "usuario/cargarPerfil",
      type:"GET",
      dataType:"JSON",
      dataSrc:"",
      success:function(data){
        for(var i=0; i<data.length; i++){
            $("#perfil").append("<option value="+data[i]['IdPerfil']+">"+data[i]['Descripcion']+"</option>")
        }

      },
      error:function(data){
        console.log(data.responseText);
      }
    });

    $("#frmRegistro").submit(function(e){
      var data=$("#frmRegistro").serialize();
      $.ajax({
        type:"POST",
        url: "usuario/registrar_usuario",
        data:data,
        dataType:"JSON",
        success:function(data){
          if(data.respuesta==true){
            console.log(data.respuesta+" " + data.mensaje);
            tabla.ajax.reload();
            resetForm();
            $("#modalAgregar").modal('hide');
          }else{
            Swal.fire(data.mensaje,"Mensaje error","error");
          }
        },
        error:function(data){
          console.log(data);
        }

      });
      e.preventDefault();
    })
}
function estado(codigo, estado){
  console.log("codigo" + " " +codigo)
   console.log("estado" + " " + estado);
  if(estado==1)
    estado=2;
  else
    estado=1;
  $.ajax({
    type: "POST",
    url: "usuario/cambiar_estado",
    data:{codigo:codigo,estado:estado},
    dataType:"JSON",
    success:function(data){
      if(data.respuesta==true){
        console.log(data.respuesta+ " " + data.mensaje);
        tabla.ajax.reload();
      }else{
        console.log(data.respuesta + " " + data.mensaje);
      }
     
    },
    error:function(data){
      console.log(data);
    }
  });
  

}
 function resetForm() {
   $("#frmRegistro").trigger("reset");
 }

 $("#nuevo").on("click", function () {
   resetForm();
 });
 $("#cancelar").on("click", function () {
   resetForm();
 });