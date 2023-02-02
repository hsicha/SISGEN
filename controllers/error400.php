<?php
class Error400 extends Controller{
function __construct()
{
    parent::__construct();
}
function index(){
    $this->view->title="Error";
   $this->view->renderAdmin('error400/index');
}
}

?>