-- MySQL dump 10.13  Distrib 8.0.28, for Win64 (x86_64)
--
-- Host: localhost    Database: db6
-- ------------------------------------------------------
-- Server version	8.0.28

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

--
-- Table structure for table `allocated_to`
--

DROP TABLE IF EXISTS `allocated_to`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `allocated_to` (
  `weapon_id` int NOT NULL,
  `battalion_id` int NOT NULL,
  `allocated_count` bigint DEFAULT NULL,
  PRIMARY KEY (`weapon_id`,`battalion_id`),
  KEY `battalion_id` (`battalion_id`),
  CONSTRAINT `allocated_to_ibfk_1` FOREIGN KEY (`weapon_id`) REFERENCES `weapons` (`weapon_id`),
  CONSTRAINT `allocated_to_ibfk_2` FOREIGN KEY (`battalion_id`) REFERENCES `battalions` (`battalion_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `allocated_to`
--

LOCK TABLES `allocated_to` WRITE;
/*!40000 ALTER TABLE `allocated_to` DISABLE KEYS */;
INSERT INTO `allocated_to` VALUES (1,1,1);
/*!40000 ALTER TABLE `allocated_to` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ally_countries`
--

DROP TABLE IF EXISTS `ally_countries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ally_countries` (
  `country_id` varchar(5) NOT NULL,
  `weapons` varchar(5) NOT NULL DEFAULT 'no',
  `medical_equipment` varchar(5) NOT NULL DEFAULT 'no',
  `food` varchar(5) NOT NULL DEFAULT 'no',
  PRIMARY KEY (`country_id`),
  CONSTRAINT `ally_countries_ibfk_1` FOREIGN KEY (`country_id`) REFERENCES `countries` (`country_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ally_countries`
--

LOCK TABLES `ally_countries` WRITE;
/*!40000 ALTER TABLE `ally_countries` DISABLE KEYS */;
INSERT INTO `ally_countries` VALUES ('1','no','no','no'),('4','no','no','no');
/*!40000 ALTER TABLE `ally_countries` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `battalions`
--

DROP TABLE IF EXISTS `battalions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `battalions` (
  `battalion_id` int NOT NULL,
  `battalion_name` varchar(50) NOT NULL,
  `battalion_location` varchar(50) NOT NULL,
  `soldiers_num` int DEFAULT '1',
  `medical_staff_num` int DEFAULT '1',
  PRIMARY KEY (`battalion_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `battalions`
--

LOCK TABLES `battalions` WRITE;
/*!40000 ALTER TABLE `battalions` DISABLE KEYS */;
INSERT INTO `battalions` VALUES (1,'charlie','kharkiv',50,5),(12,'kharkiev','griwiskh',2,2);
/*!40000 ALTER TABLE `battalions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `civilians`
--

DROP TABLE IF EXISTS `civilians`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `civilians` (
  `id` int NOT NULL,
  `evacuation_status` varchar(5) NOT NULL,
  `evacuating_to` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `civilians_ibfk_1` FOREIGN KEY (`id`) REFERENCES `people` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `civilians`
--

LOCK TABLES `civilians` WRITE;
/*!40000 ALTER TABLE `civilians` DISABLE KEYS */;
INSERT INTO `civilians` VALUES (1,'no',NULL);
/*!40000 ALTER TABLE `civilians` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `commander`
--

DROP TABLE IF EXISTS `commander`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `commander` (
  `id` int NOT NULL,
  `assigned_date` date NOT NULL,
  `battalion_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `battalion_id` (`battalion_id`),
  CONSTRAINT `commander_ibfk_1` FOREIGN KEY (`battalion_id`) REFERENCES `battalions` (`battalion_id`),
  CONSTRAINT `commander_ibfk_2` FOREIGN KEY (`id`) REFERENCES `people` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `commander`
--

LOCK TABLES `commander` WRITE;
/*!40000 ALTER TABLE `commander` DISABLE KEYS */;
INSERT INTO `commander` VALUES (1,'2022-03-01',1);
/*!40000 ALTER TABLE `commander` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `companies`
--

DROP TABLE IF EXISTS `companies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `companies` (
  `company_id` int NOT NULL,
  `company_name` varchar(50) NOT NULL,
  `type_manufactured` varchar(10) NOT NULL,
  PRIMARY KEY (`company_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `companies`
--

LOCK TABLES `companies` WRITE;
/*!40000 ALTER TABLE `companies` DISABLE KEYS */;
INSERT INTO `companies` VALUES (1,'suit up pvt ltd','weapon'),(2,'life saving pharma','medical');
/*!40000 ALTER TABLE `companies` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `countries`
--

DROP TABLE IF EXISTS `countries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `countries` (
  `country_id` varchar(5) NOT NULL,
  `country_name` varchar(20) NOT NULL,
  `status` varchar(10) NOT NULL,
  PRIMARY KEY (`country_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `countries`
--

LOCK TABLES `countries` WRITE;
/*!40000 ALTER TABLE `countries` DISABLE KEYS */;
INSERT INTO `countries` VALUES ('1','ukrain','ally'),('2','russia','enemy'),('4','USA','ally');
/*!40000 ALTER TABLE `countries` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `located_at`
--

DROP TABLE IF EXISTS `located_at`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `located_at` (
  `company_id` int NOT NULL,
  `country_id` varchar(5) NOT NULL,
  PRIMARY KEY (`company_id`,`country_id`),
  KEY `country_id` (`country_id`),
  CONSTRAINT `located_at_ibfk_1` FOREIGN KEY (`country_id`) REFERENCES `countries` (`country_id`),
  CONSTRAINT `located_at_ibfk_2` FOREIGN KEY (`company_id`) REFERENCES `companies` (`company_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `located_at`
--

LOCK TABLES `located_at` WRITE;
/*!40000 ALTER TABLE `located_at` DISABLE KEYS */;
INSERT INTO `located_at` VALUES (1,'1'),(2,'2');
/*!40000 ALTER TABLE `located_at` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `medical_equipment`
--

DROP TABLE IF EXISTS `medical_equipment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `medical_equipment` (
  `equipment_id` int NOT NULL,
  `equipment_name` varchar(50) NOT NULL,
  `equipment_available` int DEFAULT NULL,
  PRIMARY KEY (`equipment_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `medical_equipment`
--

LOCK TABLES `medical_equipment` WRITE;
/*!40000 ALTER TABLE `medical_equipment` DISABLE KEYS */;
INSERT INTO `medical_equipment` VALUES (1,'bandage',100),(43,'injection',21);
/*!40000 ALTER TABLE `medical_equipment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `medical_equipments_manufactured`
--

DROP TABLE IF EXISTS `medical_equipments_manufactured`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `medical_equipments_manufactured` (
  `company_id` int NOT NULL,
  `equipment_id` int NOT NULL,
  PRIMARY KEY (`company_id`,`equipment_id`),
  KEY `equipment_id` (`equipment_id`),
  CONSTRAINT `medical_equipments_manufactured_ibfk_1` FOREIGN KEY (`company_id`) REFERENCES `companies` (`company_id`),
  CONSTRAINT `medical_equipments_manufactured_ibfk_2` FOREIGN KEY (`equipment_id`) REFERENCES `medical_equipment` (`equipment_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `medical_equipments_manufactured`
--

LOCK TABLES `medical_equipments_manufactured` WRITE;
/*!40000 ALTER TABLE `medical_equipments_manufactured` DISABLE KEYS */;
INSERT INTO `medical_equipments_manufactured` VALUES (2,1);
/*!40000 ALTER TABLE `medical_equipments_manufactured` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `medical_suppliers`
--

DROP TABLE IF EXISTS `medical_suppliers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `medical_suppliers` (
  `company_id` int NOT NULL,
  `supply_frequency_permonth` int NOT NULL,
  PRIMARY KEY (`company_id`),
  CONSTRAINT `medical_suppliers_ibfk_1` FOREIGN KEY (`company_id`) REFERENCES `companies` (`company_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `medical_suppliers`
--

LOCK TABLES `medical_suppliers` WRITE;
/*!40000 ALTER TABLE `medical_suppliers` DISABLE KEYS */;
INSERT INTO `medical_suppliers` VALUES (2,5);
/*!40000 ALTER TABLE `medical_suppliers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `medical_team`
--

DROP TABLE IF EXISTS `medical_team`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `medical_team` (
  `id` int NOT NULL,
  `position` varchar(20) NOT NULL,
  `battalion_id` int NOT NULL,
  `assigned_date` date NOT NULL,
  PRIMARY KEY (`id`,`battalion_id`),
  KEY `battalion_id` (`battalion_id`),
  CONSTRAINT `medical_team_ibfk_1` FOREIGN KEY (`id`) REFERENCES `people` (`id`),
  CONSTRAINT `medical_team_ibfk_2` FOREIGN KEY (`battalion_id`) REFERENCES `battalions` (`battalion_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `medical_team`
--

LOCK TABLES `medical_team` WRITE;
/*!40000 ALTER TABLE `medical_team` DISABLE KEYS */;
INSERT INTO `medical_team` VALUES (1,'doctor',1,'2022-03-03');
/*!40000 ALTER TABLE `medical_team` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `people`
--

DROP TABLE IF EXISTS `people`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `people` (
  `id` int NOT NULL,
  `first_name` varchar(50) NOT NULL,
  `middle_name` varchar(50) DEFAULT NULL,
  `last_name` varchar(50) DEFAULT NULL,
  `gender` varchar(10) NOT NULL,
  `date_of_birth` date NOT NULL,
  `nationality` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `people`
--

LOCK TABLES `people` WRITE;
/*!40000 ALTER TABLE `people` DISABLE KEYS */;
INSERT INTO `people` VALUES (1,'vladimer',NULL,'zelensky','male','1980-04-04','ukrain'),(2,'josh','andrew','stone','male','1990-09-13','ukrain');
/*!40000 ALTER TABLE `people` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `soldiers`
--

DROP TABLE IF EXISTS `soldiers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `soldiers` (
  `id` int NOT NULL,
  `health_status` varchar(10) NOT NULL DEFAULT 'healthy',
  `military_unit` varchar(10) NOT NULL,
  `battalion_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `battalion_id` (`battalion_id`),
  CONSTRAINT `soldiers_ibfk_1` FOREIGN KEY (`id`) REFERENCES `people` (`id`),
  CONSTRAINT `soldiers_ibfk_2` FOREIGN KEY (`battalion_id`) REFERENCES `battalions` (`battalion_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `soldiers`
--

LOCK TABLES `soldiers` WRITE;
/*!40000 ALTER TABLE `soldiers` DISABLE KEYS */;
INSERT INTO `soldiers` VALUES (1,'healthy','army',1);
/*!40000 ALTER TABLE `soldiers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `weapon_manufacturers`
--

DROP TABLE IF EXISTS `weapon_manufacturers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `weapon_manufacturers` (
  `company_id` int NOT NULL,
  `weapon_id` int NOT NULL,
  `weapon_production_unitsperweek` int NOT NULL,
  PRIMARY KEY (`company_id`,`weapon_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `weapon_manufacturers`
--

LOCK TABLES `weapon_manufacturers` WRITE;
/*!40000 ALTER TABLE `weapon_manufacturers` DISABLE KEYS */;
INSERT INTO `weapon_manufacturers` VALUES (1,1,1);
/*!40000 ALTER TABLE `weapon_manufacturers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `weapons`
--

DROP TABLE IF EXISTS `weapons`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `weapons` (
  `weapon_id` int NOT NULL,
  `weapon_name` varchar(100) DEFAULT NULL,
  `weapons_left` bigint DEFAULT NULL,
  PRIMARY KEY (`weapon_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `weapons`
--

LOCK TABLES `weapons` WRITE;
/*!40000 ALTER TABLE `weapons` DISABLE KEYS */;
INSERT INTO `weapons` VALUES (1,'tank',500);
/*!40000 ALTER TABLE `weapons` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-03-31 23:37:11
