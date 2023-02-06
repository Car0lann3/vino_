<?php
class CellierModel extends Modele {
    	    
    /**
     * requête INSERT d'un cellier (suite création du compte)
     *
     * @param  mixed $id_utilisateur
     * @return void
     */
    public function insertion($id_utilisateur)
    {
        $this->database->query('INSERT INTO cellier ', [ 
            'cel_nom' => "Cellier # $id_utilisateur",
            'cel_uti_id' => $id_utilisateur
        ]);
        
        return $this->database->getInsertId(); 
    }
    
    /**
     * requête SELECT d'un cellier
     *
     * @param  mixed $id_utilisateur
     * @return void
     */
    public function getCellier($id_utilisateur)
    {
        return $this->database->fetch('SELECT * FROM cellier WHERE cel_uti_id  = ?', $id_utilisateur);
    }

    public function getAllCelliers($id_utilisateur){
    
        return $this->database->fetchAll('SELECT * FROM cellier WHERE cel_uti_id  = ?', $id_utilisateur);
    }
    
        
    /**
     * requête AJOUT d'un nouveau cellier
     *
     * @param  mixed $id_utilisateur
     * @param  mixed $cel_nom
     * @return void
     */
    public function ajoutNouvCellier($id_utilisateur, $cel_nom) 
    {
        $this->database->query('INSERT INTO cellier', [
            'cel_nom' => $cel_nom,
            'cel_uti_id'=> $id_utilisateur
        ]);
    }
    
}

?>


