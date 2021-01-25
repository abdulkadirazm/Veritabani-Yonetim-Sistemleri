CREATE DATABASE  IF NOT EXISTS `school` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `school`;
-- MySQL dump 10.13  Distrib 5.7.17, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: school
-- ------------------------------------------------------
-- Server version	5.5.5-10.4.11-MariaDB

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
-- Table structure for table `course`
--

DROP TABLE IF EXISTS `course`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `course` (
  `cid` decimal(5,0) NOT NULL,
  `title` varchar(30) NOT NULL,
  `credits` decimal(2,0) DEFAULT NULL,
  `did` decimal(5,0) DEFAULT NULL,
  `avgGrade` float DEFAULT NULL,
  PRIMARY KEY (`cid`),
  KEY `did` (`did`),
  CONSTRAINT `course_ibfk_1` FOREIGN KEY (`did`) REFERENCES `department` (`did`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `course`
--

LOCK TABLES `course` WRITE;
/*!40000 ALTER TABLE `course` DISABLE KEYS */;
INSERT INTO `course` VALUES (1,'Database Systems',3,1,NULL),(2,'Operating Systems',3,1,NULL),(3,'Introduction to Programming',4,1,NULL),(4,'Introduction to Electronic',2,2,NULL),(5,'Statistic',4,4,NULL),(6,'Circuit Theory',3,3,NULL),(7,'Introduction to Environment',3,2,NULL),(8,'Operation Research',3,4,NULL),(9,'Summer Practice',2,4,NULL),(10,'Summer Practice',3,3,NULL),(11,'Summer Practice',3,1,NULL),(12,'Summer Practice',3,2,NULL),(13,'Cocuk Psikolojisi',3,5,NULL);
/*!40000 ALTER TABLE `course` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `department`
--

DROP TABLE IF EXISTS `department`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `department` (
  `did` decimal(5,0) NOT NULL,
  `name` varchar(30) NOT NULL,
  `avgGrade` float DEFAULT NULL,
  PRIMARY KEY (`did`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `department`
--

LOCK TABLES `department` WRITE;
/*!40000 ALTER TABLE `department` DISABLE KEYS */;
INSERT INTO `department` VALUES (1,'Bilgisayar Muhendisligi',NULL),(2,'Endustri Muhendisligi',NULL),(3,'Elektrik Muhendisligi',NULL),(4,'Kimya Muhendisligi',NULL),(5,'Piskoloji',NULL);
/*!40000 ALTER TABLE `department` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `student`
--

DROP TABLE IF EXISTS `student`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `student` (
  `sid` decimal(5,0) NOT NULL,
  `name` varchar(30) NOT NULL,
  `did` decimal(5,0) DEFAULT NULL,
  `avgGrade` float DEFAULT NULL,
  PRIMARY KEY (`sid`),
  KEY `did` (`did`),
  CONSTRAINT `student_ibfk_1` FOREIGN KEY (`did`) REFERENCES `department` (`did`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student`
--

LOCK TABLES `student` WRITE;
/*!40000 ALTER TABLE `student` DISABLE KEYS */;
INSERT INTO `student` VALUES (1,'Ali Kurt',1,NULL),(2,'Ayse Kurt',1,NULL),(3,'Kamil Kuru',1,NULL),(4,'Yavuz Genc',2,NULL),(5,'Nejat Fulu',2,NULL),(6,'Erdal Biyik',3,NULL),(7,'Serkan Aslan',3,NULL),(8,'Osman Sonat',4,NULL),(9,'Neriman Bandi',2,NULL),(10,'Peril Ovun',4,NULL),(11,'Tarik Inanc',4,NULL),(12,'Kamuran Akkus',1,NULL),(13,'Hilal Kocabiyik',5,NULL),(14,'Murat Kosovali',1,NULL);
/*!40000 ALTER TABLE `student` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `take`
--

DROP TABLE IF EXISTS `take`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `take` (
  `sid` decimal(5,0) NOT NULL,
  `cid` decimal(5,0) NOT NULL,
  `grade` float DEFAULT NULL,
  PRIMARY KEY (`sid`,`cid`),
  KEY `cid` (`cid`),
  CONSTRAINT `take_ibfk_1` FOREIGN KEY (`sid`) REFERENCES `student` (`sid`),
  CONSTRAINT `take_ibfk_2` FOREIGN KEY (`cid`) REFERENCES `course` (`cid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `take`
--

LOCK TABLES `take` WRITE;
/*!40000 ALTER TABLE `take` DISABLE KEYS */;
INSERT INTO `take` VALUES (1,1,75),(1,3,62.5),(1,4,75.5),(1,6,75),(1,9,100),(1,10,75),(2,1,68),(2,2,100),(2,3,4),(2,4,100),(2,5,23),(2,6,100),(2,7,13),(2,8,100),(2,9,100),(2,10,75),(2,11,100),(3,1,100),(3,2,65),(3,3,88),(3,4,71),(3,5,100),(3,6,34),(3,7,23),(3,8,100),(3,9,31),(3,10,75),(3,11,75.5),(4,1,62.5),(4,5,33),(5,1,75),(5,5,33),(5,11,75.5),(6,2,100),(7,1,62.5),(7,2,75),(7,5,33),(7,8,33),(8,2,75.5),(8,7,30),(9,3,21),(9,4,23),(10,2,100),(10,8,75),(11,8,25),(12,3,85),(12,8,45),(12,12,60),(13,13,95),(14,12,67);
/*!40000 ALTER TABLE `take` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `teach`
--

DROP TABLE IF EXISTS `teach`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `teach` (
  `tid` decimal(5,0) NOT NULL,
  `cid` decimal(5,0) NOT NULL,
  PRIMARY KEY (`tid`,`cid`),
  KEY `cid` (`cid`),
  CONSTRAINT `teach_ibfk_1` FOREIGN KEY (`tid`) REFERENCES `teacher` (`tid`),
  CONSTRAINT `teach_ibfk_2` FOREIGN KEY (`cid`) REFERENCES `course` (`cid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `teach`
--

LOCK TABLES `teach` WRITE;
/*!40000 ALTER TABLE `teach` DISABLE KEYS */;
INSERT INTO `teach` VALUES (1,1),(1,11),(2,3),(3,2),(4,3),(4,4),(4,6),(4,12),(5,7),(5,10),(6,8),(7,2),(7,5),(7,9);
/*!40000 ALTER TABLE `teach` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `teacher`
--

DROP TABLE IF EXISTS `teacher`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `teacher` (
  `tid` decimal(5,0) NOT NULL,
  `name` varchar(30) NOT NULL,
  `did` decimal(5,0) DEFAULT NULL,
  `courseCount` decimal(5,0) DEFAULT 0,
  PRIMARY KEY (`tid`),
  KEY `did` (`did`),
  CONSTRAINT `teacher_ibfk_1` FOREIGN KEY (`did`) REFERENCES `department` (`did`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `teacher`
--

LOCK TABLES `teacher` WRITE;
/*!40000 ALTER TABLE `teacher` DISABLE KEYS */;
INSERT INTO `teacher` VALUES (1,'Ozgur Abuy',1,0),(2,'Sibel Akin',1,0),(3,'Safiye Guclu',1,0),(4,'Yucel Tufekci',2,0),(5,'Ali Ozer',3,0),(6,'Serhat Colak',4,0),(7,'Ece Sevil',4,0),(8,'Alparslan Kurt',1,0);
/*!40000 ALTER TABLE `teacher` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-01-25 15:19:35
