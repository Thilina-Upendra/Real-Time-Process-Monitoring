-- MySQL dump 10.13  Distrib 8.0.24, for Win64 (x86_64)
--
-- Host: localhost    Database: tags
-- ------------------------------------------------------
-- Server version	8.0.24

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
-- Table structure for table `api_keys`
--

DROP TABLE IF EXISTS `api_keys`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `api_keys` (
  `id` int NOT NULL AUTO_INCREMENT,
  `customer_id` int DEFAULT NULL,
  `value` varchar(1000) DEFAULT NULL,
  `assiged_ip` varchar(45) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  KEY `customerApiKey_idx` (`customer_id`),
  CONSTRAINT `customerApiKey` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `api_keys`
--

LOCK TABLES `api_keys` WRITE;
/*!40000 ALTER TABLE `api_keys` DISABLE KEYS */;
INSERT INTO `api_keys` VALUES (1,1,'11786c31-e84e-4010-9963-d3515aefb77a','123.23.12.21','2021-08-02 02:08:52'),(2,1,'57f2ba09-8843-47e6-a22b-77de1e155397','123.23.12.21','2021-09-14 15:14:56'),(3,1,'b3b9fdef-ffb2-4912-aad8-55d561a88e18','123.23.12.21','2021-09-14 15:32:53');
/*!40000 ALTER TABLE `api_keys` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customers`
--

DROP TABLE IF EXISTS `customers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customers` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  `email` varchar(45) DEFAULT NULL,
  `telephone` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customers`
--

LOCK TABLES `customers` WRITE;
/*!40000 ALTER TABLE `customers` DISABLE KEYS */;
INSERT INTO `customers` VALUES (1,'Upendra','upendra@gmail.com','0710159914');
/*!40000 ALTER TABLE `customers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `systems`
--

DROP TABLE IF EXISTS `systems`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `systems` (
  `id` int NOT NULL AUTO_INCREMENT,
  `customer_id` int DEFAULT NULL,
  `name` varchar(45) DEFAULT NULL,
  `description` varchar(100) DEFAULT NULL,
  UNIQUE KEY `id_UNIQUE` (`id`),
  KEY `customerSystem_idx` (`customer_id`),
  CONSTRAINT `customerSystem` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `systems`
--

LOCK TABLES `systems` WRITE;
/*!40000 ALTER TABLE `systems` DISABLE KEYS */;
INSERT INTO `systems` VALUES (1,1,'System-1','Tes'),(2,1,'System-2','Tes'),(3,1,'System-3','Tes'),(4,1,'System-4','Tes'),(5,1,'Batch-5','Tes'),(6,1,'Batch-6','Tes'),(7,1,'Batch-7','Tes'),(8,1,'Batch-8','Tes');
/*!40000 ALTER TABLE `systems` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tag_values`
--

DROP TABLE IF EXISTS `tag_values`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tag_values` (
  `id` int NOT NULL AUTO_INCREMENT,
  `tag_id` int DEFAULT NULL,
  `value` varchar(1000) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  KEY `tagTagValue_idx` (`tag_id`),
  CONSTRAINT `tagTagValue` FOREIGN KEY (`tag_id`) REFERENCES `tags` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tag_values`
--

LOCK TABLES `tag_values` WRITE;
/*!40000 ALTER TABLE `tag_values` DISABLE KEYS */;
INSERT INTO `tag_values` VALUES (1,49,'10','2021-09-29 22:02:30'),(2,50,'20','2021-09-29 22:02:30'),(3,51,'30','2021-09-29 22:02:30'),(4,52,'15','2021-09-29 22:02:30'),(5,53,'25','2021-09-29 22:02:30'),(6,54,'24','2021-09-29 22:02:30'),(7,55,'15','2021-09-29 22:02:30'),(8,56,'41','2021-09-29 22:02:30'),(9,57,'25','2021-09-29 22:02:30'),(10,58,'36','2021-09-29 22:02:30'),(11,59,'56','2021-09-29 22:02:30'),(12,60,'56','2021-09-29 22:02:30'),(13,61,'54','2021-09-29 22:02:30'),(14,62,'12','2021-09-29 22:02:30'),(15,63,'10','2021-09-29 22:03:55'),(16,64,'20','2021-09-29 22:03:55'),(17,65,'30','2021-09-29 22:03:55'),(18,66,'15','2021-09-29 22:03:55'),(19,67,'25','2021-09-29 22:03:55'),(20,68,'24','2021-09-29 22:03:55'),(21,69,'15','2021-09-29 22:03:55'),(22,70,'41','2021-09-29 22:03:55'),(23,71,'25','2021-09-29 22:03:55'),(24,72,'36','2021-09-29 22:03:55'),(25,73,'56','2021-09-29 22:03:55'),(26,74,'56','2021-09-29 22:03:55'),(27,75,'54','2021-09-29 22:03:55'),(28,76,'12','2021-09-29 22:03:55'),(29,77,'10','2021-09-30 19:29:08'),(30,78,'20','2021-09-30 19:29:08'),(31,79,'30','2021-09-30 19:29:08'),(32,80,'15','2021-09-30 19:29:08'),(33,81,'25','2021-09-30 19:29:08'),(34,82,'24','2021-09-30 19:29:08'),(35,83,'15','2021-09-30 19:29:08'),(36,84,'41','2021-09-30 19:29:08'),(37,85,'25','2021-09-30 19:29:08'),(38,86,'36','2021-09-30 19:29:08'),(39,87,'56','2021-09-30 19:29:08'),(40,88,'56','2021-09-30 19:29:08'),(41,89,'54','2021-09-30 19:29:08'),(42,90,'12','2021-09-30 19:29:08');
/*!40000 ALTER TABLE `tag_values` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tags`
--

DROP TABLE IF EXISTS `tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tags` (
  `id` int NOT NULL AUTO_INCREMENT,
  `system_id` int DEFAULT NULL,
  `name` varchar(45) DEFAULT NULL,
  `description` varchar(45) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  KEY `systemTag_idx` (`system_id`),
  CONSTRAINT `systemTag` FOREIGN KEY (`system_id`) REFERENCES `systems` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=91 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tags`
--

LOCK TABLES `tags` WRITE;
/*!40000 ALTER TABLE `tags` DISABLE KEYS */;
INSERT INTO `tags` VALUES (49,6,'Batch ID','Description','2021-09-29 22:01:33'),(50,6,'Date','Description','2021-09-29 22:01:33'),(51,6,'Product Name','Description','2021-09-29 22:01:33'),(52,6,'Laying SAM','Description','2021-09-29 22:01:33'),(53,6,'Cutting SAM','Description','2021-09-29 22:01:33'),(54,6,'Supervisor Name','Description','2021-09-29 22:01:33'),(55,6,'No Of Layers','Description','2021-09-29 22:01:33'),(56,6,'No Of Pieces','Description','2021-09-29 22:01:33'),(57,6,'Working Hours','Description','2021-09-29 22:01:33'),(58,6,'Fabric Recieved Time','Description','2021-09-29 22:01:33'),(59,6,'Laying Start Time','Description','2021-09-29 22:01:33'),(60,6,'Laying Finish Time','Description','2021-09-29 22:01:33'),(61,6,'Cutting Start Time','Description','2021-09-29 22:01:33'),(62,6,'Cutting FInish Time','Description','2021-09-29 22:01:33'),(63,7,'Batch ID','Description','2021-09-29 22:03:10'),(64,7,'Date','Description','2021-09-29 22:03:10'),(65,7,'Product Name','Description','2021-09-29 22:03:10'),(66,7,'Laying SAM','Description','2021-09-29 22:03:10'),(67,7,'Cutting SAM','Description','2021-09-29 22:03:10'),(68,7,'Supervisor Name','Description','2021-09-29 22:03:10'),(69,7,'No Of Layers','Description','2021-09-29 22:03:10'),(70,7,'No Of Pieces','Description','2021-09-29 22:03:10'),(71,7,'Working Hours','Description','2021-09-29 22:03:10'),(72,7,'Fabric Recieved Time','Description','2021-09-29 22:03:10'),(73,7,'Laying Start Time','Description','2021-09-29 22:03:10'),(74,7,'Laying Finish Time','Description','2021-09-29 22:03:10'),(75,7,'Cutting Start Time','Description','2021-09-29 22:03:10'),(76,7,'Cutting FInish Time','Description','2021-09-29 22:03:10'),(77,8,'Batch ID','Description','2021-09-30 19:27:46'),(78,8,'Date','Description','2021-09-30 19:27:46'),(79,8,'Product Name','Description','2021-09-30 19:27:46'),(80,8,'Laying SAM','Description','2021-09-30 19:27:46'),(81,8,'Cutting SAM','Description','2021-09-30 19:27:46'),(82,8,'Supervisor Name','Description','2021-09-30 19:27:46'),(83,8,'No Of Layers','Description','2021-09-30 19:27:46'),(84,8,'No Of Pieces','Description','2021-09-30 19:27:46'),(85,8,'Working Hours','Description','2021-09-30 19:27:46'),(86,8,'Fabric Recieved Time','Description','2021-09-30 19:27:46'),(87,8,'Laying Start Time','Description','2021-09-30 19:27:46'),(88,8,'Laying Finish Time','Description','2021-09-30 19:27:46'),(89,8,'Cutting Start Time','Description','2021-09-30 19:27:46'),(90,8,'Cutting FInish Time','Description','2021-09-30 19:27:46');
/*!40000 ALTER TABLE `tags` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-09-30 19:31:10
