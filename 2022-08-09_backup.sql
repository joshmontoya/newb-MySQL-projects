-- MySQL dump 10.13  Distrib 8.0.29, for Win64 (x86_64)
--
-- Host: localhost    Database: joshco_db
-- ------------------------------------------------------
-- Server version	8.0.29

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
-- Table structure for table `customers`
--

DROP TABLE IF EXISTS `customers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customers` (
  `customer_id` int NOT NULL AUTO_INCREMENT,
  `last_name` varchar(50) NOT NULL,
  `first_name` varchar(50) NOT NULL,
  `address_line_1` varchar(100) NOT NULL,
  `address_line_2` varchar(50) DEFAULT NULL,
  `address_city` varchar(50) NOT NULL,
  `address_state` char(2) NOT NULL,
  `address_zip` char(5) NOT NULL,
  `phone` char(10) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`customer_id`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customers`
--

LOCK TABLES `customers` WRITE;
/*!40000 ALTER TABLE `customers` DISABLE KEYS */;
INSERT INTO `customers` VALUES (1,'Johnston','Tom','1234 Fake St.',NULL,'Phoenix','AZ','85142','4809999999','tom.johnston14@gmail.com'),(2,'Haverstein','Brenda','9897 Broadway Rd.','Apt. 143','Albuquerque','NM','87112','5056767766','brendazzo@yahoo.com'),(3,'Gupta','Abhinay','47 Blighton Way',NULL,'Pittsburgh','PA','15204','4122227777','ag042299@gmail.com'),(4,'Bower','Bob','9677 Cleopatra Ave.',NULL,'Chandler','AZ','85224','4802244454','bower.bob13@gmail.com'),(5,'Miller','Josh','43567 W Arizona Ave.',NULL,'Maricopa','AZ','85138','6023399989','jmiddorg67@outlook.com'),(6,'White','Jennifer','12 Mt Carmel Rd.',NULL,'Renton','WA','98055','4254234121','jen.green56@yahoo.com'),(7,'Blandford','Greg','47765 Avenida Norte Way','#6','Los Angeles','CA','90016','4243345555','gbland6654@gmail.com');
/*!40000 ALTER TABLE `customers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employees`
--

DROP TABLE IF EXISTS `employees`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `employees` (
  `employee_id` int NOT NULL AUTO_INCREMENT,
  `last_name` varchar(50) NOT NULL,
  `first_name` varchar(50) NOT NULL,
  `title` varchar(50) DEFAULT NULL,
  `phone` char(10) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `pay_band` int NOT NULL,
  PRIMARY KEY (`employee_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employees`
--

LOCK TABLES `employees` WRITE;
/*!40000 ALTER TABLE `employees` DISABLE KEYS */;
INSERT INTO `employees` VALUES (1,'Montoya','Josh','CEO','4802225555','josh.montoya@joshco.com',1),(2,'Reed','Jessika','COO','4808889999','jessika.reed@joshco.com',1),(3,'Hanks','Tom','CMO','2135556666','tom.hanks@joshco.com',1),(4,'Smith','Sue','Service Operations Manager','6023334444','sue.smith@joshco.com',3),(5,'Taylor','Blane','Service Analyst','8086676767','blane.taylor@joshco.com',5),(6,'Reyes','Lori','Service Analyst','9099990000','lori.reyes@joshco.com',5),(7,'Nguyen','Thomas','Service Analyst','8404555554','thomas.nguyen@joshco.com',5),(8,'Garcia','Juan','Service Analyst','6234454545','juan.garcia@joshco.com',5);
/*!40000 ALTER TABLE `employees` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `invoices`
--

DROP TABLE IF EXISTS `invoices`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `invoices` (
  `invoice_number` int NOT NULL AUTO_INCREMENT,
  `customer_id` int NOT NULL,
  `invoice_date` date NOT NULL,
  `invoice_due_date` date NOT NULL,
  `invoice_total_due` decimal(13,2) NOT NULL,
  `past_due_ind` char(1) DEFAULT NULL,
  `service_rep_id` int DEFAULT NULL,
  `invoice_curr_due` decimal(13,2) NOT NULL,
  `invoice_past_due_30` decimal(13,2) NOT NULL,
  `invoice_past_due_60` decimal(13,2) NOT NULL,
  `invoice_past_due_90` decimal(13,2) NOT NULL,
  PRIMARY KEY (`invoice_number`),
  KEY `fk_service_rep_id` (`service_rep_id`),
  CONSTRAINT `fk_service_rep_id` FOREIGN KEY (`service_rep_id`) REFERENCES `employees` (`employee_id`),
  CONSTRAINT `invoices_chk_1` CHECK (((`past_due_ind` = _utf8mb3'Y') or (`past_due_ind` = _utf8mb3'N')))
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `invoices`
--

LOCK TABLES `invoices` WRITE;
/*!40000 ALTER TABLE `invoices` DISABLE KEYS */;
INSERT INTO `invoices` VALUES (1,7,'2022-06-17','2022-07-12',134.57,'Y',5,69.80,64.77,0.00,0.00),(2,1,'2022-06-22','2022-07-17',199.86,'N',6,199.86,0.00,0.00,0.00),(3,2,'2022-06-29','2022-07-24',86.14,'N',6,86.14,0.00,0.00,0.00),(5,3,'2022-07-04','2022-07-30',322.15,'Y',7,95.99,112.64,113.52,0.00),(6,4,'2022-07-05','2022-07-31',542.09,'Y',5,155.13,198.82,188.14,0.00),(7,5,'2022-06-18','2022-07-13',101.19,'N',7,101.19,0.00,0.00,0.00),(8,6,'2022-06-22','2022-07-17',99.65,'N',NULL,99.65,0.00,0.00,0.00),(9,7,'2022-07-17','2022-08-12',67.32,'N',6,67.32,0.00,0.00,0.00),(10,3,'2022-08-04','2022-08-30',198.66,'N',6,198.66,0.00,0.00,0.00),(11,5,'2022-07-18','2022-08-13',203.66,'Y',7,102.47,101.19,0.00,0.00),(12,1,'2022-07-22','2022-08-17',171.31,'N',5,171.31,0.00,0.00,0.00),(13,4,'2022-08-05','2022-08-31',578.96,'Y',5,36.87,155.13,198.82,188.14),(14,2,'2022-07-29','2022-08-24',86.14,'N',7,86.14,0.00,0.00,0.00),(15,6,'2022-07-22','2022-08-17',117.19,'N',5,117.19,0.00,0.00,0.00),(16,1,'2022-08-22','2022-09-17',241.00,'Y',8,169.69,71.31,0.00,0.00),(18,3,'2022-09-04','2022-09-29',189.20,'N',5,189.20,0.00,0.00,0.00),(19,7,'2022-08-17','2022-09-12',139.70,'Y',6,72.38,67.32,0.00,0.00),(20,2,'2022-08-29','2022-09-24',178.26,'Y',5,92.12,86.14,0.00,0.00);
/*!40000 ALTER TABLE `invoices` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'joshco_db'
--

--
-- Dumping routines for database 'joshco_db'
--
/*!50003 DROP FUNCTION IF EXISTS `assign_svc_rep_id` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `assign_svc_rep_id`() RETURNS int
    READS SQL DATA
BEGIN
	DECLARE svc_rep_max, svc_rep_min INT;
    SELECT MAX(employee_id) INTO svc_rep_max FROM employees
		WHERE title = 'Service Analyst';
	SELECT MIN(employee_id) INTO svc_rep_min FROM employees
		WHERE title = 'Service Analyst';
    RETURN FLOOR(RAND() * (svc_rep_max - svc_rep_min + 1) + svc_rep_min);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `calc_due_date` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `calc_due_date`(inv_date DATE) RETURNS date
    NO SQL
BEGIN
	DECLARE inv_date_ahead, due_date DATE;
    SET inv_date_ahead = DATE_ADD(inv_date, INTERVAL 1 MONTH);
    SET due_date = DATE_ADD(inv_date_ahead, INTERVAL -5 DAY);
    RETURN due_date;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `get_emp_id` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `get_emp_id`(fn VARCHAR(50), ln VARCHAR(50)) RETURNS int
    READS SQL DATA
    DETERMINISTIC
BEGIN
	DECLARE emp_id_out INT;
    SELECT employee_id INTO emp_id_out FROM employees
    WHERE last_name = ln AND first_name = fn;
    
    RETURN(emp_id_out);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `get_next_inv_date` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `get_next_inv_date`(cust_id INT) RETURNS date
    READS SQL DATA
    DETERMINISTIC
BEGIN
	
    DECLARE next_inv_date DATE;
    SELECT DATE_ADD(MAX(invoice_date), INTERVAL 1 MONTH) FROM invoices 
		WHERE customer_id = cust_id INTO next_inv_date; 
    RETURN next_inv_date;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `emp_lookup` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `emp_lookup`(fn VARCHAR(50), ln VARCHAR(50))
BEGIN
	DECLARE emp_pay_description VARCHAR(1000);
    DECLARE pay_band_lookup INT;
    DECLARE emp_name VARCHAR (100);
    DECLARE title_lookup VARCHAR (50);
    
    SELECT pay_band INTO pay_band_lookup
    FROM employees
	WHERE first_name = fn AND last_name = ln;
	SELECT CONCAT(first_name, ' ', last_name) INTO emp_name
    FROM employees
	WHERE first_name = fn AND last_name = ln;
	SELECT title INTO title_lookup
    FROM employees
	WHERE first_name = fn AND last_name = ln;
    
    CASE
		WHEN pay_band_lookup = 1 OR pay_band_lookup = 2 THEN
			SET emp_pay_description = 'This employee is in the high pay band';
		WHEN pay_band_lookup BETWEEN 2 AND 4 THEN
			SET emp_pay_description = 'This employee is in the mid pay band'; 
		WHEN pay_band_lookup >= 5 THEN
			SET emp_pay_description = 'This employee is in the low pay band';
		ELSE
			SET emp_pay_description = 'Employee not found!';
	END CASE;
    SELECT emp_name, title_lookup, emp_pay_description;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `new_invoice` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `new_invoice`(
    c_id INT, inv_curr_due DECIMAL(13, 2),
    inv_pd_30 DECIMAL(13, 2), inv_pd_60 DECIMAL(13, 2), inv_pd_90 DECIMAL(13, 2)
    )
BEGIN
    DECLARE inv_date, inv_due_date DATE;
    DECLARE total_due DECIMAL (13, 2);
    DECLARE pd_ind CHAR(1);
    DECLARE svc_rep INT;

	IF inv_pd_30 > 0 THEN
		SET pd_ind = 'Y';
        SET total_due = inv_curr_due + inv_pd_30 + inv_pd_60 + inv_pd_90;
	ELSE
		SET pd_ind = 'N';
        SET total_due = inv_curr_due;
	END IF;
    
    SET svc_rep = assign_svc_rep_id();
    
    SET inv_date = get_next_inv_date(c_id);
    SET inv_due_date = calc_due_date(inv_date);
    
    INSERT invoices
		(
			customer_id, invoice_date, invoice_due_date, invoice_total_due, past_due_ind,
            service_rep_id, invoice_curr_due, invoice_past_due_30, invoice_past_due_60,
            invoice_past_due_90
		)
        
    VALUES
		(
			c_id, inv_date, inv_due_date, total_due, pd_ind, svc_rep, 
            inv_curr_due, inv_pd_30, inv_pd_60, inv_pd_90
		);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-08-09 15:45:02
