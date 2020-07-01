-- MariaDB dump 10.17  Distrib 10.4.12-MariaDB, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: wavesdb
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
-- Table structure for table `applications`
--

DROP TABLE IF EXISTS `applications`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `applications` (
  `idapplication` varchar(225) NOT NULL,
  `user_id` varchar(128) NOT NULL,
  `text` text DEFAULT NULL,
  `state` enum('WAITING','ACCEPTED','REJECTED') NOT NULL DEFAULT 'WAITING',
  `poolevent_id` varchar(225) NOT NULL,
  `updated_at` bigint(11) NOT NULL,
  `created_at` bigint(11) NOT NULL,
  PRIMARY KEY (`idapplication`),
  UNIQUE KEY `uq_uid_peid` (`user_id`,`poolevent_id`),
  KEY `fk_poolevent_idx` (`poolevent_id`),
  KEY `fk_user_idx` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `applications`
--

LOCK TABLES `applications` WRITE;
/*!40000 ALTER TABLE `applications` DISABLE KEYS */;
INSERT INTO `applications` VALUES ('9524ec6f-cb35-4f60-a7d6-ce43cfced1f8','4a74141e-c2c0-46a0-9c0c-84bef8be7d0f','adsadasd','WAITING','a0efaa7f-a529-4fbe-9087-7945c0cd3922',1585303778022,1585303778022),('cc115082-29a1-405f-8d7c-d2b984b04619','4a74141e-c2c0-46a0-9c0c-84bef8be7d0f','asdasdasd','WAITING','27b46f85-14ec-42a7-be8c-fe5a099eed3a',1585311156956,1585311156956),('d205e4e7-d6ab-467b-ae05-7d613ce1fd98','4a74141e-c2c0-46a0-9c0c-84bef8be7d0f','asdasda','WAITING','2891cb0a-68ef-44e4-9e57-4cf6d71fdb07',1585311232829,1585311232829),('f95e5e91-9446-4d17-a60c-d5cafbad88b5','4a74141e-c2c0-46a0-9c0c-84bef8be7d0f','asdasdasdasd','WAITING','80773acf-fecb-47df-8855-08571ccef151',1585320683052,1585320683051);
/*!40000 ALTER TABLE `applications` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comments`
--

DROP TABLE IF EXISTS `comments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `comments` (
  `idcomment` varchar(225) NOT NULL,
  `text` mediumtext NOT NULL,
  `user_id` varchar(128) NOT NULL,
  `poolevent_id` varchar(225) NOT NULL,
  `created_at` bigint(20) NOT NULL,
  `edited_at` bigint(20) NOT NULL,
  PRIMARY KEY (`idcomment`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comments`
--

LOCK TABLES `comments` WRITE;
/*!40000 ALTER TABLE `comments` DISABLE KEYS */;
INSERT INTO `comments` VALUES ('040c3f30-8680-4f60-8441-2ee89bd77731','sfsdf','4a74141e-c2c0-46a0-9c0c-84bef8be7d0f','2891cb0a-68ef-44e4-9e57-4cf6d71fdb07',1585311293031,1585311293031),('3b2cf4aa-5b21-46d8-b4ec-faf92443bb15','asdasdasd','4a74141e-c2c0-46a0-9c0c-84bef8be7d0f','2891cb0a-68ef-44e4-9e57-4cf6d71fdb07',1585311247771,1585311247771),('4d5df0f7-3285-423f-8b74-59b95ef42c2d','scasdasdasd','4a74141e-c2c0-46a0-9c0c-84bef8be7d0f','2891cb0a-68ef-44e4-9e57-4cf6d71fdb07',1585311245680,1585311245680),('8118ceb9-9920-45c6-b398-4cf09c9deb23','dgdfgdfg','4a74141e-c2c0-46a0-9c0c-84bef8be7d0f','2891cb0a-68ef-44e4-9e57-4cf6d71fdb07',1585320121550,1585320121550),('9c7bfddd-ecbe-404f-bc91-3a535d6bb0c6','asdasdad','4a74141e-c2c0-46a0-9c0c-84bef8be7d0f','2891cb0a-68ef-44e4-9e57-4cf6d71fdb07',1585317282666,1585317282666),('a408491a-c909-4163-969b-73838661cad1','asdasd','4a74141e-c2c0-46a0-9c0c-84bef8be7d0f','2891cb0a-68ef-44e4-9e57-4cf6d71fdb07',1585320076262,1585320076262),('a7d924d9-8058-4a69-aa22-8e885a0f896a','dfgdfgdf','4a74141e-c2c0-46a0-9c0c-84bef8be7d0f','2891cb0a-68ef-44e4-9e57-4cf6d71fdb07',1585320088159,1585320088159),('d23e70ce-9370-4d45-88be-e6174bea4401','asdasdsad','4a74141e-c2c0-46a0-9c0c-84bef8be7d0f','a0efaa7f-a529-4fbe-9087-7945c0cd3922',1585303782140,1585303782140);
/*!40000 ALTER TABLE `comments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `descriptions`
--

DROP TABLE IF EXISTS `descriptions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `descriptions` (
  `id` varchar(225) NOT NULL,
  `text` text NOT NULL,
  `html` varchar(128) DEFAULT NULL,
  `poolevent_id` varchar(225) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `descriptions`
--

LOCK TABLES `descriptions` WRITE;
/*!40000 ALTER TABLE `descriptions` DISABLE KEYS */;
INSERT INTO `descriptions` VALUES ('2d06e947-b0eb-488e-9f20-b35f179aa3f6','','','c6bde2bb-e559-4e42-b347-770e6e1ba70b'),('56eddbfa-b433-4133-80c2-6bcf90bb0405','','<p>asdasd</p>','a0efaa7f-a529-4fbe-9087-7945c0cd3922'),('5f6053c7-2bf8-4bf1-a3c4-b124ae84a622','','<p>asdad</p>','8ea7cd77-502c-4f8b-8e52-2f00a956f322'),('6d7b9c21-45f0-4fba-8b10-fcf113e4e911','','<p>asdad</p>','2891cb0a-68ef-44e4-9e57-4cf6d71fdb07'),('92222988-d063-4c56-b4dc-f0896d97b40e','','<p>asdad</p>','dd0d74e7-537f-4797-a9c9-11595f599f64'),('93c01bc5-2a77-4593-80bf-10e2358cc854','','<p>asdad</p>','49e8eabf-805f-4ac6-adaf-a710fd30a833'),('a0dd41f8-d310-4812-ba97-80bd68b1d098','','<p>asdasda</p>','80773acf-fecb-47df-8855-08571ccef151');
/*!40000 ALTER TABLE `descriptions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `favorites`
--

DROP TABLE IF EXISTS `favorites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `favorites` (
  `idfavorite` varchar(225) NOT NULL,
  `poolevent_id` varchar(225) NOT NULL,
  `user_id` varchar(128) NOT NULL,
  `created_at` bigint(11) NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`idfavorite`),
  UNIQUE KEY `id_UNIQUE` (`idfavorite`),
  KEY `userfave_idx` (`user_id`),
  KEY `poolevent_fave_idx` (`poolevent_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `favorites`
--

LOCK TABLES `favorites` WRITE;
/*!40000 ALTER TABLE `favorites` DISABLE KEYS */;
INSERT INTO `favorites` VALUES ('00427950-9a13-43b3-90d8-35840a522d05','c6bde2bb-e559-4e42-b347-770e6e1ba70b','4a74141e-c2c0-46a0-9c0c-84bef8be7d0f',1584873537435);
/*!40000 ALTER TABLE `favorites` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `locations`
--

DROP TABLE IF EXISTS `locations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `locations` (
  `id` varchar(225) NOT NULL,
  `poolevent_id` varchar(225) NOT NULL,
  `route` varchar(45) NOT NULL,
  `street_number` varchar(45) NOT NULL,
  `full_address` varchar(45) DEFAULT NULL,
  `longitude` varchar(45) NOT NULL,
  `latitude` varchar(45) NOT NULL,
  `locality` varchar(45) NOT NULL,
  `country` varchar(45) DEFAULT NULL,
  `postal_code` varchar(45) DEFAULT NULL,
  `desc` text DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `locations`
--

LOCK TABLES `locations` WRITE;
/*!40000 ALTER TABLE `locations` DISABLE KEYS */;
INSERT INTO `locations` VALUES ('203e71c0-6ea1-4ef3-882b-f4afbb04d7a9','80773acf-fecb-47df-8855-08571ccef151','Hiddenseer Straße','1','Hiddenseer Straße 1, 10437 Berlin','13.4257992','52.5426583','Berlin','','10437','dfdgfsg'),('24788efc-f9a0-4b2c-90d8-6eb0aa712f44','8ea7cd77-502c-4f8b-8e52-2f00a956f322','Hiddenseer Straße','2','Hiddenseer Straße 2, 10437 Berlin','13.425112','52.54273749999999','Berlin','','10437','asdasd'),('7b4ba140-59db-4e6f-bb87-5d50553b4d0a','a0efaa7f-a529-4fbe-9087-7945c0cd3922','Hiddenseer Straße','2','Hiddenseer Straße 2, 10437 Berlin','13.425112','52.54273749999999','Berlin','','10437','asdasdad'),('a0343aaf-dd39-44fa-a208-af0689b9fc28','27b46f85-14ec-42a7-be8c-fe5a099eed3a','Solmsstraße','2','Solmsstraße 2, 60486 Frankfurt am Main','8.6386542','50.1189696','Frankfurt am Main','','60486','Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam et fermentum dui. Ut orci quam, ornare sed lorem sed, hendrerit auctor dolor. Nulla viverra, nibh quis ultrices malesuada, ligula ipsum vulputate diam, aliquam egestas nibh ante vel dui. Sed in tellus interdum eros vulputate placerat sed non enim. Pellentesque eget justo porttitor urna dictum fermentum sit amet sed mauris. Praesent molestie vestibulum erat ac rhoncus. Aenean nunc risus, accumsan nec ipsum et, convallis sollicitudin dui. Proin dictum quam a semper malesuada. Etiam porta sit amet risus quis porta. Nulla facilisi. Cras at interdum ante. Ut gravida pharetra ligula vitae malesuada.'),('aa491a1b-18d1-4d13-b967-bc30e19aab26','49e8eabf-805f-4ac6-adaf-a710fd30a833','Hiddenseer Straße','2','Hiddenseer Straße 2, 10437 Berlin','13.425112','52.54273749999999','Berlin','','10437','asdasd'),('aaed357e-4cae-4de6-a205-b36ccf731f1b','c6bde2bb-e559-4e42-b347-770e6e1ba70b','Hiddenseer Straße','2','Hiddenseer Straße 2, 10437 Berlin','13.425112','52.54273749999999','Berlin','','10437','Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam et fermentum dui. Ut orci quam, ornare sed lorem sed, hendrerit.'),('be41bf07-6797-4ae9-80df-b29ce73dbcf1','dd0d74e7-537f-4797-a9c9-11595f599f64','Hiddenseer Straße','2','Hiddenseer Straße 2, 10437 Berlin','13.425112','52.54273749999999','Berlin','','10437','asdasd'),('e5447525-c05d-4630-8bc1-964b864d14d7','2891cb0a-68ef-44e4-9e57-4cf6d71fdb07','Hiddenseer Straße','2','Hiddenseer Straße 2, 10437 Berlin','13.425112','52.54273749999999','Berlin','','10437','asdasd');
/*!40000 ALTER TABLE `locations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notification_poolevents`
--

DROP TABLE IF EXISTS `notification_poolevents`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `notification_poolevents` (
  `id` int(11) NOT NULL,
  `notification_type` enum('NEW') DEFAULT NULL,
  `source_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notification_poolevents`
--

LOCK TABLES `notification_poolevents` WRITE;
/*!40000 ALTER TABLE `notification_poolevents` DISABLE KEYS */;
INSERT INTO `notification_poolevents` VALUES (708,'NEW',456),(709,'NEW',457),(710,'NEW',458),(711,'NEW',459),(712,'NEW',460),(713,'NEW',461),(714,'NEW',462),(715,'NEW',462),(716,'NEW',463),(717,'NEW',463),(718,'NEW',464),(719,'NEW',464),(720,'NEW',465),(721,'NEW',465),(727,'NEW',466),(728,'NEW',466),(729,'NEW',467),(730,'NEW',467),(731,'NEW',468),(732,'NEW',468),(733,'NEW',469),(734,'NEW',469),(735,'NEW',470),(736,'NEW',470),(738,'NEW',471),(739,'NEW',471),(740,'NEW',472),(741,'NEW',472),(745,'NEW',473),(746,'NEW',473),(747,'NEW',474),(748,'NEW',474),(751,'NEW',475),(752,'NEW',475),(753,'NEW',476),(754,'NEW',476),(755,'NEW',477),(756,'NEW',477),(757,'NEW',478),(758,'NEW',478),(759,'NEW',479),(760,'NEW',479),(761,'NEW',480),(762,'NEW',480),(763,'NEW',481),(764,'NEW',481),(765,'NEW',482),(766,'NEW',482),(767,'NEW',483),(768,'NEW',483),(769,'NEW',484),(770,'NEW',484),(772,'NEW',485),(773,'NEW',485),(774,'NEW',486),(775,'NEW',486),(776,'NEW',487),(777,'NEW',487),(778,'NEW',488),(779,'NEW',488),(781,'NEW',489),(782,'NEW',489),(783,'NEW',490),(784,'NEW',490),(785,'NEW',491),(786,'NEW',491),(787,'NEW',492),(788,'NEW',492),(789,'NEW',493),(790,'NEW',493),(792,'NEW',494),(793,'NEW',494),(794,'NEW',495),(795,'NEW',495),(796,'NEW',496),(797,'NEW',496),(798,'NEW',497),(799,'NEW',497),(802,'NEW',498),(803,'NEW',498),(804,'NEW',499),(805,'NEW',499),(806,'NEW',500),(807,'NEW',500),(808,'NEW',501),(809,'NEW',501),(810,'NEW',502),(811,'NEW',502),(812,'NEW',503),(813,'NEW',503),(814,'NEW',504),(815,'NEW',504),(816,'NEW',505),(817,'NEW',505),(818,'NEW',506),(819,'NEW',506),(820,'NEW',507),(821,'NEW',507),(822,'NEW',508),(823,'NEW',508),(824,'NEW',509),(825,'NEW',509),(826,'NEW',510),(827,'NEW',510),(828,'NEW',511),(829,'NEW',511),(830,'NEW',512),(831,'NEW',512),(832,'NEW',513),(833,'NEW',513),(834,'NEW',514),(835,'NEW',514),(836,'NEW',515),(837,'NEW',515),(838,'NEW',516),(839,'NEW',516),(840,'NEW',517),(841,'NEW',517),(842,'NEW',518),(843,'NEW',518),(844,'NEW',519),(845,'NEW',519),(846,'NEW',520),(847,'NEW',520),(848,'NEW',521),(849,'NEW',521),(850,'NEW',522),(851,'NEW',522),(852,'NEW',523),(853,'NEW',523),(854,'NEW',524),(855,'NEW',524);
/*!40000 ALTER TABLE `notification_poolevents` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notifications`
--

DROP TABLE IF EXISTS `notifications`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `notifications` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` varchar(128) NOT NULL,
  `type` enum('poolevents','comments','votes','badges') NOT NULL COMMENT 'ENUM(''PE_NEW'', \\\\\\\\n''PE_RELEASED'',\\\\\\\\n ''PE_CANCELLED'', \\\\\\\\n''NEW_COMMENT'', \\\\\\\\n''NEW_VOTE'', \\\\\\\\n''APPLICATION_REJECTED'',\\\\\\\\n ''APPLICATION_ACCEPETED’,\\\\\\\\n)',
  `desc` text DEFAULT NULL,
  `source_id` int(11) NOT NULL,
  `dirty` tinyint(1) DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `trigger_id` varchar(128) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=856 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notifications`
--

LOCK TABLES `notifications` WRITE;
/*!40000 ALTER TABLE `notifications` DISABLE KEYS */;
INSERT INTO `notifications` VALUES (708,'4a74141e-c2c0-46a0-9c0c-84bef8be7d0f','poolevents',NULL,0,1,'2020-01-11 19:19:21',NULL),(709,'4a74141e-c2c0-46a0-9c0c-84bef8be7d0f','poolevents',NULL,0,1,'2020-01-11 19:19:38',NULL),(710,'4a74141e-c2c0-46a0-9c0c-84bef8be7d0f','poolevents',NULL,0,1,'2020-01-11 19:19:39',NULL),(711,'4a74141e-c2c0-46a0-9c0c-84bef8be7d0f','poolevents',NULL,0,1,'2020-01-11 19:19:40',NULL),(712,'4a74141e-c2c0-46a0-9c0c-84bef8be7d0f','poolevents',NULL,0,1,'2020-01-11 19:19:41',NULL),(713,'4a74141e-c2c0-46a0-9c0c-84bef8be7d0f','poolevents',NULL,0,1,'2020-01-11 19:19:41',NULL),(714,'4a74141e-c2c0-46a0-9c0c-84bef8be7d0f','poolevents',NULL,0,1,'2020-01-12 09:02:49',NULL),(715,'8d411dc4-e76f-4d0e-a027-056a0bc43be5','poolevents',NULL,0,1,'2020-01-12 09:02:49',NULL),(716,'4a74141e-c2c0-46a0-9c0c-84bef8be7d0f','poolevents',NULL,0,1,'2020-01-12 09:02:57',NULL),(717,'8d411dc4-e76f-4d0e-a027-056a0bc43be5','poolevents',NULL,0,1,'2020-01-12 09:02:57',NULL),(718,'4a74141e-c2c0-46a0-9c0c-84bef8be7d0f','poolevents',NULL,0,1,'2020-01-12 09:25:20',NULL),(719,'8d411dc4-e76f-4d0e-a027-056a0bc43be5','poolevents',NULL,0,1,'2020-01-12 09:25:20',NULL),(720,'4a74141e-c2c0-46a0-9c0c-84bef8be7d0f','poolevents',NULL,0,1,'2020-01-12 09:26:48',NULL),(721,'8d411dc4-e76f-4d0e-a027-056a0bc43be5','poolevents',NULL,0,1,'2020-01-12 09:26:48',NULL),(722,'4a74141e-c2c0-46a0-9c0c-84bef8be7d0f','badges','',378,1,'2020-01-12 09:26:48','4a74141e-c2c0-46a0-9c0c-84bef8be7d0f'),(723,'8d411dc4-e76f-4d0e-a027-056a0bc43be5','badges','',379,1,'2020-01-12 11:06:11','8d411dc4-e76f-4d0e-a027-056a0bc43be5'),(724,'8d411dc4-e76f-4d0e-a027-056a0bc43be5','badges','',382,1,'2020-01-12 11:06:28','8d411dc4-e76f-4d0e-a027-056a0bc43be5'),(725,'8d411dc4-e76f-4d0e-a027-056a0bc43be5','badges','',384,1,'2020-01-12 22:03:23','8d411dc4-e76f-4d0e-a027-056a0bc43be5'),(726,'4a74141e-c2c0-46a0-9c0c-84bef8be7d0f','badges','',382,1,'2020-01-13 17:44:27','4a74141e-c2c0-46a0-9c0c-84bef8be7d0f'),(727,'4a74141e-c2c0-46a0-9c0c-84bef8be7d0f','poolevents',NULL,0,1,'2020-01-13 19:31:22',NULL),(728,'8d411dc4-e76f-4d0e-a027-056a0bc43be5','poolevents',NULL,0,1,'2020-01-13 19:31:22',NULL),(729,'4a74141e-c2c0-46a0-9c0c-84bef8be7d0f','poolevents',NULL,0,1,'2020-01-13 19:31:28',NULL),(730,'8d411dc4-e76f-4d0e-a027-056a0bc43be5','poolevents',NULL,0,1,'2020-01-13 19:31:28',NULL),(731,'4a74141e-c2c0-46a0-9c0c-84bef8be7d0f','poolevents',NULL,0,1,'2020-01-13 19:31:37',NULL),(732,'8d411dc4-e76f-4d0e-a027-056a0bc43be5','poolevents',NULL,0,1,'2020-01-13 19:31:37',NULL),(733,'4a74141e-c2c0-46a0-9c0c-84bef8be7d0f','poolevents',NULL,0,1,'2020-01-13 19:33:21',NULL),(734,'8d411dc4-e76f-4d0e-a027-056a0bc43be5','poolevents',NULL,0,1,'2020-01-13 19:33:21',NULL),(735,'4a74141e-c2c0-46a0-9c0c-84bef8be7d0f','poolevents',NULL,0,1,'2020-01-13 20:26:01',NULL),(736,'8d411dc4-e76f-4d0e-a027-056a0bc43be5','poolevents',NULL,0,1,'2020-01-13 20:26:01',NULL),(737,'4a74141e-c2c0-46a0-9c0c-84bef8be7d0f','badges','',379,1,'2020-01-16 13:50:53','4a74141e-c2c0-46a0-9c0c-84bef8be7d0f'),(738,'4a74141e-c2c0-46a0-9c0c-84bef8be7d0f','poolevents',NULL,0,1,'2020-01-17 19:07:37',NULL),(739,'8d411dc4-e76f-4d0e-a027-056a0bc43be5','poolevents',NULL,0,1,'2020-01-17 19:07:37',NULL),(740,'4a74141e-c2c0-46a0-9c0c-84bef8be7d0f','poolevents',NULL,0,1,'2020-01-18 11:50:29',NULL),(741,'8d411dc4-e76f-4d0e-a027-056a0bc43be5','poolevents',NULL,0,1,'2020-01-18 11:50:29',NULL),(742,'4a74141e-c2c0-46a0-9c0c-84bef8be7d0f','badges','',380,1,'2020-01-22 08:18:59','4a74141e-c2c0-46a0-9c0c-84bef8be7d0f'),(743,'4a74141e-c2c0-46a0-9c0c-84bef8be7d0f','badges','',385,1,'2020-01-23 20:13:14','4a74141e-c2c0-46a0-9c0c-84bef8be7d0f'),(744,'4a74141e-c2c0-46a0-9c0c-84bef8be7d0f','badges','',381,1,'2020-01-23 20:19:57','4a74141e-c2c0-46a0-9c0c-84bef8be7d0f'),(745,'4a74141e-c2c0-46a0-9c0c-84bef8be7d0f','poolevents',NULL,0,1,'2020-01-27 13:32:18',NULL),(746,'8d411dc4-e76f-4d0e-a027-056a0bc43be5','poolevents',NULL,0,1,'2020-01-27 13:32:18',NULL),(747,'4a74141e-c2c0-46a0-9c0c-84bef8be7d0f','poolevents',NULL,0,1,'2020-01-27 13:38:06',NULL),(748,'8d411dc4-e76f-4d0e-a027-056a0bc43be5','poolevents',NULL,0,1,'2020-01-27 13:38:06',NULL),(749,'4a74141e-c2c0-46a0-9c0c-84bef8be7d0f','badges','',386,1,'2020-02-01 22:55:29','4a74141e-c2c0-46a0-9c0c-84bef8be7d0f'),(750,'4a74141e-c2c0-46a0-9c0c-84bef8be7d0f','badges','',384,1,'2020-02-09 22:32:05','4a74141e-c2c0-46a0-9c0c-84bef8be7d0f'),(751,'4a74141e-c2c0-46a0-9c0c-84bef8be7d0f','poolevents',NULL,0,1,'2020-02-10 12:34:22',NULL),(752,'8d411dc4-e76f-4d0e-a027-056a0bc43be5','poolevents',NULL,0,1,'2020-02-10 12:34:22',NULL),(753,'4a74141e-c2c0-46a0-9c0c-84bef8be7d0f','poolevents',NULL,0,1,'2020-02-10 12:35:41',NULL),(754,'8d411dc4-e76f-4d0e-a027-056a0bc43be5','poolevents',NULL,0,1,'2020-02-10 12:35:41',NULL),(755,'4a74141e-c2c0-46a0-9c0c-84bef8be7d0f','poolevents',NULL,0,1,'2020-02-10 12:39:29',NULL),(756,'8d411dc4-e76f-4d0e-a027-056a0bc43be5','poolevents',NULL,0,1,'2020-02-10 12:39:29',NULL),(757,'4a74141e-c2c0-46a0-9c0c-84bef8be7d0f','poolevents',NULL,0,1,'2020-02-10 12:46:21',NULL),(758,'8d411dc4-e76f-4d0e-a027-056a0bc43be5','poolevents',NULL,0,1,'2020-02-10 12:46:21',NULL),(759,'4a74141e-c2c0-46a0-9c0c-84bef8be7d0f','poolevents',NULL,0,1,'2020-02-10 12:49:08',NULL),(760,'8d411dc4-e76f-4d0e-a027-056a0bc43be5','poolevents',NULL,0,1,'2020-02-10 12:49:08',NULL),(761,'4a74141e-c2c0-46a0-9c0c-84bef8be7d0f','poolevents',NULL,0,1,'2020-02-10 12:58:02',NULL),(762,'8d411dc4-e76f-4d0e-a027-056a0bc43be5','poolevents',NULL,0,1,'2020-02-10 12:58:02',NULL),(763,'4a74141e-c2c0-46a0-9c0c-84bef8be7d0f','poolevents',NULL,0,1,'2020-02-10 12:58:40',NULL),(764,'8d411dc4-e76f-4d0e-a027-056a0bc43be5','poolevents',NULL,0,1,'2020-02-10 12:58:40',NULL),(765,'4a74141e-c2c0-46a0-9c0c-84bef8be7d0f','poolevents',NULL,0,1,'2020-02-10 13:00:57',NULL),(766,'8d411dc4-e76f-4d0e-a027-056a0bc43be5','poolevents',NULL,0,1,'2020-02-10 13:00:57',NULL),(767,'4a74141e-c2c0-46a0-9c0c-84bef8be7d0f','poolevents',NULL,0,1,'2020-02-10 13:22:58',NULL),(768,'8d411dc4-e76f-4d0e-a027-056a0bc43be5','poolevents',NULL,0,1,'2020-02-10 13:22:58',NULL),(769,'4a74141e-c2c0-46a0-9c0c-84bef8be7d0f','poolevents',NULL,0,1,'2020-02-10 16:40:17',NULL),(770,'8d411dc4-e76f-4d0e-a027-056a0bc43be5','poolevents',NULL,0,1,'2020-02-10 16:40:17',NULL),(771,'8d411dc4-e76f-4d0e-a027-056a0bc43be5','badges','',376,1,'2020-02-10 16:40:17','8d411dc4-e76f-4d0e-a027-056a0bc43be5'),(772,'4a74141e-c2c0-46a0-9c0c-84bef8be7d0f','poolevents',NULL,0,1,'2020-02-10 16:41:41',NULL),(773,'8d411dc4-e76f-4d0e-a027-056a0bc43be5','poolevents',NULL,0,1,'2020-02-10 16:41:41',NULL),(774,'4a74141e-c2c0-46a0-9c0c-84bef8be7d0f','poolevents',NULL,0,1,'2020-02-10 19:12:38',NULL),(775,'8d411dc4-e76f-4d0e-a027-056a0bc43be5','poolevents',NULL,0,1,'2020-02-10 19:12:38',NULL),(776,'4a74141e-c2c0-46a0-9c0c-84bef8be7d0f','poolevents',NULL,0,1,'2020-02-10 19:17:38',NULL),(777,'8d411dc4-e76f-4d0e-a027-056a0bc43be5','poolevents',NULL,0,1,'2020-02-10 19:17:38',NULL),(778,'4a74141e-c2c0-46a0-9c0c-84bef8be7d0f','poolevents',NULL,0,1,'2020-02-10 19:19:17',NULL),(779,'8d411dc4-e76f-4d0e-a027-056a0bc43be5','poolevents',NULL,0,1,'2020-02-10 19:19:17',NULL),(780,'8d411dc4-e76f-4d0e-a027-056a0bc43be5','badges','',377,1,'2020-02-10 19:19:17','8d411dc4-e76f-4d0e-a027-056a0bc43be5'),(781,'4a74141e-c2c0-46a0-9c0c-84bef8be7d0f','poolevents',NULL,0,1,'2020-02-10 19:20:03',NULL),(782,'8d411dc4-e76f-4d0e-a027-056a0bc43be5','poolevents',NULL,0,1,'2020-02-10 19:20:03',NULL),(783,'4a74141e-c2c0-46a0-9c0c-84bef8be7d0f','poolevents',NULL,0,1,'2020-02-10 19:20:04',NULL),(784,'8d411dc4-e76f-4d0e-a027-056a0bc43be5','poolevents',NULL,0,1,'2020-02-10 19:20:04',NULL),(785,'4a74141e-c2c0-46a0-9c0c-84bef8be7d0f','poolevents',NULL,0,1,'2020-02-10 19:20:05',NULL),(786,'8d411dc4-e76f-4d0e-a027-056a0bc43be5','poolevents',NULL,0,1,'2020-02-10 19:20:05',NULL),(787,'4a74141e-c2c0-46a0-9c0c-84bef8be7d0f','poolevents',NULL,0,1,'2020-02-10 21:10:25',NULL),(788,'8d411dc4-e76f-4d0e-a027-056a0bc43be5','poolevents',NULL,0,1,'2020-02-10 21:10:25',NULL),(789,'4a74141e-c2c0-46a0-9c0c-84bef8be7d0f','poolevents',NULL,0,1,'2020-02-10 21:10:43',NULL),(790,'8d411dc4-e76f-4d0e-a027-056a0bc43be5','poolevents',NULL,0,1,'2020-02-10 21:10:43',NULL),(791,'8d411dc4-e76f-4d0e-a027-056a0bc43be5','badges','',378,1,'2020-02-10 21:10:43','8d411dc4-e76f-4d0e-a027-056a0bc43be5'),(792,'4a74141e-c2c0-46a0-9c0c-84bef8be7d0f','poolevents',NULL,0,1,'2020-02-10 21:10:44',NULL),(793,'8d411dc4-e76f-4d0e-a027-056a0bc43be5','poolevents',NULL,0,1,'2020-02-10 21:10:44',NULL),(794,'4a74141e-c2c0-46a0-9c0c-84bef8be7d0f','poolevents',NULL,0,1,'2020-02-10 21:10:44',NULL),(795,'8d411dc4-e76f-4d0e-a027-056a0bc43be5','poolevents',NULL,0,1,'2020-02-10 21:10:44',NULL),(796,'4a74141e-c2c0-46a0-9c0c-84bef8be7d0f','poolevents',NULL,0,1,'2020-02-10 21:10:44',NULL),(797,'8d411dc4-e76f-4d0e-a027-056a0bc43be5','poolevents',NULL,0,1,'2020-02-10 21:10:44',NULL),(798,'4a74141e-c2c0-46a0-9c0c-84bef8be7d0f','poolevents',NULL,0,1,'2020-02-10 21:10:44',NULL),(799,'8d411dc4-e76f-4d0e-a027-056a0bc43be5','poolevents',NULL,0,1,'2020-02-10 21:10:44',NULL),(800,'8d411dc4-e76f-4d0e-a027-056a0bc43be5','badges','',385,1,'2020-02-10 21:59:21','8d411dc4-e76f-4d0e-a027-056a0bc43be5'),(801,'4a74141e-c2c0-46a0-9c0c-84bef8be7d0f','badges','',383,1,'2020-02-12 21:24:06','4a74141e-c2c0-46a0-9c0c-84bef8be7d0f'),(802,'4a74141e-c2c0-46a0-9c0c-84bef8be7d0f','poolevents',NULL,0,1,'2020-02-15 08:22:31',NULL),(803,'8d411dc4-e76f-4d0e-a027-056a0bc43be5','poolevents',NULL,0,1,'2020-02-15 08:22:31',NULL),(804,'4a74141e-c2c0-46a0-9c0c-84bef8be7d0f','poolevents',NULL,0,1,'2020-02-15 11:06:27',NULL),(805,'8d411dc4-e76f-4d0e-a027-056a0bc43be5','poolevents',NULL,0,0,'2020-02-15 11:06:27',NULL),(806,'4a74141e-c2c0-46a0-9c0c-84bef8be7d0f','poolevents',NULL,0,1,'2020-02-15 11:46:22',NULL),(807,'8d411dc4-e76f-4d0e-a027-056a0bc43be5','poolevents',NULL,0,0,'2020-02-15 11:46:22',NULL),(808,'4a74141e-c2c0-46a0-9c0c-84bef8be7d0f','poolevents',NULL,0,1,'2020-02-15 11:53:14',NULL),(809,'8d411dc4-e76f-4d0e-a027-056a0bc43be5','poolevents',NULL,0,0,'2020-02-15 11:53:14',NULL),(810,'4a74141e-c2c0-46a0-9c0c-84bef8be7d0f','poolevents',NULL,0,1,'2020-02-15 11:54:07',NULL),(811,'8d411dc4-e76f-4d0e-a027-056a0bc43be5','poolevents',NULL,0,0,'2020-02-15 11:54:07',NULL),(812,'4a74141e-c2c0-46a0-9c0c-84bef8be7d0f','poolevents',NULL,0,1,'2020-02-15 11:55:13',NULL),(813,'8d411dc4-e76f-4d0e-a027-056a0bc43be5','poolevents',NULL,0,0,'2020-02-15 11:55:13',NULL),(814,'4a74141e-c2c0-46a0-9c0c-84bef8be7d0f','poolevents',NULL,0,1,'2020-02-15 11:57:48',NULL),(815,'8d411dc4-e76f-4d0e-a027-056a0bc43be5','poolevents',NULL,0,0,'2020-02-15 11:57:48',NULL),(816,'4a74141e-c2c0-46a0-9c0c-84bef8be7d0f','poolevents',NULL,0,1,'2020-02-15 12:02:39',NULL),(817,'8d411dc4-e76f-4d0e-a027-056a0bc43be5','poolevents',NULL,0,0,'2020-02-15 12:02:39',NULL),(818,'4a74141e-c2c0-46a0-9c0c-84bef8be7d0f','poolevents',NULL,0,1,'2020-02-15 12:04:08',NULL),(819,'8d411dc4-e76f-4d0e-a027-056a0bc43be5','poolevents',NULL,0,0,'2020-02-15 12:04:08',NULL),(820,'4a74141e-c2c0-46a0-9c0c-84bef8be7d0f','poolevents',NULL,0,1,'2020-02-15 12:07:44',NULL),(821,'8d411dc4-e76f-4d0e-a027-056a0bc43be5','poolevents',NULL,0,0,'2020-02-15 12:07:44',NULL),(822,'4a74141e-c2c0-46a0-9c0c-84bef8be7d0f','poolevents',NULL,0,1,'2020-02-15 12:10:39',NULL),(823,'8d411dc4-e76f-4d0e-a027-056a0bc43be5','poolevents',NULL,0,0,'2020-02-15 12:10:39',NULL),(824,'4a74141e-c2c0-46a0-9c0c-84bef8be7d0f','poolevents',NULL,0,1,'2020-02-15 12:11:30',NULL),(825,'8d411dc4-e76f-4d0e-a027-056a0bc43be5','poolevents',NULL,0,0,'2020-02-15 12:11:30',NULL),(826,'4a74141e-c2c0-46a0-9c0c-84bef8be7d0f','poolevents',NULL,0,1,'2020-02-15 12:14:40',NULL),(827,'8d411dc4-e76f-4d0e-a027-056a0bc43be5','poolevents',NULL,0,0,'2020-02-15 12:14:40',NULL),(828,'4a74141e-c2c0-46a0-9c0c-84bef8be7d0f','poolevents',NULL,0,1,'2020-02-15 12:16:13',NULL),(829,'8d411dc4-e76f-4d0e-a027-056a0bc43be5','poolevents',NULL,0,0,'2020-02-15 12:16:13',NULL),(830,'4a74141e-c2c0-46a0-9c0c-84bef8be7d0f','poolevents',NULL,0,1,'2020-02-15 12:16:30',NULL),(831,'8d411dc4-e76f-4d0e-a027-056a0bc43be5','poolevents',NULL,0,0,'2020-02-15 12:16:30',NULL),(832,'4a74141e-c2c0-46a0-9c0c-84bef8be7d0f','poolevents',NULL,0,1,'2020-02-15 12:18:36',NULL),(833,'8d411dc4-e76f-4d0e-a027-056a0bc43be5','poolevents',NULL,0,0,'2020-02-15 12:18:36',NULL),(834,'4a74141e-c2c0-46a0-9c0c-84bef8be7d0f','poolevents',NULL,0,1,'2020-02-15 12:19:14',NULL),(835,'8d411dc4-e76f-4d0e-a027-056a0bc43be5','poolevents',NULL,0,0,'2020-02-15 12:19:14',NULL),(836,'4a74141e-c2c0-46a0-9c0c-84bef8be7d0f','poolevents',NULL,0,1,'2020-02-15 12:20:25',NULL),(837,'8d411dc4-e76f-4d0e-a027-056a0bc43be5','poolevents',NULL,0,0,'2020-02-15 12:20:25',NULL),(838,'4a74141e-c2c0-46a0-9c0c-84bef8be7d0f','poolevents',NULL,0,1,'2020-02-15 12:22:58',NULL),(839,'8d411dc4-e76f-4d0e-a027-056a0bc43be5','poolevents',NULL,0,0,'2020-02-15 12:22:58',NULL),(840,'4a74141e-c2c0-46a0-9c0c-84bef8be7d0f','poolevents',NULL,0,1,'2020-02-15 12:26:11',NULL),(841,'8d411dc4-e76f-4d0e-a027-056a0bc43be5','poolevents',NULL,0,0,'2020-02-15 12:26:11',NULL),(842,'4a74141e-c2c0-46a0-9c0c-84bef8be7d0f','poolevents',NULL,0,1,'2020-02-15 12:26:26',NULL),(843,'8d411dc4-e76f-4d0e-a027-056a0bc43be5','poolevents',NULL,0,0,'2020-02-15 12:26:26',NULL),(844,'4a74141e-c2c0-46a0-9c0c-84bef8be7d0f','poolevents',NULL,0,1,'2020-02-15 12:28:09',NULL),(845,'8d411dc4-e76f-4d0e-a027-056a0bc43be5','poolevents',NULL,0,0,'2020-02-15 12:28:09',NULL),(846,'4a74141e-c2c0-46a0-9c0c-84bef8be7d0f','poolevents',NULL,0,1,'2020-02-15 12:34:02',NULL),(847,'8d411dc4-e76f-4d0e-a027-056a0bc43be5','poolevents',NULL,0,0,'2020-02-15 12:34:02',NULL),(848,'4a74141e-c2c0-46a0-9c0c-84bef8be7d0f','poolevents',NULL,0,1,'2020-02-15 12:38:34',NULL),(849,'8d411dc4-e76f-4d0e-a027-056a0bc43be5','poolevents',NULL,0,0,'2020-02-15 12:38:34',NULL),(850,'4a74141e-c2c0-46a0-9c0c-84bef8be7d0f','poolevents',NULL,0,1,'2020-02-16 09:41:16',NULL),(851,'8d411dc4-e76f-4d0e-a027-056a0bc43be5','poolevents',NULL,0,0,'2020-02-16 09:41:16',NULL),(852,'4a74141e-c2c0-46a0-9c0c-84bef8be7d0f','poolevents',NULL,0,1,'2020-02-20 13:53:25',NULL),(853,'8d411dc4-e76f-4d0e-a027-056a0bc43be5','poolevents',NULL,0,0,'2020-02-20 13:53:25',NULL),(854,'4a74141e-c2c0-46a0-9c0c-84bef8be7d0f','poolevents',NULL,0,1,'2020-02-20 18:00:43',NULL),(855,'8d411dc4-e76f-4d0e-a027-056a0bc43be5','poolevents',NULL,0,0,'2020-02-20 18:00:43',NULL);
/*!40000 ALTER TABLE `notifications` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `poolevent_types`
--

DROP TABLE IF EXISTS `poolevent_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `poolevent_types` (
  `idevent_type` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`idevent_type`),
  UNIQUE KEY `name_UNIQUE` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `poolevent_types`
--

LOCK TABLES `poolevent_types` WRITE;
/*!40000 ALTER TABLE `poolevent_types` DISABLE KEYS */;
INSERT INTO `poolevent_types` VALUES (1,'Netzwerk Treffen','2020-01-10 11:57:29'),(2,'concert','2020-01-10 11:57:29'),(3,'festival','2020-01-10 11:57:29'),(4,'goldeimer festival','2020-01-10 11:57:29'),(5,'run4wash','2020-01-10 11:57:29'),(6,'test','2020-01-10 11:57:29');
/*!40000 ALTER TABLE `poolevent_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `poolevents`
--

DROP TABLE IF EXISTS `poolevents`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `poolevents` (
  `idevent` varchar(225) NOT NULL,
  `name` varchar(225) NOT NULL,
  `created_at` bigint(20) NOT NULL DEFAULT current_timestamp(),
  `event_start` bigint(20) NOT NULL,
  `event_end` bigint(20) NOT NULL,
  `application_start` bigint(20) NOT NULL,
  `application_end` bigint(20) NOT NULL,
  `asp_event_id` varchar(225) DEFAULT NULL,
  `website` varchar(225) DEFAULT NULL,
  `supporter_lim` int(11) DEFAULT 0,
  `active_user_only` tinyint(1) DEFAULT 0,
  `user_id` varchar(128) NOT NULL,
  `edited_at` bigint(20) DEFAULT NULL,
  `state` enum('UNRELEASED','RELEASED','REJECTED','DRAFT','CANCELED') NOT NULL DEFAULT 'UNRELEASED',
  `idevent_type` int(11) NOT NULL,
  `fave_count` int(11) NOT NULL DEFAULT 0,
  `is_deleted` bit(1) NOT NULL DEFAULT b'0',
  `crew_id` varchar(225) DEFAULT NULL,
  PRIMARY KEY (`idevent`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `poolevents`
--

LOCK TABLES `poolevents` WRITE;
/*!40000 ALTER TABLE `poolevents` DISABLE KEYS */;
INSERT INTO `poolevents` VALUES ('27b46f85-14ec-42a7-be8c-fe5a099eed3a','TEST',20200326130403,1585227843767,1585227843767,1585227843767,1585227843767,'5d5dc0cf-da90-47c5-a187-9e177b44f1f8','www.asd.com',3,0,'4a74141e-c2c0-46a0-9c0c-84bef8be7d0f',NULL,'RELEASED',5,0,'\0',NULL),('2891cb0a-68ef-44e4-9e57-4cf6d71fdb07','TEST 2',20200326131324,1585228404785,1585228404785,1585228404785,1585228404785,'4a74141e-c2c0-46a0-9c0c-84bef8be7d0f','www.scop.com',2,0,'4a74141e-c2c0-46a0-9c0c-84bef8be7d0f',NULL,'RELEASED',3,0,'\0',NULL),('49e8eabf-805f-4ac6-adaf-a710fd30a833','TEST 2',20200326131257,1585228377593,1585228377593,1585228377593,1585228377593,'4a74141e-c2c0-46a0-9c0c-84bef8be7d0f','www.scop.com',2,0,'4a74141e-c2c0-46a0-9c0c-84bef8be7d0f',NULL,'UNRELEASED',3,0,'\0',NULL),('80773acf-fecb-47df-8855-08571ccef151','TEST 3',20200326131435,1585228475350,1585228475350,1585228475350,1585228475350,'63e20762-2b04-42a8-907e-4f0f6a087f85','www.comasd.cion',2,0,'4a74141e-c2c0-46a0-9c0c-84bef8be7d0f',NULL,'RELEASED',2,0,'\0',NULL),('8ea7cd77-502c-4f8b-8e52-2f00a956f322','TEST 2',20200326131122,1585228282549,1585228282549,1585228282549,1585228282549,'4a74141e-c2c0-46a0-9c0c-84bef8be7d0f','www.scop.com',2,0,'4a74141e-c2c0-46a0-9c0c-84bef8be7d0f',NULL,'UNRELEASED',3,0,'\0',NULL),('a0efaa7f-a529-4fbe-9087-7945c0cd3922','TEST 4',20200326131638,1585228598833,1585228598833,1585228598833,1585228598833,'4a74141e-c2c0-46a0-9c0c-84bef8be7d0f','www.asdassa.com',3,0,'4a74141e-c2c0-46a0-9c0c-84bef8be7d0f',NULL,'RELEASED',3,0,'\0',NULL),('c6bde2bb-e559-4e42-b347-770e6e1ba70b','Lorem ipsum dolor sit',20200322085706,1584867426179,1584867426179,1584867426179,1584867426179,'63e20762-2b04-42a8-907e-4f0f6a087f85','www.lorem.com',5,0,'4a74141e-c2c0-46a0-9c0c-84bef8be7d0f',NULL,'RELEASED',4,2,'\0',NULL),('dd0d74e7-537f-4797-a9c9-11595f599f64','TEST 2',20200326131340,1585228420922,1585228420922,1585228420922,1585228420922,'4a74141e-c2c0-46a0-9c0c-84bef8be7d0f','www.scop.com',2,0,'4a74141e-c2c0-46a0-9c0c-84bef8be7d0f',NULL,'UNRELEASED',3,0,'\0',NULL);
/*!40000 ALTER TABLE `poolevents` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `roles` (
  `idroles` int(11) NOT NULL AUTO_INCREMENT,
  `role` varchar(45) NOT NULL,
  `user_id` varchar(128) NOT NULL,
  PRIMARY KEY (`idroles`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles`
--

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` VALUES (12,'supporter','4a74141e-c2c0-46a0-9c0c-84bef8be7d0f'),(13,'admin','4a74141e-c2c0-46a0-9c0c-84bef8be7d0f'),(14,'supporter','8d411dc4-e76f-4d0e-a027-056a0bc43be5');
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` varchar(128) NOT NULL,
  `first_name` varchar(45) DEFAULT NULL,
  `last_name` varchar(45) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `edited_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `email_address` varchar(50) DEFAULT NULL,
  `age` int(11) DEFAULT NULL,
  `access_token` text DEFAULT NULL,
  `full_name` varchar(45) DEFAULT NULL,
  `verfied` tinyint(4) NOT NULL DEFAULT 1,
  `refresh_token` text DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES ('4a74141e-c2c0-46a0-9c0c-84bef8be7d0f','Doe','John','2020-01-11 13:46:16','2020-02-20 17:57:45',NULL,NULL,'b70487c20e63cc1d9ac197c3','John Doe',1,'e5a9c19fc99f885c4e94ea76'),('8d411dc4-e76f-4d0e-a027-056a0bc43be5','waves','dev','2020-01-11 21:27:23','2020-02-15 10:04:27',NULL,NULL,'10d1b9af9cc21805e43579f4','dev waves',1,'14a06b64e395960be4c1f72d');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `votes`
--

DROP TABLE IF EXISTS `votes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `votes` (
  `id` varchar(225) NOT NULL,
  `user_id` varchar(128) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `comment_id` varchar(225) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `u_user_id_comment_id` (`user_id`,`comment_id`),
  KEY `fk_uservote_id_idx` (`user_id`),
  KEY `fk_votecomment_id_idx` (`comment_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `votes`
--

LOCK TABLES `votes` WRITE;
/*!40000 ALTER TABLE `votes` DISABLE KEYS */;
INSERT INTO `votes` VALUES ('0a6fc37f-dc7f-498e-bf06-62eebeb751ad','4a74141e-c2c0-46a0-9c0c-84bef8be7d0f','2020-03-27 14:41:40','a408491a-c909-4163-969b-73838661cad1'),('11f289a6-d122-4304-a6f9-b65a93c26369','4a74141e-c2c0-46a0-9c0c-84bef8be7d0f','2020-03-27 14:41:35','a7d924d9-8058-4a69-aa22-8e885a0f896a'),('3338fb9b-2e65-42b6-93bb-c0f4daf77598','4a74141e-c2c0-46a0-9c0c-84bef8be7d0f','2020-03-27 14:42:08','8118ceb9-9920-45c6-b398-4cf09c9deb23'),('69187ac1-bc56-4448-90ae-b3dfee0a7889','4a74141e-c2c0-46a0-9c0c-84bef8be7d0f','2020-03-27 12:14:20','3b2cf4aa-5b21-46d8-b4ec-faf92443bb15'),('6b4c57e3-f4c8-4917-95b5-0375827902b8','4a74141e-c2c0-46a0-9c0c-84bef8be7d0f','2020-03-27 12:14:34','4d5df0f7-3285-423f-8b74-59b95ef42c2d'),('b571de56-43b8-46c5-a456-992d7c936e94','4a74141e-c2c0-46a0-9c0c-84bef8be7d0f','2020-03-27 14:41:50','9c7bfddd-ecbe-404f-bc91-3a535d6bb0c6'),('fd8bb9e3-85f1-4d27-851a-72a013a5a5b0','4a74141e-c2c0-46a0-9c0c-84bef8be7d0f','2020-03-27 12:14:58','040c3f30-8680-4f60-8441-2ee89bd77731');
/*!40000 ALTER TABLE `votes` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-07-01 16:36:51
