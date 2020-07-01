-- MariaDB dump 10.17  Distrib 10.4.12-MariaDB, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: gamifydb
-- ------------------------------------------------------
-- Server version	10.4.12-MariaDB-1:10.4.12+maria~bionic

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
INSERT INTO `achievements` VALUES ('67cff2db-ffce-41b6-b8a5-984eeb8e4a4a',1585310492767,'bec5f02c-77bc-40ca-afcf-606f31606e8d','09cd7e4a-5d42-4291-b66f-acc95755fe84'),('6e46d2b6-6664-456b-b672-011a1d16ae04',1585310582544,'b64c8f5a-80be-4071-b7bf-0f4bff2a2ea8','4bf8e427-7b8e-41db-a615-b16d5cebb138'),('824f9b9b-bf6c-4d66-8d27-5bd227d19c11',1585303740410,'ad504797-be79-4a86-ba58-4a76097f0f50','3a165140-027c-4b27-b899-fdf96b366a8a'),('b907faab-612b-4362-b815-5de9250f55a0',1585317376747,'511ecd29-8403-4fe2-8503-4cf87c99f0d7','b1e3f62e-8f75-434b-a2d1-930d8b60738f'),('c187c308-bc6b-469c-a66f-9471a4f9e135',1585310582544,'b64c8f5a-80be-4071-b7bf-0f4bff2a2ea8','972fca1d-5d46-45ff-906c-dc17e41596b7'),('db3be18d-d47c-4d04-b437-99fd23070a92',1585303740410,'ad504797-be79-4a86-ba58-4a76097f0f50','31be143f-c900-467d-9ed2-07fe5f6b44e1'),('fce84572-c2b9-4aee-83c0-ac89f4c447b4',1585316804876,'839cbedc-f616-4d04-b837-8af2d27845ef','199b207d-f06d-44b5-aafd-8d5045816fd9');
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `action_history`
--

