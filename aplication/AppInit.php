<?php

class AppInit{
    private $url = null;
    private $controller = null;

    private $controllerPath = 'controllers/';
    private $modelPath = 'models/';
    private $errorFile = 'error400.php';

    public function init()
    {
        $this->getUrl();
        
        if (empty($this->url[0])) {
            $this->loadDefaultController();
            return false;
        }

        $this->loadExistingController();
        $this->callControllerMethod();
    }

    private function getUrl()
    {
        $url = isset($_GET['url']) ? $_GET['url'] : null;
        $url = rtrim($url, '/');
        $url = filter_var($url, FILTER_SANITIZE_URL);
        $this->url = explode('/', $url);
    }

    private function loadDefaultController()
    {
        $file = $this->controllerPath . DEFAULT_CONTROLLER . ".php";
        if (file_exists($file)) {
            require_once $file;
            $namecontroller = strtoupper(substr(DEFAULT_CONTROLLER,0,1)).substr(DEFAULT_CONTROLLER,1);
            $this->controller = new $namecontroller();
            if (method_exists($this->controller, 'index')) {
                $this->controller->index();
            }else{
                $this->error();
            }
        }else{
            $this->error();
        }
    }

    private function loadExistingController()
    {
        $file = $this->controllerPath . $this->url[0] . '.php';

        if (file_exists($file)) {
            require $file;
            $this->controller = new $this->url[0];
            $this->controller->loadModel($this->url[0], $this->modelPath);
        } else {
            $this->error();
            return false;
        }
    }

    private function callControllerMethod()
    {
        $length = count($this->url);

        if ($length > 1) {
            if (!method_exists($this->controller, $this->url[1])) {
                $this->error();
            }
        }

        switch ($length) {
            case 5:
                //Controller->Method(Param1, Param2, Param3)
                $this->controller->{$this->url[1]}($this->url[2], $this->url[3], $this->url[4]);
                break;

            case 4:
                //Controller->Method(Param1, Param2)
                $this->controller->{$this->url[1]}($this->url[2], $this->url[3]);
                break;

            case 3:
                //Controller->Method(Param1, Param2)
                $this->controller->{$this->url[1]}($this->url[2]);
                break;

            case 2:
                //Controller->Method(Param1, Param2)
                
                $this->controller->{$this->url[1]}();
                break;

            default:
                if (!method_exists($this->controller, 'index')) {
                   $this->error();
                }
                $this->controller->index();
                break;
        }
    }

    private function error() {
        require_once $this->controllerPath . $this->errorFile;
        $this->controller = new Error400();
        $this->controller->index();
        exit;
    }
}



?>