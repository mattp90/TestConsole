SET FOREIGN_KEY_CHECKS=0;

--
-- Table structure for table `markup_replacement`
--

DROP TABLE IF EXISTS `markup_replacement`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `markup_replacement` (
  `tag` varchar(45) NOT NULL,
  `replacement` mediumtext NOT NULL,
  `description` varchar(100) NOT NULL,
  `autoclose` tinyint NOT NULL,
  `file_definition` varchar(1024) DEFAULT NULL,
  PRIMARY KEY (`tag`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `menu`
--

DROP TABLE IF EXISTS `menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `menu` (
  `id` int NOT NULL,
  `id_parent` int DEFAULT '0',
  `href` text,
  `label` varchar(200) DEFAULT NULL,
  `description` text,
  `permission_key` varchar(150) DEFAULT NULL,
  `icon_ref` varchar(100) DEFAULT NULL,
  `area` varchar(50) DEFAULT NULL,
  `order_item` int DEFAULT '1',
  `enable_item` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `message_monitor`
--

DROP TABLE IF EXISTS `message_monitor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `message_monitor` (
  `idmessage_monitor` int NOT NULL,
  `id_message` varchar(255) NOT NULL,
  `data_start` datetime DEFAULT NULL,
  `data_end` datetime DEFAULT NULL,
  `status` varchar(255) NOT NULL,
  `type_analysis` varchar(255) DEFAULT NULL,
  `extra_data` text NOT NULL,
  `idcompany` int DEFAULT '-1',
  `id_contract` int DEFAULT '-1',
  `id_portfolio` int DEFAULT '-1',
  `reservation_deleted` tinyint(1) DEFAULT '-1',
  PRIMARY KEY (`idmessage_monitor`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `message_monitor_bi`
--

DROP TABLE IF EXISTS `message_monitor_bi`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `message_monitor_bi` (
  `idmessage_monitor_bi` int NOT NULL,
  `idmessage` varchar(255) NOT NULL,
  `request_data_start` datetime DEFAULT NULL,
  `request_data_stop` datetime DEFAULT NULL,
  `wait_valuation_start` datetime DEFAULT NULL,
  `wait_valuation_stop` datetime DEFAULT NULL,
  `delay_valuation` timestamp NULL DEFAULT NULL,
  `total_delay` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`idmessage_monitor_bi`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `message_result`
--

DROP TABLE IF EXISTS `message_result`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `message_result` (
  `id_message_result` int NOT NULL,
  `id_message` varchar(255) NOT NULL,
  `results` longblob,
  `intermediate_result` longblob,
  PRIMARY KEY (`id_message_result`),
  KEY `message_result_id_message` (`id_message`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `notification`
--

DROP TABLE IF EXISTS `notification`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `notification` (
  `id` int NOT NULL,
  `name` varchar(100) NOT NULL,
  `description` text,
  `map_name` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `notification_preferences`
--

DROP TABLE IF EXISTS `notification_preferences`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `notification_preferences` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_company` int NOT NULL,
  `file_dest_config` longblob,
  `restriction` int NOT NULL,
  PRIMARY KEY (`id`,`id_company`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `notification_user`
--

DROP TABLE IF EXISTS `notification_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `notification_user` (
  `id` int NOT NULL,
  `id_notification` int NOT NULL,
  `id_user` int NOT NULL,
  `status` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `openkid_preferences`
--

DROP TABLE IF EXISTS `openkid_preferences`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `openkid_preferences` (
  `id_company` int NOT NULL,
  `preferences` longblob,
  `restriction` int NOT NULL,
  PRIMARY KEY (`id_company`,`restriction`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `portafolio`
--

DROP TABLE IF EXISTS `portafolio`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `portafolio` (
  `id_portafolio` int NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` text,
  `private` tinyint(1) DEFAULT '1',
  `id_user` int DEFAULT NULL,
  `idcompany` int DEFAULT '-1',
  `createdate` datetime DEFAULT NULL,
  `modifydate` datetime DEFAULT NULL,
  `currency` varchar(3) DEFAULT NULL,
  `scr_idcompany` int DEFAULT '0',
  `scr_cash` double DEFAULT '0',
  PRIMARY KEY (`id_portafolio`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `portafolio_contract`
--

DROP TABLE IF EXISTS `portafolio_contract`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `portafolio_contract` (
  `id_portafolio_contract` int NOT NULL,
  `id_portafolio` int DEFAULT NULL,
  `id_contract` int DEFAULT NULL,
  `weight` double DEFAULT NULL,
  PRIMARY KEY (`id_portafolio_contract`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `preferences`
--

DROP TABLE IF EXISTS `preferences`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `preferences` (
  `id_preference` int NOT NULL,
  `id_user` int DEFAULT NULL,
  `version` varchar(255) DEFAULT NULL,
  `value_view` varchar(255) DEFAULT NULL,
  `sub_category` varchar(255) DEFAULT NULL,
  `setting_name` varchar(255) DEFAULT NULL,
  `category` varchar(255) DEFAULT NULL,
  `id_class` varchar(250) DEFAULT NULL,
  `name_view` varchar(255) DEFAULT NULL,
  `guid` varchar(255) DEFAULT NULL,
  `assembly_name` varchar(255) DEFAULT NULL,
  `type_value` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_preference`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `pricing_monitor`
--

DROP TABLE IF EXISTS `pricing_monitor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pricing_monitor` (
  `id_pricing` int NOT NULL,
  `valuation_date` date DEFAULT NULL,
  `id_contract` int DEFAULT NULL,
  `version_contract` int DEFAULT NULL,
  `mtm` double DEFAULT NULL,
  `std_err` double DEFAULT NULL,
  `dv01` double DEFAULT NULL,
  `theta` double DEFAULT NULL,
  `rho` double DEFAULT NULL,
  `extra` text,
  `id_portfolio` int DEFAULT NULL,
  `id_company` int DEFAULT '-1',
  `deleted` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id_pricing`),
  KEY `pricing_view_idx` (`valuation_date`,`id_contract`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Temporary view structure for view `pricing_view`
--

DROP TABLE IF EXISTS `pricing_view`;
/*!50001 DROP VIEW IF EXISTS `pricing_view`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `pricing_view` AS SELECT 
 1 AS `id_contract`,
 1 AS `id_company`,
 1 AS `mtm`,
 1 AS `valuation_date`,
 1 AS `total`,
 1 AS `deleted`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `pricing_view_aggregate`
--

DROP TABLE IF EXISTS `pricing_view_aggregate`;
/*!50001 DROP VIEW IF EXISTS `pricing_view_aggregate`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `pricing_view_aggregate` AS SELECT 
 1 AS `idcontract`,
 1 AS `id_company`,
 1 AS `maxdate`,
 1 AS `total`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `process_monitor`
--

DROP TABLE IF EXISTS `process_monitor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `process_monitor` (
  `id_message` varchar(255) NOT NULL,
  `type_analysis` varchar(200) DEFAULT NULL,
  `id_contract` int DEFAULT NULL,
  `id_company` int DEFAULT NULL,
  `state` varchar(100) DEFAULT NULL,
  `launcher_type` varchar(255) DEFAULT NULL,
  `counter` int NOT NULL,
  `id_portfolio` int DEFAULT '-1',
  `insert_time` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id_message`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `product_set`
--

DROP TABLE IF EXISTS `product_set`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_set` (
  `id` int NOT NULL AUTO_INCREMENT,
  `set_name` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `id_company` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_product_set_company` (`id_company`),
  CONSTRAINT `product_set_ibfk_1` FOREIGN KEY (`id_company`) REFERENCES `company` (`idcompany`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `product_testing`
--

DROP TABLE IF EXISTS `product_testing`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_testing` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_user` int NOT NULL,
  `name` varchar(280) NOT NULL,
  `creation_date` datetime NOT NULL,
  `settings` json NOT NULL,
  `scoring_profile` varchar(280) DEFAULT NULL,
  `scoring_products` text CHARACTER SET utf8 COLLATE utf8_general_ci,
  PRIMARY KEY (`id`),
  KEY `id_user_fk` (`id_user`),
  CONSTRAINT `id_user_fk` FOREIGN KEY (`id_user`) REFERENCES `users` (`iduser`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `product_testing_model_data`
--

DROP TABLE IF EXISTS `product_testing_model_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_testing_model_data` (
  `id_template` int NOT NULL,
  `component_name` varchar(250) NOT NULL,
  `name` varchar(250) NOT NULL,
  `data` mediumblob NOT NULL,
  PRIMARY KEY (`id_template`,`component_name`,`name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `product_testing_segregated_fund_data`
--

DROP TABLE IF EXISTS `product_testing_segregated_fund_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_testing_segregated_fund_data` (
  `ticker` varchar(255) NOT NULL,
  `reference_date` date NOT NULL,
  `model` mediumblob NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `product_testing_snapshot`
--

DROP TABLE IF EXISTS `product_testing_snapshot`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_testing_snapshot` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_product_testing` int NOT NULL,
  `name` varchar(280) NOT NULL,
  `creation_date` datetime NOT NULL,
  `snapshot_data` json NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id_product_testing_fk_idx` (`id_product_testing`),
  CONSTRAINT `id_product_testing_fk` FOREIGN KEY (`id_product_testing`) REFERENCES `product_testing` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `product_testing_snapshot_strategy`
--

DROP TABLE IF EXISTS `product_testing_snapshot_strategy`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_testing_snapshot_strategy` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_snapshot` int NOT NULL,
  `id_template` int NOT NULL,
  `name` varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `last_template_update` datetime DEFAULT NULL,
  `data` longblob NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `product_testing_snapshot_strategy_id_snapshot_fk` (`id_snapshot`) USING BTREE,
  KEY `product_testing_snapshot_strategy_id_model_data_fk` (`id_template`) USING BTREE,
  CONSTRAINT `product_testing_snapshot_strategy_id_model_data_fk` FOREIGN KEY (`id_template`) REFERENCES `product_testing_model_data` (`id_template`),
  CONSTRAINT `product_testing_snapshot_strategy_id_snapshot_fk` FOREIGN KEY (`id_snapshot`) REFERENCES `product_testing_snapshot` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `product_testing_underlying_data`
--

DROP TABLE IF EXISTS `product_testing_underlying_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_testing_underlying_data` (
  `ticker` varchar(255) NOT NULL,
  `reference_date` date NOT NULL,
  `depth` int NOT NULL,
  `sample_frequency` int NOT NULL,
  `m0` double NOT NULL,
  `m1` double NOT NULL,
  `m2` double NOT NULL,
  `m3` double NOT NULL,
  `m4` double NOT NULL,
  `sigmaw1` double NOT NULL,
  `sigmaw2` double NOT NULL,
  `annualized_return` double NOT NULL,
  `annualized_volatility` double NOT NULL,
  `ter` double NOT NULL,
  PRIMARY KEY (`ticker`,`reference_date`,`depth`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `productprices`
--

DROP TABLE IF EXISTS `productprices`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `productprices` (
  `isin` varchar(50) NOT NULL,
  `marketdate` date NOT NULL,
  `bid` double DEFAULT NULL,
  `ask` double DEFAULT NULL,
  `mid` double DEFAULT NULL,
  PRIMARY KEY (`isin`,`marketdate`),
  KEY `productprices_sortbymarketdate_index` (`marketdate`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `profilehistory`
--

DROP TABLE IF EXISTS `profilehistory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `profilehistory` (
  `id_contract` int NOT NULL,
  `changetimestamp` datetime NOT NULL,
  `changeiduser` int DEFAULT NULL,
  `previous_id_profile` int DEFAULT NULL,
  `change_log` text,
  PRIMARY KEY (`id_contract`,`changetimestamp`),
  KEY `fk_profilehistory_id_profile` (`previous_id_profile`),
  CONSTRAINT `fk_profilehistory_id_contract` FOREIGN KEY (`id_contract`) REFERENCES `contracts` (`id_contract`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_profilehistory_id_profile` FOREIGN KEY (`previous_id_profile`) REFERENCES `profiles` (`id_profile`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `profiles`
--

DROP TABLE IF EXISTS `profiles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `profiles` (
  `id_profile` int NOT NULL AUTO_INCREMENT,
  `name` varchar(1024) NOT NULL,
  PRIMARY KEY (`id_profile`),
  UNIQUE KEY `name_UNIQUE` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `provider_requests`
--

DROP TABLE IF EXISTS `provider_requests`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `provider_requests` (
  `IdMarket` varchar(20) NOT NULL,
  `IdTicker` varchar(100) NOT NULL,
  `marketdate` date NOT NULL,
  `Field` varchar(100) NOT NULL,
  `MarketDataType` varchar(100) NOT NULL,
  `Retrieved` tinyint(1) DEFAULT NULL,
  `status` varchar(100) DEFAULT NULL,
  `message` text,
  PRIMARY KEY (`IdMarket`,`IdTicker`,`marketdate`,`Field`,`MarketDataType`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

SET FOREIGN_KEY_CHECKS=1;