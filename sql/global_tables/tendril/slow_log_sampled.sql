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
-- Table structure for table `slow_log_sampled`
--

DROP TABLE IF EXISTS `slow_log_sampled`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `slow_log_sampled` (
  `server_id` int(10) unsigned NOT NULL,
  `start_time` datetime NOT NULL,
  `user_host` mediumtext NOT NULL,
  `query_time` time(6) NOT NULL,
  `lock_time` time(6) NOT NULL,
  `rows_sent` int(11) NOT NULL,
  `rows_examined` int(11) NOT NULL,
  `db` varchar(512) NOT NULL,
  `last_insert_id` int(11) NOT NULL,
  `insert_id` int(11) NOT NULL,
  `m_server_id` int(10) unsigned NOT NULL,
  `sql_text` mediumtext NOT NULL,
  `checksum` char(32) DEFAULT NULL,
  KEY `i1` (`server_id`,`start_time`),
  KEY `i2` (`start_time`),
  KEY `i3` (`checksum`,`start_time`)
) ENGINE=TokuDB DEFAULT CHARSET=utf8 COMMENT='Slow log' `compression`='tokudb_zlib'
/*!50100 PARTITION BY RANGE (to_days(start_time))
(PARTITION p738078 VALUES LESS THAN (738079) ENGINE = TokuDB,
 PARTITION p738079 VALUES LESS THAN (738080) ENGINE = TokuDB,
 PARTITION p738080 VALUES LESS THAN (738081) ENGINE = TokuDB,
 PARTITION p738081 VALUES LESS THAN (738082) ENGINE = TokuDB,
 PARTITION p738082 VALUES LESS THAN (738083) ENGINE = TokuDB,
 PARTITION p738083 VALUES LESS THAN (738084) ENGINE = TokuDB,
 PARTITION p738084 VALUES LESS THAN (738085) ENGINE = TokuDB,
 PARTITION p738085 VALUES LESS THAN (738086) ENGINE = TokuDB) */;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-10-21 12:19:23
