<?php


class YoutubeAPI {

    private $client;

    function __construct() {

        $this->client = new Google_Client();
        $this->client->setClientId(OAUTH2_CLIENT_ID);
        $this->client->setClientSecret(OAUTH2_CLIENT_SECRET);

        // création du code
        $this->client->setScopes('https://www.googleapis.com/auth/youtube');
        $redirect = filter_var('http://' . $_SERVER['HTTP_HOST'] . $_SERVER['PHP_SELF'], FILTER_SANITIZE_URL);
        $this->client->setRedirectUri($redirect);

        // vérification du code par $_GET
        $tokenSessionKey = 'token-' . $this->client->prepareScopes();
        if (isset($_GET['code'])) {
            if (strval($_SESSION['state']) !== strval($_GET['state'])) {
                die('The session state did not match.');
            }

            $this->client->authenticate($_GET['code']);
            $_SESSION[$tokenSessionKey] = $this->client->getAccessToken();
            header('Location: ' . $redirect);
        }

        // vérification du code par $_SESSION
        if (array_key_exists($tokenSessionKey, $_SESSION)) {
            $this->client->setAccessToken($_SESSION[$tokenSessionKey]);
        }

        //$this->initOAuthFlow();

    }

    function initOAuthFlow() {
        // If the user hasn't authorized the app, initiate the OAuth flow
        $state = mt_rand();
        $this->client->setState($state);
        $_SESSION['state'] = $state;

        $authUrl = $this->client->createAuthUrl();
        echo 'Merci d\'<a href="' . $authUrl . '">authoriser l\'accès</a> avant de continuer.<p>';
    }


    function getVideoInfos($videoId) {
        if (!$this->client->getAccessToken())
            die('non identifié');

        $youtube = new Google_Service_YouTube($this->client);
        $videos = $youtube->videos->listVideos("snippet", array(
            'id' => $videoId
        ));
        return $videos[0]->snippet;
    }
}


