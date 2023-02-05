<div class="main_content_iner ">
            <div class="container-fluid p-0">
                <div class="row justify-content-center">
                    <div class="col-lg-12">
                        <div class="white_card card_height_100 mb_30">
                            <div class="white_card_header">
                                <div class="box_header m-0">
                                    <a href="<?=URL?>proveedor/ExportarExcelProveedor" class="btn btn-success btn-sm rounded-0"> <i class="fas fa-file-excel"></i> Exportar</a>
                                   <a href="<?=URL?>compras" class="btn btn-primary btn-sm rounded-0"><i class="fas fa-plus" ></i> Nueva Compra</a>
                                  
                                </div>
                            </div>
                            <div class="white_card_body">
                                <div class="QA_section">
            
                                     <div class="QA_table mb_30" >
                                        <table class="table lms_table_active">
                                          <thead>
                                            <tr>
                                              <th scope="col">N°</th>
                                              <th scope="col">DNI/RUC</th>
                                              <th scope="col">PROVEEDOR</th>
                                              <th scope="col">REPRESENTANTE</th>
                                              <th scope="col">DOCUMENTO</th>
                                              <th scope="col">FECHA COMPRA</th>
                                              <th scope="col">TOTAL</th>
                                              <th scope="col">DETALLE</th>
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
            <h5 class="modal-title " id="exampleModalLongTitle text-uppercase  fw-bold">Registro Provedor</h5>
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
           
                <input type="hidden" id="idProveedor" name="idProveedor">
                    <div class="mb-3">
                     <div class="row">
                     <div class="input-group mb-3">
                        <input type="text" class="form-control form-control-sm rounded-0" placeholder="RUC/DNI"  id="documento"  onkeypress="return valideKey(event);" >
                        <button class="btn btn-primary rounded-0" type="button" id="btnBuscar">Buscar</button>
                    </div>
                      <div class="col-lg-6 col-md-12-col-sm-12">
                       
                    


                        <div class="mt-1">
                          <label for="" class="form-label fw-bold">TIPO DE CONTRIBUYENTE</label>
                          <select name="tipocontribuyente" id="tipocontribuyente" class="form-select form-select-sm rounded-0" required>
                          <option value="">SELECCIONE</option>
                          <?php  foreach($this->getTipoContr as $value){?>
                          <option value="<?=$value[0]?>"> <?=$value[1]?> </option>
                           <?php }?>
                          </select>
                        </div>
                        <div class="mt-1">
                          <label for="" class="form-label fw-bold">TIPO DOCUMENTO</label>
                          <select name="tipodocumento" id="tipodocumento" class="form-select form-select-sm rounded-0" required>
                          <option value="">SELECCIONE</option>
                          <?php  foreach($this->getTipoDoc as $value){?>
                          <option value="<?=$value[0]?>"> <?=$value[1]?> </option>
                           <?php }?>
                          </select>
                        </div>
                        <div class="mt-1">
                          <label for="" class="form-label fw-bold">RUC/DNI</label>
                          <input type="text" class="form-control form-control-sm rounded-0 text-uppercase" name="rucdni" id="rucdni" required>
                        </div>
                        <div class="mt-1">
                          <label for="" class="form-label fw-bold">RAZON SOCIAL</label>
                          <input type="text" class="form-control form-control-sm rounded-0 text-upper text-uppercase" name="razonsocial" id="razonsocial" required>
                        </div>
                      
                       
                      </div>
                      <div class="col-lg-6 col-md-12-col-sm-12 fw-bold">
                     
                       
                        <div class="mt-1">
                          <label for="" class="form-label fw-bold">REPRESENTANTE</label>
                          <input type="text" class="form-control form-control-sm rounded-0  text-uppercase" name="representante" id="representante"  required>
                        </div>
                        <div class="mt-1">
                          <label for="" class="form-label fw-bold">DIRECCION</label>
                          <input type="text" class="form-control form-control-sm rounded-0 text-uppercase" name="direccion"  id="direccion" required>
                        </div>
                        <div class="mt-1">
                          <label for="" class="form-label fw-bold">TELEFONO</label>
                          <input type="text" class="form-control form-control-sm rounded-0" name="telefono" value="0" id="telefono" required onkeypress="return valideKey(event);">
                        </div>
                        <div class="mt-1">
                          <label for="" class="form-label fw-bold">EMAIL</label>
                          <input type="text" class="form-control form-control-sm rounded-0   text-uppercase"  name="email" id="email" required>
                        </div>
                      </div>
                     </div>
                    
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
<script src="<?=URL?>views/compras/js/compras.js"></script>