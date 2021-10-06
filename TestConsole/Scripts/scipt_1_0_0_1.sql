SET FOREIGN_KEY_CHECKS=0;

DROP TABLE IF EXISTS `big_table_counters`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `big_table_counters` (
  `id` int NOT NULL,
  `table_name` varchar(250) NOT NULL,
  `counter` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cdsproxies`
--

DROP TABLE IF EXISTS `cdsproxies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cdsproxies` (
  `ticker` varchar(100) NOT NULL,
  `proxy` varchar(100) NOT NULL,
  `weight` double DEFAULT NULL,
  PRIMARY KEY (`ticker`,`proxy`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cdsproxyinfo`
--

DROP TABLE IF EXISTS `cdsproxyinfo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cdsproxyinfo` (
  `ticker` varchar(100) NOT NULL,
  `currency` varchar(45) DEFAULT NULL,
  `recoveryrate` double DEFAULT NULL,
  `cdstenor` double DEFAULT NULL,
  `multfactor` double DEFAULT NULL,
  `offset` double DEFAULT NULL,
  PRIMARY KEY (`ticker`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `coin_details`
--

DROP TABLE IF EXISTS `coin_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `coin_details` (
  `id` int NOT NULL,
  `id_user` int NOT NULL,
  `coin` int NOT NULL,
  `description` text,
  `date_operation` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `collations`
--

DROP TABLE IF EXISTS `collations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `collations` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `status` tinyint NOT NULL,
  `filename` varchar(100) NOT NULL,
  `id_company` int NOT NULL,
  `language` varchar(2) NOT NULL,
  `deleted` tinyint NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `collation_id_company_idx` (`id_company`),
  CONSTRAINT `collation_id_company` FOREIGN KEY (`id_company`) REFERENCES `company` (`idcompany`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `collations_documents`
--

DROP TABLE IF EXISTS `collations_documents`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `collations_documents` (
  `id_collation` int NOT NULL,
  `id_document_type` int DEFAULT NULL,
  `attribute_info_id` int DEFAULT NULL,
  `kid_report_type` int DEFAULT NULL,
  `order` int NOT NULL,
  PRIMARY KEY (`id_collation`,`order`),
  KEY `document_type_id_collation_idx` (`id_document_type`),
  KEY `attr_info_id_colation_idx` (`attribute_info_id`),
  CONSTRAINT `attr_info_id_colation` FOREIGN KEY (`attribute_info_id`) REFERENCES `attributeinfo` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `collation_id_document` FOREIGN KEY (`id_collation`) REFERENCES `collations` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `document_type_id_collation` FOREIGN KEY (`id_document_type`) REFERENCES `document_type` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `company`
--

DROP TABLE IF EXISTS `company`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `company` (
  `idcompany` int NOT NULL,
  `name` varchar(200) NOT NULL,
  `legal_form` varchar(250) DEFAULT NULL,
  `area` varchar(150) DEFAULT NULL,
  `address` text,
  `city` varchar(120) DEFAULT NULL,
  `cap` varchar(10) DEFAULT NULL,
  `province` varchar(100) DEFAULT NULL,
  `region` varchar(100) DEFAULT NULL,
  `country` varchar(100) DEFAULT NULL,
  `web_site` varchar(200) DEFAULT NULL,
  `info_email` varchar(200) DEFAULT NULL,
  `enable` tinyint(1) DEFAULT '1',
  `vat` varchar(42) DEFAULT NULL,
  `selectable` tinyint(1) DEFAULT '1',
  `is_container` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`idcompany`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `company_area`
--

DROP TABLE IF EXISTS `company_area`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `company_area` (
  `idcompany_area` int NOT NULL DEFAULT '-1',
  `name` varchar(200) NOT NULL,
  `id_company` int NOT NULL,
  `create_date` datetime DEFAULT NULL,
  PRIMARY KEY (`idcompany_area`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `company_area_user`
--

DROP TABLE IF EXISTS `company_area_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `company_area_user` (
  `idcompany_area_user` int NOT NULL DEFAULT '-1',
  `id_company_area` int NOT NULL,
  `id_user` int NOT NULL,
  PRIMARY KEY (`idcompany_area_user`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `company_credential`
--

DROP TABLE IF EXISTS `company_credential`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `company_credential` (
  `id_company` int NOT NULL,
  `type` int NOT NULL,
  `credential` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id_company`,`type`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `config`
--

DROP TABLE IF EXISTS `config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `config` (
  `idconfig` int NOT NULL,
  `name` varchar(256) NOT NULL,
  `description` varchar(512) DEFAULT NULL,
  `value` varchar(512) DEFAULT NULL,
  PRIMARY KEY (`idconfig`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `consob_risk_manager`
--

DROP TABLE IF EXISTS `consob_risk_manager`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `consob_risk_manager` (
  `id` int NOT NULL,
  `id_contratto` int NOT NULL,
  `risk_date` date DEFAULT NULL,
  `risk_actual` int DEFAULT NULL,
  `risk_suggested` int DEFAULT NULL,
  `style_actual` int DEFAULT NULL,
  `style_suggested` int DEFAULT NULL,
  `volatility` int DEFAULT NULL,
  `delta_vol` int DEFAULT NULL,
  `risk_declared` int DEFAULT NULL,
  `style_declared` int DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `visible` char(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `contract_categories`
--

DROP TABLE IF EXISTS `contract_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `contract_categories` (
  `idcontract_categories` int NOT NULL,
  `id_parent` int DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `description` text,
  `private_category` tinyint(1) DEFAULT '0',
  `id_company` int DEFAULT '0',
  `id_user_owner` int DEFAULT NULL,
  PRIMARY KEY (`idcontract_categories`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `contract_descriptions`
--

DROP TABLE IF EXISTS `contract_descriptions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `contract_descriptions` (
  `id_contract` int NOT NULL,
  `lang` varchar(8) NOT NULL,
  `description` mediumtext,
  PRIMARY KEY (`id_contract`,`lang`),
  CONSTRAINT `fk_contract_descriptions_id_contract` FOREIGN KEY (`id_contract`) REFERENCES `contracts` (`id_contract`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `contract_profile_link`
--

DROP TABLE IF EXISTS `contract_profile_link`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `contract_profile_link` (
  `id_contract` int NOT NULL,
  `id_profile` int NOT NULL,
  PRIMARY KEY (`id_contract`),
  KEY `contract_profile_idx` (`id_profile`),
  CONSTRAINT `contract_profile_fk` FOREIGN KEY (`id_contract`) REFERENCES `contracts` (`id_contract`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `profile_link_fk` FOREIGN KEY (`id_profile`) REFERENCES `profiles` (`id_profile`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `contract_status`
--

DROP TABLE IF EXISTS `contract_status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `contract_status` (
  `id_contract_status` int NOT NULL,
  `name` varchar(100) NOT NULL,
  `assembly_name` varchar(255) NOT NULL,
  `class_full_name` varchar(255) NOT NULL,
  PRIMARY KEY (`id_contract_status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `contract_tags`
--

DROP TABLE IF EXISTS `contract_tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `contract_tags` (
  `id_tag` int NOT NULL,
  `id_contract` int NOT NULL,
  PRIMARY KEY (`id_tag`,`id_contract`),
  KEY `fk_contract_tags_idx` (`id_contract`),
  CONSTRAINT `fk_contract_tags` FOREIGN KEY (`id_contract`) REFERENCES `contracts` (`id_contract`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `contract_tracking`
--

DROP TABLE IF EXISTS `contract_tracking`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `contract_tracking` (
  `idContractTracking` int NOT NULL,
  `idContract` int NOT NULL,
  `EffectiveDate` date DEFAULT NULL,
  `MaturityDate` date DEFAULT NULL,
  `ValuationDate` date DEFAULT NULL,
  `Price` double DEFAULT '0',
  `SemiDeviation` double DEFAULT NULL,
  `TotalReturn` double DEFAULT NULL,
  `Trend` varchar(45) DEFAULT NULL,
  `Status` varchar(45) DEFAULT NULL,
  `Enabled` tinyint(1) NOT NULL DEFAULT '1',
  `AnnualizedVolatility` double DEFAULT NULL,
  `AnnualizedReturn` double DEFAULT NULL,
  `Currency` varchar(45) DEFAULT NULL,
  `Var99` double DEFAULT NULL,
  `Var95` double DEFAULT NULL,
  `CVar99` double DEFAULT NULL,
  `CVar95` double DEFAULT NULL,
  `ProtectionBarrierHit` tinyint(1) DEFAULT '0',
  `ProbOfLCP` double DEFAULT NULL,
  `ProbOfERONO` double DEFAULT NULL,
  `ExpAnnRetIER` double DEFAULT NULL,
  `ExpTotRetIER` double DEFAULT NULL,
  `NextEROD` date DEFAULT NULL,
  `UnderlyingChg` double DEFAULT NULL,
  `UnderlyingChgAtMaturity` double DEFAULT NULL,
  `MarketPriceOfRisk` double DEFAULT NULL,
  `Issuer` varchar(255) DEFAULT NULL,
  `Underlying` varchar(1000) DEFAULT NULL,
  `BarrierDistance` double DEFAULT NULL,
  `AutocallDistance` double DEFAULT NULL,
  `WorstBestUnderyling` varchar(255) DEFAULT NULL,
  `ExpectedAnnReturnIfMaturing` double DEFAULT NULL,
  `ExpectedTotalReturnIfMaturing` double DEFAULT NULL,
  `ProbLess` double DEFAULT NULL,
  `ProbEq` double DEFAULT NULL,
  `ProbBetter` double DEFAULT NULL,
  `AnnRetLess` double DEFAULT NULL,
  `AnnRetEq` double DEFAULT NULL,
  `AnnRetBetter` double DEFAULT NULL,
  `ExpAnnRetIfCPIL` double DEFAULT NULL,
  `BarrierType` int DEFAULT '-1',
  `PotTotRetAtMat` double DEFAULT '0',
  `PotAnnRetAtMat` double DEFAULT '0',
  `PaidCoupons` double DEFAULT '0',
  `notional` double DEFAULT NULL,
  PRIMARY KEY (`idContractTracking`),
  UNIQUE KEY `contract_tracking_logical_key` (`idContract`,`ValuationDate`,`MarketPriceOfRisk`),
  KEY `id_contracts_idx` (`idContract`),
  KEY `idx_contract_tracking_Currency` (`Currency`),
  KEY `idx_contract_tracking_report` (`ValuationDate`,`Currency`,`MarketPriceOfRisk`),
  CONSTRAINT `fk_contracts` FOREIGN KEY (`idContract`) REFERENCES `contracts` (`id_contract`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Temporary view structure for view `contract_tracking_aggregate`
--

DROP TABLE IF EXISTS `contract_tracking_aggregate`;
/*!50001 DROP VIEW IF EXISTS `contract_tracking_aggregate`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `contract_tracking_aggregate` AS SELECT 
 1 AS `idContract`,
 1 AS `maxdate`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `contract_tracking_scores`
--

DROP TABLE IF EXISTS `contract_tracking_scores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `contract_tracking_scores` (
  `idcontract` int NOT NULL DEFAULT '0',
  `riskaversion` double NOT NULL DEFAULT '0',
  `lambda` double NOT NULL DEFAULT '0',
  `score` double DEFAULT NULL,
  `market` varchar(255) DEFAULT NULL,
  `currency` varchar(45) DEFAULT NULL,
  `maturityinyears` double DEFAULT NULL,
  `status` int DEFAULT NULL,
  `issuer` varchar(255) DEFAULT NULL,
  `underlying` varchar(1000) DEFAULT NULL,
  `templatename` varchar(255) DEFAULT NULL,
  `idtracking` int DEFAULT NULL,
  `rank` int DEFAULT NULL,
  PRIMARY KEY (`idcontract`,`riskaversion`,`lambda`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Temporary view structure for view `contract_tracking_view`
--

DROP TABLE IF EXISTS `contract_tracking_view`;
/*!50001 DROP VIEW IF EXISTS `contract_tracking_view`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `contract_tracking_view` AS SELECT 
 1 AS `idContractTracking`,
 1 AS `idContract`,
 1 AS `EffectiveDate`,
 1 AS `MaturityDate`,
 1 AS `ValuationDate`,
 1 AS `Price`,
 1 AS `SemiDeviation`,
 1 AS `TotalReturn`,
 1 AS `Trend`,
 1 AS `Status`,
 1 AS `Enabled`,
 1 AS `AnnualizedVolatility`,
 1 AS `AnnualizedReturn`,
 1 AS `Currency`,
 1 AS `Var99`,
 1 AS `Var95`,
 1 AS `CVar99`,
 1 AS `CVar95`,
 1 AS `ProtectionBarrierHit`,
 1 AS `ProbOfLCP`,
 1 AS `ProbOfERONO`,
 1 AS `ExpAnnRetIER`,
 1 AS `ExpTotRetIER`,
 1 AS `NextEROD`,
 1 AS `UnderlyingChg`,
 1 AS `UnderlyingChgAtMaturity`,
 1 AS `MarketPriceOfRisk`,
 1 AS `Issuer`,
 1 AS `Underlying`,
 1 AS `BarrierDistance`,
 1 AS `AutocallDistance`,
 1 AS `WorstBestUnderyling`,
 1 AS `ExpectedAnnReturnIfMaturing`,
 1 AS `ExpectedTotalReturnIfMaturing`,
 1 AS `ProbLess`,
 1 AS `ProbEq`,
 1 AS `ProbBetter`,
 1 AS `AnnRetLess`,
 1 AS `AnnRetEq`,
 1 AS `AnnRetBetter`,
 1 AS `ExpAnnRetIfCPIL`,
 1 AS `BarrierType`,
 1 AS `PotTotRetAtMat`,
 1 AS `PotAnnRetAtMat`,
 1 AS `PaidCoupons`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `contracts`
--

DROP TABLE IF EXISTS `contracts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `contracts` (
  `id_contract` int NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `description` text,
  `id_category` int DEFAULT NULL,
  `id_template` int DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  `stream` longblob,
  `id_user` int DEFAULT NULL,
  `date_insert` datetime DEFAULT NULL,
  `id_contract_status` int DEFAULT '0',
  `forced` int DEFAULT NULL,
  `template_version` int DEFAULT NULL,
  `date_forced` datetime DEFAULT NULL,
  `iduser_forced` int DEFAULT NULL,
  `idcompany` int DEFAULT '-1',
  `ISIN_CODE` varchar(50) DEFAULT NULL,
  `sedol_code` varchar(50) DEFAULT NULL,
  `product_code` varchar(50) DEFAULT NULL,
  `TERMSHEET_LINK` varchar(50) DEFAULT NULL,
  `EXTRA_DATA` text,
  `automateddescription` text,
  `createdby` int DEFAULT NULL,
  `createdDate` datetime DEFAULT NULL,
  `status` int DEFAULT '-1',
  `scr_lookthrough_portfolio` int DEFAULT NULL,
  `id_user_owner` int DEFAULT NULL,
  `product_set` int DEFAULT NULL,
  PRIMARY KEY (`id_contract`),
  KEY `fk_contracts_product_set` (`product_set`),
  CONSTRAINT `fk_contracts_product_set` FOREIGN KEY (`product_set`) REFERENCES `product_set` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `currency_symbols`
--

SET FOREIGN_KEY_CHECKS=1;