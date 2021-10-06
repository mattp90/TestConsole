SET FOREIGN_KEY_CHECKS=0;

--
-- Table structure for table `vega_pricing_monitor`
--

DROP TABLE IF EXISTS `vega_pricing_monitor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `vega_pricing_monitor` (
  `id` int NOT NULL,
  `id_pricing_monitor` int DEFAULT NULL,
  `name` varchar(20) DEFAULT NULL,
  `vega` double DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `version_contract`
--

DROP TABLE IF EXISTS `version_contract`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `version_contract` (
  `id_contract` int NOT NULL,
  `version` int NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `description` text,
  `id_category` int DEFAULT NULL,
  `last_change_date` datetime DEFAULT NULL,
  `template_version` int DEFAULT NULL,
  `date_forced` datetime DEFAULT NULL,
  `iduser_forced` int DEFAULT NULL,
  `idcompany` int DEFAULT NULL,
  `isin_code` varchar(50) DEFAULT NULL,
  `termsheet_link` varchar(50) DEFAULT NULL,
  `extra_data` text,
  `status` int DEFAULT NULL,
  `stream` longblob,
  `sedol_code` varchar(50) DEFAULT NULL,
  `product_code` varchar(50) DEFAULT NULL,
  `change_log` text,
  `version_date` datetime DEFAULT NULL,
  `change_id_user` int NOT NULL DEFAULT '1',
  PRIMARY KEY (`id_contract`,`version`),
  KEY `fk_version_contract_change_user_id` (`change_id_user`),
  CONSTRAINT `fk_version_contract_change_user_id` FOREIGN KEY (`change_id_user`) REFERENCES `users` (`iduser`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_version_contract_id_contract` FOREIGN KEY (`id_contract`) REFERENCES `contracts` (`id_contract`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `version_template`
--

DROP TABLE IF EXISTS `version_template`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `version_template` (
  `id_template` int NOT NULL,
  `version` int NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `description` text,
  `id_category` int NOT NULL,
  `stream` longblob,
  `file_name` varchar(255) DEFAULT NULL,
  `id_company` int DEFAULT NULL,
  `cost` int DEFAULT NULL,
  `version_date` datetime DEFAULT NULL,
  `change_log` text,
  `change_id_user` int NOT NULL DEFAULT '1',
  PRIMARY KEY (`id_template`,`version`),
  KEY `fk_version_template_change_user_id` (`change_id_user`),
  CONSTRAINT `fk_version_template_change_user_id` FOREIGN KEY (`change_id_user`) REFERENCES `users` (`iduser`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_version_template_id_template` FOREIGN KEY (`id_template`) REFERENCES `templates` (`idtemplate`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `watchlist`
--

DROP TABLE IF EXISTS `watchlist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `watchlist` (
  `id` int NOT NULL,
  `userid` int DEFAULT NULL,
  `contractid` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `web_errors`
--

DROP TABLE IF EXISTS `web_errors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `web_errors` (
  `id` int NOT NULL AUTO_INCREMENT,
  `timestamp` datetime DEFAULT NULL,
  `controller` varchar(255) DEFAULT NULL,
  `action` varchar(255) DEFAULT NULL,
  `query_string` text,
  `statuscode` int DEFAULT NULL,
  `error_data` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=50 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `web_service_countdown_service`
--

DROP TABLE IF EXISTS `web_service_countdown_service`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `web_service_countdown_service` (
  `id` int NOT NULL,
  `service_name` varchar(200) NOT NULL,
  `id_user` int NOT NULL DEFAULT '-1',
  `countdown` int NOT NULL DEFAULT '-1',
  `deadline` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `web_service_performance`
--

DROP TABLE IF EXISTS `web_service_performance`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `web_service_performance` (
  `id` int NOT NULL,
  `type` varchar(200) NOT NULL,
  `method` varchar(200) NOT NULL,
  `time` datetime NOT NULL,
  `duration` double NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `web_service_term_sheets_config`
--

DROP TABLE IF EXISTS `web_service_term_sheets_config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `web_service_term_sheets_config` (
  `id` int NOT NULL,
  `id_user` int NOT NULL DEFAULT '-1',
  `path` varchar(200) DEFAULT '/',
  `issuer` varchar(200) DEFAULT '',
  `default` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `web_service_types`
--

DROP TABLE IF EXISTS `web_service_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `web_service_types` (
  `id` int NOT NULL,
  `name` varchar(200) DEFAULT NULL,
  `default_count` int DEFAULT '100',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `web_session_auth`
--

DROP TABLE IF EXISTS `web_session_auth`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `web_session_auth` (
  `id` int NOT NULL,
  `session_code` varchar(50) NOT NULL,
  `last_access` datetime NOT NULL,
  `id_user` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `session_code_UNIQUE` (`session_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `work_service`
--

DROP TABLE IF EXISTS `work_service`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `work_service` (
  `id` int NOT NULL,
  `name` varchar(200) DEFAULT NULL,
  `credits` int DEFAULT NULL,
  `days_validity` int DEFAULT NULL,
  `map_order` int DEFAULT NULL,
  `id_base_service` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping events for database 'kiddev'
--

--
-- Dumping routines for database 'kiddev'
--
/*!50003 DROP PROCEDURE IF EXISTS `CountContractInPorfolioItem` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`192.168.1.%` PROCEDURE `CountContractInPorfolioItem`(IN name TEXT)
BEGIN
  SELECT 
    count(*)
  FROM portafolio_contract ptc 
  INNER JOIN portafolio p ON p.id_portafolio = ptc.id_portafolio
  WHERE 
    p.name = name;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GetProcessMonitorCount` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`192.168.1.%` PROCEDURE `GetProcessMonitorCount`(
  IN idCompany INT, 
  IN viewAll BOOL,
    IN onDemand BOOL
)
BEGIN

  SET @query = "SELECT count(*)
  FROM process_monitor pm
    join message_monitor mm on mm.id_message = pm.id_message ";
  
  IF(viewAll = false) THEN 
    SET @query = CONCAT(@query, " WHERE pm.id_company = ", idCompany, " "); 
  END IF;
    
     IF(onDemand = true) THEN 
    SET @query = CONCAT(@query, " WHERE pm.launcher_type = 'On-Demand'"); 
  END IF;

  PREPARE stmt FROM @query;
  EXECUTE stmt;
  DEALLOCATE PREPARE stmt;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GetProcessMonitorPagedList` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`192.168.1.%` PROCEDURE `GetProcessMonitorPagedList`(
  IN idCompany INT, 
  IN viewAll BOOL,
    IN onDemand BOOL,
  IN startIndex INT,
  IN endIndex INT
)
BEGIN

  SET @query = "SELECT 
    pm.id_message as `IdProcessMonitor`, 
    pm.id_contract as `IdContract`, 
    pm.id_portfolio as `IdPorfolio`, 
    pm.type_analysis as `Analysis`,
    pm.state as `Status`, 
    pm.launcher_type as `Source`,
    (select c.name from contracts c where c.id_contract = pm.id_contract) as `Contract`, 
    mm.data_start as `DataStart`,
    mm.extra_data as `ExtraData`, 
    mm.reservation_deleted as `ReservationDeleted`,
    mm.idmessage_monitor as `IdMessageMonitor`
  FROM process_monitor pm
  join message_monitor mm on mm.id_message = pm.id_message";
  
  IF(viewAll = false) THEN 
    SET @query = CONCAT(@query, " WHERE pm.id_company = ", idCompany, " "); 
  END IF;
    
    IF(onDemand = true) THEN 
    SET @query = CONCAT(@query, " WHERE pm.launcher_type = 'On-Demand'"); 
  END IF;

  SET @order = " ORDER BY CASE 
    WHEN UPPER(pm.state) = UPPER('wait') THEN 3
    WHEN UPPER(pm.state) = UPPER('waitdata') THEN 2
    WHEN UPPER(pm.state) = UPPER('run') THEN 1
  END ASC ";
  SET @query = CONCAT(@query, @order);

  SET @limit = CONCAT(" LIMIT ", startIndex, ",", endIndex);
  SET @query = CONCAT(@query, @limit);

  PREPARE stmt FROM @query;
  EXECUTE stmt;
  DEALLOCATE PREPARE stmt;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GetR09Count` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`192.168.1.%` PROCEDURE `GetR09Count`()
BEGIN

  SET @query = "SELECT counter FROM big_table_counters btc where id = 1";

  PREPARE stmt FROM @query;
  EXECUTE stmt;
  DEALLOCATE PREPARE stmt;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `PorfolioItems` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`192.168.1.%` PROCEDURE `PorfolioItems`(IN idUser INT, IN name TEXT)
BEGIN
  SELECT 
    c.ISIN_CODE AS ISIN, 
    ptc.weight AS Weight
  FROM portafolio_contract ptc
  INNER JOIN portafolio p ON p.id_portafolio = ptc.id_portafolio
  INNER JOIN contracts c ON c.id_contract = ptc.id_contract
  WHERE 
    p.id_user = idUser AND p.name = name
  ORDER BY c.ISIN_CODE asc;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Final view structure for view `activities_start_end_dates`
--

/*!50001 DROP VIEW IF EXISTS `activities_start_end_dates`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`dba`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `activities_start_end_dates` AS select `step`.`task_code` AS `id_task`,max(`step`.`activityStart`) AS `start_date`,max(`step`.`activityLast`) AS `end_date` from `step` group by `step`.`task_code` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `contract_tracking_aggregate`
--

/*!50001 DROP VIEW IF EXISTS `contract_tracking_aggregate`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`dba`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `contract_tracking_aggregate` AS select `contract_tracking`.`idContract` AS `idContract`,max(`contract_tracking`.`ValuationDate`) AS `maxdate` from `contract_tracking` group by `contract_tracking`.`idContract` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `contract_tracking_view`
--

/*!50001 DROP VIEW IF EXISTS `contract_tracking_view`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`dba`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `contract_tracking_view` AS select `ct`.`idContractTracking` AS `idContractTracking`,`ct`.`idContract` AS `idContract`,`ct`.`EffectiveDate` AS `EffectiveDate`,`ct`.`MaturityDate` AS `MaturityDate`,`ct`.`ValuationDate` AS `ValuationDate`,`ct`.`Price` AS `Price`,`ct`.`SemiDeviation` AS `SemiDeviation`,`ct`.`TotalReturn` AS `TotalReturn`,`ct`.`Trend` AS `Trend`,`ct`.`Status` AS `Status`,`ct`.`Enabled` AS `Enabled`,`ct`.`AnnualizedVolatility` AS `AnnualizedVolatility`,`ct`.`AnnualizedReturn` AS `AnnualizedReturn`,`ct`.`Currency` AS `Currency`,`ct`.`Var99` AS `Var99`,`ct`.`Var95` AS `Var95`,`ct`.`CVar99` AS `CVar99`,`ct`.`CVar95` AS `CVar95`,`ct`.`ProtectionBarrierHit` AS `ProtectionBarrierHit`,`ct`.`ProbOfLCP` AS `ProbOfLCP`,`ct`.`ProbOfERONO` AS `ProbOfERONO`,`ct`.`ExpAnnRetIER` AS `ExpAnnRetIER`,`ct`.`ExpTotRetIER` AS `ExpTotRetIER`,`ct`.`NextEROD` AS `NextEROD`,`ct`.`UnderlyingChg` AS `UnderlyingChg`,`ct`.`UnderlyingChgAtMaturity` AS `UnderlyingChgAtMaturity`,`ct`.`MarketPriceOfRisk` AS `MarketPriceOfRisk`,`ct`.`Issuer` AS `Issuer`,`ct`.`Underlying` AS `Underlying`,`ct`.`BarrierDistance` AS `BarrierDistance`,`ct`.`AutocallDistance` AS `AutocallDistance`,`ct`.`WorstBestUnderyling` AS `WorstBestUnderyling`,`ct`.`ExpectedAnnReturnIfMaturing` AS `ExpectedAnnReturnIfMaturing`,`ct`.`ExpectedTotalReturnIfMaturing` AS `ExpectedTotalReturnIfMaturing`,`ct`.`ProbLess` AS `ProbLess`,`ct`.`ProbEq` AS `ProbEq`,`ct`.`ProbBetter` AS `ProbBetter`,`ct`.`AnnRetLess` AS `AnnRetLess`,`ct`.`AnnRetEq` AS `AnnRetEq`,`ct`.`AnnRetBetter` AS `AnnRetBetter`,`ct`.`ExpAnnRetIfCPIL` AS `ExpAnnRetIfCPIL`,`ct`.`BarrierType` AS `BarrierType`,`ct`.`PotTotRetAtMat` AS `PotTotRetAtMat`,`ct`.`PotAnnRetAtMat` AS `PotAnnRetAtMat`,`ct`.`PaidCoupons` AS `PaidCoupons` from (`contract_tracking` `ct` join `contract_tracking_aggregate` `maxresults`) where ((`ct`.`idContract` = `maxresults`.`idContract`) and (`ct`.`ValuationDate` = `maxresults`.`maxdate`)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `document_hub_index`
--

/*!50001 DROP VIEW IF EXISTS `document_hub_index`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`dba`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `document_hub_index` AS select concat(`r`.`idcontract`,';',`r`.`idcompany`,';',`r`.`document_type`,';',`r`.`id_document_type`,';',ifnull(`repl`.`reportlanguage`,'n/a')) AS `id`,`r`.`idcontract` AS `idcontract`,`c`.`name` AS `contract_name`,`c`.`ISIN_CODE` AS `contract_isin`,`c`.`product_code` AS `contract_product_code`,`r`.`idcompany` AS `idcompany`,`com`.`name` AS `company_name`,`r`.`document_type` AS `document_type`,`r`.`id_document_type` AS `id_document_type`,`r`.`valuation_date` AS `valuation_date`,`r`.`resultstate` AS `resultstate`,`r`.`last_change_ts` AS `last_change_ts`,`repl`.`reportlanguage` AS `reportlanguage`,`repl`.`valid_from` AS `valid_from`,`repl`.`valuation_date` AS `publish_valuation_date`,`repl`.`publish_timestamp` AS `publish_timestamp`,`dhci`.`trigger_warning_count` AS `trigger_warning_count`,`dhci`.`trigger_urgent_count` AS `trigger_urgent_count`,`dhci`.`last_edit_timestamp` AS `last_edit_timestamp` from (((((`result_last_key_group` `rlkg` join `kidresult` `r` on(((`r`.`idcontract` = `rlkg`.`idcontract`) and (`r`.`idcompany` = `rlkg`.`idcompany`) and (`r`.`document_type` = `rlkg`.`document_type`) and (`r`.`id_document_type` = `rlkg`.`id_document_type`) and (`r`.`valuation_date` = `rlkg`.`max_valuation_date`)))) join `contracts` `c` on((`r`.`idcontract` = `c`.`id_contract`))) join `company` `com` on((`r`.`idcompany` = `com`.`idcompany`))) left join `report_last` `repl` on(((`rlkg`.`idcontract` = `repl`.`idcontract`) and (`rlkg`.`idcompany` = `repl`.`idcompany`) and (`rlkg`.`document_type` = `repl`.`reporttype`) and (((`rlkg`.`id_document_type` = 0) and (`repl`.`id_document_type` is null)) or (`rlkg`.`id_document_type` = `repl`.`id_document_type`))))) left join `document_hub_cached_info` `dhci` on(((`rlkg`.`idcontract` = `dhci`.`id_contract`) and (`rlkg`.`idcompany` = `dhci`.`id_company`) and (`rlkg`.`document_type` = `dhci`.`document_type`) and (((`rlkg`.`id_document_type` = 0) and (`dhci`.`id_document_type` is null)) or (`rlkg`.`id_document_type` = `dhci`.`id_document_type`))))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `last_result_per_contract_aggregate`
--

/*!50001 DROP VIEW IF EXISTS `last_result_per_contract_aggregate`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`dba`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `last_result_per_contract_aggregate` AS select `kidresult`.`idcontract` AS `idcontract`,`kidresult`.`idcompany` AS `idcompany`,`kidresult`.`id_document_type` AS `id_document_type`,max(`kidresult`.`valuation_date`) AS `max(valuation_date)` from `kidresult` where (`kidresult`.`document_type` in (2,4,7)) group by `kidresult`.`idcontract`,`kidresult`.`idcompany`,`kidresult`.`id_document_type` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `last_result_per_contract_view`
--

/*!50001 DROP VIEW IF EXISTS `last_result_per_contract_view`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`dba`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `last_result_per_contract_view` AS select `kidresult`.`idcontract` AS `idcontract`,`kidresult`.`idcompany` AS `idcompany`,`kidresult`.`id_document_type` AS `id_document_type`,`kidresult`.`valuation_date` AS `valuation_date`,`kidresult`.`resultcontent` AS `resultcontent`,`kidresult`.`resultstate` AS `resultstate`,`kidresult`.`productstatus` AS `productstatus`,`kidresult`.`lang` AS `lang`,`kidresult`.`changeflagiduser` AS `changeflagiduser`,`kidresult`.`changestateiduser` AS `changestateiduser`,`kidresult`.`forcediduser` AS `forcediduser`,`kidresult`.`last_change_ts` AS `last_change_ts` from `kidresult` where ((`kidresult`.`document_type` in (2,4,7)) and (`kidresult`.`idcontract`,`kidresult`.`idcompany`,`kidresult`.`id_document_type`,`kidresult`.`valuation_date`) in (select `last_result_per_contract_aggregate`.`idcontract`,`last_result_per_contract_aggregate`.`idcompany`,`last_result_per_contract_aggregate`.`id_document_type`,`last_result_per_contract_aggregate`.`max(valuation_date)` from `last_result_per_contract_aggregate`)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `pricing_view`
--

/*!50001 DROP VIEW IF EXISTS `pricing_view`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`dba`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `pricing_view` AS select `pm`.`id_contract` AS `id_contract`,`pm`.`id_company` AS `id_company`,`pm`.`mtm` AS `mtm`,`pm`.`valuation_date` AS `valuation_date`,`maxresults`.`total` AS `total`,`pm`.`deleted` AS `deleted` from (`pricing_monitor` `pm` join `pricing_view_aggregate` `maxresults`) where ((`pm`.`id_contract` = `maxresults`.`idcontract`) and (`pm`.`valuation_date` = `maxresults`.`maxdate`) and (`pm`.`id_company` = `maxresults`.`id_company`)) order by `pm`.`id_contract` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `pricing_view_aggregate`
--

/*!50001 DROP VIEW IF EXISTS `pricing_view_aggregate`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`dba`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `pricing_view_aggregate` AS select `pricing_monitor`.`id_contract` AS `idcontract`,`pricing_monitor`.`id_company` AS `id_company`,max(`pricing_monitor`.`valuation_date`) AS `maxdate`,count(0) AS `total` from `pricing_monitor` where (`pricing_monitor`.`deleted` = 0) group by `pricing_monitor`.`id_contract`,`pricing_monitor`.`id_company` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `report_last`
--

/*!50001 DROP VIEW IF EXISTS `report_last`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`dba`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `report_last` AS select `r`.`idcontract` AS `idcontract`,`r`.`idcompany` AS `idcompany`,`r`.`reportlanguage` AS `reportlanguage`,`r`.`reporttype` AS `reporttype`,`r`.`id_document_type` AS `id_document_type`,`r`.`valuation_date` AS `valuation_date`,`r`.`valid_from` AS `valid_from`,`r`.`publish_timestamp` AS `publish_timestamp` from (`report_last_key_group` `rlkg` join `kidreport` `r` on(((`r`.`idcontract` = `rlkg`.`idcontract`) and (`r`.`idcompany` = `rlkg`.`idcompany`) and (`r`.`reporttype` = `rlkg`.`reporttype`) and (((`r`.`id_document_type` is null) and (`rlkg`.`id_document_type` is null)) or (`r`.`id_document_type` = `rlkg`.`id_document_type`)) and (`r`.`valid_from` = `rlkg`.`max_valid_from`)))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `report_last_key_group`
--

/*!50001 DROP VIEW IF EXISTS `report_last_key_group`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`dba`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `report_last_key_group` AS select `kidreport`.`idcontract` AS `idcontract`,`kidreport`.`idcompany` AS `idcompany`,`kidreport`.`reporttype` AS `reporttype`,`kidreport`.`id_document_type` AS `id_document_type`,max(`kidreport`.`valid_from`) AS `max_valid_from` from `kidreport` group by `kidreport`.`idcontract`,`kidreport`.`idcompany`,`kidreport`.`reporttype`,`kidreport`.`id_document_type` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `result_last_key_group`
--

/*!50001 DROP VIEW IF EXISTS `result_last_key_group`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`dba`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `result_last_key_group` AS select `kidresult`.`idcontract` AS `idcontract`,`kidresult`.`idcompany` AS `idcompany`,`kidresult`.`document_type` AS `document_type`,`kidresult`.`id_document_type` AS `id_document_type`,max(`kidresult`.`valuation_date`) AS `max_valuation_date` from `kidresult` group by `kidresult`.`idcontract`,`kidresult`.`idcompany`,`kidresult`.`document_type`,`kidresult`.`id_document_type` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-09-17 12:16:08

SET FOREIGN_KEY_CHECKS=1;