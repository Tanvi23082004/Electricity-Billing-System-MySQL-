-- MySQL dump 10.13  Distrib 8.0.44, for Win64 (x86_64)
--
-- Host: localhost    Database: electricity_billing_system
-- ------------------------------------------------------
-- Server version	8.0.44

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
-- Table structure for table `bills`
--

DROP TABLE IF EXISTS `bills`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bills` (
  `bill_id` int NOT NULL AUTO_INCREMENT,
  `consumer_id` int DEFAULT NULL,
  `reading_id` int DEFAULT NULL,
  `bill_month` varchar(20) DEFAULT NULL,
  `units_consumed` int DEFAULT NULL,
  `rate_per_unit` float DEFAULT NULL,
  `total_amount` float DEFAULT NULL,
  `due_date` date DEFAULT NULL,
  `status` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`bill_id`),
  KEY `consumer_id` (`consumer_id`),
  KEY `reading_id` (`reading_id`),
  CONSTRAINT `bills_ibfk_1` FOREIGN KEY (`consumer_id`) REFERENCES `consumers` (`consumer_id`),
  CONSTRAINT `bills_ibfk_2` FOREIGN KEY (`reading_id`) REFERENCES `meter_readings` (`reading_id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bills`
--

LOCK TABLES `bills` WRITE;
/*!40000 ALTER TABLE `bills` DISABLE KEYS */;
INSERT INTO `bills` VALUES (1,1,1,'January',150,5,750,'2024-02-10','Paid'),(2,2,2,'January',180,5,900,'2024-02-10','Paid'),(3,3,3,'January',250,6,1500,'2024-02-10','Unpaid'),(4,4,4,'January',140,5,700,'2024-02-10','Paid'),(5,5,5,'January',300,6,1800,'2024-02-10','Unpaid'),(6,6,6,'January',150,5,750,'2024-02-10','Paid'),(7,7,7,'January',180,5,900,'2024-02-10','Paid'),(8,8,8,'January',250,6,1500,'2024-02-10','Unpaid'),(9,9,9,'January',140,5,700,'2024-02-10','Paid'),(10,10,10,'January',160,5,800,'2024-02-10','Paid'),(11,11,11,'January',330,6,1980,'2024-02-10','Unpaid'),(12,12,12,'January',150,5,750,'2024-02-10','Paid'),(13,13,13,'January',170,5,850,'2024-02-10','Paid'),(14,14,14,'January',350,6,2100,'2024-02-10','Unpaid'),(15,15,15,'January',140,5,700,'2024-02-10','Paid');
/*!40000 ALTER TABLE `bills` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `connection`
--

DROP TABLE IF EXISTS `connection`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `connection` (
  `connection_id` int NOT NULL AUTO_INCREMENT,
  `consumer_id` int DEFAULT NULL,
  `connection_type` varchar(50) DEFAULT NULL,
  `load_kw` float DEFAULT NULL,
  `status` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`connection_id`),
  KEY `consumer_id` (`consumer_id`),
  CONSTRAINT `connection_ibfk_1` FOREIGN KEY (`consumer_id`) REFERENCES `consumers` (`consumer_id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `connection`
--

