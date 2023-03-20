<div class="main_content_iner ">
            <div class="container-fluid p-0">
                <div class="row justify-content-center">
                    <div class="col-lg-12">
                        <div class="white_card card_height_100 mb_30">
                            <div class="white_card_header">
                                <div class="box_header m-0">
                                   
                                      <button class="btn btn-primary text-light btn-sm ms-auto" data-bs-toggle="modal"
                                             data-bs-target="#modalAgregar" id="nuevo" ><i class="fas fa-user-plus"></i>&nbsp Agregar Usuario</button>
                                </div>
                            </div>
                            <div class="white_card_body">
                                <div class="QA_section">
            
                                    <div class="QA_table mb_30" >
                                        <table class="table lms_table_active" id="tabla">
                                          <thead>
                                            <tr>
                                              <th scope="col">N°</th>
                                              <th scope="col">USUARIO</th>
                                              <th scope="col">NOMBRES</th>
                                              <th scope="col">PERFIL</th>
                                              <th scope="col">ESTADO</th>
                                              <th scope="col">ELIMINAR</th>
                                            </tr>
                                          </thead>
                                          <tbody id="producto">
                                        
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

       
     <div class="modal fade " data-bs-backdrop="static" data-bs-keyboard="false"
          id="modalAgregar"
          tabindex="-1"
          role="dialog"
          aria-labelledby="exampleModalCenterTitle"
          aria-hidden="true"    >
      <div class="modal-dialog  modal-lg" role="document">
        <form action="" method="POST" id="frmRegistro">
        <div class="modal-content">
          <div class="modal-header ">
            <h5 class="modal-title " id="exampleModalLongTitle text-uppercase  fw-bold">REGISTRO DE USUARIOS</h5>
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
           
                <input type="hidden" id="idUsuario" name="idUsuario">
                    <div class="mb-3">
                    
                    
                        <div class="mt-1">
                          <label for="" class="form-label fw-bold">PERFIL</label>
                          <select name="perfil" id="perfil" class="form-select form-select-sm rounded-0" required>
                          <option value="">SELECCIONE</option>
                          </select>
                        </div>
                      
                        <div class="mt-1">
                          <label for="" class="form-label fw-bold">DNI</label>
                          <input type="text" class="form-control form-control-sm rounded-0 text-uppercase" name="dni" id="dni" required onkeypress="return valideKey(event);">
                        </div>
                        <div class="mt-1">
                          <label for="" class="form-label fw-bold">NOMBRES</label>
                          <input type="text" class="form-control form-control-sm rounded-0 text-upper text-uppercase" name="nombre" id="nombre" required>
                        </div>
                        <div class="mt-1">
                          <label for="" class="form-label fw-bold">APELLIDOS</label>
                          <input type="text" class="form-control form-control-sm rounded-0  text-uppercase" name="apellido" id="apellido"  required>
                        </div>
                        <div class="mt-1">
                          <label for="" class="form-label fw-bold">CONTRASEÑA</label>
                          <input type="password" class="form-control form-control-sm rounded-0 text-uppercase" name="contra"  id="contra" required>
                        </div>
                        <div class="mt-1">
                          <label for="" class="form-label fw-bold">CONFIRMAR CONTRASEÑA</label>
                          <input type="password" class="form-control form-control-sm rounded-0" name="conf_contra"  id="conf_contra" required >
                        </div>
                    
            <!----fin del formulario de registro---->
            </p>
          </div>
          <div class="modal-footer">
            <button
              type="button"
              class="btn btn-danger btn-sm rounded-0"
              data-bs-dismiss="modal"
              id="cancelar" >
            <i class="fas fa-window-close"></i> Cancelar
            </button>
            <button type="submit" class="btn btn-primary btn-sm rounded-0" id="btnGuardar"><i class="fas fa-save"></i> Guardar</button>
          </div>
          </form>
        </div>
      </div>
    </div>

   

        <script src="<?=URL?>public/js/jquery1-3.4.1.min.js"></script>
        <script src="<?=URL?>views/usuario/js/usuario.js"></script>

       