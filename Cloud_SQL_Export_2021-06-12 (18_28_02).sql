-- MySQL dump 10.13  Distrib 5.7.33, for Linux (x86_64)
--
-- Host: localhost    Database: mysql
-- ------------------------------------------------------
-- Server version	5.7.33-google-log

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
-- Current Database: `tumorboardDB`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `tumorboardDB` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `tumorboardDB`;

--
-- Table structure for table `activity_messages`
--

DROP TABLE IF EXISTS `activity_messages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `activity_messages` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL,
  `message` text,
  `status` varchar(64) DEFAULT NULL,
  `user_id` int(10) unsigned DEFAULT NULL,
  `user_status` enum('INITIATOR','READ','UNREAD') NOT NULL DEFAULT 'UNREAD',
  `user_time` datetime DEFAULT NULL,
  `doctor_id` int(10) unsigned DEFAULT NULL,
  `doctor_status` enum('INITIATOR','READ','UNREAD') NOT NULL DEFAULT 'UNREAD',
  `doctor_time` datetime DEFAULT NULL,
  `coordinator_id` int(10) unsigned DEFAULT NULL,
  `coordinator_status` enum('INITIATOR','READ','UNREAD') NOT NULL DEFAULT 'UNREAD',
  `coordinator_time` datetime DEFAULT NULL,
  `admin_id` int(10) unsigned DEFAULT NULL,
  `admin_status` enum('INITIATOR','READ','UNREAD') NOT NULL DEFAULT 'UNREAD',
  `admin_time` datetime DEFAULT NULL,
  `inserted_time` datetime NOT NULL,
  `updated_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `activity_messages`
--

