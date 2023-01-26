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
-- Table structure for table `category`
--

DROP TABLE IF EXISTS `category`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `category`
(
	`id`           int                                 NOT NULL AUTO_INCREMENT,
	`name`         varchar(50) COLLATE utf8_unicode_ci NOT NULL,
	`gmt_modified` datetime                                     DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
	`gmt_created`  datetime                                     DEFAULT NULL,
	`is_delete`    tinyint(1)                          NOT NULL DEFAULT '0',
	PRIMARY KEY (`id`) USING BTREE,
	UNIQUE KEY `category_name_uindex` (`name`)
) ENGINE = InnoDB
  AUTO_INCREMENT = 9
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
INSERT INTO `category`
VALUES (1, '后端', '2023-01-25 17:05:01', '2023-01-25 17:04:47', 0),
       (2, '前端', '2023-01-25 17:05:02', '2023-01-25 17:04:49', 0),
       (3, 'Android', '2023-01-25 17:05:04', '2023-01-25 17:04:51', 0),
       (4, 'iOS', '2023-01-25 17:05:05', '2023-01-25 17:04:53', 0),
       (5, '人工智能', '2023-01-25 17:05:07', '2023-01-25 17:04:54', 0),
       (6, '开发工具', '2023-01-25 17:05:09', '2023-01-25 17:04:56', 0),
       (7, '代码人生', '2023-01-25 17:05:11', '2023-01-25 17:04:57', 0),
       (8, '阅读', '2023-01-25 17:05:12', '2023-01-25 17:04:59', 0);
/*!40000 ALTER TABLE `category`
	ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `post`
--

DROP TABLE IF EXISTS `post`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `post`
(
	`id`           int                                  NOT NULL AUTO_INCREMENT,
	`title`        varchar(255) COLLATE utf8_unicode_ci NOT NULL,
	`author`       varchar(30) COLLATE utf8_unicode_ci  NOT NULL,
	`cover`        varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
	`brief`        varchar(100) COLLATE utf8_unicode_ci NOT NULL COMMENT '文章摘要',
	`state`        varchar(6) COLLATE utf8_unicode_ci                      DEFAULT NULL,
	`category`     int                                  NOT NULL,
	`watch_num`    int                                                     DEFAULT '0' COMMENT '观看数',
	`gmt_modified` datetime                                                DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
	`gmt_created`  datetime                                                DEFAULT NULL,
	`is_delete`    tinyint(1)                           NOT NULL           DEFAULT '0',
	`content`      text COLLATE utf8_unicode_ci,
	PRIMARY KEY (`id`) USING BTREE,
	KEY `sdf` (`author`) USING BTREE,
	KEY `aahs` (`category`) USING BTREE
) ENGINE = InnoDB
  AUTO_INCREMENT = 2
  DEFAULT CHARSET = utf8mb3
  COLLATE = utf8_unicode_ci
  ROW_FORMAT = DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `post`
--

LOCK TABLES `post` WRITE;
/*!40000 ALTER TABLE `post`
	DISABLE KEYS */;
INSERT INTO `post`
VALUES (1, 'ES6 - 解构赋值', 'ken200461', NULL,
        '## 对象解构 对象的解构赋值在花括号内写需要解构属性的key，可以在冒号后重命名，也可以在等号后给值为undefined的属性赋初始值 ```js const obj = { name: ', '审核中', 2, 0,
        '2023-01-25 17:15:51', '2023-01-25 18:05:41', 0,
        '## 对象解构\n\n对象的解构赋值在花括号内写需要解构属性的key，可以在冒号后重命名，也可以在等号后给值为undefined的属性赋初始值\n\n```js\nconst obj = {\n  name: \'guo\',\n  age: 18,\n  school: undefined,\n  address: \'ShangHai\'\n}\n\nconst { name, age } = obj\nconsole.log(name, age)  //guo 18\n\nconst { school: schoolName = \'SSPU\' } = obj\nconsole.log(schoolName)   //SSPU\n```\n\n应用：引入的库或网络请求返回的结果提取需要的内容\n\n\n\n## 数组解构\n\n数组按照元素的顺序进行解构，可以留空跳过元素\n\n```js\nconst arr = [1, 2, 3, 4, 5]\nconst [x, y, z] = arr\nconsole.log(x, y, z)  //1 2 3\n\nconst [a, , , b] = arr\nconsole.log(a, b)   //1 4\n```');
