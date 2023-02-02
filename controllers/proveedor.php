<?php
require 'vendor/autoload.php';

use PhpOffice\PhpSpreadsheet\Spreadsheet;
use PhpOffice\PhpSpreadsheet\Writer\Xlsx;

class Proveedor extends Controller{
    function __construct(){
        parent::__construct();
    }

function index(){
    $this->view->title="Poveedor";
    $this->view->getTipoContr=$this->model->caragar_tipoCont();
    $this->view->getTipoDoc=$this->model->cargar_tipo_doc_cont();
    $this->view->renderAdmin('proveedor/index');
}
function listar(){
    $getProveedor=$this->model->listarProveedor();
   print $getProveedor;
}
function obtenerData(){
    if(isset($_POST['idProveedor'])){
        $id=$_POST['idProveedor'];
        $getData=$this->model->listar_por_ID($id);
     echo json_encode($getData);
    }
}
function Registrar(){
    $obtenerId=$this->model->obtener_Id();
    foreach($obtenerId as $value){
        $idProveedor=$value[0]+1;
    }
    if(isset($_POST['idProveedor'])&& empty($_POST['idProveedor'])){
        $estadoMenaje=false;
        $tipocontr=$_POST['tipocontribuyente'];
        $tipodoc=$_POST['tipodocumento'];
        $ruc=$_POST['rucdni'];
        $razonsoc=$_POST['razonsocial'];
        $representante=$_POST['representante'];
        $direccion=$_POST['direccion'];
        $telefono=$_POST['telefono'];
        $email=$_POST['email'];
        
        $data=array(
            "CODIGO_PROVEEDOR"=>$idProveedor,
            "TIPO_CONTRIBUYENTE"=>$tipocontr,
            "RUC"=>$ruc,
            "TIPO_DOCUMENTO"=>$tipodoc,
            "RAZON_SOCIAL"=>$razonsoc,
            "REPRESENTANTE"=>$representante,
            "CELULAR"=>"",
            "DIRECCION"=>$direccion,
            "TELEFONO"=>$telefono,
            "EMAIL"=>$email
        );
        
        $mensaje=$this->model->InsertarProveedor($data);
        if($mensaje=="Proveedor Registrado"){
            $estadoMenaje=true;
            $mensajeSalida=$mensaje;
        }else{
           $mensajeSalida=$mensaje;
        }
        $mensajeJson=array(
            "respuesta"=>$estadoMenaje,
            "mensaje"=>$mensajeSalida,
            "id"=>$data['CODIGO_PROVEEDOR'],
            "ruc"=> $data['RUC'],
            "nombre"=>$data['RAZON_SOCIAL']);
        echo json_encode($mensajeJson);
    }else{
        $mensajeSalida="Debe ingresar un dato valido";
        header("Location".URL. 'proveedor');
    }
}


function Actualizar(){
    if(isset($_POST['idProveedor'])&& !empty($_POST['idProveedor'])){
        $estadoMenaje=false;
        $idProveedor=$_POST['idProveedor'];
        $tipocontr=$_POST['tipocontribuyente'];
        $tipodoc=$_POST['tipodocumento'];
        $ruc=$_POST['rucdni'];
        $razonsoc=$_POST['razonsocial'];
        $representante=$_POST['representante'];
        $direccion=$_POST['direccion'];
        $telefono=$_POST['telefono'];
        $email=$_POST['email'];
        
        $data=array(
            "CODIGO_PROVEEDOR"=>$idProveedor,
            "TIPO_CONTRIBUYENTE"=>$tipocontr,
            "RUC"=>$ruc,
            "TIPO_DOCUMENTO"=>$tipodoc,
            "RAZON_SOCIAL"=>$razonsoc,
            "REPRESENTANTE"=>$representante,
            "CELULAR"=>"",
            "DIRECCION"=>$direccion,
            "TELEFONO"=>$telefono,
            "EMAIL"=>$email
        );
        $mensaje=$this->model->ActualzarProductos($data);
        if($mensaje=="Proveedor Actualizado"){
            $estadoMenaje=true;
            $mensajeSalida=$mensaje;
        }else{
           $mensajeSalida=$mensaje;
        }
        $mensajeJson=array("respuesta"=>$estadoMenaje,"mensaje"=>$mensajeSalida);
        echo json_encode($mensajeJson);
    }else{
        $mensajeSalida="Debe ingresar un dato valido";
        header("Location".URL. 'proveedor');
    } 

}
function Eliminar(){
    if(isset($_POST['idProveedor'])){
      $mensaje_OK=false;
      $idProveedor=$_POST['idProveedor'];
      $mensaje=$this->model->eliminarProveedor($idProveedor);
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
public function ExportarExcelProveedor(){
    //propiedades del documento excel
    $documento = new Spreadsheet();
    $documento
    ->getProperties()
    ->setCreator("SICHA")
    ->setLastModifiedBy('SICHA') // última vez modificado por
    ->setTitle('Archivo creado con php y mysql')
    ->setSubject('excel con php y mysql')
    ->setDescription('Este documento fue generado pos la empresa  SICHA')
    ->setKeywords('Lista de Proveedores')
    ->setCategory('Proveedores');
  
    // contenido del document excel
    $hoja = $documento->getActiveSheet();
  
    $titulo="LISTADO DE PROVEEDORES";
    $styleCenter=array
    (
        'alignment'=>array(
        'horizontal'=>\PhpOffice\PhpSpreadsheet\Style\Alignment::HORIZONTAL_CENTER,
        'vertical'=>\PhpOffice\PhpSpreadsheet\Style\Alignment::VERTICAL_CENTER,
        ),
    );
  
    $hoja->mergeCells('A1:J1');
    $hoja->setCellValue('A1',$titulo);
    $hoja->getStyle('A1')->getFont()->setBold(true);
    $hoja->getStyle('A1')->getAlignment()->setHorizontal(\PhpOffice\PhpSpreadsheet\Style\Alignment::HORIZONTAL_CENTER);
  
    $columnas=array('A','B','C','D','E','F','G','H','I','J');
    $encabezado=array('N°','TIPO CONTRIBUYENTE','TIPO DOCUMENTO','RUC/DNI','RAZON SOCIAL','DIRECCION','REPRESENTANTE','TELEFONO','EMAIL');
    for($i=3; $i<4;$i++){
        for($j=0;$j<count($encabezado);$j++){
            $hoja->setCellValue($columnas[$j].$i,$encabezado[$j]);
            $hoja->getStyle($columnas[$j].$i)->getFont()->setBold(true);
        }
    }
    $estiloEncabezado =array('borders'=>array('bottom'=>array('style'=>\PhpOffice\PhpSpreadsheet\Style\Border::BORDER_THIN,'color'=>array('argb'=>'rgb(41128185)'))));
    $hoja->getStyle('A1:J1')->applyFromArray($estiloEncabezado);
  
    $ancho=array(10,25,30,30,30,30,30,30,30,30);
    for($i=0;$i<1;$i++){
        for($j=0;$j<count($ancho);$j++){
            $hoja->getColumnDimension($columnas[$j])->setWidth($ancho[$j]);
        }
    }
    $proveedor=$this->model->ExportarExcel();
    $i=3;
    $cant=0;
    foreach($proveedor as $key=>$value){
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
        ->setCellValue('I'.$i,$value[7]);
      
    
        
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
  
        $hoja->setTitle('PROVEEDORES');
        $documento->setActiveSheetIndex(0);
  
    //documento a guardar
    $tituloDoc="Listado de Proveedores.xls";
    header('Content-Type: application/vnd.ms-excel');
    header('Content-Disposition: attachment;filename="' . $tituloDoc . '"');
    header('Cache-Control: max-age=0');
    
    $writer = \PhpOffice\PhpSpreadsheet\IOFactory::createWriter($documento, 'Xls');
    $writer->save('php://output');
  
  }

}


?>