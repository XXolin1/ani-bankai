<?php
abstract class Controller
{
    public function render(string $fichier, array $data = [])
    {
        // Extract des données pour les rendre accessibles directement dans le template
        extract($data);
    
        // Initialisation de Smarty (moteur de template)
        require_once ('Smarty/libs/Smarty.class.php');  
        $smarty = new Smarty;
        $smarty->caching = true; // Activation du caching pour améliorer les performances
        $smarty->cache_lifetime = 1; // Durée de vie du cache (en secondes)
        $smarty->template_dir = 'views/templates'; // Répertoire des fichiers de template
        $smarty->compile_dir = 'views/templates_c'; // Répertoire des fichiers compilés
    
        try {
            // Affichage du template avec Smarty
            $smarty->display(ROOT . "views/" . strtolower(get_class($this)) . "/" . $fichier . ".tpl");
        } catch(SmartyException $e) {
            // En cas d'erreur Smarty, rediriger vers une page de déconnexion
            require_once(ROOT.'/views/logout/logout.php');
        }
    
        //$content = ob_get_clean();
    }


    /*
    public function checkIfLoggedIn()                         // A voir comment la connexion est gere
    {
        header("Access-Control-Allow-Origin: *");
        if (!isset ($_SESSION['login'])) {
            header("Location: /login"); // redirection
            exit; // arrêt du script
        }
    }*/
}