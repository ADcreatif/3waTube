<?php


$message = "";

try {


    if (!array_key_exists('id', $_GET) OR empty($_GET['id']))
        throw new DomainException('ID video invalide');


    // selection de la bonne video
    $video = new VideoModel($_GET['id']);
    $video->setOptions(0, 1, 0);


    if (array_key_exists('vote', $_GET)) {
        $video->set_rating($_GET['vote']);
        echo $video->get_rate();
        exit;
    }


} catch (DomainException $exception) {
    $message = $exception->getMessage();
}

