
        <div class="main_content_iner ">
            <div class="container-fluid p-0">
                <div class="row justify-content-center">
                    <div class="col-lg-12">
                        <div class="white_card card_height_100 mb_30">
                            <div class="white_card_header">
                                <div class="box_header m-0">
                                    <a href="<?=URL?>categoria/ExportarExcelCategoria" class="btn btn-success btn-sm"> <i class="fas fa-file-excel"></i> Exportar</a>
                                    <button class="btn btn-primary text-light btn-sm" data-bs-toggle="modal"
                                             data-bs-target="#modalAgregar" ><i class="fas fa-plus" ></i> Nuevo</button>
                                </div>
                            </div>
                            <div class="white_card_body">
                                <div class="QA_section">
            
                                    <div class="QA_table mb_30">

                                        <table class="table lms_table_active3 text-center" id="tabla">
                                            <thead>
                                                <tr>
                                                    <th scope="col" >N°</th>
                                                    <th scope="col" >Categoria</th>
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
      <div class="modal-dialog modal-dialog-centered" role="document">
        <div class="modal-content">
          <div class="modal-header ">
            <h5 class="modal-title " id="exampleModalLongTitle">Registro Categoria</h5>
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
            <form  method="POST" id="frmRegistro">
                <input type="hidden" id="idCategoria" name="idCategoria">
                    <div class="mb-3">
                      <label class="form-label" for="exampleInputEmail1"
                        >Categoria</label
                      >
                      <input
                        type="text"
                        class="form-control text-uppercase"
                        name="descripcion"
                        id="descripcion"
                        aria-describedby="emailHelp"
                        placeholder="Ingrese una Categoria"
                      />
                    
                    </div>
                  
                  </form>

            <!----fin del formulario de registro---->
            </p>
          </div>
          <div class="modal-footer">
            <button
              type="button"
              class="btn btn-danger btn-sm"
              data-bs-dismiss="modal"
            >
            <i class="fas fa-window-close"></i> Cancelar
            </button>
            <button type="button" class="btn btn-primary btn-sm" id="btnGuardar"><i class="fas fa-save"></i> Guardar</button>
          </div>
        </div>
      </div>
    </div>

        <script src="<?php URL?>public/js/jquery1-3.4.1.min.js"></script>
        <script src="<?php URL?>views/categoria/js/categoria.js"></script>

       



   