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
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `products` (
  `productName` varchar(45) NOT NULL,
  `quantity` int NOT NULL,
  `unitPrice` double NOT NULL,
  `orderId` int NOT NULL,
  PRIMARY KEY (`productName`,`orderId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products`
--

LOCK TABLES `products` WRITE;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
INSERT INTO `products` VALUES ('Advanced Lightning',3,15.86,101),('Advanced Lightning',1,15.86,147),('Advanced Lightning',9,15.86,161),('amoxicilin',10,3,112),('Ancient Secrets',5,248.77,154),('Ancient Secrets',2,248.77,155),('Bupropion Hydrochloride',8,81.33,131),('crocin',10,3.12,141),('Digene',1,3,101),('Digene',10,3,118),('Dilantin Infatabs',2,62.8,155),('Equaline Heartburn Relief',10,204.17,143),('ERYTHROMYCIN Base Filmtab',5,134.15,132),('Escitalopram',6,172.94,112),('Escitalopram',5,172.94,150),('Flexon',8,1.2,118),('Gloves in a Bottle with SPF15',10,183.69,146),('Gloves in a Bottle with SPF15',5,183.69,148),('Gloves in a Bottle with SPF15',1,183.69,174),('Gloves in a Bottle with SPF15',5,183.69,177),('Gynobalance',5,82.17,125),('Gynobalance',5,82.17,145),('HGH Plus IGF1',10,44.69,135),('HGH Plus IGF1',5,44.69,136),('HGH Plus IGF1',15,44.69,147),('HGH Plus IGF1',7,44.69,157),('HGH Plus IGF1',1,44.69,167),('Hibiclens',2,498.64,140),('Hibiclens',5,498.64,168),('Ibuprofen',5,36.11,114),('Ibuprofen',5,36.11,117),('Laura Mercier Tinted Moisturizer SPF 20 TAN',4,448.86,137),('Lidocaine Hydrochloride and Dextrose',4,389.71,149),('Lidocaine Hydrochloride and Dextrose',1,389.71,154),('Old Spice Classic',45,78.85,154),('Old Spice Classic',9,78.85,155),('Old Spice Classic',7,78.85,157),('Old Spice Classic',1,78.85,165),('Old Spice Classic',1,78.85,176),('pain reliever',2,496.12,144),('Paracitamol',10,3.45,101),('Pravastatin Sodium',5,106.37,126),('Pravastatin Sodium',5,106.37,129),('Pravastatin Sodium',3,106.37,139),('Quetiapine Fumarate',9,30.5,120),('Quetiapine Fumarate',5,30.5,134),('Quetiapine Fumarate',5,30.5,141),('Refill Saline Packets',3,339.89,133),('Refill Saline Packets',2,339.89,145),('Remedy Lip Balm',5,46.11,124),('Remedy Lip Balm',8,46.11,130),('Remedy Lip Balm',1,46.11,150),('REYATAZ',4,127.2,115),('Saridon',5,3,129),('Secura Protective',2,18.12,142),('Solves - aspirin',7,50.32,116),('Solves - aspirin',13,50.32,120),('Solves - aspirin',10,50.32,142),('Solves - aspirin',10,50.32,144),('Solves - aspirin',5,50.32,168),('Trihexyphenidyl Hydrochloride',1,150.87,146),('up and up pain relief',1,275.97,138),('Verapamil',1,311.21,120),('Verapamil',3,311.21,123),('Verapamil',3,311.21,142),('Verapamil',2,311.21,148),('Verapamil',5,311.21,167);
/*!40000 ALTER TABLE `products` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `products_BEFORE_INSERT` BEFORE INSERT ON `products` FOR EACH ROW BEGIN
update inventory set quantity = (quantity - new.quantity) where productName = new.productName;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `products_BEFORE_DELETE` BEFORE DELETE ON `products` FOR EACH ROW BEGIN
update inventory set quantity = (quantity + old.quantity) where productName = old.productName;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-03-17 21:02:12
