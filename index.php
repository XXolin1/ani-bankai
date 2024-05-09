<?php

//var_dump($_GET);

// On génère une constante contenant le chemin vers la racine publique du projet
define('ROOT', str_replace('index.php','',$_SERVER['SCRIPT_FILENAME']));

// On appelle le modèle et le contrôleur principaux
//require_once(ROOT.'app/Model.php');
require_once(ROOT.'app/Controller.php');

// On sépare les paramètres et on les met dans le tableau $params
$params = explode('/', $_GET['p']);

// Si au moins 1 paramètre existe
if($params[0] != ""){
    session_start();
    // On sauvegarde le 1er paramètre dans $controller en mettant sa 1ère lettre en majuscule
    $controller = ucfirst($params[0]);
    //var_dump($controller);

    // On sauvegarde le 2ème paramètre dans $action si il existe, sinon index
    $action = isset($params[1]) ? $params[1] : 'index';

    // On appelle le contrôleur
    require_once(ROOT.'controllers/'.$controller.'.php');

    // On instancie le contrôleur
    $controller = new $controller();

    if(method_exists($controller, $action)){
        unset($params[0]);
        unset($params[1]);
        call_user_func_array([$controller,$action], $params);
        // On appelle la méthode
        // $controller->$action();    
    }else{
        // On envoie le code réponse 404
        http_response_code(404);
        echo "Attention, votre page n'existe pas. J'imagine que mon chat a marché sur mon clavier et a tout cassé.";
    }
}else{
    header("Location: /ani-bankai/accueil");
    exit();
}