<?php

class YoutubeAPI {

    private $client;

    function __construct() {
        $this->client = new Google_Client();
        $this->client->setDeveloperKey(YOUTUBE_API_KEY);
    }

    function getVideoById($videoId) {

        // Define an object that will be used to make all API requests.
        $youtube = new Google_Service_YouTube($this->client);

        $videos = $youtube->videos->listVideos("snippet", [
            'id' => $videoId
        ]);

        return $videos['items'][0];
    }
}


