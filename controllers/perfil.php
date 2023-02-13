<?php

class Perfil extends Controller{
    function __construct(){
        parent::__construct();
    }
    function index(){
        $this->view->title="Perfil";
        $this->view->renderAdmin('perfil/index');
    }
    function listar_Perfil(){
         $getData=$this->model->listar_perfiles();
       print $getData;
        
    }
    function obtenerPerfilId(){
        if(isset($_POST['idPerfil'])){
            $idPerfil=$_POST['idPerfil'];
            $data=$this->model->obtenerData($idPerfil);
            echo json_encode($data);
        }else{
            echo json_encode("no existe codigo");
        }
    }
    function RegistrarPerfil(){
        if(isset($_POST['idPerfil'])&& empty($_POST['idPerfil'])){
            $estadoMensaje=false;
            $descripcion=$_POST['descripcion'];
            $data=array("DESCRIPCION"=>$descripcion);
        
        $mensaje=$this->model->insertarPerfil($data);
        if($mensaje=="Registrado Correctamente"){
            $estadoMensaje=true;
            $mensajeSalida=$mensaje;
        }else{
            $mensajeSalida=$mensaje;
        }
        $mensajeJson=array('respuesta'=>$estadoMensaje,
        'mensaje'=>$mensajeSalida);
        echo json_encode($mensajeJson);

    }else{
        $mensajeSalida="Debe ingresar perfil de usuario";
        header('Location'.URL.'perfil');
    }

    }
    function ActualizarPerfil(){
          if(isset($_POST['idPerfil'])&& !empty($_POST['idPerfil'])){
            $estadoMensaje=false;
            $descripcion=$_POST['descripcion'];
            $idPerfil=$_POST['idPerfil'];
            $data=array("CODIGO_PERFIL"=>$idPerfil,
                "DESCRIPCION"=>$descripcion);
        
        $mensaje=$this->model->actualizarPerfil($data);
        if($mensaje=="Perfil Actualizado"){
            $estadoMensaje=true;
            $mensajeSalida=$mensaje;
        }else{
            $mensajeSalida=$mensaje;
        }
        $mensajeJson=array('respuesta'=>$estadoMensaje,
        'mensaje'=>$mensajeSalida);
        echo json_encode($mensajeJson);

    }else{
        $mensajeSalida="Debe ingresar perfil de usuario";
        header('Location'.URL.'perfil');
    }
    }
    function ElimimarPerfil(){
        if(isset($_POST['idPerfil'])){
            $mensajeok=false;
            $idPerfil=$_POST['idPerfil'];
            $mensaje=$this->model->eliminarPerfil($idPerfil);
            if($mensaje=='Eliminado correctamente'){
                $mensajeok=true;
                $mensajeSalida=$mensaje;
            }else{
                $mensajeSalida=$mensaje;
            }
            $mensajeJson=array(
                'respuesta'=>$mensajeok,'mensaje'=>$mensaje
            );
            echo json_encode($mensajeJson);
            
        }else{
            $mensajeSalida="Debe ingresar un codigo de perfil válido";
            echo json_encode($mensajeSalida);
            header('Location'.URL.'perfil');
            
        }
    }
}



?>