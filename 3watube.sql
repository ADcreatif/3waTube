-- phpMyAdmin SQL Dump
-- version 4.6.4
-- https://www.phpmyadmin.net/
--
-- Client :  127.0.0.1
-- Généré le :  Ven 03 Novembre 2017 à 12:02
-- Version du serveur :  5.7.14
-- Version de PHP :  5.6.25

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT = @@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS = @@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION = @@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `3watube`
--

-- --------------------------------------------------------

--
-- Structure de la table `ratings`
--

CREATE TABLE `ratings` (
  `id`        INT(10) UNSIGNED NOT NULL,
  `videos_id` INT(10) UNSIGNED NOT NULL,
  `rate`      INT(1) UNSIGNED  NOT NULL,
  `user_id`   INT(10) UNSIGNED NOT NULL
)
  ENGINE = InnoDB
  DEFAULT CHARSET = utf8;

--
-- Contenu de la table `ratings`
--

INSERT INTO `ratings` (`id`, `videos_id`, `rate`, `user_id`) VALUES
  (1, 1, 5, 1),
  (2, 1, 1, 2),
  (4, 1, 4, 3);

-- --------------------------------------------------------

--
-- Structure de la table `videos`
--

CREATE TABLE `videos` (
  `id`        INT(11) UNSIGNED NOT NULL,
  `reference` CHAR(11)         NOT NULL,
  `title`     VARCHAR(100)     NOT NULL
)
  ENGINE = InnoDB
  DEFAULT CHARSET = utf8;

--
-- Contenu de la table `videos`
--

INSERT INTO `videos` (`id`, `reference`, `title`) VALUES
  (1, 'cTdPjv0WYe0', 'Nutella Pizza recipe | How to make Nutella and Banana Pizza | Dessert Pizza'),
  (2, 'MFmr_TZLpS0', 'Dr. Jean\'s Banana Dance - (aka The Guacamole Song) - Dr. Jean\'s Banana Dance'),
  (3, 'Ldg8T7va41E', 'GAUFRES de Bruxelles VS Gaufres de Liège - VLOG #243'),
  (4, 'kzAZ0kR2B1Q', 'Cucurbitacée - Michel l\'ingénieur informaticien'),
  (5, 'JEW_D5BJfo0', 'HOW TO MAKE AN ARGENTINIAN ASADO | DIY BBQ'),
  (6, 'j7IL-E5WlGk', 'IDÉE REÇUE #5 : La tomate (feat. Igor & Grichka BOGDANOV)'),
  (7, 'UTdJSjzAEFA', 'Poisson! voiture'),
  (8, '8fSbHbvtCUg', 'Les Inconnus - Les pétasses'),
  (9, 'YOTW00TE-OA', 'CHOCHO LAPIN (tube ete 2016)'),
  (10, 'GaSjwAu3yrI', 'Coke and Lava Nikon D800 and Gopro'),
  (11, 'j9xl5dBWsz8', 'Rugby Fails 2017');

--
-- Index pour les tables exportées
--

--
-- Index pour la table `ratings`
--
ALTER TABLE `ratings`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `videos_id` (`videos_id`, `user_id`) USING BTREE;

--
-- Index pour la table `videos`
--
ALTER TABLE `videos`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `reference` (`reference`);
ALTER TABLE `videos`
  ADD FULLTEXT KEY `title` (`title`);

--
-- AUTO_INCREMENT pour les tables exportées
--

--
-- AUTO_INCREMENT pour la table `ratings`
--
ALTER TABLE `ratings`
  MODIFY `id` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  AUTO_INCREMENT = 5;
--
-- AUTO_INCREMENT pour la table `videos`
--
ALTER TABLE `videos`
  MODIFY `id` INT(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  AUTO_INCREMENT = 12;
--
-- Contraintes pour les tables exportées
--

--
-- Contraintes pour la table `ratings`
--
ALTER TABLE `ratings`
  ADD CONSTRAINT `ratings_ibfk_1` FOREIGN KEY (`videos_id`) REFERENCES `videos` (`id`)
  ON DELETE CASCADE
  ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT = @OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS = @OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION = @OLD_COLLATION_CONNECTION */;
