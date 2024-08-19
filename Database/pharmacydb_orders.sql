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
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orders` (
  `orderId` int NOT NULL AUTO_INCREMENT,
  `customerName` varchar(45) NOT NULL,
  `orderDateTime` varchar(45) NOT NULL,
  `phoneNumber` varchar(45) NOT NULL,
  `doctorName` varchar(45) NOT NULL,
  `totalPrice` double NOT NULL,
  `employeeName` varchar(45) NOT NULL,
  PRIMARY KEY (`orderId`)
) ENGINE=InnoDB AUTO_INCREMENT=178 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` VALUES (101,'Biswajit Ghosal','2022-03-06T20:21:58.182728300','9932574811','Dr. Pratik Biswas',1000.47,'BiswajitGhosal'),(112,'Demetra Trevaskus','2023-02-06T23:28:01.807649800','1008740733','Dr. Pratik Biswas',960.88,'BiswajitGhosal'),(113,'Biswajit Ghosal','2022-05-08T23:29:52.265639600','9932574811','Dr.Lokesh Reddy',1200,'Biswajit Ghosal'),(114,'Demetra Trevaskus','2022-03-06T23:30:11.918526300','1008740733','Dr.Lokesh Reddy',180.55,'BiswajitGhosal'),(115,'Demetra Trevaskus','2023-01-06T23:36:24.491433800','1008740733','Dr. Pratik Biswas',508.8,'BiswajitGhosal'),(116,'Demetra Trevaskus','2021-05-08T19:48:55.127155100','1008740733','Dr. Lokesh Reddy',352.24,'BiswajitGhosal'),(117,'Maribel Roseaman','2023-03-08T20:03:11.723718700','2144540926','Dr. Pratik Biswas',180.55,'BiswajitGhosal'),(118,'Maribel Roseaman','2023-03-08T20:03:53.002494500','2144540926','Dr. Pratik Biswas',39.6,'BiswajitGhosal'),(120,'Biswajit Ghosal','2021-03-10T00:51:32.546385900','9932574819','Dr Steven Strange',1115.88,'BiswajitGhosal'),(123,'Biswajit Ghosal','2023-03-10T01:37:55.237346100','9932574811','Dr Steven Strange',933.63,'BiswajitGhosal'),(124,'John Cena','2022-03-10T01:43:33.651407100','9337374565','Dr Steven Strange',230.55,'BiswajitGhosal'),(125,'Biswajit Ghosal','2023-03-10T01:47:00.245506700','9932574811','Dr Steven Strange',410.85,'BiswajitGhosal'),(126,'Biswajit Ghosal','2023-03-10T01:48:56.130259','9932574811','Dr Steven Strange',531.85,'BiswajitGhosal'),(129,'John Cena','2021-05-10T02:00:13.204570900','9337374565','Dr Steven Strange',546.85,'BiswajitGhosal'),(130,'John Cena','2023-03-10T02:08:28.199169900','9337374565','Dr Steven Strange',368.88,'BiswajitGhosal'),(131,'Demetra Trevaskus','2023-03-10T10:45:49.794140400','1008740733','Dr. Pratik Biswas',650.64,'BiswajitGhosal'),(132,'Biswajit Ghosal','2021-04-10T10:49:54.879691400','9932574811','Dr. John Doe',670.75,'BiswajitGhosal'),(133,'Biswajit Ghosal','2023-03-10T10:51:41.111156100','9932574811','Dr. Pratik Biswas',917.703,'BiswajitGhosal'),(134,'Biswajit Ghosal','2023-03-10T10:53:59.453360600','9932574811','Dr. Pratik Biswas',152.5,'BiswajitGhosal'),(135,'Biswajit Ghosal','2023-03-10T10:58:18.151821','9932574811','Gaurav Kumar',446.9,'BiswajitGhosal'),(136,'Biswajit Ghosal','2023-03-10T11:26:59.877921500','9932574811','Dr. Pratik Biswas',223.45,'BiswajitGhosal'),(137,'Biswajit Ghosal','2023-03-10T23:41:46.086150200','9932574811','Dr. Pratik Biswas',1615.896,'BiswajitGhosal'),(138,'Biswajit Ghosal','2023-03-10T23:47:12.479616600','9932574811','Dr. Lokesh Reddy',275.97,'BiswajitGhosal'),(139,'Biswajit Ghosal','2023-03-11T00:08:16.098424700','9932574811','Dr. Pratik Biswas',319.11,'BiswajitGhosal'),(140,'Biswajit Ghosal','2023-03-11T00:10:29.415924800','9932574811','Dr. Pratik Biswas',997.28,'BiswajitGhosal'),(141,'Biswajit Ghosal','2023-03-11T00:13:22.553089600','9932574811','Gaurav Kumar',183.7,'BiswajitGhosal'),(142,'Biswajit Ghosal','2023-03-11T00:16:21.283864400','9932574811','Dr. Lokesh Reddy',1325.763,'BiswajitGhosal'),(143,'Biswajit Ghosal','2023-03-11T00:20:24.394095800','9932574811','Dr. Pratik Biswas',1837.53,'BiswajitGhosal'),(144,'Biswajit Ghosal','2023-03-11T00:28:38.007676700','9932574811','Dr. Pratik Biswas',1345.896,'BiswajitGhosal'),(145,'Biswajit Ghosal','2023-03-11T00:30:35.932053500','9932574811','Dr. Pratik Biswas',981.57,'BiswajitGhosal'),(146,'Biswajit Ghosal','2023-03-11T00:32:54.260301300','9932574811','Dr. Pratik Biswas',1788.993,'BiswajitGhosal'),(147,'Biswajit Ghosal','2023-03-11T00:36:19.975257500','9932574811','Dr.Lokesh Reddy',686.21,'BiswajitGhosal'),(148,'Ritwik Shaw','2023-03-11T11:29:20.511900200','8777053689','Dr. John Doe',1386.783,'BiswajitGhosal'),(149,'Biswajit Ghosal','2023-03-11T11:35:46.678601600','9932574811','Dr. Pratik Biswas',1402.956,'BiswajitGhosal'),(150,'Biswajit Ghosal','2023-03-12T18:22:13.863288','9932574811','Dr. John Doe',910.81,'BiswajitGhosal'),(154,'Biswajit Ghosal','2023-03-12T23:00:03.508210900','9932574811','Dr. Avik Saha',4663.63,'BiswajitGhosal'),(155,'Biswajit Ghosal','2023-03-12T23:16:55.347763900','9932574811','dr pratik biswas',1199.511,'BiswajitGhosal'),(157,'Biswajit Ghosal','2023-03-12T23:30:08.371651800','9932574811','Dr. John Doe',864.78,'BiswajitGhosal'),(161,'Biswajit Ghosal','2023-03-12T23:45:58.182707200','9932574811','Dr. John Doe',142.74,'BiswajitGhosal'),(165,'Biswajit Ghosal','2023-03-13T20:54:19.975307500','9932574811','Dr. John Doe',160.18,'Aditya  Sharma'),(167,'Biswajit Ghosal','2023-03-13T21:07:40.610980','9932574811','Dr. Lokesh Reddy',1440.666,'Aditya  Sharma'),(168,'Biswajit Ghosal','2023-03-13T21:42:20.370024','9932574811','Dr. John Doe',2470.32,'Aditya  Sharma'),(170,'Biswajit Ghosal','2023-03-13T21:53:21.626836600','9932574811','Dr. John Doe',0,'Aditya  Sharma'),(172,'Ritwik Shaw','2023-03-14T15:12:07.391734500','8777053689','Dr. John Doe',0,'Aditya  Sharma'),(173,'Biswajit Ghosal','2023-03-14T15:16:15.077804400','9932574811','Dr. John Doe',0,'Aditya  Sharma'),(174,'Ritwik Shaw','2023-03-14T15:19:00.108084600','8777053689','Dr. John Doe',183.69,'Aditya  Sharma'),(175,'Biswajit Ghosal','2023-03-16T19:33:43.266614','9932574811','Dr. John Doe',0,'Aditya  Sharma'),(176,'Biswajit Ghosal','2023-03-16T20:58:42.826686400','9932574811','Dr. John Doe',78.85,'Aditya  Sharma'),(177,'Biswajit Ghosal','2023-03-17T14:29:01.649250400','9932574811','Dr. John Doe',918.45,'Aditya  Sharma');
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
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
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `orders_AFTER_UPDATE` AFTER UPDATE ON `orders` FOR EACH ROW BEGIN
delete from products where  orderId in (select orderId from orders where orders.totalPrice=0);
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
