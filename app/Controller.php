<?php
abstract class Controller
{
    public function render(string $fichier, array $data = [])
    {
        extract($data);

        // On démarre le buffer
        
/*
        // Inistialisation de Smarty (moteur de template)
        require_once ('Smarty/libs/Smarty.class.php');

        $smarty = new Smarty;
        $smarty->caching = true;
        $smarty->cache_lifetime = 1; # 120 secondes
        $smarty->template_dir = 'views/templates';
        $smarty->compile_dir = 'views/templates_c';

        try {
            $smarty->display(ROOT . "views/" . strtolower(get_class($this)) . "/" . $fichier . ".tpl");
        } catch(SmartyException $e) {
            require_once(ROOT.'/views/logout/logout.php');
        }
*/
        //$content = ob_get_clean();

        //
    }

    public function checkIfLoggedIn()
    {
        header("Access-Control-Allow-Origin: *");
        if (!isset ($_SESSION['login'])) {
            header("Location: /login"); // redirection
            exit; // arrêt du script
        }
    }
}