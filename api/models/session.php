<?php
session_start();
//var_dump($_SESSION);
require_once("./class/BdBase.php");

class Authentication extends BdBase 
{

    private $username;
    private $password;
    private $req;
    private $data;


    public function __construct()
    {
        parent::__construct();

        header("Content-type: text/plain");
    }

    public function connexion()
    {
        if (!isset($_POST["login"])) {
            exit(0);
        }

        if (!isset($_POST["password"])) {
            exit(0);
        }

        $this->username = $_POST["login"];
        $this->password = $_POST["password"]; // voir password_hash pour cryptage.

        

        if ($this->Login()) {
            //var_dump($this->username, $this->password);
            // Authentification reussie, vous pouvez rediriger l'utilisateur vers une page securisee, par exemple.
            $_SESSION['login'] = $this->username;
            
            return true;

        } else {
            // Authentification echouee
            
            return false;
        }
    }


    private function Login() {
        $this->req = "SELECT * FROM utilisateur WHERE login_=:username;"; // a modif
        $stmt = $this->conn->prepare($this->req);

        try {
            $stmt->execute([':username' => $this->username]);
        } catch (PDOException $e) {
            echo "Erreur lors de l'exécution de la requête : " . $e->getMessage();
        }
        
        // Vérifier s'il y a un utilisateur avec ce nom d'utilisateur
        $user = $stmt->fetch();
        if (!$user) {
            
            return false; // Aucun utilisateur trouvé avec ce nom d'utilisateur
        }
        
        // Verifier si le mot de passe est correct
        if ($this->password === $user['Mot_de_passe']) {
            // Authentification réussie
            $_SESSION['type_utilisateur'] = $user['type_utilisateur'];
            $this->data = $user;
            return true;
        } else {
            // Mot de passe incorrect
            
            return false;
        }
    }
}



