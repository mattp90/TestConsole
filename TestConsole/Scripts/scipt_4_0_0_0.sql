SET FOREIGN_KEY_CHECKS=0;

--
-- Table structure for table `query_fast`
--

DROP TABLE IF EXISTS `query_fast`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `query_fast` (
  `idquery_fast` int NOT NULL,
  `name` varchar(200) DEFAULT NULL,
  `query` text,
  PRIMARY KEY (`idquery_fast`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `r01_parameter_typemodel`
--

DROP TABLE IF EXISTS `r01_parameter_typemodel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `r01_parameter_typemodel` (
  `fk_IdParameter` varchar(20) NOT NULL DEFAULT '''''',
  `fk_IdModel` varchar(100) NOT NULL DEFAULT '',
  PRIMARY KEY (`fk_IdParameter`,`fk_IdModel`),
  KEY `r01_parameter_typemodel_fk1` (`fk_IdModel`),
  CONSTRAINT `r01_parameter_typemodel_fk` FOREIGN KEY (`fk_IdParameter`) REFERENCES `t_parameter` (`IdParameter`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `r01_parameter_typemodel_fk1` FOREIGN KEY (`fk_IdModel`) REFERENCES `t_type_model` (`IdModel`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 PACK_KEYS=0 ROW_FORMAT=COMPACT;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `r02_estimate_typemodel`
--

DROP TABLE IF EXISTS `r02_estimate_typemodel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `r02_estimate_typemodel` (
  `fk_IdEstimate` int NOT NULL,
  `fk_IdModel` varchar(100) NOT NULL DEFAULT '',
  PRIMARY KEY (`fk_IdEstimate`,`fk_IdModel`),
  UNIQUE KEY `fk_IdEstimate` (`fk_IdEstimate`),
  KEY `r02_estimate_typemodel_fk1` (`fk_IdModel`),
  CONSTRAINT `r02_estimate_typemodel_fk` FOREIGN KEY (`fk_IdEstimate`) REFERENCES `t_estimate` (`IdEstimate`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `r02_estimate_typemodel_fk1` FOREIGN KEY (`fk_IdModel`) REFERENCES `t_type_model` (`IdModel`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 PACK_KEYS=0 ROW_FORMAT=COMPACT;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `r03_estimate_parameter`
--

DROP TABLE IF EXISTS `r03_estimate_parameter`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `r03_estimate_parameter` (
  `fk_IdEstimate` int NOT NULL,
  `fk_IdParameter` varchar(20) NOT NULL DEFAULT '',
  `EstimateSettings` varchar(100) NOT NULL DEFAULT 'STANDARD',
  `ParameterValue` double DEFAULT '0',
  PRIMARY KEY (`fk_IdEstimate`,`fk_IdParameter`,`EstimateSettings`),
  KEY `r03_estimate_ parameter_fk1` (`fk_IdParameter`),
  CONSTRAINT `r03_estimate_parameter_fk` FOREIGN KEY (`fk_IdEstimate`) REFERENCES `t_estimate` (`IdEstimate`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `r03_estimate_parameter_fk1` FOREIGN KEY (`fk_IdParameter`) REFERENCES `t_parameter` (`IdParameter`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 PACK_KEYS=0 ROW_FORMAT=COMPACT;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `r04_estimate_instrument`
--

DROP TABLE IF EXISTS `r04_estimate_instrument`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `r04_estimate_instrument` (
  `fk_IdEstimate` int NOT NULL,
  `fk_IdInstrument` varchar(100) NOT NULL DEFAULT '',
  PRIMARY KEY (`fk_IdEstimate`,`fk_IdInstrument`),
  UNIQUE KEY `fk_IdEstimate` (`fk_IdEstimate`),
  KEY `fk_IdInstrument_fk1` (`fk_IdInstrument`),
  CONSTRAINT `r04_estimate_instrument_fk` FOREIGN KEY (`fk_IdEstimate`) REFERENCES `t_estimate` (`IdEstimate`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `r04_estimate_instrument_fk1` FOREIGN KEY (`fk_IdInstrument`) REFERENCES `t_type_instrument` (`IdInstrument`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 PACK_KEYS=0 ROW_FORMAT=COMPACT;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `r05_zerorate_typemarket`
--

DROP TABLE IF EXISTS `r05_zerorate_typemarket`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `r05_zerorate_typemarket` (
  `fk_IdZeroRate` int NOT NULL,
  `fk_IdMarket` varchar(20) NOT NULL DEFAULT '''''',
  PRIMARY KEY (`fk_IdZeroRate`,`fk_IdMarket`),
  UNIQUE KEY `fk_IdZeroRate` (`fk_IdZeroRate`),
  KEY `r05_zerorate_typemarket_fk1` (`fk_IdMarket`),
  CONSTRAINT `r05_zerorate_typemarket_fk` FOREIGN KEY (`fk_IdZeroRate`) REFERENCES `t_zero_rate` (`IdZeroRate`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `r05_zerorate_typemarket_fk1` FOREIGN KEY (`fk_IdMarket`) REFERENCES `t_type_market` (`IdMarket`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 PACK_KEYS=0 ROW_FORMAT=COMPACT;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `r06_typemarket_user`
--

DROP TABLE IF EXISTS `r06_typemarket_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `r06_typemarket_user` (
  `fk_IdMarket` varchar(20) NOT NULL DEFAULT '''''',
  `fk_Login` varchar(20) NOT NULL DEFAULT '''''',
  PRIMARY KEY (`fk_IdMarket`,`fk_Login`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 PACK_KEYS=0 ROW_FORMAT=COMPACT;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `r07_estimate_zerorate`
--

DROP TABLE IF EXISTS `r07_estimate_zerorate`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `r07_estimate_zerorate` (
  `fk_IdEstimate` int NOT NULL,
  `fk_IdZeroRate` int NOT NULL,
  PRIMARY KEY (`fk_IdEstimate`),
  KEY `fk_IdZeroRate` (`fk_IdZeroRate`),
  CONSTRAINT `r07_estimate_zerorate_fk` FOREIGN KEY (`fk_IdEstimate`) REFERENCES `t_estimate` (`IdEstimate`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `r07_estimate_zerorate_fk1` FOREIGN KEY (`fk_IdZeroRate`) REFERENCES `t_zero_rate` (`IdZeroRate`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 PACK_KEYS=0 ROW_FORMAT=COMPACT;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `r08_zerorate_sample`
--

DROP TABLE IF EXISTS `r08_zerorate_sample`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `r08_zerorate_sample` (
  `IdZeroRateSample` int NOT NULL AUTO_INCREMENT,
  `fk_IdZeroRate` int NOT NULL,
  `DatesN` double NOT NULL DEFAULT '0',
  `ValuesN` double NOT NULL DEFAULT '0',
  PRIMARY KEY (`IdZeroRateSample`),
  KEY `r08_zerorate_sample_fk` (`fk_IdZeroRate`),
  CONSTRAINT `r08_zerorate_sample_fk` FOREIGN KEY (`fk_IdZeroRate`) REFERENCES `t_zero_rate` (`IdZeroRate`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 PACK_KEYS=0 ROW_FORMAT=COMPACT;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `r09_marketsnapshot`
--

DROP TABLE IF EXISTS `r09_marketsnapshot`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `r09_marketsnapshot` (
  `fk_IdMarket` varchar(20) NOT NULL,
  `fk_IdTicker` varchar(100) NOT NULL,
  `MarketDate` datetime NOT NULL,
  `Field` varchar(100) NOT NULL,
  `MarketDataType` varchar(100) NOT NULL,
  `Tag` varchar(100) DEFAULT NULL,
  `MarketData` mediumblob,
  `DATASOURCE` varchar(100) DEFAULT 'Not Available',
  `requesttimestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `id_company` int NOT NULL DEFAULT '-1',
  PRIMARY KEY (`fk_IdMarket`,`fk_IdTicker`,`MarketDate`,`Field`,`MarketDataType`,`id_company`),
  KEY `fk_IdMarket` (`fk_IdMarket`),
  KEY `fk_IdTicker` (`fk_IdTicker`),
  KEY `idx_r09_marketsnapshot_fk_IdTicker_MarketDate` (`fk_IdTicker`,`MarketDate`),
  KEY `idx_r09_marketsnapshot_MarketDataType_fk_IdTicker_MarketDate` (`MarketDataType`,`fk_IdTicker`,`MarketDate`),
  KEY `idx_r09_marketsnapshot_Market_Ticker_MarketDate_MarketDataType` (`fk_IdMarket`,`fk_IdTicker`,`MarketDate`,`MarketDataType`),
  KEY `r09_sortbydate_index` (`MarketDate`),
  KEY `idx_r09_marketsnapshot_MarketDate_MarketDataType` (`MarketDataType`,`MarketDate`),
  KEY `idx_r09_tickermarketdatatype` (`fk_IdTicker`,`MarketDataType`),
  CONSTRAINT `r09_marketsnapshot_fk` FOREIGN KEY (`fk_IdMarket`) REFERENCES `t_type_market` (`IdMarket`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `r09_marketsnapshot_fk1` FOREIGN KEY (`fk_IdTicker`) REFERENCES `t_type_ticker` (`IdTicker`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`dba`@`%`*/ /*!50003 TRIGGER `r09_inc_counter` AFTER INSERT ON `r09_marketsnapshot` FOR EACH ROW begin
  DECLARE table_counter int;
    declare id_table int;
    
    select 1 into @id_table;

  SELECT counter
  INTO @table_counter
  FROM big_table_counters
  where id = @id_table;
        
  update big_table_counters set counter = @table_counter + 1 where id = @id_table;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`dba`@`%`*/ /*!50003 TRIGGER `r09_dec_counter` AFTER DELETE ON `r09_marketsnapshot` FOR EACH ROW begin
  DECLARE table_counter int;
    declare id_table int;
    
    select 1 into @id_table;

  SELECT counter
  INTO @table_counter
  FROM big_table_counters
  where id = @id_table;
        
  update big_table_counters set counter = @table_counter - 1 where id = @id_table;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `r10_staticmarketdatainfo`
--

DROP TABLE IF EXISTS `r10_staticmarketdatainfo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `r10_staticmarketdatainfo` (
  `idticker` varchar(100) NOT NULL DEFAULT '',
  `attribute` varchar(100) NOT NULL DEFAULT '',
  `infovalue` longblob,
  `requestdate` date DEFAULT NULL,
  `requestvalidity` int DEFAULT NULL,
  `id_company` int NOT NULL DEFAULT '-1',
  PRIMARY KEY (`idticker`,`attribute`,`id_company`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Temporary view structure for view `report_last`
--

DROP TABLE IF EXISTS `report_last`;
/*!50001 DROP VIEW IF EXISTS `report_last`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `report_last` AS SELECT 
 1 AS `idcontract`,
 1 AS `idcompany`,
 1 AS `reportlanguage`,
 1 AS `reporttype`,
 1 AS `id_document_type`,
 1 AS `valuation_date`,
 1 AS `valid_from`,
 1 AS `publish_timestamp`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `report_last_key_group`
--

DROP TABLE IF EXISTS `report_last_key_group`;
/*!50001 DROP VIEW IF EXISTS `report_last_key_group`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `report_last_key_group` AS SELECT 
 1 AS `idcontract`,
 1 AS `idcompany`,
 1 AS `reporttype`,
 1 AS `id_document_type`,
 1 AS `max_valid_from`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `result_last_key_group`
--

DROP TABLE IF EXISTS `result_last_key_group`;
/*!50001 DROP VIEW IF EXISTS `result_last_key_group`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `result_last_key_group` AS SELECT 
 1 AS `idcontract`,
 1 AS `idcompany`,
 1 AS `document_type`,
 1 AS `id_document_type`,
 1 AS `max_valuation_date`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `risk_monitor`
--

DROP TABLE IF EXISTS `risk_monitor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `risk_monitor` (
  `id_risk` int NOT NULL,
  `valuation_date` datetime DEFAULT NULL,
  `volatility` int DEFAULT NULL,
  `delta_vol` int DEFAULT NULL,
  `id_contratto` int DEFAULT NULL,
  `version_contract` int DEFAULT NULL,
  `id_portfolio` int DEFAULT NULL,
  `declared_risk` int DEFAULT NULL,
  `declared_style` int DEFAULT NULL,
  `calculated_risk` int DEFAULT NULL,
  `calculated_style` int DEFAULT NULL,
  `id_company` int DEFAULT '-1',
  PRIMARY KEY (`id_risk`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `rules`
--

DROP TABLE IF EXISTS `rules`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `rules` (
  `idrule` int NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`idrule`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `saved_search`
--

DROP TABLE IF EXISTS `saved_search`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `saved_search` (
  `id` int NOT NULL AUTO_INCREMENT,
  `filter_id` varchar(128) NOT NULL,
  `search_name` varchar(128) NOT NULL,
  `id_user` int NOT NULL,
  `id_company` int NOT NULL,
  `is_shared` tinyint DEFAULT '0',
  `creation_timestamp` datetime NOT NULL,
  `search_value` text NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `lk_saved_search` (`filter_id`,`search_name`,`id_user`,`id_company`),
  KEY `fk_saved_search_user` (`id_user`),
  KEY `fk_saved_search_company` (`id_company`),
  CONSTRAINT `saved_search_ibfk_1` FOREIGN KEY (`id_user`) REFERENCES `users` (`iduser`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `saved_search_ibfk_2` FOREIGN KEY (`id_company`) REFERENCES `company` (`idcompany`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `scalar_outlayers`
--

DROP TABLE IF EXISTS `scalar_outlayers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `scalar_outlayers` (
  `id` int NOT NULL,
  `ticker` varchar(100) NOT NULL,
  `field` varchar(100) DEFAULT NULL,
  `market` varchar(20) DEFAULT NULL,
  `outlayer_date` date DEFAULT NULL,
  `outlayer_value` double DEFAULT NULL,
  `valuation_date` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `scheduler`
--

DROP TABLE IF EXISTS `scheduler`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `scheduler` (
  `idscheduler` int NOT NULL,
  `idportfolio` int NOT NULL,
  `iduser` int NOT NULL,
  `insert_date` datetime DEFAULT NULL,
  `sunday` tinyint(1) DEFAULT NULL,
  `monday` tinyint(1) DEFAULT NULL,
  `tuesday` tinyint(1) DEFAULT NULL,
  `wednesday` tinyint(1) DEFAULT NULL,
  `thursday` tinyint(1) DEFAULT NULL,
  `friday` tinyint(1) DEFAULT NULL,
  `saturday` tinyint(1) DEFAULT NULL,
  `start_date` datetime DEFAULT NULL,
  `end_date` datetime DEFAULT NULL,
  `name` varchar(200) DEFAULT NULL,
  `analysis_type` varchar(200) DEFAULT NULL,
  `order_index` int DEFAULT NULL,
  PRIMARY KEY (`idscheduler`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `services`
--

DROP TABLE IF EXISTS `services`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `services` (
  `id` int NOT NULL,
  `tag` varchar(100) NOT NULL,
  `description` text,
  `expire_date` datetime DEFAULT NULL,
  `idwork_service` int DEFAULT NULL,
  `id_user` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `similarproducts`
--

DROP TABLE IF EXISTS `similarproducts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `similarproducts` (
  `id` int NOT NULL,
  `idcontract` int NOT NULL,
  `idsimilarcontract` int NOT NULL,
  `distance` double DEFAULT NULL,
  `similarproductisin` varchar(50) DEFAULT NULL,
  `similarproductname` varchar(255) DEFAULT NULL,
  `similarproductpath` varchar(1000) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `staticmarketdatainfo_history`
--

DROP TABLE IF EXISTS `staticmarketdatainfo_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `staticmarketdatainfo_history` (
  `idticker` varchar(100) NOT NULL,
  `attribute` varchar(100) NOT NULL,
  `timestamp` datetime NOT NULL,
  `old_value` longblob,
  `new_value` longblob,
  `userid` int DEFAULT NULL,
  `log` text,
  `id_company` int NOT NULL DEFAULT '-1',
  PRIMARY KEY (`idticker`,`attribute`,`id_company`,`timestamp`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `staticmarketinfo`
--

DROP TABLE IF EXISTS `staticmarketinfo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `staticmarketinfo` (
  `attribute` varchar(100) NOT NULL,
  `description` varchar(500) DEFAULT NULL,
  `infotype` int DEFAULT NULL,
  `is_custom` int DEFAULT NULL,
  `is_option_binded` int DEFAULT NULL,
  `is_language_specific` int DEFAULT NULL,
  PRIMARY KEY (`attribute`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

SET FOREIGN_KEY_CHECKS=1;