<?php
class Utilisateur
{
    public function accueil()
    {
        $this->render('utilisateur/connexion.html');  
    }

    public function inscription()
    {   
        $this->render('utilisateur/inscription.html');  
    }

    public function deconnexion()
    {
        unset($_SESSION['utilisateur']);
        header("Location: /utilisateur/accueil"); 
    }

    public function creation()
    {
        $user = new UtilisateurModel();
        $user->creerUsager($_POST);
        header("Location: /utilisateur/accueil"); 
    }





          
    /**
     * Affiche la page demandée 
     *
     * @param  string $file_name
     * @param  object|object[]
     * @return void
     */
    public function render($file_name, $data = [])
    {
        $loader = new \Twig\Loader\FilesystemLoader(dirname(__DIR__) . '/template');
        $twig = new \Twig\Environment($loader, [
            'cache' => false
        ]);
        $twig->addGlobal('session', $_SESSION);
        echo $twig->render($file_name, $data);
    }
}



?>