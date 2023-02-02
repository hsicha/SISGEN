<?php


class Categoria_Model extends Model{
    private $sms;
function __construct()
{
    parent::__construct();
}
public function ListarCategoria(){
    $stm=$this->db->prepare("SELECT (@i:=@i+1) AS N°, C.CODIGO_CATEGORIA, C.DESCRIPCION FROM CATEGORIA C CROSS JOIN(SELECT @i:=0)C; ");
    $stm->execute();
    $data=$stm->fetchAll(PDO::FETCH_ASSOC);
    return json_encode($data,JSON_UNESCAPED_UNICODE);
}

public function ExportarExcel(){
    return $this->db->select("SELECT CODIGO_CATEGORIA, DESCRIPCION FROM CATEGORIA");
}

function obtenerId(){
    return $this->db->select("SELECT MAX(CODIGO_CATEGORIA) FROM CATEGORIA");
}
 function InsertarCategoria($data){
    if ($this->existeCategoria($data)==0) {
        $stm = $this->db->insert('CATEGORIA', $data);
        if ($stm == true) {
            $this->sms = "Registrado correctamente";
        }else{
            $this->sms = "No se pudo registrar, vuelva a intentarlo";
        }
    }else{
        $this->sms = "La categoria <strong>". $data['DESCRIPCION'] . "</strong> ya existe";
    }
    return $this->sms;



}
 function ActualizarCategoria($data){
    if($this->existeCategoria($data)==0){
        $stm=$this->db->update("CATEGORIA",$data, "CODIGO_CATEGORIA={$data['CODIGO_CATEGORIA']}");
        if($stm==true){
            $this->sms="Categoria Actualizado";
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
 function existeCategoria($data){
    $sql=$this->db->prepare("SELECT * FROM CATEGORIA WHERE CODIGO_CATEGORIA <> :CODIGO_CATEGORIA AND DESCRIPCION = :DESCRIPCION");
    $sql->bindParam(':CODIGO_CATEGORIA' , $data['CODIGO_CATEGORIA'] , PDO::PARAM_STR);
    $sql->bindParam(':DESCRIPCION' , $data['DESCRIPCION'] , PDO::PARAM_STR);
    $sql->execute();
    $count = $sql->rowCount();
    return $count;

}

}

?>