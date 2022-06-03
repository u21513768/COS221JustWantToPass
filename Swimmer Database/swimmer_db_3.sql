-- MariaDB dump 10.19  Distrib 10.7.3-MariaDB, for Win64 (AMD64)
--
-- Host: localhost    Database: swimmer_db
-- ------------------------------------------------------
-- Server version	10.7.3-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `event`
--

DROP TABLE IF EXISTS `event`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `event` (
  `Event_ID` int(11) NOT NULL AUTO_INCREMENT,
  `Event_Name` varchar(100) DEFAULT NULL,
  `Num_Races` int(11) DEFAULT NULL,
  PRIMARY KEY (`Event_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `event`
--

LOCK TABLES `event` WRITE;
/*!40000 ALTER TABLE `event` DISABLE KEYS */;
/*!40000 ALTER TABLE `event` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `event_swimmer`
--

DROP TABLE IF EXISTS `event_swimmer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `event_swimmer` (
  `Event_ID` int(11) NOT NULL,
  `Swimmer_ID` int(11) NOT NULL,
  KEY `Event_ID` (`Event_ID`),
  KEY `Swimmer_ID` (`Swimmer_ID`),
  CONSTRAINT `event_swimmer_ibfk_1` FOREIGN KEY (`Event_ID`) REFERENCES `event` (`Event_ID`),
  CONSTRAINT `event_swimmer_ibfk_2` FOREIGN KEY (`Swimmer_ID`) REFERENCES `swimmer` (`Swimmer_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `event_swimmer`
--

LOCK TABLES `event_swimmer` WRITE;
/*!40000 ALTER TABLE `event_swimmer` DISABLE KEYS */;
/*!40000 ALTER TABLE `event_swimmer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pool`
--

DROP TABLE IF EXISTS `pool`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pool` (
  `Pool_ID` int(11) NOT NULL AUTO_INCREMENT,
  `Venue_ID` int(11) DEFAULT NULL,
  `Pool_Name` varchar(100) NOT NULL,
  `Num_Lanes` int(11) DEFAULT NULL,
  PRIMARY KEY (`Pool_ID`),
  KEY `Venue_ID` (`Venue_ID`),
  CONSTRAINT `pool_ibfk_1` FOREIGN KEY (`Venue_ID`) REFERENCES `venue` (`Venue_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pool`
--

LOCK TABLES `pool` WRITE;
/*!40000 ALTER TABLE `pool` DISABLE KEYS */;
/*!40000 ALTER TABLE `pool` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `race`
--

DROP TABLE IF EXISTS `race`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `race` (
  `Race_ID` int(11) NOT NULL AUTO_INCREMENT,
  `Pool_ID` int(11) NOT NULL,
  `Event_ID` int(11) NOT NULL,
  `Date` date NOT NULL,
  `Distance` int(11) NOT NULL,
  `Stroke_Type` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`Race_ID`),
  KEY `Pool_ID` (`Pool_ID`),
  KEY `Event_ID` (`Event_ID`),
  CONSTRAINT `race_ibfk_1` FOREIGN KEY (`Pool_ID`) REFERENCES `pool` (`Pool_ID`),
  CONSTRAINT `race_ibfk_2` FOREIGN KEY (`Event_ID`) REFERENCES `event` (`Event_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `race`
--

LOCK TABLES `race` WRITE;
/*!40000 ALTER TABLE `race` DISABLE KEYS */;
/*!40000 ALTER TABLE `race` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `race_swimmer`
--

DROP TABLE IF EXISTS `race_swimmer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `race_swimmer` (
  `Race_ID` int(11) DEFAULT NULL,
  `Swimmer_ID` int(11) DEFAULT NULL,
  `Swimmer_Time` time(3) DEFAULT NULL,
  `Swimmer_Position` int(11) DEFAULT NULL,
  `Team_Position` int(11) DEFAULT NULL,
  KEY `Swimmer_ID` (`Swimmer_ID`),
  KEY `Race_ID` (`Race_ID`),
  CONSTRAINT `race_swimmer_ibfk_1` FOREIGN KEY (`Swimmer_ID`) REFERENCES `swimmer` (`Swimmer_ID`),
  CONSTRAINT `race_swimmer_ibfk_2` FOREIGN KEY (`Race_ID`) REFERENCES `race` (`Race_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `race_swimmer`
--

LOCK TABLES `race_swimmer` WRITE;
/*!40000 ALTER TABLE `race_swimmer` DISABLE KEYS */;
/*!40000 ALTER TABLE `race_swimmer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `solo_swimmer`
--

DROP TABLE IF EXISTS `solo_swimmer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `solo_swimmer` (
  `Swimmer_ID` int(11) NOT NULL,
  KEY `Swimmer_ID` (`Swimmer_ID`),
  CONSTRAINT `solo_swimmer_ibfk_1` FOREIGN KEY (`Swimmer_ID`) REFERENCES `swimmer` (`Swimmer_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `solo_swimmer`
--

LOCK TABLES `solo_swimmer` WRITE;
/*!40000 ALTER TABLE `solo_swimmer` DISABLE KEYS */;
/*!40000 ALTER TABLE `solo_swimmer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `swimmer`
--

DROP TABLE IF EXISTS `swimmer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `swimmer` (
  `Swimmer_ID` int(11) NOT NULL AUTO_INCREMENT,
  `Fname` varchar(100) NOT NULL,
  `Lname` varchar(100) NOT NULL,
  `Sex` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`Swimmer_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `swimmer`
--

LOCK TABLES `swimmer` WRITE;
/*!40000 ALTER TABLE `swimmer` DISABLE KEYS */;
/*!40000 ALTER TABLE `swimmer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `team`
--

DROP TABLE IF EXISTS `team`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `team` (
  `Team_ID` int(11) NOT NULL AUTO_INCREMENT,
  `Team_Name` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`Team_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `team`
--

LOCK TABLES `team` WRITE;
/*!40000 ALTER TABLE `team` DISABLE KEYS */;
/*!40000 ALTER TABLE `team` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `team_swimmer`
--

DROP TABLE IF EXISTS `team_swimmer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `team_swimmer` (
  `Swimmer_ID` int(11) DEFAULT NULL,
  `Team_ID` int(11) DEFAULT NULL,
  KEY `Team_ID` (`Team_ID`),
  KEY `Swimmer_ID` (`Swimmer_ID`),
  CONSTRAINT `team_swimmer_ibfk_1` FOREIGN KEY (`Team_ID`) REFERENCES `team` (`Team_ID`),
  CONSTRAINT `team_swimmer_ibfk_2` FOREIGN KEY (`Swimmer_ID`) REFERENCES `swimmer` (`Swimmer_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `team_swimmer`
--

LOCK TABLES `team_swimmer` WRITE;
/*!40000 ALTER TABLE `team_swimmer` DISABLE KEYS */;
/*!40000 ALTER TABLE `team_swimmer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `venue`
--

DROP TABLE IF EXISTS `venue`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `venue` (
  `Venue_ID` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(100) NOT NULL,
  `Opening_hours` time DEFAULT NULL,
  `Street_Name` varchar(100) DEFAULT NULL,
  `Area_Code` varchar(20) DEFAULT NULL,
  `Street_Number` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`Venue_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `venue`
--

LOCK TABLES `venue` WRITE;
/*!40000 ALTER TABLE `venue` DISABLE KEYS */;
/*!40000 ALTER TABLE `venue` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `venue_event`
--

DROP TABLE IF EXISTS `venue_event`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `venue_event` (
  `Venue_ID` int(11) NOT NULL,
  `Event_ID` int(11) NOT NULL,
  KEY `Event_ID` (`Event_ID`),
  KEY `Venue_ID` (`Venue_ID`),
  CONSTRAINT `venue_event_ibfk_1` FOREIGN KEY (`Event_ID`) REFERENCES `event` (`Event_ID`),
  CONSTRAINT `venue_event_ibfk_2` FOREIGN KEY (`Venue_ID`) REFERENCES `venue` (`Venue_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `venue_event`
--

LOCK TABLES `venue_event` WRITE;
/*!40000 ALTER TABLE `venue_event` DISABLE KEYS */;
/*!40000 ALTER TABLE `venue_event` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-06-03 21:00:04
