  <style>
        
        </style>
        
        
        <div class="main_content_iner ">
            <div class="container-fluid p-0">
                <div class="row justify-content-center">
                    <div class="col-lg-12">
                        <div class="white_card card_height_100 mb_30">
                            <div class="white_card_header">
                                <div class="box_header m-0">
                                  <button class="btn btn-primary text-light btn-sm ms-auto" data-bs-toggle="modal"
                                             data-bs-target="#modalAgregar" id="nuevo" ><i class="fas fa-user-plus"></i>&nbsp Nuevo Perfil</button>
                                </div>
                            </div>
                            <div class="white_card_body">
                                <div class="QA_section">
            
                                    <div class="QA_table mb_30">

                                        <table class="table lms_table_active " id="tabla">
                                            <thead class="fw-bold">
                                                <tr>
                                                    <th scope="col" >N°</th>
                                                    <th scope="col" >PERFIL</th>
                                                    <th scope="col" >Opciones</th>
                                                </tr>
                                            </thead>
                                            <tbody >
                                               
                                           
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <div
      class="modal fade"
      id="modalAgregar"
      tabindex="-1"
      role="dialog"
      aria-labelledby="exampleModalCenterTitle"
      aria-hidden="true"
    >
     <form  method="POST" id="frmRegistro">
      <div class="modal-dialog modal-dialog-centered" role="document">
        <div class="modal-content">
          <div class="modal-header">
            <h5 class="modal-title  fw-bold" id="exampleModalLongTitle">Registro de Perfiles</h5>
            <button
              type="button"
              class="close"
              data-bs-dismiss="modal"
              aria-label="Close"
            >
              <span aria-hidden="true">&times;</span>
            </button>
          </div>
          <div class="modal-body">
            <p>
            <!----aca va el formulario de registro---->
           
                <input type="hidden" id="idPerfil" name="idPerfil">
                    <div class="mb-3 fw-bold">
                      <label class="form-label" for="exampleInputEmail1"
                        >Perfil</label
                      >
                      <input
                        type="text" 
                        class="form-control form-control-sm rounded-0 text-uppercase"
                        name="descripcion"
                        id="descripcion"
                        aria-describedby="emailHelp"
                        placeholder="Ingrese un perfil"
                        required
                      />
                    
                    </div>
                  
                 

            <!----fin del formulario de registro---->
            </p>
          </div>
          <div class="modal-footer">
            <button
              type="button"
              class="btn btn-danger btn-sm rounded-0"
              data-bs-dismiss="modal"
              id="cancelar"
            >
            <i class="fas fa-window-close"></i> Cancelar
            </button>
            <button type="submit" class="btn btn-primary btn-sm rounded-0" id="btnGuardar"><i class="fas fa-save"></i> Guardar</button>
          </div>
        </div>
      </div>
       </form>
    </div>

        <script src="<?php URL?>public/js/jquery1-3.4.1.min.js"></script>
        <script src="<?php URL?>views/perfil/js/perfil.js"></script>

       



   