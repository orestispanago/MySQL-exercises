-- MySQL dump 10.13  Distrib 8.0.17, for Win64 (x86_64)
--
-- Host: localhost    Database: sales
-- ------------------------------------------------------
-- Server version	5.7.21-log

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

--
-- Table structure for table `customers`
--

DROP TABLE IF EXISTS `customers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customers` (
  `Ccode` int(10) unsigned NOT NULL,
  `Cname` varchar(20) NOT NULL,
  PRIMARY KEY (`Ccode`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customers`
--

LOCK TABLES `customers` WRITE;
/*!40000 ALTER TABLE `customers` DISABLE KEYS */;
INSERT INTO `customers` VALUES (100102,'Aleksiadis'),(100103,'Papadopoulos'),(100104,'Ioannou'),(100105,'Apostolou'),(100106,'Papamarkou'),(100107,'Drakopoulos');
/*!40000 ALTER TABLE `customers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `family`
--

DROP TABLE IF EXISTS `family`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `family` (
  `fname` varchar(20) DEFAULT NULL,
  `frelationship` varchar(20) DEFAULT NULL,
  `dob` date DEFAULT NULL,
  `salesman` int(10) unsigned DEFAULT NULL,
  KEY `fk_family` (`salesman`),
  CONSTRAINT `fk_family` FOREIGN KEY (`salesman`) REFERENCES `salesmen` (`Scode`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `family`
--

LOCK TABLES `family` WRITE;
/*!40000 ALTER TABLE `family` DISABLE KEYS */;
INSERT INTO `family` VALUES ('George','son','1981-02-11',101),('Mary','wife','1977-12-11',101);
/*!40000 ALTER TABLE `family` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `products` (
  `Pcode` int(10) unsigned NOT NULL,
  `Pdescr` varchar(45) NOT NULL,
  `Pprice` decimal(7,2) unsigned DEFAULT NULL,
  PRIMARY KEY (`Pcode`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products`
--

LOCK TABLES `products` WRITE;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
INSERT INTO `products` VALUES (1310,'FooBar',50.00),(1311,'Keyboard',100.00),(1312,'HDD 250MB',60.00),(1313,'Printer 24pin',81.00),(1314,'TV 17\"',250.00),(1315,'Printer inkjet',135.00);
/*!40000 ALTER TABLE `products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sales`
--

DROP TABLE IF EXISTS `sales`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sales` (
  `Scode` int(10) unsigned NOT NULL,
  `Pcode` int(10) unsigned NOT NULL,
  `Sdate` date DEFAULT NULL,
  `Ccode` int(10) unsigned NOT NULL,
  `Smcode` int(10) unsigned NOT NULL,
  `Quant` int(10) unsigned DEFAULT NULL,
  `Cost` decimal(7,2) unsigned DEFAULT NULL,
  PRIMARY KEY (`Scode`),
  KEY `Icode_idx` (`Pcode`),
  KEY `Ccode_idx` (`Ccode`),
  KEY `FK_sales` (`Smcode`),
  CONSTRAINT `Ccode` FOREIGN KEY (`Ccode`) REFERENCES `customers` (`Ccode`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_sales` FOREIGN KEY (`Smcode`) REFERENCES `salesmen` (`Scode`),
  CONSTRAINT `Icode` FOREIGN KEY (`Pcode`) REFERENCES `products` (`Pcode`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sales`
--

LOCK TABLES `sales` WRITE;
/*!40000 ALTER TABLE `sales` DISABLE KEYS */;
INSERT INTO `sales` VALUES (10001,1310,'1993-06-10',100107,104,20,800.00),(10002,1313,'1993-07-12',100102,101,10,700.00),(10003,1312,'1993-03-15',100104,105,16,760.00),(10004,1310,'1993-04-21',100106,103,12,400.00),(10005,1310,'1992-12-02',100103,102,25,1250.00),(10006,1311,'1992-11-03',100107,104,30,120.00),(10007,1313,'1993-05-17',100105,104,20,1600.00),(10008,1312,'1993-02-12',100107,104,5,100.00),(10009,1310,'1992-12-02',100102,101,10,500.00),(10010,1311,'1992-11-03',100106,103,20,80.00),(10011,1313,'1993-04-04',100104,105,15,1150.00);
/*!40000 ALTER TABLE `sales` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `salesmen`
--

DROP TABLE IF EXISTS `salesmen`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `salesmen` (
  `Scode` int(10) unsigned NOT NULL,
  `Sname` varchar(20) NOT NULL,
  `Scity` varchar(15) DEFAULT NULL,
  `Scomm` decimal(5,2) unsigned DEFAULT NULL,
  PRIMARY KEY (`Scode`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `salesmen`
--

LOCK TABLES `salesmen` WRITE;
/*!40000 ALTER TABLE `salesmen` DISABLE KEYS */;
INSERT INTO `salesmen` VALUES (101,'Antoniou','Athens',0.14),(102,'Dimou','Athens',0.15),(103,'Vasileiou','Patra',0.17),(104,'Raptis','Thessaloniki',0.16),(105,'Lamprinakis','Irakleio',0.15);
/*!40000 ALTER TABLE `salesmen` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'sales'
--

--
-- Dumping routines for database 'sales'
--
/*!50003 DROP PROCEDURE IF EXISTS `GetSales` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `GetSales`()
BEGIN
		SELECT * FROM `sales`.`sales`;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GetSalesByScode` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `GetSalesByScode`(IN Scode INT(10))
BEGIN
		SELECT * FROM `sales`.`sales` WHERE `sales`.`Scode` = Scode;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `swap` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `swap`(INOUT name1 VARCHAR(20), INOUT name2 VARCHAR(20), OUT nametemp VARCHAR(20))
BEGIN
	DECLARE nametemp VARCHAR(20);
    SET nametemp = name1;
    SET name1 = name2;
    SET name2 = nametemp;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `test` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `test`(OUT zz INT(2))
BEGIN
	SET zz = 10;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-03-30  8:45:03