LOCK TABLES `activity_messages` WRITE;
/*!40000 ALTER TABLE `activity_messages` DISABLE KEYS */;
INSERT INTO `activity_messages` VALUES (7,'User Registration Title','User Registration Message','USER_REGISTRATION',NULL,'UNREAD',NULL,NULL,'UNREAD',NULL,NULL,'UNREAD',NULL,1,'INITIATOR','2020-06-03 13:31:22','2020-06-03 13:31:22','2020-06-03 08:01:22'),(8,'REQUESTED Title','REQUESTED Message','REQUESTED',10,'INITIATOR','2020-06-03 14:03:52',1,'UNREAD',NULL,0,'UNREAD',NULL,1,'UNREAD',NULL,'2020-06-03 14:03:52','2020-06-03 08:33:52'),(9,'User CANCELED Title','User CANCELED Message','CANCELED_BY_USER',10,'INITIATOR','2020-06-03 14:04:09',1,'UNREAD',NULL,0,'UNREAD',NULL,1,'UNREAD',NULL,'2020-06-03 14:04:09','2020-06-03 08:34:09'),(10,'REQUESTED Title','REQUESTED Message','REQUESTED',10,'INITIATOR','2020-06-03 19:50:33',1,'UNREAD',NULL,0,'UNREAD',NULL,1,'UNREAD',NULL,'2020-06-03 19:50:33','2020-06-03 14:20:33'),(11,'User CANCELED Title','User CANCELED Message','CANCELED_BY_USER',10,'INITIATOR','2020-06-03 20:28:14',1,'UNREAD',NULL,0,'UNREAD',NULL,1,'UNREAD',NULL,'2020-06-03 20:28:14','2020-06-03 14:58:14'),(12,'REQUESTED Title','REQUESTED Message','REQUESTED',10,'INITIATOR','2020-06-03 21:53:21',1,'UNREAD',NULL,0,'UNREAD',NULL,1,'UNREAD',NULL,'2020-06-03 21:53:21','2020-06-03 16:23:21'),(13,'User CANCELED Title','User CANCELED Message','CANCELED_BY_USER',10,'INITIATOR','2020-06-03 22:10:16',1,'UNREAD',NULL,0,'UNREAD',NULL,1,'UNREAD',NULL,'2020-06-03 22:10:16','2020-06-03 16:40:16'),(14,'REQUESTED Title','REQUESTED Message','REQUESTED',10,'INITIATOR','2020-06-03 23:28:58',1,'UNREAD',NULL,0,'UNREAD',NULL,1,'UNREAD',NULL,'2020-06-03 23:28:58','2020-06-03 17:58:58');
/*!40000 ALTER TABLE `activity_messages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `allergies`
--

DROP TABLE IF EXISTS `allergies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `allergies` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `patient_id_fk` int(11) DEFAULT NULL,
  `allergies` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `allergies`
--

LOCK TABLES `allergies` WRITE;
/*!40000 ALTER TABLE `allergies` DISABLE KEYS */;
INSERT INTO `allergies` VALUES (3,1,'Penicillin and related antibiotics'),(4,1,'Aspirin, ibuprofen and other nonsteroidal anti-inflammatory drugs (NSAIDs)');
/*!40000 ALTER TABLE `allergies` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `appointment`
--

DROP TABLE IF EXISTS `appointment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `appointment` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `start_time` datetime NOT NULL,
  `end_time` datetime NOT NULL,
  `type` enum('ONLINE','INPERSON') DEFAULT 'ONLINE',
  `status` enum('AVAILABLE','REQUESTED','CONFIRMED','CANCELED','CANCELED_BY_USER','COMPLETED') NOT NULL DEFAULT 'AVAILABLE',
  `doctor_id_fk` int(10) unsigned NOT NULL,
  `patient_id_fk` int(10) unsigned DEFAULT NULL,
  `requested_time` datetime DEFAULT NULL,
  `confirmed_time` datetime DEFAULT NULL,
  `canceled_time` datetime DEFAULT NULL,
  `completed_time` datetime DEFAULT NULL,
  `inserted_time` datetime NOT NULL,
  `updated_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `FK_doctor_id_1` (`doctor_id_fk`),
  KEY `FK_patient_id_1` (`patient_id_fk`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `appointment`
--

LOCK TABLES `appointment` WRITE;
/*!40000 ALTER TABLE `appointment` DISABLE KEYS */;
INSERT INTO `appointment` VALUES (1,'2020-06-02 12:00:00','2020-06-02 12:30:00','ONLINE','AVAILABLE',1,NULL,NULL,NULL,NULL,NULL,'2020-06-02 13:35:24','2020-06-02 08:05:24'),(2,'2020-06-02 12:30:00','2020-06-02 13:00:00','ONLINE','AVAILABLE',1,NULL,NULL,NULL,NULL,NULL,'2020-06-02 13:35:26','2020-06-02 08:05:26'),(3,'2020-06-03 12:00:00','2020-06-03 12:30:00','ONLINE','AVAILABLE',1,NULL,NULL,NULL,NULL,NULL,'2020-06-02 13:35:28','2020-06-02 08:05:28'),(4,'2020-06-03 12:30:00','2020-06-03 13:00:00','ONLINE','AVAILABLE',1,NULL,NULL,NULL,NULL,NULL,'2020-06-02 13:35:30','2020-06-02 08:05:30'),(5,'2020-06-04 11:30:00','2020-06-04 12:00:00','ONLINE','AVAILABLE',1,NULL,NULL,NULL,NULL,NULL,'2020-06-02 13:35:33','2020-06-02 08:05:33'),(6,'2020-06-04 12:00:00','2020-06-04 12:30:00','ONLINE','CANCELED_BY_USER',1,5,'2020-06-03 14:03:52',NULL,'2020-06-03 14:04:09',NULL,'2020-06-02 13:35:36','2020-06-03 08:34:09'),(7,'2020-06-04 12:30:00','2020-06-04 13:00:00','ONLINE','CANCELED_BY_USER',1,5,'2020-06-03 19:50:32',NULL,'2020-06-03 20:28:14',NULL,'2020-06-02 13:35:38','2020-06-03 14:58:14'),(8,'2020-06-04 12:00:00','2020-06-04 12:30:00','ONLINE','CANCELED_BY_USER',1,5,'2020-06-03 21:53:21',NULL,'2020-06-03 22:10:16',NULL,'2020-06-03 14:04:09','2020-06-03 16:40:16'),(9,'2020-06-04 12:30:00','2020-06-04 13:00:00','ONLINE','AVAILABLE',1,NULL,NULL,NULL,NULL,NULL,'2020-06-03 20:28:14','2020-06-03 14:58:14'),(10,'2020-06-04 12:00:00','2020-06-04 12:30:00','ONLINE','REQUESTED',1,5,'2020-06-03 23:28:58',NULL,NULL,NULL,'2020-06-03 22:10:16','2020-06-03 17:58:58');
/*!40000 ALTER TABLE `appointment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `biomarkers`
--

DROP TABLE IF EXISTS `biomarkers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `biomarkers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `patient_id_fk` int(11) DEFAULT NULL,
  `type` varchar(45) DEFAULT NULL,
  `result` varchar(45) DEFAULT NULL,
  `value` varchar(45) DEFAULT NULL,
  `unit` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `biomarkers`
--

LOCK TABLES `biomarkers` WRITE;
/*!40000 ALTER TABLE `biomarkers` DISABLE KEYS */;
INSERT INTO `biomarkers` VALUES (4,1,'ER','Negative','5','%'),(5,1,'PR','Negative','5','%'),(6,1,'HER','Negative','5','%');
/*!40000 ALTER TABLE `biomarkers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cancerinfo`
--

DROP TABLE IF EXISTS `cancerinfo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cancerinfo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `patient_id_fk` int(11) DEFAULT NULL,
  `organ` varchar(45) DEFAULT NULL,
  `cancertype` varchar(45) DEFAULT NULL,
  `stage` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cancerinfo`
--

LOCK TABLES `cancerinfo` WRITE;
/*!40000 ALTER TABLE `cancerinfo` DISABLE KEYS */;
INSERT INTO `cancerinfo` VALUES (4,1,'Breast','Invasive ductal carcinoma-grade2','Tiana Secondary');
/*!40000 ALTER TABLE `cancerinfo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comorbidities`
--

DROP TABLE IF EXISTS `comorbidities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `comorbidities` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `patient_id_fk` int(11) DEFAULT NULL,
  `comorbids` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comorbidities`
--

LOCK TABLES `comorbidities` WRITE;
/*!40000 ALTER TABLE `comorbidities` DISABLE KEYS */;
INSERT INTO `comorbidities` VALUES (4,1,'Heart failure with hospital admission in the past year'),(5,1,'Left ventricular systolic dysfunction (LVEF < 40%)'),(6,1,' Current prolonged use of oral corticosteroids/ immunosuppressant medications');
/*!40000 ALTER TABLE `comorbidities` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `conclusion`
--

DROP TABLE IF EXISTS `conclusion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `conclusion` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(50) DEFAULT NULL,
  `notes` varchar(100) DEFAULT NULL,
  `nextaction` varchar(100) DEFAULT NULL,
  `date_time` datetime DEFAULT NULL,
  `responsible` varchar(100) DEFAULT NULL,
  `nursenav` varchar(100) DEFAULT NULL,
  `priority` varchar(15) DEFAULT NULL,
  `feedback` varchar(100) DEFAULT NULL,
  `patient_id_fk` int(11) DEFAULT NULL,
  `dr_id` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `conclusion`
--

LOCK TABLES `conclusion` WRITE;
/*!40000 ALTER TABLE `conclusion` DISABLE KEYS */;
INSERT INTO `conclusion` VALUES (1,'treatment','Concl','Next','2021-05-11 02:41:00','13',NULL,'2',NULL,1,NULL),(2,'treatment','abc','cde','2021-05-11 02:43:00','13',NULL,'2',NULL,1,NULL),(3,'followup','a','b','2021-05-11 02:45:00','15',NULL,'2','v',1,NULL),(4,'treatment','abc','ads','2021-05-11 12:25:00','3',NULL,'2','asd',1,NULL),(5,'followup','fgdgd','','2021-05-13 23:57:00','',NULL,'','',1,NULL),(6,'Diagnosis','','','2021-05-14 22:44:00','',NULL,'','',1,NULL),(7,'followup','done','next','2021-05-14 22:47:00','',NULL,'','',1,NULL),(8,'followup','done','next','2021-05-14 22:49:00','12',NULL,'','',1,NULL),(9,'Diagnosis','','','2021-05-14 22:54:00','3',NULL,'','',1,NULL),(10,'Diagnosis','','','2021-05-14 22:58:00','8','2','2','',1,NULL),(11,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1'),(12,'Diagnosis','','','2021-05-19 23:49:00','','','','',1,NULL),(13,'Diagnosis','','','2021-05-20 11:21:00','','','','',1,NULL),(14,'Diagnosis','Conclusion 1','','2021-05-20 11:22:00','','','','',1,NULL),(15,'Diagnosis','Conclusion 1','','2021-05-20 16:24:00','','','','',1,NULL),(16,'Diagnosis','Conclusion 1','','2021-05-20 17:07:00','','','','',1,NULL),(17,'Diagnosis','c','','2021-05-21 22:09:00','','','','',1,NULL),(18,'Diagnosis','c','','2021-05-21 22:09:00','','','','',1,NULL),(19,'Diagnosis','New Conclusion 1','','2021-06-07 15:43:00','','','','',1,NULL),(20,'Diagnosis','New Conclusion 1','','2021-06-07 15:43:00','','','','',1,NULL),(21,'Diagnosis','New Conclusion 2','Course of Action 1','2021-06-07 15:44:00','','','','Feedback 1',1,NULL),(22,'Diagnosis','','','2021-06-07 15:50:00','','','','',1,NULL),(23,'Diagnosis','','','2021-06-07 15:50:00','','','','',1,NULL),(24,'Diagnosis','','','2021-06-07 15:50:00','2','2','','',1,NULL);
/*!40000 ALTER TABLE `conclusion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `coordinator_details`
--

DROP TABLE IF EXISTS `coordinator_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `coordinator_details` (
  `id` int(10) unsigned NOT NULL,
  `name` varchar(45) NOT NULL,
  `experience` varchar(45) DEFAULT NULL,
  `gender` varchar(10) DEFAULT NULL,
  `mobile` varchar(15) DEFAULT NULL,
  `education` varchar(300) DEFAULT NULL,
  `location` varchar(45) DEFAULT NULL,
  `languages` varchar(45) DEFAULT NULL,
  `profile_pic` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `coordinator_details`
--

LOCK TABLES `coordinator_details` WRITE;
/*!40000 ALTER TABLE `coordinator_details` DISABLE KEYS */;
/*!40000 ALTER TABLE `coordinator_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `coordinatorslist`
--

DROP TABLE IF EXISTS `coordinatorslist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `coordinatorslist` (
  `id` int(10) unsigned NOT NULL,
  `name` varchar(45) NOT NULL,
  `experience` varchar(45) DEFAULT NULL,
  `gender` varchar(10) DEFAULT NULL,
  `mobile` varchar(15) DEFAULT NULL,
  `education` varchar(300) DEFAULT NULL,
  `location` varchar(45) DEFAULT NULL,
  `languages` varchar(45) DEFAULT NULL,
  `profile_pic` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `coordinatorslist`
--

LOCK TABLES `coordinatorslist` WRITE;
/*!40000 ALTER TABLE `coordinatorslist` DISABLE KEYS */;
/*!40000 ALTER TABLE `coordinatorslist` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `doctor_details`
--

DROP TABLE IF EXISTS `doctor_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `doctor_details` (
  `id` int(10) unsigned NOT NULL,
  `name` varchar(45) NOT NULL,
  `age` int(10) unsigned NOT NULL,
  `experience` varchar(45) NOT NULL,
  `specialization` varchar(45) NOT NULL,
  `organ_types` varchar(200) NOT NULL,
  `education` varchar(300) NOT NULL,
  `location` varchar(45) NOT NULL,
  `hospitals_working` varchar(200) NOT NULL,
  `position` varchar(45) NOT NULL,
  `languages` varchar(45) NOT NULL,
  `facebook` varchar(100) DEFAULT NULL,
  `linkedin` varchar(100) DEFAULT NULL,
  `twitter` varchar(100) DEFAULT NULL,
  `website` varchar(100) DEFAULT NULL,
  `awards_recongnitions` varchar(500) DEFAULT NULL,
  `patient_testimonial` varchar(200) DEFAULT NULL,
  `youtube` varchar(200) DEFAULT NULL,
  `profile_pic` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `doctor_details`
--

LOCK TABLES `doctor_details` WRITE;
/*!40000 ALTER TABLE `doctor_details` DISABLE KEYS */;
/*!40000 ALTER TABLE `doctor_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `doctorslist`
--

DROP TABLE IF EXISTS `doctorslist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `doctorslist` (
  `id` int(10) unsigned NOT NULL,
  `name` varchar(45) NOT NULL,
  `department` varchar(45) DEFAULT NULL,
  `specialization` varchar(100) NOT NULL,
  `education` text,
  `location` varchar(45) NOT NULL,
  `position` varchar(45) NOT NULL,
  `languages` varchar(45) DEFAULT NULL,
  `profile_pic` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `doctorslist`
--

LOCK TABLES `doctorslist` WRITE;
/*!40000 ALTER TABLE `doctorslist` DISABLE KEYS */;
INSERT INTO `doctorslist` VALUES (1,'Dr.B.Chandrasekhar Reddy','Neurology','MD, DM Neurology','','','Senior Consultant Neurologist','','dr-b-chandrasekhar-reddy.jpg'),(2,'Dr.CH Ratna Kishore','Neurology','Senior Consultant Neurologist','','','MD, DM Neurology','','dr-ch-ratna-kishore.jpg'),(3,'Dr.Anjan Pyal','Neurology','Senior Consultant Neurologist','','','MD, DM Neurology','','dr-anjan-pyal.jpg'),(4,'Dr.C.Nikhileshwar Reddy','Neurology','Consultant Neurologist','','','MD, DM Neurology','','Dr.Nikhileshwar Reddy.jpg'),(5,'Dr.B.S.Siva Reddy','Neurosurgery','Senior consultant neurosurgeon','','','MCh Neurosurgery','','dr-bs-siva-reddy.jpg'),(6,'Dr.B.Vamsee Mohan','Neurosurgery','Senior consultant neurosurgeon','','','MCh Neurosurgery','','dr-b-vamsee-mohan.jpg'),(7,'Dr.A.Vamshidhar','Neurosurgery','Senior consultant neurosurgeon','','','MCh Neurosurgery','','dr-a-vamshidhar.jpg'),(8,'Dr.P.Pavan Kumar','Neurosurgery','Consultant neurosurgeon','','','MCh Neurosurgery','','dr-p-pavan-kumar.jpg'),(9,'Dr.Ananth Egoor','Neurosurgery','Consultant Neurosurgeon','','','MS, MCh Neurosurgery','','Dr.Ananth Egoor.jpg'),(10,'Dr.D.Seshgiri Rao','Cardiology (Citi Heart Centre)','Director of Cardiology','','','MD, DM Cardiology','','dr-d-seshgiri-rao.jpg'),(11,'Dr.A.Siva Prasad','Cardiology (Citi Heart Centre)','Consultant Cardiologist','','','MD, DM Cardiology','','dr-a-siva-prasad.jpg'),(12,'Dr.P.Vijaya Prasanna','Rheumatology','Senior Consultant Rheumatologist','','','MD, DM Rheumatology','','dr-p-vijaya-prasanna.jpg'),(13,'Dr.V.Chandrachud','Psychiatry','Consultant Psychiatrist','','','MD Psychiatry','','dr-chandrachudb.jpg'),(14,'Dr.J.Madhusudhan Rao','Orthopaedics','Senior Consultant Orthopaedic and Joint Replacement Surgeon','','','D Ortho, MCh Ortho','','dr-j-madhusudhan-rao.jpg'),(15,'Dr.P.Ravi Kumar','Orthopaedics','Consultant Orthopaedic Surgeon','','','D Ortho, MCh Ortho','','Dr.Ravi kumar.jpg'),(16,'Dr.B.N.Nageswara Rao','Surgical Gastroenterology','Consultant Advanced Laparoscopic and Bariatric Surgeon','','','DNB, FMAS, FIAGES, FALS, FALBS','','dr-bn-nageswara-rao.jpg'),(17,'Dr.D.Ravi Varma','Neuroradiology','Consultant Neuroradiologist','','','DNB, DM Neuroradiology','','dr-d-ravi-varma.jpg');
/*!40000 ALTER TABLE `doctorslist` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `familymedicalhistory`
--

DROP TABLE IF EXISTS `familymedicalhistory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `familymedicalhistory` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `patient_id_fk` int(11) DEFAULT NULL,
  `grandparents` varchar(200) DEFAULT NULL,
  `parents` varchar(200) DEFAULT NULL,
  `others` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `familymedicalhistory`
--

LOCK TABLES `familymedicalhistory` WRITE;
/*!40000 ALTER TABLE `familymedicalhistory` DISABLE KEYS */;
INSERT INTO `familymedicalhistory` VALUES (4,1,'Maternal Grandmother','Father Diabetes Type 2','And here s more content of Family Medical History related to the patient.');
/*!40000 ALTER TABLE `familymedicalhistory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `file_references`
--

DROP TABLE IF EXISTS `file_references`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `file_references` (
  `link` varchar(120) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `file_references`
--

LOCK TABLES `file_references` WRITE;
/*!40000 ALTER TABLE `file_references` DISABLE KEYS */;
INSERT INTO `file_references` VALUES ('abc'),('https://www.googleapis.com/storage/v1/b/tumorboard.appspot.com/o/download-2020-12-23-072645595-2021-02-12-095259135.jpg'),('https://www.googleapis.com/storage/v1/b/tumorboard.appspot.com/o/image-2021-02-12-103231388.png'),('https://www.googleapis.com/storage/v1/b/tumorboard.appspot.com/o/image-2021-02-12-103304396.png');
/*!40000 ALTER TABLE `file_references` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `medications`
--

DROP TABLE IF EXISTS `medications`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `medications` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `patient_id_fk` int(11) DEFAULT NULL,
  `icdno` varchar(200) DEFAULT NULL,
  `medications` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `medications`
--

LOCK TABLES `medications` WRITE;
/*!40000 ALTER TABLE `medications` DISABLE KEYS */;
INSERT INTO `medications` VALUES (4,1,'168','Acetaminophen'),(5,1,'178','Cyclobenzaprine'),(6,1,'188','Lisinopril'),(7,1,'198','Gabapentin');
/*!40000 ALTER TABLE `medications` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nurse_navigator`
--

DROP TABLE IF EXISTS `nurse_navigator`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `nurse_navigator` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nurse_navigator`
--

LOCK TABLES `nurse_navigator` WRITE;
/*!40000 ALTER TABLE `nurse_navigator` DISABLE KEYS */;
INSERT INTO `nurse_navigator` VALUES (1,'marry'),(2,'sanju'),(3,'priya');
/*!40000 ALTER TABLE `nurse_navigator` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pastmedicalhistory`
--

DROP TABLE IF EXISTS `pastmedicalhistory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pastmedicalhistory` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `patient_id_fk` int(11) DEFAULT NULL,
  `date` varchar(45) DEFAULT NULL,
  `information` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pastmedicalhistory`
--

LOCK TABLES `pastmedicalhistory` WRITE;
/*!40000 ALTER TABLE `pastmedicalhistory` DISABLE KEYS */;
INSERT INTO `pastmedicalhistory` VALUES (4,1,'12-08-2020',' hypercholesterolemia'),(5,1,'12-03-2019','polycythemia vera');
/*!40000 ALTER TABLE `pastmedicalhistory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `patient_details`
--

DROP TABLE IF EXISTS `patient_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `patient_details` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  `age` int(10) unsigned DEFAULT NULL,
  `gender` varchar(10) DEFAULT NULL,
  `location` varchar(35) DEFAULT NULL,
  `hospital` varchar(50) DEFAULT NULL,
  `patienttype` varchar(20) DEFAULT NULL,
  `relation` varchar(45) DEFAULT NULL,
  `cancertype` varchar(45) DEFAULT NULL,
  `problem` text,
  `timevisitcreated` datetime DEFAULT NULL,
  `caretype` varchar(20) DEFAULT NULL,
  `consultationtype` varchar(20) DEFAULT NULL,
  `owning_doctor` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `patient_details`
--

LOCK TABLES `patient_details` WRITE;
/*!40000 ALTER TABLE `patient_details` DISABLE KEYS */;
INSERT INTO `patient_details` VALUES (1,'John',54,'M','Bangalore','Fortis',NULL,NULL,'Breast',NULL,NULL,NULL,NULL,'3'),(2,'Ashok',55,'M','Bangalore','Fortis',NULL,NULL,'Lung',NULL,NULL,NULL,NULL,'3'),(3,'Robert',45,'M','Bangalore','Fortis',NULL,NULL,'Brain',NULL,NULL,NULL,NULL,'3'),(4,'Dave',62,'M','Bangalore','Fortis',NULL,NULL,'Lung',NULL,NULL,NULL,NULL,'3'),(6,'Rob',69,'M','Bangalore','Fortis',NULL,NULL,'Lung',NULL,NULL,NULL,NULL,'3'),(7,'Bratt',54,'M','Bangalore','Fortis',NULL,NULL,'Lung',NULL,NULL,NULL,NULL,'3'),(8,'Brian',76,'M','Bangalore','Fortis',NULL,NULL,'Brain',NULL,NULL,NULL,NULL,'3'),(9,'Stella',76,'F','Bangalore','Fortis',NULL,NULL,'Lung',NULL,NULL,NULL,NULL,'3'),(10,'Marie',76,'F','Bangalore','Fortis',NULL,NULL,'Lung',NULL,NULL,NULL,NULL,'3'),(11,'Bran',76,'F','Bangalore','Fortis',NULL,NULL,'Brain',NULL,NULL,NULL,NULL,'3');
/*!40000 ALTER TABLE `patient_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `patientillness`
--

DROP TABLE IF EXISTS `patientillness`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `patientillness` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `patient_id_fk` int(11) DEFAULT NULL,
  `date` varchar(45) DEFAULT NULL,
  `illnesstype` varchar(100) DEFAULT NULL,
  `otherillness` varchar(150) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `patientillness`
--

LOCK TABLES `patientillness` WRITE;
/*!40000 ALTER TABLE `patientillness` DISABLE KEYS */;
INSERT INTO `patientillness` VALUES (4,1,'2018-06-06 12:12:12','patient had a fracture in her left leg; Undergone surgery - Ankle','Post surgery, after 1 week - had stomach ache; Diagnosed with MULTIPLE HEPATIC SECONDARIESin LIVER-FNAC');
/*!40000 ALTER TABLE `patientillness` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `patientstatus`
--

DROP TABLE IF EXISTS `patientstatus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `patientstatus` (
  `activityid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `visitid` varchar(45) NOT NULL,
  `appointmentid` int(10) unsigned DEFAULT NULL,
  `appointmenttype` varchar(45) DEFAULT NULL,
  `appointmentstatus` varchar(45) DEFAULT NULL,
  `appointmentstatusmessage` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`activityid`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `patientstatus`
--

LOCK TABLES `patientstatus` WRITE;
/*!40000 ALTER TABLE `patientstatus` DISABLE KEYS */;
INSERT INTO `patientstatus` VALUES (2,'55db6759-da96-427f-b1f5-cb9caefb5666',10,'online','Requested','You have requested an appointment with Dr.B.Chandrasekhar Reddy at 12:00PM Jun 04, 2020. Your request will be confirmed shortly.');
/*!40000 ALTER TABLE `patientstatus` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `patientvisit`
--

DROP TABLE IF EXISTS `patientvisit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `patientvisit` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `userid` int(10) unsigned NOT NULL,
  `visitid` varchar(45) NOT NULL,
  `department` varchar(45) DEFAULT NULL,
  `coordinatorid` int(10) unsigned DEFAULT NULL,
  `timevisitcreated` datetime DEFAULT NULL,
  `consultantid` int(10) unsigned DEFAULT NULL,
  `umr_no` varchar(20) DEFAULT NULL,
  `payment_status` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`,`visitid`) USING BTREE,
  KEY `FK_patientvisit_1` (`userid`),
  CONSTRAINT `FK_patientvisit_1` FOREIGN KEY (`userid`) REFERENCES `userdetails` (`userid`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `patientvisit`
--

LOCK TABLES `patientvisit` WRITE;
/*!40000 ALTER TABLE `patientvisit` DISABLE KEYS */;
INSERT INTO `patientvisit` VALUES (5,10,'55db6759-da96-427f-b1f5-cb9caefb5666','Neurology',0,'2020-06-03 13:31:00',1,'hj7890',NULL);
/*!40000 ALTER TABLE `patientvisit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payment`
--

DROP TABLE IF EXISTS `payment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `payment` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `paymentid` varchar(45) CHARACTER SET latin1 DEFAULT NULL,
  `visitid` varchar(45) CHARACTER SET latin1 NOT NULL,
  `amount` varchar(45) CHARACTER SET latin1 DEFAULT NULL,
  `payment_time` datetime DEFAULT NULL,
  `order_id` varchar(45) DEFAULT NULL,
  `invoice_id` varchar(45) DEFAULT NULL,
  `order_link` varchar(45) DEFAULT NULL,
  `payment_status` varchar(45) DEFAULT NULL,
  `payment_method` varchar(45) DEFAULT NULL,
  `refund_status` varchar(45) DEFAULT NULL,
  `amount_refunded` varchar(10) DEFAULT NULL,
  `order_amount` varchar(10) DEFAULT NULL,
  `order_time` datetime DEFAULT NULL,
  `order_description` varchar(150) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payment`
--

LOCK TABLES `payment` WRITE;
/*!40000 ALTER TABLE `payment` DISABLE KEYS */;
/*!40000 ALTER TABLE `payment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `physicalexamination`
--

DROP TABLE IF EXISTS `physicalexamination`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `physicalexamination` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `patient_id_fk` int(11) DEFAULT NULL,
  `height` varchar(45) DEFAULT '168 cm',
  `weight` varchar(45) DEFAULT NULL,
  `bloodpressure` varchar(45) DEFAULT NULL,
  `insullin` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `physicalexamination`
--

LOCK TABLES `physicalexamination` WRITE;
/*!40000 ALTER TABLE `physicalexamination` DISABLE KEYS */;
INSERT INTO `physicalexamination` VALUES (4,1,'168 cm','75kg','120/80 mm Hg','140 mg/dL');
/*!40000 ALTER TABLE `physicalexamination` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `timeline`
--

DROP TABLE IF EXISTS `timeline`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `timeline` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `patient_id_fk` int(10) unsigned DEFAULT NULL,
  `item` varchar(75) DEFAULT NULL,
  `date` datetime DEFAULT NULL,
  `link` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `timeline`
--

LOCK TABLES `timeline` WRITE;
/*!40000 ALTER TABLE `timeline` DISABLE KEYS */;
INSERT INTO `timeline` VALUES (1,1,'Genomics Report','2020-12-06 10:00:00','https://gopink.in/images/home/Component%201.svg'),(2,1,'Breast Lumpectomy','2020-06-06 09:00:00','https://gopink.in/images/home/Component%203.svg'),(3,1,'Surgery','2020-09-09 15:00:00','https://gopink.in/images/home/Component%202.svg');
/*!40000 ALTER TABLE `timeline` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tm_doctors`
--

DROP TABLE IF EXISTS `tm_doctors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tm_doctors` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `meeting_id_fk` int(10) unsigned NOT NULL,
  `doctor_id_fk` int(10) unsigned NOT NULL,
  `type` enum('REQUIRED','OPTIONAL','ORGANIZER') DEFAULT 'REQUIRED',
  `status` enum('PENDING','CONFIRMED','CANCELED') NOT NULL DEFAULT 'PENDING',
  `confirmed_time` datetime DEFAULT NULL,
  `canceled_time` datetime DEFAULT NULL,
  `comments` varchar(255) DEFAULT NULL,
  `inserted_time` datetime NOT NULL,
  `updated_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `FK_meeting_id_1` (`meeting_id_fk`),
  KEY `FK_doctor_id_1` (`doctor_id_fk`),
  CONSTRAINT `FK_doctor_id_1` FOREIGN KEY (`doctor_id_fk`) REFERENCES `doctor_details` (`id`),
  CONSTRAINT `FK_meeting_id_1` FOREIGN KEY (`meeting_id_fk`) REFERENCES `tumorboard_meeting` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tm_doctors`
--

LOCK TABLES `tm_doctors` WRITE;
/*!40000 ALTER TABLE `tm_doctors` DISABLE KEYS */;
/*!40000 ALTER TABLE `tm_doctors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `treatmenthistory`
--

DROP TABLE IF EXISTS `treatmenthistory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `treatmenthistory` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `patient_id_fk` int(11) DEFAULT NULL,
  `date` datetime DEFAULT NULL,
  `therapeutics` varchar(100) DEFAULT NULL,
  `description` varchar(100) DEFAULT NULL,
  `responsible` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `treatmenthistory`
--

LOCK TABLES `treatmenthistory` WRITE;
/*!40000 ALTER TABLE `treatmenthistory` DISABLE KEYS */;
INSERT INTO `treatmenthistory` VALUES (1,1,'2018-05-11 06:30:00','Biopsy','Excisional Biopsy breast and lymph nodes biopsy revealing invasive ductal carcinoma - grade I','Dr.Stella'),(2,1,'2018-06-11 06:30:00','Surgery','Quadrantectomy wide excision, modified radical mastectomy.','Dr.Dote');
/*!40000 ALTER TABLE `treatmenthistory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tumorboard_meeting`
--

DROP TABLE IF EXISTS `tumorboard_meeting`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tumorboard_meeting` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `purpose` varchar(255) NOT NULL,
  `start_time` datetime NOT NULL,
  `duration` int(10) unsigned DEFAULT NULL,
  `end_time` datetime NOT NULL,
  `mode` enum('AUDIO','VIDEO','INPERSON') DEFAULT 'AUDIO',
  `location` varchar(255) DEFAULT NULL,
  `video_link` varchar(255) DEFAULT NULL,
  `status` enum('REQUESTED','CONFIRMED','CANCELED','STARTED','COMPLETED','DELETED') DEFAULT NULL,
  `priority` varchar(15) DEFAULT NULL,
  `frequency_in_days` int(10) unsigned NOT NULL,
  `notes` text,
  `requested_time` datetime DEFAULT NULL,
  `confirmed_time` datetime DEFAULT NULL,
  `cancelled_time` datetime DEFAULT NULL,
  `completed_time` datetime DEFAULT NULL,
  `inserted_time` datetime NOT NULL,
  `updated_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `patient_id_fk` int(10) unsigned NOT NULL,
  `presenting_doc` varchar(75) DEFAULT NULL,
  `attending_doc` varchar(75) DEFAULT NULL,
  `patient_name` varchar(75) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_patient_id_1` (`patient_id_fk`),
  CONSTRAINT `FK_patient_id_1` FOREIGN KEY (`patient_id_fk`) REFERENCES `patient_details` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=111 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tumorboard_meeting`
--

LOCK TABLES `tumorboard_meeting` WRITE;
/*!40000 ALTER TABLE `tumorboard_meeting` DISABLE KEYS */;
INSERT INTO `tumorboard_meeting` VALUES (109,'Brain','Follow-Up','2021-08-12 10:30:00',30,'2025-12-12 12:12:12',NULL,'','','DELETED','Medium',0,NULL,NULL,NULL,NULL,NULL,'2018-06-06 12:12:12','2021-06-11 18:29:00',1,'10','8',NULL),(110,'Lung','Follow-Up','2021-07-12 11:30:00',30,'2025-12-12 12:12:12',NULL,'','','DELETED','High',0,NULL,NULL,NULL,NULL,NULL,'2021-06-10 11:26:00','2021-06-11 17:44:00',11,'8','7',NULL);
/*!40000 ALTER TABLE `tumorboard_meeting` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tumorinformation`
--

DROP TABLE IF EXISTS `tumorinformation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tumorinformation` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `patient_id_fk` int(11) DEFAULT NULL,
  `size` varchar(100) DEFAULT NULL,
  `margin` varchar(100) DEFAULT NULL,
  `lymphnodes` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tumorinformation`
--

LOCK TABLES `tumorinformation` WRITE;
/*!40000 ALTER TABLE `tumorinformation` DISABLE KEYS */;
INSERT INTO `tumorinformation` VALUES (2,1,'15mm in greatest dimension - 15x5x5mm','Free, closest deep margin 0.8mm,closest superior 1mm','1/3 Lymph nodes positive');
/*!40000 ALTER TABLE `tumorinformation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_details`
--

DROP TABLE IF EXISTS `user_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_details` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `email` varchar(45) NOT NULL,
  `password` varchar(45) NOT NULL,
  `country` varchar(45) DEFAULT NULL,
  `state` varchar(45) DEFAULT NULL,
  `mobile` varchar(15) DEFAULT NULL,
  `gender` varchar(45) DEFAULT NULL,
  `verifycode` varchar(45) DEFAULT NULL,
  `accountstatus` int(11) DEFAULT NULL,
  `timeaccountcreated` datetime DEFAULT NULL,
  `role` varchar(15) DEFAULT NULL,
  `usertoken` varchar(255) DEFAULT NULL,
  `mailstatus` int(10) unsigned DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_details`
--

LOCK TABLES `user_details` WRITE;
/*!40000 ALTER TABLE `user_details` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `useractivity`
--

DROP TABLE IF EXISTS `useractivity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `useractivity` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `activityid` varchar(45) DEFAULT NULL,
  `activitytype` varchar(20) DEFAULT NULL,
  `link` varchar(500) DEFAULT NULL,
  `textcontent` text,
  `time` datetime DEFAULT NULL,
  `contentsource` varchar(20) DEFAULT NULL,
  `filename` varchar(200) DEFAULT NULL,
  `documentlink` text,
  `userid` int(11) DEFAULT NULL,
  `usertype` varchar(20) DEFAULT NULL,
  `activitystatus` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `useractivity`
--

LOCK TABLES `useractivity` WRITE;
/*!40000 ALTER TABLE `useractivity` DISABLE KEYS */;
/*!40000 ALTER TABLE `useractivity` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `userdetails`
--

DROP TABLE IF EXISTS `userdetails`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `userdetails` (
  `userid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `email` varchar(45) NOT NULL,
  `password` varchar(45) NOT NULL,
  `country` varchar(45) DEFAULT NULL,
  `state` varchar(45) DEFAULT NULL,
  `umr` varchar(45) DEFAULT NULL,
  `mobile` varchar(15) DEFAULT NULL,
  `firstname` varchar(45) DEFAULT NULL,
  `lastname` varchar(45) DEFAULT NULL,
  `gender` varchar(45) DEFAULT NULL,
  `verifycode` varchar(45) DEFAULT NULL,
  `accountstatus` int(10) unsigned DEFAULT NULL,
  `mailstatus` int(10) unsigned DEFAULT '0',
  `timeaccountcreated` datetime DEFAULT NULL,
  `role` varchar(20) DEFAULT NULL,
  `doctorid` int(10) unsigned DEFAULT NULL,
  `coordinatorid` int(10) unsigned DEFAULT NULL,
  `passcode` int(11) NOT NULL,
  `otp_time` datetime NOT NULL,
  `usertoken` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`userid`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `userdetails`
--

LOCK TABLES `userdetails` WRITE;
/*!40000 ALTER TABLE `userdetails` DISABLE KEYS */;
INSERT INTO `userdetails` VALUES (7,'Admin','admin@tumorboardDB.in','citineuro@786',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,1,'2020-05-31 22:08:20','admin',NULL,NULL,9767,'2020-05-31 22:08:20','dcdoOaFYKDU:APA91bH1B9qCutaKkJniCNYMEA3mYfyp8_dhwlEtkGRDXqgXfrGo20qPuOIoQ_lYkxtxEbvTYwXQtBbXurTfFN2lOJhQs3RvdVG4jqjM56VGcP2tZ10hUJDXxlGGMqOtfhW_Kk6pk5fm'),(10,'Ravi','ravi@cms.com','ravi@007',NULL,NULL,NULL,'8217862628',NULL,NULL,NULL,'f5a20ccc-2a2e-42f2-962f-b784dffcbfa8',1,1,'2020-06-03 13:31:00','user',NULL,NULL,8027,'2020-06-03 13:31:00','dcdoOaFYKDU:APA91bH1B9qCutaKkJniCNYMEA3mYfyp8_dhwlEtkGRDXqgXfrGo20qPuOIoQ_lYkxtxEbvTYwXQtBbXurTfFN2lOJhQs3RvdVG4jqjM56VGcP2tZ10hUJDXxlGGMqOtfhW_Kk6pk5fm'),(11,'Dr.B.Chandrasekhar Reddy','dr_chandrasekhar@tumorboardDB.in','citineuro@4578',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,1,'2020-05-31 22:08:20','doctor',1,NULL,9767,'2020-05-31 22:08:20','dcdoOaFYKDU:APA91bH1B9qCutaKkJniCNYMEA3mYfyp8_dhwlEtkGRDXqgXfrGo20qPuOIoQ_lYkxtxEbvTYwXQtBbXurTfFN2lOJhQs3RvdVG4jqjM56VGcP2tZ10hUJDXxlGGMqOtfhW_Kk6pk5fm'),(12,'Dr.CH Ratna Kishore','dr_ratnakishore@tumorboardDB.in','citineuro@6446',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,1,'2020-05-31 22:08:20','doctor',2,NULL,9767,'2020-05-31 22:08:20','dcdoOaFYKDU:APA91bH1B9qCutaKkJniCNYMEA3mYfyp8_dhwlEtkGRDXqgXfrGo20qPuOIoQ_lYkxtxEbvTYwXQtBbXurTfFN2lOJhQs3RvdVG4jqjM56VGcP2tZ10hUJDXxlGGMqOtfhW_Kk6pk5fm'),(13,'Dr.Anjan Pyal','dr_anjanpyal@tumorboardDB.in','citineuro@2556',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,1,'2020-05-31 22:08:20','doctor',3,NULL,9767,'2020-05-31 22:08:20','dcdoOaFYKDU:APA91bH1B9qCutaKkJniCNYMEA3mYfyp8_dhwlEtkGRDXqgXfrGo20qPuOIoQ_lYkxtxEbvTYwXQtBbXurTfFN2lOJhQs3RvdVG4jqjM56VGcP2tZ10hUJDXxlGGMqOtfhW_Kk6pk5fm'),(14,'Dr.C.Nikhileshwar Reddy','dr_nikhileshwar@tumorboardDB.in','citineuro@3445',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,1,'2020-05-31 22:08:20','doctor',4,NULL,9767,'2020-05-31 22:08:20','dcdoOaFYKDU:APA91bH1B9qCutaKkJniCNYMEA3mYfyp8_dhwlEtkGRDXqgXfrGo20qPuOIoQ_lYkxtxEbvTYwXQtBbXurTfFN2lOJhQs3RvdVG4jqjM56VGcP2tZ10hUJDXxlGGMqOtfhW_Kk6pk5fm'),(15,'Dr.B.S.Siva Reddy','dr_sivareddy@tumorboardDB.in','citineuro@4366',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,1,'2020-05-31 22:08:20','doctor',5,NULL,9767,'2020-05-31 22:08:20','dcdoOaFYKDU:APA91bH1B9qCutaKkJniCNYMEA3mYfyp8_dhwlEtkGRDXqgXfrGo20qPuOIoQ_lYkxtxEbvTYwXQtBbXurTfFN2lOJhQs3RvdVG4jqjM56VGcP2tZ10hUJDXxlGGMqOtfhW_Kk6pk5fm'),(16,'Dr.B.Vamsee Mohan','dr_vamseemohan@tumorboardDB.in','citineuro@3465',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,1,'2020-05-31 22:08:20','doctor',6,NULL,9767,'2020-05-31 22:08:20','dcdoOaFYKDU:APA91bH1B9qCutaKkJniCNYMEA3mYfyp8_dhwlEtkGRDXqgXfrGo20qPuOIoQ_lYkxtxEbvTYwXQtBbXurTfFN2lOJhQs3RvdVG4jqjM56VGcP2tZ10hUJDXxlGGMqOtfhW_Kk6pk5fm'),(17,'Dr.A.Vamshidhar','dr_vamshidhar@tumorboardDB.in','citineuro@9664',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,1,'2020-05-31 22:08:20','doctor',7,NULL,9767,'2020-05-31 22:08:20','dcdoOaFYKDU:APA91bH1B9qCutaKkJniCNYMEA3mYfyp8_dhwlEtkGRDXqgXfrGo20qPuOIoQ_lYkxtxEbvTYwXQtBbXurTfFN2lOJhQs3RvdVG4jqjM56VGcP2tZ10hUJDXxlGGMqOtfhW_Kk6pk5fm'),(18,'Dr.P.Pavan Kumar','dr_pavankumar@tumorboardDB.in','citineuro@2467',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,1,'2020-05-31 22:08:20','doctor',8,NULL,9767,'2020-05-31 22:08:20','dcdoOaFYKDU:APA91bH1B9qCutaKkJniCNYMEA3mYfyp8_dhwlEtkGRDXqgXfrGo20qPuOIoQ_lYkxtxEbvTYwXQtBbXurTfFN2lOJhQs3RvdVG4jqjM56VGcP2tZ10hUJDXxlGGMqOtfhW_Kk6pk5fm'),(19,'Dr.Ananth Egoor','dr_ananthegoor@tumorboardDB.in','citineuro@1356',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,1,'2020-05-31 22:08:20','doctor',9,NULL,9767,'2020-05-31 22:08:20','dcdoOaFYKDU:APA91bH1B9qCutaKkJniCNYMEA3mYfyp8_dhwlEtkGRDXqgXfrGo20qPuOIoQ_lYkxtxEbvTYwXQtBbXurTfFN2lOJhQs3RvdVG4jqjM56VGcP2tZ10hUJDXxlGGMqOtfhW_Kk6pk5fm'),(20,'Dr.D.Seshgiri Rao','dr_seshgirirao@tumorboardDB.in','citineuro@7455',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,1,'2020-05-31 22:08:20','doctor',10,NULL,9767,'2020-05-31 22:08:20','dcdoOaFYKDU:APA91bH1B9qCutaKkJniCNYMEA3mYfyp8_dhwlEtkGRDXqgXfrGo20qPuOIoQ_lYkxtxEbvTYwXQtBbXurTfFN2lOJhQs3RvdVG4jqjM56VGcP2tZ10hUJDXxlGGMqOtfhW_Kk6pk5fm'),(21,'Dr.A.Siva Prasad','dr_sivaprasad@tumorboardDB.in','citineuro@786',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,1,'2020-05-31 22:08:20','doctor',11,NULL,9767,'2020-05-31 22:08:20','dcdoOaFYKDU:APA91bH1B9qCutaKkJniCNYMEA3mYfyp8_dhwlEtkGRDXqgXfrGo20qPuOIoQ_lYkxtxEbvTYwXQtBbXurTfFN2lOJhQs3RvdVG4jqjM56VGcP2tZ10hUJDXxlGGMqOtfhW_Kk6pk5fm'),(22,'Dr.P.Vijaya Prasanna','dr_vijayaprasanna@tumorboardDB.in','citineuro@2367',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,1,'2020-05-31 22:08:20','doctor',12,NULL,9767,'2020-05-31 22:08:20','dcdoOaFYKDU:APA91bH1B9qCutaKkJniCNYMEA3mYfyp8_dhwlEtkGRDXqgXfrGo20qPuOIoQ_lYkxtxEbvTYwXQtBbXurTfFN2lOJhQs3RvdVG4jqjM56VGcP2tZ10hUJDXxlGGMqOtfhW_Kk6pk5fm'),(23,'Dr.V.Chandrachud','dr_chandrachud@tumorboardDB.in','citineuro@786',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,1,'2020-05-31 22:08:20','doctor',13,NULL,9767,'2020-05-31 22:08:20','dcdoOaFYKDU:APA91bH1B9qCutaKkJniCNYMEA3mYfyp8_dhwlEtkGRDXqgXfrGo20qPuOIoQ_lYkxtxEbvTYwXQtBbXurTfFN2lOJhQs3RvdVG4jqjM56VGcP2tZ10hUJDXxlGGMqOtfhW_Kk6pk5fm'),(24,'Dr.J.Madhusudhan Rao','dr_madhusudhanrao@tumorboardDB.in','citineuro@4346',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,1,'2020-05-31 22:08:20','doctor',14,NULL,9767,'2020-05-31 22:08:20','dcdoOaFYKDU:APA91bH1B9qCutaKkJniCNYMEA3mYfyp8_dhwlEtkGRDXqgXfrGo20qPuOIoQ_lYkxtxEbvTYwXQtBbXurTfFN2lOJhQs3RvdVG4jqjM56VGcP2tZ10hUJDXxlGGMqOtfhW_Kk6pk5fm'),(25,'Dr.P.Ravi Kumar','dr_ravikumar@tumorboardDB.in','citineuro@2378',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,1,'2020-05-31 22:08:20','doctor',15,NULL,9767,'2020-05-31 22:08:20','dcdoOaFYKDU:APA91bH1B9qCutaKkJniCNYMEA3mYfyp8_dhwlEtkGRDXqgXfrGo20qPuOIoQ_lYkxtxEbvTYwXQtBbXurTfFN2lOJhQs3RvdVG4jqjM56VGcP2tZ10hUJDXxlGGMqOtfhW_Kk6pk5fm'),(26,'Dr.B.N.Nageswara Rao','dr_nageswararao@tumorboardDB.in','citineuro@8985',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,1,'2020-05-31 22:08:20','doctor',16,NULL,9767,'2020-05-31 22:08:20','dcdoOaFYKDU:APA91bH1B9qCutaKkJniCNYMEA3mYfyp8_dhwlEtkGRDXqgXfrGo20qPuOIoQ_lYkxtxEbvTYwXQtBbXurTfFN2lOJhQs3RvdVG4jqjM56VGcP2tZ10hUJDXxlGGMqOtfhW_Kk6pk5fm'),(27,'Dr.D.Ravi Varma','dr_ravivarma@tumorboardDB.in','citineuro@2658',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,1,'2020-05-31 22:08:20','doctor',17,NULL,9767,'2020-05-31 22:08:20','dcdoOaFYKDU:APA91bH1B9qCutaKkJniCNYMEA3mYfyp8_dhwlEtkGRDXqgXfrGo20qPuOIoQ_lYkxtxEbvTYwXQtBbXurTfFN2lOJhQs3RvdVG4jqjM56VGcP2tZ10hUJDXxlGGMqOtfhW_Kk6pk5fm');
/*!40000 ALTER TABLE `userdetails` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `videoconvo`
--

DROP TABLE IF EXISTS `videoconvo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `videoconvo` (
  `slno` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `accountsid` varchar(100) NOT NULL,
  `roomsid` varchar(100) NOT NULL,
  `doctorid` int(10) unsigned DEFAULT NULL,
  `patientid` int(10) unsigned DEFAULT NULL,
  `roomname` varchar(30) DEFAULT NULL,
  `time_created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `time_ended` timestamp NULL DEFAULT NULL,
  `time_doctor_joined` timestamp NULL DEFAULT NULL,
  `time_doctor_left` timestamp NULL DEFAULT NULL,
  `time_patient_joined` timestamp NULL DEFAULT NULL,
  `time_patient_left` timestamp NULL DEFAULT NULL,
  `duration` varchar(10) DEFAULT NULL,
  `doctor_duration` varchar(10) DEFAULT NULL,
  `patient_duration` varchar(10) DEFAULT NULL,
  `doctorstatus` varchar(45) DEFAULT NULL,
  `patientstatus` varchar(45) DEFAULT NULL,
  `roomstatus` varchar(45) DEFAULT NULL,
  `videouri` text,
  PRIMARY KEY (`slno`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `videoconvo`
--

LOCK TABLES `videoconvo` WRITE;
/*!40000 ALTER TABLE `videoconvo` DISABLE KEYS */;
/*!40000 ALTER TABLE `videoconvo` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-06-12 12:58:29
