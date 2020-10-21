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
-- Table structure for table `global_status_log`
--

DROP TABLE IF EXISTS `global_status_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `global_status_log` (
  `server_id` int(10) unsigned NOT NULL,
  `stamp` datetime NOT NULL,
  `name_id` int(10) unsigned NOT NULL,
  `value` double NOT NULL DEFAULT '0',
  PRIMARY KEY (`server_id`,`name_id`,`stamp`,`value`),
  KEY `stamp` (`stamp`),
  KEY `server_stamp` (`server_id`,`stamp`)
) ENGINE=TokuDB DEFAULT CHARSET=utf8 `compression`='tokudb_zlib'
/*!50100 PARTITION BY RANGE (to_days(stamp))
(PARTITION p738055 VALUES LESS THAN (738056) ENGINE = TokuDB,
 PARTITION p738056 VALUES LESS THAN (738057) ENGINE = TokuDB,
 PARTITION p738057 VALUES LESS THAN (738058) ENGINE = TokuDB,
 PARTITION p738058 VALUES LESS THAN (738059) ENGINE = TokuDB,
 PARTITION p738059 VALUES LESS THAN (738060) ENGINE = TokuDB,
 PARTITION p738060 VALUES LESS THAN (738061) ENGINE = TokuDB,
 PARTITION p738061 VALUES LESS THAN (738062) ENGINE = TokuDB,
 PARTITION p738062 VALUES LESS THAN (738063) ENGINE = TokuDB,
 PARTITION p738063 VALUES LESS THAN (738064) ENGINE = TokuDB,
 PARTITION p738064 VALUES LESS THAN (738065) ENGINE = TokuDB,
 PARTITION p738065 VALUES LESS THAN (738066) ENGINE = TokuDB,
 PARTITION p738066 VALUES LESS THAN (738067) ENGINE = TokuDB,
 PARTITION p738067 VALUES LESS THAN (738068) ENGINE = TokuDB,
 PARTITION p738068 VALUES LESS THAN (738069) ENGINE = TokuDB,
 PARTITION p738069 VALUES LESS THAN (738070) ENGINE = TokuDB,
 PARTITION p738070 VALUES LESS THAN (738071) ENGINE = TokuDB,
 PARTITION p738071 VALUES LESS THAN (738072) ENGINE = TokuDB,
 PARTITION p738072 VALUES LESS THAN (738073) ENGINE = TokuDB,
 PARTITION p738073 VALUES LESS THAN (738074) ENGINE = TokuDB,
 PARTITION p738074 VALUES LESS THAN (738075) ENGINE = TokuDB,
 PARTITION p738075 VALUES LESS THAN (738076) ENGINE = TokuDB,
 PARTITION p738076 VALUES LESS THAN (738077) ENGINE = TokuDB,
 PARTITION p738077 VALUES LESS THAN (738078) ENGINE = TokuDB,
 PARTITION p738078 VALUES LESS THAN (738079) ENGINE = TokuDB,
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

-- Dump completed on 2020-10-21 12:19:09
