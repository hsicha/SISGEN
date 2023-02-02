<?php
class Model{
    function __construct(){
        $opciones=array(PDO::MYSQL_ATTR_INIT_COMMAND=>'SET NAMES utf8');
        $this->db=new DataBase(DB_TYPE,DB_HOST,DB_NAME,DB_USER,DB_PASSWORD,$opciones);
    }
}



?>