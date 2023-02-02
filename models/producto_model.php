<?php

class Producto_Model extends Model{
    private $sms;
    function __construct(){
        parent::__construct();

    }
    
    function listarProductos(){
        $stm=$this->db->select("SELECT  
        P.CODIGO_PRODUCTO ID_PRODUCTO,
        P.codigo_barra AS CODIGO,
        P.DESCRIPCION AS PRODUCTO,
        M.DESCRIPCION AS MARCA,
        P.STOCK_MINIMO AS STK_MIN,
        P.STOCK AS STOCK,
        P.PRECIO_COMPRA AS PRECIO_MAYOR,
        P.PRECIO AS PRECIO_MENOR,
        C.descripcion AS CATEGORIA,
        P.UNIDAD_MEDIDA AS UM,
        PR.DESCRIPCION AS PRESENTACION,
        P.MONEY,
        P.precio_costo AS PRECIO_COSTO
        from producto P 
        INNER JOIN MARCA M
        ON P.CODIGO_MARCA=M.CODIGO_MARCA INNER JOIN presentacion PR
        ON P.CODIGO_PRESENTACION=PR.CODIGO_PRESENTACION inner join categoria C
        on P.codigo_categoria=C.codigo_categoria;");
       return $stm;
    }
    function listarProductosAll(){
        $stm=$this->db->prepare("SELECT (@i:=@i+1) as N°,  
        P.CODIGO_PRODUCTO ID_PRODUCTO,
        P.codigo_barra AS CODIGO,
        P.DESCRIPCION AS PRODUCTO,
        M.DESCRIPCION AS MARCA,
        P.STOCK_MINIMO AS STK_MIN,
        P.STOCK AS STOCK,
        P.PRECIO_COMPRA AS PRECIO_MAYOR,
        P.PRECIO AS PRECIO_MENOR,
        C.descripcion AS CATEGORIA,
        P.UNIDAD_MEDIDA AS UM,
        PR.DESCRIPCION AS PRESENTACION,
        P.MONEY,
        P.precio_costo AS PRECIO_COSTO
        from producto P CROSS JOIN(SELECT @i:=0)P
        INNER JOIN MARCA M
        ON P.CODIGO_MARCA=M.CODIGO_MARCA INNER JOIN presentacion PR
        ON P.CODIGO_PRESENTACION=PR.CODIGO_PRESENTACION inner join categoria C
        on P.codigo_categoria=C.codigo_categoria;");
        $stm->execute();
        $data=$stm->fetchAll(PDO::FETCH_ASSOC);
        return json_encode($data,JSON_UNESCAPED_UNICODE);
      
    }


    function obtener_Data_Id($id){
        $stm=$this->db->select("SELECT  
        CODIGO_PRODUCTO,
        MONEY,
        CODIGO_CATEGORIA,
        CODIGO_BARRA,
        DESCRIPCION,
        CODIGO_MARCA,
        STOCK_MINIMO,
        CODIGO_PRESENTACION,
        UNIDAD_MEDIDA,
        STOCK,
        PRECIO_COMPRA,
        PRECIO,
        PRECIO_COSTO
         FROM PRODUCTO     WHERE CODIGO_PRODUCTO=$id");
       return $stm;
    }
    function obtenerId(){
        return  $this->db->select("SELECT MAX(CODIGO_PRODUCTO) FROM PRODUCTO");
    }
    function CargarCategoria(){
        $stm= $this->db->select("SELECT CODIGO_CATEGORIA, DESCRIPCION FROM CATEGORIA");
       return $stm;
    }
    
    function CargarMarca(){
        return $this->db->select("SELECT CODIGO_MARCA,DESCRIPCION FROM MARCA");
    }
    function CargarPresentacion(){
        return $this->db->select("SELECT CODIGO_PRESENTACION,DESCRIPCION FROM PRESENTACION");
    }
    
    function ExportarExcel(){
        $stm=$this->db->select("SELECT
        P.CODIGO_BARRA AS CODIGO,
        P.DESCRIPCION AS PRODUCTO,
        M.DESCRIPCION AS MARCA,
        C.descripcion AS CATEGORIA,
        P.STOCK_MINIMO AS STK_MIN,
        P.STOCK AS STOCK,
        P.PRECIO_COMPRA AS PRECIO_MAYOR,
        P.precio AS PRECIO_MENOR,
        P.precio_costo AS PRECIO_COSTO,
        P.UNIDAD_MEDIDA AS UM,
        P.money AS MONEDA
        from producto P 
        INNER JOIN MARCA M
        ON P.CODIGO_MARCA=M.CODIGO_MARCA INNER JOIN presentacion PR
        ON P.CODIGO_PRESENTACION=PR.CODIGO_PRESENTACION inner join categoria C
        on P.codigo_categoria=C.codigo_categoria;");
        return $stm;
    }
    function InsertarProductos($data){
        if ($this->verificar_codigo($data)==0) {
			$stm = $this->db->insert('PRODUCTO', $data);
			if ($stm == true) {
				$this->sms = "Producto Registrado";
			}else{
				$this->sms = "No se pudo registrar, vuelva a intentarlo";
			}
		}else{
			$this->sms = "El codigo de barra <strong>". $data['CODIGO_BARRA'] . "</strong> ya existe";
		}
		return $this->sms;
       

    }
    function ActualzarProductos($data){
        $stm=$this->db->update("PRODUCTO",$data, "CODIGO_PRODUCTO={$data['CODIGO_PRODUCTO']}");
        if($stm==true){
            $this->sms="Producto Actualizado";
        }else{
            $this->sms="Ocurrio al actualizar producto";
        }
        return $this->sms;
    }
    function eliminarProducto($id){
        $sql=$this->db->prepare("DELETE FROM PRODUCTO WHERE CODIGO_PRODUCTO=:CODIGO_PRODUCTO");
        $sql->bindParam(":CODIGO_PRODUCTO",$id,PDO::PARAM_STR);
        
        if($sql->execute()){
            $this->sms="Registro Eliminado";
        }else{
            $this->sms="Ocurrio un error al eliminar registro";
        }
        return $this->sms;
    }

    public function verificar_codigo($data)
	{
		$param = array('CODIGO_BARRA'=>$data['CODIGO_BARRA'],
			
		);
		$consulta = $this->db->select('SELECT * FROM PRODUCTO WHERE CODIGO_BARRA = :CODIGO_BARRA',$param);
		return count($consulta);
	}

    

}




?>