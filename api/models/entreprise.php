<?php

session_start();
/* cree class bdd autre fichier */

require_once ("./class/BdBase.php");
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

class Entreprise extends BdBase
{

    // variable
    private $req;
    private $data;

    private $nom = null;// update + normal
    private $secteur = NULL;
    private $ville = null;
    private $offre = null;
    private $place_offre = null;
    private $salaire = null;
    private $etat = null;
    private $chemin_logo = null;
    private $chemin_baniere = null;
    private $ID_secteur = null;
    private $ID_ville = null;
    private $ID_entreprise = null;// update
    private $description = null;  // update
    private $CA = null;// update
    private $mail = null;// update
    private $site = null;// update
    private $collaborateurs = null;// update
    private $creation = null;// update
    private $note = null;// update

    // constructeur

    public function __construct($param)
    {
        parent::__construct();

        foreach ($param as $key => $value) {
            // Assigner la valeur de $param à la propriété de l'objet
            $this->$key = $value;

        }

        // pour le POST

        $data = array(
            "ID_entreprise",
            "nom",
            "mail",
            "site",
            "collaborateurs",
            "creation",
            "CA",
            "description",
            "ID_ville",
            "ID_secteur",
            "note"
        );

        foreach ($data as $element) {
            if (isset ($_POST[$element])) {
                $this->{$element} = $_POST[$element];
            }
        }
    }

    // méthode de requete
    public function Read()
    {
        $this->req = "SELECT secteur.ID_secteur, ville.ID_ville, entreprise.ID_entreprise, AVG(evaluation.note) AS moyenne_note, COUNT(candidature.ID_candidature) AS nb_candidature, entreprise.chemin_logo, entreprise.chemin_banniere, YEAR(entreprise.date_creation) AS date_creation, entreprise.CA, entreprise.nb_collab, entreprise.mail, ville.adresse, entreprise.Web, entreprise.nom_entreprise, secteur.activite, ville.nom_ville, entreprise.description_ 

        FROM entreprise
        LEFT JOIN possede ON possede.ID_entreprise = entreprise.ID_entreprise
        LEFT JOIN evaluation ON evaluation.ID_entreprise = entreprise.ID_entreprise
        LEFT JOIN secteur ON possede.ID_secteur = secteur.ID_secteur
        LEFT JOIN localise ON localise.ID_entreprise = entreprise.ID_entreprise
        LEFT JOIN ville ON ville.ID_ville = localise.ID_ville
        LEFT JOIN offre_stage ON offre_stage.ID_entreprise = entreprise.ID_entreprise
        LEFT JOIN candidature ON candidature.ID_stage = offre_stage.ID_stage
        WHERE
        (:nom IS NULL OR entreprise.nom_entreprise LIKE CONCAT('%',:nom,'%')) AND
        (:secteur IS NULL OR secteur.ID_secteur = :secteur) AND
        (:ville IS NULL OR ville.ID_ville = :ville) AND
        (:offre IS NULL OR offre_stage.nom_stage = :offre) AND
        (:place_offre IS NULL OR offre_stage.place_etudiant = :place_offre) AND
        (:salaire IS NULL OR offre_stage.salaire = :salaire) AND
        ('1' IS NULL OR entreprise.etat = '1')
        GROUP BY entreprise.nom_entreprise, offre_stage.nom_stage";

        $stmt = $this->conn->prepare($this->req);

        $stmt->bindParam(':nom', $this->nom);
        $stmt->bindParam(':secteur', $this->secteur);
        $stmt->bindParam(':ville', $this->ville);
        $stmt->bindParam(':offre', $this->offre);
        $stmt->bindParam(':place_offre', $this->place_offre);
        $stmt->bindParam(':salaire', $this->salaire);

        $this->prepaRequete($stmt);
        return $this->data;
    }


    // méthode appelé par la méthode requete afin de fonctionner.
    public function prepaRequete($stmt)
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
