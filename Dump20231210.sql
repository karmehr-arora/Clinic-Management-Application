CREATE DATABASE  IF NOT EXISTS `clinicmaster` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `clinicmaster`;
-- MySQL dump 10.13  Distrib 8.0.34, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: clinicmaster
-- ------------------------------------------------------
-- Server version	8.0.34

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
-- Table structure for table `appointments`
--

DROP TABLE IF EXISTS `appointments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `appointments` (
  `appointmentID` int NOT NULL AUTO_INCREMENT,
  `time` varchar(45) DEFAULT NULL,
  `date` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`appointmentID`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `appointments`
--

LOCK TABLES `appointments` WRITE;
/*!40000 ALTER TABLE `appointments` DISABLE KEYS */;
INSERT INTO `appointments` VALUES (16,'04:00','2023-12-05'),(17,'03:00','2024-12-12'),(18,'06:00','2023-12-25'),(19,'16:00','2024-01-05'),(20,'03:00','2024-02-24'),(21,'17:00','2024-03-15'),(22,'09:00','2024-05-12'),(23,'11:00','2024-10-25'),(24,'14:00','2024-06-16'),(25,'09:00','2024-12-20'),(26,'08:00','2023-12-29'),(27,'09:00','2024-07-06'),(28,'17:00','2024-12-05'),(29,'10:00','2024-09-06'),(30,'20:00','2024-12-24');
/*!40000 ALTER TABLE `appointments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `attends`
--

