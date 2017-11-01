<?php


$message = "";

try {

    if (!array_key_exists('id', $_GET) OR empty($_GET['id']))
        throw new DomainException('ID video invalide');


    // selection de la bonne video
    $video = new VideoModel($_GET['id']);

    // configuration de la video
    $video->setSize(VideoModel::FULL_WIDTH);


} catch (DomainException $exception) {
    $message = $exception->getMessage();
}

