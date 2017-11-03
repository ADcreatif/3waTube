<?php


$message = "";

try {

    if (!array_key_exists('id', $_GET) OR empty($_GET['id']))
        throw new DomainException('ID video invalide');


    // selection de la bonne video
        $video = new VideoModel($_GET['id']);

        $video->setSize(VideoModel::FULL_WIDTH);

        // configuration de la video
        $video->setOptions(0, 1, 0);

    /*
        $youtubeAPI = new YoutubeAPI();
        $video = $youtubeAPI->getVideoById($_GET['id']);*/

} catch (DomainException $exception) {
    $message = $exception->getMessage();
}

