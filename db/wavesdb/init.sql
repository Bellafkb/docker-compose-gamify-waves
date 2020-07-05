-- MariaDB dump 10.17  Distrib 10.5.4-MariaDB, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: wavesdb
-- ------------------------------------------------------
-- Server version	10.5.4-MariaDB-1:10.5.4+maria~focal

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
INSERT INTO `applications` VALUES ('1986d788-e4b1-4a3b-a63b-29fe311219ae','0b4fac41-a5eb-432f-be29-7c3e1acdc901','','WAITING','051eb4c0-db93-4690-a9a9-8b3912c66098',1593947917602,1593947917602),('566f7dae-5d28-40d8-8475-b53e4c0fab61','4ac5f52d-7240-4530-9607-89485d55d3dc','I am in','WAITING','c3ee23a8-eaee-40b9-a4b6-7ddaccfe4538',1593953973962,1593953973962),('9524ec6f-cb35-4f60-a7d6-ce43cfced1f8','4a74141e-c2c0-46a0-9c0c-84bef8be7d0f','adsadasd','WAITING','a0efaa7f-a529-4fbe-9087-7945c0cd3922',1585303778022,1585303778022),('c0fb5c58-7ed5-4456-8cb1-d78d130a1c19','4a74141e-c2c0-46a0-9c0c-84bef8be7d0f','Count me in','WAITING','dc23cbdb-5245-4e35-a7f1-e1f08ff20359',1593953121170,1593953121170),('cc115082-29a1-405f-8d7c-d2b984b04619','4a74141e-c2c0-46a0-9c0c-84bef8be7d0f','asdasdasd','WAITING','27b46f85-14ec-42a7-be8c-fe5a099eed3a',1585311156956,1585311156956),('d205e4e7-d6ab-467b-ae05-7d613ce1fd98','4a74141e-c2c0-46a0-9c0c-84bef8be7d0f','asdasda','WAITING','2891cb0a-68ef-44e4-9e57-4cf6d71fdb07',1585311232829,1585311232829),('f95e5e91-9446-4d17-a60c-d5cafbad88b5','4a74141e-c2c0-46a0-9c0c-84bef8be7d0f','asdasdasdasd','WAITING','80773acf-fecb-47df-8855-08571ccef151',1585320683052,1585320683051);
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
INSERT INTO `comments` VALUES ('040c3f30-8680-4f60-8441-2ee89bd77731','sfsdf','4a74141e-c2c0-46a0-9c0c-84bef8be7d0f','2891cb0a-68ef-44e4-9e57-4cf6d71fdb07',1585311293031,1585311293031),('05049f8a-aa45-48a5-b94e-793759b99f6d','endlich! ich bin dabei :D','0b4fac41-a5eb-432f-be29-7c3e1acdc901','051eb4c0-db93-4690-a9a9-8b3912c66098',1593947766600,1593947766600),('1d2967fb-1692-4f77-b0dd-07f58b88e710','Meeegaaa','0b4fac41-a5eb-432f-be29-7c3e1acdc901','051eb4c0-db93-4690-a9a9-8b3912c66098',1593947992208,1593947992208),('3b2cf4aa-5b21-46d8-b4ec-faf92443bb15','asdasdasd','4a74141e-c2c0-46a0-9c0c-84bef8be7d0f','2891cb0a-68ef-44e4-9e57-4cf6d71fdb07',1585311247771,1585311247771),('44b6e380-810c-43d6-be04-99cbda31d5d3','Best live show ever ','8d411dc4-e76f-4d0e-a027-056a0bc43be5','c3ee23a8-eaee-40b9-a4b6-7ddaccfe4538',1593945266592,1593945266592),('4d5df0f7-3285-423f-8b74-59b95ef42c2d','scasdasdasd','4a74141e-c2c0-46a0-9c0c-84bef8be7d0f','2891cb0a-68ef-44e4-9e57-4cf6d71fdb07',1585311245680,1585311245680),('5a1c7a38-815b-4004-8e5a-61af2eb04a00','lorem ipsum','4ac5f52d-7240-4530-9607-89485d55d3dc','c3ee23a8-eaee-40b9-a4b6-7ddaccfe4538',1593953910952,1593953910952),('690e129a-272e-43f8-b837-d0a9e4624518','Ich wäre so gerne dabei :)','4a74141e-c2c0-46a0-9c0c-84bef8be7d0f','c3ee23a8-eaee-40b9-a4b6-7ddaccfe4538',1593944470955,1593944470955),('8118ceb9-9920-45c6-b398-4cf09c9deb23','dgdfgdfg','4a74141e-c2c0-46a0-9c0c-84bef8be7d0f','2891cb0a-68ef-44e4-9e57-4cf6d71fdb07',1585320121550,1585320121550),('9b082424-ef57-481d-a078-1dbbd7d764f4','Fischfilet <3','4a74141e-c2c0-46a0-9c0c-84bef8be7d0f','72f3698e-88b5-4f26-9edc-ba2ebaef54b9',1593953028695,1593953028695),('9c7bfddd-ecbe-404f-bc91-3a535d6bb0c6','asdasdad','4a74141e-c2c0-46a0-9c0c-84bef8be7d0f','2891cb0a-68ef-44e4-9e57-4cf6d71fdb07',1585317282666,1585317282666),('a408491a-c909-4163-969b-73838661cad1','asdasd','4a74141e-c2c0-46a0-9c0c-84bef8be7d0f','2891cb0a-68ef-44e4-9e57-4cf6d71fdb07',1585320076262,1585320076262),('a7d924d9-8058-4a69-aa22-8e885a0f896a','dfgdfgdf','4a74141e-c2c0-46a0-9c0c-84bef8be7d0f','2891cb0a-68ef-44e4-9e57-4cf6d71fdb07',1585320088159,1585320088159),('d23e70ce-9370-4d45-88be-e6174bea4401','asdasdsad','4a74141e-c2c0-46a0-9c0c-84bef8be7d0f','a0efaa7f-a529-4fbe-9087-7945c0cd3922',1585303782140,1585303782140),('e926b0dd-a3fe-4990-82f1-7168fc6e1f4a','asdasda','4a74141e-c2c0-46a0-9c0c-84bef8be7d0f','80773acf-fecb-47df-8855-08571ccef151',1593717032357,1593717032357),('fa9ceffa-c926-47bb-8a90-8a474386a0c4','Best band ever :D thank you ','4a74141e-c2c0-46a0-9c0c-84bef8be7d0f','051eb4c0-db93-4690-a9a9-8b3912c66098',1593948247793,1593948247793);
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
  `html` text DEFAULT NULL,
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
INSERT INTO `descriptions` VALUES ('1dd3fc65-9d77-4251-a0d4-b3020a12cf09','','<p style=\"margin: 0.5em 0px; color: rgb(32, 33, 34); font-family: sans-serif; font-size: 14px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255); text-decoration-style: initial; text-decoration-color: initial;\">Die &Auml;rzte were formed in&nbsp;<a href=\"https://en.wikipedia.org/wiki/West_Berlin\" style=\"text-decoration: none; color: rgb(11, 0, 128); background: none;\" title=\"West Berlin\">West Berlin</a> in 1982 by&nbsp;<a href=\"https://en.wikipedia.org/wiki/Jan_Vetter\" style=\"text-decoration: none; color: rgb(11, 0, 128); background: none;\" title=\"Jan Vetter\">Jan Vetter</a> (alias Farin Urlaub, a&nbsp;<a href=\"https://en.wikipedia.org/wiki/Pun\" style=\"text-decoration: none; color: rgb(11, 0, 128); background: none;\" title=\"Pun\">pun</a> on the expression &quot;Fahr&#39; in Urlaub&quot;, meaning &quot;Go on vacation&quot;),&nbsp;<a href=\"https://en.wikipedia.org/wiki/Bela_B.\" style=\"text-decoration: none; color: rgb(11, 0, 128); background: none;\" title=\"Bela B.\">Dirk Felsenheimer</a> (alias Bela B., referring to Dracula actor&nbsp;<a href=\"https://en.wikipedia.org/wiki/Bela_Lugosi\" style=\"text-decoration: none; color: rgb(11, 0, 128); background: none;\" title=\"Bela Lugosi\">Bela Lugosi</a>) and bassist Hans Runge, alias&nbsp;<a href=\"https://en.wikipedia.org/w/index.php?title=Sahnie&action=edit&redlink=1\" style=\"text-decoration: none; color: rgb(165, 88, 88); background: none;\" title=\"Sahnie (page does not exist)\">Sahnie</a><span style=\"font-size: 11.9px; font-style: normal;\">&nbsp;[<a href=\"https://de.wikipedia.org/wiki/Sahnie\" style=\"text-decoration: none; color: rgb(102, 51, 102); background: none;\" title=\"de:Sahnie\">de</a>]</span>. Bela and Farin had previously played together in the&nbsp;<a href=\"https://en.wikipedia.org/wiki/Punk_rock\" style=\"text-decoration: none; color: rgb(11, 0, 128); background: none;\" title=\"Punk rock\">punk</a> band Soilent Gr&uuml;n, established in 1979 and named after the film&nbsp;<a href=\"https://en.wikipedia.org/wiki/Soylent_Green\" style=\"text-decoration: none; color: rgb(11, 0, 128); background: none;\" title=\"Soylent Green\">Soylent Green</a>.</p><p style=\"margin: 0.5em 0px; color: rgb(32, 33, 34); font-family: sans-serif; font-size: 14px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255); text-decoration-style: initial; text-decoration-color: initial;\">After Soilent Gr&uuml;n broke up in 1982, Bela and Farin decided to form another band. In the first two years (including Sahnie) they mostly played in clubs in their hometown, Berlin. Their first release was a contribution to the sampler&nbsp;<em>20 sch&auml;umende Stimmungshits</em> (rough translation: &quot;20 foamy party hits&quot;), featuring a strong&nbsp;<a href=\"https://en.wikipedia.org/wiki/Alcohol_(drug)\" style=\"text-decoration: none; color: rgb(11, 0, 128); background: none;\" title=\"Alcohol (drug)\">alcohol</a> theme (for example, the chorus of &quot;Vollmilch&quot; translates as &quot;you drink whiskey, he drinks beer, I drink milk&quot;). In 1983 they won a rock contest in Berlin and with the prize money they recorded their debut EP&nbsp;<em><a href=\"https://en.wikipedia.org/wiki/Uns_geht%27s_prima...\" style=\"text-decoration: none; color: rgb(11, 0, 128); background: none;\" title=\"Uns geht\'s prima...\">Uns geht&#39;s prima...</a></em> (&quot;We&#39;re doing great...&quot;). Finally&nbsp;<a href=\"https://en.wikipedia.org/wiki/Columbia_Records\" style=\"text-decoration: none; color: rgb(11, 0, 128); background: none;\" title=\"Columbia Records\">CBS</a> signed them, and they released their first LP&nbsp;<em><a href=\"https://en.wikipedia.org/wiki/Debil\" style=\"text-decoration: none; color: rgb(11, 0, 128); background: none;\" title=\"Debil\">Debil</a></em> (&quot;Moronic&quot;) in 1984 then their second&nbsp;<em><a href=\"https://en.wikipedia.org/wiki/Im_Schatten_der_%C3%84rzte\" style=\"text-decoration: none; color: rgb(11, 0, 128); background: none;\" title=\"Im Schatten der Ärzte\">Im Schatten der &Auml;rzte</a></em> (&quot;In the shadow of Die &Auml;rzte&quot;) a year later.</p>','dc23cbdb-5245-4e35-a7f1-e1f08ff20359'),('2d06e947-b0eb-488e-9f20-b35f179aa3f6','','','c6bde2bb-e559-4e42-b347-770e6e1ba70b'),('4c18d43d-ad70-4f33-a8ec-af3f283fd013','','<p><span style=\"color: rgb(32, 33, 34); font-family: sans-serif; font-size: 14px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255); text-decoration-style: initial; text-decoration-color: initial; display: inline !important; float: none;\">Erstmals bekannt wurde Dendemann mit dem Projekt&nbsp;</span><i style=\"color: rgb(32, 33, 34); font-family: sans-serif; font-size: 14px; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255); text-decoration-style: initial; text-decoration-color: initial;\">Arme Ritter</i><span style=\"color: rgb(32, 33, 34); font-family: sans-serif; font-size: 14px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255); text-decoration-style: initial; text-decoration-color: initial; display: inline !important; float: none;\">, das h&auml;ufig als&nbsp;</span><a href=\"https://de.wikipedia.org/wiki/Vorgruppe\" style=\"text-decoration: none; color: rgb(11, 0, 128); background: none rgb(255, 255, 255); font-family: sans-serif; font-size: 14px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px;\" title=\"Vorgruppe\">Vorband</a><span style=\"color: rgb(32, 33, 34); font-family: sans-serif; font-size: 14px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255); text-decoration-style: initial; text-decoration-color: initial; display: inline !important; float: none;\">&nbsp;von&nbsp;</span><a href=\"https://de.wikipedia.org/wiki/Fettes_Brot\" style=\"text-decoration: none; color: rgb(11, 0, 128); background: none rgb(255, 255, 255); font-family: sans-serif; font-size: 14px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px;\" title=\"Fettes Brot\">Fettes Brot</a><span style=\"color: rgb(32, 33, 34); font-family: sans-serif; font-size: 14px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255); text-decoration-style: initial; text-decoration-color: initial; display: inline !important; float: none;\">&nbsp;fungierte und auf deren Album&nbsp;</span><i style=\"color: rgb(32, 33, 34); font-family: sans-serif; font-size: 14px; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255); text-decoration-style: initial; text-decoration-color: initial;\"><a href=\"https://de.wikipedia.org/wiki/Au%C3%9Fen_Top_Hits,_innen_Geschmack\" style=\"text-decoration: none; color: rgb(11, 0, 128); background: none;\" title=\"Außen Top Hits, innen Geschmack\">Au&szlig;en Top Hits, innen Geschmack</a></i><span style=\"color: rgb(32, 33, 34); font-family: sans-serif; font-size: 14px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255); text-decoration-style: initial; text-decoration-color: initial; display: inline !important; float: none;\">&nbsp;er mit dem Musiktitel&nbsp;</span><i style=\"color: rgb(32, 33, 34); font-family: sans-serif; font-size: 14px; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255); text-decoration-style: initial; text-decoration-color: initial;\">&hellip; und ich geh nicht zum Arzt</i><span style=\"color: rgb(32, 33, 34); font-family: sans-serif; font-size: 14px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255); text-decoration-style: initial; text-decoration-color: initial; display: inline !important; float: none;\">&nbsp;zu h&ouml;ren ist. Zuvor ver&ouml;ffentlichte Dendemann zwar unter dem Namen&nbsp;</span><i style=\"color: rgb(32, 33, 34); font-family: sans-serif; font-size: 14px; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255); text-decoration-style: initial; text-decoration-color: initial;\">Arme Ritter</i><span style=\"color: rgb(32, 33, 34); font-family: sans-serif; font-size: 14px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255); text-decoration-style: initial; text-decoration-color: initial; display: inline !important; float: none;\">&nbsp;zusammen mit dem Rapper&nbsp;</span><a href=\"https://de.wikipedia.org/w/index.php?title=Majubiese&action=edit&redlink=1\" style=\"text-decoration: none; color: rgb(165, 88, 88); background: none rgb(255, 255, 255); font-family: sans-serif; font-size: 14px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px;\" title=\"Majubiese (Seite nicht vorhanden)\">Majubiese</a><span style=\"color: rgb(32, 33, 34); font-family: sans-serif; font-size: 14px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255); text-decoration-style: initial; text-decoration-color: initial; display: inline !important; float: none;\">&nbsp;und dem&nbsp;</span><a href=\"https://de.wikipedia.org/wiki/Musikproduzent\" style=\"text-decoration: none; color: rgb(11, 0, 128); background: none rgb(255, 255, 255); font-family: sans-serif; font-size: 14px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px;\" title=\"Musikproduzent\">Produzenten</a><span style=\"color: rgb(32, 33, 34); font-family: sans-serif; font-size: 14px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255); text-decoration-style: initial; text-decoration-color: initial; display: inline !important; float: none;\">&nbsp;</span><a href=\"https://de.wikipedia.org/w/index.php?title=Carsten_Schulz&action=edit&redlink=1\" style=\"text-decoration: none; color: rgb(165, 88, 88); background: none rgb(255, 255, 255); font-family: sans-serif; font-size: 14px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px;\" title=\"Carsten Schulz (Seite nicht vorhanden)\">Carsten &bdquo;Boogie&ldquo; Schulz</a><span style=\"color: rgb(32, 33, 34); font-family: sans-serif; font-size: 14px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255); text-decoration-style: initial; text-decoration-color: initial; display: inline !important; float: none;\">&nbsp;bei&nbsp;</span><a href=\"https://de.wikipedia.org/wiki/Sony_Music_Entertainment\" style=\"text-decoration: none; color: rgb(11, 0, 128); background: none rgb(255, 255, 255); font-family: sans-serif; font-size: 14px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px;\" title=\"Sony Music Entertainment\">Sony Music</a><span style=\"color: rgb(32, 33, 34); font-family: sans-serif; font-size: 14px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255); text-decoration-style: initial; text-decoration-color: initial; display: inline !important; float: none;\">&nbsp;den Musiktitel&nbsp;</span><i style=\"color: rgb(32, 33, 34); font-family: sans-serif; font-size: 14px; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255); text-decoration-style: initial; text-decoration-color: initial;\">Disco &#39;95 (Singt und schwingt das Bein)</i><span style=\"color: rgb(32, 33, 34); font-family: sans-serif; font-size: 14px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255); text-decoration-style: initial; text-decoration-color: initial; display: inline !important; float: none;\">, allerdings mit geringem kommerziellen Erfolg.</span></p>','c3ee23a8-eaee-40b9-a4b6-7ddaccfe4538'),('56eddbfa-b433-4133-80c2-6bcf90bb0405','','<p>asdasd</p>','a0efaa7f-a529-4fbe-9087-7945c0cd3922'),('5f6053c7-2bf8-4bf1-a3c4-b124ae84a622','','<p>asdad</p>','8ea7cd77-502c-4f8b-8e52-2f00a956f322'),('6d7b9c21-45f0-4fba-8b10-fcf113e4e911','','<p>asdad</p>','2891cb0a-68ef-44e4-9e57-4cf6d71fdb07'),('86de8bd9-2dca-4c47-9111-6eac4759deae','','<p>www.tocotronic.com</p>','e1aff5cb-fd29-45ad-b827-b2e3fa9784f0'),('92222988-d063-4c56-b4dc-f0896d97b40e','','<p>asdad</p>','dd0d74e7-537f-4797-a9c9-11595f599f64'),('93c01bc5-2a77-4593-80bf-10e2358cc854','','<p>asdad</p>','49e8eabf-805f-4ac6-adaf-a710fd30a833'),('a0dd41f8-d310-4812-ba97-80bd68b1d098','','<p>asdasda</p>','80773acf-fecb-47df-8855-08571ccef151'),('a8f0b534-8847-4d34-8e88-faae0452f6df','','<p>scoop</p>','2f7d9224-b1e1-4781-a06c-e4751867de64'),('cf0eeb08-e6ff-434c-8c6b-140188a4b6be','','<p><i style=\"color: rgb(32, 33, 34); font-family: sans-serif; font-size: 14px; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255); text-decoration-style: initial; text-decoration-color: initial;\">Feine Sahne Fischfilet</i><span style=\"color: rgb(32, 33, 34); font-family: sans-serif; font-size: 14px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255); text-decoration-style: initial; text-decoration-color: initial; display: inline !important; float: none;\">&nbsp;wurde 2007 von f&uuml;nf Sch&uuml;lern gegr&uuml;ndet. Auf ihrem ersten ver&ouml;ffentlichten Album befanden sich Lieder mit sexistischen Textpassagen, von denen sich die Band mittlerweile distanziert hat. S&auml;nger&nbsp;</span><a href=\"https://de.wikipedia.org/wiki/Jan_Gorkow\" style=\"text-decoration: none; color: rgb(11, 0, 128); background: none rgb(255, 255, 255); font-family: sans-serif; font-size: 14px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px;\" title=\"Jan Gorkow\">Jan Gorkow</a><span style=\"color: rgb(32, 33, 34); font-family: sans-serif; font-size: 14px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255); text-decoration-style: initial; text-decoration-color: initial; display: inline !important; float: none;\">, genannt&nbsp;</span><i style=\"color: rgb(32, 33, 34); font-family: sans-serif; font-size: 14px; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255); text-decoration-style: initial; text-decoration-color: initial;\">Monchi</i><span style=\"color: rgb(32, 33, 34); font-family: sans-serif; font-size: 14px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255); text-decoration-style: initial; text-decoration-color: initial; display: inline !important; float: none;\">, sagte dazu: &bdquo;Wir waren 18, 19 Jahre alt. W&auml;re dieses Album nicht ausverkauft, w&uuml;rden wir es nicht mehr vertreiben.&ldquo; Konzerte fanden haupts&auml;chlich in den l&auml;ndlichen Gebieten Mecklenburg-Vorpommerns statt, auf denen sich nach eigenen Angaben immer mehr&nbsp;</span><a href=\"https://de.wikipedia.org/wiki/Neonazi\" style=\"text-decoration: none; color: rgb(11, 0, 128); background: none rgb(255, 255, 255); font-family: sans-serif; font-size: 14px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px;\" title=\"Neonazi\">Neonazi</a><span style=\"color: rgb(32, 33, 34); font-family: sans-serif; font-size: 14px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255); text-decoration-style: initial; text-decoration-color: initial; display: inline !important; float: none;\">&nbsp;einfanden. Daraufhin positionierte sich die Band und organisierte eigene Sicherheitsma&szlig;nahmen.</span></p>','ef678346-8545-4f5b-9d9b-4c5768a2399a'),('f32f8a45-31ac-40c5-83cd-c7a3c70a8c4e','','<p>www.ska-p.com</p>','a34dd9d5-360d-496d-989f-ca356ee0479f');
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
INSERT INTO `locations` VALUES ('0c9bb5d7-7c4e-4c2a-805d-9507e6bb1458','c3ee23a8-eaee-40b9-a4b6-7ddaccfe4538','Hiddenseer Straße','2','Hiddenseer Straße 2, 10437 Berlin','13.425112','52.54273749999999','Berlin','','10437','Freuen uns auf euch'),('162eb879-be90-4307-b411-2288197d56cd','bca7d43a-bcf9-4760-bf56-2d71e58c0644','Hiddenseer Straße','2','Hiddenseer Straße 2, 10437 Berlin','13.425112','52.54273749999999','Berlin','','10437','Freuen uns auf euch'),('5567ff1a-f804-44f8-b858-07195d95e9ba','051eb4c0-db93-4690-a9a9-8b3912c66098','Hiddenseer Straße','2','Hiddenseer Straße 2, 10437 Berlin','13.425112','52.54273749999999','Berlin','','10437','Freuen uns auf euch'),('597b8af6-41aa-4675-b74b-2325c529db96','dc23cbdb-5245-4e35-a7f1-e1f08ff20359','Hiddenseer Straße','2','Hiddenseer Straße 2, 10437 Berlin','13.425112','52.54273749999999','Berlin','','10437','Freuen uns auf euch'),('8470f066-2edd-46e7-a752-a0b04e90e973','68318c6f-b579-4e1a-8839-092e90033fc9','Hiddenseer Straße','2','Hiddenseer Straße 2, 10437 Berlin','13.425112','52.54273749999999','Berlin','','10437','Freuen uns auf euch'),('9645abbb-59fb-458f-9da1-30441e55e8e0','72f3698e-88b5-4f26-9edc-ba2ebaef54b9','Hiddenseer Straße','2','Hiddenseer Straße 2, 10437 Berlin','13.425112','52.54273749999999','Berlin','','10437','Freuen uns auf euch'),('9915e535-2c47-43f7-a74f-7f58f6ba8a8d','39171ec0-5122-45ce-9bc3-4e7ab4ad0118','Hiddenseer Straße','2','Hiddenseer Straße 2, 10437 Berlin','13.425112','52.54273749999999','Berlin','','10437','Freuen uns auf euch'),('b02bc93c-dfc9-4acd-b005-b5671ab64a7d','a34dd9d5-360d-496d-989f-ca356ee0479f','Hamburger Straße','2','Hamburger Straße 2, 22083 Hamburg','10.0282145','53.5709088','Hamburg','','22083','www.ska-p.com'),('b82ac185-874d-4ee4-89ee-ec0525202b1c','ef678346-8545-4f5b-9d9b-4c5768a2399a','Hiddenseer Straße','2','Hiddenseer Straße 2, 10437 Berlin','13.425112','52.54273749999999','Berlin','','10437','Freuen uns auf euch'),('c4ff4294-fe8c-4c45-9679-a6468c7eb187','11a1467e-6343-49db-ac5e-e595bbe9a58d','Hiddenseer Straße','2','Hiddenseer Straße 2, 10437 Berlin','13.425112','52.54273749999999','Berlin','','10437','Freuen uns auf euch'),('f523441c-0e48-47bd-8f1b-dd71d0cd7de7','2f7d9224-b1e1-4781-a06c-e4751867de64','Hiddenseer Straße','2','Hiddenseer Straße 2, 10437 Berlin','13.425112','52.54273749999999','Berlin','','10437','Freuen uns auf euch');
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
INSERT INTO `poolevents` VALUES ('051eb4c0-db93-4690-a9a9-8b3912c66098','Tocotronic',20200705095041,1593942640996,1593942640996,1593942640996,1593942640996,'63e20762-2b04-42a8-907e-4f0f6a087f85','www.tocotronic.com',5,0,'4a74141e-c2c0-46a0-9c0c-84bef8be7d0f',NULL,'RELEASED',2,0,'\0',NULL),('05380057-10a3-41cf-b12d-1793100ecadd','Tocotronic',20200705094135,1593942094773,1593942094773,1593942094773,1593942094773,'63e20762-2b04-42a8-907e-4f0f6a087f85','www.tocotronic.com',5,0,'4a74141e-c2c0-46a0-9c0c-84bef8be7d0f',NULL,'UNRELEASED',2,0,'\0',NULL),('11a1467e-6343-49db-ac5e-e595bbe9a58d','Tocotronic',20200705095910,1593943149334,1593943149334,1593943149334,1593943149334,'63e20762-2b04-42a8-907e-4f0f6a087f85','www.tocotronic.com',5,0,'4a74141e-c2c0-46a0-9c0c-84bef8be7d0f',NULL,'UNRELEASED',2,0,'\0',NULL),('2f7d9224-b1e1-4781-a06c-e4751867de64','Tocotronic',20200705095945,1593943184763,1593943184763,1593943184763,1593943184763,'63e20762-2b04-42a8-907e-4f0f6a087f85','www.tocotronic.com',5,0,'4a74141e-c2c0-46a0-9c0c-84bef8be7d0f',NULL,'UNRELEASED',2,0,'\0',NULL),('39171ec0-5122-45ce-9bc3-4e7ab4ad0118','Feine Sahne Fischfilet',20200705100553,1593943553593,1593943553593,1593943553593,1593943553593,'63e20762-2b04-42a8-907e-4f0f6a087f85','www.Fischfilet.com',8,0,'4a74141e-c2c0-46a0-9c0c-84bef8be7d0f',NULL,'UNRELEASED',2,0,'\0',NULL),('68318c6f-b579-4e1a-8839-092e90033fc9','Tocotronic',20200705094927,1593942566910,1593942566910,1593942566910,1593942566910,'63e20762-2b04-42a8-907e-4f0f6a087f85','www.tocotronic.com',5,0,'4a74141e-c2c0-46a0-9c0c-84bef8be7d0f',NULL,'UNRELEASED',2,0,'\0',NULL),('72f3698e-88b5-4f26-9edc-ba2ebaef54b9','Feine Sahne Fischfilet',20200705100721,1593943641320,1593943641320,1593943641320,1593943641320,'63e20762-2b04-42a8-907e-4f0f6a087f85','www.Fischfilet.com',8,0,'4a74141e-c2c0-46a0-9c0c-84bef8be7d0f',NULL,'RELEASED',2,0,'\0',NULL),('a34dd9d5-360d-496d-989f-ca356ee0479f','Ska-p',20200705122648,1593952007638,1593952007638,1593952007638,1593952007638,'85f9ebca-2d93-4b02-bc80-fdd164d51dd7','www.ska-p.com',4,0,'4a74141e-c2c0-46a0-9c0c-84bef8be7d0f',NULL,'UNRELEASED',2,0,'\0',NULL),('bca7d43a-bcf9-4760-bf56-2d71e58c0644','Feine Sahne Fischfilet',20200705100518,1593943518514,1593943518514,1593943518514,1593943518514,'63e20762-2b04-42a8-907e-4f0f6a087f85','www.Fischfilet.com',8,0,'4a74141e-c2c0-46a0-9c0c-84bef8be7d0f',NULL,'UNRELEASED',2,0,'\0',NULL),('c3ee23a8-eaee-40b9-a4b6-7ddaccfe4538','Dendemann',20200705101220,1593943939605,1593943939605,1593943939605,1593943939605,'63e20762-2b04-42a8-907e-4f0f6a087f85','www.dendemann.com',8,0,'4a74141e-c2c0-46a0-9c0c-84bef8be7d0f',NULL,'RELEASED',2,0,'\0',NULL),('dc23cbdb-5245-4e35-a7f1-e1f08ff20359','Die Ärzte',20200705101320,1593944000284,1593944000284,1593944000284,1593944000284,'4a74141e-c2c0-46a0-9c0c-84bef8be7d0f','www.dendemann.com',8,0,'4a74141e-c2c0-46a0-9c0c-84bef8be7d0f',NULL,'RELEASED',2,0,'\0',NULL),('ec5016c4-c216-4f1c-8463-7597b29a2ae1','Tocotronic',20200705094412,1593942252329,1593942252329,1593942252329,1593942252329,'63e20762-2b04-42a8-907e-4f0f6a087f85','www.tocotronic.com',0,0,'4a74141e-c2c0-46a0-9c0c-84bef8be7d0f',NULL,'UNRELEASED',2,0,'\0',NULL),('ef678346-8545-4f5b-9d9b-4c5768a2399a','Feine Sahne Fischfilet',20200705100939,1593943778613,1593943778613,1593943778613,1593943778613,'63e20762-2b04-42a8-907e-4f0f6a087f85','www.Fischfilet.com',8,0,'4a74141e-c2c0-46a0-9c0c-84bef8be7d0f',NULL,'UNRELEASED',2,0,'\0',NULL);
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
INSERT INTO `votes` VALUES ('0a6fc37f-dc7f-498e-bf06-62eebeb751ad','4a74141e-c2c0-46a0-9c0c-84bef8be7d0f','2020-03-27 14:41:40','a408491a-c909-4163-969b-73838661cad1'),('11f289a6-d122-4304-a6f9-b65a93c26369','4a74141e-c2c0-46a0-9c0c-84bef8be7d0f','2020-03-27 14:41:35','a7d924d9-8058-4a69-aa22-8e885a0f896a'),('3338fb9b-2e65-42b6-93bb-c0f4daf77598','4a74141e-c2c0-46a0-9c0c-84bef8be7d0f','2020-03-27 14:42:08','8118ceb9-9920-45c6-b398-4cf09c9deb23'),('3be33c99-9168-4945-b667-66a5306735d2','4a74141e-c2c0-46a0-9c0c-84bef8be7d0f','2020-07-02 19:13:18','e926b0dd-a3fe-4990-82f1-7168fc6e1f4a'),('69187ac1-bc56-4448-90ae-b3dfee0a7889','4a74141e-c2c0-46a0-9c0c-84bef8be7d0f','2020-03-27 12:14:20','3b2cf4aa-5b21-46d8-b4ec-faf92443bb15'),('6b4c57e3-f4c8-4917-95b5-0375827902b8','4a74141e-c2c0-46a0-9c0c-84bef8be7d0f','2020-03-27 12:14:34','4d5df0f7-3285-423f-8b74-59b95ef42c2d'),('b571de56-43b8-46c5-a456-992d7c936e94','4a74141e-c2c0-46a0-9c0c-84bef8be7d0f','2020-03-27 14:41:50','9c7bfddd-ecbe-404f-bc91-3a535d6bb0c6'),('fd8bb9e3-85f1-4d27-851a-72a013a5a5b0','4a74141e-c2c0-46a0-9c0c-84bef8be7d0f','2020-03-27 12:14:58','040c3f30-8680-4f60-8441-2ee89bd77731');
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

-- Dump completed on 2020-07-05 15:39:41
