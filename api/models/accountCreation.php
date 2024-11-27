<?php

session_start();

require_once("./models/BdBase.php");

class AccountCreation extends BdBase
{
    private $username;
    private $password;
    private $age;
    private $email;
    private $req;
    private $data;
    private $uid;

    public function __construct($param)
    {
        parent::__construct();

        foreach ($param as $key => $value) {
            // Assigner la valeur de $param à la propriété de l'objet
            $this->$key = $value;
        }

        // pour le POST
        $data = array(
            "username",
            "password",
            "email",
            "age"
        );

        foreach ($data as $element) {
            if (isset($_POST[$element])) {
                $this->{$element} = $_POST[$element];
            }
        }
        $this->uid = $this->uid();
    }

    public function creation()
    {
        $this->req = "INSERT INTO users (username, uid, mail, first_name, last_name, password, age)
                    VALUES (:username, :uid ,:email, 'testPrenom', 'testNom', :password, :age);";

        $stmt = $this->conn->prepare($this->req);

        $this->password = password_hash($this->password, PASSWORD_DEFAULT);

        $stmt->bindParam(':uid', $this->uid);
        $stmt->bindParam(':username', $this->username);
        $stmt->bindParam(':password', $this->password);
        $stmt->bindParam(':email', $this->email);
        $stmt->bindParam(':age', $this->age);

        $this->prepaQuery($stmt);
        return $this->data;
    }

    public function email()
    {
        $this->req = "SELECT EXISTS (SELECT 1 FROM `users` WHERE mail = :email) AS email_exists;";

        $stmt = $this->conn->prepare($this->req);

        $stmt->bindParam(':email', $this->email);

        $this->prepaQuery($stmt);
        return $this->data;
    }

    public function uid()
    {
        do {
            // Génération d'un uid aléatoire de 10 chiffres
            $randomUid = random_int(0000000000, 9999999999);

            // Requête pour vérifier si le uid existe déjà
            $this->req = "SELECT COUNT(*) as count FROM `users` WHERE uid = :uid";
            $stmt = $this->conn->prepare($this->req);
            $stmt->bindParam(':uid', $randomUid);
            $stmt->execute();

            // Vérification de l'existence
            $result = $stmt->fetch(PDO::FETCH_ASSOC);
        } while ($result['count'] > 0); // Répéter si le uid existe déjà

        return $randomUid;
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
