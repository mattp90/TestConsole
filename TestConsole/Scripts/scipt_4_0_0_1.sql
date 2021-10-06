SET FOREIGN_KEY_CHECKS=0;

--
-- Table structure for table `status_description`
--

DROP TABLE IF EXISTS `status_description`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `status_description` (
  `idDescription` int NOT NULL,
  `userDescription` text,
  `adminDescription` text,
  `insertDate` timestamp NULL DEFAULT NULL,
  `stepCode` int DEFAULT NULL,
  PRIMARY KEY (`idDescription`),
  KEY `fk_status_description_step` (`stepCode`),
  CONSTRAINT `fk_status_description_step` FOREIGN KEY (`stepCode`) REFERENCES `step` (`idStep`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `status_running`
--

DROP TABLE IF EXISTS `status_running`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `status_running` (
  `idStatus` int NOT NULL,
  `statusValue` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`idStatus`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `step`
--

DROP TABLE IF EXISTS `step`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `step` (
  `idStep` int NOT NULL,
  `task_code` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `idStatus` int DEFAULT NULL,
  `activityStart` timestamp NULL DEFAULT NULL,
  `activityLast` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`idStep`),
  KEY `task_code_fk_idx` (`task_code`),
  KEY `step_status_fk_idx` (`idStatus`),
  CONSTRAINT `step_task_fk` FOREIGN KEY (`task_code`) REFERENCES `task` (`idTask`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sub_companies`
--

DROP TABLE IF EXISTS `sub_companies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sub_companies` (
  `id_parent` int NOT NULL,
  `id_sub` int NOT NULL,
  PRIMARY KEY (`id_parent`,`id_sub`),
  KEY `sub_companies_id_sub` (`id_sub`),
  CONSTRAINT `sub_companies_id_parent` FOREIGN KEY (`id_parent`) REFERENCES `company` (`idcompany`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `sub_companies_id_sub` FOREIGN KEY (`id_sub`) REFERENCES `company` (`idcompany`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `support_message_type`
--

DROP TABLE IF EXISTS `support_message_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `support_message_type` (
  `idsup_msg_type` int NOT NULL,
  `name` text,
  `description` text,
  PRIMARY KEY (`idsup_msg_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `t_estimate`
--

DROP TABLE IF EXISTS `t_estimate`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `t_estimate` (
  `IdEstimate` int NOT NULL AUTO_INCREMENT,
  `ElaborateDate` datetime NOT NULL,
  `SSR` double NOT NULL DEFAULT '0',
  `Ticker` varchar(100) DEFAULT NULL,
  `Link` varchar(200) DEFAULT NULL,
  `objects` text,
  PRIMARY KEY (`IdEstimate`),
  KEY `Ticker` (`Ticker`),
  CONSTRAINT `t_estimate_fk` FOREIGN KEY (`Ticker`) REFERENCES `t_type_ticker` (`IdTicker`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 PACK_KEYS=0 ROW_FORMAT=COMPACT;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `t_parameter`
--

DROP TABLE IF EXISTS `t_parameter`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `t_parameter` (
  `IdParameter` varchar(20) NOT NULL DEFAULT '''''',
  `Description` varchar(100) DEFAULT '',
  PRIMARY KEY (`IdParameter`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 PACK_KEYS=0 ROW_FORMAT=COMPACT;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `t_type_instrument`
--

DROP TABLE IF EXISTS `t_type_instrument`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `t_type_instrument` (
  `IdInstrument` varchar(100) NOT NULL DEFAULT '',
  `Description` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`IdInstrument`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 PACK_KEYS=0 ROW_FORMAT=COMPACT;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `t_type_market`
--

DROP TABLE IF EXISTS `t_type_market`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `t_type_market` (
  `IdMarket` varchar(20) NOT NULL DEFAULT '''''',
  `Description` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`IdMarket`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 PACK_KEYS=0 ROW_FORMAT=COMPACT;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `t_type_model`
--

DROP TABLE IF EXISTS `t_type_model`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `t_type_model` (
  `IdModel` varchar(100) NOT NULL DEFAULT '',
  `Description` varchar(100) DEFAULT NULL,
  `NumberOfParameter` int NOT NULL DEFAULT '0',
  `ClassName` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`IdModel`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 PACK_KEYS=0 ROW_FORMAT=COMPACT;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `t_type_ticker`
--

DROP TABLE IF EXISTS `t_type_ticker`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `t_type_ticker` (
  `IdTicker` varchar(100) NOT NULL,
  `Description` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`IdTicker`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `t_user`
--

DROP TABLE IF EXISTS `t_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `t_user` (
  `Login` varchar(20) NOT NULL DEFAULT '''''',
  `Password` varchar(20) NOT NULL DEFAULT '''''',
  `Description` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`Login`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 PACK_KEYS=0 ROW_FORMAT=COMPACT;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `t_zero_rate`
--

DROP TABLE IF EXISTS `t_zero_rate`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `t_zero_rate` (
  `IdZeroRate` int NOT NULL AUTO_INCREMENT,
  `EstimateDate` datetime NOT NULL,
  `TradingHour` varchar(100) NOT NULL DEFAULT '''''',
  `Length` int NOT NULL DEFAULT '1',
  `Type` varchar(100) NOT NULL DEFAULT 'Normal',
  PRIMARY KEY (`IdZeroRate`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 PACK_KEYS=0 ROW_FORMAT=COMPACT;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tags`
--

DROP TABLE IF EXISTS `tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tags` (
  `id_tag` int NOT NULL AUTO_INCREMENT,
  `value` varchar(100) NOT NULL,
  `id_company_owner` int DEFAULT NULL,
  `color` varchar(45) NOT NULL,
  `created` datetime NOT NULL,
  PRIMARY KEY (`id_tag`),
  UNIQUE KEY `tags_index` (`id_company_owner`,`value`),
  KEY `fk_owner_company_idx` (`id_company_owner`),
  CONSTRAINT `fk_owner_company` FOREIGN KEY (`id_company_owner`) REFERENCES `company` (`idcompany`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `task`
--

DROP TABLE IF EXISTS `task`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `task` (
  `idTask` varchar(255) NOT NULL,
  `activity` varchar(255) DEFAULT NULL,
  `category` varchar(255) DEFAULT NULL,
  `idCompany` int DEFAULT NULL,
  `task_status` int DEFAULT NULL,
  `entity_type` int NOT NULL DEFAULT '0',
  `entity_identifier` varchar(255) NOT NULL,
  PRIMARY KEY (`idTask`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `task_attachment`
--

DROP TABLE IF EXISTS `task_attachment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `task_attachment` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_task` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `name` varchar(45) NOT NULL,
  `file` longblob NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_task_attachment_idx` (`id_task`),
  CONSTRAINT `fk_task_attachment` FOREIGN KEY (`id_task`) REFERENCES `task` (`idTask`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `template_analysis`
--

DROP TABLE IF EXISTS `template_analysis`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `template_analysis` (
  `idtemplate_analysis` int NOT NULL AUTO_INCREMENT,
  `idtemplate` int DEFAULT NULL,
  `analysis_name` mediumtext,
  `analysis_class` mediumtext,
  PRIMARY KEY (`idtemplate_analysis`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `template_categories`
--

DROP TABLE IF EXISTS `template_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `template_categories` (
  `idtemplate_categories` int NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `id_parent` int DEFAULT NULL,
  `private_category` tinyint(1) DEFAULT '0',
  `id_company` int DEFAULT NULL,
  PRIMARY KEY (`idtemplate_categories`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `template_status`
--

DROP TABLE IF EXISTS `template_status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `template_status` (
  `id_template_status` int NOT NULL,
  `name` varchar(200) NOT NULL,
  `assembly_name` varchar(255) NOT NULL,
  `class_full_name` varchar(255) NOT NULL,
  PRIMARY KEY (`id_template_status`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `template_tags`
--

DROP TABLE IF EXISTS `template_tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `template_tags` (
  `id_tag` int NOT NULL,
  `id_template` int NOT NULL,
  PRIMARY KEY (`id_tag`,`id_template`),
  KEY `fk_template_tags_idx` (`id_template`),
  CONSTRAINT `fk_template_tags` FOREIGN KEY (`id_template`) REFERENCES `templates` (`idtemplate`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `templates`
--

DROP TABLE IF EXISTS `templates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `templates` (
  `idtemplate` int NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` text,
  `category` int DEFAULT '-1',
  `deleted` tinyint(1) DEFAULT '0',
  `stream` longblob NOT NULL,
  `original_file_name` varchar(255) DEFAULT NULL,
  `idowner` int DEFAULT NULL,
  `idcompany` int DEFAULT '-1',
  `createdate` datetime DEFAULT NULL,
  `id_template_status` int DEFAULT '0',
  `DATE_INSERT` datetime DEFAULT NULL,
  `cost` int DEFAULT '0',
  PRIMARY KEY (`idtemplate`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ticker`
--

DROP TABLE IF EXISTS `ticker`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ticker` (
  `id` int NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `category` varchar(255) DEFAULT NULL,
  `visible` varchar(1) DEFAULT NULL,
  `currency` varchar(250) DEFAULT NULL,
  `description` varchar(1000) DEFAULT NULL,
  `idcompany` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `trace_session`
--

DROP TABLE IF EXISTS `trace_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `trace_session` (
  `idtrace_session` int NOT NULL,
  `sessionID` varchar(100) NOT NULL,
  `start_date` datetime NOT NULL,
  `end_date` datetime DEFAULT NULL,
  `enable` tinyint(1) DEFAULT '0',
  `time_out` int DEFAULT NULL,
  PRIMARY KEY (`idtrace_session`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `url_tcp_batch`
--

DROP TABLE IF EXISTS `url_tcp_batch`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `url_tcp_batch` (
  `id` int NOT NULL,
  `name` varchar(55) NOT NULL,
  `host` varchar(50) NOT NULL,
  `port` int DEFAULT '8080',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `url_ws_batch`
--

DROP TABLE IF EXISTS `url_ws_batch`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `url_ws_batch` (
  `id` int NOT NULL,
  `name` varchar(55) NOT NULL,
  `url` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `user_prefix`
--

DROP TABLE IF EXISTS `user_prefix`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_prefix` (
  `iduser_prefix` int NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`iduser_prefix`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `iduser` int NOT NULL,
  `idrule` int DEFAULT NULL,
  `name` text,
  `surname` text,
  `prefix` text,
  `address` text,
  `idcity` int DEFAULT NULL,
  `cap` text,
  `title` text,
  `phone` text,
  `mobile_phone` text,
  `fax` text,
  `email` text,
  `idcompany` int DEFAULT '-1',
  `membership_date` date DEFAULT NULL,
  PRIMARY KEY (`iduser`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `valuation_cost`
--

DROP TABLE IF EXISTS `valuation_cost`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `valuation_cost` (
  `class_name` varchar(200) NOT NULL,
  `name` varchar(200) DEFAULT NULL,
  `description` varchar(200) DEFAULT NULL,
  `extended_description` varchar(1500) DEFAULT NULL,
  `cost` int NOT NULL DEFAULT '1',
  `image` varchar(200) DEFAULT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT '1',
  `preferences` varchar(1500) DEFAULT NULL,
  PRIMARY KEY (`class_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

SET FOREIGN_KEY_CHECKS=1;
