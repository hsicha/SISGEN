
        <div class="main_content_iner ">
            <div class="container-fluid p-0">
                <div class="row justify-content-center">
                    <div class="col-lg-12">
                        <div class="white_card card_height_100 mb_30">
                            <div class="white_card_header">
                                <div class="box_header m-0">
                                    <a href="<?=URL?>producto/ExportarExcelProducto" class="btn btn-success btn-sm"> <i class="fas fa-file-excel"></i> Exportar</a>
                                    <button class="btn btn-primary text-light btn-sm" data-bs-toggle="modal"
                                             data-bs-target="#modalAgregar" id="nuevo" ><i class="fas fa-plus" ></i> Nuevo</button>
                                </div>
                            </div>
                            <div class="white_card_body">
                                <div class="QA_section">
            
                                    <div class="QA_table mb_30" >
                                        <table class="table lms_table_active" id="tabla">
                                          <thead>
                                            <tr>
                                              <th scope="col">N°</th>
                                              <th scope="col">CODIGO</th>
                                              <th scope="col">PRODUCTO</th>
                                              <th scope="col">MARCA</th>
                                              <th scope="col">S. MINIMO</th>
                                              <th scope="col">STOCK</th>
                                              <th scope="col">P.MAYOR</th>
                                              <th scope="col">P.MENOR</th>
                                              <th scope="col">CATEGORIA</th>
                                              <th scope="col">OPCIONES</th>
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
            <h5 class="modal-title " id="exampleModalLongTitle text-uppercase  fw-bold">Registro productos</h5>
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
           
                <input type="hidden" id="idProducto" name="idProducto">
                    <div class="mb-3">
                     <div class="row">
                      <div class="col-lg-6 col-md-12-col-sm-12">
                        <div>
                          <label for="" class="form-label fw-bold">MONEDA</label>
                          <select name="moneda" id="moneda" class="form-select form-select-sm rounded-0" required>
                          <option value=""> SELECCIONE MONEDA</option>
                            <option value="S/.">SOLES</option>
                            <option value="$/.">DOLARES</option>
                          </select>
                        </div>
                        <div class="mt-1">
                          <label for="" class="form-label fw-bold">CATEGORIA</label>
                          <select name="categoria" id="categoria" class="form-select form-select-sm rounded-0" required>
                          <option value=""> SELECCIONE MARCA</option>
                          <?php  foreach($this->getCategoria as $value){?>
                          <option value="<?=$value[0]?>"> <?=$value[1]?> </option>
                           <?php }?>
                          </select>
                        </div>
                        <div class="mt-1">
                          <label for="" class="form-label fw-bold">CODIGO</label>
                          <input type="text" class="form-control form-control-sm rounded-0 text-uppercase" name="codigo" id="codigo" required>
                        </div>
                        <div class="mt-1">
                          <label for="" class="form-label fw-bold">DESRIPCION</label>
                          <input type="text" class="form-control form-control-sm rounded-0 text-upper text-uppercase" name="descripcion" id="descripcion" required>
                        </div>
                        <div class="mt-1">
                          <label for="" class="form-label fw-bold">MARCA</label>
                          <select name="marca" id="marca" class="form-select form-select-sm rounded-0" required>
                          <option value=""> SELECCIONE MARCA</option>
                           <?php foreach($this->getMarca as $value) {?>
                          <option value="<?= $value[0]?>"><?=$value[1]?></option>
                            <?php }?>
                          </select>
                        </div>
                        <div class="mt-1">
                          <label for="" class=" form-label fw-bold">STOCK MINIMO</label>
                          <input type="number"  class="form-control form-control-sm rounded-0 " value="10"  name="stkminimo" id="stkminimo">    
                        </div>
                      </div>
                      <div class="col-lg-6 col-md-12-col-sm-12 fw-bold">
                      <div>
                          <label for="" class="form-label fw-bold">PRESENTACION</label>
                          <select name="presentacion" id="presentacion" class="form-select form-select-sm rounded-0" required>
                          <option value=""> SELECCIONE PRESENTACION</option>
                          <?php foreach($this->getPresentacion as $value) {?>
                          <option value="<?=$value[0]?>"><?=$value[1]?></option>
                           
                            <?php }?>
                          </select>
                        </div>
                        <div class="mt-1">
                          <label for="" class="form-label fw-bold">UNIDAD MEDIDA</label>
                          <select name="umedida" id="umedida" class="form-select form-select-sm rounded-0" required>
                          <option value="">SELECCIONE U. MEDIDA</option>
                            <option value="NIU">UNIDAD</option>
                            <option value="BX">CAJA</option>
                            <option value="DZN">DOCENA</option>
                            <option value="KGM">KILO</option>
                            <option value="SET">SET</option>
                            <option value="LTR">LITRO</option>
                            <option value="RO">ROLLO</option>
                          </select>
                        </div>
                        <div class="mt-1">
                          <label for="" class="form-label fw-bold">STOCK</label>
                          <input type="number" class="form-control form-control-sm rounded-0" name="stock" id="stock" value="0" required>
                        </div>
                        <div class="mt-1">
                          <label for="" class="form-label fw-bold">PRECIO POR MAYOR</label>
                          <input type="number" class="form-control form-control-sm rounded-0" name="preciomayor" value="0" id="preciomayor" required>
                        </div>
                        <div class="mt-1">
                          <label for="" class="form-label fw-bold">PRECIO POR MENOR</label>
                          <input type="number" class="form-control form-control-sm rounded-0" name="preciomenor" value="0" id="preciomenor" required>
                        </div>
                        <div class="mt-1">
                          <label for="" class="form-label fw-bold">PRECIO DE COMPRA</label>
                          <input type="number" class="form-control form-control-sm rounded-0  " value="0" name="preciocompra" id="preciocompra" required>
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
              class="btn btn-danger btn-sm"
              data-bs-dismiss="modal"
              id="cancelar" >
            <i class="fas fa-window-close"></i> Cancelar
            </button>
            <button type="submit" class="btn btn-primary btn-sm" id="btnGuardar"><i class="fas fa-save"></i> Guardar</button>
          </div>
          </form>
        </div>
      </div>
    </div>

   

        <script src="<?php URL?>public/js/jquery1-3.4.1.min.js"></script>
        <script src="<?php URL?>views/producto/js/producto.js"></script>

       



   