<?php

class Usuario extends Controller{
    function __construct(){
        parent::__construct();
    }
    function index(){
        $this->view->title="Usuarios";
        $this->view->renderAdmin("usuario/index");
    }
}





?>