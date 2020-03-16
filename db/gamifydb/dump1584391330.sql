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
INSERT INTO `achievements` VALUES ('03f33773-1e6c-411a-9acd-d0a130ffaccc',1583657046057,'d26397f3-bcc8-4274-aeb7-8ddbe953df7c','f7d982ce-d0cf-4db3-8528-736a8b0ced5a'),('3974cbf0-9e05-4f3a-b9df-165e2f60dacf',1584091333404,'2f52fbe1-04cc-4d9d-b547-684196abba91','ce57638e-db51-4e5a-b19a-c77c48de7165'),('64578d0b-c8b6-4a50-93ca-43178bb59842',1583624839980,'586743d7-c467-439d-bb86-22a39bbebf35','064ede89-9329-4f78-9f2a-7dbce2ff0245'),('8e57c018-9261-4b9c-a819-456536826de5',1583657514377,'a79fa773-f8cb-4b5b-8bd8-7bc8549374a2','b778f749-ac1b-44ca-a3dd-cf42e2897da7'),('b195f71d-00a5-4cb8-a8ca-3c714d91c492',1584091192280,'9f82e587-7a42-4753-9a65-e2de889482d5','77541967-b33b-435b-b69e-d3d3e1d6c79e'),('b46dbf2d-4fd8-44bf-8001-ec79c4479dd2',1584091480010,'081d7653-21f9-4dd9-abaa-1d36c4b621a8','463bcda0-6ebf-475c-a85d-cae894503b00'),('c521ae54-59c8-4d91-a745-a734614ae875',1584091538261,'527474c2-0908-464c-bcb0-e4a10073e61a','0672574d-02d2-4af0-88e3-8e2db4e4705a'),('e0234ad3-f016-457f-a0b7-a474e3a40538',1584092228079,'b8fad19a-3257-4e72-8212-e89e4efed50f','af889593-6d32-4a25-8d73-811e2ba24aea'),('e04be411-823f-4769-9716-5edbf2c1732c',1584091248397,'9489ad0e-fa81-45a6-a085-30eebcbd451c','f83298a1-8406-435b-8922-fd02b1e81613');
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
INSERT INTO `action_history` VALUES ('02b62266-e0bf-42c1-800c-f746e66aa1aa','READ',1584092228922,'8d411dc4-e76f-4d0e-a027-056a0bc43be5','fb91f5bb-cf43-436a-94fe-9e8d7def2e53','4891acbd-d04a-4cc3-9e0c-a5e0db6d93ac'),('02e5fc9b-c35e-4b1f-8065-bcdcde7e5bdc','EVENT_CREATED',1584086460717,'8d411dc4-e76f-4d0e-a027-056a0bc43be5','15b0f223-1625-4948-8d7d-67c7f1653129','fde60f19-0c4a-4f2b-8590-ab0f27b673ff'),('1b3dec30-c761-438e-8ead-f214f44ccd20','READ',1584091478591,'8d411dc4-e76f-4d0e-a027-056a0bc43be5','3d2ff1f1-6496-4733-9e91-0dde197dae66','681ca607-77fa-495e-b846-f36afdf6b670'),('1ec483d0-29b8-4d64-9b11-d81244e161fb','READ',1584091248521,'8d411dc4-e76f-4d0e-a027-056a0bc43be5','5dbfe85e-9777-48ce-b21f-f81df35762c6','06cda1e3-7a42-47e5-aecc-f68d85fc9ef3'),('2234601f-7f5a-4a9c-b97f-4426fd9bedb2','EVENT_CREATED',1584086457366,'8d411dc4-e76f-4d0e-a027-056a0bc43be5','15b0f223-1625-4948-8d7d-67c7f1653129','091f08d0-0f9d-477f-b9c3-479e41b902cd'),('4409c92b-1841-40e9-b404-e704b1fcbdeb','READ',1584086542426,'8d411dc4-e76f-4d0e-a027-056a0bc43be5','15b0f223-1625-4948-8d7d-67c7f1653129','11eb8ba3-c4f7-4aec-b8d8-4469df83f096'),('45993684-86f6-41b9-a518-1544e798a3c0','READ',1584091334321,'8d411dc4-e76f-4d0e-a027-056a0bc43be5','6308ef0a-6e81-4e81-a89a-941ebd824a9e','b788105d-4feb-4bc3-858f-a564f7089f74'),('51b5298d-dd4e-474a-95ee-f8649285be7a','READ',1584086703165,'8d411dc4-e76f-4d0e-a027-056a0bc43be5','15b0f223-1625-4948-8d7d-67c7f1653129','fde60f19-0c4a-4f2b-8590-ab0f27b673ff'),('53e20e97-47fd-45a8-b730-81d8d830d4c2','EVENT_CREATED',1584086464047,'8d411dc4-e76f-4d0e-a027-056a0bc43be5','15b0f223-1625-4948-8d7d-67c7f1653129','7e100208-8ab5-4df2-a6ec-43193a88fedc'),('54c1a67f-9369-42c3-83c5-cb0c28d6d6cc','EVENT_CREATED',1584138976627,'4a74141e-c2c0-46a0-9c0c-84bef8be7d0f','15b0fb13-1625-4948-8d7d-67c7f1653129','89cf22d8-1239-4873-913e-35e11105e269'),('6b367d35-4f34-469f-a656-e5595b578157','EVENT_CREATED',1584092227874,'8d411dc4-e76f-4d0e-a027-056a0bc43be5','15b0f223-1625-4948-8d7d-67c7f1653129','a7c4ee03-4016-4071-a0fc-e5c92ef649db'),('6c74a83f-7609-49d2-a3bf-14d43bbf51b4','READ',1584086697716,'8d411dc4-e76f-4d0e-a027-056a0bc43be5','15b0f223-1625-4948-8d7d-67c7f1653129','fde60f19-0c4a-4f2b-8590-ab0f27b673ff'),('6ca4d4e2-58da-4a9d-9cf5-fde0364a2d57','EVENT_CREATED',1584139453215,'4a74141e-c2c0-46a0-9c0c-84bef8be7d0f','15b0fb13-1625-4948-8d7d-67c7f1653129','e0778b97-f883-48ac-a962-f88404fef387'),('7500123b-630e-4d2d-a796-6f4a1348d1c0','EVENT_CREATED',1584091480032,'8d411dc4-e76f-4d0e-a027-056a0bc43be5','15b0f223-1625-4948-8d7d-67c7f1653129','2cfbc976-0b3f-4dcd-9140-9df993f7c2af'),('864f126e-0a6f-4d12-923e-a7534547ef98','EVENT_CREATED',1584086442690,'8d411dc4-e76f-4d0e-a027-056a0bc43be5','15b0f223-1625-4948-8d7d-67c7f1653129','1538eb37-65ad-4315-b8a3-39f44010e7ae'),('936c458d-61df-4c05-ab76-4844072e6c01','EVENT_CREATED',1584091538327,'8d411dc4-e76f-4d0e-a027-056a0bc43be5','15b0f223-1625-4948-8d7d-67c7f1653129','8f5d932a-817e-4e0d-bc5f-c22e43c1587a'),('a0b780b3-e155-464a-894d-de5bbd5f9276','READ',1584091193316,'8d411dc4-e76f-4d0e-a027-056a0bc43be5','c681e537-12e0-4029-bde2-81e98809b735','921bae28-995b-47e9-8f98-96f10e36d97f'),('b67ab9f9-b8c6-4878-b566-eba664d6cc12','READ',1584086538519,'8d411dc4-e76f-4d0e-a027-056a0bc43be5','15b0f223-1625-4948-8d7d-67c7f1653129','11eb8ba3-c4f7-4aec-b8d8-4469df83f096'),('c847ea41-1e7a-41ec-ab8a-9ef1dff47581','EVENT_CREATED',1584138989397,'4a74141e-c2c0-46a0-9c0c-84bef8be7d0f','15b0fb13-1625-4948-8d7d-67c7f1653129','4e7b668c-9b4b-468d-baab-8613866f5e69'),('c8925e5e-4db5-417d-824e-d46785c1c0b7','READ',1584091538593,'8d411dc4-e76f-4d0e-a027-056a0bc43be5','196b1082-d9a0-4d85-8fa0-4e6f6bbcfbf9','60d1581c-1af2-4806-89be-9324e74a02c8'),('d1066a45-8306-4e57-9bf1-cf717cc1a128','EVENT_CREATED',1584092536966,'8d411dc4-e76f-4d0e-a027-056a0bc43be5','15b0f223-1625-4948-8d7d-67c7f1653129','91becf5e-32ac-480c-8057-b11b8a0fbd2b'),('d3ccab28-bb11-4032-9d60-ef2b956e7c3c','READ',1584086700502,'8d411dc4-e76f-4d0e-a027-056a0bc43be5','15b0f223-1625-4948-8d7d-67c7f1653129','fde60f19-0c4a-4f2b-8590-ab0f27b673ff'),('f3a234c0-4dd7-4f0f-a7e8-76cc7172abf3','EVENT_CREATED',1584092599641,'8d411dc4-e76f-4d0e-a027-056a0bc43be5','15b0f223-1625-4948-8d7d-67c7f1653129','89eb4f9c-1493-4908-b69c-421fd3df5c9d');
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
INSERT INTO `actions` VALUES ('7754f617-9e57-4943-8c0f-faab38a2974d',1584091538661,50,'96e43959-d759-4b37-99fd-7d812e344437'),('87004755-dc6c-4e53-8e67-93a82249efe5',1584091333051,50,'1c41c646-d72f-4c7b-8a3d-ef8838180550'),('a6ce76c3-4d83-4370-8bbc-f52a8e8dd9f1',1584091479701,50,'7a7861ec-dded-4794-ab26-ba04113f3fae'),('APPLICATION',1583418181770,40,'applications'),('c93f5747-dbee-4bbe-aa03-b4f3dc0b0763',1584092228306,50,'264f57b5-04b6-4707-88ac-486bf48e73ad'),('COMMENT',1583418146112,30,'comments'),('EVENT_CREATED',1583418294830,50,'poolevents'),('READ',1583412516995,10,''),('VOTE',1583418020232,20,'votes');
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
INSERT INTO `badges` VALUES ('081d7653-21f9-4dd9-abaa-1d36c4b621a8','new comment','comment','comments',1584091480011,1584091480011,'loremscoop'),('2c6eac55-9abb-46fa-9354-5c195db509fc','informed','onboarding information','poolevents',1584092228710,1584092228710,'//b.thumbs.redditmedia.com/xdKEqKiFPEtQPTvc0Qh_MoR-8y4IYkHnMajh27qhGjE.png'),('2f52fbe1-04cc-4d9d-b547-684196abba91','new comment','comment','comments',1584091333406,1584091333406,'loremscoop'),('527474c2-0908-464c-bcb0-e4a10073e61a','new comment','comment','comments',1584091538262,1584091538262,'loremscoop'),('54fef2ae-994f-4750-be88-c06be01f17de','informed','onboarding information','poolevents',1584091248865,1584091248865,'//b.thumbs.redditmedia.com/xdKEqKiFPEtQPTvc0Qh_MoR-8y4IYkHnMajh27qhGjE.png'),('586743d7-c467-439d-bb86-22a39bbebf35','scoop','read the onboarding informations','poolevents',1583624839980,1583624839980,'loremscoop'),('73b33d58-5773-46d1-88e2-f9fcb1d75866','informed','onboarding information','poolevents',1584091479536,1584091479536,'//b.thumbs.redditmedia.com/xdKEqKiFPEtQPTvc0Qh_MoR-8y4IYkHnMajh27qhGjE.png'),('7ee2ebf9-9103-45c0-8b0e-44582c852db3','informed','onboarding information','poolevents',1584091538423,1584091538423,'//b.thumbs.redditmedia.com/xdKEqKiFPEtQPTvc0Qh_MoR-8y4IYkHnMajh27qhGjE.png'),('8d9a2b62-7ffb-467f-b59d-8855ef302a17','informed','onboarding information','poolevents',1584091334083,1584091334083,'//b.thumbs.redditmedia.com/xdKEqKiFPEtQPTvc0Qh_MoR-8y4IYkHnMajh27qhGjE.png'),('9489ad0e-fa81-45a6-a085-30eebcbd451c','new comment','comment','comments',1584091248398,1584091248398,'loremscoop'),('9f82e587-7a42-4753-9a65-e2de889482d5','new comment','comment','comments',1584091192282,1584091192282,'loremscoop'),('a79fa773-f8cb-4b5b-8bd8-7bc8549374a2','new comment','comment','comments',1583657514378,1583657514378,'loremscoop'),('b8fad19a-3257-4e72-8212-e89e4efed50f','new comment','comment','comments',1584092228085,1584092228085,'loremscoop'),('d26397f3-bcc8-4274-aeb7-8ddbe953df7c','new comment','comment','comments',1583657046058,1583657046058,'loremscoop'),('f74878f7-27e3-45d0-9b68-dded64734373','informed','onboarding information','poolevents',1584091191967,1584091191967,'//b.thumbs.redditmedia.com/xdKEqKiFPEtQPTvc0Qh_MoR-8y4IYkHnMajh27qhGjE.png');
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
INSERT INTO `challenge_progress` VALUES ('8d411dc4-e76f-4d0e-a027-056a0bc43be5','af889593-6d32-4a25-8d73-811e2ba24aea',0,1584092228334,1584092228334,'01b9f380-6832-429c-847d-4f65bd5eabf0','\0'),('8d411dc4-e76f-4d0e-a027-056a0bc43be5','0672574d-02d2-4af0-88e3-8e2db4e4705a',0,1584091538652,1584091538652,'03ef8edc-6033-46b9-89c6-ccdc0bf98098','\0'),('3b86b640-e37b-4778-86ab-2f003a4b0036','af889593-6d32-4a25-8d73-811e2ba24aea',0,1584092228334,1584092228334,'0721cef2-70cf-4a93-8a5e-b57812f334b1','\0'),('8d411dc4-e76f-4d0e-a027-056a0bc43be5','463bcda0-6ebf-475c-a85d-cae894503b00',0,1584091480317,1584091480317,'15913181-15c9-4815-b2c7-7954389ea703','\0'),('4a74141e-c2c0-46a0-9c0c-84bef8be7d0f','f7d982ce-d0cf-4db3-8528-736a8b0ced5a',0,1584138975864,1584138975864,'1ca654fc-fb41-43bf-a247-4ba120839dfb','\0'),('ed0714a9-9c40-494c-81a3-ae0890ea4721','ce57638e-db51-4e5a-b19a-c77c48de7165',0,1584091333718,1584091333718,'21dcdfc5-6536-4afe-a445-4d9be8e88a50','\0'),('4a74141e-c2c0-46a0-9c0c-84bef8be7d0f','19ecb824-2a55-45c4-b3d0-2b13c653279a',3,1584138975861,1584138975861,'2e168f30-2376-4247-8df9-1ee090776378','\0'),('4a74141e-c2c0-46a0-9c0c-84bef8be7d0f','0672574d-02d2-4af0-88e3-8e2db4e4705a',0,1584138975860,1584138975860,'2fac2f24-d6f5-49da-8241-896550c06eb8','\0'),('8d411dc4-e76f-4d0e-a027-056a0bc43be5','064ede89-9329-4f78-9f2a-7dbce2ff0245',1,1583624840257,1583624840257,'31cbb0d9-3173-458f-b43a-bafe912af6d7',''),('4a74141e-c2c0-46a0-9c0c-84bef8be7d0f','fc1cc662-0c28-401b-925a-0735d9fc388c',3,1584138975864,1584138975864,'3d76ca89-5a49-4808-8e56-fbf4ff300d7e','\0'),('4a74141e-c2c0-46a0-9c0c-84bef8be7d0f','b778f749-ac1b-44ca-a3dd-cf42e2897da7',0,1584138975862,1584138975862,'3f588ff1-7026-42cf-89f7-9fc7af5f4466','\0'),('4a74141e-c2c0-46a0-9c0c-84bef8be7d0f','77642f79-86b7-4901-bca1-3b6f6ee64f0e',3,1584138975862,1584138975862,'43ae470e-5bc6-4326-87cb-588f13a4df3e','\0'),('4a74141e-c2c0-46a0-9c0c-84bef8be7d0f','f83298a1-8406-435b-8922-fd02b1e81613',0,1584138975864,1584138975864,'44fb2c30-40ea-4e8b-b250-1e95bbf118af','\0'),('8d411dc4-e76f-4d0e-a027-056a0bc43be5','b778f749-ac1b-44ca-a3dd-cf42e2897da7',3,1583657514661,1583657514661,'479baead-7076-487e-8276-860d0c00883e',''),('4a74141e-c2c0-46a0-9c0c-84bef8be7d0f','af889593-6d32-4a25-8d73-811e2ba24aea',0,1584138975862,1584138975862,'4b21b125-c061-48f3-a205-188fcdf6a53e','\0'),('951ea3a9-f245-41d0-b70a-129675140ab9','af889593-6d32-4a25-8d73-811e2ba24aea',0,1584092228334,1584092228334,'4d596bcf-235b-4e50-8136-0ce354eeb7a1','\0'),('a0f2d15e-68f1-43e3-9873-21f756580501','463bcda0-6ebf-475c-a85d-cae894503b00',0,1584091480317,1584091480317,'5743def7-fa40-498b-ae8b-cc8b06fd1117','\0'),('ed0714a9-9c40-494c-81a3-ae0890ea4721','af889593-6d32-4a25-8d73-811e2ba24aea',0,1584092228334,1584092228334,'5a26539c-7c8c-4110-91e8-e69a596b0b42','\0'),('8d411dc4-e76f-4d0e-a027-056a0bc43be5','ce57638e-db51-4e5a-b19a-c77c48de7165',0,1584091333718,1584091333718,'5e2ac990-160b-487c-bdb0-3028554022bb','\0'),('4a74141e-c2c0-46a0-9c0c-84bef8be7d0f','463bcda0-6ebf-475c-a85d-cae894503b00',0,1584138975861,1584138975861,'6f49e5bf-f66b-4005-9180-06315aab1591','\0'),('4a74141e-c2c0-46a0-9c0c-84bef8be7d0f','e3df2961-e82e-4aa8-b762-80370f1a764d',3,1584138975864,1584138975864,'74010c0b-b3ff-42eb-a12e-f382bf5c8df6','\0'),('3d0b0f2f-6588-4fd8-817e-090210642cba','ce57638e-db51-4e5a-b19a-c77c48de7165',0,1584091333718,1584091333718,'7ee89889-e5ec-43ef-8798-85fd440f338b','\0'),('4a74141e-c2c0-46a0-9c0c-84bef8be7d0f','ce57638e-db51-4e5a-b19a-c77c48de7165',0,1584138975863,1584138975863,'80350713-f4f1-4de3-aa76-b3895dbaaf6b','\0'),('4a74141e-c2c0-46a0-9c0c-84bef8be7d0f','064ede89-9329-4f78-9f2a-7dbce2ff0245',1,1584138975859,1584138975859,'824c9a50-ae83-4c62-b459-8d80e7953378',''),('ed0714a9-9c40-494c-81a3-ae0890ea4721','0672574d-02d2-4af0-88e3-8e2db4e4705a',0,1584091538652,1584091538652,'8cc3b76b-9d0e-470d-9617-f0bd4d8bfd0a','\0'),('ed0714a9-9c40-494c-81a3-ae0890ea4721','f83298a1-8406-435b-8922-fd02b1e81613',0,1584091248794,1584091248794,'9a691308-5055-4282-8fef-816da57e4667','\0'),('951ea3a9-f245-41d0-b70a-129675140ab9','463bcda0-6ebf-475c-a85d-cae894503b00',0,1584091480317,1584091480317,'a62321b9-35d3-4a67-8cea-a650ca34c2a3','\0'),('951ea3a9-f245-41d0-b70a-129675140ab9','0672574d-02d2-4af0-88e3-8e2db4e4705a',0,1584091538652,1584091538652,'a65707d4-fdd2-47dc-a0aa-20d4ad5edd7a','\0'),('8d411dc4-e76f-4d0e-a027-056a0bc43be5','f83298a1-8406-435b-8922-fd02b1e81613',0,1584091248793,1584091248793,'a99670d4-2d07-4e6e-a969-0d8652439aa3','\0'),('3d0b0f2f-6588-4fd8-817e-090210642cba','0672574d-02d2-4af0-88e3-8e2db4e4705a',0,1584091538650,1584091538650,'a9d27f4e-9868-4cf5-a6b7-ca3e5d50e74b','\0'),('b2e01f69-2810-496c-90fe-384ab949a873','0672574d-02d2-4af0-88e3-8e2db4e4705a',0,1584091538651,1584091538651,'aace8bd2-ff62-45ed-ba2d-5ef4185c7794','\0'),('4a74141e-c2c0-46a0-9c0c-84bef8be7d0f','c4a80a9d-79e9-4dc1-bfea-5ea4a2b4db16',3,1584138975863,1584138975863,'ae800dda-da70-40eb-abfd-b4d5fdbce1a4','\0'),('ed0714a9-9c40-494c-81a3-ae0890ea4721','463bcda0-6ebf-475c-a85d-cae894503b00',0,1584091480317,1584091480317,'b13b91c7-9e52-48a0-84f1-c5416a703f11','\0'),('8d411dc4-e76f-4d0e-a027-056a0bc43be5','77541967-b33b-435b-b69e-d3d3e1d6c79e',0,1584091193316,1584091193316,'b53d8dd6-6ba8-4b10-acd8-c6c5580daec3','\0'),('3d0b0f2f-6588-4fd8-817e-090210642cba','463bcda0-6ebf-475c-a85d-cae894503b00',0,1584091480317,1584091480317,'b6444d56-205e-4b30-9f2f-72167de25f82','\0'),('951ea3a9-f245-41d0-b70a-129675140ab9','77541967-b33b-435b-b69e-d3d3e1d6c79e',0,1584091193315,1584091193315,'c4623776-e4b2-4b62-b670-a080f15a6344','\0'),('4a74141e-c2c0-46a0-9c0c-84bef8be7d0f','d56bb07b-1e19-4ba6-bcf3-c5c1b8daac79',3,1584138975863,1584138975863,'c845f1f0-96d5-4f1a-9369-f33c52e62e02','\0'),('4a74141e-c2c0-46a0-9c0c-84bef8be7d0f','77541967-b33b-435b-b69e-d3d3e1d6c79e',0,1584138975861,1584138975861,'cbe400a5-9b85-4615-9764-372097e23dce','\0'),('951ea3a9-f245-41d0-b70a-129675140ab9','ce57638e-db51-4e5a-b19a-c77c48de7165',0,1584091333718,1584091333718,'cdff334a-3f18-46f3-aa48-d90b7fcec340','\0'),('8d411dc4-e76f-4d0e-a027-056a0bc43be5','f7d982ce-d0cf-4db3-8528-736a8b0ced5a',1,1583657046251,1583657046251,'d28f994d-0663-48c5-82fa-41e0cc64b70c',''),('3d0b0f2f-6588-4fd8-817e-090210642cba','af889593-6d32-4a25-8d73-811e2ba24aea',0,1584092228333,1584092228333,'de4a1f08-036c-45a8-a7a2-b0d94712175c','\0'),('b2e01f69-2810-496c-90fe-384ab949a873','af889593-6d32-4a25-8d73-811e2ba24aea',0,1584092228333,1584092228333,'df2981ac-eed2-4f24-8858-b3685368d2e1','\0'),('951ea3a9-f245-41d0-b70a-129675140ab9','f83298a1-8406-435b-8922-fd02b1e81613',0,1584091248793,1584091248793,'e5da1d3f-58cc-4b5f-a2ad-fbb429e42474','\0'),('a0f2d15e-68f1-43e3-9873-21f756580501','0672574d-02d2-4af0-88e3-8e2db4e4705a',0,1584091538652,1584091538652,'f629444d-ba96-40a9-af1d-7b2c3d34519f','\0'),('a0f2d15e-68f1-43e3-9873-21f756580501','af889593-6d32-4a25-8d73-811e2ba24aea',0,1584092228333,1584092228333,'f653b338-fe1b-40ae-a68b-9674de88e2fd','\0');
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
INSERT INTO `challenges` VALUES ('064ede89-9329-4f78-9f2a-7dbce2ff0245',1583624840044,'poolevents',1,1583624840044),('0672574d-02d2-4af0-88e3-8e2db4e4705a',1584091538411,'comments',3,1584091538411),('19ecb824-2a55-45c4-b3d0-2b13c653279a',1584091538200,'poolevents',20,1584091538200),('463bcda0-6ebf-475c-a85d-cae894503b00',1584091480064,'comments',3,1584091480064),('77541967-b33b-435b-b69e-d3d3e1d6c79e',1584091192331,'comments',3,1584091192331),('77642f79-86b7-4901-bca1-3b6f6ee64f0e',1584091479378,'poolevents',20,1584091479378),('af889593-6d32-4a25-8d73-811e2ba24aea',1584092228134,'comments',3,1584092228134),('b778f749-ac1b-44ca-a3dd-cf42e2897da7',1583657514428,'comments',3,1583657514428),('c4a80a9d-79e9-4dc1-bfea-5ea4a2b4db16',1584091333827,'poolevents',20,1584091333827),('ce57638e-db51-4e5a-b19a-c77c48de7165',1584091333472,'comments',3,1584091333472),('d56bb07b-1e19-4ba6-bcf3-c5c1b8daac79',1584092228553,'poolevents',20,1584092228553),('e3df2961-e82e-4aa8-b762-80370f1a764d',1584091191666,'poolevents',20,1584091191666),('f7d982ce-d0cf-4db3-8528-736a8b0ced5a',1583657046110,'comments',1,1583657046110),('f83298a1-8406-435b-8922-fd02b1e81613',1584091248462,'comments',3,1584091248462),('fc1cc662-0c28-401b-925a-0735d9fc388c',1584091248792,'poolevents',20,1584091248792);
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
INSERT INTO `crew_leaderboard` VALUES ('26c354e8-87e6-4d30-be0a-2b89a8fac698','c50b5619-c161-4463-ade7-e9ba5824e659',0,1584091478307,1584091478307),('52b5ec6f-e6ea-4763-a957-0306a5232465','15b0fb13-1625-4948-8d7d-67c7f1653129',150,1584138976328,1584139453314),('5f65225b-aae2-42e1-9759-67dff10b9fca','8d999dda-0a43-459d-8d39-c1c894209e1a',0,1584091331547,1584091331547),('64b27ec1-4103-4091-aecf-be787b6ec810','f4fc4549-eec8-4e61-9a46-48ac9945b70f',0,1584091248199,1584091248199),('67579e29-ee5c-4a19-b2be-8b8060b37f4a','4b82cfa5-0980-4548-ad0b-8c69075fbc75',0,1584091537869,1584091537869),('74eddbe3-ff7d-4302-a990-83494305ba4f','597f58b1-e39e-4608-acee-e0435ad705b0',0,1584092226354,1584092226354),('ea7362f7-890d-4806-afa9-cc83285f85d1','15b0f223-1625-4948-8d7d-67c7f1653129',2260,1583624810441,1584092599697);
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
INSERT INTO `crews` VALUES ('15b0f223-1625-4948-8d7d-67c7f1653129','San Francisco'),('facc3b48-0c6f-4ac7-9db8-02388cce85bd','CITY'),('925845a4-8e59-469f-9735-c61cc466897f','CITY'),('d8e303c2-9165-445f-8525-5703e91e20a4','CITY'),('63759618-219b-4b4b-8f7b-22ce82c6e7d2','CITY'),('15b0fb13-1625-4948-8d7d-67c7f1653129','Hamburg');
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES ('3b86b640-e37b-4778-86ab-2f003a4b0036','353491db-17d4-4287-a589-9f86548a5abd'),('3d0b0f2f-6588-4fd8-817e-090210642cba','76e1836e-b2b9-47c0-a47d-3b4657d85fa2'),('4a74141e-c2c0-46a0-9c0c-84bef8be7d0f','15b0fb13-1625-4948-8d7d-67c7f1653129'),('8d411dc4-e76f-4d0e-a027-056a0bc43be5','15b0f223-1625-4948-8d7d-67c7f1653129'),('951ea3a9-f245-41d0-b70a-129675140ab9','39d55cda-4a2a-4514-a917-ab52078632b3'),('a0f2d15e-68f1-43e3-9873-21f756580501','56d82561-7da5-4a98-8c17-4985ca08b2cb'),('b2e01f69-2810-496c-90fe-384ab949a873','3f1edef2-fe2b-4baf-bdf1-290c01928286'),('ed0714a9-9c40-494c-81a3-ae0890ea4721','5a7ac41a-57cc-40ff-bd46-a9c7a3b48c96');
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

-- Dump completed on 2020-03-16 20:42:11
