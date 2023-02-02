<?php
class DataBase extends PDO{
    public function __construct($DB_TYPE,$DB_HOST,$DB_NAME,$DB_USER,$DB_PASS,$OPCIONES)
	{
		parent:: __construct($DB_TYPE.':host='.$DB_HOST.';dbname='.$DB_NAME,$DB_USER,$DB_PASS,$OPCIONES);
		parent:: setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
	}

	public function select($sql, $array = array(), $fetchMode = PDO::FETCH_NUM)
    {
        $sth = $this->prepare($sql);
        foreach ($array as $key => $value) {
            $sth->bindValue("$key", $value);
        }

        $sth->execute();
        return $sth->fetchAll($fetchMode);
    }
    
    public function findById($sql)
    {
    	$stm = $this->prepare($sql);
    	$stm->execute();
    	
    	return $stm->fetch(PDO::FETCH_ASSOC);
    }

    public function insert($table, $data)
    {
        ksort($data);
        $fieldNames = implode('`, `', array_keys($data));
        $fieldValues = ':' . implode(', :', array_keys($data));
        $sth = $this->prepare("INSERT INTO $table (`$fieldNames`) VALUES ($fieldValues)");
        foreach ($data as $key => $value) {
            $sth->bindValue(":$key", $value);
        }
        $stm = $sth->execute();
        return $stm;
    }
    public function update($table, $data, $where)
    {
        $fieldDetails = NULL;
        foreach($data as $key=> $value) {
            $fieldDetails .= "`$key`=:$key,";
        }
        $fieldDetails = rtrim($fieldDetails, ',');
        $sth = $this->prepare("UPDATE $table SET $fieldDetails WHERE $where");
        foreach ($data as $key => $value) {
            $sth->bindValue(":$key", $value);
        }
        $stm = $sth->execute();
        return $stm;        
    }

    public function delete($table, $where, $limit = 1)
    {
        return $this->exec("DELETE FROM $table WHERE $where LIMIT $limit");
    }
    
    public function _query($sql)
    {
        return $this->exec($sql);
    }

    public function permissions($array = array(), $fetchMode = PDO::FETCH_ASSOC)
    {
        $sql = 'SELECT
                    IF(SUM(consultar) >= 1, 1,0) AS consultar,
                    IF(SUM(agregar) >= 1, 1,0) AS agregar,
                    IF(SUM(editar) >= 1, 1,0) AS editar,
                    IF(SUM(eliminar) >= 1, 1,0) AS eliminar
                FROM PERFIL_RECURSO
                WHERE CODIGO_RECURSO = :CODIGO_RECURSO
                AND CODIGO_PERFIL IN (/* SELECCIONO LOS PERFILES DEL USUARIO*/
                    SELECT CODIGO_PERFIL
                    FROM USUARIO_PERFILES
                    WHERE CODIGO_USUARIO = :CODIGO_USUARIO
                )
                GROUP BY CODIGO_RECURSO';

        $sth = $this->prepare($sql);
        foreach ($array as $key => $value) {
            $sth->bindValue("$key", $value);
        }

        $sth->execute();
        return $sth->fetchAll($fetchMode);
    }
}

?>