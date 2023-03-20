<?php

class Usuario_Model extends Model{
     private $sms;
    function __construct(){
        parent::__construct();
        $this-> arrayPerfil=array();
       
    }

function cargar_comboPerfil(){
    $stm=$this->db->prepare("SELECT CODIGO_PERFIL,DESCRIPCION FROM PERFIL");
    $stm->execute();
    while($row=$stm->fetch(PDO::FETCH_ASSOC)){
        $this->arrayPefil[]=array(
            "IdPerfil"=>$row["CODIGO_PERFIL"],
            "Descripcion"=>$row["DESCRIPCION"]
        );
    }
    return $this->arrayPefil;
}
function listarUsuario(){
    $sql= $this->db->prepare("SELECT (@i:=@i+1)AS N,us.CODIGO_USUARIO AS CODIGO, us.DNI AS USUARIO, CONCAT(us.APELLIDOS,' ',us.NOMBRES)AS NOMBRES, pe.DESCRIPCION AS PERFIL, us.ESTADO AS ESTADO
    FROM usuario us CROSS JOIN(SELECT @i:=0)us inner join usuario_perfiles up
    on  us.CODIGO_USUARIO = up.CODIGO_USUARIO inner join  perfil pe
    on up.CODIGO_PERFIL = pe.CODIGO_PERFIL
	ORDER BY APELLIDOS, NOMBRES; ");
      $sql->execute();
   $data=$sql->fetchAll(PDO::FETCH_ASSOC);
   return $data;
}


function registrar_usuario($data,$codigo){
    $dni=$data['DNI'];
    if($this->existe_usuario($dni)==0){
        $stm=$this->db->insert("USUARIO",$data);
        if($stm==true){
            $codigouser=$this->ultimo_id();
            $array=array('CODIGO_USUARIO'=>$codigouser,'CODIGO_PERFIL'=>$codigo);
            $this->db->insert("USUARIO_PERFILES",$array);
            $this->sms="Registrado Correctamente";
        }else{
            $this->sms="No se pudo registrar, vuelva intertarlo";
        }
    }else{
        	$this->sms = "El usuario <strong>". $dni . "</strong> ya existe";
    }
    return $this->sms;
}
function actualizar_estado($data){
	$dato['ESTADO'] = $data['ESTADO'];
		$stm = $this->db->update('USUARIO' , $dato , "`CODIGO_USUARIO` = {$data['CODIGO']}");
		if ($stm == true) {
			$this->sms = "Actualizado correctamente";
		}else{
			$this->sms = "No se pudo actualizar el registro";
		}
		return $this->sms;
}
function eliminar_usuario($codigo){
    	$stm = $this->db->delete('USUARIO_PERFILES', "CODIGO_USUARIO = '$codigo'");
		$stm = $this->db->delete('USUARIO', "CODIGO_USUARIO = '$codigo'");
		if ($stm == true) {
			$this->sms = "Eliminado correctamente";
		}else{
			$this->sms = "No se pudo eliminar el usuario";
		}
		return $this->sms;
}
function existe_usuario($dni){
 $sql=$this->prepare("SELECT * FROM USUARIO WHERE DNI=:DNI");
 $sql->bindParam(":DNI",$dni,PDO::PARAM_STR);
 $sql->execuet();
 $count=$sql->rowCount();
 return $count;
}
function ultimo_id(){
    $obtener=$this->db->select("SELECT MAX(CODIGO_USUARIO) FROM USUARIO");
    return $obtener[0][0];
}
}


?>