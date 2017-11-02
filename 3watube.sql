-- MySQL dump 10.13  Distrib 5.7.14, for Win64 (x86_64)
--
-- Host: localhost    Database: 3watube
-- ------------------------------------------------------
-- Server version	5.7.14

/*!40101 SET @OLD_CHARACTER_SET_CLIENT = @@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS = @@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION = @@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE = @@TIME_ZONE */;
/*!40103 SET TIME_ZONE = '+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS = @@UNIQUE_CHECKS, UNIQUE_CHECKS = 0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS = @@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS = 0 */;
/*!40101 SET @OLD_SQL_MODE = @@SQL_MODE, SQL_MODE = 'NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES = @@SQL_NOTES, SQL_NOTES = 0 */;

--
-- Table structure for table `videos`
--

DROP TABLE IF EXISTS `videos`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `videos` (
  `id`        INT(11)      NOT NULL AUTO_INCREMENT,
  `reference` CHAR(11)     NOT NULL,
  `title`     VARCHAR(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `reference` (`reference`),
  FULLTEXT KEY `title` (`title`)
)
  ENGINE = MyISAM
  AUTO_INCREMENT = 12
  DEFAULT CHARSET = utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `videos`
--

LOCK TABLES `videos` WRITE;
/*!40000 ALTER TABLE `videos`
  DISABLE KEYS */;
INSERT INTO `videos`
VALUES (1, 'cTdPjv0WYe0', 'Nutella Pizza recipe | How to make Nutella and Banana Pizza | Dessert Pizza'),
  (2, 'MFmr_TZLpS0', 'Dr. Jean\'s Banana Dance - (aka The Guacamole Song) - Dr. Jean\'s Banana Dance'),
  (3, 'Ldg8T7va41E', 'GAUFRES de Bruxelles VS Gaufres de Liège - VLOG #243'),
  (4, 'kzAZ0kR2B1Q', 'Cucurbitacée - Michel l\'ingénieur informaticien'),
  (5, 'JEW_D5BJfo0', 'HOW TO MAKE AN ARGENTINIAN ASADO | DIY BBQ'),
  (6, 'j7IL-E5WlGk', 'IDÉE REÇUE #5 : La tomate (feat. Igor & Grichka BOGDANOV)'),
  (7, 'UTdJSjzAEFA', 'Poisson! voiture'), (8, '8fSbHbvtCUg', 'Les Inconnus - Les pétasses'),
  (9, 'YOTW00TE-OA', 'CHOCHO LAPIN (tube ete 2016)'), (10, 'GaSjwAu3yrI', 'Coke and Lava Nikon D800 and Gopro'),
  (11, 'j9xl5dBWsz8', 'Rugby Fails 2017');
/*!40000 ALTER TABLE `videos`
  ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE = @OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE = @OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS = @OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS = @OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT = @OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS = @OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION = @OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES = @OLD_SQL_NOTES */;

-- Dump completed on 2017-11-02 22:02:35
