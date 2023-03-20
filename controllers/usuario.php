<?php

class Usuario extends Controller{
    function __construct(){
        parent::__construct();
    }
    function index(){
        $this->view->title="Usuarios";
        $this->view->renderAdmin("usuario/index");
    }
    function cargarPerfil(){
        $obtenerPerfiles=$this->model->cargar_comboPerfil();
        echo json_encode( $obtenerPerfiles,JSON_UNESCAPED_UNICODE);
    }
    function listarUsers(){
        $obtenerUsuarios=$this->model->listarUsuario();
        echo json_encode($obtenerUsuarios,JSON_UNESCAPED_UNICODE);
    }
    function registrar_usuario(){
        if(isset($_POST['perfil'])){
            $mensaje_ok=false;
            $dni=Validar::dni($_POST['dni']);
            if($dni['valor']=="ok"){
                if(Validar::post($_POST['nombre'])){
                    if(Validar::post($_POST['apellido'])){
                        $msgbox=Validar::clave($_POST['contra'],$_POST['conf_contra']);
                        if($msgbox['valor']=="ok"){
                            $contra=Hash::create(trim($_POST['conf_contra']));
                            $data=array("NOMBRES"=>$_POST['nombre'],
                            "DNI"=>$_POST['dni'],
                            "CLAVE"=>$contra,
                            "FECHA_REGISTRO"=>date('Y-m-d h:i:s'));
                            $codigo=trim($_POST['perfil']);
                            $mensaje=$this->model->registrar_usuario($data,$codigo);
                            if($mensaje=="Registrado Correctamente"){
                                $mensaje_ok=true;
                                $mensajeSalida=$mensaje;
                            }else{
                                $mensajeSalida=$mensaje;
                            }
                        }else{
                            $mensajeSalida=$msgbox['valor'];
                        }
                    }else{
                        $mensajeSalida="por favor ingrese apellidos";
                    }
                }else{
                    $mensajeSalida="por favor ingrese nombres";
                }
            }else{
              $mensajeSalida= $msgbox['valor'];
            }
            $mensajeJson=array("respuesta"=>$mensaje_ok,"mensaje"=>$mensajeSalida);
            echo json_encode($mensajeJson);
        }else{
            header("location".URL. "usuario");
        }
    }
    function cambiar_estado(){
        if(isset($_POST['codigo'])){
            $mensaje_ok=false;
            $data["CODIGO"]=trim($_POST['codigo']);
            $data["ESTADO"]=$_POST['estado'];
            $mensaje=$this->model->actualizar_estado($data);
            if($mensaje=="Actualizado correctamente"){
                $mensaje_ok=true;
                $mensajeSalida=$mensaje;
            }else{
                $mensajeSalida=$mensaje;
            }
            $mensajeJson=array("respuesta"=>$mensaje_ok,"mensaje"=>$mensajeSalida);
            echo json_encode($mensajeJson);
        }
    }
    function eliminar(){
        if(isset($_POST['codigo'])){
            $mensaje_ok=false;
            $codigo=$_POST['codigo'];
            $mensaje=$this->model->eliminar_usuario($codigo);
            if($mensaje=="Eliminado correctamente"){
                $mensaje_ok=true;
                $mensajeSalida=$mensaje;
            }else{
                $mensajeSalida=$mensaje;
            }
            $mensajeJson=array("respuesta"=>$mensaje_ok,"mensaje"=>$mensajeSalida);
            echo json_encode($mensajeJson);
        }
    }
}





?>