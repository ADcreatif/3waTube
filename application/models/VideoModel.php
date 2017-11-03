<?php

class VideoModel {

    const FULL_WIDTH = 3;
    const LARGE_WIDTH = 2;
    const MEDIUM_WIDTH = 1;
    const SMALL_WIDTH = 0;
    public $reference;
    public $title;
    public $description;
    public $thumbnail;
    public $width;
    public $height;
    public $options;
    public $format;
    public $rate;
    private $id;

    function __construct($reference) {
        $this->reference = $reference;
        $this->setSize();
        $this->setOptions();

        // on va tenter de récupérer la video et sinon d'afficher un message d'erreur
        $this->get_video();
    }

    function setSize($size = 1) {
        switch ($size) {
            case VideoModel::FULL_WIDTH  :
                $this->width = "100%";
                $this->height = '';
                $this->format = 'full-width';
                break;
            case VideoModel::LARGE_WIDTH  :
                $this->width = 960;
                $this->height = (9 / 16) * $this->width;
                $this->format = 'large-width';
                break;

            case VideoModel::SMALL_WIDTH  :
                $this->width = 420;
                $this->height = (9 / 16) * $this->width;
                $this->format = 'small-width';
                break;

            case VideoModel::MEDIUM_WIDTH  :
            default:
                $this->width = 560;
                $this->height = 315;
                $this->format = 'medium-width';
                break;
        }
    }

    function setOptions($showinfo = 1, $controls = 1, $rel = 1) {
        $this->options = "?showinfo=$showinfo&amp;controls=$controls&amp;rel=$rel";
    }

    function get_video() {

        // récupération des via la db
        $db = new Database();

        /* $sql = "
             SELECT videos.id as id, title, AVG(rate) AS rate
             FROM videos
             JOIN ratings ON videos.id = videos_id
             WHERE reference = ?
             GROUP BY title, videos.id
         ";*/

        $this->id = $db->fetchColumn('SELECT id FROM videos WHERE reference = ?', [$this->reference]);
        $this->rate = $this->get_rate();

        $this->rate = $this->rate ? $this->rate : 2.5;

        if ($this->id == null)
            throw new DomainException('La video est introuvable');


        // récupération des infos via l'API
        $video_api = $this->get_video_from_api($this->reference);


        // on défini les propriétés
        $this->title = $video_api->snippet->title;
        $this->description = $video_api->snippet->description;
        $this->thumbnail = $video_api->snippet->thumbnails;
    }

    function get_rate() {
        $db = new Database();
        return $db->fetchColumn('SELECT AVG(rate) FROM ratings WHERE videos_id = ?', [$this->id]);
    }

    function get_video_from_api($reference) {

        $client = new Google_Client();
        $client->setDeveloperKey(YOUTUBE_API_KEY);

        // Define an object that will be used to make all API requests.
        $youtube = new Google_Service_YouTube($client);

        $videos = $youtube->videos->listVideos("snippet", [
            'id' => $reference
        ]);

        return $videos['items'][0];
    }

    /**
     * Cette fonction peut être appelée de n'importe ou sans avoir à instancier
     * la classe VideoModel
     * @param int $amount
     * @return array
     */
    static function getAllVideos($amount = null) {

        $amount = $amount ? " LIMIT $amount " : '';

        $db = new Database();

        return $db->fetchAll("SELECT reference, title FROM videos ORDER BY id DESC $amount");

    }

    function set_rating($rate) {
        // simuler un id utilisateur
        $user_id = rand(0, 999999);

        $db = new Database();
        $sql = "INSERT INTO ratings (videos_id, rate, user_id) VALUES (?,?,?)";
        $db->query($sql, [$this->id, $rate, $user_id]);
    }

}
