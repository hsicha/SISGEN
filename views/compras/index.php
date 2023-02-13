<style>
    table{
        white-space: nowrap;
    }
.msm{
  height: 30px;

}
</style>
<div class="main_content_iner ">
  <div   id="msm">
    <span id="mensaje"></i></span>
</div>
   <div class="row" id="App">
            <div class="alert alert-sm alert-success rounded-0 d-none" ></div>
        <div class="col-lg-8 col-md-12 col-sm-12 ">
           <div class="input-group input-group-sm mb-3">
         
                    <span class="input-group-text rounded-0 bg-success " id="inputGroup-sizing-sm">Producto</span>
                    <input type="text" class="form-control rounded-0 " autofocus id="buscar">
              
            </div>
           <div class="mt-1" style="background:white">
           <div class="table-responsive table-scrollable">
                <table class="table  table-sm p-0 " id="tblCompras" cellspacing="0">
                    <thead class="">
                    <tr class="">
                        <th>Cant.</th>
                        <th>Producto</th>
                        <th>Costo</th>
                        <th>Importe</th>
                        <th>Eliminar</th>
                    </tr>
                    </thead>
                    <tbody id="tdata">
                    
                    </tbody>
                </table>
            </div>
           </div>
           
              <div class="mt-3 mb-3   d-flex justify-content-center ">
                  <button class="btn btn-primary btn-sm rounded-0" id="btnGuardar"><i class="fas fa-cart-plus"></i> Guardar Compra</button>
              </div>
               
         
        <!---fin de la primera columna---->
        </div>


        <div class="col-lg-4 col-md-12 col-sm-12 ">
        <div class="card rounded-0">
            <div class="card-header bg-success">
                <h1 class="text-center text-light" name="totalPagar" id="totalPagar">S/. 0.00</h1>
            </div>
                <div class="card-body">
                    <form action="" id="frmCompra">
                        <div class="row">
                            <div class="col-lg-6">
                            <label for="" class ="form-label font-weight-bold">DOCUMENTO</label>
                            <select name="comprobante" id="comprobante" class="form-select form-select-sm rounded-0">
                                <option value="">SELECCIONE</option>
                                <option value="BOLETA">BOLETA</option>
                                <option value="FACTURA">FACTURA</option>
                                <option value="PROFORMA">PROFORMA</option>
                            </select>
                               <div class="mt-1">
                                <label for=""class="form-label font-weight-bold">N° SERIE</label>
                                <input type="text" name="nserie" id="nserie" class="form-control form-control-sm rounded-0" >
                               </div>
                            </div>
                            <div class="col-lg-6">
                            <label for="" class= "form-label font-weight-bold">TIPO PAGO</label>
                            <select name="TipoPago" id="TipoPago" class="form-select form-select-sm rounded-0">
                            <option value="">SELECCIONE</option>
                                <option value="CONTADO">CONTADO</option>
                                 <option value="TRANSFERENCIA">TRANSFERENCIA</option>
                                  <option value="YAPE">YAPE</option>
                            </select>
                            <div class="mt-1">
                                <label for=""class="form-label">N° COMPROBANTE</label>
                                <input type="text" name="ncomprobante" id="ncomprobante" class="form-control form-control-sm rounded-0">
                               </div>
                            </div>
                          
                        </div>
                        <div class="mt-1">
                            <label for="" class="form-label">FECHA COMPRA</label>
                            <input type="date" class="form-control form-control-sm rounded-0 " name="fecha" id="fecha" value="<?php echo date('Y-m-d'); ?>" require>
                        </div>
                        <div class="mt-1 border-bottom">
                            <label for="" class="form-label">PROVEEDOR</label>
                            <div class="input-group mb-3">
                                <input type="text" class="form-control form-control-sm rounded-0" name="documento"  placeholder="RUC/DNI"  id="documento" required >
                                <button class="btn btn-primary rounded-0" type="button" id="btnBuscar">Buscar</button>
                            </div>
                            <input type="hidden" name="idProveedor" id="idProveedor">
                            <!----contabildades---->
                            <input type="hidden" name="subtotal" id="base">
                            <input type="hidden" name="igv" id="igv_final">
                            <input type="hidden" name="total" id="total_final">

                        </div>
                       <div class="border"></div>
                      <div class="mt-1">
                        <table width="100%" >
                            <tr>
                                <td>SUB TOTAL</td>
                                <td class="text-center"><h6 id="subtotals">S/. 0.00</h6></td>
                            </tr>
                            <tr>
                                <td>I.G.V(18%)</td>
                                <td class="text-center"><h6 id="igv">S/. 0.00</h6></td>
                            </tr>
                            <tr>
                                <td>TOTAL</td>
                                <td class="text-center"><h6 id="totals">S/. 0.00</h6></td>
                            </tr>
                        </table>
                      </div>
                    </form>
                </div>
               
            </div>
        </div>


   </div>
</div>


<!----modal de proveedores--->
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
                   
                      <div class="col-lg-6 col-md-12-col-sm-12">
                       
                    


                        <div class="mt-1">
                          <label for="" class="form-label fw-bold">TIPO DE CONTRIBUYENTE</label>
                          <select name="tipocontribuyente" id="tipocontribuyente" class="form-select form-select-sm rounded-0" required>
                          <option value="">SELECCIONE</option>
                          
                          </select>
                        </div>
                        <div class="mt-1">
                          <label for="" class="form-label fw-bold">TIPO DOCUMENTO</label>
                          <select name="tipodocumento" id="tipodocumento" class="form-select form-select-sm rounded-0" required>
                          <option value="">SELECCIONE</option>
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
   
<!----fin del modal de proveedor----->


<script src="<?php URL?>public/js/jquery1-3.4.1.min.js"></script>
<script src="<?php URL?>views/compras/js/compras.js"></script>
