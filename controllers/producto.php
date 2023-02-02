<?php
require 'vendor/autoload.php';

use PhpOffice\PhpSpreadsheet\Spreadsheet;
use PhpOffice\PhpSpreadsheet\Writer\Xlsx;



class Producto extends Controller{

function __construct(){
    parent::__construct();
}
function index(){
    $this->view->title="Producto";
    $this->view->getData=$this->model->listarProductos();
    $this->view->getCategoria=$this->model->CargarCategoria();
    $this->view->getMarca=$this->model->CargarMarca();
    $this->view->getPresentacion=$this->model->CargarPresentacion();
    $this->view->renderAdmin('producto/index');
   
}
 function obtenerData(){
  if(isset($_POST['idProducto'])){
    $id=$_POST['idProducto'];
     $getData=$this->model->obtener_Data_Id($id);
     echo json_encode($getData);
  }
  
 
  
}
function listarCategory(){
  
  $getCategoria=$this->model->CargarCategoria();
  echo json_encode($getCategoria);
}
function refresh(){
 
    $obtenerdata=$this->model->listarProductosAll();
    print $obtenerdata;

}
function obtenerCategoria(){

 $getDatcategoria=$this->model->CargarCategoria();
 
}
function Registrar()
{

  $obtenerId=$this->model->obtenerId();
  foreach($obtenerId as $value){
    $idProducto= $value[0]+1;
    
  }
   if(isset($_POST['idProducto'])&& empty($_POST['idProducto'])){
    $estadoMensaje=false;
     $moneda=$_POST['moneda'];
     $categoria=$_POST['categoria'];
     $codigo=$_POST['codigo'];
     $descripcion=$_POST['descripcion'];
     $marca=$_POST['marca'];
     $stockMin=$_POST['stkminimo'];
     $presetacion=$_POST['presentacion'];
     $umedida=$_POST['umedida'];
     $stock=$_POST['stock'];
     $preMay=$_POST['preciomayor'];
     $preMen=$_POST['preciomenor'];
     $porecioComp=$_POST['preciocompra'];
     $data=array
              ('CODIGO_PRODUCTO'=>$idProducto,
              'CODIGO_CATEGORIA'=>$categoria,
              'CODIGO_PRESENTACION'=>$presetacion,
              'CODIGO_MARCA'=>$marca,
              'CODIGO_BARRA'=>$codigo,
              'DESCRIPCION'=>trim(strtoupper($descripcion)),
              'UNIDAD_MEDIDA'=>$umedida,
              'STOCK_MINIMO'=>$stockMin,
              'STOCK'=>$stock,
              'PRECIO_COMPRA'=>$preMay,
              'PRECIO'=>$preMen,
              'PRECIO_COSTO'=>$porecioComp,
              'ESTADO'=>'ACTIVO',
              'PROCEDENCIA'=>0,
              'CODIGO_ALMACEN'=>0,
              'ZONA_FRANCA'=>'',
              'MONEY'=>$moneda,
              'TIPO_CAMBIO'=>0,
              'CODIGO_EXPORTACION'=>'',
              'TALLA'=>0,
              'CODIGO_REFERENCIA'=>''
            );
            $mensaje=$this->model->InsertarProductos($data);
            if($mensaje=="Producto Registrado"){

              $estadoMensaje=true;
              $mensajeSalida=$mensaje;
            
            }else{
              $mensajeSalida=$mensaje;
            
            }
          $msmJson=array('respuesta'=>$estadoMensaje,'mensaje'=>$mensajeSalida);
          echo json_encode($msmJson);

   }else{
    header('location'.URL.'producto');
   }


}
  
function Actualizar()
{


  
  if(isset($_POST['idProducto'])&& !empty($_POST['idProducto'])){
    $mensaje_OK=false;
    $idProducto=$_POST['idProducto'];
   $moneda=$_POST['moneda'];
   $categoria=$_POST['categoria'];
   $codigo=$_POST['codigo'];
   $descripcion=$_POST['descripcion'];
   $marca=$_POST['marca'];
   $stockMin=$_POST['stkminimo'];
   $presetacion=$_POST['presentacion'];
   $umedida=$_POST['umedida'];
   $stock=$_POST['stock'];
   $preMay=$_POST['preciomayor'];
   $preMen=$_POST['preciomenor'];
   $porecioComp=$_POST['preciocompra'];
  $data=array
   ('CODIGO_PRODUCTO'=>$idProducto,
   'CODIGO_CATEGORIA'=>$categoria,
   'CODIGO_PRESENTACION'=>$presetacion,
   'CODIGO_MARCA'=>$marca,
   'CODIGO_BARRA'=>$codigo,
   'DESCRIPCION'=>trim(strtoupper($descripcion)),
   'UNIDAD_MEDIDA'=>$umedida,
   'STOCK_MINIMO'=>$stockMin,
   'STOCK'=>$stock,
   'PRECIO_COMPRA'=>$preMay,
   'PRECIO'=>$preMen,
   'PRECIO_COSTO'=>$porecioComp,
   'ESTADO'=>'ACTIVO',
   'PROCEDENCIA'=>0,
   'CODIGO_ALMACEN'=>0,
   'ZONA_FRANCA'=>'',
   'MONEY'=>$moneda,
   'TIPO_CAMBIO'=>0,
   'CODIGO_EXPORTACION'=>'',
   'TALLA'=>0,
   'CODIGO_REFERENCIA'=>''
 );
     $mensaje=$this->model->ActualzarProductos($data);
    if($mensaje=="Producto Actualizado"){
        $mensaje_OK=true;
        $mensajeRespuesta=$mensaje;
    }else{
        $mensajeRespuesta=$mensaje;
    }

    $mensajeJson=array('respuesta'=>$mensaje_OK,'mensaje'=>$mensajeRespuesta);
    echo json_encode($mensajeJson);

}else{
   header("Location" .URL. "producto");
}
 

}
function Eliminar(){
  if(isset($_POST['idProducto'])){
    $mensaje_OK=false;
    $idProducto=$_POST['idProducto'];
    $mensaje=$this->model->eliminarProducto($idProducto);
    if($mensaje=="Registro Eliminado"){
      $mensaje_OK=true;
      $mensajeRespuesta=$mensaje;
    }else{
      $mensajeRespuesta=$mensaje;
    }
    $mensajeJson=array("respuesta"=>$mensaje_OK,"mensaje"=>$mensajeRespuesta);
    echo json_encode($mensajeJson);
  }
}
public function ExportarExcelProducto(){
  //propiedades del documento excel
  $documento = new Spreadsheet();
  $documento
  ->getProperties()
  ->setCreator("SICHA")
  ->setLastModifiedBy('SICHA') // última vez modificado por
  ->setTitle('Archivo creado con php y mysql')
  ->setSubject('excel con php y mysql')
  ->setDescription('Este documento fue generado pos la empresa  SICHA')
  ->setKeywords('Lista de Productos')
  ->setCategory('Productos');

  // contenido del document excel
  $hoja = $documento->getActiveSheet();

  $titulo="LISTADO DE PRODUCTOS";
  $styleCenter=array
  (
      'alignment'=>array(
      'horizontal'=>\PhpOffice\PhpSpreadsheet\Style\Alignment::HORIZONTAL_CENTER,
      'vertical'=>\PhpOffice\PhpSpreadsheet\Style\Alignment::VERTICAL_CENTER,
      ),
  );

  $hoja->mergeCells('A1:L1');
  $hoja->setCellValue('A1',$titulo);
  $hoja->getStyle('A1')->getFont()->setBold(true);
  $hoja->getStyle('A1')->getAlignment()->setHorizontal(\PhpOffice\PhpSpreadsheet\Style\Alignment::HORIZONTAL_CENTER);

  $columnas=array('A','B','C','D','E','F','G','H','I','J','K','L','M');
  $encabezado=array('N°','CODIGO','PRODUCTO','MARCA','CATEGORIA','STOCK MINIMO','STOCK','PRECIO POR MAYOR','PRECIO POR MENOR','PRECIO DE COMPRA','UNIDAD MEDIDA','MONEDA');
  for($i=3; $i<4;$i++){
      for($j=0;$j<count($encabezado);$j++){
          $hoja->setCellValue($columnas[$j].$i,$encabezado[$j]);
          $hoja->getStyle($columnas[$j].$i)->getFont()->setBold(true);
      }
  }
  $estiloEncabezado =array('borders'=>array('bottom'=>array('style'=>\PhpOffice\PhpSpreadsheet\Style\Border::BORDER_THIN,'color'=>array('argb'=>'050505'))));
  $hoja->getStyle('A1:L1')->applyFromArray($estiloEncabezado);

  $ancho=array(10,20,73,30,30,30,30,30,30,30,30,30);
  for($i=0;$i<1;$i++){
      for($j=0;$j<count($ancho);$j++){
          $hoja->getColumnDimension($columnas[$j])->setWidth($ancho[$j]);
      }
  }
  $producto=$this->model->ExportarExcel();
  $i=3;
  $cant=0;
  foreach($producto as $key=>$value){
      $i++;
      $cant++;
      $documento->setActiveSheetIndex(0)
      ->setCellValue('A'.$i,$cant)
      ->setCellValue('B'.$i,$value[0])
      ->setCellValue('C'.$i,$value[1])
      ->setCellValue('D'.$i,$value[2])
      ->setCellValue('E'.$i,$value[3])
      ->setCellValue('F'.$i,$value[4])
      ->setCellValue('G'.$i,$value[5])
      ->setCellValue('H'.$i,$value[6])
      ->setCellValue('I'.$i,$value[7])
      ->setCellValue('J'.$i,$value[8])
      ->setCellValue('K'.$i,$value[9])
      ->setCellValue('L'.$i,$value[10]);

     
   
      
  }
  
  $estiloInformacion =(array('font'=>array('name'=>'Arial','size'=>11,'color'=>array('argb'=>'000000'))));
  $hoja->getStyle("A1:L".($i))->applyFromArray($estiloInformacion);
  $hoja->getStyle("A1:L".($i))->applyFromArray($styleCenter);
  
  $disenno=array(
      'font' => array('bold' => true, 'color' => array('argb' =>'000000'), 'size' => '11'),
      'borders' => array('allBorders' => array('style' => \PhpOffice\PhpSpreadsheet\Style\Border::BORDER_THIN, 'color' => array('argb' =>'000000'),),),
      'fill' => array('fillType' => \PhpOffice\PhpSpreadsheet\Style\Fill::FILL_SOLID, 'startColor' => array('argb' => 'FFA0A0A0',),),
  );

 //  $hoja->setAutoFilter("B3:B3");
   //$hoja->getStyle('A3:l3')->getAlignment()->setWrapText(true);
   $hoja->getStyle('A3:l3')->applyFromArray($disenno); 
  
      
      
      

   $hoja->setShowGridlines(false);

      $hoja->setTitle('PRODUCTOS');
      $documento->setActiveSheetIndex(0);

  //documento a guardar
  $tituloDoc="Listado de productos.xls";
  header('Content-Type: application/vnd.ms-excel');
  header('Content-Disposition: attachment;filename="' . $tituloDoc . '"');
  header('Cache-Control: max-age=0');
  
  $writer = \PhpOffice\PhpSpreadsheet\IOFactory::createWriter($documento, 'Xls');
  $writer->save('php://output');

}
  
}






?>