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
  PRIMARY KEY (`idhistory`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `action_history`
--

LOCK TABLES `action_history` WRITE;
/*!40000 ALTER TABLE `action_history` DISABLE KEYS */;
INSERT INTO `action_history` VALUES ('04dc6ae8-b80b-4f8a-a190-3d855da402bc','EVENT_CREATED',1583662825799,'15b0f223-1625-4948-8d7d-67c7f1653129','15b0f223-1625-4948-8d7d-67c7f1653129'),('079626c2-058b-4224-8f6a-372ed8fbed9f','APPLICATION',1583535132968,'cdc3df09-b03b-4ba4-9699-a9d9f8c28d79','cdc3df09-b03b-4ba4-9699-a9d9f8c28d79'),('107219f1-2418-4b00-b345-6010fad3c1de','READ',1583622858820,'15b0f223-1625-4948-8d7d-67c7f1653129','15b0f223-1625-4948-8d7d-67c7f1653129'),('13a21sd54as6d','EVENT_CREATED',1583668849038,'15b0f223-1625-4948-8d7d-67c7f1653129','15b0f223-1625-4948-8d7d-67c7f1653129'),('13a21sd54as6d3a1','EVENT_CREATED',1583663163674,'15b0f223-1625-4948-8d7d-67c7f1653129','15b0f223-1625-4948-8d7d-67c7f1653129'),('13a21sd54as6d3a1s3a4d5a4s64ad1s3a','READ',1583502370160,'13a21sd54as6d3a1s3a4d5a4s64ad1s3a','13a21sd54as6d3a1s3a4d5a4s64ad1s3a'),('1d2b71f4-eced-46a5-90a5-8d851bf738b5','READ',1583574319039,'9842d6ff-dcde-41ce-b836-0b30f25bdd62','9842d6ff-dcde-41ce-b836-0b30f25bdd62'),('1e428fd2-afed-4a92-9643-318cce09dcdd','READ',1583624810591,'15b0f223-1625-4948-8d7d-67c7f1653129','15b0f223-1625-4948-8d7d-67c7f1653129'),('1fda2509-42c3-4753-8083-607e16a89637','READ',1583583004768,'04e4ae72-8596-4629-90c9-d3a8db50a398','04e4ae72-8596-4629-90c9-d3a8db50a398'),('22f569a3-befb-4caa-8eda-180c93b8534d','APPLICATION',1583582712425,'4a74141e-c2c0-46a0-9c0c-84bef8be7d0f','4a74141e-c2c0-46a0-9c0c-84bef8be7d0f'),('31068882-e941-4352-a0f5-aba507ed350f','READ',1583585841862,'15b0fb13-1625-4948-8d7d-67c7f1653129','15b0fb13-1625-4948-8d7d-67c7f1653129'),('33b49afa-d454-43e5-b81d-199b0560c9da','READ',1583582855495,'4a74141e-c2c0-46a0-9c0c-84bef8be7d0f','4a74141e-c2c0-46a0-9c0c-84bef8be7d0f'),('380c6bc5-d82b-46ed-b506-1b67d18db520','READ',1583589208277,'15b0fb13-1625-4948-8d7d-67c7f1653129','15b0fb13-1625-4948-8d7d-67c7f1653129'),('3f6140b3-f750-4177-b1f7-14de9da5fec1','READ',1583617889000,'15b0f223-1625-4948-8d7d-67c7f1653129','15b0f223-1625-4948-8d7d-67c7f1653129'),('40186764-8b4c-4406-b15c-9a6f8f2aa9f6','READ',1583584521389,'15b0fb13-1625-4948-8d7d-67c7f1653129','15b0fb13-1625-4948-8d7d-67c7f1653129'),('4452d382-6429-4496-a460-d040f3a87b4a','READ',1583622559913,'15b0f223-1625-4948-8d7d-67c7f1653129','15b0f223-1625-4948-8d7d-67c7f1653129'),('48a3111b-4024-4e6f-8fc1-cc3e9bea7f57','READ',1583535131019,'c066b636-36f4-41cd-a806-6298cc119de0','c066b636-36f4-41cd-a806-6298cc119de0'),('53f99da6-05fa-4dde-a7a0-e89bf9ca9230','APPLICATION',1583502099161,'decf4c38-2844-427d-be04-314ffcaaed29','decf4c38-2844-427d-be04-314ffcaaed29'),('5aca39fe-7082-40e1-bdf9-3a975f6af5af','EVENT_CREATED',1583662058244,'15b0f223-1625-4948-8d7d-67c7f1653129','15b0f223-1625-4948-8d7d-67c7f1653129'),('68565fff-70a5-4a54-864a-e1d953345571','READ',1583587229257,'15b0fb13-1625-4948-8d7d-67c7f1653129','15b0fb13-1625-4948-8d7d-67c7f1653129'),('8f031782-1fbf-4067-b809-d797634d524d','APPLICATION',1583574318894,'c303ce57-229e-40ed-8e92-56d93b4e630f','205c8ef5-6b41-4f14-96d8-c2395c31565c'),('a62b8eca-3bb7-463a-822c-6d9794882177','READ',1583622100284,'15b0f223-1625-4948-8d7d-67c7f1653129','15b0f223-1625-4948-8d7d-67c7f1653129'),('a7793036-acf2-4def-b37c-8f4f64612e27','APPLICATION',1583535131391,'fa3dc660-d814-438a-8840-21827e82ad60','52523ab1-f188-4441-a794-edab2311e381'),('b3d1a925-b782-4a94-b4e2-1e8eabd70712','READ',1583583408631,'4a74141e-c2c0-46a0-9c0c-84bef8be7d0f','4a74141e-c2c0-46a0-9c0c-84bef8be7d0f'),('b80f5a8b-91f8-4cb3-b0f6-7acac65e2be3','APPLICATION',1583574319883,'0d38d200-6b39-4ffc-b3ad-0c86fad389f6','0d38d200-6b39-4ffc-b3ad-0c86fad389f6'),('c33c0541-74de-418c-831b-4132af39fbc2','READ',1583582813730,'4a74141e-c2c0-46a0-9c0c-84bef8be7d0f','4a74141e-c2c0-46a0-9c0c-84bef8be7d0f'),('c361b3a3-d258-4bee-8396-ec85d2ff2e04','APPLICATION',1583617887205,'3354039d-0ec1-4e84-af25-7ac5aac954d8','ea34fd7e-209f-478a-aa96-42d98a0e3546'),('c446157a-ed20-4f1c-bb31-672bc1bb66d5','READ',1583582780379,'4a74141e-c2c0-46a0-9c0c-84bef8be7d0f','4a74141e-c2c0-46a0-9c0c-84bef8be7d0f'),('dc9a14e4-cc18-4078-803e-a5c3b3052db1','READ',1583622664734,'15b0f223-1625-4948-8d7d-67c7f1653129','15b0f223-1625-4948-8d7d-67c7f1653129'),('decce03c-b568-4550-837a-8b2a17d27e02','READ',1583589267355,'15b0fb13-1625-4948-8d7d-67c7f1653129','15b0fb13-1625-4948-8d7d-67c7f1653129'),('e3e79b7a-789b-40b6-8606-bdf400226e01','READ',1583586942942,'15b0fb13-1625-4948-8d7d-67c7f1653129','15b0fb13-1625-4948-8d7d-67c7f1653129'),('e67e1af2-d916-4a3e-ac0e-ec257f04b072','READ',1583584341178,'4a74141e-c2c0-46a0-9c0c-84bef8be7d0f','4a74141e-c2c0-46a0-9c0c-84bef8be7d0f'),('ea1a52e3-6bce-4e80-b61b-638049a6c1df','READ',1583586509150,'15b0fb13-1625-4948-8d7d-67c7f1653129','15b0fb13-1625-4948-8d7d-67c7f1653129'),('eacd7568-7148-4e09-9859-a9b118121dad','EVENT_CREATED',1583662851230,'15b0f223-1625-4948-8d7d-67c7f1653129','15b0f223-1625-4948-8d7d-67c7f1653129'),('f465312c-995b-4076-ac46-f28b95be2737','READ',1583584396950,'4a74141e-c2c0-46a0-9c0c-84bef8be7d0f','4a74141e-c2c0-46a0-9c0c-84bef8be7d0f'),('f52d2523-c8c3-46da-b609-8fc4ac2ab6f5','READ',1583594182201,'15b0f223-1625-4948-8d7d-67c7f1653129','15b0f223-1625-4948-8d7d-67c7f1653129');
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
INSERT INTO `actions` VALUES ('APPLICATION',1583418181770,40,'applications'),('COMMENT',1583418146112,30,'comments'),('EVENT_CREATED',1583418294830,50,'poolevents'),('READ',1583412516995,10,''),('TEST',1583668214803,100,'TEST'),('TEST1',1583668327508,100,'TEST1'),('VOTE',1583418020232,20,'votes');
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
INSERT INTO `crew_leaderboard` VALUES ('ea7362f7-890d-4806-afa9-cc83285f85d1','15b0f223-1625-4948-8d7d-67c7f1653129',260,1583624810441,1583668849109);
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

-- Dump completed on 2020-03-08 13:55:04
