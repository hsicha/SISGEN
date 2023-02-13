<?php

class Perfil_Model extends Model{
    private $sms;
  function __construct()
{
    parent::__construct();
}

    function listar_perfiles(){
    $stm=$this->db->prepare("SELECT (@i:=@i+1) AS N°, CODIGO_PERFIL, DESCRIPCION FROM PERFIL  CROSS JOIN(SELECT @i:=0)C; ");
    $stm->execute();
    $data=$stm->fetchAll(PDO::FETCH_ASSOC);
    return json_encode($data,JSON_UNESCAPED_UNICODE);
    }
    function obtenerData($idPerfil){
        return $this->db->select("SELECT CODIGO_PERFIL, DESCRIPCION FROM PERFIL WHERE CODIGO_PERFIL=$idPerfil");
    }
  
    function insertarPerfil($data){
        if($this->existePerfil($data)==0){
            $stm=$this->db->insert('PERFIL',$data);
            if($stm==true){
                $this->sms="Registrado Correctamente";
            }else{
                $this->sms="No pudo registrar, vuelve a intertarlo";
            }

        }else{
            $this->sms="El perfil <strong>".$data[DESCRIPCION]."</strong> ya existe";
        }
        return $this->sms;
        
    }
    function actualizarPerfil($data){
            $stm=$this->db->update("PERFIL",$data,"CODIGO_PERFIL={$data['CODIGO_PERFIL']}");
            if($stm==true){
                $this->sms="Perfil Actualizado";
            }else{
                $this->sms="Ocurrio un error al actualizar perfil";
            }
        return $this->sms;
    }
    function eliminarPerfil($id){
       $stm=$this->db->delete("PERFIL","CODIGO_PERFIL='$id'");
       	if ($stm == true) {
			$this->sms = "Eliminado correctamente";
		}else{
			$this->sms = "No se pudo eliminar el perfil";
		}
		return $this->sms;

    }
    function existePerfil($data){
     $sql=$this->db->prepare("SELECT * FROM PERFIL WHERE CODIGO_PERFIL <> :CODIGO_PERFIL AND DESCRIPCION = :DESCRIPCION");
    $sql->bindParam(':CODIGO_PERFIL' , $data['CODIGO_PERFIL'] , PDO::PARAM_STR);
    $sql->bindParam(':DESCRIPCION' , $data['DESCRIPCION'] , PDO::PARAM_STR);
    $sql->execute();
    $count = $sql->rowCount();
    return $count;
    }


}



?>