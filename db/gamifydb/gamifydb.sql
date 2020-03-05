-- MariaDB dump 10.17  Distrib 10.4.12-MariaDB, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: gamifydb
-- ------------------------------------------------------
-- Server version	10.4.12-MariaDB-1:10.4.12+maria~bionic

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `achievements`
--

DROP TABLE IF EXISTS `achievements`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `achievements` (
  `idachievement` varchar(225) NOT NULL,
  `name` varchar(225) DEFAULT NULL,
  `user_id` varchar(225) DEFAULT NULL,
  `challenge_id` int(11) DEFAULT NULL,
  `desc` varchar(225) DEFAULT NULL,
  `created_at` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`idachievement`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `achievements`
--

LOCK TABLES `achievements` WRITE;
/*!40000 ALTER TABLE `achievements` DISABLE KEYS */;
INSERT INTO `achievements` VALUES ('11a68df0-4814-4567-aad6-5b0f25b47b89','lorem','TESTUSER',1,'lorem',1583309935858),('5cbb5358-afec-4dfb-9a51-6218d97d279e','lorem','TESTUSER',1,'lorem',1583051274052),('7e051c66-7430-4e0f-b80c-8913d7abd802','lorem','TESTUSER',1,'lorem',1583052127048),('8237bc66-8ecb-4803-929f-60b35e7eb3d4','lorem','TESTUSER',1,'lorem',1583051921915),('87b659a0-7a83-4f78-a940-aae5f147b958','lorem','TESTUSER',1,'lorem',1583051883308),('d1fc44c1-4c04-4dda-9b2d-ff8add9b1a14','lorem','TESTUSER',1,'lorem',1583052021477);
/*!40000 ALTER TABLE `achievements` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `challenge_progress`
--

DROP TABLE IF EXISTS `challenge_progress`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `challenge_progress` (
  `idchallenge_progress` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` varchar(128) NOT NULL,
  `challenge_id` int(11) NOT NULL,
  `score` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`idchallenge_progress`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `challenge_progress`
--

LOCK TABLES `challenge_progress` WRITE;
/*!40000 ALTER TABLE `challenge_progress` DISABLE KEYS */;
/*!40000 ALTER TABLE `challenge_progress` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `challenges`
--

DROP TABLE IF EXISTS `challenges`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `challenges` (
  `idchallenges` int(11) NOT NULL AUTO_INCREMENT,
  `type` enum('poolevents') NOT NULL,
  `points` int(11) NOT NULL,
  `user_id` varchar(128) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`idchallenges`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `challenges`
--

LOCK TABLES `challenges` WRITE;
/*!40000 ALTER TABLE `challenges` DISABLE KEYS */;
/*!40000 ALTER TABLE `challenges` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `crew_leaderboard`
--

DROP TABLE IF EXISTS `crew_leaderboard`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `crew_leaderboard` (
  `idcrew_leaderboard` varchar(128) NOT NULL,
  `crew_id` varchar(128) NOT NULL,
  `score` int(11) NOT NULL,
  `created_at` bigint(20) NOT NULL,
  `updated_at` bigint(20) NOT NULL,
  PRIMARY KEY (`idcrew_leaderboard`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `crew_leaderboard`
--

LOCK TABLES `crew_leaderboard` WRITE;
/*!40000 ALTER TABLE `crew_leaderboard` DISABLE KEYS */;
INSERT INTO `crew_leaderboard` VALUES ('47caa39f-671c-4ca1-87f2-b87d57f1893e','CREWTESTID',2,1583361079671,1583393597961),('4d377408-0354-4219-ae76-721b2dafce9c','CREWTESTID',2,1583359544766,1583393597961),('50f3119e-5587-4ac5-bcd8-1545681b343a','CREWTESTID',2,1583393597915,1583393597961),('79b0828f-e6bc-4e62-ae96-496f74f65b34','CREWTESTID',2,1583360318375,1583393597961),('85cccba8-6440-4a9e-9adc-b5e3204c900e','CREWTESTID',2,1583361334501,1583393597961),('90819860-e72a-4340-bc86-ee7debceb6c9','CREWTESTID',2,1583361044226,1583393597961),('be506f3d-b2c2-4363-aefa-c2666fac2b07','CREWTESTID',2,1583361145628,1583393597961),('c0aeefc2-63d0-42d1-ae10-969f06e7b086','CREWTESTID',2,1583359661178,1583393597961),('cc4411a8-c54d-4634-8e18-c6088d8b1bb0','CREWTESTID',2,1583360822199,1583393597961),('cc5b37a2-86f1-46b7-8c77-c8e16c6e8136','hj1g231jgj1h2',0,1583359228455,1583359228455);
/*!40000 ALTER TABLE `crew_leaderboard` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `interval_trophies`
--

DROP TABLE IF EXISTS `interval_trophies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `interval_trophies` (
  `idtrophie` varchar(225) NOT NULL,
  `trophie` enum('GOLD','SILVER','BRONZE') NOT NULL,
  `created_at` bigint(20) NOT NULL,
  PRIMARY KEY (`idtrophie`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `interval_trophies`
--

LOCK TABLES `interval_trophies` WRITE;
/*!40000 ALTER TABLE `interval_trophies` DISABLE KEYS */;
/*!40000 ALTER TABLE `interval_trophies` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-03-05  9:56:35
