-- MariaDB dump 10.19  Distrib 10.5.13-MariaDB, for debian-linux-gnu (x86_64)
--
-- Host: 37.75.8.238    Database: DB_HASTANE_TELETIP
-- ------------------------------------------------------
-- Server version	10.4.22-MariaDB-1:10.4.22+maria~focal

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `ABD`
--

DROP TABLE IF EXISTS `ABD`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ABD` (
  `abd_ID` int(11) NOT NULL AUTO_INCREMENT,
  `abd_isim` varchar(30) NOT NULL,
  PRIMARY KEY (`abd_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ABD`
--

LOCK TABLES `ABD` WRITE;
/*!40000 ALTER TABLE `ABD` DISABLE KEYS */;
INSERT INTO `ABD` VALUES (1,'Patoloji'),(2,'Onkoloji'),(3,'Embriyoloji'),(4,'Dermatoloji'),(5,'Radyoloji'),(6,'Psikiyatri'),(7,'Dahiliye'),(8,'Nöroloji'),(9,'Üroloji'),(10,'Ortopedi'),(11,'Anestiyoloji');
/*!40000 ALTER TABLE `ABD` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary table structure for view `AnaBilim`
--

DROP TABLE IF EXISTS `AnaBilim`;
/*!50001 DROP VIEW IF EXISTS `AnaBilim`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `AnaBilim` (
  `doktor_ID` tinyint NOT NULL,
  `doktor_ISIM` tinyint NOT NULL,
  `doktor_SOYISIM` tinyint NOT NULL,
  `abd_isim` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `Doktorlar`
--

DROP TABLE IF EXISTS `Doktorlar`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Doktorlar` (
  `doktor_ID` int(11) NOT NULL AUTO_INCREMENT,
  `doktor_ISIM` varchar(20) NOT NULL,
  `doktor_SOYISIM` varchar(20) NOT NULL,
  `doktor_MAIL` varchar(60) NOT NULL,
  `doktor_FOTO` varchar(100) DEFAULT NULL,
  `doktor_SIFRE` varchar(20) NOT NULL,
  PRIMARY KEY (`doktor_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Doktorlar`
--

LOCK TABLES `Doktorlar` WRITE;
/*!40000 ALTER TABLE `Doktorlar` DISABLE KEYS */;
INSERT INTO `Doktorlar` VALUES (1,'Yunus','Emre','cemkaraca@yandex.com','','112233'),(2,'Barış','Manço','baris@yahoo.com','','2334'),(3,'Erkin','Koray','korayerkin123@hotmail.com','','2345'),(4,'Haluk','Levent','h.levent@outlook.com','','2342'),(5,'Ahmet','Kaya','ahmetkaya@yahoo.com','','2123'),(6,'Neşet','Ertaş','ertasneset@gmail.com','','2132'),(7,'Müslüm','Gürses','muslum@outlook.com','','2343'),(8,'Selda','Bağcan','bagcanselda@gmail.com','','1234'),(9,'Volkan','Konak','konak@hotmail.com','','2145');
/*!40000 ALTER TABLE `Doktorlar` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Hastalar`
--

DROP TABLE IF EXISTS `Hastalar`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Hastalar` (
  `hasta_ID` int(11) NOT NULL AUTO_INCREMENT,
  `hasta_ISIM` varchar(20) NOT NULL,
  `hasta_SOYISIM` varchar(20) NOT NULL,
  `hasta_SIFRE` varchar(20) NOT NULL,
  `hasta_MAIL` varchar(60) NOT NULL,
  `hasta_FOTO` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`hasta_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Hastalar`
--

LOCK TABLES `Hastalar` WRITE;
/*!40000 ALTER TABLE `Hastalar` DISABLE KEYS */;
INSERT INTO `Hastalar` VALUES (1,'Ferman','Akgül','21344','ferman@gmail.com',''),(2,'Yağmur','Sarıgül','3435','sarigül@hotmail.com',''),(3,'Cem','Bahtiyar','3245','bahtiyar@yahoo.com',''),(4,'Özgür Can','Onay','4324','ozgurcan@live.com',NULL),(5,'Ogün','Sanlisoy','5657','ogun@yandex.com',NULL),(6,'Emre','Aydın','7658','emreaydin@gmail.com',NULL),(7,'Kaan','Tangöze','4567','kaan@live.com',NULL),(8,'Teoman','Yakupoğlu','6758','teo@hotmail.com',''),(9,'Fatma','Turgut','3634','turgutfatma@gmail.com',NULL),(10,'ahmet','kilic','1233','ahmetkilic@gmail.com',NULL);
/*!40000 ALTER TABLE `Hastalar` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Mesajlar`
--

DROP TABLE IF EXISTS `Mesajlar`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Mesajlar` (
  `mesaj_ID` int(11) NOT NULL AUTO_INCREMENT,
  `doktor_ID` int(11) NOT NULL,
  `hasta_ID` int(11) NOT NULL,
  `mesaj` varchar(50) NOT NULL,
  `eklenti_path` varchar(100) DEFAULT NULL,
  `mesaj_tarihi` timestamp NOT NULL DEFAULT current_timestamp(),
  `gonderen` varchar(10) NOT NULL,
  PRIMARY KEY (`mesaj_ID`),
  KEY `Mesajlar_ibfk_1` (`doktor_ID`),
  KEY `Mesajlar_ibfk_2` (`hasta_ID`),
  CONSTRAINT `Mesajlar_ibfk_1` FOREIGN KEY (`doktor_ID`) REFERENCES `Doktorlar` (`doktor_ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `Mesajlar_ibfk_2` FOREIGN KEY (`hasta_ID`) REFERENCES `Hastalar` (`hasta_ID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Mesajlar`
--

LOCK TABLES `Mesajlar` WRITE;
/*!40000 ALTER TABLE `Mesajlar` DISABLE KEYS */;
INSERT INTO `Mesajlar` VALUES (1,1,6,'Doktor hastalığım nedir?','0','2022-01-21 20:42:14','hasta'),(2,1,6,'Fıtık','0','2022-01-21 20:42:40','doktor'),(3,4,6,'Kan sonuçlarınız geldi','0','2022-01-22 10:22:16','doktor'),(4,4,6,'Sonuçlarımda herhangi bir sorun gözüküyor mu?','0','2022-01-22 10:23:07','hasta'),(5,4,6,'Kanınınızdaki şeker oranı çok yüksek','0','2022-01-22 10:29:30','doktor'),(6,4,6,'Bunun için size ekstra testler uygulamak istiyoruz','0','2022-01-22 10:30:44','doktor'),(7,4,6,'En yakın zamanda yanıma uğrayın','0','2022-01-22 10:31:21','doktor'),(8,4,6,'Tamamdır doktor bey, yarın yanınıza uğrayacağım','0','2022-01-22 10:33:39','hasta'),(9,4,5,'Doktor bey verdiğiniz ilaç ağrılarımı hala kesmedi','0','2022-01-22 10:35:58','hasta'),(10,4,5,'Anlıyorum, fakat şu an için bu durum normal','0','2022-01-22 10:37:19','doktor'),(11,4,5,'ilaçlarınızı düzenli kullanmanız gerekiyor','0','2022-01-22 10:39:06','doktor'),(12,4,5,'Birkaç haftaya ancak ağrılarınız kesilir','0','2022-01-22 10:39:49','doktor'),(13,4,5,'Lütfen ilaçlarınızı düzenli takip edin','0','2022-01-22 10:42:16','doktor'),(14,4,5,'Ağrı kesmiyor diye bırakırsanız tedavi olamazsınız','0','2022-01-22 10:43:05','doktor'),(15,4,5,'Anlıyorum doktor bey, teşekkür ederim','0','2022-01-22 10:43:49','hasta'),(16,4,5,'Rica ederim','0','2022-01-22 10:44:24','doktor'),(17,4,5,'Ağrılarınız kesilirse ya da artarsa bana yazın','0','2022-01-22 10:44:59','doktor');
/*!40000 ALTER TABLE `Mesajlar` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary table structure for view `UZMANLIK`
--

DROP TABLE IF EXISTS `UZMANLIK`;
/*!50001 DROP VIEW IF EXISTS `UZMANLIK`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `UZMANLIK` (
  `doktor_ID` tinyint NOT NULL,
  `doktor_ISIM` tinyint NOT NULL,
  `doktor_SOYISIM` tinyint NOT NULL,
  `uzmanlik_isim` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `doktor_abd_listesi`
--

DROP TABLE IF EXISTS `doktor_abd_listesi`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `doktor_abd_listesi` (
  `abd_liste_ID` int(11) NOT NULL AUTO_INCREMENT,
  `doktor_ID` int(11) NOT NULL,
  `abd_ID` int(11) NOT NULL,
  PRIMARY KEY (`abd_liste_ID`),
  KEY `doktor_abd_listesi_ibfk_1` (`abd_ID`),
  KEY `doktor_abd_listesi_ibfk_2` (`doktor_ID`),
  CONSTRAINT `doktor_abd_listesi_ibfk_1` FOREIGN KEY (`abd_ID`) REFERENCES `ABD` (`abd_ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `doktor_abd_listesi_ibfk_2` FOREIGN KEY (`doktor_ID`) REFERENCES `Doktorlar` (`doktor_ID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `doktor_abd_listesi`
--

LOCK TABLES `doktor_abd_listesi` WRITE;
/*!40000 ALTER TABLE `doktor_abd_listesi` DISABLE KEYS */;
INSERT INTO `doktor_abd_listesi` VALUES (1,5,2),(2,7,4),(3,2,5),(4,8,6),(5,6,1),(6,9,8),(7,1,3),(8,3,11),(9,4,2);
/*!40000 ALTER TABLE `doktor_abd_listesi` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `doktor_uzmanlik_listesi`
--

DROP TABLE IF EXISTS `doktor_uzmanlik_listesi`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `doktor_uzmanlik_listesi` (
  `uzmanlik_liste_ID` int(11) NOT NULL AUTO_INCREMENT,
  `doktor_ID` int(11) DEFAULT NULL,
  `uzmanlik_ID` int(11) DEFAULT NULL,
  PRIMARY KEY (`uzmanlik_liste_ID`),
  KEY `doktor_uzmanlik_listesi_ibfk_1` (`doktor_ID`),
  KEY `doktor_uzmanlik_listesi_ibfk_2` (`uzmanlik_ID`),
  CONSTRAINT `doktor_uzmanlik_listesi_ibfk_1` FOREIGN KEY (`doktor_ID`) REFERENCES `Doktorlar` (`doktor_ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `doktor_uzmanlik_listesi_ibfk_2` FOREIGN KEY (`uzmanlik_ID`) REFERENCES `uzmanliklar` (`uzmanlik_ID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `doktor_uzmanlik_listesi`
--

LOCK TABLES `doktor_uzmanlik_listesi` WRITE;
/*!40000 ALTER TABLE `doktor_uzmanlik_listesi` DISABLE KEYS */;
INSERT INTO `doktor_uzmanlik_listesi` VALUES (1,3,5),(2,9,17),(3,7,19),(4,2,15),(5,5,4),(6,1,11),(7,4,2),(8,3,7),(9,5,5),(10,8,9),(11,6,3),(12,4,8),(13,7,21);
/*!40000 ALTER TABLE `doktor_uzmanlik_listesi` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `uzmanliklar`
--

DROP TABLE IF EXISTS `uzmanliklar`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `uzmanliklar` (
  `uzmanlik_ID` int(11) NOT NULL AUTO_INCREMENT,
  `uzmanlik_isim` varchar(30) NOT NULL,
  PRIMARY KEY (`uzmanlik_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `uzmanliklar`
--

LOCK TABLES `uzmanliklar` WRITE;
/*!40000 ALTER TABLE `uzmanliklar` DISABLE KEYS */;
INSERT INTO `uzmanliklar` VALUES (1,'Akdeniz Ateşi'),(2,'Romatoid Artrid'),(3,'Astım'),(4,'Bel Soğukluğu'),(5,'Böbrek Taşı'),(6,'Safra Kesesi Taşı'),(7,'Bulaşıcı Hastalıklar'),(8,'Diyabet'),(9,'Egzama'),(10,'Felç'),(11,'Fıtık'),(12,'Gastrit'),(13,'Guatr'),(14,'Hemofili'),(15,'Kanser'),(16,'Migren'),(17,'Nefrit'),(18,'Osteoporoz'),(19,'Parkinson'),(20,'Siroz'),(21,'Zehirlenme');
/*!40000 ALTER TABLE `uzmanliklar` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'DB_HASTANE_TELETIP'
--

--
-- Dumping routines for database 'DB_HASTANE_TELETIP'
--

--
-- Final view structure for view `AnaBilim`
--

/*!50001 DROP TABLE IF EXISTS `AnaBilim`*/;
/*!50001 DROP VIEW IF EXISTS `AnaBilim`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `AnaBilim` AS select `Doktorlar`.`doktor_ID` AS `doktor_ID`,`Doktorlar`.`doktor_ISIM` AS `doktor_ISIM`,`Doktorlar`.`doktor_SOYISIM` AS `doktor_SOYISIM`,`ABD`.`abd_isim` AS `abd_isim` from ((`doktor_abd_listesi` join `Doktorlar` on(`doktor_abd_listesi`.`doktor_ID` = `Doktorlar`.`doktor_ID`)) join `ABD` on(`doktor_abd_listesi`.`abd_ID` = `ABD`.`abd_ID`)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `UZMANLIK`
--

/*!50001 DROP TABLE IF EXISTS `UZMANLIK`*/;
/*!50001 DROP VIEW IF EXISTS `UZMANLIK`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `UZMANLIK` AS select `Doktorlar`.`doktor_ID` AS `doktor_ID`,`Doktorlar`.`doktor_ISIM` AS `doktor_ISIM`,`Doktorlar`.`doktor_SOYISIM` AS `doktor_SOYISIM`,`uzmanliklar`.`uzmanlik_isim` AS `uzmanlik_isim` from ((`doktor_uzmanlik_listesi` join `Doktorlar` on(`doktor_uzmanlik_listesi`.`doktor_ID` = `Doktorlar`.`doktor_ID`)) join `uzmanliklar` on(`doktor_uzmanlik_listesi`.`uzmanlik_ID` = `uzmanliklar`.`uzmanlik_ID`)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-01-25 16:14:37
