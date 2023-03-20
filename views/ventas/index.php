
  <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <!-- Main content -->
    <section class="content">
<form action="">
      <!-- Default box -->
      <div class="card">
        <div class="card-header">
        <label for="" class="form-label text-center">Producto</label>
        <input type="text" class="form-control form-control-sm rounded-0" placeholder="Ingrese Producto a buscar">
        </div>
        <div class="card-body">
        <div class="table-responsive">
         <table class="table table-bordered table-hover table-sm " id="tblRegistros"> 
          <thead class=bg-danger>
            <tr >
              <th>CANT.</th>
              <th>PROD.</th>
              <th>PRECIO</th>
              <th>IMPORTE</th>
              <th>ELIMINAR</th>
            </tr>
          </thead>
         </table>
         </div >
         <div class="container d-flex justify-content-center">
              <button class="btn btn-info btn-sm rounded-0"> <i class="fas fa-shopping-cart"></i> EMITIR COMPROBANTE</button>
         </div>
          
        </div>
        
        <!-- /.card-body -->
       
        <!-- /.card-footer-->
      </div>
      <!-- /.card -->
    <!---card de cabecera del documento---->
    <div class="card rounded-0">
         <div class="card-header bg-success rounded-0">
          <h4 class="text-center fs-5">Tota a Pagar: S/.00</h4>
         </div>

        <div class="card-body rounded-0">
         <div class="row">
            <div class="col-lg-6">
                <div class="form-group">
                  <select class="form-control select2 form-control-sm rounded-0" style="width: 100%;">
                    <option selected="selected">DOCUMENTO</option>
                    <option>BOLETA</option>
                    <option>FACTURA</option>
                    <option>PROFORMA</option>
                  </select>
                </div>
                 <div class="form-group">
                  <input type="text" class="form-control form-control-sm rounded-0 " placeholder="N° SERIE" >
                </div>
               
            </div>
            <div class="col-lg-6">
                 <div class="form-group">
                  <select class="form-control select2 form-control-sm rounded-0" style="width: 100%;">
                    <option selected="selected">F. PAGO</option>
                    <option>EECTIVO</option>
                     <option>CREDITO</option>
                    <option>TARJETA</option>
                    <option>YAPE</option>
                     <option>PLIN</option>
                  </select>
                </div>
                 <div class="form-group">
                  <input type="text" class="form-control form-control-sm rounded-0" placeholder="N° Venta">
                </div>
                
            </div>
            
              
         </div>
         
                 <div class="input-group">
                    <input type="text" class="form-control form-control-sm rounded-0" placeholder="Ingrese datos del cliente" aria-label="Recipient's username" aria-describedby="button-addon2">
                    <div class="input-group-append">
                        <button class="btn btn-primary rounded-0 btn-sm" type="button" id="button-addon2"><i class="fas fa-search"></i></button>
                    </div>
                </div>

                  <div class="form-group mt-2">
                    <select class="form-control select2 form-control-sm rounded-0" style="width: 100%;">
                        <option selected="selected">VENDEDOR</option>
                        <option>HERNAN SICHA ROMANI</option>
                        <option>JENRY ROMERO MONTALVAN</option>
                        <option>PEDRO VILLAVICENCIO</option>
                        <option>OSCAR HILARIO JAUREGUI</option>
                    </select>
                </div>
                <div class="row">
                    <div class="col-lg-6">
                        <label for=""> SUB TOTAL</label><br>
                        <label for=""> I.G.V(18%)</label><br>
                        <label for=""> TOTAL</label>
                    </div>
                    <div class="col-lg-6">
                         <label for=""> S/ 0.00</label><br>
                        <label for=""> S/ 0.00</label><br>
                        <label for=""> S/ 0.00<label>
                    </div>
                </div>
        </div>
         
    </div>
    </form>
    </section>
    <!-- /.content -->
  </div>
  <!-- /.content-wrapper -->

     <!-- /.modal -->


 