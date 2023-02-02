<?php
class Compras extends Controller{
  private  $hoy;
 private $idC;
    function __construct(){
        parent::__construct();
    }
   
    function index(){
        $hoy=date("d/d/y");
        $this->view->hoy=$hoy;
        $this->view->title='Compras';
        $this->view->renderAdmin('compras/index');

    }
   
    function autocompleteP(){
      
        $descripcion = filter_input(INPUT_GET, trim('term'), FILTER_SANITIZE_STRING);
       $data=$this->model->obtenerProdAutocomplete($descripcion);
        echo json_encode( $data,JSON_UNESCAPED_UNICODE);
    }
    function autocompletePrv(){
      
      $descripcion = filter_input(INPUT_GET, trim('term'), FILTER_SANITIZE_STRING);
     $data=$this->model->autocomplte_proveedor($descripcion);
      echo json_encode( $data,JSON_UNESCAPED_UNICODE);
  }

    function cargarTipoCon(){
      $getTipoCon=$this->model->caragar_tipoCont();
      echo json_encode($getTipoCon,JSON_UNESCAPED_UNICODE);
    }
    function cargarTipoDoc(){
      $getTipoDoc=$this->model->cargar_tipo_doc_cont();
      echo json_encode($getTipoDoc,JSON_UNESCAPED_UNICODE);
    }
    function obtenerIdcompras(){
       $obtenerId=$this->model->obtener_Id();
          foreach($obtenerId as $value){
              $idCompras=$value[0]+1;
               $idC=$idCompras;
          }
    }

    function Registrar(){
          $obtenerId=$this->model->obtener_Id();
          foreach($obtenerId as $value){
              $idCompras=$value[0]+1;
              $this->idC=$idCompras;
          }
        
      if(isset($_POST['idProveedor'])&& isset($_POST['comprobante']) && isset($_POST['ncomprobante'])){
        $mensajeOK=false;
        $mensajeError="";
        $mensaje=false;
        $serie =trim($_POST['nserie']);
        $uppercase=strtoupper($serie);
        
        $compra=array
        (
          'CODIGO_COMPRAS'=>$idCompras,//
          'CODIGO_PROVEEDOR'=>$_POST['idProveedor'],
          'TIPO_DOCUMENTO'=>trim($_POST['comprobante']),
          'SERIE'=>$uppercase,
          'NRO_COMPROBANTE'=>trim($_POST['ncomprobante']),
          'TIPO_PAGO'=>trim($_POST['TipoPago']),
          'FECHA_COMPRA'=>trim($_POST['fecha']),
          'TOTAL'=>$_POST['total'],
          'OBSERVATION'=>'',
          'MONEY'=>'S/.',
          'OBSERVACION1'=>''

        );

        $mensaje=$this->model->RegistrarCompras($compra);
       
          if ($mensaje == true) {
              $mensajeOk = true;
              $mensajeError = "Compra registrada correctamente";
          }else
           {
           $mensajeError = 'Numeracion repetida por favor intente de nuevo!';         
          }
           $salidaJson = array('respuesta' => $mensajeOk, 'mensaje' => $mensajeError, "IDC"=>$idCompras);
            echo json_encode($salidaJson);
      }else{
        header("Location".URL."compras");
      }
      
    }

   function Registrar_Detalle(){
    
        
         $miarray=array("PRODUCTO"=>$_POST['arrayProd']);

         $last_id_bef=$this->model->last_id();
         $last_id = intval($last_id_bef);

        //echo "<pre class='bg-succes'>"; echo print_r($last_id); echo "</pre>";

         foreach($miarray as $value){

          $datastock_id=array('CODIGO'=>$value[0]);
          $stock_producto=$this->model->devolver_stock_producto($datastock_id);
          $sobra_cant=$stock_producto[0]+$value[2];

          $detalle=array('CODIGO_COMPRAS'=>$last_id,
          'CODIGO_PRODUCTO'=>$value[0],
          'CANTIDAD'=>$value[2],
          'PRECIO'=>$value[1],
          'IGV'=>$value[3]/1.18*(18/100),
          'SUBTOTAL'=>$value[3],
          'STOCK_SOBRANTE'=>$sobra_cant
        ); 
       }
        $this->model->registrar_detalle($detalle);
        
        
      }
     
}








?>