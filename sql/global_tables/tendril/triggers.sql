-- MariaDB dump 10.17  Distrib 10.4.13-MariaDB, for Linux (x86_64)
--
-- Host: db1115    Database: tendril
-- ------------------------------------------------------
-- Server version	10.1.44-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `triggers`
--

DROP TABLE IF EXISTS `triggers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `triggers` (
  `server_id` int(10) unsigned NOT NULL,
  `trigger_catalog` varchar(512) NOT NULL DEFAULT '',
  `trigger_schema` varchar(64) NOT NULL DEFAULT '',
  `trigger_name` varchar(64) NOT NULL DEFAULT '',
  `event_manipulation` varchar(6) NOT NULL DEFAULT '',
  `event_object_catalog` varchar(512) NOT NULL DEFAULT '',
  `event_object_schema` varchar(64) NOT NULL DEFAULT '',
  `event_object_table` varchar(64) NOT NULL DEFAULT '',
  `action_order` bigint(4) NOT NULL DEFAULT '0',
  `action_condition` longtext,
  `action_statement` longtext NOT NULL,
  `action_orientation` varchar(9) NOT NULL DEFAULT '',
  `action_timing` varchar(6) NOT NULL DEFAULT '',
  `action_reference_old_table` varchar(64) DEFAULT NULL,
  `action_reference_new_table` varchar(64) DEFAULT NULL,
  `action_reference_old_row` varchar(3) NOT NULL DEFAULT '',
  `action_reference_new_row` varchar(3) NOT NULL DEFAULT '',
  `created` datetime DEFAULT NULL,
  `sql_mode` varchar(8192) NOT NULL DEFAULT '',
  `definer` varchar(189) NOT NULL DEFAULT '',
  `character_set_client` varchar(32) NOT NULL DEFAULT '',
  `collation_connection` varchar(32) NOT NULL DEFAULT '',
  `database_collation` varchar(32) NOT NULL DEFAULT '',
  KEY `i1` (`server_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-10-21 12:19:24
