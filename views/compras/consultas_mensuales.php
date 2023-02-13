
<style>
    table{
        white-space: nowrap;
    }

</style>
<div class="main_content_iner ">
            <div class="container-fluid ">
              <form action="<?=URL?>compras/consultas_mensuales" method="post" id="frmBusqueda">
                <div class="row justify-content-center">
                    <div class="col-lg-12">
                        <div class="white_card card_height_100 mb_30">
                            <div class="white_card_header">
                                <div class="box_header m-0 d-block">
                                 <div class="row">
                                    <div class=" col-md-4 col-sm-12 col-12  col-lg-4">
                                      <div class="form-group">
                                        <label for="" class="form-label">Año</label>
                                       <select name="año" id="año" class="form-select form-select-sm rounded-0">
                                       <option value="0">Año</option>
                                            <?php $year = date("Y");
                                                    for ($i=2020; $i<=$year; $i++){
                                                        echo '<option value="'.$i.'">'.$i.'</option>';
                                                    }
                                            ?>
                                       </select>
                                      </div>
                                    </div>
                                    <div class="col-md-4 col-sm-12 col-12 col-lg-4">
                                        <div class="form-group">
                                          <label for=""class="form-label">Mes</label>
                                         <select name="mes" id="mes" class="form-select form-select-sm rounded-0">
                                       <option value="0">Mes</option>
                                          <option value="1">ENERO</option>
                                           <option value="2">FEBRERO</option>
                                            <option value="3">MARZO</option>
                                             <option value="4">ABRIL</option>
                                              <option value="5">MAYO</option>
                                               <option value="6">JUNIO</option>
                                                <option value="7">JULIO</option>
                                                 <option value="8">AGOSTO</option>
                                                  <option value="9">SETIEMBRE</option>
                                                   <option value="10">OCTUBRE</option>
                                                    <option value="11">NOVIEMBRE</option>
                                                     <option value="12">DICIEMBRE</option>
                                       </select>
                                          
                                        </div>
                                    </div>
                                      <div class=" col-md-4 mt-3 col-sm-12 col-12  col-lg-4" >
                                        <div class="form-group">
                                          <button type="submit" class="btn btn-primary rounded-0 btn-sm mt-1" id="btnBuscar" ><i class="fas fa-search" ></i>  BUSCAR</button>
                                        </div>
                                      </div>
                                 </div>
                                                              
                              </div>
                            </div>
                            <div class="white_card_body">
                                <div class="QA_section">
            
                                     <div class="QA_table mb_30" >
                                        <table class="table   lms_table_active ">
                                          <thead  >
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
                                            <?php if(isset($this->obtenerData)) {?>
                                          <?php foreach($this->obtenerData as $key=>$value){ ?>
                                              <tr>
                                                <td><?=$key+1?></td>
                                                <td><?= $value['RUC']?></td>
                                                 <td><?= $value['PROVEEDOR']?></td>
                                                  <td><?= $value['REPRESENTANTE']?></td>
                                                   <td><?= $value['DOCUMENTO']?></td>
                                                    <td><?= $value['FECHA']?></td>
                                                     <td><?= $value['TOTAL']?></td>
                                                       <td>
                                                      <a href="javascript:void()" onclick="detalle_compras('<?=URL?>compras/listar_detalle_compras',<?=$value['CODIGO']?>)" class="text-info fs-5"><i class="fas fa-eye"></i></a>
                                                     </td>
                                              </tr>

                                            <?php }?>
                                            <?php }?>
                                          </tbody>
                                        </table>
                                       
                                </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                </form>
            </div>
        </div>

       
     <div class="modal fade " data-bs-backdrop="static" data-bs-keyboard="false"
          id="modalDetalle"
          tabindex="-1"
          role="dialog"
          aria-labelledby="exampleModalCenterTitle"
          aria-hidden="true"    >
      <div class="modal-dialog  modal-lg" role="document">
        <form action="" method="POST" id="frmRegistro">
        <div class="modal-content">
          <div class="modal-header  text-center ">
            <h5 class="modal-title   text-uppercase  fw-bold" id="exampleModalLongTitle ">Detalle de compras</h5>
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
            <div class="border border-primary mb-3"></div>
                  <div class="container">
                          <div class="row">
                            <div class="col-lg-6 ">
                              <h6 class="text-dark fw-bold text-decoration-underline">PROVEEDOR</h6>
                              <p class="fw-bold text-dark proveedor">Proveedor: 47661166</p>
                               <p class="fw-bold text-dark ruc">Ruc: 47661166</p>
                                <p class="fw-bold text-dark tpc">Tipo Contribuyente: 47661166</p>
                                 <p class="fw-bold text-dark direccion">Dirección: 47661166</p>
                                  <p class="fw-bold text-dark telefono">Teléfono: 47661166</p>
                            </div>
                            <div class="col-lg-6 ">
                              <h6 class="text-dark fw-bold text-decoration-underline mt-1">DOCUMENTO</h6>
                               <p class="fw-bold text-dark serie">Serie: 00099</p>
                                <p class="fw-bold text-dark ncom">N° Comprobante: 47661166</p>
                                 <p class="fw-bold text-dark tpago">T. Pago: 47661166</p>
                                  <p class="fw-bold text-dark fecha">Fecha Compra: 47661166</p>
                            </div>
                          </div>
                  </div>
          

            <div class="border border-primary mt-3"></div>
            <div class="table-responsive mt-4">
                <table class="table table-sm   border-primary">
                  <thead class="bg-primary">
                    <th>CANTIDAD</th>
                     <th>PRODUCTO</th>
                     <th>PRECIO</th>
                     <th>IMPORTE</th>
                  </thead>
                     
                     <tbody id="tdata">
                        
                     </tbody>
              </table >
             
           
            </div>
          </div>
          <div class="modal-footer">
            <button
              type="button"
              class="btn btn-danger btn-sm rounded-0"
              data-bs-dismiss="modal"
              id="cancelar" >
            <i class="fas fa-window-close"></i> Cancelar
            </button>
           
          </div>
          </form>
        </div>
      </div>
    </div>

<script src="<?=URL?>public/js/jquery1-3.4.1.min.js"></script>
<script src="<?=URL?>views/compras/js/consultar_compras.js"></script>