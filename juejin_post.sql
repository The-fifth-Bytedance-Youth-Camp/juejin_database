-- MySQL dump 10.13  Distrib 8.0.26, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: juejin_post
-- ------------------------------------------------------
-- Server version	8.0.26

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

CREATE DATABASE IF NOT EXISTS juejin_post;
USE juejin_post;

--
-- Table structure for table `cache`
--

DROP TABLE IF EXISTS `cache`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cache` (
  `cover` varchar(255) DEFAULT NULL,
  `content` text,
  `gmt_modified` datetime DEFAULT NULL,
  `gmt_created` datetime DEFAULT NULL,
  `code_style` varchar(255) NOT NULL DEFAULT 'atom-one-light',
  `category` int DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `theme` varchar(255) NOT NULL DEFAULT 'juejin',
  `id` varchar(30) NOT NULL COMMENT '管理员 id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='文章草稿';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cache`
--

LOCK TABLES `cache` WRITE;
/*!40000 ALTER TABLE `cache` DISABLE KEYS */;
/*!40000 ALTER TABLE `cache` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `category`
--

DROP TABLE IF EXISTS `category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `category` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `gmt_modified` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `gmt_created` datetime DEFAULT NULL,
  `is_delete` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `category_name_uindex` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category`
--

LOCK TABLES `category` WRITE;
/*!40000 ALTER TABLE `category` DISABLE KEYS */;
INSERT INTO `category` VALUES (1,'后端','2023-01-25 17:05:01','2023-01-25 17:04:47',0),(2,'前端','2023-01-25 17:05:02','2023-01-25 17:04:49',0),(3,'Android','2023-01-25 17:05:04','2023-01-25 17:04:51',0),(4,'iOS','2023-01-25 17:05:05','2023-01-25 17:04:53',0),(5,'人工智能','2023-01-25 17:05:07','2023-01-25 17:04:54',0),(6,'开发工具','2023-01-25 17:05:09','2023-01-25 17:04:56',0),(7,'代码人生','2023-01-25 17:05:11','2023-01-25 17:04:57',0),(8,'阅读','2023-01-25 17:05:12','2023-01-25 17:04:59',0);
/*!40000 ALTER TABLE `category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `image`
--

DROP TABLE IF EXISTS `image`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `image` (
  `id` int NOT NULL AUTO_INCREMENT,
  `post` int NOT NULL,
  `image` char(8) DEFAULT NULL COMMENT '图片的八位ID',
  `gmt_modified` datetime DEFAULT NULL,
  `gmt_created` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `image_post_id_uindex` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=46 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='文章对应的图片资源';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `image`
--

LOCK TABLES `image` WRITE;
/*!40000 ALTER TABLE `image` DISABLE KEYS */;
/*!40000 ALTER TABLE `image` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `post`
--

DROP TABLE IF EXISTS `post`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `post` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `author` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `cover` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `brief` varchar(100) COLLATE utf8_unicode_ci NOT NULL COMMENT '文章摘要',
  `state` varchar(6) COLLATE utf8_unicode_ci DEFAULT '审核中',
  `category` int NOT NULL,
  `watch_num` int DEFAULT '0' COMMENT '观看数',
  `gmt_modified` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `gmt_created` datetime DEFAULT NULL,
  `is_delete` tinyint(1) NOT NULL DEFAULT '0',
  `content` text COLLATE utf8_unicode_ci,
  `theme` varchar(30) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'juejin',
  `code_style` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'atom-one-light',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `sdf` (`author`) USING BTREE,
  KEY `aahs` (`category`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `post`
--

LOCK TABLES `post` WRITE;
/*!40000 ALTER TABLE `post` DISABLE KEYS */;
INSERT INTO `post` VALUES (1,'ES6 - 解构赋值','1',NULL,'## 对象解构 对象的解构赋值在花括号内写需要解构属性的key，可以在冒号后重命名，也可以在等号后给值为undefined的属性赋初始值 ```js const obj = { name: ','已发布',2,13,'2023-02-22 10:25:25','2023-01-25 18:05:41',0,'## 对象解构\n\n对象的解构赋值在花括号内写需要解构属性的key，可以在冒号后重命名，也可以在等号后给值为undefined的属性赋初始值\n\n```js\nconst obj = {\n  name: \'guo\',\n  age: 18,\n  school: undefined,\n  address: \'ShangHai\'\n}\n\nconst { name, age } = obj\nconsole.log(name, age)  //guo 18\n\nconst { school: schoolName = \'SSPU\' } = obj\nconsole.log(schoolName)   //SSPU\n```\n\n应用：引入的库或网络请求返回的结果提取需要的内容\n\n\n\n## 数组解构\n\n数组按照元素的顺序进行解构，可以留空跳过元素\n\n```js\nconst arr = [1, 2, 3, 4, 5]\nconst [x, y, z] = arr\nconsole.log(x, y, z)  //1 2 3\n\nconst [a, , , b] = arr\nconsole.log(a, b)   //1 4\n```','juejin','atom-one-light'),(2,'MySQL 从入门到精通','1',NULL,'SQL通用语法 * SQL语句以分号结尾 * MySQL数据库的SQL语句不区分大小写，关键字建议使用大写 * 3种注释： * 单行注释：(空格)-- 注释内容 ​ #注释内容 * 多','已发布',1,2,'2023-02-22 08:23:18','2023-02-02 22:38:44',0,'## SQL通用语法\n\n   * SQL语句以分号结尾\n\n   * MySQL数据库的SQL语句不区分大小写，关键字建议使用大写\n\n   * 3种注释：\n\n     * 单行注释：(空格)-- 注释内容\n\n       ​                   #注释内容\n\n     * 多行注释：/* 注释 */\n\n## SQL分类\n\n* DDL数据定义语言 -- 用来定义数据库对象\n\n* DML数据操作语言 -- 用来对数据库中表和表中的数据进行增删改\n\n* DQL数据查询语言 -- 用来查询数据库中表中的数据\n\n* DCL数据控制语言 -- 用来定义数据库的访问权限、安全级别和创建用户等等...\n\n## MySQL的基本语法\n\n### 1. DDL语法\n\n1. 创建\n\n   * 创建数据库：\n\n     create database 数据库名称;\n\n   * 判断是否存在，再创建数据库：\n\n     create database if not exists 数据库名称;\n\n   * 创建数据库，并指定字符集：\n\n     create database 数据库名称 character set 字符集名称;\n\n2. 查询\n\n   * 查询所有数据库名称：\n\n     show databases;\n\n   * 查询某个数据库的字符集/查询某个数据库的创建语句：\n\n     show create database 数据库名称;\n\n3. 修改\n\n   * 修改数据库的字符集：\n\n     alter database 数据库名称 character set 字符集名称;\n\n4. 删除\n\n   * 删除数据库：\n\n     drop database 数据库名称;\n\n   * 判断是否存在，再删除数据库：\n\n     drop database if exists 数据库名称;\n\n5. 使用数据库\n\n   * 使用数据库：\n\n     use 数据库名称;\n\n   * 查询当前正在使用的数据库名称：\n\n     select database();\n\n### 2. DML语法\n\n1. 数据类型：\n\n   * int：整数类型 4个字节\n\n     age int\n\n     tinyint 1个字节\n\n     smallint 2个字节\n\n     mediumint 3个字节\n\n   * double：小数类型 8个字节\n\n     共五位数字，小数点后保留两位，\n\n     score double(5，2)\n\n     float 4个字节\n\n   * date：日期类型，只包含年月日，yyyy-MM-dd\n\n   * datatime：日期类型，包含年月日时分秒，yyyy-MM-dd HH:mm:ss\n\n   * timestamp：时间戳类型，包含年月日时分秒，yyyy-MM-dd HH:mm:ss\n\n     如果不给这个字段赋值，或赋值为null，则默认使用当前时间\n\n   * varchar：字符串类型\n\n     name varchar(20)：姓名，最大20个字符\n\n   * decimal 字符串形式的浮点数（解决精度问题）\n\n<hr/>\n\n#### ｜关于表的操作\n\n2. 创建表：\n\n   create table 表名(\n\n   ​	列名1 数据类型1,\n\n   ​	列名2 数据类型2,\n\n   ​	列名3 数据类型3,\n\n   ​	....\n\n   ​	列名n 数据类型n\n\n   );\n\n   * 注意：最后一列，不需要加逗号( ，)\n   * comment 为此列的注释\n\n   ![image-20220715201349430](https://s2.loli.net/2022/07/15/WK75zE9enpBka8v.png)\n\n   ![image-20220715201458227](https://s2.loli.net/2022/07/15/Cg1xLbV2YNFPfyH.png)\n\n2. 查询表\n\n   * 查询数据库中所有的表的名称：\n\n     show tables;\n\n   * 查询表的结构：\n\n     desc 表名;\n\n3. 修改表\n\n   * 修改表名：\n\n     alter table 表名 rename to 新的表名;\n\n   * 修改表的字符集：\n\n     alter table 表名 character set 字符集名称;\n\n   * 添加一列：\n\n     alter table 表名 add 列名 数据类型;\n\n   * 修改列的名称：\n\n     alter table 表名 change 列名  新列名\n\n   * 修改列的数据类型：\n\n     alter table 表名 modify 列名 新数据类型;\n\n4. 删除表\n\n   * 删除表：\n\n     drop table 表名;\n\n   * 判断是否存在，再删除表：\n\n     drop table if exists 表名;\n\n   * 清空表\n\n     truncate 表名 **自增会清零**\n\n     delete from 表名 **不会影响自增**\n\n<hr/>\n\n#### ｜关于表中数据的操作\n\n5. 添加数据\n\n   * insert into 表名(列名1，列名2，列名3) values(值1，值2，值3);\n   * 注意：\n     1. 列名和值要一一对应\n     2. 如果表名后，不定义列名，则给所有列添加值\n     3. 除了数字，其他类型的数据都需要使用引号引起来\n\n6. 删除数据：\n\n   * delete from 表名 [where 条件]\n\n   * 注意：\n\n     1. 如果不佳条件，则删除表中所有记录\n\n     2. 如果要删除所有记录：\n\n        * delete from 表名; -- 不推荐使用，执行效率低\n\n        * TRUNCATE TABLE 表名; -- 推荐使用，执行效率高。\n\n          先删除表，再创建一张一模一样的表\n\n7. 修改数据\n\n   * update 表名 set 列名1 = 值1，列名2 = 值2，....[where 条件];\n   * 注意：如果不加任何条件，会把表中所有记录全部修改。\n\n### 3. DQL语法\n\n#### ｜基础查询\n\n1. 多个字段的查询\n\n   * select 字段名1，字段名2，....from 表名;\n\n2. 查询所有字段 (用*代替所有字段列表)\n\n   * select * from 表名\n\n3. 去除重复\n\n   * distinct\n\n4. 计算列\n\n   * 直接使用四则运算计算一些列的值。(一般只计算数值类的值)\n\n     * select 字段名1，字段名2，字段名1+字段名2 from 表名;\n\n   * null参与计算，计算结果都为null。\n\n     所以需要使用ifnull(表达式1，表达式2);\n\n     * 表达式1:哪个字段需要判断是否为null。\n     * 表达式2:如果该字段为null后的替换值。\n\n5. 起别名\n\n   * select 字段名1 as 别名，字段名2 as 别名，字段名1+字段名2 as 别名 from 表名;\n   * as也可以省略\n\n```mysql\n-- 查询多个\nSELECT name,age FROM students;\n\n-- 别名\nSELECT id,name,chinese,math,english,chinese+math+english as total_score FROM students;\n\n-- 把id为3的人的语文成绩改为null\n-- UPDATE students SET chinese = NULL WHERE id = 3;\nSELECT id AS 编号,name AS 姓名,chinese AS 语文,math AS 数学,english AS 英语,IFNULL(chinese,0)+math+english as 总分 FROM students;\n\n-- 去重，选出数学成绩\nSELECT DISTINCT math FROM students;\n```\n\n\n\n#### ｜条件查询\n\n6. 在where子句后跟条件\n\n   运算符：\n\n   1. <=,>=,=, >,<,<>(不等于),!=\n   2. BETWEEN...AND\n   3. IN(集合)\n   4. LIKE:模糊查询\n      * 占位符：\n        * 单个任意字符：__\n        * 零个或多个任意字符：%\n   5. 判断是否为空：\n      * IS NULL\n      * 注意：NULL不能用等号判断\n   6. 逻辑与：AND 或者 &&\n   7. 逻辑或：OR 或 ||\n   8. 逻辑非：NOT 或 ！\n\n![image-20220715204020834](https://s2.loli.net/2022/07/15/Dv8yUafnTZMzN7P.png)\n\n```mysql\n-- 基本条件查询\n-- 查询年龄大于20岁的人的信息\nSELECT * FROM student WHERE age > 20;\n-- 查询年龄大于等于20岁的人的信息\nSELECT * FROM student WHERE age >= 20;\n-- 查询年龄等于20岁的人的信息\nSELECT * FROM student WHERE age != 20;\n-- 查询年龄不等于20岁的人的信息\nSELECT * FROM student WHERE age <> 20;\n-- 查询年龄大于等于20岁，小于等于30岁的的人的信息(包括20和30)\nSELECT * FROM student WHERE age >= 20 && age <= 30;\nSELECT * FROM student WHERE age >= 20 AND age <= 30;\nSELECT * FROM student WHERE age BETWEEN 20 AND 30;\n\n-- 查询年龄为22岁,18岁,25岁的人的信息\nSELECT * FROM student WHERE age = 22 OR age = 18 OR age = 25;\nSELECT * FROM student WHERE age IN (22,18,25);\n\n-- NULL的判断\n-- 查询英语成绩为null的人的信息\nSELECT * FROM student WHERE english IS NULL;\n-- 查询英语成绩不为null的人的信息\nSELECT * FROM student WHERE english IS NOT NULL;\n\n-- 模糊查询(LIKE)\n-- 查询姓马的人有哪些？\nSELECT * FROM student WHERE name LIKE \"马%\";\n-- 查询姓名第二个字是化的人\nSELECT * FROM student WHERE name LIKE \"_马%\";\n-- 查询姓名是三个字的人\nSELECT * FROM student WHERE name LIKE \"___\";\n-- 查询姓名中包含德的人\nSELECT * FROM student WHERE name LIKE \"%德%\";\n```\n\n#### ｜排序查询\n\n7. 语法：order by 子句\n   * order by 排序字段1 排序方式1，排序字段2 排序方式2....\n   * 注意：如果有多个排序条件，当前面的条件值一样时，才会判断第二条件。\n8. 排序方式\n   * ASC：升序 (默认)\n   * DESC：降序\n\n```mysql\n-- 按照数学成绩降序排列\nSELECT id,`name`,math FROM students ORDER BY math DESC;\n-- 按照语文成绩降序排列，如果语文一样，按照数学成绩降序排序，如果一样按照英语成绩降序排列\nSELECT * FROM students ORDER BY chinese DESC , math DESC , english DESC;\n```\n\n#### ｜聚合函数\n\n9. 计算个数\n   * count ( * )\n   * 一般选择非空的列计算个数 (主键)\n10. 计算最大值\n    * max()\n\n11. 计算最小值\n    * min()\n12. 计算和\n    * sum()\n13. 计算平均值\n    * avg()\n\n* 注意：聚合函数的计算，会排除null值。\n\n  解决方案：\n\n  	1. 选择不包含null值的列进行计算\n  	2. 使用IFNULL函数\n\n```mysql\n-- 计算学生个数\nSELECT COUNT(id) FROM students;\n-- 得到数学成绩最高的人\nSELECT MAX(math) FROM students;\n-- 得到数学成绩最低的人\nSELECT MIN(math) FROM students;\n-- 得到math的和\nSELECT SUM(math) FROM students;\n-- 得到数学平均分\nSELECT AVG(math) FROM students;\n```\n\n#### ｜分页查询\n\n14. 语法：\n\n    limit 开始的索引，每页查询的条数;\n\n15. 开始索引的计算公式：\n\n    开始的索引 = (当前页码 - 1)  * 每页显示的条数\n\n* limit 是一个MySQL的 “方言”。\n\n```mysql\n-- 每页显示3条记录\nSELECT * FROM students LIMIT 0,3; -- 第一页\nSELECT * FROM students LIMIT 3,3; -- 第二页\nSELECT * FROM students LIMIT 6,3; -- 第三页\n```\n\n#### ｜分组查询\n\n16. 语法：\n\n    group by 分组字段;\n\n* 注意：\n\n  1. 分组之后查询的字段：分组字段，聚合函数\n\n  2. where和having的区别：\n\n     * where后不可以跟聚合函数，having可以进行聚合函数的判断。\n\n     * where在分组之前进行限定，如果不满足条件，则不参与分组。\n\n       having在分组之后进行限定，如果不满足条件，则不会被查询出来。\n\n```mysql\n-- 按照性别分组，分别查询男女同学的数学平均分\nSELECT sex , AVG(math) FROM students GROUP BY sex;\n-- 按照性别分组，分别查询男女同学的数学平均分以及人数\nSELECT sex ,AVG(math),COUNT(id) FROM students GROUP BY sex;\n-- 按照性别分组，分别查询男女同学的数学平均分以及人数(分数低于80分不参加分组)\n-- WHERE后不能使用聚合函数\nSELECT sex ,AVG(math),COUNT(id) FROM students WHERE math>80 GROUP BY sex;\n-- 按照性别分组，分别查询男女同学的数学平均分以及人数(分组后，人数小于2人不显示)\n-- HAVING后可以使用聚合函数\nSELECT sex ,AVG(math),COUNT(id) FROM students GROUP BY sex HAVING COUNT(id)>2;\n```\n\n## 约束\n\n>  概念：对表中的数据进行限定，保证数据的正确、有效和完整。\n\n### 1. 约束的分类\n\n* 主键约束：primary key\n* 非空约束：not null\n* 唯一约束：unique\n* 外键约束：foreign key\n\n### 2. 约束的基本语法\n\n#### | 非空约束\n\n1. 创建表时添加约束\n\n   ```mysql\n   CREATE TABLE stu(\n   	id INT,\n       name VARCHAR(20) NOT NULL -- name为非空\n   );\n   ```\n\n2. 创建完表后，添加非空约束\n\n   * alter table 表名 modify 列名 列数据类型 not null;\n\n3. 删除非空约束\n\n   * alter table 表名 modify 列名 列数据类型;\n\n#### | 唯一约束\n\n> 某一列的值不能重复\n\n1. 创建表时，添加唯一约束\n\n   ```mysql\n   CREATE TABLE stu(\n   	id INT,\n       phone_number VARCHAR(20) UNIQUE -- phone_number不能重复\n   );\n   ```\n\n2. 创建完表后，添加唯一约束\n\n   * alter table 表名 modify 列名 列数据类型 unique;\n\n3. 删除唯一约束\n\n   * alter table 表名 drop index 列名;\n\n* 注意：唯一约束可以是null值，但是只能有一条记录为null\n\n#### | 主键约束\n\n> 某一列的值非空且唯一\n\n1. 创建表时，添加主键约束\n\n   ```mysql\n   CREATE TABLE stu(\n   	id INT PRIMARY KEY, -- 给id添加主键约束\n       name VARCHAR(20)\n   );\n   ```\n\n2. 创建完表后，添加主键约束\n\n   * alter table 表名 modify 列名 列数据类型 primary key;\n\n3. 删除主键约束\n\n   * alter table 表名 drop primary key;\n\n* 注意：\n  1. 一张表只能有一个字段为主键\n  2. 主键就是表中记录的唯一标识\n\n#### | 自动增长\n\n> 如果某一列是数值类型的，使用 auto_increment 可以实现值的自动增长\n\n1. 创建表时，添加主键约束，并且实现自动增长\n\n   ```mysql\n   CREATE TABLE stu(\n   	id INT PRIMARY KEY auto_increment, -- 给id添加主键约束，并实现自动增长\n       name VARCHAR(20)\n   );\n   ```\n\n2. 创建完表后，实现自动增长\n\n   * alter table 表名 modify 列名 列数据类型 auto_increment;\n\n3. 删除自动增长\n\n   * alter table 表名 modify 列名 列数据类型;\n\n####｜ 外键约束\n\n> 让表与表产生关系，从而保证数据的正确性\n\n1. 创建表时，添加外键\n\n   ```mysql\n   CREATE TABLE stu(\n     ...\n     外键列 数据类型,\n     constraint 随机外键名称 foreign key 外键列 references 主表名称(主表列名称)\n   );\n   ```\n\n2. 创建表之后，添加外键\n\n   * alter table 表名 add constraint 外键名称 foreign key (外键字段名称) reference 主表名称(主表列名称);\n\n3. 删除外键\n\n   * alter table 表名 drop foreign key 外键名称；\n\n```mysql\n-- 创建部门表\nCREATE TABLE department (\n	dep_id INT PRIMARY KEY AUTO_INCREMENT,\n	dep_name VARCHAR ( 20 ),\n	dep_address VARCHAR ( 40 )\n)\n\n-- 添加部门信息\nINSERT INTO department (\n	dep_id, -- 部门编号\n	dep_name, -- 部门名称\n	dep_address -- 部门地址\n)\nVALUES( NULL, \'第一部门\',\'三楼 04室\'),\n	    ( NULL, \'第二部门\',\'六楼 02室\' );\n\n-- 创建员工表\nCREATE TABLE employees (\n	emp_id INT PRIMARY KEY AUTO_INCREMENT,-- 员工编号\n	emp_name VARCHAR ( 20 ),-- 员工姓名\n	emp_age INT,-- 员工年龄\n	emp_sex VARCHAR ( 5 ),-- 员工性别\n	emp_depId INT,-- 员工所在部门编号\n	CONSTRAINT emp_dep_fk FOREIGN KEY ( emp_depId ) REFERENCES department ( dep_id )\n)\n-- 添加员工数据\nINSERT INTO employees (\n	emp_id, -- 编号\n	emp_name, -- 姓名\n	emp_age, -- 年龄\n	emp_sex, -- 性别\n	emp_depId -- 员工所在部门编号\n)\nVALUES\n	( NULL,\"倪成凯\", 17, \'男\', 1 ),\n	( NULL,\"陈剑峰\", 18, \'男\', 1 ),\n	( NULL,\"陈好\", 17, \'女\', 2 ),\n	( NULL,\"孙若楠\", 17, \'女\', 2 );\n\n\n	SELECT * FROM employees;\n	SELECT * FROM department;\n```\n\n\n\n#### | 级联操作\n\n> 主表和外表的关联操作，即 删除/修改 主表信息后联动 删除/修改 外表信息\n\n1. 添加级联操作\n\n   ```mysql\n   CREATE TABLE stu(\n     ...\n     外键列 数据类型,\n     constraint 随机外键名称 foreign key 外键列 references 主表名称(主表列名称) on update cascade on delete cascade\n   );\n   ```\n\n2. 分类\n\n   * 级联更新：on update cascade\n   * 级联删除：on delete cascade\n\n## 数据库的设计\n\n### 1. 多表之间的关系\n\n* 分类\n\n  1. 一对一\n     * 例如：人和身份证\n     * 分析：一个人只能有一张身份证，一张身份证只能对应一个人\n  2. 一对多\n     * 例如：部门和员工\n     * 分析：一个部门有很多员工，一个员工只能对应一个部门\n  3. 多对多\n     * 例如：学生和课程\n     * 分析：一个学生能选择很多门课程，一个课程也可以被很多学生选择\n\n* 实现\n\n  1. 一对多\n\n     * 例如：部门和员工\n\n     * 实现方式：在员工表建立外键，指向部门表的主键\n\n       **employees表**\n\n       | emp_id | emp_name | emp_dep_id |\n       | :----: | :------: | :--------: |\n       |   1    |  倪成凯  |     1      |\n       |   2    |  陈剑峰  |     1      |\n       |   3    |   陈好   |     2      |\n       |   4    |  孙若楠  |     2      |\n\n       **department表**\n\n       | dep_id | dep_name | dep_address |\n       | :----: | :------: | :---------: |\n       |   1    | 第一部门 |     304     |\n       |   2    | 第二部门 |     602     |\n\n\n  2. 多对多\n\n     * 例如：学生和课程\n\n     * 实现方式：需要第三张中间表，中间表至少包含两个字段，这两个字段分别作为学生表和课程表的外键\n\n       **student表**\n\n       | s_id | s_name | age  |\n       | :--: | :----: | :--: |\n       |  1   |  张三  |  17  |\n       |  2   |  李四  |  18  |\n       |  3   |  王五  |  17  |\n\n       **student_class中间表**\n\n       | s_id | c_id |\n       | :--: | :--: |\n       |  1   |  1   |\n       |  1   |  2   |\n       |  3   |  2   |\n\n       **class表**\n\n       | c_id | c_name |\n       | :--: | :----: |\n       |  1   |  语文  |\n       |  2   |  数学  |\n\n\n### 2. 范式相关概念\n\n1. 函数依赖\n   * A --> B，通过A属性（属性组）的值，可以确定唯一B的属性值。\n2. 完全函数依赖\n   * A --> B，A是一个属性组，B属性值需要确定依赖于A属性组里的所有值\n3. 部分函数依赖\n   * A --> B，A是一个属性组，B属性值依赖于A属性组的某一些值即可\n4. 传递函数依赖\n   * A -->B , B-->C，A属性（属性组）的值可以确定唯一B的属性值，再通过B属性（属性组）的值可以确定唯一C属性的值，则称C传递函数依赖于A\n5. 码\n   * 如果在一张表中，一个属性或一个属性组，被其他属性完全依赖，则称这个属性（属性组）为该表的码\n\n### 3. 三大范式\n\n#### ｜概念\n\n1. **满足第一范式才能创建数据库的表。**\n\n   第一范式（1NF）：要求数据库表的每一列都是不可分割的基本数据项，同一列中不能有多个值。\n\n2. **满足第二范式（2NF）必须先满足第一范式（1NF）。**\n\n   第二范式（2NF）：要求实体中没一行的所有非主属性都必须完全依赖于主键；即：非主属性必须完全依赖于主键。\n\n3. **满足第三范式（3NF）必须先满足第二范式。**\n   第三范式（3NF）：要求实体中的属性不能是其他实体中的非主属性。因为这样会出现冗余。即：属性不依赖于其他非主属性。\n\n<hr/>\n\n#### ｜示例\n\n##### 第一范式\n\n存在的问题：\n\n1. 存在非常严重的数据冗余\n   * 姓名、系名、系主任 数据大量重复\n2. 数据添加存在问题\n   * 添加没有学生的系和系主任的时候，数据不合法\n3. 数据删除存在问题\n   * 删除同学时，会将系的数据一起删除\n\n| 学号 |  姓名  |   系名   | 系主任 |  课程名称  | 分数 |\n| :--: | :----: | :------: | :----: | :--------: | :--: |\n|  1   | 倪成凯 | 计算机系 |  张三  |  高等数学  |  95  |\n|  1   | 倪成凯 | 计算机系 |  张三  |  大学英语  |  87  |\n|  1   | 倪成凯 | 计算机系 |  张三  | 计算机基础 |  75  |\n|  2   |  顾晨  |  金融系  |  李四  |  高等数学  |  77  |\n|  2   |  顾晨  |  金融系  |  李四  |  大学英语  |  87  |\n|  2   |  顾晨  |  金融系  |  李四  | 计算机基础 |  65  |\n|  3   |  陈好  |  商务系  |  王五  |  高等数学  |  95  |\n|  3   |  陈好  |  商务系  |  王五  |  大学英语  |  97  |\n|  3   |  陈好  |  商务系  |  王五  | 计算机基础 |  99  |\n\n##### 第二范式\n\n存在的问题：\n\n1. 数据添加存在问题\n   * 添加没有学生的系和系主任的时候，数据不合法\n\n2. 数据删除存在问题\n   * 删除同学时，会将系的数据一起删除\n\n1. **成绩表**\n\n| 学号 |  课程名称  | 分数 |\n| :--: | :--------: | :--: |\n|  1   |  高等数学  |  95  |\n|  1   |  大学英语  |  87  |\n|  1   | 计算机基础 |  75  |\n|  2   |  高等数学  |  77  |\n|  2   |  大学英语  |  87  |\n|  2   | 计算机基础 |  65  |\n|  3   |  高等数学  |  95  |\n|  3   |  大学英语  |  97  |\n|  3   | 计算机基础 |  99  |\n\n2. **学生表**\n\n| 学号 |  姓名  |   系名   | 系主任 |\n| :--: | :----: | :------: | :----: |\n|  1   | 倪成凯 | 计算机系 |  张三  |\n|  2   |  顾晨  |  金融系  |  李四  |\n|  3   |  陈好  |  商务系  |  王五  |\n\n##### 第三范式\n\n1. **成绩表**\n\n| 学号 |  课程名称  | 分数 |\n| :--: | :--------: | :--: |\n|  1   |  高等数学  |  95  |\n|  1   |  大学英语  |  87  |\n|  1   | 计算机基础 |  75  |\n|  2   |  高等数学  |  77  |\n|  2   |  大学英语  |  87  |\n|  2   | 计算机基础 |  65  |\n|  3   |  高等数学  |  95  |\n|  3   |  大学英语  |  97  |\n|  3   | 计算机基础 |  99  |\n\n2. **学生表**\n\n| 学号 |  姓名  |   系名   |\n| :--: | :----: | :------: |\n|  1   | 倪成凯 | 计算机系 |\n|  2   |  顾晨  |  金融系  |\n|  3   |  陈好  |  商务系  |\n\n3. **系表**\n\n|   系名   | 系主任 |\n| :------: | :----: |\n| 计算机系 |  张三  |\n|  金融系  |  李四  |\n|  商务系  |  王五  |\n\n## 多表查询\n\n### 1. 笛卡尔积\n\n* 有两个集合A和B，取这两个集合的所有组成情况（A*B）\n* 要多表查询，需要清除无用数据\n\n### 2. 多表查询的基本语法\n\n#### ｜内连接查询\n\n##### 隐式内连接\n\n* select * from 表名,表名 where 表名.列名 = 表名.列名\n\n```mysql\nSELECT * FROM tab_user,tab_favorite WHERE tab_user.u_id = tab_favorite.u_id;\n```\n\n##### 显式内连接\n\n* select * from 表名1 [inner]  join 表名2 on 条件\n\n```mysql\nSELECT * FROM tab_user INNER JOIN tab_favorite ON tab_user.u_id = tab_favorite.u_id;\n```\n​	*INNER* 可省略\n\n```mysql\nSELECT * FROM tab_user JOIN tab_favorite ON tab_user.u_id = tab_favorite.u_id;\n```\n\n  ***标准写法***\n\n```mysql\n-- 隐式内连接\nSELECT\n	tab_user.u_id,\n	tab_user.u_name,\n	tab_user.real_name,\n	music_info.info_name,\n	music_info.price\nFROM\n	tab_user,\n	tab_favorite,\n	music_info\nWHERE\n	tab_user.u_id = tab_favorite.u_id AND tab_favorite.info_id = music_info.info_id;\n\n-- 显式内连接\nSELECT\n	*\nFROM tab_user JOIN tab_favorite\nON\n	tab_user.u_id = tab_favorite.u_id;\n```\n\n![image-20210928102716437](/Users/nichengkai/Library/Application Support/typora-user-images/image-20210928102716437.png)\n\n#### ｜外连接查询\n\n##### 左外连接\n\n* select 字段列表 from 表1 left [outer] join 表2 on条件;\n* 查询的是左边的表的所有数据以及右边表和左边表的交集\n\n##### 右外连接\n\n* select 字段列表 from 表1 right [outer] join 表2 on条件;\n* 查询的是右边的表的所有数据以及左边表和右边表的交集\n\n![image-20220715202022036](https://s2.loli.net/2022/07/15/1Vkhsnt5D8pXbJP.png)\n\n#### ｜子查询\n\n> 查询中嵌套查询，称嵌套查询为子查询\n\n```mysql\n-- 子查询\n-- 查询价格最贵的歌曲的信息\nSELECT * FROM music_info WHERE music_info.price = (SELECT MAX(price) FROM music_info);\n\n-- 子查询可以作为一张虚拟表参与查询\n-- 查询员工入职日期是 2011-11-11 以后的员工信息和部门信息\nSELECT\n	*\nFROM\n	dept t1,(SELECT * FROM emp WHERE emp.`join_date` > \'2011-11-11\') t2\nWHERE\n	t1.`id` = t2.`dept_id`;\n\n-- 普通内连接\n-- 时间可以直接使用字符串进行比较\nSELECT * FROM emp t1,dept t2 WHERE t1.`id` = t2.`dept_id` AND emp.`join_date` > \'2011-11-11\';\n```\n\n## 事务\n\n### 1. 基本介绍\n\n#### ｜概念\n\n1. 如果一个包含多个步骤的业务操作，被事务管理，那么这些操作要么同时成功，要么同时失败。\n\n2. MySQL事务主要用来处理数据量大、数据复杂度高的数据操作，最经典的使用场景是银行的转账：需要先从银行账户A中取出钱，然后再存入银行账户B中，如果中间出现问题，而没有事务的保证，那么就会出现B收不到钱，而A支出钱又回不到自己的账户的严重问题，那么有了事务机制，这个问题就解决了。\n\n#### ｜语法\n\n1. 开启事务：start transaction;\n\n2. 回滚：rollback;\n\n3. 提交：commit;\n\n4. ⚠️事务的提交方式\n\n   **自动提交：**\n\n   	1. MySQL数据库默认自动提交事务\n   	2. 一条DML（增删改）语句会自动提交一次事务\n\n   **手动提交：**\n\n   1. Oracle数据库默认手动提交事务\n   2. 需要先开启事务，再提交\n\n### 2. 四大特征\n\n1. 原子性：是不可分割的最小操作单位，要么同时成功，要么同时失败。\n2. 持久性：当事务提交或回滚后，数据库会持久化的保存数据。\n3. 隔离性：多个事务之间，相互独立。\n4. 一致性：事务操作前后，数据总量不变。\n\n### 3. 隔离级别（了解）\n\n#### ｜概念\n\n1. 多个事务之间隔离的，相互独立的。\n\n   但是如果多个事务操作同一批数据，则会引发***一些问题***，设置不同的隔离级别就可以解决这些问题。\n\n2. 存在的问题：\n\n   - 脏读：一个事务，读取到另一个事务中没有提交的数据\n   - 不可重复读（虚读）：在同一个事务中，两次读取到的数据不一样\n   - 幻读：一个事务操作（DML）数据表中所有记录，另一个事务添加了一条数据，则第一个事务查询不到自己的修改。\n\n#### ｜隔离级别\n\n1. read uncommitted：读未提交\n   * 产生的问题：脏读、不可重复读、幻读\n2. read committed：读已提交（Oracle默认）\n   * 产生的问题：不可重复读、幻读\n3. repeatable read：可重复读（MySQL默认）\n   * 产生的问题：幻读\n4. serializable：串行化\n   * 可以解决所有的问题\n\n* ⚠️注意：隔离级别从小到大安全性越来越高，但是效率越来越低\n\n#### ｜语法\n\n1. 查询数据库隔离级别\n   * select @@tx_isolation;\n2. 设置数据库隔离级别\n   * set global transaction isolation level 级别字符串;\n\n## 权限管理（DCL）\n\n1. DBA：数据库管理员\n\n2. 管理用户\n\n   - 添加用户：\n\n     CREATE USER \'用户名\'@\'主机名\' IDENTIFIED BY \'密码\';\n\n   - 删除用户：\n\n     DROP USER \'用户名\'@\'主机名\';\n\n   - 修改用户密码：\n\n     UPDATE USER SET PASSWORD = PASSWOED(\'新密码\') WHERE USER = \'用户名\';\n\n     SET PASSWORD FOR \'用户名\'@\'主机名\' = PASSWORD(\'新密码\');\n\n     ```mysql\n     -- 方式1\n     UPDATE USER SET PASSWORD = PASSWOED(\'123456\') WHERE USER = \'张三\';\n     -- 方式2（推荐）\n     SET PASSWORD FOR \'root\'@ \'localhost\' = PASSWORD(\'1234\');\n     ```\n\n   - 查询用户：⚠️必须切换到mysql数据库才能查询用户\n\n     ```mysql\n     -- 切换到mysql数据库\n     USE mysql;\n     -- 查询mysql数据库的user表\n     SELECT * FROM USER;\n      \n     -- 通配符：%表示可以在任意主机使用用户登录数据库\n     ```\n\n3. 权限管理\n\n   - 查询权限\n\n     SHOW GRANTS FOR \'用户名\'@\'主机名\';\n\n     ```mysql\n     	-- 查询root用户的权限\n     	USE mysql;\n     	SHOW GRANTS FOR \'root\'@\'localhost\';\n     ```\n\n   - 授予权限\n\n     GRANT 权限1,权限2... ON 数据名.表名 TO \'用户名\'@\'主机名‘；\n\n     ```mysql\n     -- 给张三用户授予所有权限，在任意数据库的任意表上\n     GRANT ALL ON *.* TO \'张三\'@\'localhost\';\n\n     -- 通配符：ALL表示所有权限\n     ```\n\n   - 撤销权限\n\n     REVOKE 权限1,权限2... ON 数据库名.表名 FROM \'用户名\'@\'主机名‘;\n\n     ```mysql\n     -- 移除张三用户在db1数据库，t1表上的删除权限\n     REVOKE delete ON db1.t1 FROM \'张三\'@\'localhost‘;\n     ```\n\n\n## 索引\n\n> 在一个表中，主键索引只能有一个，唯一索引可以有很多个\n\n1. 主键索引（PRIMARY KEY）\n   * 唯一的标志，只有一个列作为主键\n2. 唯一索引（UNIQUE KEY）\n   * 唯一索引可以重复，多个列都可以标识为唯一索引\n3. 常规索引（KEY/INDEX）\n   * 默认的\n4. 全文索引（FullText）\n   * 快速定位数据\n   * 建立索引耗时耗空间\n\n```sql\n# 低效的模糊查询\nSELECT * FROM article WHERE content LIKE ‘%查询字符串%’;\n\n# 为频繁查询的字段设置全文索引\nCREATE TABLE `article` (\n  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,\n  `title` varchar(200) DEFAULT NULL,\n  `content` text,\n  PRIMARY KEY (`id`),\n  # title 为全文索引名\n  FULLTEXT KEY `title` (`title`,`content`)\n)CHARSET=utf8;\n\n# 改变字段为全文索引\n# fulltext_article 为全文索引名\nALTER TABLE article ADD FULLTEXT INDEX fulltext_article(title,content);\n\n# 用特定的语法使用全文索引查询\nSELECT * FROM article WHERE MATCH(title,content) AGAINST (‘查询字符串’);\n```\n\n\n\n## 数据的导入导出\n\n### 1. 导入\n\n```sql\n# 先登录\nmysql -hlocalhost -uroot -p123456\n\n# 导入备份文件\nsource D:/test_db.sql\n```\n\n### 2. 导出\n\n```sql\nmysqldump -hlocalhost -uroot -p[密码] [数据库名] [表名(可选)] >[物理磁盘位置/文件名]\n\n# 例子\nmysqldump -hlocalhost -uroot -p123456 test_db >D:/test_db.sql\nmysqldump -hlocalhost -uroot -p123456 test_db table1 >D:/test_db.sql\n```\n\n## 密码的加密存储\n\n> MD5 加密为不可逆加密，相同内容加密后的结果相同。所以只能对比用户输入、加密后的内容与数据库加密后的密码是否相同来验证密码是否正确\n\n![image-20220715204242755](https://s2.loli.net/2022/07/15/PoB7AXmaQlejnFz.png)\n','juejin','atom-one-light'),(3,'Docker 从入门到精通','1',NULL,'帮助命令 镜像命令 docker images 查看所有本地主机上的镜像 docker search 搜索镜像 docker pull 下载镜像 docker rmi 删除镜像 容器命令(虚拟机) 有','审核中',1,10,'2023-02-24 07:08:53','2023-02-02 22:41:11',0,'## 帮助命令\n\n```bash\ndocker version\ndocker info\ndocker 命令 --help\n```\n\n## 镜像命令\n\n**docker images** 查看所有本地主机上的镜像\n\n```bash\nnichengkai at nichengkaideMacBook-Pro in ~\n$ docker images\nREPOSITORY    TAG       IMAGE ID       CREATED         SIZE\nhello-world   latest    18e5af790473   9 months ago    9.14kB\nubuntu        latest    26b77e58432b   15 months ago   72.9MB\n\n# 参数解释\nREPOSITORY 镜像仓库源\nTAG 镜像标签\nIMAGE ID 镜像ID\nCREATED 创建时间\nSIZE 镜像大小\n\n# 列出所有镜像\nnichengkai at nichengkaideMacBook-Pro in ~\n$ docker images -a\nREPOSITORY    TAG       IMAGE ID       CREATED         SIZE\nhello-world   latest    18e5af790473   9 months ago    9.14kB\nubuntu        latest    26b77e58432b   15 months ago   72.9MB\n\n# 只显示镜像 ID\nnichengkai at nichengkaideMacBook-Pro in ~\n$ docker images -q\n18e5af790473\n26b77e58432b\n```\n\n**docker search** 搜索镜像\n\n```bash\nnichengkai at nichengkaideMacBook-Pro in ~\n$ docker search node\nNAME                              DESCRIPTION                                     STARS     OFFICIAL   AUTOMATED\nnode                              Node.js is a JavaScript-based platform for s…   11630     [OK]\nmongo-express                     Web-based MongoDB admin interface, written w…   1185      [OK]\n\n# 搜索可选项\n-- filter=STARS=3000 # STARS 大于 3000\n```\n\n**docker pull** 下载镜像\n\n```bash\n# docker pull 镜像名[:tag]\nnichengkai at nichengkaideMacBook-Pro in ~\n$ docker pull mysql\nUsing default tag: latest # 默认使用最新版(tag)\n\n# 参数解释\nlatest: Pulling from library/mysql\nlatest: Pulling from library/mysql\n45b42c59be33: Pull complete # 联合文件系统\nb4f790bd91da: Pull complete # 文件分层，其他版本公共部分不会重复下载\n325ae51788e9: Pull complete\nadcb9439d751: Pull complete\n174c7fe16c78: Pull complete\n698058ef136c: Pull complete\n4690143a669e: Pull complete\nf7599a246fd6: Pull complete\n35a55bf0c196: Pull complete\n790ac54f4c47: Pull complete\nb0ddd5d1b543: Pull complete\n1aefd67cb33d: Pull complete\nDigest: sha256:03306a1f248727ec979f61424c5fb5150e2c5fd2436f2561c5259b1258d6063c\nStatus: Downloaded newer image for mysql:latest\ndocker.io/library/mysql:latest\n\n# 指定下载版本\nnichengkai at nichengkaideMacBook-Pro in ~\n$ docker pull mysql:5.7\n```\n\n**docker rmi** 删除镜像\n\n```bash\n$ docker images\nREPOSITORY    TAG       IMAGE ID       CREATED         SIZE\nhello-world   latest    18e5af790473   9 months ago    9.14kB\nubuntu        latest    26b77e58432b   15 months ago   72.9MB\nmysql         latest    8457e9155715   16 months ago   546MB\n\n# 根据镜像 ID 删除\n# 删除多个镜像 docker rmi [id] [id] [id]\nnichengkai at nichengkaideMacBook-Pro in ~\n$ docker rmi 26b77e58432b\nUntagged: ubuntu:latest\nUntagged: ubuntu@sha256:5403064f94b617f7975a19ba4d1a1299fd584397f6ee4393d0e16744ed11aab1\nDeleted: sha256:26b77e58432b01665d7e876248c9056fa58bf4a7ab82576a024f5cf3dac146d6\nDeleted: sha256:9de65d1e8b2782409b2420bf9347003a43e91bb65c1e4c8fbd7d098d6234f359\nDeleted: sha256:e0f8e3acb2bf7fe9384463ae7009179d299b211e7cf17c2bf9d8e5e248cfe5b0\nDeleted: sha256:0e64bafdc7ee828d0f3995bebfa388ced52a625ad2969eeb569f4a83db56d505\n\nnichengkai at nichengkaideMacBook-Pro in ~\n$ docker images\nREPOSITORY    TAG       IMAGE ID       CREATED         SIZE\nhello-world   latest    18e5af790473   9 months ago    9.14kB\nmysql         latest    8457e9155715   16 months ago   546MB\n\n# 递归删除所有镜像\nnichengkai at nichengkaideMacBook-Pro in ~\n$ docker rmi $(docker images -aq)\nUntagged: mysql:latest\nUntagged: mysql@sha256:03306a1f248727ec979f61424c5fb5150e2c5fd2436f2561c5259b1258d6063c\nDeleted: sha256:8457e9155715d4e1c80c9e048d94c9b47b5b733fa927756280382dd326403644\nDeleted: sha256:f0d02d3f5fc5a0f745bf3a97ec0b26c6b2d8b05288d98d954eeb87c4a6d47146\nDeleted: sha256:bf1129a8799d8beaafa396d6333a3ba6eac9d0d7f606491f9794c470fb2dd311\nDeleted: sha256:4386f82820992c927b924177ed3e4c2ffd477d4db7a63539ac76fd09ee36cd89\nDeleted: sha256:d7494c9168a11444d8b13558068409ace7393452f08f878686eec45122ee56c1\nDeleted: sha256:08dbcab3fe630e39bbabaa9f0ae72ec6d100bf1e400ebb4b7f04151b18bca89c\nDeleted: sha256:c3f78dcd6bcc4c156554296323e0eed74a4d2d93b304be15f55c1ef62dd06e0a\nDeleted: sha256:f89b66495a65489290c8edb71e0dbf9e3d0d6213b82cebc2554b271599f2f99d\nDeleted: sha256:1918839317d9988ff5e0168e336717e32820af1e77c3121297efc73a387ecdc5\nDeleted: sha256:1d2bcd52664a92805e5f49d94d3649323dd0f5682ae3e1380fa07b7a54d6ceb0\nDeleted: sha256:787de05fee96c7ba99e49f17d72aec68769a7373a8881a27917bdbf83dca58e8\nDeleted: sha256:eb82f9a2fbd7a4a0fdfbe40b5e77a995ccf73ab91364d90f4db820fd59dbf63b\nDeleted: sha256:9eb82f04c782ef3f5ca25911e60d75e441ce0fe82e49f0dbf02c81a3161d1300\nError response from daemon: conflict: unable to delete 18e5af790473 (must be forced) - image is being used by stopped container a4b36fcef8a6\n```\n\n\n\n## 容器命令(虚拟机)\n\n**有镜像才能创建容器，这里下载一个 centos 环境**\n\n```shell\ndocker pull centos\n```\n\n**新建容器并启动**\n\n```shell\ndocker run [可选参数] image\n\n# 参数说明\n--name=\"name\" 容器命名\n-d 后台运行\n-it 交互运行\n-p 指定容器端口(主机端口：容器端口)\n\n# 进入容器\nnichengkai at nichengkaideMacBook-Pro in ~\n$ docker run -it centos\n[root@a72b91341740 /]# ls\nbin  etc   lib	  lost+found  mnt  proc  run   srv  tmp  var\ndev  home  lib64  media       opt  root  sbin  sys  usr\n\n# 退出容器\n[root@a72b91341740 /]# exit\nexit\n```\n\n**列出容器**\n\n```shell\n# 列出所有正在运行的容器\nnichengkai at nichengkaideMacBook-Pro in ~\n$ docker ps\nCONTAINER ID   IMAGE     COMMAND   CREATED   STATUS    PORTS     NAMES\n\n# 参数说明\n-a 列出历史运行容器以及正在运行容器\n-n=? # 显示最近创建的容器\n-q # 只显示容器编号\n-aq # 显示所有容器的编号\n\nnichengkai at nichengkaideMacBook-Pro in ~\n$ docker ps -a\nCONTAINER ID   IMAGE     COMMAND       CREATED              STATUS                      PORTS     NAMES\na72b91341740   centos    \"/bin/bash\"   About a minute ago   Exited (0) 38 seconds ago             adoring_euler\n```\n\n**退出容器**\n\n```shell\nexit # 停止容器并退出\nctrl + P + Q # 容器不停止退出\n```\n\n**删除容器**\n\n```shell\n# 删除单个容器\ndocker rm [id]\n\n# 强制删除所有容器\ndocker rm -f $(docker ps -aq)\ndocker ps -aq|xargs docker rm\n```\n\n**启动/停止 容器**\n\n```shell\n# 启动\ndocker start [id]\n# 重启\ndocker restart [id]\n# 停止当前正在运行的容器\ndocker stop [id]\n# 强制停止当前正在运行的容器\ndocker kill [id]\n```\n\n**后台启动容器**\n\n```shell\n# 后台运行的容器如果没有前台进程就会自动停止\nnichengkai at nichengkaideMacBook-Pro in ~\n$ docker run -d centos\na25bb1c5c0445e0614931e52f7448ea89a6ab09ebc3a5fbae0b0d03dfcb05ff4\n```\n\n**查看日志**\n\n```shell\ndocker logs -ft -tail [number] [id]\n\n# 参数解释\n-tf #显示日志\n-tail [number] # 显示条数\n```\n\n**查看容器中的进程信息**\n\n```shell\ndocker top [id]\n```\n\n**查看镜像的元数据**\n\n```shell\ndocker inspect [id]\n```\n\n**进入 docker 容器**\n\n```shell\n# 进入容器后开启一个新的终端\ndocker exec [id]\n\n# 进入容器正在执行的终端\ndocker attach [id]\n\n# 将 docker 中的文件拷贝到主机上\ndocker cp [id]:[src path] [dst path]\n```\n\n## 阶段练习\n\n#### 部署 Nginx 服务\n\n```shell\n# 搜索\ndocker search nginx\n# 下载\ndocker pull nginx\n# 启动\n# 后台运行\n# 设置名称\n# nginx 默认 80 端口映射到本机 3344 端口\ndocker run -d --name nginx01 -p 3344:80 nginx\n# 查看状态\nnichengkai at nichengkaideMacBook-Pro in ~\n$ docker ps\nCONTAINER ID   IMAGE     COMMAND                  CREATED          STATUS          PORTS                  NAMES\ndf48081bbb93   nginx     \"/docker-entrypoint.…\"   22 seconds ago   Up 20 seconds   0.0.0.0:3344->80/tcp   nginx01\n# 打开浏览器查看 nginx 欢迎页\nhttp://localhost:3344\n\n# 进入容器\n$ docker exec -it nginx01 /bin/bash\nroot@df48081bbb93:/# whereis nginx\nnginx: /usr/sbin/nginx /usr/lib/nginx /etc/nginx /usr/share/nginx\n```\n\n#### 部署 Node 服务\n\n```shell\n# 停止后自动删除(测试)\ndocker run -it --rm node\n\n# 没有镜像会自动下载\ndocker run -it -p 3355:3000 node\n# git 拉取代码\ngit clone https://gitee.com/ken200461/apple-official-website.git\n# 安装 web 服务包\nnpm i -g anywhere\n# 打开浏览器查看网页\nhttp://localhost:3355\n```\n\n## Commit 自定义镜像\n\n```shell\n# 启动一个默认的tomcat\n# 发现缺少内容\n# 拷贝入容器内\n# 提交为新镜像\ndocker commit -m=\"提交描述\" -a=\"作者\" [id] [name]:[version]\n```\n\n## 容器数据卷\n\n同步容器内外文件夹\n\n### 使用数据卷\n\n> 方式一：匿名挂载\n\n```shell\n# host 主机目录\n# docker 容器内目录\ndocker run -it -v [host]:[docker] [name] /bin/bash\n\n# 查看是否挂载成功\ndocker inspect [id]\n```\n\n![image-20220708165208479](https://s2.loli.net/2022/07/08/Okbc9hvKHR7fWrT.png)\n\n> 方式二：具名挂载\n\n```shell\n# name 卷名\n# path 容器内路径\ndocker run -v [name]:[path]\n```\n\n> 方式三：指定路径挂载\n\n```shell\n# host_path 宿主机路径\n# docker_path 容器内路径\ndocker run -v [host_path]:[docker_path]\n```\n\n### 改变数据卷权限\n\n```shell\n# 在 -v 容器内路径后添加 :ro / :rw 改变读写权限\n\n# ro readonly 只读\n# rw readwrite 可读可写\ndocker run -d -P --name nginx [name]:/etc/nginx:ro nginx\ndocker run -d -P --name nginx [name]:/etc/nginx:rw nginx\n```\n\n## DockerFIle\n\n### 初识 DockerFile\n\n```shell\n# 指令全部为大写\n# 添加基础镜像\nFROM centos\n\n# 添加两个容器数据卷，属于匿名挂载\nVOLUME [\"volume01\", \"volume02\"]\n\n# 容器构建完成输出的信息\nCMD echo \"----- DONE -----\"\n\n# 指定终端命令\nCMD /bin/bash\n```\n\n![image-20220709210131693](https://s2.loli.net/2022/07/09/j8KYpemofBh5bO3.png)\n','juejin','atom-one-light'),(15,'希尔排序','1',NULL,'8.3 希尔排序 思想：先让表中元素部分有序，逐渐逼近全局有序 希尔排序是不稳定的 时间复杂度O(n^1.3) ~ O(n^2) !','审核中',7,1,'2023-02-25 14:06:50','2023-02-25 14:06:47',0,'# 8.3 希尔排序\r\n\r\n思想：先让表中元素部分有序，逐渐逼近全局有序\r\n\r\n希尔排序是不稳定的\r\n\r\n时间复杂度O(n^1.3) ~ O(n^2)\r\n\r\n![image-20220328094816111](https://pics-1310552122.cos.ap-shanghai.myqcloud.com/img/202203280948350.png)\r\n\r\n```c\r\nvoid shellSort(int arr[], int n) {\r\n  int d, i, j;\r\n  for(d = n / 2; d >= 1; d = d / 2) { //分组，增量每次减半\r\n    for(i = d; i < n; i++) { //i从每个子表的第二个元素开始，且子表不是单独比较而是并行比较\r\n      if(arr[i] < arr[i-d]) { //若当前元素小于前驱\r\n        int temp = arr[i];  //用temp暂存当前元素\r\n        for(j = i - d; j >= 0 && arr[j] > temp; j = j -d) {\r\n          arr[j+d] = arr[j];  //将大于temp的后移\r\n        }\r\n        arr[j+d] = temp;  //复制到插入位置\r\n      }\r\n    }\r\n  }\r\n}\r\n```\r\n\r\n','jzman','atom-one-light'),(16,'安卓测试文章','1',NULL,'# 一篇假文章\n\n# 一篇假文章\n\n# 一篇假文章\n\n> 一段话','已发布',3,3,'2023-02-26 00:08:35','2023-02-25 14:08:02',0,'# 一篇假文章\n\n# 一篇假文章\n\n# 一篇假文章\n\n> 一段话','hydrogen','atom-one-light'),(17,'面向对象','1',NULL,'6.1 面向对象 在JavaScript中，万物皆是对象。','已发布',2,2,'2023-02-26 00:08:14','2023-02-25 16:15:01',0,'# 6.1 面向对象\r\n\r\n在JavaScript中，**万物皆是对象**。对象是一个变量，也是一个容器，包含了属性和方法\r\n\r\n面向对象编程：它将真实世界各种复杂的关系，抽象为一个个对象，然后由对象之间的分工与合作，完成对真实世界的模拟\r\n\r\n创建对象的两种方式\r\n\r\n- 字面量创建\r\n- 通过 new 构造方法创建\r\n\r\n\r\n\r\n## 面向对象四要素\r\n\r\n- 抽象：抽象讲的是如何隐藏方法的具体实现，让调用者只需要关心方法提供了哪些功能，并不需要知道这些功能是如何实现的\r\n- 封装：封装是把数据和操作数据的方法绑定起来，对数据的访问只能通过已定义的接口，外部无法随意地访问或修改数据\r\n- 继承：继承是从已有类得到继承信息创建新类的过程，子类拥有父类除私有外的所有的属性和方法，也可以用自己的方式实现父类的方法\r\n- 多态：同样的对象引用调用同样的方法但是做了不同的事情。比如子类重写了父类的方法，或者实现了某个接口\r\n\r\n\r\n\r\n## 创建类与实例化对象\r\n\r\n具有**相同属性和方法的对象的抽象集合**就是类，类是一个抽象的概念，对象则是类的具体实例\r\n\r\n在ES6之前，JavaScript没有class这个概念，通过构造方法模拟类，底层通过原型继承实现\r\n\r\n```js\r\nconst Person = function(name, birth) {\r\n  this.name = name\r\n  this.birth = birth\r\n}\r\n\r\nconst guo = new Person(\'guo\', 2003)\r\n```\r\n\r\n在ES6之后，引入了class关键字，可以实现传统类与继承，但实际上只是一个语法糖，底层也是通过原型继承实现\r\n\r\n```js\r\n//定义父类\r\nclass Person {\r\n  constructor(name) {\r\n    this.name = name\r\n  }\r\n  drink() {\r\n    console.log(\"喝水\")\r\n  }\r\n}\r\n\r\n//定义子类继承父类\r\nclass student extends Person {\r\n	constructor(name, score) {\r\n		super(name)\r\n    this.score = score\r\n	}\r\n  introduce() {\r\n    console.log(`我叫${this.name}，考了${this.score}分`)\r\n  }\r\n}\r\n\r\n//实例化并调用方法\r\nconst student = new Student(\'guo\', 99)\r\nstudent.introduce()	//我叫guo，考了99分\r\nstudent.drink()	//喝水\r\n```\r\n\r\n','channing-cyan','brown-paper'),(19,'原型与原型链','1',NULL,'6.2 原型与原型链 原型 原型对象：每个构造函数function Fn() {}都会自动生成一个prototype属性，指向一个默认空对象，这个对象就是原型对象 隐式原型：实例对象的__proto_','已发布',2,2,'2023-02-26 00:08:28','2023-02-25 17:31:15',0,'# 6.2 原型与原型链\r\n\r\n## 原型\r\n\r\n**原型对象**：每个构造函数`function Fn() {}`都会自动生成一个prototype属性，指向一个默认空对象，这个对象就是原型对象\r\n\r\n**隐式原型**：实例对象的`__proto__`属性\r\n\r\n**显式原型**：类/构造函数的`prototype`属性\r\n\r\n隐式原型和显式原型都指向该类/构造方法的原型对象，因此`student.__proto__ === Student.prototype`\r\n\r\n\r\n\r\n## 原型链\r\n\r\n原型链实现了JavaScript中的继承\r\n\r\n每个对象都可以有一个原型`__proto__`指向原型对象，并从中继承属性和方法。这个原型对象还可以有它自己的原型，以此类推，形成一个原型链。\r\n\r\n查找特定属性的时候，我们先去这个对象里去找，如果没有的话就去它的原型对象里面去，如果还是没有的话再去向原型对象的原型对象里去寻找...\r\n\r\n这样一层一层，最终指向 null (Object.proptotype.__proto__指向的是null)\r\n\r\n\r\n\r\n## instanceof\r\n\r\n通过instanceof可以判断（根据原型链是否能找到）对象是否是某类的实例\r\n\r\n```js\r\nconst object = {}\r\nconst array = []\r\nconsole.log(object instanceof Array)	//false\r\nconsole.log(array instanceof Array)	//true\r\nconsole.log(array instanceof Object)	//true\r\n```\r\n\r\n','channing-cyan','atom-one-light'),(20,'模块化','1',NULL,'6.3 模块化 模块化的意义在于，让庞大而紧密的东西变得小巧与松散，然后这些小巧而松散的东西就具有了独立性、可维护性、可复用性等等优良的特性 ES6 的模块机制与 CommonJS 不同。Common','已发布',2,4,'2023-02-26 00:07:39','2023-02-25 17:32:52',0,'# 6.3 模块化\r\n\r\n模块化的意义在于，让庞大而紧密的东西变得小巧与松散，然后这些小巧而松散的东西就具有了独立性、可维护性、可复用性等等优良的特性\r\n\r\nES6 的模块机制与 CommonJS 不同。CommonJS 是在运行时确定变量的值，而ES6 模块化却可以在静态编译时确定变量的值，显著提高性能\r\n\r\n\r\n\r\n## export\r\n\r\nES6中，一个模块就是一个独立的 js 文件。该文件内部的所有变量，外部无法获取。需要使用`export`关键字导出你想暴露给外界的变量或函数\r\n\r\n单独导出\r\n\r\n```js\r\nexport let a = 111\r\nexport let student = {\r\n  name: \'guo\',\r\n  age: 18\r\n}\r\nexport function add(x, y) {\r\n  return x + y\r\n}\r\n```\r\n\r\n以对象导出\r\n\r\n```js\r\nexport { a, student, add }\r\n```\r\n\r\n\r\n\r\n## export default\r\n\r\n当外部使用 import 导入模块提供的变量时，会先看看模块导出了哪些变量，然后再根据这些变量名一一导入\r\n\r\n而使用export default命令，为模块指定默认导出，这样就不需要知道所要加载模块的变量名，并且引入时可以自己命名\r\n\r\n在一个模块中，export default只能有一个\r\n\r\n```js\r\nexport default {\r\n  name: \'guo\',\r\n  age: 18\r\n}\r\n```\r\n\r\n\r\n\r\n## import\r\n\r\n可以把 import 和 export 想象成一对互逆的操作，它们的用法也是大同小异\r\n\r\n- 使用 import 导入模块时，要用 from 加上路径，可以省略路径中文件的`.js`后缀\r\n- import 命令会被提升，所以可以先使用，后声明\r\n\r\n普通导出的引入\r\n\r\n```js\r\nimport { a, student, add } from \'./out1\'\r\n```\r\n\r\n默认导出的引入\r\n\r\n```js\r\nimport student from \'./out2\'\r\n```\r\n\r\n','jzman','atom-one-light'),(21,'归并排序','1',NULL,'8.8 归并排序 思想：把两个或多个有序的序列合并成一个有序的序列 归并排序是稳定的 时间复杂度O(nlog2 n) (https://pics-1310552122.cos.ap-shanghai.','已发布',2,1,'2023-02-25 22:09:11','2023-02-25 17:33:37',0,'# 8.8 归并排序\r\n\r\n思想：把两个或多个有序的序列合并成一个有序的序列\r\n\r\n归并排序是稳定的\r\n\r\n时间复杂度O(nlog2 n)\r\n\r\n![image-20220329123743246](https://pics-1310552122.cos.ap-shanghai.myqcloud.com/img/202203291237409.png)\r\n\r\n','cyanosis','brown-paper'),(22,'堆排序','1',NULL,'8.7 堆排序 思想：每次将堆顶元素加入有序子序列，并重新将剩余元素调整为堆 堆排序是不稳定的 时间复杂度O(nlog2 n) (https://pics-1310552122.cos.ap-shan','已发布',2,1,'2023-02-25 22:09:08','2023-02-25 17:34:12',0,'# 8.7 堆排序\r\n\r\n思想：每次将堆顶元素加入有序子序列，并重新将剩余元素调整为堆\r\n\r\n堆排序是不稳定的\r\n\r\n时间复杂度O(nlog2 n)\r\n\r\n![image-20220329100008519](https://pics-1310552122.cos.ap-shanghai.myqcloud.com/img/202203291000667.png)\r\n\r\n![image-20220329095430940](https://pics-1310552122.cos.ap-shanghai.myqcloud.com/img/202203290954171.png)\r\n','arknights','atom-one-light'),(23,'一篇假文章','1',NULL,'1234234 123 js const a = 1;','已发布',5,1,'2023-02-25 22:11:06','2023-02-25 22:10:30',0,'# 1234234\n\n# 123\n\n```js\nconst a = 1;\n```','cyanosis','atom-one-light');
/*!40000 ALTER TABLE `post` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tag`
--

DROP TABLE IF EXISTS `tag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tag` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `gmt_modified` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `gmt_created` datetime DEFAULT NULL,
  `is_delete` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `tag_name_uindex` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tag`
--

LOCK TABLES `tag` WRITE;
/*!40000 ALTER TABLE `tag` DISABLE KEYS */;
INSERT INTO `tag` VALUES (1,'前端','2023-01-25 17:06:25','2023-01-25 17:06:27',0),(2,'后端','2023-01-25 17:06:47','2023-01-25 17:06:45',0),(3,'JavaScript','2023-01-25 17:07:15','2023-01-25 17:07:12',0),(4,'面试','2023-01-25 17:07:31','2023-01-25 17:07:29',0),(5,'GitHub','2023-01-25 17:07:42','2023-01-25 17:07:40',0),(6,'Vue.js','2023-01-25 17:08:01','2023-01-25 17:07:59',0),(7,'架构','2023-01-25 17:08:11','2023-01-25 17:08:09',0),(8,'算法','2023-01-25 17:08:38','2023-01-25 17:08:36',0),(9,'Java','2023-01-25 17:08:42','2023-01-25 17:08:40',0),(10,'CSS','2023-01-25 17:08:54','2023-01-25 17:08:53',0),(11,'代码规范','2023-01-25 17:09:10','2023-01-25 17:09:08',0),(12,'Node.js','2023-01-25 17:09:32','2023-01-25 17:09:30',0),(13,'数据库','2023-01-25 17:09:53','2023-01-25 17:09:51',0),(14,'MySQL','2023-01-25 17:10:04','2023-01-25 17:10:02',0),(15,'React.js','2023-01-25 17:10:23','2023-01-25 17:10:21',0),(16,'Linux','2023-01-25 17:10:37','2023-01-25 17:10:35',0),(17,'Git','2023-01-25 17:10:46','2023-01-25 17:10:45',0),(18,'正则表达式','2023-01-25 17:11:15','2023-01-25 17:11:13',0);
/*!40000 ALTER TABLE `tag` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tag_cache`
--

DROP TABLE IF EXISTS `tag_cache`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tag_cache` (
  `id` int NOT NULL AUTO_INCREMENT,
  `admin` varchar(30) NOT NULL,
  `tag` int NOT NULL,
  `gmt_created` datetime DEFAULT NULL,
  `gmt_modified` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `tag_cache_id_uindex` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=162 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tag_cache`
--

LOCK TABLES `tag_cache` WRITE;
/*!40000 ALTER TABLE `tag_cache` DISABLE KEYS */;
/*!40000 ALTER TABLE `tag_cache` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tag_post`
--

DROP TABLE IF EXISTS `tag_post`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tag_post` (
  `id` int NOT NULL AUTO_INCREMENT,
  `post` int NOT NULL,
  `tag` int NOT NULL,
  `gmt_modified` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `gmt_created` datetime DEFAULT NULL,
  `is_delete` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `sagda` (`tag`) USING BTREE,
  KEY `haedhs` (`post`) USING BTREE,
  CONSTRAINT `haedhs` FOREIGN KEY (`post`) REFERENCES `post` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `sagda` FOREIGN KEY (`tag`) REFERENCES `tag` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=48 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tag_post`
--

LOCK TABLES `tag_post` WRITE;
/*!40000 ALTER TABLE `tag_post` DISABLE KEYS */;
INSERT INTO `tag_post` VALUES (1,1,1,'2023-01-25 17:12:04','2023-01-25 17:12:00',0),(2,1,3,'2023-01-25 17:12:06','2023-01-25 17:12:02',0),(3,2,13,NULL,'2023-02-02 22:42:31',0),(4,2,14,NULL,'2023-02-02 22:42:40',0),(5,3,2,'2023-02-02 22:45:09','2023-02-02 22:43:33',0),(6,3,16,'2023-02-02 22:45:09','2023-02-02 22:43:35',0),(29,15,4,'2023-02-25 14:06:47','2023-02-25 14:06:47',0),(30,15,8,'2023-02-25 14:06:47','2023-02-25 14:06:47',0),(31,16,7,'2023-02-25 14:08:02','2023-02-25 14:08:02',0),(32,17,1,'2023-02-25 16:15:01','2023-02-25 16:15:01',0),(33,17,3,'2023-02-25 16:15:01','2023-02-25 16:15:01',0),(36,19,1,'2023-02-25 17:31:15','2023-02-25 17:31:15',0),(37,19,3,'2023-02-25 17:31:15','2023-02-25 17:31:15',0),(38,20,1,'2023-02-25 17:32:52','2023-02-25 17:32:52',0),(39,20,3,'2023-02-25 17:32:52','2023-02-25 17:32:52',0),(40,21,1,'2023-02-25 17:33:37','2023-02-25 17:33:37',0),(41,21,3,'2023-02-25 17:33:37','2023-02-25 17:33:37',0),(42,22,1,'2023-02-25 17:34:12','2023-02-25 17:34:12',0),(43,22,3,'2023-02-25 17:34:12','2023-02-25 17:34:12',0),(44,22,4,'2023-02-25 17:34:12','2023-02-25 17:34:12',0),(45,23,11,'2023-02-25 22:10:30','2023-02-25 22:10:30',0),(46,23,7,'2023-02-25 22:10:30','2023-02-25 22:10:30',0),(47,23,5,'2023-02-25 22:10:30','2023-02-25 22:10:30',0);
/*!40000 ALTER TABLE `tag_post` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `website`
--

DROP TABLE IF EXISTS `website`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `website` (
  `gmt_modified` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `gmt_created` datetime DEFAULT NULL,
  `date` date DEFAULT NULL COMMENT '日期',
  `num` int DEFAULT '0' COMMENT '当日网站总阅读量',
  `id` int NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`),
  UNIQUE KEY `watch_id_uindex` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='每日网站总阅读量统计';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `website`
--

LOCK TABLES `website` WRITE;
/*!40000 ALTER TABLE `website` DISABLE KEYS */;
INSERT INTO `website` VALUES ('2023-02-23 09:11:28','2023-02-23 09:09:43','2023-02-23',2,1),(NULL,'2023-02-23 11:49:03','2023-02-22',10,2),(NULL,'2023-02-23 11:49:19','2023-02-21',3,3),(NULL,'2023-02-23 11:49:30','2023-02-20',5,4),(NULL,'2023-02-23 11:49:39','2023-02-19',8,5),('2023-02-23 23:02:16','2023-02-23 23:02:08','2023-02-18',7,6),('2023-02-23 23:02:16','2023-02-23 23:02:11','2023-02-17',3,7),('2023-02-23 23:02:16','2023-02-23 23:02:12','2023-02-16',5,8),('2023-02-23 23:02:16','2023-02-23 23:02:13','2023-02-15',1,9),('2023-02-23 23:02:16','2023-02-23 23:02:14','2023-02-14',0,10),('2023-02-24 07:09:43','2023-02-24 07:01:39','2023-02-24',6,11),('2023-02-25 23:57:17','2023-02-25 14:02:36','2023-02-25',152,12),('2023-02-26 10:50:32','2023-02-26 00:01:49','2023-02-26',5,13);
/*!40000 ALTER TABLE `website` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-02-26 11:29:40
