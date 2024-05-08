<?php

// pas besoin de loadModel car les models sont gere par l'api
class Accueil extends Controller{
    public function index(){ 
        $this->checkIfLoggedIn();
        $this->render("index");
    }
}