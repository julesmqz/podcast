-- MySQL dump 10.13  Distrib 5.6.22, for osx10.8 (x86_64)
--
-- Host: 127.0.0.1    Database: podcast
-- ------------------------------------------------------
-- Server version	5.6.26

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
-- Table structure for table `channel`
--

DROP TABLE IF EXISTS `channel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `channel` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(45) DEFAULT NULL,
  `subtitle` varchar(45) DEFAULT NULL,
  `description` varchar(45) DEFAULT NULL,
  `author` varchar(45) DEFAULT NULL,
  `author_email` varchar(45) DEFAULT NULL,
  `language` varchar(45) DEFAULT NULL,
  `copyright` varchar(45) DEFAULT NULL,
  `explicit` varchar(45) DEFAULT NULL,
  `image` varchar(45) DEFAULT NULL,
  `active` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `channel`
--

LOCK TABLES `channel` WRITE;
/*!40000 ALTER TABLE `channel` DISABLE KEYS */;
INSERT INTO `channel` VALUES (1,'Nothing','really','this is nothing','no one','no@thing.com','es/mx','© no one','yes','null',1);
/*!40000 ALTER TABLE `channel` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ci_session`
--

DROP TABLE IF EXISTS `ci_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ci_session` (
  `id` varchar(40) NOT NULL DEFAULT '0',
  `ip_address` varchar(45) NOT NULL DEFAULT '0',
  `user_agent` varchar(120) DEFAULT NULL,
  `last_activity` int(10) DEFAULT '0',
  `data` text NOT NULL,
  `timestamp` varchar(45) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `last_activity_idx` (`last_activity`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ci_session`
--

LOCK TABLES `ci_session` WRITE;
/*!40000 ALTER TABLE `ci_session` DISABLE KEYS */;
INSERT INTO `ci_session` VALUES ('0a4079a6d7f54595ade5463436fdc0ca6a3cf244','::1',NULL,0,'__ci_last_regenerate|i:1443385544;id|s:1:\"1\";user|s:5:\"admin\";pass|s:32:\"a4f86f7bfc24194b276c22e0ef158197\";pretty_name|s:11:\"Super Admin\";usr|N;','1443385841'),('0d9f2d8d6b28efe9524e0290dee3448c96a4a84b','::1',NULL,0,'__ci_last_regenerate|i:1443397902;usr|a:4:{s:2:\"id\";s:1:\"1\";s:4:\"user\";s:5:\"admin\";s:4:\"pass\";s:32:\"a4f86f7bfc24194b276c22e0ef158197\";s:11:\"pretty_name\";s:11:\"Super Admin\";}','1443398164'),('0e7f5a9f699a648389a5093e5899573a1a072a6c','::1',NULL,0,'__ci_last_regenerate|i:1443581163;','1443581169'),('0f5c7b2710921a6729a01c3548c426a8be7fbc95','::1',NULL,0,'__ci_last_regenerate|i:1443621350;usr|a:4:{s:2:\"id\";s:1:\"1\";s:4:\"user\";s:5:\"admin\";s:4:\"pass\";s:32:\"a4f86f7bfc24194b276c22e0ef158197\";s:11:\"pretty_name\";s:11:\"Super Admin\";}','1443621381'),('1c0afd5e7eca48b4c4a21b6213003513b723a990','::1',NULL,0,'__ci_last_regenerate|i:1443622525;usr|a:4:{s:2:\"id\";s:1:\"1\";s:4:\"user\";s:5:\"admin\";s:4:\"pass\";s:32:\"a4f86f7bfc24194b276c22e0ef158197\";s:11:\"pretty_name\";s:11:\"Super Admin\";}','1443622809'),('20f021029cfb983692d7483849d3e9f39595a619','::1',NULL,0,'__ci_last_regenerate|i:1443400079;usr|N;','1443400368'),('245bede316a10281aebdab2c8cfb76bdb4d02543','::1',NULL,0,'__ci_last_regenerate|i:1443395331;usr|a:4:{s:2:\"id\";s:1:\"1\";s:4:\"user\";s:5:\"admin\";s:4:\"pass\";s:32:\"a4f86f7bfc24194b276c22e0ef158197\";s:11:\"pretty_name\";s:11:\"Super Admin\";}','1443395331'),('271deab3a1ca7361823b15fcd4e065010faed283','::1',NULL,0,'__ci_last_regenerate|i:1443620884;usr|a:4:{s:2:\"id\";s:1:\"1\";s:4:\"user\";s:5:\"admin\";s:4:\"pass\";s:32:\"a4f86f7bfc24194b276c22e0ef158197\";s:11:\"pretty_name\";s:11:\"Super Admin\";}','1443620884'),('297a4efd743258ebed7787e4d4c335fe30b3b8ba','::1',NULL,0,'__ci_last_regenerate|i:1443399771;usr|a:4:{s:2:\"id\";s:1:\"1\";s:4:\"user\";s:5:\"admin\";s:4:\"pass\";s:32:\"a4f86f7bfc24194b276c22e0ef158197\";s:11:\"pretty_name\";s:11:\"Super Admin\";}','1443400067'),('2cfed0872b427a3515d5e1879e7465f4cd9bc959','::1',NULL,0,'__ci_last_regenerate|i:1443618933;usr|a:4:{s:2:\"id\";s:1:\"1\";s:4:\"user\";s:5:\"admin\";s:4:\"pass\";s:32:\"a4f86f7bfc24194b276c22e0ef158197\";s:11:\"pretty_name\";s:11:\"Super Admin\";}','1443618933'),('3a5448b12e70fd02efa1b452ce05fec1aabb3b09','::1',NULL,0,'__ci_last_regenerate|i:1443385176;id|s:1:\"1\";user|s:5:\"admin\";pass|s:32:\"a4f86f7bfc24194b276c22e0ef158197\";pretty_name|s:11:\"Super Admin\";usr|a:4:{s:2:\"id\";s:1:\"1\";s:4:\"user\";s:5:\"admin\";s:4:\"pass\";s:32:\"a4f86f7bfc24194b276c22e0ef158197\";s:11:\"pretty_name\";s:11:\"Super Admin\";}','1443385420'),('3f127bedb59281857475e57aee0c70ac98a45a5c','::1',NULL,0,'__ci_last_regenerate|i:1443619269;usr|a:4:{s:2:\"id\";s:1:\"1\";s:4:\"user\";s:5:\"admin\";s:4:\"pass\";s:32:\"a4f86f7bfc24194b276c22e0ef158197\";s:11:\"pretty_name\";s:11:\"Super Admin\";}','1443619269'),('409b5b2eef4464a4ba2cebf5fa6c508480ee2a2b','::1',NULL,0,'__ci_last_regenerate|i:1443396585;usr|a:4:{s:2:\"id\";s:1:\"1\";s:4:\"user\";s:5:\"admin\";s:4:\"pass\";s:32:\"a4f86f7bfc24194b276c22e0ef158197\";s:11:\"pretty_name\";s:11:\"Super Admin\";}','1443396617'),('43882dba3c4e944ad90d5397e80c6122034e97ef','::1',NULL,0,'__ci_last_regenerate|i:1443585655;usr|a:4:{s:2:\"id\";s:1:\"1\";s:4:\"user\";s:5:\"admin\";s:4:\"pass\";s:32:\"a4f86f7bfc24194b276c22e0ef158197\";s:11:\"pretty_name\";s:11:\"Super Admin\";}','1443585655'),('458326cda062efce151c343877aa89e01a1a0804','::1',NULL,0,'__ci_last_regenerate|i:1443620264;usr|a:4:{s:2:\"id\";s:1:\"1\";s:4:\"user\";s:5:\"admin\";s:4:\"pass\";s:32:\"a4f86f7bfc24194b276c22e0ef158197\";s:11:\"pretty_name\";s:11:\"Super Admin\";}','1443620264'),('4caffc0db1f02d9e00798edb9066f5620067a4ad','::1',NULL,0,'__ci_last_regenerate|i:1443618933;usr|a:4:{s:2:\"id\";s:1:\"1\";s:4:\"user\";s:5:\"admin\";s:4:\"pass\";s:32:\"a4f86f7bfc24194b276c22e0ef158197\";s:11:\"pretty_name\";s:11:\"Super Admin\";}','1443619233'),('51cc3222055d7a9ade18a1114c2147c9f190005f','::1',NULL,0,'__ci_last_regenerate|i:1443398508;usr|a:4:{s:2:\"id\";s:1:\"1\";s:4:\"user\";s:5:\"admin\";s:4:\"pass\";s:32:\"a4f86f7bfc24194b276c22e0ef158197\";s:11:\"pretty_name\";s:11:\"Super Admin\";}','1443398606'),('562a3aaebd46ebeeb90de2f1448b4a1a3dc770c0','::1',NULL,0,'__ci_last_regenerate|i:1443619831;usr|a:4:{s:2:\"id\";s:1:\"1\";s:4:\"user\";s:5:\"admin\";s:4:\"pass\";s:32:\"a4f86f7bfc24194b276c22e0ef158197\";s:11:\"pretty_name\";s:11:\"Super Admin\";}','1443619893'),('5b95af62d970005e0eb110c367e94e1da63efdc2','::1',NULL,0,'__ci_last_regenerate|i:1443621350;usr|a:4:{s:2:\"id\";s:1:\"1\";s:4:\"user\";s:5:\"admin\";s:4:\"pass\";s:32:\"a4f86f7bfc24194b276c22e0ef158197\";s:11:\"pretty_name\";s:11:\"Super Admin\";}','1443621350'),('5c1e7fb65ccfcd5346ffbccb3f1bbacf7747132a','::1',NULL,0,'__ci_last_regenerate|i:1443620464;usr|a:4:{s:2:\"id\";s:1:\"1\";s:4:\"user\";s:5:\"admin\";s:4:\"pass\";s:32:\"a4f86f7bfc24194b276c22e0ef158197\";s:11:\"pretty_name\";s:11:\"Super Admin\";}','1443620687'),('5c251de009503a6225231f30f8adbda5d129ad09','::1',NULL,0,'__ci_last_regenerate|i:1443628410;usr|a:4:{s:2:\"id\";s:1:\"1\";s:4:\"user\";s:5:\"admin\";s:4:\"pass\";s:32:\"a4f86f7bfc24194b276c22e0ef158197\";s:11:\"pretty_name\";s:11:\"Super Admin\";}','1443628410'),('60a8224e3b4cc2cd57597e9b8aa51bb646eb452b','::1',NULL,0,'__ci_last_regenerate|i:1443620884;usr|a:4:{s:2:\"id\";s:1:\"1\";s:4:\"user\";s:5:\"admin\";s:4:\"pass\";s:32:\"a4f86f7bfc24194b276c22e0ef158197\";s:11:\"pretty_name\";s:11:\"Super Admin\";}','1443620884'),('66e81f1105342ed8d1d55e8af7b65a0225464654','::1',NULL,0,'__ci_last_regenerate|i:1443620565;usr|a:4:{s:2:\"id\";s:1:\"1\";s:4:\"user\";s:5:\"admin\";s:4:\"pass\";s:32:\"a4f86f7bfc24194b276c22e0ef158197\";s:11:\"pretty_name\";s:11:\"Super Admin\";}','1443620565'),('67c628ef40a6b9800f3b4347c049390f142e3c37','::1',NULL,0,'__ci_last_regenerate|i:1443624269;usr|a:4:{s:2:\"id\";s:1:\"1\";s:4:\"user\";s:5:\"admin\";s:4:\"pass\";s:32:\"a4f86f7bfc24194b276c22e0ef158197\";s:11:\"pretty_name\";s:11:\"Super Admin\";}','1443624435'),('6abe7d5b0814599d06b4feae9558c266e37f9b7a','::1',NULL,0,'__ci_last_regenerate|i:1443620264;usr|a:4:{s:2:\"id\";s:1:\"1\";s:4:\"user\";s:5:\"admin\";s:4:\"pass\";s:32:\"a4f86f7bfc24194b276c22e0ef158197\";s:11:\"pretty_name\";s:11:\"Super Admin\";}','1443620412'),('72e4dcca372860466406413fca431398db00f2ba','::1',NULL,0,'__ci_last_regenerate|i:1443619831;usr|a:4:{s:2:\"id\";s:1:\"1\";s:4:\"user\";s:5:\"admin\";s:4:\"pass\";s:32:\"a4f86f7bfc24194b276c22e0ef158197\";s:11:\"pretty_name\";s:11:\"Super Admin\";}','1443619831'),('7bf596edfc38e8efe961d076ffe98df7f3d5f29d','::1',NULL,0,'__ci_last_regenerate|i:1443620565;usr|a:4:{s:2:\"id\";s:1:\"1\";s:4:\"user\";s:5:\"admin\";s:4:\"pass\";s:32:\"a4f86f7bfc24194b276c22e0ef158197\";s:11:\"pretty_name\";s:11:\"Super Admin\";}','1443620565'),('7eb224617e991d749ae9c9716aabe7ab3f4b544f','::1',NULL,0,'__ci_last_regenerate|i:1443586315;usr|a:4:{s:2:\"id\";s:1:\"1\";s:4:\"user\";s:5:\"admin\";s:4:\"pass\";s:32:\"a4f86f7bfc24194b276c22e0ef158197\";s:11:\"pretty_name\";s:11:\"Super Admin\";}','1443586378'),('8204145dd4597c9528807e23e75d7d7db9f7ceb2','::1',NULL,0,'__ci_last_regenerate|i:1443618372;usr|a:4:{s:2:\"id\";s:1:\"1\";s:4:\"user\";s:5:\"admin\";s:4:\"pass\";s:32:\"a4f86f7bfc24194b276c22e0ef158197\";s:11:\"pretty_name\";s:11:\"Super Admin\";}','1443618639'),('839b4e3154b1ef72f5fdfa3b387fb40f2edc049b','::1',NULL,0,'__ci_last_regenerate|i:1443624733;usr|a:4:{s:2:\"id\";s:1:\"1\";s:4:\"user\";s:5:\"admin\";s:4:\"pass\";s:32:\"a4f86f7bfc24194b276c22e0ef158197\";s:11:\"pretty_name\";s:11:\"Super Admin\";}','1443625032'),('854ef6349d0196e48cd4172fd140b6e576af6a41','::1',NULL,0,'__ci_last_regenerate|i:1443619269;usr|a:4:{s:2:\"id\";s:1:\"1\";s:4:\"user\";s:5:\"admin\";s:4:\"pass\";s:32:\"a4f86f7bfc24194b276c22e0ef158197\";s:11:\"pretty_name\";s:11:\"Super Admin\";}','1443619506'),('862835f71fd44fe1c186342f492d0696d163b40e','::1',NULL,0,'__ci_last_regenerate|i:1443628410;usr|a:4:{s:2:\"id\";s:1:\"1\";s:4:\"user\";s:5:\"admin\";s:4:\"pass\";s:32:\"a4f86f7bfc24194b276c22e0ef158197\";s:11:\"pretty_name\";s:11:\"Super Admin\";}','1443628410'),('883bb41892f3bc1dc01a23729275bd27e7ebc56e','::1',NULL,0,'__ci_last_regenerate|i:1443622885;usr|a:4:{s:2:\"id\";s:1:\"1\";s:4:\"user\";s:5:\"admin\";s:4:\"pass\";s:32:\"a4f86f7bfc24194b276c22e0ef158197\";s:11:\"pretty_name\";s:11:\"Super Admin\";}','1443622957'),('88855ee9f5ebf2d12125b2439a576d57eabe18ad','::1',NULL,0,'__ci_last_regenerate|i:1443628410;usr|a:4:{s:2:\"id\";s:1:\"1\";s:4:\"user\";s:5:\"admin\";s:4:\"pass\";s:32:\"a4f86f7bfc24194b276c22e0ef158197\";s:11:\"pretty_name\";s:11:\"Super Admin\";}','1443628611'),('8f6fcf844f8d10c6825f3783e424cb7e24cd028f','::1',NULL,0,'__ci_last_regenerate|i:1443626600;usr|a:4:{s:2:\"id\";s:1:\"1\";s:4:\"user\";s:5:\"admin\";s:4:\"pass\";s:32:\"a4f86f7bfc24194b276c22e0ef158197\";s:11:\"pretty_name\";s:11:\"Super Admin\";}','1443626605'),('90a74be90ac65a19d0a11c75a4a66827a9311cac','::1',NULL,0,'__ci_last_regenerate|i:1443395016;usr|a:4:{s:2:\"id\";s:1:\"1\";s:4:\"user\";s:5:\"admin\";s:4:\"pass\";s:32:\"a4f86f7bfc24194b276c22e0ef158197\";s:11:\"pretty_name\";s:11:\"Super Admin\";}','1443395059'),('92ffc887a5753d3798566a303bd8a4109060bdf9','::1',NULL,0,'__ci_last_regenerate|i:1443584212;','1443584443'),('9a3d34afb5ec3821da3eda1b18f23ea7789ad81c','::1',NULL,0,'__ci_last_regenerate|i:1443623193;usr|a:4:{s:2:\"id\";s:1:\"1\";s:4:\"user\";s:5:\"admin\";s:4:\"pass\";s:32:\"a4f86f7bfc24194b276c22e0ef158197\";s:11:\"pretty_name\";s:11:\"Super Admin\";}','1443623217'),('9bdcabc80b655f1eb669bc50d0a7a32df104596d','::1',NULL,0,'__ci_last_regenerate|i:1443397589;usr|a:4:{s:2:\"id\";s:1:\"1\";s:4:\"user\";s:5:\"admin\";s:4:\"pass\";s:32:\"a4f86f7bfc24194b276c22e0ef158197\";s:11:\"pretty_name\";s:11:\"Super Admin\";}','1443397881'),('a0b2733983d9d40a44b1935cd978797ec88bbdd1','::1',NULL,0,'__ci_last_regenerate|i:1443385854;id|s:1:\"1\";user|s:5:\"admin\";pass|s:32:\"a4f86f7bfc24194b276c22e0ef158197\";pretty_name|s:11:\"Super Admin\";usr|a:4:{s:2:\"id\";s:1:\"1\";s:4:\"user\";s:5:\"admin\";s:4:\"pass\";s:32:\"a4f86f7bfc24194b276c22e0ef158197\";s:11:\"pretty_name\";s:11:\"Super Admin\";}','1443385995'),('a282ddba87e213c58057c6f0d293f6d4925fb90c','::1',NULL,0,'__ci_last_regenerate|i:1443621667;usr|a:4:{s:2:\"id\";s:1:\"1\";s:4:\"user\";s:5:\"admin\";s:4:\"pass\";s:32:\"a4f86f7bfc24194b276c22e0ef158197\";s:11:\"pretty_name\";s:11:\"Super Admin\";}','1443621743'),('a3d4e5c73db8609fe848861c525c8a11bf3058e0','::1',NULL,0,'__ci_last_regenerate|i:1443620884;usr|a:4:{s:2:\"id\";s:1:\"1\";s:4:\"user\";s:5:\"admin\";s:4:\"pass\";s:32:\"a4f86f7bfc24194b276c22e0ef158197\";s:11:\"pretty_name\";s:11:\"Super Admin\";}','1443621026'),('a47ea3ea7e94301fe539a2dedf283efc568f1b3c','::1',NULL,0,'__ci_last_regenerate|i:1443626998;usr|a:4:{s:2:\"id\";s:1:\"1\";s:4:\"user\";s:5:\"admin\";s:4:\"pass\";s:32:\"a4f86f7bfc24194b276c22e0ef158197\";s:11:\"pretty_name\";s:11:\"Super Admin\";}','1443627213'),('a5dff9b6d9f4f58732f368bd0c39b82e8d6ef267','::1',NULL,0,'__ci_last_regenerate|i:1443625357;usr|a:4:{s:2:\"id\";s:1:\"1\";s:4:\"user\";s:5:\"admin\";s:4:\"pass\";s:32:\"a4f86f7bfc24194b276c22e0ef158197\";s:11:\"pretty_name\";s:11:\"Super Admin\";}','1443625365'),('ad2b8f59dd54d93678258c5549eb7b735b8dd734','::1',NULL,0,'__ci_last_regenerate|i:1443584758;usr|a:4:{s:2:\"id\";s:1:\"1\";s:4:\"user\";s:5:\"admin\";s:4:\"pass\";s:32:\"a4f86f7bfc24194b276c22e0ef158197\";s:11:\"pretty_name\";s:11:\"Super Admin\";}','1443584966'),('af53f722b4842cc427314a78b41e0e44a9569ff7','::1',NULL,0,'__ci_last_regenerate|i:1443627634;usr|a:4:{s:2:\"id\";s:1:\"1\";s:4:\"user\";s:5:\"admin\";s:4:\"pass\";s:32:\"a4f86f7bfc24194b276c22e0ef158197\";s:11:\"pretty_name\";s:11:\"Super Admin\";}','1443627894'),('b31b3ddab8922173c874af02408e54b73bc16698','::1',NULL,0,'__ci_last_regenerate|i:1443628028;usr|a:4:{s:2:\"id\";s:1:\"1\";s:4:\"user\";s:5:\"admin\";s:4:\"pass\";s:32:\"a4f86f7bfc24194b276c22e0ef158197\";s:11:\"pretty_name\";s:11:\"Super Admin\";}','1443628293'),('c385c2baadaa1c97dde4ece59a4f1a77bf9e6d3f','::1',NULL,0,'__ci_last_regenerate|i:1443620264;usr|a:4:{s:2:\"id\";s:1:\"1\";s:4:\"user\";s:5:\"admin\";s:4:\"pass\";s:32:\"a4f86f7bfc24194b276c22e0ef158197\";s:11:\"pretty_name\";s:11:\"Super Admin\";}','1443620264'),('c47da2963db97a155592a6d34e3ad57077b0e203','::1',NULL,0,'__ci_last_regenerate|i:1443400392;usr|N;','1443400690'),('c4ec1ca0b216deaae1a7712b51c148800bbb180c','::1',NULL,0,'__ci_last_regenerate|i:1443581132;usr|a:4:{s:2:\"id\";s:1:\"1\";s:4:\"user\";s:5:\"admin\";s:4:\"pass\";s:32:\"a4f86f7bfc24194b276c22e0ef158197\";s:11:\"pretty_name\";s:11:\"Super Admin\";}','1443581141'),('c7925637aa7281badfbea8ccf3f310a8e35687c9','::1',NULL,0,'__ci_last_regenerate|i:1443400793;usr|a:4:{s:2:\"id\";s:1:\"1\";s:4:\"user\";s:5:\"admin\";s:4:\"pass\";s:32:\"a4f86f7bfc24194b276c22e0ef158197\";s:11:\"pretty_name\";s:11:\"Super Admin\";}','1443400960'),('c9cf463d58a5a3358a8127ff3de21ba4d133e9ae','::1',NULL,0,'__ci_last_regenerate|i:1443586994;usr|a:4:{s:2:\"id\";s:1:\"1\";s:4:\"user\";s:5:\"admin\";s:4:\"pass\";s:32:\"a4f86f7bfc24194b276c22e0ef158197\";s:11:\"pretty_name\";s:11:\"Super Admin\";}','1443587143'),('ca2c5f81329e814db541ae9eecd7dc78cc77bf58','::1',NULL,0,'__ci_last_regenerate|i:1443626068;usr|a:4:{s:2:\"id\";s:1:\"1\";s:4:\"user\";s:5:\"admin\";s:4:\"pass\";s:32:\"a4f86f7bfc24194b276c22e0ef158197\";s:11:\"pretty_name\";s:11:\"Super Admin\";}','1443626269'),('d4a6561383a5af62a8b2cf12a2e4c98ea406bdf7','::1',NULL,0,'__ci_last_regenerate|i:1443621350;usr|a:4:{s:2:\"id\";s:1:\"1\";s:4:\"user\";s:5:\"admin\";s:4:\"pass\";s:32:\"a4f86f7bfc24194b276c22e0ef158197\";s:11:\"pretty_name\";s:11:\"Super Admin\";}','1443621350'),('dee813b52eeee35d4033b979647b1951f7500304','::1',NULL,0,'__ci_last_regenerate|i:1443394359;usr|a:4:{s:2:\"id\";s:1:\"1\";s:4:\"user\";s:5:\"admin\";s:4:\"pass\";s:32:\"a4f86f7bfc24194b276c22e0ef158197\";s:11:\"pretty_name\";s:11:\"Super Admin\";}','1443394657'),('e8076cccaa67e6065bbc1f28a9c27ae5bb4c37e9','::1',NULL,0,'__ci_last_regenerate|i:1443625763;usr|a:4:{s:2:\"id\";s:1:\"1\";s:4:\"user\";s:5:\"admin\";s:4:\"pass\";s:32:\"a4f86f7bfc24194b276c22e0ef158197\";s:11:\"pretty_name\";s:11:\"Super Admin\";}','1443625984'),('eb9e7cf25a9a6afd77f507eb0ca1b0e3211ae5e8','::1',NULL,0,'__ci_last_regenerate|i:1443620565;usr|a:4:{s:2:\"id\";s:1:\"1\";s:4:\"user\";s:5:\"admin\";s:4:\"pass\";s:32:\"a4f86f7bfc24194b276c22e0ef158197\";s:11:\"pretty_name\";s:11:\"Super Admin\";}','1443620565'),('ec4010d68af877e0209cff1920c3aa5ebca8e0c1','::1',NULL,0,'__ci_last_regenerate|i:1443384853;id|s:1:\"1\";user|s:5:\"admin\";pass|s:32:\"a4f86f7bfc24194b276c22e0ef158197\";pretty_name|s:11:\"Super Admin\";','1443385150'),('eda609770a019492e7e51da2a75f22a67dd95383','::1',NULL,0,'__ci_last_regenerate|i:1443394668;usr|a:4:{s:2:\"id\";s:1:\"1\";s:4:\"user\";s:5:\"admin\";s:4:\"pass\";s:32:\"a4f86f7bfc24194b276c22e0ef158197\";s:11:\"pretty_name\";s:11:\"Super Admin\";}','1443394783'),('ee3a047fc62d34d1e10cc352f8eb3af40d2d0fd7','::1',NULL,0,'__ci_last_regenerate|i:1443397614;','1443397652'),('f0b4da9d4628d38179822aff3a69dda269d3747d','::1',NULL,0,'__ci_last_regenerate|i:1443398205;usr|a:4:{s:2:\"id\";s:1:\"1\";s:4:\"user\";s:5:\"admin\";s:4:\"pass\";s:32:\"a4f86f7bfc24194b276c22e0ef158197\";s:11:\"pretty_name\";s:11:\"Super Admin\";}','1443398218'),('f30dfc0f7dd4a026c86692e9bfa8d0b2e658f496','::1',NULL,0,'__ci_last_regenerate|i:1443581497;','1443581497'),('f62e8247364caf8e90a18efe33b7fc99881f9416','::1',NULL,0,'__ci_last_regenerate|i:1443619278;usr|a:4:{s:2:\"id\";s:1:\"1\";s:4:\"user\";s:5:\"admin\";s:4:\"pass\";s:32:\"a4f86f7bfc24194b276c22e0ef158197\";s:11:\"pretty_name\";s:11:\"Super Admin\";}','1443619292');
/*!40000 ALTER TABLE `ci_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `episode`
--

DROP TABLE IF EXISTS `episode`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `episode` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(45) DEFAULT NULL,
  `author` varchar(45) DEFAULT NULL,
  `subtitle` varchar(45) DEFAULT NULL,
  `summary` varchar(45) DEFAULT NULL,
  `pubDate` varchar(45) DEFAULT NULL,
  `duration` varchar(45) DEFAULT NULL,
  `keywords` text,
  `fileName` varchar(45) DEFAULT NULL,
  `channel_id` int(11) NOT NULL,
  `active` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`id`,`channel_id`),
  KEY `fk_episode_channel_idx` (`channel_id`),
  CONSTRAINT `fk_episode_channel` FOREIGN KEY (`channel_id`) REFERENCES `channel` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `episode`
--

LOCK TABLES `episode` WRITE;
/*!40000 ALTER TABLE `episode` DISABLE KEYS */;
INSERT INTO `episode` VALUES (4,'CATARINILLA.m4a','me','some','cool','2015-08-27T18:15:13.000Z','2510.698667','no','audio20150930174853.m4a',1,1),(6,'CHOCOTE_01.m4a','author','chocote','dosmoe','2015-08-27T18:12:25.000Z','2518.442667','sddds','audio20150930175640.m4a',1,1);
/*!40000 ALTER TABLE `episode` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `login`
--

DROP TABLE IF EXISTS `login`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `login` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user` varchar(45) NOT NULL,
  `pass` varchar(255) NOT NULL,
  `pretty_name` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `login`
--

LOCK TABLES `login` WRITE;
/*!40000 ALTER TABLE `login` DISABLE KEYS */;
INSERT INTO `login` VALUES (1,'admin','a4f86f7bfc24194b276c22e0ef158197','Super Admin');
/*!40000 ALTER TABLE `login` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2015-09-30 12:12:01
