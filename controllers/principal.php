<?php

class Principal extends Controller{

    function __construct()
    {
        parent::__construct();
    }
    public function index(){
        $this->view->title="Página Principal";
        $this->view->renderAdmin('principal/index');
    }
}

?>