<?php
class Proveedor_Model extends Model{
    function __construct(){
        parent::__construct();
    }
    private $sms;
   
function listarProveedor(){
    $sql=$this->db->prepare("SELECT (@i:=@i+1)AS N°, 
    P.CODIGO_PROVEEDOR  ID_PROVEEDOR, 
    TC.DESCRIPCION AS CONTRIBUYENTE, 
    td.DESCRIPCION AS DOCUMENTO,
     P.RUC AS RUC, 
     P.RAZON_SOCIAL AS RAZON_SOCIAL,
     P.DIRECCION AS DIRECCION, 
     P.REPRESENTANTE AS REPRESENTANTE, 
     P.TELEFONO AS TELEFONO, 
     P.EMAIL AS EMAIL
    FROM PROVEEDOR P CROSS JOIN(SELECT @i:=0)P INNER JOIN  tipo_contribuyente TC
    ON P.TIPO_CONTRIBUYENTE = TC.CODIGO_TIPO_CONTRIBUYENTE INNER JOIN tipo_documento_contribuyente TD
    ON P.TIPO_DOCUMENTO = TD.CODIGO");
   $sql->execute();
   $data=$sql->fetchAll(PDO::FETCH_ASSOC);
   return json_encode($data,JSON_UNESCAPED_UNICODE);
}

function listar_por_ID($id){
   return $this->db->select("SELECT
    CODIGO_PROVEEDOR,
    TIPO_CONTRIBUYENTE,
    TIPO_DOCUMENTO,
    RUC,
    RAZON_SOCIAL,
    REPRESENTANTE,
    DIRECCION,
    TELEFONO,
    EMAIL FROM PROVEEDOR
    WHERE CODIGO_PROVEEDOR=$id");
}


function ExportarExcel(){
    return $this->db->select("SELECT
    TC.DESCRIPCION AS CONTRIBUYENTE, 
    td.DESCRIPCION AS DOCUMENTO,
     P.RUC AS RUC, 
     P.RAZON_SOCIAL AS RAZON_SOCIAL,
     P.DIRECCION AS DIRECCION, 
     P.REPRESENTANTE AS REPRESENTANTE, 
     P.TELEFONO AS TELEFONO, 
     P.EMAIL AS EMAIL
    FROM PROVEEDOR P INNER JOIN  tipo_contribuyente TC
    ON P.TIPO_CONTRIBUYENTE = TC.CODIGO_TIPO_CONTRIBUYENTE INNER JOIN tipo_documento_contribuyente TD
    ON P.TIPO_DOCUMENTO = TD.CODIGO");
}
function obtener_Id(){
    return $this->db->select("SELECT MAX(CODIGO_PROVEEDOR)FROM PROVEEDOR");
}
function caragar_tipoCont(){
    return $this->db->select("SELECT CODIGO_TIPO_CONTRIBUYENTE, DESCRIPCION FROM TIPO_CONTRIBUYENTE");
}
function cargar_tipo_doc_cont(){
    return $this->db->select("SELECT CODIGO, DESCRIPCION FROM TIPO_DOCUMENTO_CONTRIBUYENTE");
}


function InsertarProveedor($data){
    if ($this->verificar_codigo($data)==0) {
        $stm = $this->db->insert('PROVEEDOR', $data);
        if ($stm == true) {
            $this->sms = "Proveedor Registrado";
           
        }else{
            $this->sms = "No se pudo registrar, vuelva a intentarlo";
        }
    }else{
        $this->sms = "El documento  <strong>". $data['RUC'] . "</strong> ya existe";
    }
    return $this->sms;
   

}
function ActualzarProductos($data){
    $stm=$this->db->update("PROVEEDOR",$data, "CODIGO_PROVEEDOR={$data['CODIGO_PROVEEDOR']}");
    if($stm==true){
        $this->sms="Proveedor Actualizado";
    }else{
        $this->sms="Ocurrio al actualizar producto";
    }
    return $this->sms;
}
function eliminarProveedor($id){
    $sql=$this->db->prepare("DELETE FROM PROVEEDOR WHERE CODIGO_PROVEEDOR=:CODIGO_PROVEEDOR");
    $sql->bindParam(":CODIGO_PROVEEDOR",$id,PDO::PARAM_STR);
    
    if($sql->execute()){
        $this->sms="Registro Eliminado";
    }else{
        $this->sms="Ocurrio un error al eliminar registro";
    }
    return $this->sms;
}
public function verificar_codigo($data)
{
    $param = array('RUC'=>$data['RUC'],
        
    );
    $consulta = $this->db->select('SELECT * FROM PROVEEDOR WHERE RUC = :RUC',$param);
    return count($consulta);
}
}

?>