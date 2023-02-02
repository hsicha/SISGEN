<?php
class Controller{
    public function __construct(){
        $this->view=new View();
    }
    public function loadModel($name,$modelPatch='models/'){
        $path=$modelPatch . $name.'_model.php';
        if(file_exists($path)){
            require $modelPatch .$name.'_model.php';

            $modelName=$name.'_Model';
            $this->model=new $modelName();
        }
    }
    public function getLibrary($libreria)
    {
        $rutaLibreria='aplication/'.$libreria.'.php';
        if(is_readable($rutaLibreria)){
            require_once $rutaLibreria;
        }else{
            throw new Exception("Error de Procesar la Libreria");
        }
    }
}




?>