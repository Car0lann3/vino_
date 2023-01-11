<?php

class Bouteille
{
    public function accueil()
    {
        $bte = new BouteilleModel();
        $data = $bte->getListeBouteilleCellier();
        include("vues/entete.php");
        include("vues/cellier.php");
        include("vues/pied.php");    
    }
    

    public function listeBouteille()
    {
        $bte = new BouteilleModel();
        $cellier = $bte->getListeBouteilleCellier();

        echo json_encode($cellier);         
    }
    
    public function nouvelleBouteilleCellier()
    {
        include("vues/entete.php");
        include("vues/ajouter.php");
        include("vues/pied.php");
    }
    public function ajouterBouteilleCellier()
    {
   
        $bte = new BouteilleModel();
        $cellier = $bte->ajouterBouteilleCellier($_POST);
        header("Location: /accueil");
    }
    
}