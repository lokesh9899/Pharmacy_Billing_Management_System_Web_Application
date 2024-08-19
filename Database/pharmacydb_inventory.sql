CREATE DATABASE  IF NOT EXISTS `pharmacydb` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `pharmacydb`;
-- MySQL dump 10.13  Distrib 8.0.32, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: pharmacydb
-- ------------------------------------------------------
-- Server version	8.0.32

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
-- Table structure for table `inventory`
--

DROP TABLE IF EXISTS `inventory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `inventory` (
  `productNumber` int NOT NULL AUTO_INCREMENT,
  `productName` varchar(45) NOT NULL,
  `quantity` int unsigned NOT NULL,
  `unitPrice` double NOT NULL,
  `expiryDate` varchar(45) NOT NULL,
  `shelfNumber` varchar(45) NOT NULL,
  `status` tinyint NOT NULL DEFAULT '1',
  PRIMARY KEY (`productNumber`),
  UNIQUE KEY `productName_UNIQUE` (`productName`)
) ENGINE=InnoDB AUTO_INCREMENT=78 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `inventory`
--

LOCK TABLES `inventory` WRITE;
/*!40000 ALTER TABLE `inventory` DISABLE KEYS */;
INSERT INTO `inventory` VALUES (1,'Paracitamol',120,3.45,'2026-02-28','A10',1),(2,'Flexon',182,10.25,'2025-12-12','A12',1),(3,'Saridon',178,45.33,'2026-04-22','A9',1),(8,'Digene',189,3,'2026-04-22','A9',1),(9,'Amoxicilin',134,3,'2023-03-03','A10',1),(12,'Ibuprofen',182,36.11,'2026-11-21','A8',1),(13,'Remedy Lip Balm',88,46.11,'2024-10-31','A2',1),(14,'Advanced Lightning',90,15.86,'2026-01-31','A7',1),(15,'Old Spice Classic',1441,78.85,'2024-10-31','B3',1),(16,'Solves - aspirin',166,50.32,'2024-11-02','S8',1),(17,'Gynobalance',110,82.17,'2024-05-07','P1',1),(18,'Quetiapine Fumarate',60,30.5,'2025-03-28','S9',1),(19,'HGH Plus IGF1',315,44.69,'2024-03-25','S9',1),(20,'Bupropion Hydrochloride',70,81.33,'2025-09-05','I1',1),(21,'Pravastatin Sodium',22,106.37,'17/03/2025','I8',1),(22,'Dilantin Infatabs',70,62.8,'12/02/2026','X8',1),(23,'Hibiclens',45,498.64,'06/01/2026','W6',1),(24,'ERYTHROMYCIN Base Filmtab',90,134.15,'03/03/2026','W1',1),(25,'Miconazole 3 Combination Pack',54,443.09,'20/10/2025','L5',1),(26,'Tizanidine Hydrochloride',100,202.55,'2026-12-11','S1',1),(27,'Nice',77,197.46,'10/01/2025','S5',1),(28,'Calcipotriene',82,237.66,'12/05/2024','W3',1),(29,'Rugby Acetaminophen 500 mg and',61,131.44,'19/01/2026','M4',1),(30,'Caziant',72,323.39,'16/12/2025','M1',1),(31,'Sheer Finish Tinted Moisturizer Medium',41,117.24,'03/12/2025','L8',1),(32,'FACE PROTECTOR',32,390.59,'27/04/2025','M1',1),(33,'LBEL',35,63.11,'04/12/2024','F2',1),(34,'Temazepam',81,245.06,'09/12/2024','S2',1),(35,'HAND AND NATURE SANITIZER',13,449.62,'09/11/2025','E8',1),(36,'METHIMAZOLE',72,176.13,'13/06/2024','K1',1),(37,'Previfem',88,417.08,'28/05/2025','N2',1),(38,'Olanzapine',82,224.35,'14/04/2024','Q8',1),(39,'White Oak',55,72.46,'16/08/2024','G2',1),(40,'Greasewood',56,478.11,'02/02/2024','B5',1),(41,'REYATAZ',15,127.2,'23/03/2024','C4',1),(42,'Nystatin',81,133.4,'15/08/2025','Q2',1),(43,'JiDeSheng',79,418.05,'06/04/2025','I7',1),(44,'Laura Mercier Tinted Moisturizer SPF 20 TAN',60,448.86,'07/04/2025','C2',1),(45,'Depo-Testosterone',88,289.43,'28/12/2024','P7',1),(46,'Mirapex',91,452.17,'07/03/2026','F7',1),(47,'Equaline Heartburn Relief',50,204.17,'26/12/2025','F4',1),(48,'Perphenazine',16,342.36,'23/05/2025','D2',1),(49,'pain reliever',88,496.12,'04/12/2024','J8',1),(50,'Lidocaine Hydrochloride and Dextrose',74,389.71,'18/06/2025','J6',1),(51,'Trihexyphenidyl Hydrochloride',34,150.87,'09/02/2025','Q3',1),(52,'up and up pain relief',70,275.97,'23/12/2025','D2',1),(53,'Gloves in a Bottle with SPF15',179,183.69,'09/08/2025','D3',1),(54,'Escitalopram',80,172.94,'07/10/2024','P3',1),(55,'Refill Saline Packets',48,339.89,'03/03/2024','N6',1),(56,'Ceftriaxone',60,198.66,'25/04/2025','F2',1),(57,'Verapamil',15,311.21,'16/02/2025','I8',1),(58,'Ancient Secrets',62,248.77,'10/03/2025','D6',1),(59,'Secura Protective',30,18.12,'05/09/2024','D0',1),(60,'Sertraline Hydrochloride',15,23.12,'09/02/2025','G6',1),(62,'Crocin',70,3.12,'2026-10-28','B7',1),(63,'Albumin',100,2.33,'2026-10-21','A3',1),(64,'saridon 500mg',120,3,'2028-03-24','A8',1),(76,'dettol',460,120.54,'2025-02-12','a5',1),(77,'Savlon',230,125.67,'2027-10-12','E4',1);
/*!40000 ALTER TABLE `inventory` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-03-17 21:02:11
