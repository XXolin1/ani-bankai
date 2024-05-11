<?php

// pas besoin de loadModel car les models sont gere par l'api
class Ani_page extends Controller{
    public function index(){ 
        //$this->checkIfLoggedIn();
        //var_dump("j'arrive ici");
        $this->render("index");
    }
}