


var tabla;

$(document).ready(function(){
    listar();
 
})

function listar() {
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
        url: "perfil/listar_Perfil",
        type: "GET",
        dataSrc: "",
      },
      columns: [
        { data: "N°" },
        { data: "DESCRIPCION" },
        {
          data: null,
          render: function (data, type, row) {
            return (
              ` <div class="action_btns d-flex">
                    <a href="javascript:void(0)" onclick="enviarData(` +
              data["CODIGO_PERFIL"] +
              `);" class="action_btn mr_10 edit">
                      <i class="far fa-edit"></i>
                    </a>
                    <a href="javascript:void(0)"  onclick=eliminarData(` +
              data["CODIGO_PERFIL"] +
              `) class="action_btn del">
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

//crud de perfiles}

$("#frmRegistro").submit(function(e){
    if($("#idPerfil").val()==0){
             Insertar(); 
    }else{
        Actualizar();
    }
    e.preventDefault();
})

function Insertar(){
    var data = $("#frmRegistro").serialize();
    $.ajax({
      type: "POST",
      url: "perfil/RegistrarPerfil",
      data:data,
      dataType:'json',
      success:function(data){
        if(data.respuesta==true){
            console.log(data);
            tabla.ajax.reload();
            resetForm();
            $("#modalAgregar").modal("hide");
            showMessages(
              data.mensaje,
              "success",
              '&nbsp <i class="fas fa-check-circle"></i>'
            );
        }else{
            showMessages(
              data.mensaje,
              "danger",
              ' &nbsp <i class="fas fa-do-not-enter"></i>'
            );
            $("#codigo").focus();
            console.log(data);
        }
      },
      error:function(data){
        console.log(data);
      }
    });
}
function Actualizar() {
  var data = $("#frmRegistro").serialize();
  $.ajax({
    type: "POST",
    url: "perfil/ActualizarPerfil",
    data: data,
    dataType: "json",
    success: function (data) {
      if (data.respuesta == true) {
        console.log(data);
        tabla.ajax.reload();
        resetForm();
        $("#modalAgregar").modal("hide");
        showMessages(
          data.mensaje,
          "success",
          '&nbsp <i class="fas fa-check-circle"></i>'
        );
      } else {
        showMessages(
          data.mensaje,
          "danger",
          ' &nbsp <i class="fas fa-do-not-enter"></i>'
        );
        $("#codigo").focus();
        console.log(data);
      }
    },
    error: function (data) {
      console.log(data);
    },
  });
}
function enviarData(valor){
    $.ajax({
      method: "POST",
      url: "perfil/obtenerPerfilId",
      data:{idPerfil:valor},
      dataType:'json',
      success:function(data){
        $("#idPerfil").val(data[0][0]);
        $("#descripcion").val(data[0][1]);
        $("#modalAgregar").modal("show");
        console.log("VALOR DEL ID.." + " " +  $("#idPerfil").val(data[0][0]));
      },
      error:function(data){
        console.log(data);
      }
    });
}
function eliminarData(valor){
 Swal.fire({
   title: "estas seguro de eliminar a ",
   text: "Mnesaje de Advertencia",
   icon: "warning",
   showCancelButton: true,
   confirmButtonColor: "#3085d6",
   cancelButtonColor: "#d33",
   cancelButtonText: "NO",
   confirmButtonText: "SI",
 }).then((result) => {
   if (result.isConfirmed) {
     Swal.fire(EliminarPerfil(valor));
   }
 });
}

function EliminarPerfil(valor){
    $.ajax({
      url: "perfil/ElimimarPerfil",
      type:'POST',
      data:{idPerfil:valor},
      dataType:'json',
      success:function(data){
        if(data.respuesta==true){
            Swal.fire(data.mensaje,'Mensaje de Confirmación','success');
            tabla.ajax.reload();
            resetForm();
            
        }else{
             Swal.fire(data.mensaje, "Mensaje de error", "error");
        }
      }
    });

}
function showMessages(message, cssClass, icon) {
  const div = document.createElement("div");
  const span = document.createElement("span");
  span.innerHTML = icon + "<strong>" + " " + message + "</strong> ";
  span.style.fontSize = "15px";
  div.className = `alert text-center alert-${cssClass} mt-2`;
  div.appendChild(span);
  const container = document.querySelector(".main_content_iner");
  const app = document.querySelector(".container-fluid");
  container.insertBefore(div, app);
  setTimeout(function () {
    document.querySelector(".alert").remove();
  }, 2000);
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