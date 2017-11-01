<?php

class VideoModel {

    const FULL_WIDTH = 0;
    const LARGE_WIDTH = 1;
    const MEDIUM_WIDTH = 2;

    public $id;
    public $title;
    private $length;
    private $relatedVideos = false;
    private $showTitle;
    private $displayCommand;
    // private $description;
    // private $date;
    // private $comment;

    function __construct($id) {
        $this->id = $id;

        // on va tenter de récupérer la video et sinon d'afficher un message d'erreur
        if ($this->getVideo() == false)
            throw new DomainException('La video est introuvable');

    }

    function getVideo() {
        global $videos;

        $videoFound = false;

        foreach ($videos as $video) {

            // si on trouve la vidéo (les ID coïncident)
            if ($video['id'] == $this->id) {

                // on défini les propriétés
                $this->title = $video['title'];
                $this->length = $video['length'];

                // la video à été trouvé
                $videoFound = true;

                // dès qu'on a trouvé l'ID on sort du foreach
                break;
            }
        }

        return $videoFound;

    }

    function setSize($size) {

    }
}

/*
 *  <iframe
            width="100%"
            height="455"
            src="https://www.youtube.com/embed/<?=$video_datas['id']?>?rel=0"
            frameborder="0"
            allowfullscreen>
    </iframe>
 */