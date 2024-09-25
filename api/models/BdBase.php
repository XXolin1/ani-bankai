<?php

class BdBase {

    private const DBHOST = "localhost";
    private const DBUSER = "root";
    private const DBPASS = "";
    private const DBNAME = "bojob";
    //private $charset = "utf8";
    //private $login;
    //private $password;

    private $dsn = 'mysql:host=' . self::DBHOST . ';dbname=' . self::DBNAME . '';
	  // conn variable
	protected $conn = null;

    protected $db = null;

    

    public function __construct() {

        try {
            $this->conn = new PDO($this->dsn, self::DBUSER, self::DBPASS);
            $this->conn->setAttribute(PDO::ATTR_DEFAULT_FETCH_MODE, PDO::FETCH_ASSOC);
            $this->conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
            //var_dump($this->conn);
          } catch (PDOException $e) {
            die('Connectionn Failed : ' . $e->getMessage());
          }
        }
  
}
?>