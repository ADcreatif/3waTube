<?php
include "models/VideoModel.php";
include "datas.php";


// page par defaut
$page = "home";

// on cherche si une page en particulier est demandé
if (array_key_exists('page', $_GET)) {
    $page = $_GET['page'];
}

// chargement des controlleurs
include "controllers/$page.controller.php";

// chargement des vues
include "www/layout.phtml";
