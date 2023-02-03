<?php
 class Compras_Model extends Model{
    function __construct(){
        parent:: __construct();
        $this->autocomplete = array();
        $this->dataTipoC=array();
        $this->TipoDoc=array();
    }
    function obtenerProdAutocomplete($descripcion){
        
        $stmt= $this->db->prepare("SELECT 
        P.CODIGO_PRODUCTO AS COD_PROD,
        P.CODIGO_BARRA AS CODIGO, 
        P.DESCRIPCION AS PRODUCTO, 
        M.DESCRIPCION AS MARCA,
       FORMAT( P.PRECIO_COSTO,2) AS PRECIO,
        STOCK
        FROM PRODUCTO P
        INNER JOIN MARCA M
        ON P.CODIGO_MARCA=M.CODIGO_MARCA WHERE p.DESCRIPCION LIKE '%$descripcion%' ");
       	$stmt->execute();
           
            while($row = $stmt->fetch(PDO::FETCH_ASSOC)) {
              $this->autocomplete []=array

              (
              'IdProd'=>$row["COD_PROD"],
              'Codigo'=>$row['CODIGO'],
              'Producto'=>$row['PRODUCTO'],
              'Marca'=>$row['MARCA'],
              'Stock'=>$row['STOCK'],
              'Precio'=>$row['PRECIO']
             
            );
             
        }
          
       return $this-> autocomplete;
       
    }

    function autocomplte_proveedor($descripcion){
        $stm=$this->db->prepare("SELECT 
        CODIGO_PROVEEDOR,
        RUC,RAZON_SOCIAL 
        FROM PROVEEDOR
        WHERE RUC LIKE '%$descripcion%' OR RAZON_SOCIAL LIKE '%$descripcion%' ");
        $stm->execute();
        while($row=$stm->fetch(PDO::FETCH_ASSOC)){
            $this->autocomplete[]=array(
                "IdProveedor"=>$row["CODIGO_PROVEEDOR"],
                "Ruc"=>$row["RUC"],
                "Razon_Social"=>$row["RAZON_SOCIAL"]
            );
        }
        return $this->autocomplete;
    }
    function caragar_tipoCont(){

        $stm= $this->db->prepare("SELECT 
        CODIGO_TIPO_CONTRIBUYENTE, 
        DESCRIPCION FROM TIPO_CONTRIBUYENTE");
        $stm->execute();
        while($row =$stm->fetch(PDO::FETCH_ASSOC)){
            $this->dataTipoC[]=array
            (
                'Id'=>$row["CODIGO_TIPO_CONTRIBUYENTE"],
                "Descripcion"=>$row["DESCRIPCION"]
            );
        }
        return $this->dataTipoC;
    }
    function cargar_tipo_doc_cont(){
        $stm= $this->db->prepare("SELECT 
        CODIGO,
        DESCRIPCION 
        FROM TIPO_DOCUMENTO_CONTRIBUYENTE");
        $stm->execute();
        while($row=$stm->fetch(PDO::FETCH_ASSOC)){
            $this->TipoDoc[]=array
            (
                "Id"=>$row["CODIGO"],
                "Descripcion"=>$row["DESCRIPCION"]
            );
        }
        return $this->TipoDoc;
    }
    function obtener_Id(){
     $id= $this->db->select("SELECT MAX(CODIGO_COMPRAS)FROM COMPRAS");
     return $id[0][0];
}
    function RegistrarCompras($data){
        $stm=$this->db->insert('COMPRAS',$data);
        return $stm;
      }
     	public function lasdidcomp()
	{
		 $codigoCompra = $this->db->lastInsertId(); //Recuperamos el código de la Venta
		return $codigoCompra;
	}
      function devolver_stock_producto($data){
        $stock=$this->db->select('SELECT STOCK FROM PRODUCTO WHERE CODIGO_PRODUCTO=:CODIGO',$data);
        return $stock[0];
      }
      function registrar_detalle($detalle){
        $stm=$this->db->insert('detalle_compras',$detalle);
        $consulta=$this->db->prepare("SELECT STOCK FROM PRODUCTO WHERE CODIGO_PRODUCTO=:CODIGO");
        $consulta->execute(array('CODIGO'=>$detalle['CODIGO_PRODUCTO']));
        $stock=$consulta->fetch(PDO::FETCH_ASSOC);
        $nuevoStock=$stock['STOCK']+$detalle['CANTIDAD'];
  
        $sth=$this->db->prepare("UPDATE PRODUCTO SET STOCK=:STOCK WHERE CODIGO_PRODUCTO=:CODIGO");
        $sth->execute(array('STOCK'=>$nuevoStock,'CODIGO'=>$detalle['CODIGO_PRODUCTO']));
  
        return $stm;
      }

      function last_id(){
        $id=$this->db->select('SELECT CODIGO_COMPRAS FROM compras ORDER BY CODIGO_COMPRAS DESC LIMIT 1');
        return $id[0][0];
      }
      function lastId(){
        $id=array();
        $stm=$this->db->prepare("SELECT MAX(CODIGO_COMPRAS) AS ID FROM COMPRAS ");
        $stm->execute();
        if($row=$stm->fetch(PDO::FETCH_ASSOC)){
            $id=array(
                "ID"=>$row["ID"]
            );
        }
        return $id;
      }
  
    
 }








?>