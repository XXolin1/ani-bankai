<?php

// pas besoin de loadModel car les models sont gere par l'api
class bankai_list extends Controller{
    public function index(){ 
        //$this->checkIfLoggedIn();
        //var_dump("j'arrive ici");
        $this->render("index");
    }
}