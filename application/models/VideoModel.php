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

        $this->id = $db->fetchColumn('SELECT id FROM videos WHERE reference = ?', [$this->reference]);
        $this->rate = $this->get_rate();

        $this->rate = $this->rate ? $this->rate : 2.5;

        if ($this->id == null)
            throw new DomainException('La video est introuvable');

        // récupération des infos via l'API
        $video = $this->get_video_from_api($this->reference);;

        // on défini les propriétés
        $this->title = $video->snippet->title;
        $this->description = $video->snippet->description;
        $this->thumbnail = $video->snippet->thumbnails;

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
     * @param string $order_by [rating, videos_id,...]
     * @return array
     */
    static function getAllVideos($amount = null, $order_by = null) {

        $amount = $amount ? " LIMIT $amount " : '';
        $order_by = $order_by ? " ORDER BY $order_by DESC " : ' ORDER BY videos_id DESC ';

        $db = new Database();

        /*
         *  on fait une selection optionnelle avec les arguments transmi à la fonction
         *  la fonction IFNULL() de mysql permet de retourne une veleur par défaut
         *  si aucun résultat n'est trouvé dans la requête
         */

        return $db->fetchAll("
            SELECT reference, title, IFNULL(AVG(rate) , 2.5) AS rating
            FROM videos
                LEFT JOIN ratings ON videos.id = videos_id
            GROUP BY videos.id
            $order_by $amount
            ");
    }

    static function get_static_thumbnail_url($reference) {
        $client = new Google_Client();
        $client->setDeveloperKey(YOUTUBE_API_KEY);

        // Define an object that will be used to make all API requests.
        $youtube = new Google_Service_YouTube($client);

        $videos = $youtube->videos->listVideos("snippet", [
            'id' => $reference
        ]);
        return $videos[0]->snippet->thumbnails->default->url;
    }

    function set_rating($rate) {
        // simuler un id utilisateur
        $user_id = rand(0, 999999);

        $db = new Database();
        $sql = "INSERT INTO ratings (videos_id, rate, user_id) VALUES (?,?,?)";
        $db->query($sql, [$this->id, $rate, $user_id]);
    }
}
