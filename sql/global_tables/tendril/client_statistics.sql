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
-- Table structure for table `client_statistics`
--

DROP TABLE IF EXISTS `client_statistics`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `client_statistics` (
  `server_id` int(10) unsigned NOT NULL,
  `client` varchar(64) NOT NULL DEFAULT '',
  `total_connections` bigint(21) NOT NULL DEFAULT '0',
  `concurrent_connections` bigint(21) NOT NULL DEFAULT '0',
  `connected_time` bigint(21) NOT NULL DEFAULT '0',
  `busy_time` double NOT NULL DEFAULT '0',
  `cpu_time` double NOT NULL DEFAULT '0',
  `bytes_received` bigint(21) NOT NULL DEFAULT '0',
  `bytes_sent` bigint(21) NOT NULL DEFAULT '0',
  `binlog_bytes_written` bigint(21) NOT NULL DEFAULT '0',
  `rows_read` bigint(21) NOT NULL DEFAULT '0',
  `rows_sent` bigint(21) NOT NULL DEFAULT '0',
  `rows_deleted` bigint(21) NOT NULL DEFAULT '0',
  `rows_inserted` bigint(21) NOT NULL DEFAULT '0',
  `rows_updated` bigint(21) NOT NULL DEFAULT '0',
  `select_commands` bigint(21) NOT NULL DEFAULT '0',
  `update_commands` bigint(21) NOT NULL DEFAULT '0',
  `other_commands` bigint(21) NOT NULL DEFAULT '0',
  `commit_transactions` bigint(21) NOT NULL DEFAULT '0',
  `rollback_transactions` bigint(21) NOT NULL DEFAULT '0',
  `denied_connections` bigint(21) NOT NULL DEFAULT '0',
  `lost_connections` bigint(21) NOT NULL DEFAULT '0',
  `access_denied` bigint(21) NOT NULL DEFAULT '0',
  `empty_queries` bigint(21) NOT NULL DEFAULT '0',
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

-- Dump completed on 2020-10-21 12:18:36