/*!40000 ALTER TABLE `post`
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
	`id`           int                                 NOT NULL AUTO_INCREMENT,
	`name`         varchar(20) COLLATE utf8_unicode_ci NOT NULL,
	`gmt_modified` datetime                                     DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
	`gmt_created`  datetime                                     DEFAULT NULL,
	`is_delete`    tinyint(1)                          NOT NULL DEFAULT '0',
	PRIMARY KEY (`id`) USING BTREE,
	UNIQUE KEY `tag_name_uindex` (`name`)
) ENGINE = InnoDB
  AUTO_INCREMENT = 19
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
INSERT INTO `tag`
VALUES (1, '前端', '2023-01-25 17:06:25', '2023-01-25 17:06:27', 0),
       (2, '后端', '2023-01-25 17:06:47', '2023-01-25 17:06:45', 0),
       (3, 'JavaScript', '2023-01-25 17:07:15', '2023-01-25 17:07:12', 0),
       (4, '面试', '2023-01-25 17:07:31', '2023-01-25 17:07:29', 0),
       (5, 'GitHub', '2023-01-25 17:07:42', '2023-01-25 17:07:40', 0),
       (6, 'Vue.js', '2023-01-25 17:08:01', '2023-01-25 17:07:59', 0),
       (7, '架构', '2023-01-25 17:08:11', '2023-01-25 17:08:09', 0),
       (8, '算法', '2023-01-25 17:08:38', '2023-01-25 17:08:36', 0),
       (9, 'Java', '2023-01-25 17:08:42', '2023-01-25 17:08:40', 0),
       (10, 'CSS', '2023-01-25 17:08:54', '2023-01-25 17:08:53', 0),
       (11, '代码规范', '2023-01-25 17:09:10', '2023-01-25 17:09:08', 0),
       (12, 'Node.js', '2023-01-25 17:09:32', '2023-01-25 17:09:30', 0),
       (13, '数据库', '2023-01-25 17:09:53', '2023-01-25 17:09:51', 0),
       (14, 'MySQL', '2023-01-25 17:10:04', '2023-01-25 17:10:02', 0),
       (15, 'React.js', '2023-01-25 17:10:23', '2023-01-25 17:10:21', 0),
       (16, 'Linux', '2023-01-25 17:10:37', '2023-01-25 17:10:35', 0),
       (17, 'Git', '2023-01-25 17:10:46', '2023-01-25 17:10:45', 0),
       (18, '正则表达式', '2023-01-25 17:11:15', '2023-01-25 17:11:13', 0);
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
	`article_id`   int        NOT NULL,
	`tag_id`       int        NOT NULL,
	`gmt_modified` datetime            DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
	`gmt_created`  datetime            DEFAULT NULL,
	`is_delete`    tinyint(1) NOT NULL DEFAULT '0',
	PRIMARY KEY (`id`) USING BTREE,
	KEY `sagda` (`tag_id`) USING BTREE,
	KEY `haedhs` (`article_id`) USING BTREE,
	CONSTRAINT `haedhs` FOREIGN KEY (`article_id`) REFERENCES `post` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
	CONSTRAINT `sagda` FOREIGN KEY (`tag_id`) REFERENCES `tag` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB
  AUTO_INCREMENT = 3
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
INSERT INTO `tag_article`
VALUES (1, 1, 1, '2023-01-25 17:12:04', '2023-01-25 17:12:00', 0),
       (2, 1, 3, '2023-01-25 17:12:06', '2023-01-25 17:12:02', 0);
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

-- Dump completed on 2023-01-26 11:07:53