LOCK TABLES `connection` WRITE;
/*!40000 ALTER TABLE `connection` DISABLE KEYS */;
INSERT INTO `connection` VALUES (1,1,'Domestic',2.5,'Active'),(2,2,'Domestic',3,'Active'),(3,3,'Commercial',5,'Active'),(4,4,'Domestic',2,'Active'),(5,5,'Commercial',6,'Active'),(6,6,'Domestic',2.5,'Active'),(7,7,'Domestic',3.5,'Active'),(8,8,'Commercial',4,'Active'),(9,9,'Domestic',2,'Active'),(10,10,'Domestic',3,'Active'),(11,11,'Commercial',5.5,'Active'),(12,12,'Domestic',2.5,'Active'),(13,13,'Domestic',3,'Active'),(14,14,'Commercial',6,'Active'),(15,15,'Domestic',2,'Active');
/*!40000 ALTER TABLE `connection` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `consumers`
--

DROP TABLE IF EXISTS `consumers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `consumers` (
  `consumer_id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `phone` varchar(15) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `connection_date` date DEFAULT NULL,
  PRIMARY KEY (`consumer_id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `consumers`
--

LOCK TABLES `consumers` WRITE;
/*!40000 ALTER TABLE `consumers` DISABLE KEYS */;
INSERT INTO `consumers` VALUES (1,'Amit Patil','Thane','9000000001','amit1@gmail.com','2023-01-01'),(2,'Sneha Joshi','Pune','9000000002','sneha2@gmail.com','2023-01-02'),(3,'Rahul Deshmukh','Mumbai','9000000003','rahul3@gmail.com','2023-01-03'),(4,'Pooja Kulkarni','Nashik','9000000004','pooja4@gmail.com','2023-01-04'),(5,'Rohit Jadhav','Nagpur','9000000005','rohit5@gmail.com','2023-01-05'),(6,'Neha Shinde','Kolhapur','9000000006','neha6@gmail.com','2023-01-06'),(7,'Ankit Verma','Thane','9000000007','ankit7@gmail.com','2023-01-07'),(8,'Kavita Patil','Pune','9000000008','kavita8@gmail.com','2023-01-08'),(9,'Saurabh Pawar','Mumbai','9000000009','saurabh9@gmail.com','2023-01-09'),(10,'Rina More','Satara','9000000010','rina10@gmail.com','2023-01-10'),(11,'Vikas Patil','Sangli','9000000011','vikas11@gmail.com','2023-01-11'),(12,'Komal Naik','Ratnagiri','9000000012','komal12@gmail.com','2023-01-12'),(13,'Yogesh Kulkarni','Solapur','9000000013','yogesh13@gmail.com','2023-01-13'),(14,'Prachi Sawant','Panvel','9000000014','prachi14@gmail.com','2023-01-14'),(15,'Aditya Mehta','Borivali','9000000015','aditya15@gmail.com','2023-01-15'),(16,'Amit Sharma','Thane, Maharashtra','9876543210','amit@gmail.com','2024-01-15');
/*!40000 ALTER TABLE `consumers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `meter`
--

DROP TABLE IF EXISTS `meter`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `meter` (
  `meter_id` int NOT NULL AUTO_INCREMENT,
  `connection_id` int DEFAULT NULL,
  `meter_number` varchar(50) DEFAULT NULL,
  `installation_date` date DEFAULT NULL,
  PRIMARY KEY (`meter_id`),
  KEY `connection_id` (`connection_id`),
  CONSTRAINT `meter_ibfk_1` FOREIGN KEY (`connection_id`) REFERENCES `connection` (`connection_id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `meter`
--

LOCK TABLES `meter` WRITE;
/*!40000 ALTER TABLE `meter` DISABLE KEYS */;
INSERT INTO `meter` VALUES (1,1,'MTR1001','2023-02-01'),(2,2,'MTR1002','2023-02-02'),(3,3,'MTR1003','2023-02-03'),(4,4,'MTR1004','2023-02-04'),(5,5,'MTR1005','2023-02-05'),(6,6,'MTR1006','2023-02-06'),(7,7,'MTR1007','2023-02-07'),(8,8,'MTR1008','2023-02-08'),(9,9,'MTR1009','2023-02-09'),(10,10,'MTR1010','2023-02-10'),(11,11,'MTR1011','2023-02-11'),(12,12,'MTR1012','2023-02-12'),(13,13,'MTR1013','2023-02-13'),(14,14,'MTR1014','2023-02-14'),(15,15,'MTR1015','2023-02-15');
/*!40000 ALTER TABLE `meter` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `meter_readings`
--

DROP TABLE IF EXISTS `meter_readings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `meter_readings` (
  `reading_id` int NOT NULL AUTO_INCREMENT,
  `meter_id` int DEFAULT NULL,
  `reading_date` date DEFAULT NULL,
  `previous_reading` int DEFAULT NULL,
  `current_reading` int DEFAULT NULL,
  `units_consumed` int DEFAULT NULL,
  PRIMARY KEY (`reading_id`),
  KEY `meter_id` (`meter_id`),
  CONSTRAINT `meter_readings_ibfk_1` FOREIGN KEY (`meter_id`) REFERENCES `meter` (`meter_id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `meter_readings`
--

LOCK TABLES `meter_readings` WRITE;
/*!40000 ALTER TABLE `meter_readings` DISABLE KEYS */;
INSERT INTO `meter_readings` VALUES (1,1,'2024-01-31',100,250,150),(2,2,'2024-01-31',200,380,180),(3,3,'2024-01-31',300,550,250),(4,4,'2024-01-31',150,290,140),(5,5,'2024-01-31',400,700,300),(6,6,'2024-01-31',180,330,150),(7,7,'2024-01-31',220,400,180),(8,8,'2024-01-31',350,600,250),(9,9,'2024-01-31',120,260,140),(10,10,'2024-01-31',200,360,160),(11,11,'2024-01-31',450,780,330),(12,12,'2024-01-31',170,320,150),(13,13,'2024-01-31',210,380,170),(14,14,'2024-01-31',500,850,350),(15,15,'2024-01-31',130,270,140);
/*!40000 ALTER TABLE `meter_readings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payments`
--

DROP TABLE IF EXISTS `payments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `payments` (
  `payment_id` int NOT NULL AUTO_INCREMENT,
  `bill_id` int DEFAULT NULL,
  `payment_date` date DEFAULT NULL,
  `amount_paid` float DEFAULT NULL,
  `payment_mode` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`payment_id`),
  KEY `bill_id` (`bill_id`),
  CONSTRAINT `payments_ibfk_1` FOREIGN KEY (`bill_id`) REFERENCES `bills` (`bill_id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payments`
--

LOCK TABLES `payments` WRITE;
/*!40000 ALTER TABLE `payments` DISABLE KEYS */;
INSERT INTO `payments` VALUES (1,1,'2024-02-05',750,'UPI'),(2,2,'2024-02-06',900,'Cash'),(3,3,'2024-02-07',0,'Pending'),(4,4,'2024-02-05',700,'Card'),(5,5,'2024-02-07',0,'Pending'),(6,6,'2024-02-06',750,'UPI'),(7,7,'2024-02-06',900,'Cash'),(8,8,'2024-02-07',0,'Pending'),(9,9,'2024-02-05',700,'UPI'),(10,10,'2024-02-06',800,'Card'),(11,11,'2024-02-07',0,'Pending'),(12,12,'2024-02-06',750,'UPI'),(13,13,'2024-02-06',850,'Cash'),(14,14,'2024-02-07',0,'Pending'),(15,15,'2024-02-05',700,'UPI');
/*!40000 ALTER TABLE `payments` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-03-02  8:20:29
