<?php
class Accueil extends Controller{
    public function index(){
        $this->checkIfLoggedIn();
        $this->render("index");
    }
}