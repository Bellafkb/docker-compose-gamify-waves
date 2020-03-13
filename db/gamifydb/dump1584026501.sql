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
INSERT INTO `achievements` VALUES ('03f33773-1e6c-411a-9acd-d0a130ffaccc',1583657046057,'d26397f3-bcc8-4274-aeb7-8ddbe953df7c','f7d982ce-d0cf-4db3-8528-736a8b0ced5a'),('64578d0b-c8b6-4a50-93ca-43178bb59842',1583624839980,'586743d7-c467-439d-bb86-22a39bbebf35','064ede89-9329-4f78-9f2a-7dbce2ff0245'),('8e57c018-9261-4b9c-a819-456536826de5',1583657514377,'a79fa773-f8cb-4b5b-8bd8-7bc8549374a2','b778f749-ac1b-44ca-a3dd-cf42e2897da7');
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
  `category` varchar(225) NOT NULL,
  `created_at` bigint(20) NOT NULL,
  `user_id` varchar(100) NOT NULL,
  `crew_id` varchar(100) NOT NULL,
  `source_id` varchar(100) NOT NULL,
  PRIMARY KEY (`idhistory`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `action_history`
--

LOCK TABLES `action_history` WRITE;
/*!40000 ALTER TABLE `action_history` DISABLE KEYS */;
INSERT INTO `action_history` VALUES ('08ddfe64-6158-4051-b0cb-7e12d1dae834','APPLICATION',1584025125043,'8d411dc4-e76f-4d0e-a027-056a0bc43be5','15b0f223-1625-4948-8d7d-67c7f1653129','10706217-ee63-4990-b0ea-9aabdeb8810d'),('b8550b44-55e6-4926-872d-cc48b03fe333','APPLICATION',1584025073664,'8d411dc4-e76f-4d0e-a027-056a0bc43be5','15b0f223-1625-4948-8d7d-67c7f1653129','0fea42a6-76ae-423c-9940-508024c7c082');
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
  `type` varchar(100) NOT NULL,
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
INSERT INTO `actions` VALUES ('APPLICATION',1583418181770,40,'applications'),('COMMENT',1583418146112,30,'comments'),('EVENT_CREATED',1583418294830,50,'poolevents'),('READ',1583412516995,10,''),('VOTE',1583418020232,20,'votes');
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
INSERT INTO `badges` VALUES ('586743d7-c467-439d-bb86-22a39bbebf35','scoop','read the onboarding informations','poolevents',1583624839980,1583624839980,'loremscoop'),('a79fa773-f8cb-4b5b-8bd8-7bc8549374a2','new comment','comment','comments',1583657514378,1583657514378,'loremscoop'),('d26397f3-bcc8-4274-aeb7-8ddbe953df7c','new comment','comment','comments',1583657046058,1583657046058,'loremscoop');
/*!40000 ALTER TABLE `badges` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `challenge_progress`
--

DROP TABLE IF EXISTS `challenge_progress`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `challenge_progress` (
  `user_id` varchar(225) CHARACTER SET latin1 NOT NULL,
  `challenge_id` varchar(225) NOT NULL,
  `score` int(11) NOT NULL,
  `created_at` bigint(20) NOT NULL,
  `updated_at` bigint(20) NOT NULL,
  `idcp` varchar(225) CHARACTER SET latin1 NOT NULL,
  `completed` bit(1) NOT NULL DEFAULT b'0',
  PRIMARY KEY (`idcp`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `challenge_progress`
--

LOCK TABLES `challenge_progress` WRITE;
/*!40000 ALTER TABLE `challenge_progress` DISABLE KEYS */;
INSERT INTO `challenge_progress` VALUES ('8d411dc4-e76f-4d0e-a027-056a0bc43be5','064ede89-9329-4f78-9f2a-7dbce2ff0245',1,1583624840257,1583624840257,'31cbb0d9-3173-458f-b43a-bafe912af6d7',''),('8d411dc4-e76f-4d0e-a027-056a0bc43be5','b778f749-ac1b-44ca-a3dd-cf42e2897da7',3,1583657514661,1583657514661,'479baead-7076-487e-8276-860d0c00883e',''),('8d411dc4-e76f-4d0e-a027-056a0bc43be5','f7d982ce-d0cf-4db3-8528-736a8b0ced5a',1,1583657046251,1583657046251,'d28f994d-0663-48c5-82fa-41e0cc64b70c','');
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
INSERT INTO `challenges` VALUES ('064ede89-9329-4f78-9f2a-7dbce2ff0245',1583624840044,'poolevents',1,1583624840044),('b778f749-ac1b-44ca-a3dd-cf42e2897da7',1583657514428,'comments',3,1583657514428),('f7d982ce-d0cf-4db3-8528-736a8b0ced5a',1583657046110,'comments',1,1583657046110);
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
INSERT INTO `crew_leaderboard` VALUES ('ea7362f7-890d-4806-afa9-cc83285f85d1','15b0f223-1625-4948-8d7d-67c7f1653129',1200,1583624810441,1584025125095);
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
INSERT INTO `crews` VALUES ('15b0f223-1625-4948-8d7d-67c7f1653129','San Francisco');
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
  `sourceId` varchar(225) NOT NULL,
  PRIMARY KEY (`idtrophie`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `interval_trophies`
--

LOCK TABLES `interval_trophies` WRITE;
/*!40000 ALTER TABLE `interval_trophies` DISABLE KEYS */;
INSERT INTO `interval_trophies` VALUES ('402ffe80-7ca4-4634-b6af-bc0e6ccd26e2','GOLD',1584023611834,'4602a317-b84a-419f-8285-cb760680f12a');
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
INSERT INTO `users` VALUES ('8d411dc4-e76f-4d0e-a027-056a0bc43be5','15b0f223-1625-4948-8d7d-67c7f1653129');
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

-- Dump completed on 2020-03-12 15:21:41
