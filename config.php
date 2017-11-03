<?php


// URL
define('ROOT', $_SERVER['SERVER_NAME'] . str_replace('index.php', '', $_SERVER['SCRIPT_NAME']));

// database
define('DB_NAME', '3watube');
define('DB_HOST', 'localhost');
define('DB_USER', 'root');
define('DB_PASS', '');

// youtube
define('YOUTUBE_API_KEY', 'AIzaSyDS1xOilF31J3yXKBwHoc4EoUn5aJCZnJw');

// mode debug
define('DEBUG_MODE', true);


if (DEBUG_MODE == false) {
    ini_set('display_errors', 0);
    ini_set('display_startup_errors', 0);
    error_reporting(0);
}


// permet d'inclure automatiquement les classes lors de leur instanciation
spl_autoload_register(function ($className) {
    if (substr($className, -5) == "Model")
        include "application/models/$className.php";
    else
        include "application/classes/$className.php";
});


require("vendor/autoload.php");


session_start();