
  <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
    <!-- Content Header (Page header) -->
   

    <!-- Main content -->
    <section class="content">

      <!-- Default box -->
      <div class="card">
        <div class="card-header">
        <a href="<?=URL?>marca/ExportarExcelMarca" class="btn btn-success btn-sm rounded-0"> <i class="fas fa-file-excel"></i>  Exportar</a>

          <div class="card-tools">
          <button type="button" class="btn btn-primary btn-sm rounded-0" data-toggle="modal" data-target="#modalAgregar">
          <i class="fas fa-plus"></i> Agregar
                </button>
          <!--  <button type="button" class="btn btn-tool" data-card-widget="remove" title="Remove">
              <i class="fas fa-times"></i>
            </button>
            --->
          </div>
        </div>
        <div class="card-body">
         <table class="table table-bordered table-hover table-sm " id="tblRegistros"> 
          <thead class=bg-danger>
            <tr>
              <th>N°</th>
              <th>Marca</th>
              <th>Opciones</th>
            </tr>
          </thead>
         </table>
        </div>
        <!-- /.card-body -->
       
        <!-- /.card-footer-->
      </div>
      <!-- /.card -->

    </section>
    <!-- /.content -->
  </div>
  <!-- /.content-wrapper -->

  <div class="modal fade" id="modalAgregar">
        <div class="modal-dialog">
          <div class="modal-content">
            <div class="modal-header">
              <h4 class="modal-title">Marca</h4>
              <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                <span aria-hidden="true">&times;</span>
              </button>
            </div>
            <div class="modal-body">
              
              <form  method="POST" id="frmRegistro">
                <input type="hidden" id="idMarca" name="idMarca">
                    <div class="mb-3">
                      <label class="form-label" for="exampleInputEmail1"
                        >Marca</label
                      >
                      <input
                        type="text"
                        class="form-control"
                        name="descripcion"
                        id="descripcion"
                        aria-describedby="emailHelp"
                        placeholder="Ingrese una Marca"
                      />
                    
                    </div>
                  
                  </form>
              




            </div>
            <div class="modal-footer justify-content-between">
              <button type="button" class="btn btn-danger btn-sm rounded-0" data-dismiss="modal"><i class="fas fa-times"></i> Cerrar</button>
              <button type="button" class="btn btn-primary btn-sm rounded-0" id="btnGuardar"><i class="fas fa-save"></i> Guardar</button>
            </div>
          </div>
          <!-- /.modal-content -->
        </div>
        <!-- /.modal-dialog -->
      </div>
      <!-- /.modal -->

     
       
  <script src="<?=URL?>public/plugins/jquery/jquery.min.js"></script>
        <script src="<?=URL?>views/marca/js/marca.js"></script>
