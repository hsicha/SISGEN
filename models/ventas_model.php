<?php

class Ventas_Model extends Model{
    function __construct(){
        parent::__construct();
        $this-> autocomplete=array();
    }
    function autocompletarProd($data){
        $stm =$this->db->prepare("");

    }
}

?>