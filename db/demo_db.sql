-- MySQL dump 10.13  Distrib 5.1.73, for redhat-linux-gnu (x86_64)
--
-- Host: localhost    Database: metadata_demo_client
-- ------------------------------------------------------
-- Server version	5.1.73

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Current Database: `metadata_demo_client`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `metadata_demo_client` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `metadata_demo_client`;

--
-- Table structure for table `channels`
--

DROP TABLE IF EXISTS `channels`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `channels` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `author` varchar(255) DEFAULT NULL,
  `contributor` varchar(255) DEFAULT NULL,
  `kind` varchar(255) DEFAULT 'periodic',
  `access` varchar(255) DEFAULT 'public',
  `export_metadata` int(11) DEFAULT '1',
  `category` varchar(255) DEFAULT '',
  `category_pt` varchar(255) DEFAULT '',
  `state` varchar(255) DEFAULT 'active',
  `removed_at` datetime DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `organization_id` int(11) DEFAULT NULL,
  `license` varchar(255) DEFAULT 'https://creativecommons.org/licenses/by-nc-nd/4.0/',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `channels`
--

LOCK TABLES `channels` WRITE;
/*!40000 ALTER TABLE `channels` DISABLE KEYS */;
INSERT INTO `channels` VALUES (1,'1zuim1svd7','FCCN test channel','Paulo Costa','Test User','periodic','public',1,'History','História','active',NULL,'2017-01-18 15:48:28','2017-01-18 15:48:28',1,'http://creativecommons.org/licenses/by/4.0/'),(2,'20mml6jear',' Web upload tests','FCT|FCCN',NULL,'periodic','federation',1,'Arts','Arte','active',NULL,'2017-07-11 09:43:43','2017-07-11 09:43:43',1,'http://creativecommons.org/licenses/by-nc-nd/4.0/'),(3,'3rwos83dwe','Some other channel','Test User',NULL,'periodic','public',0,'Other','Outro','active',NULL,'2018-01-24 11:58:19','2018-01-24 11:58:23',2,'https://creativecommons.org/licenses/by-nc-nd/4.0/');
/*!40000 ALTER TABLE `channels` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `clips`
--

DROP TABLE IF EXISTS `clips`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `clips` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) DEFAULT NULL,
  `title` varchar(255) DEFAULT '',
  `subtitle` varchar(255) DEFAULT '',
  `presenter` varchar(255) DEFAULT '',
  `location` varchar(255) DEFAULT '',
  `cover_image` varchar(255) DEFAULT NULL,
  `state` varchar(255) DEFAULT 'creating',
  `mime_type` varchar(255) DEFAULT NULL,
  `removed_at` datetime DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `channel_id` int(11) DEFAULT NULL,
  `published_at` datetime DEFAULT NULL,
  `license` varchar(255) DEFAULT NULL,
  `recording_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clips`
--

LOCK TABLES `clips` WRITE;
/*!40000 ALTER TABLE `clips` DISABLE KEYS */;
INSERT INTO `clips` VALUES (1,'10rs6qlv23','Sample Clip','This is a sample clip','Default presenter','FCT|FCCN','somecover.jpg','published','video/mp4',NULL,'2018-01-24 12:02:26',NULL,1,'2018-01-24 12:02:46',NULL,'2018-01-23 12:02:55'),(2,'10rse5uwq3','My clip','An example of a clip','Some presenter','LNEC','clip_cover.jpg','published','video/mp4',NULL,'2018-01-24 14:11:17','2018-01-24 14:11:19',2,'2018-01-24 14:11:08',NULL,'2018-01-24 14:11:05'),(3,'115ti3bfml','Third clip','yet another clip','Paulo Costa','FCT|FCCN','clip_cover.jpg','published','video/mp4',NULL,'2018-01-24 14:14:51','2018-01-24 14:14:53',1,'2018-01-25 14:14:57',NULL,'2018-01-14 14:15:05'),(4,'11xvpuua1y','Sample Clip 01','This is a sample clip','Default presenter','FCT|FCCN','somecover.jpg','published','video/mp4',NULL,'2018-01-24 12:02:26',NULL,1,'2018-01-24 12:02:46',NULL,'2018-01-23 12:02:55'),(5,'12bwtqkznm','Sample Clip 02','This is a sample clip','Default presenter','FCT|FCCN','somecover.jpg','published','video/mp4',NULL,'2018-01-24 12:02:26',NULL,1,'2018-01-24 12:02:46',NULL,'2018-01-23 12:02:55'),(6,'12bwtqxmil','Sample Clip 03','This is a sample clip','Default presenter','FCT|FCCN','somecover.jpg','published','video/mp4',NULL,'2018-01-24 12:02:26',NULL,1,'2018-01-24 12:02:46',NULL,'2018-01-23 12:02:55'),(7,'12bwtsnfnk','Sample Clip 04','This is a sample clip','Default presenter','FCT|FCCN','somecover.jpg','published','video/mp4',NULL,'2018-01-24 12:02:26',NULL,3,'2018-01-24 12:02:46',NULL,'2018-01-23 12:02:55'),(8,'12byb8yfns','Sample Clip 05','This is a sample clip','Default presenter','FCT|FCCN','somecover.jpg','published','video/mp4',NULL,'2018-01-24 12:02:26',NULL,3,'2018-01-24 12:02:46',NULL,'2018-01-23 12:02:55'),(9,'12pxxrsd2x','Sample Clip 06','This is a sample clip','Default presenter','FCT|FCCN','somecover.jpg','published','video/mp4',NULL,'2018-01-24 12:02:26',NULL,3,'2018-01-24 12:02:46',NULL,'2018-01-23 12:02:55');
/*!40000 ALTER TABLE `clips` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `organizations`
--

DROP TABLE IF EXISTS `organizations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `organizations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `abbreviation` varchar(255) DEFAULT NULL,
  `kind` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `organizations`
--

LOCK TABLES `organizations` WRITE;
/*!40000 ALTER TABLE `organizations` DISABLE KEYS */;
INSERT INTO `organizations` VALUES (1,'FCCN','FCCN','organization','2018-01-24 11:55:55','2018-01-24 11:55:56','fccn.pt'),(2,'Test Organization','TO','organization','2018-01-24 11:56:41','2018-01-24 11:56:42','test');
/*!40000 ALTER TABLE `organizations` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-01-25 11:41:55
