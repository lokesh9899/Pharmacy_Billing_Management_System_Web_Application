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
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `userId` int NOT NULL AUTO_INCREMENT,
  `emailId` varchar(45) NOT NULL,
  `password` varchar(45) NOT NULL,
  `firstName` varchar(45) NOT NULL,
  `lastName` varchar(45) NOT NULL,
  `roleId` int NOT NULL DEFAULT '2',
  PRIMARY KEY (`userId`),
  UNIQUE KEY `emailId_UNIQUE` (`emailId`),
  KEY `fk_admin_role_idx` (`roleId`),
  CONSTRAINT `fk_admin_role` FOREIGN KEY (`roleId`) REFERENCES `role` (`roleId`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=152 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (5,'admin@gmail.com','25d55ad283aa400af464c76d713c07ad','John','Doe',1),(9,'employee@gmail.com','25d55ad283aa400af464c76d713c07ad','Aditya',' Sharma',2),(142,'gauravkumar12y@gmail.com','b5a99bdaeb247f6b650a75d0a001b708','Gaurav','Kumar',2),(143,'shawritwik2@gmail.com','51b0009da22f29f7d13da9568bd07099','Ritwik','Shaw',2),(144,'lokeshreddy9899@gmail.com','a799bbc235a47144178e3464630d5adb','Lokesh','Reddy',2),(146,'sandeepkamila43@gmail.com','8d89deab528cc42d2f1787fbbba7c319','Sandeep','Kamila',2),(147,'pritamkabita@gmail.com','1be687b1dad22686bf31cc5d2bae0bba','pratik','Biswas',2),(148,'rdiggons0@state.gov','uC6OQHElTzF6','Reeta','Diggons',2),(151,'ghosalbiswajit11@gmail.com','4fdccb5cbc911ad34f87f5b7014231ca','Biswajit','Ghosal',2);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-03-17 21:02:12
