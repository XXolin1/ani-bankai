<?php
class ControllerEntreprise
{
    private $parametreGet;
    private $url;
    private $reqEntreprise;


    public function __construct($param, $url)
    {
        $this->parametreGet = $param;
        $this->url = $url;
    }

    public function controller()
    {
        require_once ("./class/entreprise.php");
        $this->reqEntreprise = new Entreprise($this->parametreGet);

        switch ($this->url[1]) {
            case "read":
                $response = $this->reqEntreprise->Read();
                break;

            default:
                throw new Exception("Erreur de requete.");
        }
        return $response;

    }
}
?>