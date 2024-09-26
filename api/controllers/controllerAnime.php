<?php
class ControllerAnime
{
    private $paramGet;
    private $url;
    private $reqAnime;

    public function __construct($param, $url)
    {
        $this->paramGet = $param;
        $this->url = $url;
    }

    public function controller(): mixed
    {
        require_once ("./models/anime.php");
        $this->queryAnime = new Anime(param: $this->paramGet);

        switch ($this->url[1]) {
            case "read":
                $response = $this->queryAnime->Allanime();
                break;

            default:
                throw new Exception(message: "Erreur de requete.");
        }
        return $response;

    }
}
?>