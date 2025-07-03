-- MySQL dump 10.13  Distrib 8.0.38, for Win64 (x86_64)
--
-- Host: localhost    Database: sistem_za_regrutaciju
-- ------------------------------------------------------
-- Server version	8.0.38

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
-- Table structure for table `firma`
--

DROP TABLE IF EXISTS `firma`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `firma` (
  `id` int NOT NULL AUTO_INCREMENT,
  `naziv` varchar(100) NOT NULL,
  `opis_posla` text NOT NULL,
  `lokacija` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `firma`
--

LOCK TABLES `firma` WRITE;
/*!40000 ALTER TABLE `firma` DISABLE KEYS */;
INSERT INTO `firma` VALUES (1,'firma1','opis1','Podgorica'),(2,'firma2','opis2','Podgorica'),(3,'firma3','opis3','Podgorica'),(4,'firma4','opis4','Podgorica'),(5,'firma5','opis5','Podgorica');
/*!40000 ALTER TABLE `firma` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `intervjui`
--

DROP TABLE IF EXISTS `intervjui`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `intervjui` (
  `id` int NOT NULL AUTO_INCREMENT,
  `prijava_id` int NOT NULL,
  `regruter_id` int NOT NULL,
  `datum_intervjua` datetime NOT NULL,
  `komentari` text,
  `ocjena` decimal(3,2) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `prijava_id` (`prijava_id`),
  KEY `regruter_id` (`regruter_id`),
  CONSTRAINT `intervjui_ibfk_1` FOREIGN KEY (`prijava_id`) REFERENCES `prijave` (`id`) ON DELETE CASCADE,
  CONSTRAINT `intervjui_ibfk_2` FOREIGN KEY (`regruter_id`) REFERENCES `regruteri` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `intervjui`
--

LOCK TABLES `intervjui` WRITE;
/*!40000 ALTER TABLE `intervjui` DISABLE KEYS */;
/*!40000 ALTER TABLE `intervjui` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `kandidati`
--

DROP TABLE IF EXISTS `kandidati`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `kandidati` (
  `id` int NOT NULL AUTO_INCREMENT,
  `ime` varchar(50) NOT NULL,
  `prezime` varchar(50) NOT NULL,
  `email` varchar(100) NOT NULL,
  `telefon` varchar(20) DEFAULT NULL,
  `radno_iskustvo_godine` int DEFAULT NULL,
  `obrazovanje` varchar(100) DEFAULT NULL,
  `sertifikati` varchar(100) DEFAULT NULL,
  `jezici` varchar(100) DEFAULT NULL,
  `status_prijave` enum('U razmatranju','Poziv za intervju','Odbijen','Prihvaćen') DEFAULT 'U razmatranju',
  `datum_registracije` datetime DEFAULT CURRENT_TIMESTAMP,
  `lozinka` varchar(255) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`),
  CONSTRAINT `kandidati_chk_1` CHECK ((`radno_iskustvo_godine` >= 0))
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `kandidati`
--

LOCK TABLES `kandidati` WRITE;
/*!40000 ALTER TABLE `kandidati` DISABLE KEYS */;
INSERT INTO `kandidati` VALUES (1,'Ime1','Prezime1','email@jedan.com',NULL,5,'visoko',NULL,'engleski','Odbijen','2025-05-22 00:00:00','lozinka1','usernam1'),(2,'ime2','Prezime2','email@dva.com',NULL,4,'Visoko',NULL,'francuski,engleski,spanski','U razmatranju','2025-05-22 00:00:00','lozinka2','usernameKandidat'),(3,'Ime3','Prezime3','email@tri.com',NULL,6,'visoko',NULL,'engleski','U razmatranju','2025-05-22 00:00:00','lozinka3','username3'),(18,'Ime11','Prezime11','email11@gmail.com',NULL,5,'','','francuski','U razmatranju','2025-06-10 00:00:00',NULL,'username11'),(19,'terdytfuygiu','cfygvuhbijn','email@gmail.com',NULL,4,'Visoko',NULL,'engleski','U razmatranju','2025-06-13 11:00:56',NULL,NULL),(20,'Ime1112','Prezime1112','email1112@gmail.com',NULL,5,'Visoko','','engleski','U razmatranju','2025-06-13 11:02:57',NULL,'username112');
/*!40000 ALTER TABLE `kandidati` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `log_in_sign_up`
--

DROP TABLE IF EXISTS `log_in_sign_up`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `log_in_sign_up` (
  `id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(50) DEFAULT NULL,
  `ime` varchar(50) DEFAULT NULL,
  `prezime` varchar(50) NOT NULL,
  `email` varchar(100) NOT NULL,
  `lozinka` varchar(255) NOT NULL,
  `tip` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `prezime` (`prezime`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `log_in_sign_up`
--

LOCK TABLES `log_in_sign_up` WRITE;
/*!40000 ALTER TABLE `log_in_sign_up` DISABLE KEYS */;
INSERT INTO `log_in_sign_up` VALUES (1,'usernameRegruter','Ime1','Prezime1','emailRegruter@gmail.com','lozinka1','regruter'),(2,'usernameKandidat','Ime2','prezime2','emailKandidat@gmail.com','lozinka2','kandidat'),(3,'jdoe','John','Doe','john.doe@example.com','secret123','kandidat'),(4,'john.de@example.com','jde','John','De','s123','kandidat'),(16,'username11','Ime11','Prezime11','email11@gmail.com','lozinka11','kandidat'),(18,'username112','Ime1112','Prezime1112','email1112@gmail.com','lozinka2','kandidat');
/*!40000 ALTER TABLE `log_in_sign_up` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `obavestenja`
--

DROP TABLE IF EXISTS `obavestenja`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `obavestenja` (
  `id` int NOT NULL AUTO_INCREMENT,
  `kandidat_id` int DEFAULT NULL,
  `sadrzaj` text NOT NULL,
  `status` enum('Nepročitano','Pročitano') DEFAULT 'Nepročitano',
  `datum_slanja` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `kandidat_id` (`kandidat_id`),
  CONSTRAINT `obavestenja_ibfk_1` FOREIGN KEY (`kandidat_id`) REFERENCES `kandidati` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `obavestenja`
--

LOCK TABLES `obavestenja` WRITE;
/*!40000 ALTER TABLE `obavestenja` DISABLE KEYS */;
/*!40000 ALTER TABLE `obavestenja` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pozicije`
--

DROP TABLE IF EXISTS `pozicije`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pozicije` (
  `id` int NOT NULL AUTO_INCREMENT,
  `firma_id` int DEFAULT NULL,
  `naziv_firme` varchar(100) DEFAULT NULL,
  `naziv_pozicije` varchar(100) NOT NULL,
  `opis_posla` text NOT NULL,
  `zahtijevano_iskustvo` int DEFAULT NULL,
  `potrebne_kvalifikacije` text,
  `lokacija` varchar(100) DEFAULT NULL,
  `datum_objave` datetime DEFAULT CURRENT_TIMESTAMP,
  `datum_isteka` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `firma_id` (`firma_id`),
  CONSTRAINT `pozicije_ibfk_1` FOREIGN KEY (`firma_id`) REFERENCES `firma` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pozicije`
--

LOCK TABLES `pozicije` WRITE;
/*!40000 ALTER TABLE `pozicije` DISABLE KEYS */;
INSERT INTO `pozicije` VALUES (1,2,'firma1','pozicija1','opis1',5,NULL,'Podgorica','2025-05-22 00:00:00','2025-05-22'),(2,1,'firma2','pozicija2','opis2',4,NULL,'Podgorica','2025-05-22 00:00:00','2025-05-22'),(3,3,'firma3','pozicija3','opis3',3,NULL,'Podgorica','2025-05-22 00:00:00','2025-05-22'),(4,4,'firma4','posicija4','opis4',2,NULL,'Podgorica','2025-05-22 00:00:00','2025-05-22'),(5,5,'firma5','pozicija5','opis5',4,NULL,'Podgorica','2025-05-22 00:00:00','2025-05-22'),(9,1,'firma1','pozicija4','opis4',5,'ll','Podgorica','2025-06-10 00:00:00','2025-06-10'),(10,1,'firma1','pozicija15','opis15',5,NULL,'Podgorica','2025-06-10 00:00:00','2025-06-10'),(12,1,'firma1','pozicija5','opis5',4,NULL,'Podgorica','2025-06-13 00:00:00','2025-06-13'),(14,1,'firma1','Pozicija112','Opis112',5,NULL,'Podgorica','2025-06-30 00:00:00','2025-06-30');
/*!40000 ALTER TABLE `pozicije` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `prijave`
--

DROP TABLE IF EXISTS `prijave`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `prijave` (
  `id` int NOT NULL AUTO_INCREMENT,
  `kandidat_id` int NOT NULL,
  `pozicija_id` int NOT NULL,
  `status_prijave` enum('U razmatranju','Poziv za intervju','Odbijen','Prihvaćen') DEFAULT 'U razmatranju',
  `datum_prijave` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `kandidat_id` (`kandidat_id`),
  KEY `pozicija_id` (`pozicija_id`),
  CONSTRAINT `prijave_ibfk_1` FOREIGN KEY (`kandidat_id`) REFERENCES `kandidati` (`id`) ON DELETE CASCADE,
  CONSTRAINT `prijave_ibfk_2` FOREIGN KEY (`pozicija_id`) REFERENCES `pozicije` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `prijave`
--

LOCK TABLES `prijave` WRITE;
/*!40000 ALTER TABLE `prijave` DISABLE KEYS */;
INSERT INTO `prijave` VALUES (1,1,1,'U razmatranju','2025-05-24 00:00:00'),(2,1,2,'U razmatranju','2025-05-22 00:00:00'),(5,1,5,'U razmatranju','2025-05-22 00:00:00'),(6,2,2,'Poziv za intervju','2025-05-27 00:00:00'),(9,1,5,'U razmatranju','2025-06-10 16:57:53'),(10,2,1,'U razmatranju','2025-06-10 17:11:27'),(11,2,4,'U razmatranju','2025-06-10 17:12:14'),(16,18,1,'U razmatranju','2025-06-10 19:53:30'),(17,18,2,'U razmatranju','2025-06-10 19:56:03'),(18,18,4,'U razmatranju','2025-06-10 19:57:01'),(19,2,5,'U razmatranju','2025-06-10 19:59:38'),(24,2,10,'Poziv za intervju','2025-06-13 00:00:00'),(25,20,1,'U razmatranju','2025-06-13 11:02:57');
/*!40000 ALTER TABLE `prijave` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `regruteri`
--

DROP TABLE IF EXISTS `regruteri`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `regruteri` (
  `id` int NOT NULL AUTO_INCREMENT,
  `ime` varchar(50) NOT NULL,
  `prezime` varchar(50) NOT NULL,
  `email` varchar(100) NOT NULL,
  `telefon` varchar(20) DEFAULT NULL,
  `lozinka` varchar(255) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  `firma_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `regruteri`
--

LOCK TABLES `regruteri` WRITE;
/*!40000 ALTER TABLE `regruteri` DISABLE KEYS */;
INSERT INTO `regruteri` VALUES (10,'ime1','prezime1','',NULL,'lozinka1','usernameRegruter',1),(11,'ime2','prezime2','emailRegruter2@gmail.com',NULL,'lozinka2','usernameRegruter2',2),(12,'ime3','prezime3','emailRegruter3@gmail.com',NULL,'lozinka3','usernameRegruter3',3),(13,'ime4','prezime4','emailRegruter4@gmail.com',NULL,'lozinka4','usernameRegruter4',4),(14,'ime5','prezime5','emailRegrute5r@gmail.com',NULL,'lozinka5','usernameRegruter5',5);
/*!40000 ALTER TABLE `regruteri` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `testiranja`
--

DROP TABLE IF EXISTS `testiranja`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `testiranja` (
  `id` int NOT NULL AUTO_INCREMENT,
  `prijava_id` int NOT NULL,
  `test_id` int NOT NULL,
  `rezultat` decimal(5,2) DEFAULT NULL,
  `datum_polaganja` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `prijava_id` (`prijava_id`),
  KEY `test_id` (`test_id`),
  CONSTRAINT `testiranja_ibfk_1` FOREIGN KEY (`prijava_id`) REFERENCES `prijave` (`id`) ON DELETE CASCADE,
  CONSTRAINT `testiranja_ibfk_2` FOREIGN KEY (`test_id`) REFERENCES `testovi` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `testiranja`
--

LOCK TABLES `testiranja` WRITE;
/*!40000 ALTER TABLE `testiranja` DISABLE KEYS */;
/*!40000 ALTER TABLE `testiranja` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `testovi`
--

DROP TABLE IF EXISTS `testovi`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `testovi` (
  `id` int NOT NULL AUTO_INCREMENT,
  `naziv_testa` varchar(100) NOT NULL,
  `opis_testa` text,
  `pozicija_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `pozicija_id` (`pozicija_id`),
  CONSTRAINT `testovi_ibfk_1` FOREIGN KEY (`pozicija_id`) REFERENCES `pozicije` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `testovi`
--

LOCK TABLES `testovi` WRITE;
/*!40000 ALTER TABLE `testovi` DISABLE KEYS */;
/*!40000 ALTER TABLE `testovi` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  `last_name` varchar(50) DEFAULT NULL,
  `username` varchar(50) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  `role` enum('KANDIDAT','REGRUTER') NOT NULL,
  `kandidat_id` int DEFAULT NULL,
  `regruter_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`),
  UNIQUE KEY `email` (`email`),
  KEY `kandidat_id` (`kandidat_id`),
  KEY `regruter_id` (`regruter_id`),
  CONSTRAINT `users_ibfk_1` FOREIGN KEY (`kandidat_id`) REFERENCES `kandidati` (`id`) ON DELETE CASCADE,
  CONSTRAINT `users_ibfk_2` FOREIGN KEY (`regruter_id`) REFERENCES `regruteri` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zakazi_intervju`
--

DROP TABLE IF EXISTS `zakazi_intervju`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `zakazi_intervju` (
  `id` int NOT NULL AUTO_INCREMENT,
  `naziv_pozicije` varchar(100) DEFAULT NULL,
  `kandidat_username` varchar(100) DEFAULT NULL,
  `regruter_username` varchar(100) DEFAULT NULL,
  `datum_intervjua` datetime DEFAULT NULL,
  `link` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zakazi_intervju`
--

LOCK TABLES `zakazi_intervju` WRITE;
/*!40000 ALTER TABLE `zakazi_intervju` DISABLE KEYS */;
INSERT INTO `zakazi_intervju` VALUES (3,'pozicija2','usernameKandidat','usernameRegruter','2025-07-24 16:00:00',NULL);
/*!40000 ALTER TABLE `zakazi_intervju` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-07-03 12:59:17
