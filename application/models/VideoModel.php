<?php

class VideoModel {

    const FULL_WIDTH = 3;
    const LARGE_WIDTH = 2;
    const MEDIUM_WIDTH = 1;
    const SMALL_WIDTH = 0;

    public $reference;
    public $title;
    public $width;
    public $height;
    public $options;
    public $format;

    function __construct($reference) {
        $this->reference = $reference;
        $this->setSize();
        $this->setOptions();

        // on va tenter de récupérer la video et sinon d'afficher un message d'erreur
        $this->getVideo();
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

    function getVideo() {

        $db = new Database();
        $video = $db->fetchOne("SELECT title FROM videos WHERE reference = ?", [$this->reference]);

        if (empty($video))
            throw new DomainException('La video est introuvable');

        // on défini les propriétés
        $this->title = $video->title;
    }

    /**
     * Cette fonction peut être appelée de n'importe ou sans avoir à instancier
     * la classe VideoModel
     * @param int $amount
     * @return array
     */
    static function getAllVideos($amount = 6) {

        $db = new Database();

        return $db->fetchAll("SELECT reference, title FROM videos ORDER BY id DESC LIMIT $amount");

    }
}
