<?php
class ControllerAccountCreation
{
    private $paramGet;
    private $url;
    private $reqCreation;

    public function __construct($param, $url)
    {
        $this->paramGet = $param;
        $this->url = $url;
    }

    public function controller(): mixed
    {
        require_once ("./models/accountCreation.php");
        $this->reqCreation = new AccountCreation(param: $this->paramGet);

        switch ($this->url[1]) {

            case "creation":
                $response = $this->reqCreation->creation();
                break;

            case "email":
                $response = $this->reqCreation->email();
                break;

            default:
                throw new Exception(message: "Erreur de requete.");
        }
        return $response;

    }
}
?>