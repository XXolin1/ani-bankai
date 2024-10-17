<?php
header("Access-Control-Allow-Origin: *"); // ressource accessible par n'importe quelle origine.
header("Content-Type: application/json"); // corps de la réponse au format JSON
header("Access-Control-Allow-Methods: GET,HEAD,OPTIONS,POST,PUT");
header("Access-Control-Allow-Headers: Origin, X-Requested-With, Content-Type, Accept, Authorization");

$_POST = json_decode(file_get_contents("php://input"), true);

try {

    if (!empty($_GET['demande'])) {


        $url = explode("/", filter_var($_GET['demande'], FILTER_SANITIZE_URL));
        $parametreGet = []; // pour get


        foreach ($_GET as $key => $value) { // pour les parametres des requetes get
            if ($key != "demande") {
                $parametreGet[$key] = $value;
            }
        }

        switch ($url[0]) {

            case "creation":
                require_once ("./models/accountCreation.php");
                $reqCreation = new AccountCreation(); 
                $Creation = $reqCreation->creation(); 
                CheckConnexion($Creation);
                exit(0);

            case "connexion":
                require_once ("./models/session.php");
                $reqConnexion = new Authentication();
                $Connexion = $reqConnexion->connexion(); 
                CheckConnexion($Connexion);
                exit(0);


            case "entreprises":
                require_once ("./controllerEntreprise.php");
                $reqEntreprise = new ControllerEntreprise($parametreGet, $url);
                $response = $reqEntreprise->controller();
                sendResponse($response);
                break;

                
            case "animes":
                require_once ("./controllers/controllerAnime.php");
                $queryAnime = new ControllerAnime($parametreGet, $url);
                $response = $queryAnime->controller();
                sendResponse($response);
                break;


            default:
                throw new Exception("La demande n'est pas valide, vérifiez l'url");

        }
    } else {
        throw new Exception("Problème de récupération de données.");
    }
} catch (Exception $e) {
    $erreur = [         // message d'erreur
        "message" => $e->getMessage(),
        "code" => $e->getCode()
    ];
}

function sendResponse($response)
{
    echo json_encode($response, JSON_UNESCAPED_UNICODE); // encode en prenant en compte les caractères unicode.
}

function CheckConnexion($Connexion)
{
    echo $Connexion ? "true" : "false";
}