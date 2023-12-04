-- MySQL dump 10.13  Distrib 8.0.35, for Linux (x86_64)
--
-- Host: 127.0.0.1    Database: clinicmaster
-- ------------------------------------------------------
-- Server version	8.0.35-0ubuntu0.22.04.1

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
UNLOCK TABLES;
DROP TABLE IF EXISTS `appointments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `appointments` (
  `appointmentID` int NOT NULL AUTO_INCREMENT,
  `time` varchar(45) DEFAULT NULL,
  `date` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`appointmentID`)
) ENGINE=InnoDB AUTO_INCREMENT=129 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `appointments`
--
LOCK TABLES `appointments` WRITE;
/*!40000 ALTER TABLE `appointments` DISABLE KEYS */;
INSERT INTO `appointments` VALUES (1, '2024-1-12', '22:22'), (2, '2024-2-13', '09:00'), 
(3, '2024-4-14', '14:30'), (4, '2024-4-15', '17:45'), (5, '2024-6-16', '11:20'),
(6, '2024-10-17', '08:15'), (7, '2024-5-18', '16:00'), (8, '2024-6-19', '10:45'),
(9, '2024-11-20', '13:00'), (10, '2024-12-21', '19:30'), (11, '2024-1-22', '15:10'),
(12, '2024-3-23', '12:40'), (13, '2024-5-24', '20:00'), (14, '2024-1-25', '09:30'), (15, '2023-2-15', '10:15');
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
  CONSTRAINT `fk_attends_3` FOREIGN KEY (`staffID`) REFERENCES `staff` (`staffID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `attends`
--

LOCK TABLES `attends` WRITE;
/*!40000 ALTER TABLE `attends` DISABLE KEYS */;
INSERT INTO `attends` VALUES (1,12345,1);
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
INSERT INTO `consistsof` VALUES (128,'Cancer Care','asldkfja');
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
INSERT INTO `controlledby` VALUES ('Anesthesia',1,'Pain relief for patients'),('Cardiology',2,'Heart care'),('Dietary Service',3,'Diet help'),('Emergency Room',4,'Patient treatment'),('Intensive Care Unit',5,'Caring for patient'),('Laboratory',6,'Help to Research'),('Medical Surgery',7,'Surgical purposes'),('Neurology',8,'Nervous Treatment care'),('Obstetrics',9,'Child birth'),('Pediatrics',10,' Child care');
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
INSERT INTO `department` VALUES ('Anesthesia ','Karmehr'),('Cardiology ','Sam'),('Dietary Services','Austin'),('Emergency ','Geronimo'),('Intensive Care Unit','Tyler'),('Laboratory','Kean'),('Medical-Surgical Unit','Derrick'),('Neurology ','Matthew'),('Obstetrics and Gynecology','Anthony'),('Pediatrics ','Phillip');
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
INSERT INTO `employs` VALUES (1,'Anesthesia','Medication','Medication Prescription'),(2,'Cardiology','Heart','Atrial Fibrillation care'),(3,'Dietary','Diet','Diet analysis and guidance'),(4,'Emergency Department','Care','Surgery'),(5,'Intensive Care Unit','Intense Care','Shots, Drug use'),(6,'Laboratory','Research','Medication Creation'),(7,'Medical Surgery','Surgery','Surgery'),(8,'Neurology','Nervous System','Mental Health care'),(9,'Obstetrics','Child Birth','Helping give birth'),(10,'Pediatrics','Child Care','Helping take care of a child');
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
INSERT INTO `has` VALUES (100,128);
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
INSERT INTO `inchargeof` VALUES ('Anesthesia','Cancer Care','Caring for Cancer patients'),('Cardiology','Cardiovascular','Heart and Blood inspection'),('Dietary Services','Diagnostic Information','Dietary advice and guidance'),('Emergency','Emergency Service','Emergency care for hurt patients'),('Intensive Care Unit','Laboratory','Urgent and thorough care for patients'),('Laboratory','Disease Research','Research and medication creation'),('Medical Surgery','Surgery','Surgery on patients'),('Neurology','Mental Health','Mental Health care for patients'),('Obstetrics','Maternity','Child care information and guidance'),('Rehab','Rehabilitation','Physical and Mental rehabilitation');
/*!40000 ALTER TABLE `inchargeof` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `inventory`
--

DROP TABLE IF EXISTS `inventory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `inventory` (
  `itemID` int NOT NULL,
  `name` varchar(45) DEFAULT NULL,
  `quantity` int DEFAULT NULL,
  PRIMARY KEY (`itemID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `inventory`
--

LOCK TABLES `inventory` WRITE;
/*!40000 ALTER TABLE `inventory` DISABLE KEYS */;
INSERT INTO `inventory` VALUES (1,'Stethoscope',10),(2,'Syringe',20),(3,'Stretcher',30),(4,'IV ',40),(5,'Hospital Bed',50),(6,'Wheelchair',60),(7,'Surgical Instruments',70),(8,'Medical Gloves',80),(9,'X-ray Machine',90),(10,'Defibrillator',100);
/*!40000 ALTER TABLE `inventory` ENABLE KEYS */;
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
  `billingCard` int DEFAULT NULL,
  `balance` int DEFAULT NULL,
  PRIMARY KEY (`patientID`)
) ENGINE=InnoDB AUTO_INCREMENT=124 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `patient`
--

