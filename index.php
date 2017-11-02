<?php
include "config.php";
include "datas.php";


/////////////////// FRONT CONTROLLER /////////////////////////
// C'est l'entité responsable du choix des pages a afficher //
//////////////////////////////////////////////////////////////



// page par defaut
$page = "home";

// on cherche si une page en particulier est demandé
if (array_key_exists('page', $_GET)) {
    $page = $_GET['page'];
}

// si la page n'est pas trouvé on définie la page sur 404.phtml
if (!file_exists("www/$page.phtml")) {
    $page = 404;
}

if (file_exists("application/controllers/$page.controller.php")) {
    // chargement des controlleurs
    include "application/controllers/$page.controller.php";
}


// chargement des vues
include "www/layout.phtml";
