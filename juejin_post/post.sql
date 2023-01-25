-- MySQL dump 10.13  Distrib 8.0.26, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: juejin_post
-- ------------------------------------------------------
-- Server version	8.0.26

/*!40101 SET @OLD_CHARACTER_SET_CLIENT = @@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS = @@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION = @@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE = @@TIME_ZONE */;
/*!40103 SET TIME_ZONE = '+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS = @@UNIQUE_CHECKS, UNIQUE_CHECKS = 0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS = @@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS = 0 */;
/*!40101 SET @OLD_SQL_MODE = @@SQL_MODE, SQL_MODE = 'NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES = @@SQL_NOTES, SQL_NOTES = 0 */;

CREATE DATABASE juejin_post;
USE juejin_post;

--
-- Table structure for table `article`
--

DROP TABLE IF EXISTS `article`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `article`
(
	`id`           int        NOT NULL AUTO_INCREMENT,
	`title`        varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
	`author`       int                                  DEFAULT NULL,
	`cover`        varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
	`content`      text COLLATE utf8_unicode_ci,
	`state`        int                                  DEFAULT NULL,
	`category`     int                                  DEFAULT NULL,
	`watch_num`    int                                  DEFAULT NULL COMMENT '观看数',
	`gmt_modified` datetime                             DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
	`gmt_created`  datetime                             DEFAULT NULL,
	`is_delete`    tinyint(1) NOT NULL                  DEFAULT '0',
	PRIMARY KEY (`id`) USING BTREE,
	KEY `sdf` (`author`) USING BTREE,
	KEY `aahs` (`category`) USING BTREE
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb3
  COLLATE = utf8_unicode_ci
  ROW_FORMAT = DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `article`
--

LOCK TABLES `article` WRITE;
/*!40000 ALTER TABLE `article`
	DISABLE KEYS */;
/*!40000 ALTER TABLE `article`
	ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `category`
--

DROP TABLE IF EXISTS `category`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `category`
(
	`id`           int        NOT NULL AUTO_INCREMENT,
	`name`         varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
	`gmt_modified` datetime                                               DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
	`gmt_created`  datetime                                               DEFAULT NULL,
	`is_delete`    tinyint(1) NOT NULL                                    DEFAULT '0',
	PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb3
  COLLATE = utf8_unicode_ci
  ROW_FORMAT = DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category`
--

LOCK TABLES `category` WRITE;
/*!40000 ALTER TABLE `category`
	DISABLE KEYS */;
/*!40000 ALTER TABLE `category`
	ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tag`
--

DROP TABLE IF EXISTS `tag`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tag`
(
	`id`           int        NOT NULL AUTO_INCREMENT,
	`name`         varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
	`gmt_created`  datetime                                               DEFAULT NULL,
	`gmt_modified` datetime                                               DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
	`is_delete`    tinyint(1) NOT NULL                                    DEFAULT '0',
	PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb3
  COLLATE = utf8_unicode_ci
  ROW_FORMAT = DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tag`
--

LOCK TABLES `tag` WRITE;
/*!40000 ALTER TABLE `tag`
	DISABLE KEYS */;
/*!40000 ALTER TABLE `tag`
	ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tag_article`
--

DROP TABLE IF EXISTS `tag_article`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tag_article`
(
	`id`           int        NOT NULL AUTO_INCREMENT,
	`tag_id`       int                 DEFAULT NULL,
	`article_id`   int                 DEFAULT NULL,
	`gmt_created`  datetime            DEFAULT NULL,
	`gmt_modified` datetime            DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
	`is_delete`    tinyint(1) NOT NULL DEFAULT '0',
	PRIMARY KEY (`id`) USING BTREE,
	KEY `sagda` (`tag_id`) USING BTREE,
	KEY `haedhs` (`article_id`) USING BTREE,
	CONSTRAINT `haedhs` FOREIGN KEY (`article_id`) REFERENCES `article` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
	CONSTRAINT `sagda` FOREIGN KEY (`tag_id`) REFERENCES `tag` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb3
  COLLATE = utf8_unicode_ci
  ROW_FORMAT = DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tag_article`
--

LOCK TABLES `tag_article` WRITE;
/*!40000 ALTER TABLE `tag_article`
	DISABLE KEYS */;
/*!40000 ALTER TABLE `tag_article`
	ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE = @OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE = @OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS = @OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS = @OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT = @OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS = @OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION = @OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES = @OLD_SQL_NOTES */;

-- Dump completed on 2023-01-25 16:46:53
