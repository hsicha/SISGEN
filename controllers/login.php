<?php

class Login extends Controller{
    function __construct(){
        parent::__construct();

    }
    function index(){
        $this->view->title="Iniciar Sesión";
        $this->view->renderLogin("login/index");
        
    }
}


?>