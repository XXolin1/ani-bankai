<?php

class BdBase {

    private const DBHOST = "localhost";
    private const DBUSER = "root";
    private const DBPASS = "";
    private const DBNAME = "ani-bankai";
    //private $charset = "utf8";
    //private $login;
    //private $password;

    private $dsn = 'mysql:host=' . self::DBHOST . ';dbname=' . self::DBNAME . '';
	  // conn variable
	protected $conn = null;

    protected $db = null;

    

    public function __construct() {

        try {
            $this->conn = new PDO(dsn: $this->dsn, username: self::DBUSER, password: self::DBPASS);
            $this->conn->setAttribute(attribute: PDO::ATTR_DEFAULT_FETCH_MODE, value: PDO::FETCH_ASSOC);
            $this->conn->setAttribute(attribute: PDO::ATTR_ERRMODE, value: PDO::ERRMODE_EXCEPTION);
            
          } catch (PDOException $e) {
            die('Connectionn Failed : ' . $e->getMessage());
          }
        }
  
}
