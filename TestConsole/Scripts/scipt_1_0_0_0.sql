CREATE DATABASE  IF NOT EXISTS `dbup` /*!40100 DEFAULT CHARACTER SET latin1 COLLATE latin1_general_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `dbup`;
-- MySQL dump 10.13  Distrib 8.0.26, for Win64 (x86_64)
--
-- Host: localhost    Database: kiddev
-- ------------------------------------------------------
-- Server version	8.0.26

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

SET FOREIGN_KEY_CHECKS=0;

--
-- Table structure for table `activemq_acks`
--

DROP TABLE IF EXISTS `activemq_acks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `activemq_acks` (
  `CONTAINER` varchar(250) NOT NULL,
  `SUB_DEST` varchar(250) DEFAULT NULL,
  `CLIENT_ID` varchar(250) NOT NULL,
  `SUB_NAME` varchar(250) NOT NULL,
  `SELECTOR` varchar(250) DEFAULT NULL,
  `LAST_ACKED_ID` bigint DEFAULT NULL,
  `PRIORITY` bigint NOT NULL DEFAULT '5',
  `XID` longblob,
  PRIMARY KEY (`CONTAINER`,`CLIENT_ID`,`SUB_NAME`,`PRIORITY`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `activemq_lock`
--

DROP TABLE IF EXISTS `activemq_lock`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `activemq_lock` (
  `ID` bigint NOT NULL,
  `TIME` bigint DEFAULT NULL,
  `BROKER_NAME` varchar(250) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `activemq_msgs`
--

DROP TABLE IF EXISTS `activemq_msgs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `activemq_msgs` (
  `ID` bigint NOT NULL,
  `CONTAINER` varchar(250) DEFAULT NULL,
  `MSGID_PROD` varchar(250) DEFAULT NULL,
  `MSGID_SEQ` bigint DEFAULT NULL,
  `EXPIRATION` bigint DEFAULT NULL,
  `MSG` longblob,
  `PRIORITY` bigint DEFAULT NULL,
  `XID` longblob,
  PRIMARY KEY (`ID`),
  KEY `ACTIVEMQ_MSGS_MIDX` (`MSGID_PROD`,`MSGID_SEQ`),
  KEY `ACTIVEMQ_MSGS_CIDX` (`CONTAINER`),
  KEY `ACTIVEMQ_MSGS_EIDX` (`EXPIRATION`),
  KEY `ACTIVEMQ_MSGS_PIDX` (`PRIORITY`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Temporary view structure for view `activities_start_end_dates`
--

DROP TABLE IF EXISTS `activities_start_end_dates`;
/*!50001 DROP VIEW IF EXISTS `activities_start_end_dates`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `activities_start_end_dates` AS SELECT 
 1 AS `id_task`,
 1 AS `start_date`,
 1 AS `end_date`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `adequacy_underlying_correlation`
--

DROP TABLE IF EXISTS `adequacy_underlying_correlation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `adequacy_underlying_correlation` (
  `underlying_1` varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `underlying_2` varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `correlation` double NOT NULL DEFAULT '0',
  PRIMARY KEY (`underlying_1`,`underlying_2`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `adequacy_underlying_variance`
--

DROP TABLE IF EXISTS `adequacy_underlying_variance`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `adequacy_underlying_variance` (
  `id_contract` int NOT NULL,
  `underlying` varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `time_horizon` int NOT NULL,
  `neutral_returns` double NOT NULL,
  `sigma` double NOT NULL,
  `variance` double NOT NULL,
  PRIMARY KEY (`id_contract`,`underlying`,`time_horizon`),
  CONSTRAINT `FK_adequacy_investment_option_var_id_contract` FOREIGN KEY (`id_contract`) REFERENCES `contracts` (`id_contract`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `adminop`
--

DROP TABLE IF EXISTS `adminop`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `adminop` (
  `id` int NOT NULL DEFAULT '0',
  `typename` varchar(200) DEFAULT NULL,
  `name` varchar(100) DEFAULT NULL,
  `description` varchar(1000) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `adminopparameters`
--

DROP TABLE IF EXISTS `adminopparameters`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `adminopparameters` (
  `idadminop` int NOT NULL DEFAULT '0',
  `name` varchar(100) NOT NULL DEFAULT '',
  `description` varchar(1000) DEFAULT NULL,
  `type` varchar(500) DEFAULT NULL,
  `defaultvalue` varchar(1000) DEFAULT NULL,
  PRIMARY KEY (`idadminop`,`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `agenda_mail`
--

DROP TABLE IF EXISTS `agenda_mail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `agenda_mail` (
  `id` int NOT NULL,
  `full_name` varchar(200) DEFAULT NULL,
  `email` varchar(200) NOT NULL,
  `market` varchar(200) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `alm_priip_file`
--

DROP TABLE IF EXISTS `alm_priip_file`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `alm_priip_file` (
  `id_ticker` varchar(100) NOT NULL,
  `reference_date` date NOT NULL,
  `file_type` int NOT NULL,
  `file_reference` varchar(512) NOT NULL,
  `upload_date` datetime NOT NULL,
  PRIMARY KEY (`id_ticker`,`reference_date`,`file_type`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `analysis`
--

DROP TABLE IF EXISTS `analysis`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `analysis` (
  `idanalysis` int NOT NULL,
  `name` varchar(200) DEFAULT NULL,
  `description` text,
  `extra_data` text,
  PRIMARY KEY (`idanalysis`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `apitokens`
--

DROP TABLE IF EXISTS `apitokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `apitokens` (
  `id` int NOT NULL AUTO_INCREMENT,
  `userid` varchar(128) NOT NULL,
  `token` text NOT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT '0',
  `expiry` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `userid` (`userid`),
  CONSTRAINT `fk_apitokens_userid` FOREIGN KEY (`userid`) REFERENCES `aspnetusers` (`Id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `article_order`
--

DROP TABLE IF EXISTS `article_order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `article_order` (
  `id_attr` int NOT NULL,
  `id_document` int NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `position` int NOT NULL,
  PRIMARY KEY (`id_attr`,`id_document`),
  KEY `id_document_article_document_idx` (`id_document`),
  CONSTRAINT `id_attr_attrinfo` FOREIGN KEY (`id_attr`) REFERENCES `attributeinfo` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `id_document_article_document` FOREIGN KEY (`id_document`) REFERENCES `document` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `aspnetusers`
--

DROP TABLE IF EXISTS `aspnetusers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `aspnetusers` (
  `Id` varchar(128) NOT NULL,
  `Email` varchar(256) DEFAULT NULL,
  `EmailConfirmed` tinyint(1) NOT NULL,
  `PasswordHash` longtext,
  `SecurityStamp` longtext,
  `PhoneNumber` longtext,
  `PhoneNumberConfirmed` tinyint(1) NOT NULL,
  `TwoFactorEnabled` tinyint(1) NOT NULL,
  `LockoutEndDateUtc` datetime DEFAULT NULL,
  `LockoutEnabled` tinyint(1) NOT NULL,
  `AccessFailedCount` int NOT NULL,
  `UserName` varchar(256) NOT NULL,
  `FirstName` varchar(256) DEFAULT NULL,
  `LastName` varchar(256) DEFAULT NULL,
  `RegistrationDate` datetime DEFAULT NULL,
  `LastLogin` datetime DEFAULT NULL,
  `PolicyFlags` varchar(256) DEFAULT NULL,
  PRIMARY KEY (`Id`),
  UNIQUE KEY `UserNameIndex` (`UserName`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `attribute_domain`
--

DROP TABLE IF EXISTS `attribute_domain`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `attribute_domain` (
  `id_attribute` int NOT NULL,
  `required` tinyint NOT NULL,
  `allowed_values` json DEFAULT NULL,
  PRIMARY KEY (`id_attribute`),
  CONSTRAINT `fk_atribute_id_domain` FOREIGN KEY (`id_attribute`) REFERENCES `attributeinfo` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `attribute_group`
--

DROP TABLE IF EXISTS `attribute_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `attribute_group` (
  `id_group` int NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_group`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `attribute_group_closure`
--

DROP TABLE IF EXISTS `attribute_group_closure`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `attribute_group_closure` (
  `id_ancestor` int NOT NULL,
  `id_descendant` int NOT NULL,
  `depth` int DEFAULT NULL,
  PRIMARY KEY (`id_ancestor`,`id_descendant`),
  KEY `parent_fk_idx` (`id_descendant`),
  CONSTRAINT `ancestor_fk` FOREIGN KEY (`id_ancestor`) REFERENCES `attribute_group` (`id_group`) ON UPDATE CASCADE,
  CONSTRAINT `parent_fk` FOREIGN KEY (`id_descendant`) REFERENCES `attribute_group` (`id_group`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `attribute_group_link`
--

DROP TABLE IF EXISTS `attribute_group_link`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `attribute_group_link` (
  `id_group` int NOT NULL,
  `id_attribute` int NOT NULL,
  PRIMARY KEY (`id_group`,`id_attribute`),
  KEY `attribute_link_fk_idx` (`id_attribute`),
  CONSTRAINT `attribute_link_fk` FOREIGN KEY (`id_attribute`) REFERENCES `attributeinfo` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `group_link_fk` FOREIGN KEY (`id_group`) REFERENCES `attribute_group` (`id_group`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `attribute_info_roles`
--

DROP TABLE IF EXISTS `attribute_info_roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `attribute_info_roles` (
  `id_attribute` int NOT NULL,
  `id_role` int NOT NULL,
  `required_for_validation` tinyint(1) DEFAULT NULL,
  `can_edit` tinyint(1) DEFAULT NULL,
  `can_view` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id_attribute`,`id_role`),
  KEY `fk_attribute_info_roles_role` (`id_role`),
  CONSTRAINT `fk_attribute_info_roles_attribute_info` FOREIGN KEY (`id_attribute`) REFERENCES `attributeinfo` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_attribute_info_roles_role` FOREIGN KEY (`id_role`) REFERENCES `rules` (`idrule`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `attributeinfo`
--

DROP TABLE IF EXISTS `attributeinfo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `attributeinfo` (
  `id` int NOT NULL,
  `attrname` varchar(128) NOT NULL,
  `attrrestrictions` int NOT NULL DEFAULT '0',
  `attrdesc` varchar(1024) NOT NULL,
  `attrtype` varchar(512) NOT NULL,
  `attrlangneutr` tinyint NOT NULL DEFAULT '0',
  `attrcategory` int NOT NULL DEFAULT '0',
  `attrscopes` int DEFAULT NULL,
  `attrposition` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `attributes_nameunique` (`attrname`,`attrcategory`,`attrscopes`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `attributevalue`
--

DROP TABLE IF EXISTS `attributevalue`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `attributevalue` (
  `idattr` int NOT NULL,
  `attrrestriction` int NOT NULL,
  `attrrestrictionid` int NOT NULL,
  `attrlang` varchar(20) NOT NULL,
  `attrvalue` longtext,
  PRIMARY KEY (`idattr`,`attrrestriction`,`attrrestrictionid`,`attrlang`),
  CONSTRAINT `fk_attributevalue_idattr` FOREIGN KEY (`idattr`) REFERENCES `attributeinfo` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `attributevaluehistory`
--

DROP TABLE IF EXISTS `attributevaluehistory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `attributevaluehistory` (
  `idattr` int NOT NULL,
  `attrrestriction` int NOT NULL,
  `attrrestrictionid` int NOT NULL,
  `attrlang` varchar(20) NOT NULL,
  `changetimestamp` datetime NOT NULL,
  `changeiduser` int DEFAULT NULL,
  `previousattrvalue` longtext,
  `change_log` text,
  PRIMARY KEY (`idattr`,`attrrestriction`,`attrrestrictionid`,`attrlang`,`changetimestamp`),
  CONSTRAINT `fk_attributevaluehistory_idattr` FOREIGN KEY (`idattr`) REFERENCES `attributeinfo` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `auth`
--

DROP TABLE IF EXISTS `auth`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth` (
  `idauth` int NOT NULL,
  `iduser` int DEFAULT NULL,
  `username` text,
  `password` text,
  `can_access` tinyint(1) DEFAULT '1',
  `fairmat_com_hash` text,
  `password_last_set` datetime DEFAULT NULL,
  PRIMARY KEY (`idauth`),
  KEY `fk_iduser_idx` (`iduser`),
  CONSTRAINT `fk_iduser` FOREIGN KEY (`iduser`) REFERENCES `users` (`iduser`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`dba`@`%`*/ /*!50003 TRIGGER `auth_AFTER_UPDATE` AFTER UPDATE ON `auth` FOR EACH ROW BEGIN
	IF NEW.`password` <> OLD.`password` THEN
		INSERT INTO `auth_history` (`idauth`, `timestamp`, `old_hash`) VALUES (NEW.`idauth`, NOW(), OLD.`password`);
    END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `auth_history`
--

DROP TABLE IF EXISTS `auth_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_history` (
  `idauth` int NOT NULL,
  `timestamp` datetime NOT NULL,
  `old_hash` text NOT NULL,
  PRIMARY KEY (`idauth`,`timestamp`),
  CONSTRAINT `fk_auth_history` FOREIGN KEY (`idauth`) REFERENCES `auth` (`idauth`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `base_functions`
--

DROP TABLE IF EXISTS `base_functions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `base_functions` (
  `description` varchar(250) NOT NULL,
  `nome` varchar(250) NOT NULL,
  PRIMARY KEY (`nome`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `base_services`
--

DROP TABLE IF EXISTS `base_services`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `base_services` (
  `id` int NOT NULL,
  `tag` varchar(250) DEFAULT NULL,
  `description` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

SET FOREIGN_KEY_CHECKS=1;