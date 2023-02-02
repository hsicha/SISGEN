<?php


class Presentacion_Model extends Model{
    private $sms;
function __construct()
{
    parent::__construct();
}
public function ListarPresentacion(){
    $stm=$this->db->prepare("SELECT (@i:=@i+1) AS N°, P.CODIGO_PRESENTACION, P.DESCRIPCION FROM PRESENTACION P CROSS JOIN(SELECT @i:=0)P; ");
    $stm->execute();
    $data=$stm->fetchAll(PDO::FETCH_ASSOC);
    return json_encode($data,JSON_UNESCAPED_UNICODE);
}

public function ExportarExcel(){
    return $this->db->select("SELECT CODIGO_PRESENTACION, DESCRIPCION FROM PRESENTACION");
}
function obtenerId(){
    return $this->db->select("SELECT MAX(CODIGO_PRESENTACION) FROM PRESENTACION");
}
 function InsertarPresentacion($data){
    if ($this->existePresentacion($data)==0) {
        $stm = $this->db->insert('PRESENTACION', $data);
        if ($stm == true) {
            $this->sms = "Registrado correctamente";
        }else{
            $this->sms = "No se pudo registrar, vuelva a intentarlo";
        }
    }else{
        $this->sms = "La presentación <strong>". $data['DESCRIPCION'] . "</strong> ya existe";
    }
    return $this->sms;



}
 function ActualizarPresentacion($data){
    if($this->existePresentacion($data)==0){
        $stm=$this->db->update("PRESENTACION",$data, "CODIGO_PRESENTACION={$data['CODIGO_PRESENTACION']}");
        if($stm==true){
            $this->sms="Presentación Actualizado";
        }else{
            $this->sms="Error al Actualizar Categoria";
        }
    }else{
        $this->sms= "La categoria <strong>". $data['DESCRIPCION'] . "</strong> ya existe";
    }
    return $this->sms;

}
 function Delete(){

}
 function existePresentacion($data){
    $sql=$this->db->prepare("SELECT * FROM PRESENTACION WHERE CODIGO_PRESENTACION <> :CODIGO_PRESENTACION AND DESCRIPCION = :DESCRIPCION");
    $sql->bindParam(':CODIGO_PRESENTACION' , $data['CODIGO_PRESENTACION'] , PDO::PARAM_STR);
    $sql->bindParam(':DESCRIPCION' , $data['DESCRIPCION'] , PDO::PARAM_STR);
    $sql->execute();
    $count = $sql->rowCount();
    return $count;

}

}

?>