<?php
require("../vendor/autoload.php");
session_start();

$OAUTH2_CLIENT_ID = '56794647177-55guh7lv7uf7p8ndslgnnih3qfvpn9ni.apps.googleusercontent.com';
$OAUTH2_CLIENT_SECRET = '7D9QbRhTYkqy7Wr4CoiiNWvW';

$client = new Google_Client();
$client->setClientId($OAUTH2_CLIENT_ID);
$client->setClientSecret($OAUTH2_CLIENT_SECRET);

// création du code
$client->setScopes('https://www.googleapis.com/auth/youtube');
$redirect = filter_var('http://' . $_SERVER['HTTP_HOST'] . $_SERVER['PHP_SELF'], FILTER_SANITIZE_URL);
$client->setRedirectUri($redirect);

// vérification du code par $_GET
$tokenSessionKey = 'token-' . $client->prepareScopes();
if (isset($_GET['code'])) {
    if (strval($_SESSION['state']) !== strval($_GET['state'])) {
        die('The session state did not match.');
    }

    $client->authenticate($_GET['code']);
    $_SESSION[$tokenSessionKey] = $client->getAccessToken();
    header('Location: ' . $redirect);
}

// vérification du code par $_SESSION
if (array_key_exists($tokenSessionKey, $_SESSION)) {
    $client->setAccessToken($_SESSION[$tokenSessionKey]);
}

function initOAuthFlow() {
    global $client;
    // If the user hasn't authorized the app, initiate the OAuth flow
    $state = mt_rand();
    $client->setState($state);
    $_SESSION['state'] = $state;

    $authUrl = $client->createAuthUrl();
    echo 'Merci d\'<a href="' . $authUrl . '">authoriser l\'accès</a> avant de continuer.<p>';
}

//initOAuthFlow();

function getVideoInfos($videoId) {
    global $client;
    if (!$client->getAccessToken())
        die('non identifié');

    $youtube = new Google_Service_YouTube($client);
    $videos = $youtube->videos->listVideos("snippet", array(
        'id' => $videoId
    ));
    return $videos[0]->snippet;
}

$video = getVideoInfos("ERCECE-3x0g");


if ($video) { ?>
    <h1><?= $video->title ?></h1>
    <p><?= $video->description ?></p>
    <p><img src="<?= $video->thumbnails['default']['url'] ?>" ?></p>
<?php } ?>