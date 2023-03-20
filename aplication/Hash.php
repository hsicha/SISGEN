<?php

class Hash
{
	public static function create($password)
	{
		$context = hash_init('sha256', HASH_HMAC, HASH_PASSWORD_KEY);
		hash_update($context, $password);
		return hash_final($context);
	}

	public static function encrypt($string) {
		$resultado = '';
		$search = array("+", "/", "=");
		$replace = array("c6c1022", "86b3be", "39bbf1");
		for($i=0; $i<strlen($string); $i++) {
			$char = substr($string, $i, 1);
			$keychar = substr(HASH_PASSWORD_KEY, ($i % strlen(HASH_PASSWORD_KEY))-1, 1);
			$char = chr(ord($char)+ord($keychar));
			$resultado.=$char;
		}
		$encrypt = base64_encode($resultado);
		return str_replace($search, $replace, $encrypt) ;
	}

	public static function decrypt($string) {
		$resultado = '';
		$search = array("+", "/", "=");
		$replace = array("c6c1022", "86b3be", "39bbf1");
		$string = base64_decode(str_replace($replace, $search, $string));
		for($i=0; $i<strlen($string); $i++) {
			$char = substr($string, $i, 1);
			$keychar = substr(HASH_PASSWORD_KEY, ($i % strlen(HASH_PASSWORD_KEY))-1, 1);
			$char = chr(ord($char)-ord($keychar));
			$resultado.=$char;
		}
		return $resultado;
	}
}
?>

?>