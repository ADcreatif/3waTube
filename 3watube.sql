-- phpMyAdmin SQL Dump
-- version 4.6.4
-- https://www.phpmyadmin.net/
--
-- Client :  127.0.0.1
-- Généré le :  Jeu 02 Novembre 2017 à 14:39
-- Version du serveur :  5.7.14
-- Version de PHP :  5.6.25

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";

--
-- Base de données :  `3watube`
--

-- --------------------------------------------------------

--
-- Structure de la table `videos`
--

DROP TABLE IF EXISTS `videos`;
CREATE TABLE `videos` (
  `id`        INT(11)      NOT NULL,
  `reference` CHAR(11)     NOT NULL,
  `title`     VARCHAR(100) NOT NULL
)
  ENGINE = MyISAM
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
-- AUTO_INCREMENT pour la table `videos`
--
ALTER TABLE `videos`
  MODIFY `id` INT(11) NOT NULL AUTO_INCREMENT,
  AUTO_INCREMENT = 12;