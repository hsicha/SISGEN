<?php
class Cliente extends Controller{
    function __construct(){
        parent::__construct();
    }
    function index(){
        $this->view->title="Cliente";
        $this->view->renderAdmin("cliente/index");
    }
    
}


?>