<?php

session_start();

require_once("./models/BdBase.php");

class AccountCreation extends BdBase {
    
        private $pseudo;
        private $password;
        private $age;
        private $email;
        private $req;
        private $data;

    public function __construct()
    {
        parent::__construct();

        header("Content-type: text/plain");
    }

    public function creation()
    {
        if (!isset($_POST["pseudo"], $_POST["password"], $_POST["email"], $_POST["age"])) {
            exit(0);
        }
        
        $this->pseudo = $_POST["pseudo"];
        $this->password = $_POST["password"];
        $this->email = $_POST["email"];
        $this->age = $_POST["age"];

        $this->req = "INSERT INTO users (pseudo, mail, first_name, last_name, password, age)
                    VALUES (:pseudo, :email, 'testPrenom', 'testNom', :password, :age);";

        $stmt = $this->conn->prepare($this->req);

        $stmt->bindParam(':pseudo', $this->pseudo);
        $stmt->bindParam(':password', $this->password);
        $stmt->bindParam(':email', $this->email);
        $stmt->bindParam(':age', $this->age);

        $this->prepaQuery($stmt);
        return $this->data;
    }

    public function prepaQuery($stmt)
    {
        try {
            $stmt->execute(); // execution de la requete.
        } catch (Exception $e) {
            var_dump($e);
        }
        $this->data = $stmt->fetchAll(PDO::FETCH_ASSOC);
        $stmt->closeCursor();
    }
}
