-- MySQL dump 10.13  Distrib 8.0.34, for Linux (x86_64)
--
-- Host: 127.0.0.1    Database: clinicmaster
-- ------------------------------------------------------
-- Server version	8.0.34-0ubuntu0.22.04.1

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
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `appointments`
--

LOCK TABLES `appointments` WRITE;
/*!40000 ALTER TABLE `appointments` DISABLE KEYS */;
INSERT INTO `appointments` VALUES (1,'12:00PM','10/12/2023'),(2,'1:00PM','10/11/2023'),(3,'2:00PM','10/10/2023'),(4,'3:00PM','10/13/2023'),(5,'4:00PM','10/14/2023'),(6,'5:00PM','10/15/2023'),(7,'6:00PM','10/16/2023'),(8,'7:00PM','10/17/2023'),(9,'8:00PM','10/18/2023'),(10,'9:00PM','10/19/2023');
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
  `patientID` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `attends`
--

LOCK TABLES `attends` WRITE;
/*!40000 ALTER TABLE `attends` DISABLE KEYS */;
INSERT INTO `attends` VALUES (100,10,1),(200,20,2),(300,30,3),(400,40,4),(500,50,5),(600,60,6),(700,70,7),(800,80,8),(900,90,9),(1000,10,10);
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
  `serviceDescription` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `consistsof`
--

LOCK TABLES `consistsof` WRITE;
/*!40000 ALTER TABLE `consistsof` DISABLE KEYS */;
INSERT INTO `consistsof` VALUES (1,'Cancer Care','Caring for Cancer patients'),(2,'Cardiovascular','Heart and Blood inspection'),(3,'Diagnostic Information','Dietary advice and guidance'),(4,'Emergency Service','Emergency care for hurt patients'),(5,'Laboratory','Research of medication'),(6,'Disease Research','Research of diseases and their cause'),(7,'Surgery','Surgery on patients'),(8,'Mental Heatlh','Mental Health care for patients'),(9,'Rehab','Mental/Physical rehabilitation of patients'),(10,'Maternity','Child birth information and guidance');
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
  `appointmentID` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `has`
--

LOCK TABLES `has` WRITE;
/*!40000 ALTER TABLE `has` DISABLE KEYS */;
INSERT INTO `has` VALUES (101,1),(202,2),(303,3),(404,4),(505,5),(606,6),(707,7),(808,8),(909,9),(1001,10);
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
) ENGINE=InnoDB AUTO_INCREMENT=47 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `patient`
--

LOCK TABLES `patient` WRITE;
/*!40000 ALTER TABLE `patient` DISABLE KEYS */;
INSERT INTO `patient` VALUES (1,'Anthony',20,'123 Blvd',500,1000),(2,'Karmehr',21,'321 Steet',1000,2000),(3,'Phillip',22,'456 Avenue',1500,3000),(4,'Derrick',23,'789 Lane',2000,4000),(5,'Tyler',24,'987 Blvd',2500,5000),(6,'Matthew',25,'123 Steret',3000,6000),(7,'Geronimo',26,'654 Avenue',3500,7000),(8,'Austin',27,'987 Lane',4000,8000),(9,'Sam',28,'789 Blvd',4500,9000),(10,'Kean',29,'912 Rd',5000,10000),(26,'qwefqwef',123,'qwefq',2134,0),(27,'qwefqwef',123,'qwefq',2134,0),(28,'qwefqwef',123,'qwefq',2134,0),(29,'qwefqwef',123,'qwefq',2134,0),(30,'qwefqwef',123,'qwefq',2134,0),(31,'qwefqwef',123,'qwefq',2134,0),(32,'qwefqwef',123,'qwefq',2134,0),(33,'qwefqwef',123,'qwefq',2134,0),(34,'qwefqwef',123,'qwefq',2134,0),(35,'qwefqwef',123,'qwefq',2134,0),(36,'qwefqwef',123,'qwefq',2134,0),(37,'qwefqwef',123,'qwefq',2134,0),(38,'qwefqwef',123,'qwefq',2134,0),(39,'ewfq',123,'wefq123',123,0),(40,'first',123,'first',456,0),(41,'first',123,'first',456,0),(42,'first',123,'first',456,0),(43,'first',123,'first',456,0),(44,'null',NULL,'null',NULL,0),(45,'null',NULL,'null',NULL,0),(46,'null',NULL,'null',NULL,0);
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
INSERT INTO `room` VALUES (101,1,'Checkup',10),(202,2,'Surgery',20),(303,3,'Emergency Room',30),(404,4,'Lobby',40),(505,5,'Laboratory',50),(606,6,'Rehabilitation',60),(707,7,'Mental Health ',70),(808,8,'Cancer Research',80),(909,9,'Intensive Care Unit',90),(1000,10,'Dietary Research',100);
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
INSERT INTO `services` VALUES ('Cancer Care',8000,'Laboratory'),('Cardiovascular ',7000,'Cardiology'),('Diagnostic Imaging',3000,'Laboratory'),('Emergency Medical',1000,'Intensive Care Unit'),('Laboratory',4000,'Laboratory'),('Maternity and Obstetrics',5000,'Obstetrics'),('Mental Health',10000,'Neurology'),('Pediatric ',6000,'Pediatrics'),('Rehabilitation ',9000,'Cardiology'),('Surgery',2000,'Anesthesia');
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
INSERT INTO `staff` VALUES (12345,'Anthony',20,'Physician',10000),(19876,'Karmehr',29,'Nurse',100000),(21543,'Phillip',24,'Surgeon',50000),(32145,'Derrick',22,'Pharmacist',30000),(51234,'Tyler',25,'Anesthesiologist',60000),(52134,'Matthew',26,'Physical Therapist',70000),(53124,'Geronimo',27,'Dietitian',80000),(54123,'Austin',23,'Medical Biller',40000),(54321,'Sam',21,'Medical Records Clerk',20000),(67890,'Kean',28,'Hospital Administrator',90000);
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

-- Dump completed on 2023-10-29 19:05:08
