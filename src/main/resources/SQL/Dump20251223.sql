-- MySQL dump 10.13  Distrib 8.0.42, for Win64 (x86_64)
--
-- Host: localhost    Database: userdatahandle
-- ------------------------------------------------------
-- Server version	8.0.42

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
-- Table structure for table `department`
--

DROP TABLE IF EXISTS `department`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `department` (
  `depid` int NOT NULL,
  `emplid` int DEFAULT NULL,
  `depname` varchar(50) DEFAULT NULL,
  `depmanager` varchar(50) DEFAULT NULL,
  `joiningdate` date DEFAULT NULL,
  `leavingdate` date DEFAULT NULL,
  KEY `fk_dep_emp` (`emplid`),
  CONSTRAINT `fk_dep_emp` FOREIGN KEY (`emplid`) REFERENCES `employee` (`emplid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `department`
--

LOCK TABLES `department` WRITE;
/*!40000 ALTER TABLE `department` DISABLE KEYS */;
INSERT INTO `department` VALUES (1,1001,'Sales','Mangal','2023-01-10',NULL),(2,1002,'Marketing','Ramesh','2023-02-15',NULL),(3,1003,'Finance','Priya','2023-03-20',NULL),(4,1004,'HR','Sneha','2023-04-10',NULL),(5,1005,'IT','Rohit','2023-05-05',NULL),(6,1006,'Support','Neha','2023-06-12',NULL),(7,1007,'Logistics','Vikram','2023-07-01',NULL),(8,1008,'Operations','Anita','2023-08-18',NULL),(9,1009,'Procurement','Suresh','2023-09-09',NULL),(10,1010,'R&D','Kiran','2023-10-11',NULL),(1,1011,'Sales','Mangal','2023-01-15',NULL),(2,1012,'Marketing','Ramesh','2023-02-20',NULL),(3,1013,'Finance','Priya','2023-03-25',NULL),(4,1014,'HR','Sneha','2023-04-15',NULL),(5,1015,'IT','Rohit','2023-05-10',NULL),(6,1016,'Support','Neha','2023-06-18',NULL),(7,1017,'Logistics','Vikram','2023-07-05',NULL),(8,1018,'Operations','Anita','2023-08-20',NULL),(9,1019,'Procurement','Suresh','2023-09-15',NULL),(10,1020,'R&D','Kiran','2023-10-15',NULL),(11,NULL,'Legal','Sunita','2025-01-01',NULL),(12,NULL,'Compliance','Rakesh','2025-02-01',NULL),(13,NULL,'Research','Divya','2025-03-01',NULL),(14,NULL,'Training','Ankur','2025-04-01',NULL),(15,NULL,'Quality','Meena','2025-05-01',NULL);
/*!40000 ALTER TABLE `department` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employee`
--

DROP TABLE IF EXISTS `employee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `employee` (
  `emplid` int NOT NULL,
  `firstname` varchar(50) DEFAULT NULL,
  `lastname` varchar(50) DEFAULT NULL,
  `empaddress` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`emplid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employee`
--

LOCK TABLES `employee` WRITE;
/*!40000 ALTER TABLE `employee` DISABLE KEYS */;
INSERT INTO `employee` VALUES (1001,'Aman','Kumar','Lucknow'),(1002,'Rahul','Sharma','Kanpur'),(1003,'Priya','Singh','Delhi'),(1004,'Sneha','Verma','Mumbai'),(1005,'Rohit','Gupta','Pune'),(1006,'Neha','Patel','Bangalore'),(1007,'Vikram','Yadav','Chennai'),(1008,'Anita','Joshi','Hyderabad'),(1009,'Suresh','Khatri','Jaipur'),(1010,'Kiran','Mehta','Ahmedabad'),(1011,'Pankaj','Rao','Lucknow'),(1012,'Ritu','Malhotra','Kanpur'),(1013,'Mohit','Saxena','Delhi'),(1014,'Alka','Shukla','Mumbai'),(1015,'Deepak','Chopra','Pune'),(1016,'Anjali','Agarwal','Bangalore'),(1017,'Manoj','Kumar','Chennai'),(1018,'Rekha','Singh','Hyderabad'),(1019,'Sanjay','Gupta','Jaipur'),(1020,'Tanya','Patel','Ahmedabad');
/*!40000 ALTER TABLE `employee` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `salary`
--

DROP TABLE IF EXISTS `salary`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `salary` (
  `salaryid` int NOT NULL AUTO_INCREMENT,
  `emplid` int NOT NULL,
  `emplsalary` decimal(10,2) DEFAULT NULL,
  `paymentdate` date DEFAULT NULL,
  PRIMARY KEY (`salaryid`),
  KEY `emplid` (`emplid`),
  CONSTRAINT `salary_ibfk_1` FOREIGN KEY (`emplid`) REFERENCES `employee` (`emplid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `salary`
--

LOCK TABLES `salary` WRITE;
/*!40000 ALTER TABLE `salary` DISABLE KEYS */;
INSERT INTO `salary` VALUES (1,1001,41000.00,'2025-10-01'),(2,1002,60000.00,'2025-10-02'),(3,1003,55000.00,'2025-10-03'),(4,1004,70000.00,'2025-10-04'),(5,1005,65000.00,'2025-10-05'),(6,1006,72000.00,'2025-10-06'),(7,1007,57000.00,'2025-10-07'),(8,1008,51000.00,'2025-10-08'),(9,1009,53000.00,'2025-10-09'),(10,1010,62000.00,'2025-10-10'),(11,1011,50000.00,'2025-10-11'),(12,1012,61000.00,'2025-10-12'),(13,1013,54000.00,'2025-10-13'),(14,1014,71000.00,'2025-10-14'),(15,1015,66000.00,'2025-10-15'),(16,1016,73000.00,'2025-10-16'),(17,1017,49000.00,'2025-10-17'),(18,1018,52000.00,'2025-10-18'),(19,1019,54000.00,'2025-10-19'),(20,1020,63000.00,'2025-10-20');
/*!40000 ALTER TABLE `salary` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_logn_details`
--

DROP TABLE IF EXISTS `user_logn_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_logn_details` (
  `id` bigint NOT NULL,
  `password` varchar(255) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  `mobile_number` varchar(255) DEFAULT NULL,
  `role` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_logn_details`
--

LOCK TABLES `user_logn_details` WRITE;
/*!40000 ALTER TABLE `user_logn_details` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_logn_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_logn_details_seq`
--

DROP TABLE IF EXISTS `user_logn_details_seq`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_logn_details_seq` (
  `next_val` bigint DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_logn_details_seq`
--

LOCK TABLES `user_logn_details_seq` WRITE;
/*!40000 ALTER TABLE `user_logn_details_seq` DISABLE KEYS */;
INSERT INTO `user_logn_details_seq` VALUES (1);
/*!40000 ALTER TABLE `user_logn_details_seq` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `email` varchar(255) DEFAULT NULL,
  `first_name` varchar(255) DEFAULT NULL,
  `is_active` char(1) NOT NULL,
  `keycloak_user_id` varchar(255) DEFAULT NULL,
  `last_name` varchar(255) DEFAULT NULL,
  `mobile_number` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `role` varchar(255) DEFAULT NULL,
  `user_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'arman@123','Mohammad','Y','ab3bc1ef-b834-4d7a-9f56-b0485ebdec63','Ahmad','7860436334','arman123','USER','khanArman'),(2,'arman123@gmail.com','Aiman','Y','888f709f-2ffd-4030-b7a1-705332f25fc3','Siddiqui','54654651653','aiman@123','ADMIN','aiman'),(3,'khan@gmail.com','Arman','Y','03e37718-18e3-44f6-b091-db318c634dbe','Khan','7845921478','78459','USER','a1arman'),(4,'afra@gmail.com','Afra','Y','e689030f-5a12-437e-b677-d364ed2899c0','Siddiqui','7845921478','789456','USER','afra'),(5,'atif53435@gmail.com','NewAtif','Y','ba03da7e-6fea-4d56-bb49-df1090bfbf48','Khan','564654','987456','ADMIN','atifboss'),(6,'atifshaikh0392@gmail.com','Shaik','Y','aa41d55a-da0d-4bdd-adc6-6da691311d10','Atif','8548654565','789456','ADMIN','attuboss123'),(7,'aiman@gmail.com','aiman','Y','d066350a-af1f-4dc6-bfcf-87283fe54459','sid','2135465578','789456','USER','khanaiman'),(8,'babu@gmail.com','babu','Y','e1ac4769-2627-4ee4-bd0e-b1015846c79b','sid','7845967458','789456','USER','khanbabu'),(9,'amir@gmail.com','amir','Y','29b90b99-5635-48bf-9bea-6e4246616202','khan','87884654651','321456','ADMIN','amir'),(10,'newemail@gmail.com','absc','Y','8e2db3cb-71bb-4f7f-8c0e-1ed41071dc0e','sadasdf','784579445','12345+','ADMIN','waris1'),(11,'khanahmad@gmail.com','Ahmadkhan','Y','412fdc32-8668-4566-8e64-a5bb7591f647','Sid','6547851545','arman@1234','USER','mohammad123');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-12-23  0:42:28
