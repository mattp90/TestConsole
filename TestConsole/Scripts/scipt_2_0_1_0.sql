SET FOREIGN_KEY_CHECKS=0;

--
-- Table structure for table `kid_cached_index`
--
DROP TABLE IF EXISTS `kid_cached_index`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `kid_cached_index` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_company` int DEFAULT NULL,
  `last_timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `content` longblob NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `kid_download_log`
--

DROP TABLE IF EXISTS `kid_download_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `kid_download_log` (
  `userID` int NOT NULL,
  `kidID` int NOT NULL,
  PRIMARY KEY (`userID`,`kidID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `kid_kpi_imports`
--

DROP TABLE IF EXISTS `kid_kpi_imports`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `kid_kpi_imports` (
  `id_contract` int NOT NULL,
  `contract` varchar(255) DEFAULT NULL,
  `underlying_option` varchar(255) NOT NULL,
  `reference_date` date NOT NULL,
  `period1` float DEFAULT NULL,
  `period2` float DEFAULT NULL,
  `period3` float DEFAULT NULL,
  `period_hp` float DEFAULT NULL,
  `performance1_unfavourable` double DEFAULT NULL,
  `performance1_moderate` double DEFAULT NULL,
  `performance1_favourable` double DEFAULT NULL,
  `performance1_stress` double DEFAULT NULL,
  `performance2_unfavourable` double DEFAULT NULL,
  `performance2_moderate` double DEFAULT NULL,
  `performance2_favourable` double DEFAULT NULL,
  `performance2_stress` double DEFAULT NULL,
  `performance3_unfavourable` double DEFAULT NULL,
  `performance3_moderate` double DEFAULT NULL,
  `performance3_favourable` double DEFAULT NULL,
  `performance3_stress` double DEFAULT NULL,
  `percentage1_unfavourable` double DEFAULT NULL,
  `percentage1_moderate` double DEFAULT NULL,
  `percentage1_favourable` double DEFAULT NULL,
  `percentage1_stress` double DEFAULT NULL,
  `percentage2_unfavourable` double DEFAULT NULL,
  `percentage2_moderate` double DEFAULT NULL,
  `percentage2_favourable` double DEFAULT NULL,
  `percentage2_stress` double DEFAULT NULL,
  `percentage3_unfavourable` double DEFAULT NULL,
  `percentage3_moderate` double DEFAULT NULL,
  `percentage3_favourable` double DEFAULT NULL,
  `percentage3_stress` double DEFAULT NULL,
  `totalcosts1` double DEFAULT NULL,
  `totalcosts2` double DEFAULT NULL,
  `totalcosts3` double DEFAULT NULL,
  `ryi1` double DEFAULT NULL,
  `ryi2` double DEFAULT NULL,
  `ryi3` double DEFAULT NULL,
  `entry_cost` double DEFAULT NULL,
  `exit_cost` double DEFAULT NULL,
  `other_costs` double DEFAULT NULL,
  `transaction_costs` double DEFAULT NULL,
  `performance_fees` double DEFAULT NULL,
  `carried_interest` double DEFAULT NULL,
  `sri` int DEFAULT NULL,
  `mrm` int DEFAULT NULL,
  `crm` int DEFAULT NULL,
  `accumulated_invested_amount_1` double DEFAULT NULL,
  `accumulated_invested_amount_2` double DEFAULT NULL,
  `accumulated_invested_amount_3` double DEFAULT NULL,
  `insured_event_1` double DEFAULT NULL,
  `insured_event_2` double DEFAULT NULL,
  `insured_event_3` double DEFAULT NULL,
  `accumulated_insurance_premium_1` double DEFAULT NULL,
  `accumulated_insurance_premium_2` double DEFAULT NULL,
  `accumulated_insurance_premium_3` double DEFAULT NULL,
  `vev` double DEFAULT NULL,
  `insured_event_2nd_1` double DEFAULT NULL,
  `insured_event_2nd_2` double DEFAULT NULL,
  `insured_event_2nd_3` double DEFAULT NULL,
  `insured_event_3rd_1` double DEFAULT NULL,
  `insured_event_3rd_2` double DEFAULT NULL,
  `insured_event_3rd_3` double DEFAULT NULL,
  `insured_event_4th_1` double DEFAULT NULL,
  `insured_event_4th_2` double DEFAULT NULL,
  `insured_event_4th_3` double DEFAULT NULL,
  `insured_event_5th_1` double DEFAULT NULL,
  `insured_event_5th_2` double DEFAULT NULL,
  `insured_event_5th_3` double DEFAULT NULL,
  PRIMARY KEY (`underlying_option`,`reference_date`,`id_contract`),
  KEY `fk_kid_kpi_imports_id_contract` (`id_contract`),
  CONSTRAINT `fk_kid_kpi_imports_id_contract` FOREIGN KEY (`id_contract`) REFERENCES `contracts` (`id_contract`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `kid_layout`
--

DROP TABLE IF EXISTS `kid_layout`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `kid_layout` (
  `id_company` int NOT NULL,
  `layout` mediumblob,
  PRIMARY KEY (`id_company`),
  CONSTRAINT `fk_kid_layout_id_company` FOREIGN KEY (`id_company`) REFERENCES `company` (`idcompany`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `kid_report_section`
--

DROP TABLE IF EXISTS `kid_report_section`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `kid_report_section` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_contract` int NOT NULL,
  `id_company` int NOT NULL,
  `result_ts` datetime NOT NULL,
  `section_type` int NOT NULL,
  `option_key` varchar(255) NOT NULL,
  `lang` varchar(8) NOT NULL,
  `content` mediumblob,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=243 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `kid_result_approval`
--

DROP TABLE IF EXISTS `kid_result_approval`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `kid_result_approval` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_contract` int NOT NULL,
  `id_company` int NOT NULL,
  `valuation_date` date DEFAULT NULL,
  `lang` varchar(8) NOT NULL,
  `id_user` int NOT NULL,
  `request_ts` datetime NOT NULL,
  `valid_from` date DEFAULT NULL,
  `version` int DEFAULT NULL,
  `id_document_type` int DEFAULT NULL,
  `document_type` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `kid_result_approval_id_user` (`id_user`),
  KEY `version` (`version`),
  CONSTRAINT `kid_result_approval_ibfk_1` FOREIGN KEY (`version`) REFERENCES `kidversion` (`idversion`),
  CONSTRAINT `kid_result_approval_id_user` FOREIGN KEY (`id_user`) REFERENCES `users` (`iduser`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2264 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `kid_result_error`
--

DROP TABLE IF EXISTS `kid_result_error`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `kid_result_error` (
  `idcontract` int NOT NULL,
  `idcompany` int NOT NULL,
  `valuation_date` date NOT NULL,
  `id_document_type` int NOT NULL,
  `result_ts` datetime NOT NULL,
  `result_flag` tinyint(1) DEFAULT '0',
  `error_message` text,
  `document_type` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`idcontract`,`idcompany`,`valuation_date`,`document_type`,`id_document_type`,`result_ts`),
  CONSTRAINT `fk_kidresult` FOREIGN KEY (`idcontract`, `idcompany`, `valuation_date`, `document_type`, `id_document_type`) REFERENCES `kidresult` (`idcontract`, `idcompany`, `valuation_date`, `document_type`, `id_document_type`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `kidmonitoring`
--

DROP TABLE IF EXISTS `kidmonitoring`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `kidmonitoring` (
  `idcontract` int NOT NULL,
  `idcompany` int NOT NULL,
  `subelement` varchar(256) NOT NULL,
  `monitordate` date NOT NULL,
  `lastvaluationdate` date DEFAULT NULL,
  `mrm` int NOT NULL,
  `crm` int NOT NULL,
  `sri` int NOT NULL,
  `vev` double DEFAULT NULL,
  `period1` double NOT NULL,
  `period2` double DEFAULT NULL,
  `period3` double DEFAULT NULL,
  `unfavourablemonetary1` double NOT NULL,
  `unfavourablepercentage1` double NOT NULL,
  `unfavourablemonetary2` double DEFAULT NULL,
  `unfavourablepercentage2` double DEFAULT NULL,
  `unfavourablemonetary3` double DEFAULT NULL,
  `unfavourablepercentage3` double DEFAULT NULL,
  `moderatemonetary1` double NOT NULL,
  `moderatepercentage1` double NOT NULL,
  `moderatemonetary2` double DEFAULT NULL,
  `moderatepercentage2` double DEFAULT NULL,
  `moderatemonetary3` double DEFAULT NULL,
  `moderatepercentage3` double DEFAULT NULL,
  `favourablemonetary1` double NOT NULL,
  `favourablepercentage1` double NOT NULL,
  `favourablemonetary2` double DEFAULT NULL,
  `favourablepercentage2` double DEFAULT NULL,
  `favourablemonetary3` double DEFAULT NULL,
  `favourablepercentage3` double DEFAULT NULL,
  `extramonetary1` double DEFAULT NULL,
  `extrapercentage1` double DEFAULT NULL,
  `extramonetary2` double DEFAULT NULL,
  `extrapercentage2` double DEFAULT NULL,
  `extramonetary3` double DEFAULT NULL,
  `extrapercentage3` double DEFAULT NULL,
  PRIMARY KEY (`idcontract`,`idcompany`,`subelement`,`monitordate`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 ROW_FORMAT=COMPRESSED;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `kidmonitoringindex`
--

DROP TABLE IF EXISTS `kidmonitoringindex`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `kidmonitoringindex` (
  `idcontract` int NOT NULL,
  `idcompany` int NOT NULL,
  `published` tinyint(1) DEFAULT NULL,
  `indexdate` date NOT NULL,
  `publishedlanguage` varchar(256) DEFAULT NULL,
  `subelementcount` int DEFAULT NULL,
  `minsri` int DEFAULT NULL,
  `maxsri` int DEFAULT NULL,
  `pendingoperations` tinyint(1) DEFAULT NULL,
  `productstatus` int DEFAULT NULL,
  PRIMARY KEY (`idcontract`,`idcompany`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `kidreport`
--

DROP TABLE IF EXISTS `kidreport`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `kidreport` (
  `id` int NOT NULL,
  `idcontract` int NOT NULL,
  `idcompany` int NOT NULL,
  `reportlanguage` varchar(20) NOT NULL,
  `reporttype` int NOT NULL,
  `reportcontent` mediumblob,
  `valuation_date` date DEFAULT NULL,
  `valid_from` date DEFAULT NULL,
  `publish_timestamp` datetime DEFAULT NULL,
  `id_document_type` int DEFAULT NULL,
  `filename` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `report_last_key_group_idx` (`idcontract`,`idcompany`,`reporttype`,`id_document_type`,`valid_from`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `kidresult`
--

DROP TABLE IF EXISTS `kidresult`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `kidresult` (
  `idcontract` int NOT NULL,
  `idcompany` int NOT NULL,
  `valuation_date` date NOT NULL,
  `resultcontent` mediumblob,
  `resultstate` int DEFAULT NULL,
  `productstatus` int DEFAULT NULL,
  `lang` varchar(256) DEFAULT NULL,
  `changeflagiduser` int DEFAULT NULL,
  `changestateiduser` int DEFAULT NULL,
  `forcediduser` int DEFAULT NULL,
  `last_change_ts` datetime DEFAULT NULL,
  `id_document_type` int NOT NULL DEFAULT '0',
  `document_type` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`idcontract`,`idcompany`,`valuation_date`,`document_type`,`id_document_type`),
  KEY `fk_kidresult_idcompany` (`idcompany`),
  KEY `result_last_key_group_idx` (`idcontract`,`idcompany`,`document_type`,`id_document_type`,`valuation_date`),
  CONSTRAINT `fk_kidresult_idcompany` FOREIGN KEY (`idcompany`) REFERENCES `company` (`idcompany`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_kidresult_idcontract` FOREIGN KEY (`idcontract`) REFERENCES `contracts` (`id_contract`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `kidversion`
--

DROP TABLE IF EXISTS `kidversion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `kidversion` (
  `idversion` int NOT NULL,
  `idcontract` int NOT NULL,
  `language` varchar(8) NOT NULL,
  PRIMARY KEY (`idversion`,`idcontract`,`language`),
  KEY `fk_kidversion_contracts_idx` (`idcontract`),
  CONSTRAINT `fk_kidversion_contracts` FOREIGN KEY (`idcontract`) REFERENCES `contracts` (`id_contract`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `kiid_monitoring`
--

DROP TABLE IF EXISTS `kiid_monitoring`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `kiid_monitoring` (
  `id_contract` int NOT NULL,
  `valuation_date` date NOT NULL,
  `srri` int NOT NULL,
  `volatility` double NOT NULL,
  PRIMARY KEY (`id_contract`,`valuation_date`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Temporary view structure for view `last_result_per_contract_aggregate`
--

DROP TABLE IF EXISTS `last_result_per_contract_aggregate`;
/*!50001 DROP VIEW IF EXISTS `last_result_per_contract_aggregate`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `last_result_per_contract_aggregate` AS SELECT 
 1 AS `idcontract`,
 1 AS `idcompany`,
 1 AS `id_document_type`,
 1 AS `max(valuation_date)`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `last_result_per_contract_view`
--

DROP TABLE IF EXISTS `last_result_per_contract_view`;
/*!50001 DROP VIEW IF EXISTS `last_result_per_contract_view`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `last_result_per_contract_view` AS SELECT 
 1 AS `idcontract`,
 1 AS `idcompany`,
 1 AS `id_document_type`,
 1 AS `valuation_date`,
 1 AS `resultcontent`,
 1 AS `resultstate`,
 1 AS `productstatus`,
 1 AS `lang`,
 1 AS `changeflagiduser`,
 1 AS `changestateiduser`,
 1 AS `forcediduser`,
 1 AS `last_change_ts`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `log`
--

DROP TABLE IF EXISTS `log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `log` (
  `id` int NOT NULL AUTO_INCREMENT,
  `datetime` datetime DEFAULT NULL,
  `thread` varchar(255) DEFAULT NULL,
  `log_level` varchar(255) DEFAULT NULL,
  `logger` varchar(255) DEFAULT NULL,
  `message` text,
  `exception` text,
  `application` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `lost_marketsnapshot_scalar`
--

DROP TABLE IF EXISTS `lost_marketsnapshot_scalar`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `lost_marketsnapshot_scalar` (
  `id` varchar(64) NOT NULL,
  `ticker` varchar(100) DEFAULT NULL,
  `field` varchar(100) DEFAULT NULL,
  `market` varchar(20) DEFAULT NULL,
  `lost_market_date` datetime DEFAULT NULL,
  `valuation_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `map_certificate`
--

DROP TABLE IF EXISTS `map_certificate`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `map_certificate` (
  `id` int NOT NULL,
  `country` varchar(150) NOT NULL,
  `certificate` varchar(150) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `mappingrequest`
--

DROP TABLE IF EXISTS `mappingrequest`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mappingrequest` (
  `requestid` int DEFAULT NULL,
  `requesttimestamp` datetime DEFAULT NULL,
  `userid` int DEFAULT NULL,
  `isin` varchar(100) DEFAULT NULL,
  `attachment` mediumblob,
  `notes` text,
  `status` varchar(20) DEFAULT NULL,
  `lastmodifieddate` datetime DEFAULT NULL,
  `assigned` varchar(100) DEFAULT NULL,
  `attachment_file_name` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `mappingrequest_status`
--

DROP TABLE IF EXISTS `mappingrequest_status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mappingrequest_status` (
  `idmappingrequest_status` int NOT NULL,
  `status` varchar(100) NOT NULL,
  `description` text,
  PRIMARY KEY (`idmappingrequest_status`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `marketdataidentifiers`
--

DROP TABLE IF EXISTS `marketdataidentifiers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `marketdataidentifiers` (
  `IDCODE` varchar(100) NOT NULL DEFAULT '',
  `CATEGORY` varchar(100) NOT NULL DEFAULT '',
  `NAME` varchar(100) DEFAULT NULL,
  `DESCRIPTION` varchar(250) DEFAULT NULL,
  `CURRENCY` varchar(10) DEFAULT NULL,
  `VISIBILITY` int DEFAULT NULL,
  `fromdataprovider` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`IDCODE`,`CATEGORY`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

SET FOREIGN_KEY_CHECKS=1;