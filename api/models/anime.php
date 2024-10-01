<?php

session_start();
/* cree class bdd autre fichier */

require_once ("./models/BdBase.php");
/*
function getConnexion(){ // a ajuster par rapport au host
    return new PDO("mysql:host=129.151.245.210;dbname=bojob;charset=utf8","bojob","D3sZaxBKdAwEzLxZ");
}*/
/*
function sendJSON($infos){ // fonction d'envoi en JSON.
    header("Access-Control-Allow-Origin: *"); // ressource accessible par n'importe quelle origine.
    header("Content-Type: application/json"); // corps de la réponse au format JSON
    echo json_encode($infos,JSON_UNESCAPED_UNICODE); // encode en prenant en compte les caractères unicode.
}*/

class Anime extends BdBase
{

    // variable
    private $req;
    private $data;

    // constructeur

    public function __construct($param)
    {
        parent::__construct();

        foreach ($param as $key => $value) {
            // Assigner la valeur de $param à la propriété de l'objet
            $this->$key = $value;

        }

        // pour le POST (non utilisé pour le moment)

        $data = array(

        );

        foreach ($data as $element) {
            if (isset ($_POST[$element])) {
                $this->{$element} = $_POST[$element];
            }
        }
    }

    // méthode de requete
    public function Allanime()
    {
        $this->req = "SELECT * FROM anime";

        $stmt = $this->conn->prepare($this->req);

        $this->prepaQuery($stmt);
        return $this->data;
    }


    // méthode appelé par la méthode requete afin de fonctionner.
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
