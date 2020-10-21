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
-- Table structure for table `partitions`
--

DROP TABLE IF EXISTS `partitions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `partitions` (
  `server_id` int(10) unsigned NOT NULL,
  `table_catalog` varchar(512) NOT NULL DEFAULT '',
  `table_schema` varchar(64) NOT NULL DEFAULT '',
  `table_name` varchar(64) NOT NULL DEFAULT '',
  `partition_name` varchar(64) NOT NULL DEFAULT '',
  `subpartition_name` varchar(64) NOT NULL DEFAULT '',
  `partition_ordinal_position` bigint(21) unsigned DEFAULT NULL,
  `subpartition_ordinal_position` bigint(21) unsigned DEFAULT NULL,
  `partition_method` varchar(18) DEFAULT NULL,
  `subpartition_method` varchar(12) DEFAULT NULL,
  `partition_expression` longtext,
  `subpartition_expression` longtext,
  `partition_description` longtext,
  `table_rows` bigint(21) unsigned NOT NULL DEFAULT '0',
  `avg_row_length` bigint(21) unsigned NOT NULL DEFAULT '0',
  `data_length` bigint(21) unsigned NOT NULL DEFAULT '0',
  `max_data_length` bigint(21) unsigned DEFAULT NULL,
  `index_length` bigint(21) unsigned NOT NULL DEFAULT '0',
  `data_free` bigint(21) unsigned NOT NULL DEFAULT '0',
  `create_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `check_time` datetime DEFAULT NULL,
  `checksum` bigint(21) unsigned DEFAULT NULL,
  `partition_comment` varchar(80) NOT NULL DEFAULT '',
  `nodegroup` varchar(12) NOT NULL DEFAULT '',
  `tablespace_name` varchar(64) DEFAULT NULL,
  KEY `server_id` (`server_id`,`table_schema`,`table_name`)
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

-- Dump completed on 2020-10-21 12:19:11
