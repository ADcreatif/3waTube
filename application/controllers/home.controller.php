<?php

// Appel de la méthode statique getAllVideos()
$videosByAge = VideoModel::getAllVideos(6);
$videosByRating = VideoModel::getAllVideos(6, 'rating');
