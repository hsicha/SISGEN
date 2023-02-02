<?php


class Marca_Model extends Model{
    private $sms;
function __construct()
{
    parent::__construct();
}
public function ListarMarca(){
    $stm=$this->db->prepare("SELECT (@i:=@i+1) AS N°, M.CODIGO_MARCA, M.DESCRIPCION FROM MARCA M CROSS JOIN(SELECT @i:=0)M; ");
    $stm->execute();
    $data=$stm->fetchAll(PDO::FETCH_ASSOC);
    return json_encode($data,JSON_UNESCAPED_UNICODE);
}

public function ExportarExcel(){
    return $this->db->select("SELECT CODIGO_MARCA, DESCRIPCION FROM MARCA");
}
function obtenerId(){
    return $this->db->select("SELECT MAX(CODIGO_MARCA) FROM MARCA");
}
 function InsertarMarca($data){
    if ($this->existeMarca($data)==0) {
        $stm = $this->db->insert('MARCA', $data);
        if ($stm == true) {
            $this->sms = "Registrado correctamente";
        }else{
            $this->sms = "No se pudo registrar, vuelva a intentarlo";
        }
    }else{
        $this->sms = "La marca <strong>". $data['DESCRIPCION'] . "</strong> ya existe";
    }
    return $this->sms;



}
 function ActualizarMarca($data){
    if($this->existeMarca($data)==0){
        $stm=$this->db->update("MARCA",$data, "CODIGO_MARCA={$data['CODIGO_MARCA']}");
        if($stm==true){
            $this->sms="Marca Actualizado";
        }else{
            $this->sms="Error al Actualizar Marca";
        }
    }else{
        $this->sms= "La marca <strong>". $data['DESCRIPCION'] . "</strong> ya existe";
    }
    return $this->sms;

}
 function Delete(){

}
 function existeMarca($data){
    $sql=$this->db->prepare("SELECT * FROM MARCA WHERE CODIGO_MARCA <> :CODIGO_MARCA AND DESCRIPCION = :DESCRIPCION");
    $sql->bindParam(':CODIGO_MARCA' , $data['CODIGO_MARCA'] , PDO::PARAM_STR);
    $sql->bindParam(':DESCRIPCION' , $data['DESCRIPCION'] , PDO::PARAM_STR);
    $sql->execute();
    $count = $sql->rowCount();
    return $count;

}

}

?>