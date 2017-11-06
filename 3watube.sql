-- phpMyAdmin SQL Dump
-- version 4.6.4
-- https://www.phpmyadmin.net/
--
-- Client :  127.0.0.1
-- Généré le :  Lun 06 Novembre 2017 à 15:38
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
  (4, 1, 4, 3),
  (5, 1, 1, 207794),
  (6, 1, 1, 730224),
  (7, 1, 1, 96221),
  (8, 1, 1, 224304),
  (9, 6, 5, 364959),
  (10, 6, 5, 672973),
  (11, 9, 5, 260681),
  (12, 9, 5, 72235),
  (13, 9, 5, 668365),
  (14, 9, 1, 917297),
  (15, 9, 1, 150451),
  (16, 9, 1, 994720),
  (17, 9, 1, 955902),
  (18, 9, 1, 599822),
  (19, 9, 1, 23071),
  (20, 9, 1, 579010),
  (21, 9, 1, 160705),
  (22, 9, 5, 862396),
  (23, 9, 5, 706054),
  (24, 9, 5, 836700),
  (25, 1, 5, 811462),
  (26, 1, 5, 107391),
  (27, 1, 5, 473022),
  (28, 1, 5, 248687),
  (29, 1, 5, 280578),
  (30, 1, 5, 761291),
  (31, 1, 1, 826263),
  (32, 1, 5, 267578),
  (33, 1, 5, 542755),
  (34, 1, 5, 271423),
  (35, 1, 5, 743133),
  (36, 1, 5, 23193),
  (37, 1, 5, 29815),
  (38, 1, 5, 986022),
  (39, 1, 5, 553558),
  (40, 1, 5, 759490),
  (41, 1, 5, 167724),
  (42, 1, 5, 676879),
  (43, 1, 5, 732147),
  (44, 1, 5, 379394),
  (45, 1, 5, 268920),
  (46, 1, 5, 783721),
  (47, 1, 5, 883209),
  (48, 1, 5, 94146),
  (49, 1, 5, 696411),
  (50, 1, 5, 480743),
  (51, 1, 5, 501617),
  (52, 1, 5, 223052),
  (53, 1, 5, 568420),
  (54, 1, 5, 560607),
  (55, 1, 5, 262145),
  (56, 1, 5, 161804),
  (57, 1, 5, 553314),
  (58, 1, 5, 611389),
  (59, 1, 5, 701751),
  (60, 1, 5, 919647),
  (61, 1, 5, 481903),
  (62, 1, 5, 349914),
  (63, 1, 5, 133911),
  (64, 1, 5, 266113),
  (65, 1, 5, 445800),
  (66, 1, 5, 611175),
  (67, 1, 5, 236907),
  (68, 1, 5, 544799),
  (69, 1, 5, 435424),
  (70, 1, 5, 472839),
  (71, 1, 5, 719024),
  (72, 1, 5, 133087),
  (73, 1, 5, 697235),
  (74, 1, 5, 150817),
  (75, 1, 5, 947998),
  (76, 1, 5, 573150),
  (77, 1, 1, 536163),
  (78, 1, 1, 321624),
  (79, 1, 1, 636962),
  (80, 1, 1, 680694),
  (81, 1, 1, 681823),
  (82, 1, 1, 351776),
  (83, 1, 5, 927917),
  (84, 1, 5, 175994),
  (85, 1, 5, 825805),
  (86, 1, 5, 77056),
  (87, 1, 5, 447814),
  (88, 1, 5, 157318),
  (89, 1, 5, 411346),
  (90, 1, 5, 985961),
  (91, 1, 5, 777832),
  (92, 1, 5, 852539),
  (93, 1, 5, 422546),
  (94, 1, 5, 407257),
  (95, 1, 5, 979125),
  (96, 1, 1, 288970),
  (97, 1, 1, 840545),
  (98, 1, 1, 46447),
  (99, 1, 1, 803497),
  (100, 1, 1, 877136),
  (101, 1, 1, 910430),
  (102, 1, 1, 534088),
  (103, 1, 1, 11840),
  (104, 1, 1, 908294),
  (105, 1, 1, 192321),
  (106, 1, 1, 640838),
  (107, 1, 1, 98083),
  (108, 9, 5, 599090),
  (109, 9, 5, 318237),
  (110, 9, 5, 627105),
  (111, 9, 5, 778137),
  (112, 9, 5, 493774),
  (113, 9, 5, 885650),
  (114, 9, 5, 584533),
  (115, 9, 5, 59661),
  (116, 9, 5, 208007),
  (117, 9, 5, 549591),
  (118, 9, 5, 516540),
  (119, 9, 5, 960906),
  (120, 9, 1, 506225),
  (121, 6, 3, 37445),
  (122, 6, 1, 161376),
  (123, 6, 2, 104888),
  (124, 9, 1, 367614),
  (125, 9, 1, 977996),
  (126, 9, 4, 619018);

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
  AUTO_INCREMENT = 127;
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
