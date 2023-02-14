<?php
class Ventas extends Controller{
    function __construct(){
        parent::__construct();
    }
    function index(){
        $this->view->title="Ventas";
        $this->view->renderAdmin("ventas/index");
        
    }
}

?>