<?php



require 'vendor/autoload.php';

use PhpOffice\PhpSpreadsheet\Spreadsheet;
use PhpOffice\PhpSpreadsheet\Writer\Xlsx;



class Categoria extends Controller{
    function __construct(){
        parent::__construct();
    }
    function index(){
        $this->view->title="Categoria";
        $this->view->renderAdmin('categoria/index');
    }
    function listarCategorias(){
       $getData=$this->model->ListarCategoria();
       print $getData;
    }



    function Registrar(){
        $id= $this->model->obtenerId();
        foreach ($id as $key => $value) {
         $getId=  $value[0] +1;
        }
     
        $descripcion_mayus=$_POST['descripcion'];
        $descripcion_mayus=strtoupper($descripcion_mayus);
        if(isset($_POST['idCategoria'])&& empty($_POST['idCategoria'])){
            $mensaje_OK=false;
            if(isset($_POST['descripcion'])){
                $data=array('CODIGO_CATEGORIA'=>$getId, 'DESCRIPCION'=>strtoupper(trim($descripcion_mayus)),
            'ESTADO'=>'ACTIVO');
                $mensaje=$this->model->InsertarCategoria($data);
                if($mensaje=="Registrado correctamente"){
                    $mensaje_OK=true;
                    $mensajeRespuesta=$mensaje;
                }else{
                    $mensajeRespuesta=$mensaje;
                }

            }else{
                $mensajeRespuesta="Ingrese una Descripción";
            }
            $mensajeJson=array('respuesta'=>$mensaje_OK,'mensaje'=>$mensajeRespuesta);
            echo json_encode($mensajeJson);
        }else{
            header("Location" .URL. "categoria");
        }
    }
    function Actualizar(){
        if(isset($_POST['idCategoria'])&& !empty($_POST['idCategoria'])){
            $mensaje_OK=false;
            $data=array("CODIGO_CATEGORIA"=>trim($_POST['idCategoria']),"DESCRIPCION"=>strtoupper(trim($_POST['descripcion'])));
            $mensaje=$this->model->ActualizarCategoria($data);
            if($mensaje=="Categoria Actualizado"){
                $mensaje_OK=true;
                $mensajeRespuesta=$mensaje;
            }else{
                $mensajeRespuesta=$mensaje;
            }

            $mensajeJson=array('respuesta'=>$mensaje_OK,'mensaje'=>$mensajeRespuesta);
            echo json_encode($mensajeJson);

        }else{
           header("Location" .URL. "marca");
        }

    }

    public function ExportarExcelCategoria(){
        //propiedades del documento excel
        $documento = new Spreadsheet();
        $documento
        ->getProperties()
        ->setCreator("SICHA")
        ->setLastModifiedBy('SICHA') // última vez modificado por
        ->setTitle('Archivo creado con php y mysql')
        ->setSubject('excel con php y mysql')
        ->setDescription('Este documento fue generado pos la empresa  SICHA')
        ->setKeywords('Lista de categorias')
        ->setCategory('Categoria');
    
        // contenido del document excel
        $hoja = $documento->getActiveSheet();
    
        $titulo="LISTADO DE CATEGORIAS";
        $styleCenter=array
        (
            'alignment'=>array(
            'horizontal'=>\PhpOffice\PhpSpreadsheet\Style\Alignment::HORIZONTAL_CENTER,
            'vertical'=>\PhpOffice\PhpSpreadsheet\Style\Alignment::VERTICAL_CENTER,
            ),
        );
    
        $hoja->mergeCells('A1:F1');
        $hoja->setCellValue('A1',$titulo);
        $hoja->getStyle('A1')->getFont()->setBold(true);
        $hoja->getStyle('A1')->getAlignment()->setHorizontal(\PhpOffice\PhpSpreadsheet\Style\Alignment::HORIZONTAL_CENTER);
    
        $columnas=array('A','B');
        $encabezado=array('N°','MARCA');
        for($i=3; $i<4;$i++){
            for($j=0;$j<count($encabezado);$j++){
                $hoja->setCellValue($columnas[$j].$i,$encabezado[$j]);
                $hoja->getStyle($columnas[$j].$i)->getFont()->setBold(true);
            }
        }
        $estiloEncabezado =array('borders'=>array('bottom'=>array('style'=>\PhpOffice\PhpSpreadsheet\Style\Border::BORDER_THIN,'color'=>array('argb'=>'050505'))));
        $hoja->getStyle('A1:F1')->applyFromArray($estiloEncabezado);
    
        $ancho=array(10,30);
        for($i=0;$i<1;$i++){
            for($j=0;$j<count($ancho);$j++){
                $hoja->getColumnDimension($columnas[$j])->setWidth($ancho[$j]);
            }
        }
        $categoria=$this->model->ExportarExcel();
        $i=3;
        $cant=0;
        foreach($categoria as $key=>$value){
            $i++;
            $cant++;
            $documento->setActiveSheetIndex(0)
            ->setCellValue('A'.$i,$cant)
            ->setCellValue('B'.$i,$value[1]);
        }
        
        $estiloInformacion =(array('font'=>array('name'=>'Arial','size'=>11,'color'=>array('argb'=>'000000'))));
        $hoja->getStyle("A1:F".($i))->applyFromArray($estiloInformacion);
        $hoja->getStyle("A1:F".($i))->applyFromArray($styleCenter);
        
        $disenno=array(
            'font' => array('bold' => true, 'color' => array('argb' =>'000000'), 'size' => '11'),
            'borders' => array('allBorders' => array('style' => \PhpOffice\PhpSpreadsheet\Style\Border::BORDER_THIN, 'color' => array('argb' =>'000000'),),),
            'fill' => array('fillType' => \PhpOffice\PhpSpreadsheet\Style\Fill::FILL_SOLID, 'startColor' => array('argb' => 'FFA0A0A0',),),
        );
    
       //  $hoja->setAutoFilter("B3:B3");
         $hoja->getStyle('A3:B3')->getAlignment()->setWrapText(true);
         $hoja->getStyle('A3:B3')->applyFromArray($disenno); 
         $hoja->getStyle('A3:B3')->applyFromArray($styleCenter);
            
            
            
    
         $hoja->setShowGridlines(false);
    
            $hoja->setTitle('Marcas');
            $documento->setActiveSheetIndex(0);

        //documento a guardar
        $tituloDoc="Listado de Categorias.xls";
        header('Content-Type: application/vnd.ms-excel');
        header('Content-Disposition: attachment;filename="' . $tituloDoc . '"');
        header('Cache-Control: max-age=0');
        
        $writer = \PhpOffice\PhpSpreadsheet\IOFactory::createWriter($documento, 'Xls');
        $writer->save('php://output');
    
    }
    
   
}







?>