LOCK TABLES `action_history` WRITE;
/*!40000 ALTER TABLE `action_history` DISABLE KEYS */;
INSERT INTO `action_history` VALUES ('0353c4f6-802a-469e-bc4b-1b2dafae903e','COMMENT',1585303511537,'4a74141e-c2c0-46a0-9c0c-84bef8be7d0f','15b0fb13-1625-4948-8d7d-67c7f1653129','4cd23161-39f3-4e3d-9ce2-1a8b9d5f4d49'),('210d9a35-aafe-4f5c-aae3-bff51531f8b6','VOTE',1585320100997,'4a74141e-c2c0-46a0-9c0c-84bef8be7d0f','15b0fb13-1625-4948-8d7d-67c7f1653129','0a6fc37f-dc7f-498e-bf06-62eebeb751ad'),('271b6f00-624c-4236-a825-e93e8efe8f32','COMMENT',1585320088400,'4a74141e-c2c0-46a0-9c0c-84bef8be7d0f','15b0fb13-1625-4948-8d7d-67c7f1653129','a7d924d9-8058-4a69-aa22-8e885a0f896a'),('2bd9e24c-02c1-460f-a4ec-c7a47645140e','APPLICATION',1585303450602,'4a74141e-c2c0-46a0-9c0c-84bef8be7d0f','15b0fb13-1625-4948-8d7d-67c7f1653129','e2be4355-65d6-4bcb-9e52-ad0db41ab0f3'),('4d405e8d-777d-4eaa-a440-5f98a367f63e','COMMENT',1585317283767,'4a74141e-c2c0-46a0-9c0c-84bef8be7d0f','15b0fb13-1625-4948-8d7d-67c7f1653129','9c7bfddd-ecbe-404f-bc91-3a535d6bb0c6'),('75d39116-8d3d-4828-8fce-c4fd70d2ddec','VOTE',1585320128930,'4a74141e-c2c0-46a0-9c0c-84bef8be7d0f','15b0fb13-1625-4948-8d7d-67c7f1653129','3338fb9b-2e65-42b6-93bb-c0f4daf77598'),('8830a212-c209-4a89-9cd1-ef46a9d52e8b','APPLICATION',1585320683348,'4a74141e-c2c0-46a0-9c0c-84bef8be7d0f','15b0fb13-1625-4948-8d7d-67c7f1653129','f95e5e91-9446-4d17-a60c-d5cafbad88b5'),('8d520368-6997-4af2-b186-02c3861c41ff','VOTE',1585311274598,'4a74141e-c2c0-46a0-9c0c-84bef8be7d0f','15b0fb13-1625-4948-8d7d-67c7f1653129','6b4c57e3-f4c8-4917-95b5-0375827902b8'),('8dc0e526-9c5a-4c7b-8d7c-12202c3d6a4a','APPLICATION',1585311233197,'4a74141e-c2c0-46a0-9c0c-84bef8be7d0f','15b0fb13-1625-4948-8d7d-67c7f1653129','d205e4e7-d6ab-467b-ae05-7d613ce1fd98'),('8e0044d5-8a31-49c2-8765-288b8ad2d620','VOTE',1585320095578,'4a74141e-c2c0-46a0-9c0c-84bef8be7d0f','15b0fb13-1625-4948-8d7d-67c7f1653129','11f289a6-d122-4304-a6f9-b65a93c26369'),('8fa45aa2-efa5-4a7e-b26f-52b31cbc2048','COMMENT',1585320076567,'4a74141e-c2c0-46a0-9c0c-84bef8be7d0f','15b0fb13-1625-4948-8d7d-67c7f1653129','a408491a-c909-4163-969b-73838661cad1'),('94589c0c-cfdb-48be-bef1-4fb0ac8dc5c3','VOTE',1585320111071,'4a74141e-c2c0-46a0-9c0c-84bef8be7d0f','15b0fb13-1625-4948-8d7d-67c7f1653129','b571de56-43b8-46c5-a456-992d7c936e94'),('9a07e9b1-46d5-4186-af55-9df1cac8c3e3','COMMENT',1585303782392,'4a74141e-c2c0-46a0-9c0c-84bef8be7d0f','15b0fb13-1625-4948-8d7d-67c7f1653129','d23e70ce-9370-4d45-88be-e6174bea4401'),('9d645f7b-8799-4bd1-9645-6ea74aa93dcf','COMMENT',1585311293225,'4a74141e-c2c0-46a0-9c0c-84bef8be7d0f','15b0fb13-1625-4948-8d7d-67c7f1653129','040c3f30-8680-4f60-8441-2ee89bd77731'),('a56d46f7-810d-4754-b711-0b2a1624b231','COMMENT',1585320121782,'4a74141e-c2c0-46a0-9c0c-84bef8be7d0f','15b0fb13-1625-4948-8d7d-67c7f1653129','8118ceb9-9920-45c6-b398-4cf09c9deb23'),('baa27309-b89e-4b7d-b9dd-fcaf42480bd1','APPLICATION',1585311157347,'4a74141e-c2c0-46a0-9c0c-84bef8be7d0f','15b0fb13-1625-4948-8d7d-67c7f1653129','cc115082-29a1-405f-8d7c-d2b984b04619'),('bddc73aa-781f-442e-959b-f9dbf6c580f0','APPLICATION',1585302165564,'4a74141e-c2c0-46a0-9c0c-84bef8be7d0f','15b0fb13-1625-4948-8d7d-67c7f1653129','208e3f99-00d5-4733-a60c-f40a90d46f2f'),('c1af9e36-a7ec-4dee-a462-8e0f52b73009','VOTE',1585311299172,'4a74141e-c2c0-46a0-9c0c-84bef8be7d0f','15b0fb13-1625-4948-8d7d-67c7f1653129','fd8bb9e3-85f1-4d27-851a-72a013a5a5b0'),('cdad9f29-9998-4dde-97ae-65849a8fd7b0','COMMENT',1585311245988,'4a74141e-c2c0-46a0-9c0c-84bef8be7d0f','15b0fb13-1625-4948-8d7d-67c7f1653129','4d5df0f7-3285-423f-8b74-59b95ef42c2d'),('f23e2447-9e9d-46fe-9e33-e260bc0a2591','VOTE',1585311260937,'4a74141e-c2c0-46a0-9c0c-84bef8be7d0f','15b0fb13-1625-4948-8d7d-67c7f1653129','69187ac1-bc56-4448-90ae-b3dfee0a7889'),('fa7c791a-e4f3-4ab3-8ec3-7447b4547f97','COMMENT',1585311248035,'4a74141e-c2c0-46a0-9c0c-84bef8be7d0f','15b0fb13-1625-4948-8d7d-67c7f1653129','3b2cf4aa-5b21-46d8-b4ec-faf92443bb15'),('fd6c9877-d50f-4fd9-bc76-07ce08894561','APPLICATION',1585303778342,'4a74141e-c2c0-46a0-9c0c-84bef8be7d0f','15b0fb13-1625-4948-8d7d-67c7f1653129','9524ec6f-cb35-4f60-a7d6-ce43cfced1f8');
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
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
  `created_at` bigint(20) NOT NULL,
  `updated_at` bigint(20) NOT NULL,
  `img_url` varchar(225) NOT NULL,
  PRIMARY KEY (`idbadge`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `badges`
--

LOCK TABLES `badges` WRITE;
/*!40000 ALTER TABLE `badges` DISABLE KEYS */;
INSERT INTO `badges` VALUES ('511ecd29-8403-4fe2-8503-4cf87c99f0d7','adsasdad','asdasd',1585317376750,1585317376750,'asdasd'),('839cbedc-f616-4d04-b837-8af2d27845ef','TEST2','asdadad',1585316804878,1585316804878,'asdadsad'),('ad504797-be79-4a86-ba58-4a76097f0f50','test','asdasd',1585303740414,1585303740414,'asdasd'),('b64c8f5a-80be-4071-b7bf-0f4bff2a2ea8','TEST2','Lorem ipsum dolor sit',1585310582548,1585310582548,'Lorem ipsum dolor sit.'),('bec5f02c-77bc-40ca-afcf-606f31606e8d','TEST2','Lorem ipsum dolor sit',1585310492768,1585310492768,'Lorem ipsum dolor sit.');
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
  `completed` tinyint(4) NOT NULL,
  PRIMARY KEY (`idcp`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `challenge_progress`
--

LOCK TABLES `challenge_progress` WRITE;
/*!40000 ALTER TABLE `challenge_progress` DISABLE KEYS */;
INSERT INTO `challenge_progress` VALUES ('4a74141e-c2c0-46a0-9c0c-84bef8be7d0f','b1e3f62e-8f75-434b-a2d1-930d8b60738f',0,1585317377000,1585317377000,'0bde6e03-9f58-41cf-b199-520cdacb6f6d',0),('4a74141e-c2c0-46a0-9c0c-84bef8be7d0f','972fca1d-5d46-45ff-906c-dc17e41596b7',2,1585317283158,1585317283158,'0beed321-ff07-40af-91b4-56435ef86839',1),('4a74141e-c2c0-46a0-9c0c-84bef8be7d0f','31be143f-c900-467d-9ed2-07fe5f6b44e1',1,1585317283157,1585317283157,'2afe009b-5136-436b-b63b-8e9ff7b0e962',1),('4a74141e-c2c0-46a0-9c0c-84bef8be7d0f','31be143f-c900-467d-9ed2-07fe5f6b44e1',1,1585303740639,1585303740639,'3a9b811b-34f3-429d-91a5-a89cc641c559',1),('4a74141e-c2c0-46a0-9c0c-84bef8be7d0f','972fca1d-5d46-45ff-906c-dc17e41596b7',2,1585310582841,1585310582841,'6e2099b3-e8bd-4054-b4e8-d567d2cacee5',1),('4a74141e-c2c0-46a0-9c0c-84bef8be7d0f','09cd7e4a-5d42-4291-b66f-acc95755fe84',2,1585310492948,1585310492948,'71b9d26e-3e7d-493a-a263-c263c135e39d',1),('4a74141e-c2c0-46a0-9c0c-84bef8be7d0f','199b207d-f06d-44b5-aafd-8d5045816fd9',0,1585317283157,1585317283157,'77baf05e-2075-4eb9-a6eb-0dd6d9f8042e',0),('4a74141e-c2c0-46a0-9c0c-84bef8be7d0f','3a165140-027c-4b27-b899-fdf96b366a8a',1,1585303740639,1585303740639,'78774c26-09d4-4dbc-a282-102f81c9f0f2',1),('4a74141e-c2c0-46a0-9c0c-84bef8be7d0f','3491608f-5a8e-413c-9a6a-30df76037d69',1,1585317283157,1585317283157,'7901d160-8638-422f-a5c1-54c6fac93c5f',0),('4a74141e-c2c0-46a0-9c0c-84bef8be7d0f','3a165140-027c-4b27-b899-fdf96b366a8a',1,1585317283157,1585317283157,'84af51d2-ce1f-4368-bc98-16e69b9736f0',1),('4a74141e-c2c0-46a0-9c0c-84bef8be7d0f','3491608f-5a8e-413c-9a6a-30df76037d69',2,1585310582841,1585310582841,'b5c30e7a-0ce5-4797-a75b-b3c2c91616c6',1),('4a74141e-c2c0-46a0-9c0c-84bef8be7d0f','4bf8e427-7b8e-41db-a615-b16d5cebb138',3,1585317283158,1585317283158,'dc3cfb2f-fc53-4e5b-8036-7f42585091bf',1),('4a74141e-c2c0-46a0-9c0c-84bef8be7d0f','09cd7e4a-5d42-4291-b66f-acc95755fe84',1,1585317283156,1585317283156,'e25cb247-a6ac-49b5-8002-a5b949a4a8b8',0),('4a74141e-c2c0-46a0-9c0c-84bef8be7d0f','4bf8e427-7b8e-41db-a615-b16d5cebb138',3,1585310582841,1585310582841,'fa8c37cc-a352-42b0-b4ae-c83c0aeeebdb',1);
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `challenges`
--

LOCK TABLES `challenges` WRITE;
/*!40000 ALTER TABLE `challenges` DISABLE KEYS */;
INSERT INTO `challenges` VALUES ('09cd7e4a-5d42-4291-b66f-acc95755fe84',1585310492828,'applications',2,1585310492828),('199b207d-f06d-44b5-aafd-8d5045816fd9',1585316804934,'poolevents',2,1585316804934),('31be143f-c900-467d-9ed2-07fe5f6b44e1',1585303740471,'applications',1,1585303740471),('3491608f-5a8e-413c-9a6a-30df76037d69',1585310582608,'applications',2,1585310582608),('3a165140-027c-4b27-b899-fdf96b366a8a',1585303740471,'comments',1,1585303740471),('4bf8e427-7b8e-41db-a615-b16d5cebb138',1585310582608,'votes',3,1585310582608),('972fca1d-5d46-45ff-906c-dc17e41596b7',1585310582608,'comments',2,1585310582608),('b1e3f62e-8f75-434b-a2d1-930d8b60738f',1585317376801,'poolevents',6,1585317376801);
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
INSERT INTO `crew_leaderboard` VALUES ('4f4a2c0a-4661-4864-932a-39a40c5c3a87','15b0fb13-1625-4948-8d7d-67c7f1653129',240,1585317283560,1585320683448);
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `crews`
--

LOCK TABLES `crews` WRITE;
/*!40000 ALTER TABLE `crews` DISABLE KEYS */;
INSERT INTO `crews` VALUES ('15b0fb13-1625-4948-8d7d-67c7f1653129','Hamburg');
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='counts rsources scores -->  to determin resource of the day';
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
INSERT INTO `interval_trophies` VALUES ('095fa83b-8ae7-474c-b41b-1238598578be','GOLD',1584091333720,'fde60f19-0c4a-4f2b-8590-ab0f27b673ff'),('0b676e39-1d25-4c25-8aa5-0fa7c4b4c6dd','GOLD',1584087753091,'fde60f19-0c4a-4f2b-8590-ab0f27b673ff'),('1507caf3-6c70-4cf0-b22f-e36f0d8cf020','GOLD',1584087759093,'fde60f19-0c4a-4f2b-8590-ab0f27b673ff'),('234c65ca-5329-4335-a0ed-6c57f53ed804','BRONZE',1584091478569,'921bae28-995b-47e9-8f98-96f10e36d97f'),('2d187fc8-3f67-4918-95cd-e1c92f322290','BRONZE',1584091193757,'921bae28-995b-47e9-8f98-96f10e36d97f'),('2ed4eefb-938f-4b5e-9145-b5e3f11c0fc2','BRONZE',1584092229140,'921bae28-995b-47e9-8f98-96f10e36d97f'),('3bdba834-f29e-48ea-afc9-9526de7a13fa','SILVER',1584087756094,'11eb8ba3-c4f7-4aec-b8d8-4469df83f096'),('4fb2da7c-b372-4c3d-946d-e46e29661835','SILVER',1584087759094,'11eb8ba3-c4f7-4aec-b8d8-4469df83f096'),('5834af62-b724-42ea-bf21-46451f3ae107','BRONZE',1584091538151,'06cda1e3-7a42-47e5-aecc-f68d85fc9ef3'),('58e84931-8d5d-4082-ad5e-550fd56e6ae3','BRONZE',1584091248720,'921bae28-995b-47e9-8f98-96f10e36d97f'),('5bfe19bb-240d-42dd-b267-333cdc3d0548','GOLD',1584092229140,'fde60f19-0c4a-4f2b-8590-ab0f27b673ff'),('5d9ebbe4-a837-4e62-8898-a345d5e8d70e','SILVER',1584087750090,'11eb8ba3-c4f7-4aec-b8d8-4469df83f096'),('643d0a25-74d5-491c-81f5-ee45c63cea8a','GOLD',1584087750089,'fde60f19-0c4a-4f2b-8590-ab0f27b673ff'),('7785a09f-92c6-4031-84ca-4049496fbf65','SILVER',1584092229140,'11eb8ba3-c4f7-4aec-b8d8-4469df83f096'),('8b65297f-36b8-40e1-93c3-f554b77c3c17','GOLD',1584091193757,'fde60f19-0c4a-4f2b-8590-ab0f27b673ff'),('a23779be-23da-4e7a-8ea2-8b7db51382e7','SILVER',1584087753091,'11eb8ba3-c4f7-4aec-b8d8-4469df83f096'),('a56f6bd2-7e98-4564-823f-bbf8157e87c8','SILVER',1584091333721,'11eb8ba3-c4f7-4aec-b8d8-4469df83f096'),('a802e043-e083-4b65-832a-6ddcb4795fcb','SILVER',1584091478569,'11eb8ba3-c4f7-4aec-b8d8-4469df83f096'),('bf76002a-43a2-40d4-8d00-d2ef519c7a30','SILVER',1584091538151,'11eb8ba3-c4f7-4aec-b8d8-4469df83f096'),('c2d99028-507b-4c7f-a55b-5364c3819b65','GOLD',1584091478569,'fde60f19-0c4a-4f2b-8590-ab0f27b673ff'),('d786f4e8-3d25-4502-9fd8-eb2f993e9f6b','GOLD',1584091538151,'fde60f19-0c4a-4f2b-8590-ab0f27b673ff'),('dbf8fcb3-4e79-4fc3-b7b1-6913ce79453e','GOLD',1584091248719,'fde60f19-0c4a-4f2b-8590-ab0f27b673ff'),('f3473190-7238-4400-b249-83d39f484b5e','BRONZE',1584091333721,'921bae28-995b-47e9-8f98-96f10e36d97f'),('f44fc013-ddac-472f-a376-4c79f903d683','GOLD',1584087756093,'fde60f19-0c4a-4f2b-8590-ab0f27b673ff'),('fc0b686a-579e-4409-908d-c614f5876387','SILVER',1584091193757,'11eb8ba3-c4f7-4aec-b8d8-4469df83f096'),('fc2ff6eb-a024-4861-b42d-c3d9511cba71','SILVER',1584091248720,'11eb8ba3-c4f7-4aec-b8d8-4469df83f096');
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES ('4a74141e-c2c0-46a0-9c0c-84bef8be7d0f','15b0fb13-1625-4948-8d7d-67c7f1653129');
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

-- Dump completed on 2020-07-01 16:37:07
