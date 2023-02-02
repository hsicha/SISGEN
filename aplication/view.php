<?php
class View{
    public function __construct(){

    }
    public function renderLogin($nombre,$NoInclude=false)
    {
        if($NoInclude==true){
            require_once 'views/'.$nombre.'.php';

        }else{
            require_once 'views/app/header.php';
            $file="views/". $nombre. '.php';
            if(file_exists($file)){
                require_once 'views/'.$nombre. ".php";

            }
            require_once 'views/app/footer.php';
            
        }
    }
    public function renderAdmin($nombre , $NoInclude = false)
	{
		if($NoInclude == true){
			require_once 'views/'.$nombre.'.php';
		}else{
			require_once 'views/app/header.php';
			require_once 'views/'.$nombre.'.php';
			require_once 'views/app/footer.php';
		}
	}
    public function renderError()
	{
		require_once 'views/errorControllers/index.php';
	}
	
	//sybcodex for consult
	public function renderconsult($nombre , $NoInclude = false)
	{
		if($NoInclude == true){
			require_once 'views/'.$nombre.'.php';
		}else{
			
			require_once 'views/'.$nombre.'.php';
			
		}
	}

}



?>