DROP TABLE IF EXISTS `attends`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `attends` (
  `appointmentID` int NOT NULL,
  `staffID` int NOT NULL,
  `patientID` int NOT NULL,
  KEY `patient_idx` (`patientID`),
  KEY `fk_attends_2_idx` (`appointmentID`),
  KEY `fk_attends_3_idx` (`staffID`),
  CONSTRAINT `fk_attends_1` FOREIGN KEY (`patientID`) REFERENCES `patient` (`patientID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_attends_2` FOREIGN KEY (`appointmentID`) REFERENCES `appointments` (`appointmentID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_attends_3` FOREIGN KEY (`staffID`) REFERENCES `staff` (`staffID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `attends`
--

LOCK TABLES `attends` WRITE;
/*!40000 ALTER TABLE `attends` DISABLE KEYS */;
INSERT INTO `attends` VALUES (16,13,126),(17,3,4),(18,9,128),(19,11,7),(20,9,3),(21,10,129),(22,11,1),(23,7,4),(24,9,7),(25,9,4),(26,11,9),(27,9,128),(28,8,10),(29,4,8),(30,10,7);
/*!40000 ALTER TABLE `attends` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `consistsof`
--

DROP TABLE IF EXISTS `consistsof`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `consistsof` (
  `appointmentID` int NOT NULL,
  `serviceName` varchar(45) NOT NULL,
  `serviceDescription` varchar(45) DEFAULT NULL,
  KEY `fk_consistsof_1_idx` (`appointmentID`),
  KEY `fk_consistsof_2_idx` (`serviceName`),
  CONSTRAINT `fk_consistsof_1` FOREIGN KEY (`appointmentID`) REFERENCES `appointments` (`appointmentID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_consistsof_2` FOREIGN KEY (`serviceName`) REFERENCES `services` (`serviceName`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `consistsof`
--

LOCK TABLES `consistsof` WRITE;
/*!40000 ALTER TABLE `consistsof` DISABLE KEYS */;
INSERT INTO `consistsof` VALUES (16,'Cancer Care','asdad'),(17,'Diagnostic Imaging','asdfjalkdsfj'),(18,'Emergency Medical','Heart Attack'),(19,'Maternity and Obstetrics','Giving Birth'),(20,'Immunology','Vaccine'),(21,'Mental Health','Mental Theraphy'),(22,'Diagnostic Imaging','MRI'),(23,'Rehabilitation ','Knee Rehab'),(24,'Pediatric ','Child Visit'),(25,'Laboratory','Blood Sample'),(26,'Emergency Medical','Stroke'),(27,'Cardiovascular ','Heartcheck'),(28,'Cancer Care','Chemotheraphy'),(29,'Preventative Care','Exam'),(30,'Immunology','Vaccine');
/*!40000 ALTER TABLE `consistsof` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `controlledby`
--

DROP TABLE IF EXISTS `controlledby`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `controlledby` (
  `departmentName` varchar(45) NOT NULL,
  `itemID` int NOT NULL,
  `itemUsage` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`departmentName`,`itemID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `controlledby`
--

LOCK TABLES `controlledby` WRITE;
/*!40000 ALTER TABLE `controlledby` DISABLE KEYS */;
INSERT INTO `controlledby` VALUES ('Anesthesia',1,'Pain relief for patients'),('Cardiology',2,'Heart care'),('Dietary Service',3,'Diet help'),('Emergency Room',4,'Patient treatment'),('Intensive Care Unit',5,'Caring for patient'),('Laboratory',6,'Help to Research'),('Medical Surgery',7,'Surgical purposes'),('Neurology',8,'Nervous Treatment care'),('Obstetrics',9,'Child birth'),('Orthopedics',15,'Body Realignment or Streching'),('Pediatrics',10,'Child care'),('Physical Therapy',11,'Physical Body care'),('Psychiatry',12,'Mental Care'),('Radiology',13,'Full-body / Skeletal Scans'),('Rehab',14,'Physical and Mental rehabilitation');
/*!40000 ALTER TABLE `controlledby` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `department`
--

DROP TABLE IF EXISTS `department`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `department` (
  `departmentName` varchar(45) NOT NULL,
  `chairperson` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`departmentName`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `department`
--

LOCK TABLES `department` WRITE;
/*!40000 ALTER TABLE `department` DISABLE KEYS */;
INSERT INTO `department` VALUES ('Anesthesia ','Karmehr'),('Cardiology ','Sam'),('Dietary Services','Austin'),('Emergency ','Geronimo'),('Intensive Care Unit','Tyler'),('Laboratory','Kean'),('Medical-Surgical Unit','Derrick'),('Medicinal Research','Earl'),('Neurology ','Matthew'),('Obstetrics and Gynecology','Anthony'),('Oncology','kean'),('Orthopedics','Brock'),('Pediatrics ','Phillip'),('Pharmacy','Jalen'),('Surgery','Robby');
/*!40000 ALTER TABLE `department` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employs`
--

DROP TABLE IF EXISTS `employs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `employs` (
  `staffID` int NOT NULL,
  `departmentName` varchar(45) NOT NULL,
  `specialty` varchar(45) DEFAULT NULL,
  `servicesOffered` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`staffID`,`departmentName`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employs`
--

LOCK TABLES `employs` WRITE;
/*!40000 ALTER TABLE `employs` DISABLE KEYS */;
INSERT INTO `employs` VALUES (1,'Anesthesia','Medication','Medication Prescription'),(2,'Cardiology','Heart','Atrial Fibrillation care'),(3,'Dietary','Diet','Diet analysis and guidance'),(4,'Emergency Department','Care','Surgery'),(5,'Intensive Care Unit','Intense Care','Shots, Drug use'),(6,'Laboratory','Research','Medication Creation'),(7,'Medical Surgery','Surgery','Surgery'),(8,'Neurology','Nervous System','Mental Health care'),(9,'Obstetrics','Child Birth','Helping give birth'),(10,'Pediatrics','Child Care','Helping take care of a child'),(11,'Physical Therapy','Physical Recovery','Methods to help the body phyiscally recover'),(12,'Psychiatry','Mental Health','Mental Help and talks'),(13,'Radiology','Medical Imaging','X-Rays'),(14,'Rehab','Physical Care','Rehabilitation centers'),(15,'Orthopedics','Skeletal Care','Realignment, Stretches');
/*!40000 ALTER TABLE `employs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `has`
--

DROP TABLE IF EXISTS `has`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `has` (
  `roomNumber` int NOT NULL,
  `appointmentID` int NOT NULL,
  KEY `fk_has_1_idx` (`appointmentID`),
  KEY `fk_has_2_idx` (`roomNumber`),
  CONSTRAINT `fk_has_1` FOREIGN KEY (`appointmentID`) REFERENCES `appointments` (`appointmentID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_has_2` FOREIGN KEY (`roomNumber`) REFERENCES `room` (`roomNumber`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `has`
--

LOCK TABLES `has` WRITE;
/*!40000 ALTER TABLE `has` DISABLE KEYS */;
INSERT INTO `has` VALUES (900,16),(400,17),(800,18),(400,19),(900,20),(200,21),(800,22),(300,23),(400,24),(200,25),(500,26),(400,27),(700,28),(800,29),(1000,30);
/*!40000 ALTER TABLE `has` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `inchargeof`
--

DROP TABLE IF EXISTS `inchargeof`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `inchargeof` (
  `departmentName` varchar(45) NOT NULL,
  `serviceName` varchar(45) NOT NULL,
  `serviceDescription` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`departmentName`,`serviceName`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `inchargeof`
--

LOCK TABLES `inchargeof` WRITE;
/*!40000 ALTER TABLE `inchargeof` DISABLE KEYS */;
INSERT INTO `inchargeof` VALUES ('Anesthesia','Cancer Care','Caring for Cancer patients'),('Cardiology','Cardiovascular','Heart and Blood inspection'),('Dietary Services','Diagnostic Information','Dietary advice and guidance'),('Emergency','Emergency Service','Emergency care for hurt patients'),('Infectious Diseases ','Diagnosis and Treatment of Infections','Combatting infections'),('Intensive Care Unit','Laboratory','Urgent and thorough care for patients'),('Laboratory','Disease Research','Research and medication creation'),('Medical Surgery','Surgery','Surgery on patients'),('Neurology','Mental Health','Mental Health care for patients'),('Obstetrics','Maternity','Child care information and guidance'),('Orthopedics','Musculoskeletal Disorder Diagnosis','Restoring Mobility with Care'),('Physical Therapy','Physical Rehabilitation','Rebuilding strength'),('Psychiatry','Mental Health Assessment','Supporting mental well-being'),('Radiology','Medical Imaging and Diagnostic','Precision imaging for accurate diagnosis'),('Rehab','Rehabilitation','Physical and Mental rehabilitation');
/*!40000 ALTER TABLE `inchargeof` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `inventory`
--

DROP TABLE IF EXISTS `inventory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `inventory` (
  `itemID` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  `quantity` int DEFAULT NULL,
  PRIMARY KEY (`itemID`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `inventory`
--

LOCK TABLES `inventory` WRITE;
/*!40000 ALTER TABLE `inventory` DISABLE KEYS */;
INSERT INTO `inventory` VALUES (1,'Stethoscope',10),(2,'Syringe',20),(3,'Stretcher',30),(4,'IV ',40),(5,'Hospital Bed',50),(6,'Wheelchair',60),(7,'Surgical Instruments',70),(8,'Medical Gloves',80),(9,'X-ray Machine',90),(10,'Defibrillator',100),(11,'asdas',1),(12,'asdsad',123),(13,'NEWITEM',123213123),(14,'Chairs',25),(15,'Tables',10);
/*!40000 ALTER TABLE `inventory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `login`
--

DROP TABLE IF EXISTS `login`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `login` (
  `userID` varchar(45) NOT NULL,
  `password` varchar(45) NOT NULL,
  `age` int NOT NULL,
  `firstName` varchar(45) NOT NULL,
  `lastName` varchar(45) NOT NULL,
  `address` varchar(45) NOT NULL,
  `securityClearance` int NOT NULL DEFAULT '1',
  PRIMARY KEY (`userID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `login`
--

LOCK TABLES `login` WRITE;
/*!40000 ALTER TABLE `login` DISABLE KEYS */;
INSERT INTO `login` VALUES ('123@123.com','12345678',1,'kean','lee','123 street',1),('admin@gmail.com','12345678',21,'Karmehr','Arora','12345 dreary lane',1);
/*!40000 ALTER TABLE `login` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `patient`
--

DROP TABLE IF EXISTS `patient`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `patient` (
  `patientID` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  `age` int DEFAULT NULL,
  `address` varchar(45) DEFAULT NULL,
  `billingCard` bigint DEFAULT NULL,
  `balance` int DEFAULT NULL,
  PRIMARY KEY (`patientID`)
) ENGINE=InnoDB AUTO_INCREMENT=132 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `patient`
--

LOCK TABLES `patient` WRITE;
/*!40000 ALTER TABLE `patient` DISABLE KEYS */;
INSERT INTO `patient` VALUES (1,'Anthony Aston',20,'1234 Main Street, San Jose, CA',2883029345982374,4000),(2,'Karmehr Arora',21,'793245 Java Street, San Jose, CA',2849394834589752,0),(3,'Phillip James',22,'13495723 Side Street, San Francisco, CA',2948573627384958,5000),(4,'Derrick Nguyen',23,'471234 Cool Street, San Francisco, CA',2134987120095433,20000),(5,'Tyler Smith',24,'124182 Bad Street, Los Gatos, CA',1234876509871234,5000),(6,'Matthew Mcdonald',25,'12 Sun Street, Fremont, CA',2938475683977822,6000),(7,'Geronimo Aldana',26,'1234 Moon Street, Los Angeles, CA',9854089609345634,13000),(8,'Austin White',27,'897 Parkway Ave, Vallejo, CA',7852369452345832,100),(9,'Sam Smith',28,'9635 Drive Street, Santa Clara, CA',4839573839482934,1000),(10,'Vladimir Putin',29,'1234 Train Street, Gilroy, CA',2398457230495823,18000),(126,'Xi Jinping',40,'1239 Python Street, Salinas, CA',2348572034528345,8000),(127,'Joe Biden',30,'1239 Window Street, Miliptas, CA',8887654448384579,0),(128,'John Doe',80,'3492 Building Street, Redwood City, CA',7059283690470934,8000),(129,'Florida Man',65,'9874 Red Street, Las Vegas, NV',6598327465827345,10000),(130,'Elon Mush',40,'32948 Tesla Street, Fremont, CA',7853695872394857,0);
/*!40000 ALTER TABLE `patient` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `room`
--

DROP TABLE IF EXISTS `room`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `room` (
  `roomNumber` int NOT NULL,
  `building` int DEFAULT NULL,
  `type` varchar(45) DEFAULT NULL,
  `bedsAvailable` int DEFAULT NULL,
  PRIMARY KEY (`roomNumber`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `room`
--

LOCK TABLES `room` WRITE;
/*!40000 ALTER TABLE `room` DISABLE KEYS */;
INSERT INTO `room` VALUES (100,7,'Wing',100),(200,2,'Checkup',10),(300,2,'Surgery',20),(400,3,'Emergency Room',30),(500,4,'Lobby',40),(600,5,'Laboratory',50),(700,6,'Rehabilitation',60),(800,7,'Mental Health ',70),(900,8,'Cancer Research',80),(1000,9,'Intensive Care Unit',90),(1100,10,'Dietary Research',100),(1200,11,'Checkup',50),(1300,12,'Lobby',60),(1400,13,'Surgery',70),(1500,14,'Laboratory',80);
/*!40000 ALTER TABLE `room` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `services`
--

DROP TABLE IF EXISTS `services`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `services` (
  `serviceName` varchar(45) NOT NULL,
  `cost` int DEFAULT NULL,
  `serviceDepartment` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`serviceName`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `services`
--

LOCK TABLES `services` WRITE;
/*!40000 ALTER TABLE `services` DISABLE KEYS */;
INSERT INTO `services` VALUES ('Cancer Care',8000,'Laboratory'),('Cardiovascular ',7000,'Cardiology'),('Diagnostic Imaging',3000,'Laboratory'),('Emergency Medical',1000,'Intensive Care Unit'),('Immunology',2000,'Internal Medicine'),('Laboratory',4000,'Laboratory'),('Maternity and Obstetrics',5000,'Obstetrics'),('Mental Health',10000,'Neurology'),('Oncology',2000,'Cancer Treatment'),('Pediatric ',6000,'Pediatrics'),('Preventative Care',100,'Pediatrics'),('Rehabilitation ',9000,'Cardiology'),('Surgery',2000,'Anesthesia'),('Surgery ',90000,'Surgery'),('Therapy',5000,'Neurology');
/*!40000 ALTER TABLE `services` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `staff`
--

DROP TABLE IF EXISTS `staff`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `staff` (
  `staffID` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  `age` int DEFAULT NULL,
  `job` varchar(45) DEFAULT NULL,
  `salary` int DEFAULT NULL,
  PRIMARY KEY (`staffID`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `staff`
--

LOCK TABLES `staff` WRITE;
/*!40000 ALTER TABLE `staff` DISABLE KEYS */;
INSERT INTO `staff` VALUES (1,'Anthony',20,'Physician',10000),(2,'Karmehr',29,'Nurse',100000),(3,'Phillip',24,'Surgeon',50000),(4,'Derrick',22,'Pharmacist',30000),(5,'Tyler',25,'Anesthesiologist',60000),(6,'Matthew',26,'Physical Therapist',70000),(7,'Geronimo',27,'Dietitian',80000),(8,'Austin',23,'Medical Biller',40000),(9,'Sam',21,'Medical Records Clerk',20000),(10,'Kean',28,'Hospital Administrator',90000),(11,'Robby',36,'Doctor',160000),(12,'Earl',40,'Doctor',140000),(13,'Brock',26,'Pharmacist',40000),(14,'Jalen',54,'Physical Therapist',60000),(16,'kean',1,'a',1),(17,'asdasd',1,'asdaasd',1);
/*!40000 ALTER TABLE `staff` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `takescareof`
--

DROP TABLE IF EXISTS `takescareof`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `takescareof` (
  `patientID` int NOT NULL,
  `staffID` int NOT NULL,
  `patientMedicalInfo` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`patientID`,`staffID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `takescareof`
--

LOCK TABLES `takescareof` WRITE;
/*!40000 ALTER TABLE `takescareof` DISABLE KEYS */;
INSERT INTO `takescareof` VALUES (1,10,'Name: Anthony, Age: 23, DOB: 9/10/2000'),(2,20,'Name: Karmehr, Age: 24, DOB:9/10/1999 '),(3,30,'Name: Phillip, Age: 25, DOB: 9/10/1998'),(4,40,'Name: Derrick, Age: 26, DOB: 9/10/1997'),(5,50,'Name: Tyler, Age: 27, DOB: 9/10/1996'),(6,60,'Name: Matthew, Age: 28, DOB: 9/10/1995'),(7,70,'Name: Sam, Age: 29, DOB: 9/10/1994'),(8,80,'Name: Geronimo, Age: 30, DOB: 9/10/1993'),(9,90,'Name: Austin, Age: 31, DOB: 9/10/1992'),(10,100,'Name: Kean, Age: 32, DOB: 9/10/1991'),(11,110,'Name: Robby Age: 36, DOB: 9/10/1987'),(12,120,'Name: Earl Age: 40, DOB: 9/10/1983'),(13,130,'Name: Brock Age: 35 DOB: 9/10/1988'),(14,140,'Name: Tyler Age: 37, DOB: 9/10/1986'),(15,150,'Name: Jalen Age: 54, DOB: 9/10/1969');
/*!40000 ALTER TABLE `takescareof` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-12-10 20:52:55
