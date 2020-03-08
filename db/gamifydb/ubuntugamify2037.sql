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
  `created_at` bigint(20) NOT NULL,
  `badge_id` varchar(100) NOT NULL,
  `challenge_id` varchar(100) NOT NULL,
  PRIMARY KEY (`idachievement`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `achievements`
--

LOCK TABLES `achievements` WRITE;
/*!40000 ALTER TABLE `achievements` DISABLE KEYS */;
INSERT INTO `achievements` VALUES ('025fda08-194e-4584-b4ef-6450ad2fc353',1583509715753,'226d9a12-9f13-40df-a01c-b47b290b1e9b','4c2b111f-5424-4419-9e9e-f9ac8b3da087'),('5b72f0ab-716c-4322-90c3-3ea1fceabe7c',1583526018952,'17ed8fa3-0aac-41ee-896c-f63c24f80986','3d9442b0-8c48-4847-bba7-579bc68863cb'),('91b893e4-f252-401e-82fb-e37de81150c5',1583525498865,'eaf158e7-f999-403e-8525-43829a2b11ee','f493ee9b-7f2a-451d-b9e8-7de349bd6c14'),('94e94952-c211-42ce-a639-8586dce148d3',1583525875130,'f5675a5d-ed7f-4e9e-a18f-c3d649aa55f1','eca17ca0-45f9-4067-97fc-cbbb0cad4854'),('bf060cea-dfd7-40aa-a98a-11de166e33b4',1583525582908,'142b63f3-a003-479c-8005-46230401f7db','9fc4bf67-02d2-44ba-99e6-4bda9aaa93f1');
/*!40000 ALTER TABLE `achievements` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `action_history`
--

DROP TABLE IF EXISTS `action_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `action_history` (
  `idhistory` varchar(225) NOT NULL COMMENT '==source example event or application',
  `category` enum('READ','APPLICATION') NOT NULL,
  `created_at` bigint(20) NOT NULL,
  `user_id` varchar(100) NOT NULL,
  `crew_id` varchar(100) NOT NULL,
  PRIMARY KEY (`idhistory`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `action_history`
--

LOCK TABLES `action_history` WRITE;
/*!40000 ALTER TABLE `action_history` DISABLE KEYS */;
INSERT INTO `action_history` VALUES ('079626c2-058b-4224-8f6a-372ed8fbed9f','APPLICATION',1583535132968,'cdc3df09-b03b-4ba4-9699-a9d9f8c28d79','cdc3df09-b03b-4ba4-9699-a9d9f8c28d79'),('13a21sd54as6d3a1s3a4d5a4s64ad1s3a','READ',1583502370160,'13a21sd54as6d3a1s3a4d5a4s64ad1s3a','13a21sd54as6d3a1s3a4d5a4s64ad1s3a'),('48a3111b-4024-4e6f-8fc1-cc3e9bea7f57','READ',1583535131019,'c066b636-36f4-41cd-a806-6298cc119de0','c066b636-36f4-41cd-a806-6298cc119de0'),('53f99da6-05fa-4dde-a7a0-e89bf9ca9230','APPLICATION',1583502099161,'decf4c38-2844-427d-be04-314ffcaaed29','decf4c38-2844-427d-be04-314ffcaaed29'),('a7793036-acf2-4def-b37c-8f4f64612e27','APPLICATION',1583535131391,'fa3dc660-d814-438a-8840-21827e82ad60','52523ab1-f188-4441-a794-edab2311e381');
/*!40000 ALTER TABLE `action_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `actions`
--

DROP TABLE IF EXISTS `actions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `actions` (
  `id_action` varchar(100) NOT NULL,
  `created_at` bigint(20) NOT NULL,
  `points` int(11) NOT NULL,
  PRIMARY KEY (`id_action`),
  UNIQUE KEY `actions_UN` (`points`,`id_action`),
  KEY `actions_id_action_IDX` (`id_action`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `actions`
--

LOCK TABLES `actions` WRITE;
/*!40000 ALTER TABLE `actions` DISABLE KEYS */;
INSERT INTO `actions` VALUES ('APPLICATION',1583418181770,40),('COMMENT',1583418146112,30),('CREATED_EVENT',1583418294830,50),('READ',1583412516995,10),('VOTE',1583418020232,20);
/*!40000 ALTER TABLE `actions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `badges`
--

DROP TABLE IF EXISTS `badges`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `badges` (
  `idbadge` varchar(225) NOT NULL,
  `name` varchar(225) NOT NULL,
  `desc` varchar(225) NOT NULL,
  `type` enum('comments','poolevents','votes','connections','profiles','info','applications') NOT NULL,
  `created_at` bigint(20) NOT NULL,
  `updated_at` bigint(20) NOT NULL,
  `img_url` varchar(225) NOT NULL,
  PRIMARY KEY (`idbadge`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `badges`
--

LOCK TABLES `badges` WRITE;
/*!40000 ALTER TABLE `badges` DISABLE KEYS */;
INSERT INTO `badges` VALUES ('142b63f3-a003-479c-8005-46230401f7db','scoop','lorem lorem','poolevents',1583525582909,1583525582909,'loremscoop'),('17ed8fa3-0aac-41ee-896c-f63c24f80986','informed2','loremlorel','poolevents',1583526018952,1583526018952,'scoop'),('226d9a12-9f13-40df-a01c-b47b290b1e9b','scoop','lorem lorem','poolevents',1583509715753,1583509715753,'loremscoop'),('2d9314ae-abd1-4d02-a4de-90a88d7a09a7','informed','onboarding information','poolevents',1583535132477,1583535132477,'//b.thumbs.redditmedia.com/xdKEqKiFPEtQPTvc0Qh_MoR-8y4IYkHnMajh27qhGjE.png'),('55d23fcc-e70f-42db-a116-3402ae6ef400','scoop','lorem lorem','poolevents',1583509365187,1583509365187,'loremscoop'),('892e6874-c76f-4ec3-a7ec-e03287a8e181','informed','onboarding information','poolevents',1583506735358,1583506735358,'//b.thumbs.redditmedia.com/xdKEqKiFPEtQPTvc0Qh_MoR-8y4IYkHnMajh27qhGjE.png'),('eaf158e7-f999-403e-8525-43829a2b11ee','scoop','lorem lorem','poolevents',1583525498865,1583525498865,'loremscoop'),('f5675a5d-ed7f-4e9e-a18f-c3d649aa55f1','informed2','loremlorel','poolevents',1583525875130,1583525875130,'scoop');
/*!40000 ALTER TABLE `badges` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `challenge_progress`
--

DROP TABLE IF EXISTS `challenge_progress`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `challenge_progress` (
  `user_id` varchar(128) CHARACTER SET latin1 NOT NULL,
  `challenge_id` int(11) NOT NULL,
  `score` int(11) NOT NULL,
  `created_at` bigint(20) NOT NULL,
  `updated_at` bigint(20) NOT NULL,
  `idcp` varchar(100) CHARACTER SET latin1 NOT NULL,
  PRIMARY KEY (`idcp`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
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
  `idchallenge` varchar(225) NOT NULL,
  `created_at` bigint(11) NOT NULL,
  `type` enum('comments','poolevents','votes','connections','profiles','info','applications') NOT NULL,
  `points` int(11) NOT NULL,
  `updated_at` bigint(11) NOT NULL,
  PRIMARY KEY (`idchallenge`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `challenges`
--

LOCK TABLES `challenges` WRITE;
/*!40000 ALTER TABLE `challenges` DISABLE KEYS */;
INSERT INTO `challenges` VALUES ('176ee05a-89ea-491e-933c-a2cc1550c617',1583509365243,'poolevents',30,1583509365243),('3d9442b0-8c48-4847-bba7-579bc68863cb',1583526019014,'poolevents',2,1583526019014),('4c2b111f-5424-4419-9e9e-f9ac8b3da087',1583509715803,'poolevents',30,1583509715803),('9cf0a9c4-56d7-466d-b2eb-d058777ec1d0',1583508014399,'poolevents',20,1583508014399),('9fc4bf67-02d2-44ba-99e6-4bda9aaa93f1',1583525582970,'poolevents',30,1583525582970),('ab2df85b-49b1-49f4-ad5a-28b93a8d75dc',1583508772265,'poolevents',20,1583508772265),('d330e757-d4cc-4814-85b7-98233c4322d0',1583508732521,'poolevents',20,1583508732521),('eca17ca0-45f9-4067-97fc-cbbb0cad4854',1583525875192,'poolevents',2,1583525875192),('f493ee9b-7f2a-451d-b9e8-7de349bd6c14',1583525498949,'poolevents',30,1583525498949);
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
  PRIMARY KEY (`idcrew_leaderboard`),
  UNIQUE KEY `crew_id_un` (`crew_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `crew_leaderboard`
--

LOCK TABLES `crew_leaderboard` WRITE;
/*!40000 ALTER TABLE `crew_leaderboard` DISABLE KEYS */;
INSERT INTO `crew_leaderboard` VALUES ('15c811b1-b0d3-4d28-b24a-698412be31d6','decf4c38-2844-427d-be04-314ffcaaed29',40,1583502099113,1583502099211),('3b367d7e-f018-4c85-813a-cc0573ba2cde','342010c5-65d1-4876-b107-c09cbb85e155',0,1583535130954,1583535130954),('c72b5f07-9651-4403-9b9f-57d8024d0f72','13a21sd54as6d3a1s3a4d5a4s64ad1s3a',10,1583502369941,1583502370210),('e48fe4a6-315c-40b1-ac31-3af82047bad7','cdc3df09-b03b-4ba4-9699-a9d9f8c28d79',40,1583535132818,1583535133027);
/*!40000 ALTER TABLE `crew_leaderboard` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `crews`
--

DROP TABLE IF EXISTS `crews`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `crews` (
  `idcrew` varchar(100) NOT NULL,
  `name` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `crews`
--

LOCK TABLES `crews` WRITE;
/*!40000 ALTER TABLE `crews` DISABLE KEYS */;
/*!40000 ALTER TABLE `crews` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `entry_score`
--

DROP TABLE IF EXISTS `entry_score`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `entry_score` (
  `identry` varchar(100) NOT NULL,
  `score` varchar(100) DEFAULT NULL,
  `created_at` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`identry`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='counts rsources scores -->  to determin resource of the day';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `entry_score`
--

LOCK TABLES `entry_score` WRITE;
/*!40000 ALTER TABLE `entry_score` DISABLE KEYS */;
/*!40000 ALTER TABLE `entry_score` ENABLE KEYS */;
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

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `iduser` varchar(100) NOT NULL,
  `idcrew` varchar(100) NOT NULL,
  PRIMARY KEY (`iduser`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-03-06 23:29:26