LOCK TABLES `patient` WRITE;
/*!40000 ALTER TABLE `patient` DISABLE KEYS */;
INSERT INTO `patient` VALUES (1,'Anthony',20,'123 Blvd',500,1000),(2,'Karmehr',21,'321 Steet',1000,2000),(3,'Phillip',22,'456 Avenue',1500,3000),(4,'Derrick',23,'789 Lane',2000,4000),(5,'Tyler',24,'987 Blvd',2500,5000),(6,'Matthew',25,'123 Steret',3000,6000),(7,'Geronimo',26,'654 Avenue',3500,7000),(8,'Austin',27,'987 Lane',4000,8000),(9,'Sam',28,'789 Blvd',4500,9000),(10,'Kean',29,'912 Rd',5000,10000);
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
INSERT INTO `room` VALUES (100,7,'Wing',100),(200,2,'Checkup',10),(300,2,'Surgery',20),(400,3,'Emergency Room',30),(500,4,'Lobby',40),(600,5,'Laboratory',50),(700,6,'Rehabilitation',60),(800,7,'Mental Health ',70),(900,8,'Cancer Research',80),(1000,9,'Intensive Care Unit',90),(1100,10,'Dietary Research',100);
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
INSERT INTO `services` VALUES ('Cancer Care',8000,'Laboratory'),('Cardiovascular ',7000,'Cardiology'),('Diagnostic Imaging',3000,'Laboratory'),
('Emergency Medical',1000,'Intensive Care Unit'),('Laboratory',4000,'Laboratory'),('Maternity and Obstetrics',5000,'Obstetrics'),
('Mental Health',10000,'Neurology'),('Pediatric ',6000,'Pediatrics'),('Rehabilitation ',9000,'Cardiology'),('Surgery',2000,'Anesthesia'),
('Therapy',5000,'Neurology'),('Preventative Care',100,'Pediatrics'),('Surgery ',90000,'Surgery'),('Immunology',2000,'Internal Medicine'), ('Oncology',2000,'Cancer Treatment');
/*!40000 ALTER TABLE `services` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `staff`
--

DROP TABLE IF EXISTS `staff`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `staff` (
  `staffID` int NOT NULL,
  `name` varchar(45) DEFAULT NULL,
  `age` int DEFAULT NULL,
  `job` varchar(45) DEFAULT NULL,
  `salary` int DEFAULT NULL,
  PRIMARY KEY (`staffID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `staff`
--

LOCK TABLES `staff` WRITE;
/*!40000 ALTER TABLE `staff` DISABLE KEYS */;
INSERT INTO `staff` VALUES (1,'Anthony',20,'Physician',10000),(2,'Karmehr',29,'Nurse',100000),(3,'Phillip',24,'Surgeon',50000),
(4,'Derrick',22,'Pharmacist',30000),(5,'Tyler',25,'Anesthesiologist',60000),(6,'Matthew',26,'Physical Therapist',70000),
(7,'Geronimo',27,'Dietitian',80000),(8,'Austin',23,'Medical Biller',40000),(9,'Sam',21,'Medical Records Clerk',20000),
(10,'Kean',28,'Hospital Administrator',90000), (11,'Robby',36,'Doctor',160000), (12,'Earl',40,'Doctor',140000),
(13,'Brock',26,'Pharmacist',40000), (14,'Jalen',54,'Physical Therapist',60000), (15,'Brandon',62,'Surgeon',200000);
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
  PRIMARY KEY (`patientID`,`staffID`),
  CONSTRAINT `patientid` FOREIGN KEY (`patientID`) REFERENCES `patient` (`patientID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `takescareof`
--

LOCK TABLES `takescareof` WRITE;
/*!40000 ALTER TABLE `takescareof` DISABLE KEYS */;
INSERT INTO `takescareof` VALUES (1,10,'Name: Anthony, Age: 23, DOB: 9/10/2000'),(2,20,'Name: Karmehr, Age: 24, DOB:9/10/1999 '),(3,30,'Name: Phillip, Age: 25, DOB: 9/10/1998'),(4,40,'Name: Derrick, Age: 26, DOB: 9/10/1997'),(5,50,'Name: Tyler, Age: 27, DOB: 9/10/1996'),(6,60,'Name: Matthew, Age: 28, DOB: 9/10/1995'),(7,70,'Name: Sam, Age: 29, DOB: 9/10/1994'),(8,80,'Name: Geronimo, Age: 30, DOB: 9/10/1993'),(9,90,'Name: Austin, Age: 31, DOB: 9/10/1992'),(10,100,'Name: Kean, Age: 32, DOB: 9/10/1991');
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

-- Dump completed on 2023-11-29 19:46:09
