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
-- Table structure for table `deletedemployee`
--

DROP TABLE IF EXISTS `deletedemployee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `deletedemployee` (
  `employeeId` int NOT NULL AUTO_INCREMENT,
  `firstName` varchar(45) NOT NULL,
  `lastName` varchar(45) NOT NULL,
  `city` varchar(45) NOT NULL,
  `state` varchar(45) NOT NULL,
  `pincode` varchar(45) NOT NULL,
  `gender` varchar(45) NOT NULL,
  `phoneNumber` varchar(45) NOT NULL,
  `dob` varchar(45) NOT NULL,
  `emailId` varchar(45) NOT NULL,
  `password` varchar(45) NOT NULL,
  `aadharNo` varchar(45) NOT NULL,
  PRIMARY KEY (`employeeId`)
) ENGINE=InnoDB AUTO_INCREMENT=100 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `deletedemployee`
--

LOCK TABLES `deletedemployee` WRITE;
/*!40000 ALTER TABLE `deletedemployee` DISABLE KEYS */;
INSERT INTO `deletedemployee` VALUES (50,'Sammy','Melia','Rochester','New York','249519','Female','5859367653','37','smelia12@nhs.uk','eHYnxAnTz','707293633096'),(51,'Chrissie','Limeburner','Zhelin','','670609','Male','9095153950','26','climeburner2@lycos.com','vQDZOi9Xx','929970398466'),(52,'Ronna','Peddie','Paseh','','264619','Female','1537667487','40','rpeddie5@mail.ru','Nyrb3rsI','959480574451'),(53,'Jamey','Wyper','Jiazi','','606525','Male','1873785731','65','jwyper6@flickr.com','PGfrDqRMe','850202228712'),(54,'Biswajit','Ghosal','Kolkata','West Bengal','700107','Male','9932574811','10-06-2004','employee12@gmail.com','Employee@2023','123456789012'),(55,'gaurav','Kumar','Bokaro','Jharkhand','827011','Male','9876543210','2000-02-23','gauravkumar12y@gmail.com','Gaurav@2023','993392933923'),(56,'Clarance','Fynan','Wissous','ÃŽle-de-France','253738','Male','1206403033','2000-23-02','cfynan0@guardian.co.uk','T67JJdLzvW','138744336442'),(57,'Sosanna','Lynskey','Capandanan','West Bengal','111125','Female','2707619777','2000-23-02','slynskey1@wufoo.com','bfgFOB','982282465422'),(58,'Anny','Blunt','Howrah','west bengal','889544','Female','1971074253','2000-23-02','ablunt3@accuweather.com','QYht8o8WPfP','758886386834'),(59,'Tamar','Blaszc','Kristinehamn','Jharkhand','882404','Female','4382587367','1945-01-31','tblaszczyk4@usnews.com','lxWuzYTTjpe','489252408080'),(60,'Nessie','Eiler','Czarna','Andhrapradesh','525834','Female','9084984527','2000-23-02','neiler7@cbslocal.com','bEpuvODiM','399814199914'),(61,'Adair','Brooksbie','Pasirpanjang','West Bengal','890994','Male','4729130565','2004-03-23','abrooksbie8@myspace.com','x1gnMP8','634487753195'),(62,'Max','Speller','Banda Layung','','670122','Female','1038971061','2000-23-02','mspeller9@qq.com','Ro9wkP7ItBAP','970956582917'),(63,'Constantino','Pawlik','Cayna','','612383','Male','9839727464','2000-23-02','cpawlika@admin.ch','jIlLCtF3Js','613211813844'),(64,'Cece','Caldron','KÃ¸benhavn','Region Hovedstaden','835974','Male','4748991794','2000-23-02','ccaldronb@adobe.com','IINJqHV','120525237222'),(65,'Kelly','Wyvill','StrÃ¡nÃ­','','693118','Female','8492616594','2000-23-02','kwyvillc@ebay.com','GXRya0PnxoZJ','977700143705'),(66,'Nappie','Alexandrescu','Niaojin','','553676','Male','2484654857','2000-23-02','nalexandrescud@unc.edu','3KafVod5O','881069164894'),(67,'Letti','Scaplehorn','Jiandou','','423100','Female','6979435660','2000-23-02','lscaplehorne@about.com','hcxHYmVIunu','361623407340'),(68,'Valerie','Yashanov','Mashi','','374844','Female','8578952849','2000-23-02','vyashanovf@g.co','Oj10m1sM2MDK','734748224167'),(69,'Jeni','Lossman','Itapema','','553024','Female','3673954990','2000-23-02','jlossmang@qq.com','vxoVkS','798499373908'),(70,'Susie','Rance','Ryazanâ€™','','335137','Female','7158089514','2000-23-02','sranceh@vimeo.com','ssJxI3FIT','971321766394'),(71,'Maurizio','Foxcroft','Alhambra','California','657708','Male','6265326753','2000-23-02','mfoxcrofti@etsy.com','kKpZUlK','570586558832'),(72,'Munmro','Currm','Humen','','206429','Male','2289507625','2000-23-02','mcurrmj@canalblog.com','ySkSJn','286577907102'),(73,'Roxie','Margrem','Bonriki Village','','614989','Female','6856997569','2000-23-02','rmargremk@scribd.com','K1n1MdAVx','808174738986'),(74,'Ursa','Cota','Nurlat','','340100','Female','2881330014','2000-23-02','ucotal@nasa.gov','IIcZW8dqGFnG','919116054036'),(75,'Maje','Gulvin','Zakupne','','746755','Male','4986268482','2000-23-02','mgulvinm@wordpress.com','KT8A7OPuYp6L','321964308648'),(76,'Cynthie','Tinham','Honolulu','Hawaii','815797','Female','8089587620','2000-23-02','ctinhamn@spiegel.de','h6oMRSY','534538701774'),(77,'Caty','Heselwood','Birigui','','315632','Female','9751472660','2000-23-02','cheselwoodo@feedburner.com','0nfAXWscp','296663138970'),(78,'Ardene','Delhay','Sidareja','','548295','Female','1553555922','2000-23-02','adelhayp@arizona.edu','tTU8umELwCW','661760203501'),(79,'Seumas','Shepstone','Hancheng','','708932','Male','2235344125','2000-23-02','sshepstoneq@so-net.ne.jp','CCLfckz5r9','796426241397'),(80,'Auria','Berrington','Gesik','','735203','Female','3857640321','2000-23-02','aberringtonr@de.vu','6scPGUmmI','957179039726'),(81,'Halette','Neilus','Goubangzi','','582636','Female','4933775876','2000-23-02','hneiluss@amazon.co.jp','wBQp7BWClf','247484198701'),(82,'Ives','Ginn','Huxiaoqiao','','111262','Male','5444398891','2000-23-02','iginnt@yellowpages.com','CjjUM1Ef2Jl','395608438737'),(83,'Carlina','Clutten','Tovarnik','','898755','Female','5352307357','2000-23-02','ccluttenu@hp.com','XMcLtkRMgm44','852476495877'),(84,'Adelheid','Hearns','Coyah','','209363','Female','2932280398','2000-23-02','ahearnsv@woothemes.com','Ob1dpGls3','825942117398'),(85,'Silvia','Bows','Bassar','','277822','Female','4092493319','2000-23-02','sbowsw@live.com','hD2toWzit','218293539227'),(86,'Sileas','Gillean','Cournon-d\'Auvergne','Auvergne','131727','Female','5528497557','2000-23-02','sgilleanx@goo.ne.jp','IX65Jws8gt3','486537134174'),(87,'Marty','Fancott','Panacan','','482008','Female','8288592021','2000-23-02','mfancotty@paginegialle.it','2v8P1pX','483509651761'),(88,'Cecil','Goodsir','Maojiadian','','880848','Male','9122876673','2000-23-02','cgoodsirz@bbc.co.uk','nj5RzjE0ka','226898781124'),(89,'Hailey','Siely','Enskede','Stockholm','455674','Male','9336827980','2000-23-02','hsiely10@bloomberg.com','ZxpCgByzU','305474681041'),(90,'Jilli','Treasure','PeruÃ­be','','619065','Female','3574250434','2000-23-02','jtreasure11@joomla.org','qYlOq4VX2AO','524051063525'),(91,'Ritwik','Shaw','Kolkata','West Bengal','700065','Male','8573249523','1945-03-23','ritwikshaw200102@gmail.com','987654321','847533224576'),(92,'Biswajit','Ghosal','Kolkata','West Bengal','700107','Male','9932574811','2004-06-12','employee12@gmail.com','Employee@2023','123456789012'),(93,'Ritwik','Shaw','Kolkata','West Bengal','700065','Male','9932574813','2000-06-27','shawritwik2@gmail.com','Ritwik@2023','986474440997'),(94,'Gaurav','Kumar','Bokaro','Jharkhand','827013','Male','8387234298','2000-07-11','employeegauravkumar@gmail.com','Gaurav@2023','657372273843'),(95,'Pratik','Biswas','Kolkata','West Bengal','700003','Male','8758343937','2000-07-04','pratikemployee@gmail.com','Pratik@2023','848483282812'),(96,'abcd','efgh','Kolkata','West Bengal','700001','Male','7898767876','1985-02-05','abcd@gmail.com','Abcd@1234','983474728286'),(97,'dsrgsd','dsvdsvs','Kolkata','West Bengal','700032','Male','9876543456','1950-02-07','admin4rerer3r@gmail.com','Abcd@2001','848373748488'),(98,'erfwfefwefwe','efwefwefwe','Kolkata','West Bengal','700034','Male','8488474838','2004-11-02','adminefwefwefw@gmail.com','Abcd@2023','456564646645'),(99,'Gaurav','Kumar','Bokaro','Jharkhand','827013','Male','7004117672','2000-07-11','gauravkumar12y@gmail.com','Gaurav@2023','874732748376');
/*!40000 ALTER TABLE `deletedemployee` ENABLE KEYS */;
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
