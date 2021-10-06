SET FOREIGN_KEY_CHECKS=0;

DROP TABLE IF EXISTS `currency_symbols`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `currency_symbols` (
  `id` int NOT NULL,
  `currency_code` varchar(3) NOT NULL,
  `description` varchar(100) DEFAULT NULL,
  `html_code` varchar(10) DEFAULT NULL,
  `image` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `currency_code_UNIQUE` (`currency_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `custom_css`
--

DROP TABLE IF EXISTS `custom_css`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `custom_css` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_document_type` int NOT NULL,
  `css` varchar(1024) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `custom_pricing_monitor`
--

DROP TABLE IF EXISTS `custom_pricing_monitor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `custom_pricing_monitor` (
  `id` int NOT NULL,
  `id_pricing_monitor` int NOT NULL,
  `name` varchar(200) DEFAULT NULL,
  `value` double DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `data_request`
--

DROP TABLE IF EXISTS `data_request`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `data_request` (
  `id_data_request` int NOT NULL,
  `market` varchar(255) DEFAULT NULL,
  `ticker` varchar(255) DEFAULT NULL,
  `data_req` date DEFAULT NULL,
  `field` varchar(255) DEFAULT NULL,
  `data_type` varchar(255) DEFAULT NULL,
  `tag` varchar(255) DEFAULT NULL,
  `available` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id_data_request`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `data_result`
--

DROP TABLE IF EXISTS `data_result`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `data_result` (
  `id_data_request` int NOT NULL,
  `market` varchar(255) DEFAULT NULL,
  `ticker` varchar(255) DEFAULT NULL,
  `date_req` datetime DEFAULT NULL,
  `field` varchar(255) DEFAULT NULL,
  `data_type` varchar(255) DEFAULT NULL,
  `tag` varchar(255) DEFAULT NULL,
  `available` int DEFAULT NULL,
  PRIMARY KEY (`id_data_request`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `dataprovideridmapping`
--

DROP TABLE IF EXISTS `dataprovideridmapping`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dataprovideridmapping` (
  `IDCODE` varchar(100) NOT NULL DEFAULT '',
  `CATEGORY` varchar(100) NOT NULL DEFAULT '',
  `DATAPROVIDER` varchar(100) NOT NULL DEFAULT '',
  `DATAPROVIDERIDENTIFIER` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`IDCODE`,`CATEGORY`,`DATAPROVIDER`),
  CONSTRAINT `FK_DATAPROVIDERIDMAPPING_MARKETDATAINFO` FOREIGN KEY (`IDCODE`, `CATEGORY`) REFERENCES `marketdataidentifiers` (`IDCODE`, `CATEGORY`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `debugmodels`
--

DROP TABLE IF EXISTS `debugmodels`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `debugmodels` (
  `contractId` int NOT NULL,
  `lastUpdate` datetime DEFAULT NULL,
  `stream` longblob,
  PRIMARY KEY (`contractId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `delta_pricing_monitor`
--

DROP TABLE IF EXISTS `delta_pricing_monitor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `delta_pricing_monitor` (
  `id` int NOT NULL,
  `id_pricing_monitor` int DEFAULT NULL,
  `name` varchar(20) DEFAULT NULL,
  `delta` double DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `document`
--

DROP TABLE IF EXISTS `document`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `document` (
  `id` int NOT NULL,
  `id_contract` int NOT NULL,
  `id_document_type` int NOT NULL,
  `creation_date` datetime DEFAULT NULL,
  `last_edit` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_document_contracts_id_contract` (`id_contract`),
  KEY `fk_document_document_type_id` (`id_document_type`),
  CONSTRAINT `fk_document_contracts_id_contract` FOREIGN KEY (`id_contract`) REFERENCES `contracts` (`id_contract`),
  CONSTRAINT `fk_document_document_type_id` FOREIGN KEY (`id_document_type`) REFERENCES `document_type` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `document_approval_roles`
--

DROP TABLE IF EXISTS `document_approval_roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `document_approval_roles` (
  `id` int NOT NULL AUTO_INCREMENT,
  `document_type` int NOT NULL,
  `id_document_type` int DEFAULT NULL,
  `id_company` int DEFAULT NULL,
  `id_role` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_multi_role_company` (`id_company`),
  KEY `fk_multi_role_role` (`id_role`),
  CONSTRAINT `fk_multi_role_company` FOREIGN KEY (`id_company`) REFERENCES `company` (`idcompany`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_multi_role_role` FOREIGN KEY (`id_role`) REFERENCES `rules` (`idrule`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `document_hub_cached_info`
--

DROP TABLE IF EXISTS `document_hub_cached_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `document_hub_cached_info` (
  `id_contract` int NOT NULL,
  `id_company` int NOT NULL,
  `document_type` int NOT NULL,
  `id_document_type` int NOT NULL,
  `trigger_warning_count` int DEFAULT NULL,
  `trigger_urgent_count` int DEFAULT NULL,
  `last_edit_timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_contract`,`id_company`,`document_type`,`id_document_type`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Temporary view structure for view `document_hub_index`
--

DROP TABLE IF EXISTS `document_hub_index`;
/*!50001 DROP VIEW IF EXISTS `document_hub_index`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `document_hub_index` AS SELECT 
 1 AS `id`,
 1 AS `idcontract`,
 1 AS `contract_name`,
 1 AS `contract_isin`,
 1 AS `contract_product_code`,
 1 AS `idcompany`,
 1 AS `company_name`,
 1 AS `document_type`,
 1 AS `id_document_type`,
 1 AS `valuation_date`,
 1 AS `resultstate`,
 1 AS `last_change_ts`,
 1 AS `reportlanguage`,
 1 AS `valid_from`,
 1 AS `publish_valuation_date`,
 1 AS `publish_timestamp`,
 1 AS `trigger_warning_count`,
 1 AS `trigger_urgent_count`,
 1 AS `last_edit_timestamp`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `document_index`
--

DROP TABLE IF EXISTS `document_index`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `document_index` (
  `id_index` int NOT NULL AUTO_INCREMENT,
  `layout_path` varchar(1024) NOT NULL,
  `position` int DEFAULT NULL,
  PRIMARY KEY (`id_index`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `document_linked`
--

DROP TABLE IF EXISTS `document_linked`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `document_linked` (
  `id_linked` int NOT NULL,
  `id_document_type` int NOT NULL,
  `order` int NOT NULL DEFAULT '1',
  PRIMARY KEY (`id_linked`,`id_document_type`),
  KEY `fk_id_document_type_idx` (`id_document_type`),
  CONSTRAINT `fk_id_document_type` FOREIGN KEY (`id_document_type`) REFERENCES `document_type` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `document_linked_naming`
--

DROP TABLE IF EXISTS `document_linked_naming`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `document_linked_naming` (
  `id_linked` int NOT NULL,
  `name` varchar(45) NOT NULL,
  PRIMARY KEY (`id_linked`),
  CONSTRAINT `fk_id_linked_naming` FOREIGN KEY (`id_linked`) REFERENCES `document_linked` (`id_linked`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `document_type`
--

DROP TABLE IF EXISTS `document_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `document_type` (
  `id` int NOT NULL,
  `name` varchar(255) NOT NULL,
  `scope` int NOT NULL,
  `layout` varchar(1024) NOT NULL,
  `css_custom_file` varchar(1024) DEFAULT NULL,
  `languages` varchar(255) NOT NULL,
  `max_page_count` int DEFAULT NULL,
  `idcompany` int DEFAULT NULL,
  `id_linked` int DEFAULT NULL,
  `id_index` int DEFAULT NULL,
  `sortable` tinyint NOT NULL DEFAULT '0',
  `is_glossary` tinyint NOT NULL DEFAULT '0',
  `white_page_when_odd` tinyint NOT NULL DEFAULT '0',
  `is_index` tinyint NOT NULL DEFAULT '0',
  `model_handler_type` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_id_linked_idx` (`id_linked`),
  KEY `fk_id_index_idx` (`id_index`),
  CONSTRAINT `fk_id_index` FOREIGN KEY (`id_index`) REFERENCES `document_index` (`id_index`) ON DELETE SET NULL ON UPDATE SET NULL,
  CONSTRAINT `fk_id_linked` FOREIGN KEY (`id_linked`) REFERENCES `document_linked` (`id_linked`) ON DELETE SET NULL ON UPDATE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `document_type_markup`
--

DROP TABLE IF EXISTS `document_type_markup`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `document_type_markup` (
  `id_document_type` int NOT NULL,
  `tag` varchar(45) NOT NULL,
  PRIMARY KEY (`id_document_type`,`tag`),
  KEY `fk_tag_markup` (`tag`),
  CONSTRAINT `fk_document_type_markup` FOREIGN KEY (`id_document_type`) REFERENCES `document_type` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_tag_markup` FOREIGN KEY (`tag`) REFERENCES `markup_replacement` (`tag`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `document_type_template`
--

DROP TABLE IF EXISTS `document_type_template`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `document_type_template` (
  `id_document_type` int NOT NULL,
  `id_template` int NOT NULL,
  PRIMARY KEY (`id_document_type`,`id_template`),
  KEY `fk_document_type_template_templates_idtemplate` (`id_template`),
  CONSTRAINT `fk_document_type_template_document_type_id` FOREIGN KEY (`id_document_type`) REFERENCES `document_type` (`id`),
  CONSTRAINT `fk_document_type_template_templates_idtemplate` FOREIGN KEY (`id_template`) REFERENCES `templates` (`idtemplate`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `equitysplit`
--

DROP TABLE IF EXISTS `equitysplit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `equitysplit` (
  `security` varchar(100) NOT NULL DEFAULT '',
  `executiondate` date NOT NULL,
  `splitratio` double DEFAULT NULL,
  PRIMARY KEY (`security`,`executiondate`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `eventlog`
--

DROP TABLE IF EXISTS `eventlog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `eventlog` (
  `Id` varchar(40) NOT NULL,
  `RequestTime` datetime DEFAULT NULL,
  `TimeStamp` bigint DEFAULT NULL,
  `RequestDescription` varchar(255) DEFAULT NULL,
  `DataDescription` varchar(255) DEFAULT NULL,
  `Status` varchar(255) DEFAULT NULL,
  `Username` varchar(255) DEFAULT NULL,
  `UserAgent` varchar(255) DEFAULT NULL,
  `IPAddress` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `export_file`
--

DROP TABLE IF EXISTS `export_file`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `export_file` (
  `idexport_file` int NOT NULL,
  `idimexp_table` int NOT NULL,
  `user_id` int NOT NULL,
  `params` longtext,
  `upld_date` datetime NOT NULL,
  `exec_date` datetime DEFAULT NULL,
  `status` varchar(100) DEFAULT NULL,
  `result` longblob,
  `file_name` varchar(200) DEFAULT NULL,
  `delete_row` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`idexport_file`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `functions`
--

DROP TABLE IF EXISTS `functions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `functions` (
  `idfunction` int NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `flag` tinyint(1) DEFAULT NULL,
  `idrule` int DEFAULT NULL,
  `description` text,
  PRIMARY KEY (`idfunction`),
  KEY `fk_idrule_idx` (`idrule`),
  CONSTRAINT `fk_idrule` FOREIGN KEY (`idrule`) REFERENCES `rules` (`idrule`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `gamma_pricing_monitor`
--

DROP TABLE IF EXISTS `gamma_pricing_monitor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `gamma_pricing_monitor` (
  `id` int NOT NULL,
  `id_pricing_monitor` int DEFAULT NULL,
  `name` varchar(200) DEFAULT NULL,
  `gamma` double DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `imexp_table`
--

DROP TABLE IF EXISTS `imexp_table`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `imexp_table` (
  `IDIMEXP_TABLE` int NOT NULL,
  `NAME` varchar(200) NOT NULL,
  `DESCRIPTION` varchar(2000) DEFAULT NULL,
  `FILE_TEMPLATE` varchar(100) DEFAULT NULL,
  `DIRECTION` varchar(10) DEFAULT NULL,
  `TYPE_NAME` varchar(333) DEFAULT NULL,
  PRIMARY KEY (`IDIMEXP_TABLE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `importer_file`
--

DROP TABLE IF EXISTS `importer_file`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `importer_file` (
  `ID` int NOT NULL,
  `USERID` int DEFAULT NULL,
  `upld_file` mediumblob,
  `IMP_TYPE` int DEFAULT NULL,
  `PARAMS` varchar(1000) DEFAULT NULL,
  `UPLD_DATE` datetime DEFAULT NULL,
  `EXEC_DATE` datetime DEFAULT NULL,
  `STATUS` varchar(100) DEFAULT NULL,
  `result` longblob,
  `FILE_NAME` varchar(200) DEFAULT NULL,
  `EMAILS` varchar(250) DEFAULT NULL,
  `delete_row` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `kid_cached_filename`
--

DROP TABLE IF EXISTS `kid_cached_filename`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `kid_cached_filename` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_company` int DEFAULT NULL,
  `filename` varchar(1024) DEFAULT NULL,
  `report_id_contract` int NOT NULL,
  `report_type` int NOT NULL,
  `report_language` varchar(16) NOT NULL,
  `report_valid_from` date NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=68 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

SET FOREIGN_KEY_CHECKS=1;