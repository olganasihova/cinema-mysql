-- MySQL dump 10.13  Distrib 8.0.46, for Win64 (x86_64)
--
-- Host: localhost    Database: cinema
-- ------------------------------------------------------
-- Server version	8.0.46

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
-- Table structure for table `bonus_cashback_rules`
--

DROP TABLE IF EXISTS `bonus_cashback_rules`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bonus_cashback_rules` (
  `id_bonus_cashback_rule` char(36) NOT NULL,
  `bonus_percent` int NOT NULL,
  `max_bonus_payment_percent` int NOT NULL,
  PRIMARY KEY (`id_bonus_cashback_rule`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bonus_cashback_rules`
--

LOCK TABLES `bonus_cashback_rules` WRITE;
/*!40000 ALTER TABLE `bonus_cashback_rules` DISABLE KEYS */;
INSERT INTO `bonus_cashback_rules` VALUES ('52b24563-c02f-11f1-a737-0045e2e7ab86',5,30);
/*!40000 ALTER TABLE `bonus_cashback_rules` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customers`
--

DROP TABLE IF EXISTS `customers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customers` (
  `id_customer` char(36) NOT NULL,
  `name` varchar(30) NOT NULL,
  `email` varchar(100) NOT NULL,
  `phone` varchar(10) NOT NULL,
  `bonus_cashback` int NOT NULL,
  PRIMARY KEY (`id_customer`),
  UNIQUE KEY `customers_email_unique` (`email`),
  UNIQUE KEY `customers_phone_unique` (`phone`),
  KEY `id_index` (`id_customer`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customers`
--

LOCK TABLES `customers` WRITE;
/*!40000 ALTER TABLE `customers` DISABLE KEYS */;
INSERT INTO `customers` VALUES ('123456789012345678901234567890123423','Anna','anna@mail.ru','9112223344',35),('123456789012345678901234567890123433','Masha','masha@mail.ru','9223334455',25),('123456789012345678901234567890123450','Bogdan','artem@mail.ru','9999999997',60),('123456789012345678901234567890123456','Olya','olya@mail.ru','9685115161',3),('123456789012345678901234567890123457','Vanya','vanya@mail.ru','9999999999',0);
/*!40000 ALTER TABLE `customers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `food_market`
--

DROP TABLE IF EXISTS `food_market`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `food_market` (
  `id_food_market` char(36) NOT NULL,
  `food_name` varchar(50) NOT NULL,
  `food_type` enum('popcorn','drink','snack') NOT NULL,
  `price` int NOT NULL,
  `stock` int NOT NULL,
  PRIMARY KEY (`id_food_market`),
  KEY `food_name_index` (`food_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `food_market`
--

LOCK TABLES `food_market` WRITE;
/*!40000 ALTER TABLE `food_market` DISABLE KEYS */;
INSERT INTO `food_market` VALUES ('4908c8f6-c03b-11f1-a737-0045e2e7ab86','Большой попкорн','popcorn',450,50),('4b3e28f5-c03b-11f1-a737-0045e2e7ab86','Маленький попкорн','popcorn',300,70),('4c32cbad-c03b-11f1-a737-0045e2e7ab86','Кола','drink',250,98),('4d321799-c03b-11f1-a737-0045e2e7ab86','Вода','drink',150,80),('4e3e69ff-c03b-11f1-a737-0045e2e7ab86','Начос','snack',350,40);
/*!40000 ALTER TABLE `food_market` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `food_orders`
--

DROP TABLE IF EXISTS `food_orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `food_orders` (
  `id_food_order` char(36) NOT NULL,
  `id_customer` char(36) NOT NULL,
  `order_date` datetime NOT NULL,
  `status` enum('created','paid','cancelled') NOT NULL,
  PRIMARY KEY (`id_food_order`),
  KEY `food_orders_id_customer_foreign` (`id_customer`),
  CONSTRAINT `food_orders_id_customer_foreign` FOREIGN KEY (`id_customer`) REFERENCES `customers` (`id_customer`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `food_orders`
--

LOCK TABLES `food_orders` WRITE;
/*!40000 ALTER TABLE `food_orders` DISABLE KEYS */;
INSERT INTO `food_orders` VALUES ('0262ce66-c18a-11f1-a737-0045e2e7ab86','123456789012345678901234567890123423','2026-10-06 16:29:51','created'),('23d2e1d4-c18a-11f1-a737-0045e2e7ab86','123456789012345678901234567890123433','2026-10-06 16:30:47','created'),('43d1cbef-c18a-11f1-a737-0045e2e7ab86','123456789012345678901234567890123456','2026-10-06 16:31:41','paid');
/*!40000 ALTER TABLE `food_orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `food_payments`
--

DROP TABLE IF EXISTS `food_payments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `food_payments` (
  `id_food_payment` char(36) NOT NULL,
  `id_food_order` char(36) NOT NULL,
  `id_bonus_cashback_rule` char(36) NOT NULL,
  `payment_amount` int NOT NULL,
  `payment_method` enum('card','cash') NOT NULL,
  `status` enum('paid','cancelled','refunded') NOT NULL,
  `date` datetime NOT NULL,
  `bonus_cashback_used` int NOT NULL,
  `bonus_cashback_earned` int NOT NULL,
  PRIMARY KEY (`id_food_payment`),
  KEY `food_payments_id_food_order_foreign` (`id_food_order`),
  KEY `food_payments_id_bonus_cashback_rule_foreign` (`id_bonus_cashback_rule`),
  CONSTRAINT `food_payments_id_bonus_cashback_rule_foreign` FOREIGN KEY (`id_bonus_cashback_rule`) REFERENCES `bonus_cashback_rules` (`id_bonus_cashback_rule`),
  CONSTRAINT `food_payments_id_food_order_foreign` FOREIGN KEY (`id_food_order`) REFERENCES `food_orders` (`id_food_order`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `food_payments`
--

LOCK TABLES `food_payments` WRITE;
/*!40000 ALTER TABLE `food_payments` DISABLE KEYS */;
INSERT INTO `food_payments` VALUES ('9b5460ba-c18f-11f1-a737-0045e2e7ab86','0262ce66-c18a-11f1-a737-0045e2e7ab86','52b24563-c02f-11f1-a737-0045e2e7ab86',900,'card','paid','2026-10-06 17:09:55',0,45),('d367422b-c18f-11f1-a737-0045e2e7ab86','23d2e1d4-c18a-11f1-a737-0045e2e7ab86','52b24563-c02f-11f1-a737-0045e2e7ab86',250,'cash','paid','2026-10-06 17:11:29',0,13),('ec7b9e4c-c18f-11f1-a737-0045e2e7ab86','43d1cbef-c18a-11f1-a737-0045e2e7ab86','52b24563-c02f-11f1-a737-0045e2e7ab86',1047,'card','paid','2026-10-06 17:12:11',3,52);
/*!40000 ALTER TABLE `food_payments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `halls`
--

DROP TABLE IF EXISTS `halls`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `halls` (
  `id_hall` char(36) NOT NULL,
  `capacity` int NOT NULL,
  `vip` tinyint(1) NOT NULL,
  `extra_pay` int NOT NULL,
  PRIMARY KEY (`id_hall`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `halls`
--

LOCK TABLES `halls` WRITE;
/*!40000 ALTER TABLE `halls` DISABLE KEYS */;
INSERT INTO `halls` VALUES ('a71a1ffe-c029-11f1-a737-0045e2e7ab86',100,0,0),('aa5c78fa-c029-11f1-a737-0045e2e7ab86',80,0,0),('acd9a234-c029-11f1-a737-0045e2e7ab86',50,1,200),('af856ea3-c029-11f1-a737-0045e2e7ab86',30,1,200);
/*!40000 ALTER TABLE `halls` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `movies`
--

DROP TABLE IF EXISTS `movies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `movies` (
  `id_movie` char(36) NOT NULL,
  `movie_name` varchar(50) NOT NULL,
  `genre` enum('comedy','drama','horror','thriller','action','animation') NOT NULL,
  `age_limit` enum('0+','6+','12+','16+','18+') NOT NULL,
  `duration` double NOT NULL,
  `rating` double NOT NULL,
  `cover` varchar(255) NOT NULL,
  PRIMARY KEY (`id_movie`),
  KEY `movie_name_index` (`movie_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `movies`
--

LOCK TABLES `movies` WRITE;
/*!40000 ALTER TABLE `movies` DISABLE KEYS */;
INSERT INTO `movies` VALUES ('2d91b659-c027-11f1-a737-0045e2e7ab86','Forrest Gump','drama','12+',142,8.8,'forrest_gump.jpg'),('319388e0-c027-11f1-a737-0045e2e7ab86','Shrek','animation','6+',90,7.9,'shrek.jpg'),('33d7081e-c027-11f1-a737-0045e2e7ab86','Deadpool','action','18+',108,8,'deadpool.jpg'),('36c6ee5e-c027-11f1-a737-0045e2e7ab86','The Mask','comedy','12+',101,6.9,'the_mask.jpg'),('ff2c128d-c026-11f1-a737-0045e2e7ab86','Inception','thriller','16+',148,8.8,'inception.jpg');
/*!40000 ALTER TABLE `movies` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders_composition`
--

DROP TABLE IF EXISTS `orders_composition`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orders_composition` (
  `id_order_composition` char(36) NOT NULL,
  `id_food_order` char(36) NOT NULL,
  `id_food_market` char(36) NOT NULL,
  `count_food` int NOT NULL,
  `total_price` int NOT NULL,
  PRIMARY KEY (`id_order_composition`),
  KEY `orders_composition_id_food_order_foreign` (`id_food_order`),
  KEY `fk_orders_composition_food_market` (`id_food_market`),
  CONSTRAINT `fk_orders_composition_food_market` FOREIGN KEY (`id_food_market`) REFERENCES `food_market` (`id_food_market`),
  CONSTRAINT `orders_composition_id_food_order_foreign` FOREIGN KEY (`id_food_order`) REFERENCES `food_orders` (`id_food_order`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders_composition`
--

LOCK TABLES `orders_composition` WRITE;
/*!40000 ALTER TABLE `orders_composition` DISABLE KEYS */;
INSERT INTO `orders_composition` VALUES ('5c819f9f-c18c-11f1-a737-0045e2e7ab86','43d1cbef-c18a-11f1-a737-0045e2e7ab86','4e3e69ff-c03b-11f1-a737-0045e2e7ab86',3,1050),('d69b69d4-c18b-11f1-a737-0045e2e7ab86','0262ce66-c18a-11f1-a737-0045e2e7ab86','4908c8f6-c03b-11f1-a737-0045e2e7ab86',2,900),('e2d3f898-c287-11f1-a737-0045e2e7ab86','0262ce66-c18a-11f1-a737-0045e2e7ab86','4c32cbad-c03b-11f1-a737-0045e2e7ab86',2,500),('f9738e29-c18b-11f1-a737-0045e2e7ab86','23d2e1d4-c18a-11f1-a737-0045e2e7ab86','4c32cbad-c03b-11f1-a737-0045e2e7ab86',1,250);
/*!40000 ALTER TABLE `orders_composition` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `check_food_stock` BEFORE INSERT ON `orders_composition` FOR EACH ROW begin
if new.count_food > (
select stock from food_market
where id_food_market = new.id_food_market )
then signal sqlstate '45000'
set message_text = 'Недостаточно товара';
end if;
end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `decrease_food_stock` AFTER INSERT ON `orders_composition` FOR EACH ROW begin
update food_market
set stock = stock - new.count_food
where id_food_market = new.id_food_market;
end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `payments`
--

DROP TABLE IF EXISTS `payments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `payments` (
  `id_payment` char(36) NOT NULL,
  `id_ticket` char(36) NOT NULL,
  `id_bonus_cashback_rule` char(36) NOT NULL,
  `payment_amount` int NOT NULL,
  `payment_method` enum('card','cash') NOT NULL,
  `status` enum('paid','cancelled','refunded') NOT NULL,
  `date` datetime NOT NULL,
  `bonus_cashback_used` int NOT NULL,
  `bonus_cashback_earned` int NOT NULL,
  PRIMARY KEY (`id_payment`),
  KEY `payments_id_ticket_foreign` (`id_ticket`),
  KEY `payments_id_bonus_cashback_rule_foreign` (`id_bonus_cashback_rule`),
  KEY `payment_status_index` (`status`),
  CONSTRAINT `payments_id_bonus_cashback_rule_foreign` FOREIGN KEY (`id_bonus_cashback_rule`) REFERENCES `bonus_cashback_rules` (`id_bonus_cashback_rule`),
  CONSTRAINT `payments_id_ticket_foreign` FOREIGN KEY (`id_ticket`) REFERENCES `tickets` (`id_ticket`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payments`
--

LOCK TABLES `payments` WRITE;
/*!40000 ALTER TABLE `payments` DISABLE KEYS */;
INSERT INTO `payments` VALUES ('0c150512-c188-11f1-a737-0045e2e7ab86','6bb274c8-c113-11f1-a737-0045e2e7ab86','52b24563-c02f-11f1-a737-0045e2e7ab86',380,'card','refunded','2026-10-06 16:15:48',20,19),('73373579-c187-11f1-a737-0045e2e7ab86','f4fb2227-c112-11f1-a737-0045e2e7ab86','52b24563-c02f-11f1-a737-0045e2e7ab86',500,'card','paid','2026-10-06 16:11:32',0,25),('a214f070-c188-11f1-a737-0045e2e7ab86','6eaeb394-c113-11f1-a737-0045e2e7ab86','52b24563-c02f-11f1-a737-0045e2e7ab86',1198,'cash','paid','2026-10-06 16:20:00',2,60);
/*!40000 ALTER TABLE `payments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reviews`
--

DROP TABLE IF EXISTS `reviews`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reviews` (
  `id_review` char(36) NOT NULL,
  `id_customer` char(36) NOT NULL,
  `id_movie` char(36) NOT NULL,
  `rating` int NOT NULL,
  `review_text` varchar(100) DEFAULT NULL,
  `review_date` date NOT NULL,
  PRIMARY KEY (`id_review`),
  KEY `fk_reviews_customer` (`id_customer`),
  KEY `fk_reviews_movie` (`id_movie`),
  CONSTRAINT `fk_reviews_customer` FOREIGN KEY (`id_customer`) REFERENCES `customers` (`id_customer`),
  CONSTRAINT `fk_reviews_movie` FOREIGN KEY (`id_movie`) REFERENCES `movies` (`id_movie`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reviews`
--

LOCK TABLES `reviews` WRITE;
/*!40000 ALTER TABLE `reviews` DISABLE KEYS */;
INSERT INTO `reviews` VALUES ('896beb38-c191-11f1-a737-0045e2e7ab86','123456789012345678901234567890123423','2d91b659-c027-11f1-a737-0045e2e7ab86',5,'Отличный фильм','2026-10-06'),('9c7e6c23-c191-11f1-a737-0045e2e7ab86','123456789012345678901234567890123433','319388e0-c027-11f1-a737-0045e2e7ab86',5,'Очень понравился','2026-10-06'),('ab8016b7-c191-11f1-a737-0045e2e7ab86','123456789012345678901234567890123456','33d7081e-c027-11f1-a737-0045e2e7ab86',4,'Хороший фильм','2026-10-06');
/*!40000 ALTER TABLE `reviews` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `check_rating` BEFORE INSERT ON `reviews` FOR EACH ROW begin 
case when new.rating < 1 then 
signal sqlstate '45000'
set message_text = 'Рейтинг не может быть меньше 1';
when new.rating > 5 then 
signal sqlstate '45000'
set message_text = 'Рейтинг не может быть больше 5';
else set new.rating = new.rating;
end case;
end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `seat_types`
--

DROP TABLE IF EXISTS `seat_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `seat_types` (
  `id_seat_type` char(36) NOT NULL,
  `seat_type` enum('economy','comfort','vip') NOT NULL,
  `extra_pay` int NOT NULL,
  PRIMARY KEY (`id_seat_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `seat_types`
--

LOCK TABLES `seat_types` WRITE;
/*!40000 ALTER TABLE `seat_types` DISABLE KEYS */;
INSERT INTO `seat_types` VALUES ('a7af3219-c02b-11f1-a737-0045e2e7ab86','economy',0),('aa76e29e-c02b-11f1-a737-0045e2e7ab86','comfort',150),('aefc4871-c02b-11f1-a737-0045e2e7ab86','vip',300);
/*!40000 ALTER TABLE `seat_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `seats`
--

DROP TABLE IF EXISTS `seats`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `seats` (
  `id_seat` char(36) NOT NULL,
  `id_seat_type` char(36) NOT NULL,
  `id_hall` char(36) NOT NULL,
  `id_seat_row` int NOT NULL,
  `id_seat_col` int NOT NULL,
  `is_taken` tinyint(1) NOT NULL,
  PRIMARY KEY (`id_seat`),
  KEY `seats_id_seat_type_foreign` (`id_seat_type`),
  KEY `seat_place_index` (`id_hall`,`id_seat_row`,`id_seat_col`),
  CONSTRAINT `seats_id_hall_foreign` FOREIGN KEY (`id_hall`) REFERENCES `halls` (`id_hall`),
  CONSTRAINT `seats_id_seat_type_foreign` FOREIGN KEY (`id_seat_type`) REFERENCES `seat_types` (`id_seat_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `seats`
--

LOCK TABLES `seats` WRITE;
/*!40000 ALTER TABLE `seats` DISABLE KEYS */;
INSERT INTO `seats` VALUES ('1930d283-c112-11f1-a737-0045e2e7ab86','a7af3219-c02b-11f1-a737-0045e2e7ab86','a71a1ffe-c029-11f1-a737-0045e2e7ab86',1,1,0),('1bd1bcae-c112-11f1-a737-0045e2e7ab86','a7af3219-c02b-11f1-a737-0045e2e7ab86','a71a1ffe-c029-11f1-a737-0045e2e7ab86',1,2,0),('1d3456ba-c112-11f1-a737-0045e2e7ab86','aa76e29e-c02b-11f1-a737-0045e2e7ab86','a71a1ffe-c029-11f1-a737-0045e2e7ab86',1,3,0),('1f52beeb-c112-11f1-a737-0045e2e7ab86','a7af3219-c02b-11f1-a737-0045e2e7ab86','aa5c78fa-c029-11f1-a737-0045e2e7ab86',1,1,0),('20eef340-c112-11f1-a737-0045e2e7ab86','a7af3219-c02b-11f1-a737-0045e2e7ab86','aa5c78fa-c029-11f1-a737-0045e2e7ab86',1,2,0),('22970cfe-c112-11f1-a737-0045e2e7ab86','aa76e29e-c02b-11f1-a737-0045e2e7ab86','aa5c78fa-c029-11f1-a737-0045e2e7ab86',1,3,0),('2511425a-c112-11f1-a737-0045e2e7ab86','aefc4871-c02b-11f1-a737-0045e2e7ab86','acd9a234-c029-11f1-a737-0045e2e7ab86',1,1,0),('265e17cf-c112-11f1-a737-0045e2e7ab86','aefc4871-c02b-11f1-a737-0045e2e7ab86','acd9a234-c029-11f1-a737-0045e2e7ab86',1,2,0),('27ebd272-c112-11f1-a737-0045e2e7ab86','aefc4871-c02b-11f1-a737-0045e2e7ab86','acd9a234-c029-11f1-a737-0045e2e7ab86',1,3,0),('296f27cb-c112-11f1-a737-0045e2e7ab86','aefc4871-c02b-11f1-a737-0045e2e7ab86','af856ea3-c029-11f1-a737-0045e2e7ab86',1,1,0),('2ad89f37-c112-11f1-a737-0045e2e7ab86','aefc4871-c02b-11f1-a737-0045e2e7ab86','af856ea3-c029-11f1-a737-0045e2e7ab86',1,2,0),('2c6398fa-c112-11f1-a737-0045e2e7ab86','aefc4871-c02b-11f1-a737-0045e2e7ab86','af856ea3-c029-11f1-a737-0045e2e7ab86',1,3,0);
/*!40000 ALTER TABLE `seats` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sessions`
--

DROP TABLE IF EXISTS `sessions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sessions` (
  `id_session` char(36) NOT NULL,
  `id_movie` char(36) NOT NULL,
  `id_hall` char(36) NOT NULL,
  `id_tariff` char(36) NOT NULL,
  `session_date` datetime NOT NULL,
  `base_price` int NOT NULL,
  PRIMARY KEY (`id_session`),
  KEY `sessions_id_movie_foreign` (`id_movie`),
  KEY `sessions_id_hall_foreign` (`id_hall`),
  KEY `sessions_id_tariff_foreign` (`id_tariff`),
  KEY `session_date_index` (`session_date`),
  CONSTRAINT `sessions_id_hall_foreign` FOREIGN KEY (`id_hall`) REFERENCES `halls` (`id_hall`),
  CONSTRAINT `sessions_id_movie_foreign` FOREIGN KEY (`id_movie`) REFERENCES `movies` (`id_movie`),
  CONSTRAINT `sessions_id_tariff_foreign` FOREIGN KEY (`id_tariff`) REFERENCES `tariffs` (`id_tariff`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sessions`
--

LOCK TABLES `sessions` WRITE;
/*!40000 ALTER TABLE `sessions` DISABLE KEYS */;
INSERT INTO `sessions` VALUES ('b7eb346d-c107-11f1-a737-0045e2e7ab86','2d91b659-c027-11f1-a737-0045e2e7ab86','a71a1ffe-c029-11f1-a737-0045e2e7ab86','5caece08-c02d-11f1-a737-0045e2e7ab86','2026-10-07 18:30:00',400),('ba6f716e-c107-11f1-a737-0045e2e7ab86','319388e0-c027-11f1-a737-0045e2e7ab86','aa5c78fa-c029-11f1-a737-0045e2e7ab86','5b94daaf-c02d-11f1-a737-0045e2e7ab86','2026-10-08 14:00:00',350),('bc933702-c107-11f1-a737-0045e2e7ab86','33d7081e-c027-11f1-a737-0045e2e7ab86','acd9a234-c029-11f1-a737-0045e2e7ab86','6081f805-c02d-11f1-a737-0045e2e7ab86','2026-10-10 20:00:00',500);
/*!40000 ALTER TABLE `sessions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tariffs`
--

DROP TABLE IF EXISTS `tariffs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tariffs` (
  `id_tariff` char(36) NOT NULL,
  `day_type` enum('weekday','weekend') NOT NULL,
  `time_period` enum('morning','afternoon','evening') NOT NULL,
  `extra_pay` int NOT NULL,
  PRIMARY KEY (`id_tariff`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tariffs`
--

LOCK TABLES `tariffs` WRITE;
/*!40000 ALTER TABLE `tariffs` DISABLE KEYS */;
INSERT INTO `tariffs` VALUES ('59bf59be-c02d-11f1-a737-0045e2e7ab86','weekday','morning',0),('5b94daaf-c02d-11f1-a737-0045e2e7ab86','weekday','afternoon',50),('5caece08-c02d-11f1-a737-0045e2e7ab86','weekday','evening',100),('5e18a052-c02d-11f1-a737-0045e2e7ab86','weekend','morning',100),('5f629381-c02d-11f1-a737-0045e2e7ab86','weekend','afternoon',150),('6081f805-c02d-11f1-a737-0045e2e7ab86','weekend','evening',200);
/*!40000 ALTER TABLE `tariffs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tickets`
--

DROP TABLE IF EXISTS `tickets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tickets` (
  `id_ticket` char(36) NOT NULL,
  `id_customer` char(36) NOT NULL,
  `id_session` char(36) NOT NULL,
  `id_seat` char(36) NOT NULL,
  `status` enum('booked','paid','cancelled') NOT NULL,
  `final_price` int NOT NULL,
  `ticket_type` enum('standard','child','student') DEFAULT NULL,
  PRIMARY KEY (`id_ticket`),
  KEY `tickets_id_sesssion_foreign` (`id_session`),
  KEY `tickets_id_customers_foreign` (`id_customer`),
  KEY `tickets_id_seat_foreign` (`id_seat`),
  CONSTRAINT `tickets_id_customers_foreign` FOREIGN KEY (`id_customer`) REFERENCES `customers` (`id_customer`),
  CONSTRAINT `tickets_id_seat_foreign` FOREIGN KEY (`id_seat`) REFERENCES `seats` (`id_seat`),
  CONSTRAINT `tickets_id_sesssion_foreign` FOREIGN KEY (`id_session`) REFERENCES `sessions` (`id_session`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tickets`
--

LOCK TABLES `tickets` WRITE;
/*!40000 ALTER TABLE `tickets` DISABLE KEYS */;
INSERT INTO `tickets` VALUES ('6bb274c8-c113-11f1-a737-0045e2e7ab86','123456789012345678901234567890123433','ba6f716e-c107-11f1-a737-0045e2e7ab86','1f52beeb-c112-11f1-a737-0045e2e7ab86','cancelled',400,'student'),('6eaeb394-c113-11f1-a737-0045e2e7ab86','123456789012345678901234567890123450','bc933702-c107-11f1-a737-0045e2e7ab86','2511425a-c112-11f1-a737-0045e2e7ab86','paid',1200,'child'),('93804845-c28c-11f1-a737-0045e2e7ab86','123456789012345678901234567890123456','b7eb346d-c107-11f1-a737-0045e2e7ab86','1930d283-c112-11f1-a737-0045e2e7ab86','cancelled',400,'standard'),('f4fb2227-c112-11f1-a737-0045e2e7ab86','123456789012345678901234567890123423','b7eb346d-c107-11f1-a737-0045e2e7ab86','1930d283-c112-11f1-a737-0045e2e7ab86','paid',500,'standard');
/*!40000 ALTER TABLE `tickets` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `take_seat_after_ticket` AFTER INSERT ON `tickets` FOR EACH ROW begin 
update seats 
set is_taken = 1
where id_seat = new.id_seat;
end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `free_seat_after_cancel` AFTER UPDATE ON `tickets` FOR EACH ROW begin
if new.status = 'cancelled' then 
update seats 
set is_taken = 0
where id_seat = new.id_seat;
end if;
end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Dumping events for database 'cinema'
--

--
-- Dumping routines for database 'cinema'
--
/*!50003 DROP FUNCTION IF EXISTS `add_bonus_rules` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `add_bonus_rules`(
bonus_percent int,
max_bonus_payment int
) RETURNS int
    MODIFIES SQL DATA
begin
declare res int;
insert into bonus_cashback_rules (id_bonus_cashback_rule, bonus_percent, max_bonus_payment_percent)
values (
uuid(),
bonus_percent,
max_bonus_payment
);
set res = 1;
return res;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `add_food_market` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `add_food_market`(
food_name varchar(50),
food_type VARCHAR(20),
price INT,
stock INT
) RETURNS int
    MODIFIES SQL DATA
begin
declare res int;
insert into food_market (id_food_market, food_name, food_type, price, stock)
values (
uuid(),
food_name,
food_type,
price,
stock 
);
set res = 1;
return res;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `add_food_order` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `add_food_order`(
    customer CHAR(36),
    order_status VARCHAR(20)
) RETURNS int
    MODIFIES SQL DATA
begin
declare res INT;
insert into food_orders ( id_food_order, id_customer, order_date, status )
values (
    uuid(),
    customer,
    NOW(),
    order_status
);
set res = 1;
return res;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `add_food_payment` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `add_food_payment`(
food_order char(36),
bonus_rule char(36),
bonus_used int,
payment_method varchar(20),
payment_status varchar(20)
) RETURNS int
    MODIFIES SQL DATA
begin
declare res int;
declare order_price int;
declare max_bonus_percent int;
declare bonus_percent int;
declare payment_sum int;
declare bonus_earned int;
declare customer_bonus int;
select sum(total_price) into order_price from orders_composition
where orders_composition.id_food_order = food_order;
select bonus_cashback_rules.bonus_percent, bonus_cashback_rules.max_bonus_payment_percent into bonus_percent, max_bonus_percent
from bonus_cashback_rules
where bonus_cashback_rules.id_bonus_cashback_rule = bonus_rule;
select customers.bonus_cashback into customer_bonus from food_orders
join customers on customers.id_customer = food_orders.id_customer
where food_orders.id_food_order = food_order;
set payment_sum = order_price - bonus_used;
set bonus_earned = payment_sum * bonus_percent / 100;
insert into food_payments ( id_food_payment, id_food_order, id_bonus_cashback_rule, payment_amount, payment_method, status, date, bonus_cashback_used, bonus_cashback_earned )
values (
    uuid(),
    food_order,
    bonus_rule,
    payment_sum,
    payment_method,
    payment_status,
    now(),
    bonus_used,
    bonus_earned );
    update customers 
    join food_orders on customers.bonus_cashback = food_orders.id_customer
    set customers.bonus_cashback = customers.bonus_cashback - bonus_used + bonus_earned
    where food_orders.id_food_order = food_order;
    set res = 1;
    return res;
    end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `add_hall` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `add_hall`(
    hall_capacity INT,
    hall_vip TINYINT,
    hall_extrapay INT
) RETURNS int
    MODIFIES SQL DATA
begin
declare res int;
insert into halls (id_hall, capacity, vip, extra_pay)
values (
uuid(),
hall_capacity,
hall_vip,
hall_extrapay
);
set res = 1;
return res;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `add_movie` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `add_movie`(
    p_movie_name VARCHAR(50),
    p_genre VARCHAR(30),
    p_age_limit VARCHAR(10),
    p_duration DOUBLE,
    p_rating DOUBLE,
    p_cover VARCHAR(255)
) RETURNS int
    MODIFIES SQL DATA
begin
declare res int;
insert into movies (id_movie, movie_name, genre, age_limit, duration, rating, cover)
    values (
        uuid(),
        p_movie_name,
        p_genre,
        p_age_limit,
        p_duration,
        p_rating,
        p_cover
    );

set res = 1;
return res;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `add_order_composition` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `add_order_composition`(
    food_order CHAR(36),
    food CHAR(36),
    food_count INT
) RETURNS int
    MODIFIES SQL DATA
begin
declare res int;
declare food_price int;
declare total int;
select price into food_price
from food_market
where food_market.id_food_market = food;
set total = food_price * food_count;
insert into orders_composition ( id_order_composition, id_food_order, id_food_market, count_food, total_price )
values (
   uuid(),
    food_order,
    food,
    food_count,
    total
);
set res = 1;
return res;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `add_payment` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `add_payment`(
    ticket CHAR(36),
    bonus_rule CHAR(36),
    bonus_used INT,
    payment_method VARCHAR(20),
    payment_status VARCHAR(20)
) RETURNS int
    MODIFIES SQL DATA
begin
declare res INT;
declare ticket_price INT;
declare max_bonus_percent INT;
declare bonus_percent INT;
declare payment_sum INT;
declare bonus_earned INT;
declare customer_bonus int;
select tickets.final_price into ticket_price 
from tickets 
where tickets.id_ticket = ticket;
select bonus_cashback_rules.bonus_percent, bonus_cashback_rules.max_bonus_payment_percent 
into bonus_percent, max_bonus_percent
from bonus_cashback_rules
where bonus_cashback_rules.id_bonus_cashback_rule = bonus_rule;
select customers.bonus_cashback into customer_bonus
from tickets
join customers on customers.id_customer = tickets.id_customer
where tickets.id_ticket = ticket;
set payment_sum = ticket_price - bonus_used;
set bonus_earned = payment_sum * bonus_percent / 100;
insert into payments ( id_payment, id_ticket, id_bonus_cashback_rule, payment_amount, payment_method, status, date, bonus_cashback_used, bonus_cashback_earned
)
values (
uuid(),
ticket,
bonus_rule,
payment_sum,
payment_method,
payment_status,
now(),
bonus_used,
bonus_earned );
update customers
join tickets on tickets.id_customer = customers.id_customer
set customers.bonus_cashback = customers.bonus_cashback - bonus_used + bonus_earned
where tickets.id_ticket = ticket;
set res = 1;
return res;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `add_review` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `add_review`(
    customer char(36),
    movie char(36),
    review_rating int,
    review_text varchar(100)
) RETURNS int
    MODIFIES SQL DATA
begin
declare res int;
insert into reviews ( id_review, id_customer, id_movie, rating, review_text, review_date )
values (
    uuid(),
    customer,
    movie,
    review_rating,
    review_text,
    curdate()
);
set res = 1;
return res;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `add_seats` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `add_seats`(
seat_type CHAR(36),
hall CHAR(36),
seat_row INT,
seat_col INT,
is_taken tinyint
) RETURNS int
    MODIFIES SQL DATA
begin
declare res int;
insert into seats (id_seat, id_seat_type, id_hall, id_seat_row, id_seat_col, is_taken)
values (
uuid(),
seat_type,
hall,
seat_row,
seat_col,
is_taken
);
set res = 1;
return res;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `add_seat_types` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `add_seat_types`(
seat_type VARCHAR(30),
seat_extrapay INT ) RETURNS int
    MODIFIES SQL DATA
begin
declare res int;
insert into seat_types (id_seat_type, seat_type, extra_pay)
values (
uuid(),
seat_type,
seat_extrapay
);
set res = 1;
return res;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `add_sessions` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `add_sessions`(
movie CHAR(36),
hall CHAR(36),
tariff CHAR(36),
session_date DATETIME,
base_price INT
) RETURNS int
    MODIFIES SQL DATA
begin
declare res int;
insert into sessions (id_session, id_movie, id_hall, id_tariff, session_date, base_price)
values (
uuid(),
movie,
hall,
tariff,
session_date,
base_price
);
set res = 1;
return res;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `add_tariffs` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `add_tariffs`(
tariff_day VARCHAR(20),
tariff_time VARCHAR(20),
tariff_extrapay int ) RETURNS int
    MODIFIES SQL DATA
begin
declare res int;
insert into tariffs (id_tariff, day_type, time_period, extra_pay)
values (
uuid(),
tariff_day,
tariff_time,
tariff_extrapay
);
set res = 1;
return res;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `add_ticket` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `add_ticket`(
    customer CHAR(36),
    session_id CHAR(36),
    seat CHAR(36),
    ticket_status VARCHAR(20),
    ticket_type VARCHAR(20)
) RETURNS int
    MODIFIES SQL DATA
begin
declare res int;
declare price int;
select 
sessions.base_price + tariffs.extra_pay + halls.extra_pay + seat_types.extra_pay
into price 
from sessions
join tariffs on sessions.id_tariff = tariffs.id_tariff
join halls on sessions.id_hall = halls.id_hall
join seats on seats.id_seat = seat
join seat_types on seats.id_seat_type = seat_types.id_seat_type
where sessions.id_session = session_id;
insert into tickets ( id_ticket, id_customer, id_session, id_seat, status, final_price, ticket_type)
values (
uuid(),
customer,
session_id,
seat,
ticket_status,
price,
ticket_type );
set res = 1;
return res;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `cash_summ` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `cash_summ`(
a int,
b int ) RETURNS int
    DETERMINISTIC
begin 
declare res int;
set res = a + b;
return res;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `cash_summ1` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `cash_summ1`(
a int,
b int ) RETURNS int
    DETERMINISTIC
begin 
declare res int;
set res = a + b;
return res;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `refund_ticket` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `refund_ticket`(IN p_ticket_id CHAR(36))
BEGIN
    DECLARE v_customer_id CHAR(36);
    DECLARE v_ticket_status VARCHAR(20);
    DECLARE v_payment_status VARCHAR(20);
    DECLARE v_payment_count INT;
    DECLARE v_bonus_used INT;
    DECLARE v_bonus_earned INT;
    DECLARE v_balance INT;

    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        ROLLBACK;
        RESIGNAL;
    END;

    START TRANSACTION;

    -- 1. Находим билет
    SELECT id_customer, status
    INTO v_customer_id, v_ticket_status
    FROM tickets
    WHERE id_ticket = p_ticket_id
    FOR UPDATE;

    -- 2. Считаем платежи
    SELECT COUNT(*)
    INTO v_payment_count
    FROM payments
    WHERE id_ticket = p_ticket_id;

    -- 3. Проверяем количество платежей
    CASE
        WHEN v_payment_count <> 1 THEN
            SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'Нужен ровно один платеж';
        ELSE
            SET v_payment_count = 1;
    END CASE;

    -- 4. Получаем информацию о платеже
    SELECT
        status,
        bonus_cashback_used,
        bonus_cashback_earned
    INTO
        v_payment_status,
        v_bonus_used,
        v_bonus_earned
    FROM payments
    WHERE id_ticket = p_ticket_id
    FOR UPDATE;

    -- 5. Проверяем можно ли оформить возврат
    CASE
        WHEN v_payment_status = 'paid'
         AND v_ticket_status IN ('paid', 'cancelled') THEN
            SET v_payment_status = 'paid';
        ELSE
            SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'Возврат невозможен';
    END CASE;

    -- 6. Получаем текущий бонусный баланс
    SELECT bonus_cashback
    INTO v_balance
    FROM customers
    WHERE id_customer = v_customer_id
    FOR UPDATE;

    -- 7. Проверяем бонусный баланс
    CASE
        WHEN v_balance + v_bonus_used - v_bonus_earned < 0 THEN
            SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'Недостаточно бонусов для отмены кешбэка';
        ELSE
            SET v_balance = v_balance + v_bonus_used - v_bonus_earned;
    END CASE;

    -- 8. Корректируем бонусы клиента
    UPDATE customers
    SET bonus_cashback = v_balance
    WHERE id_customer = v_customer_id;

    -- 9. Отменяем билет
    UPDATE tickets
    SET status = 'cancelled'
    WHERE id_ticket = p_ticket_id;

    -- 10. Отмечаем учебный возврат платежа
    UPDATE payments
    SET status = 'refunded'
    WHERE id_ticket = p_ticket_id
      AND status = 'paid';

    -- 11. Сохраняем изменения
    COMMIT;

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

-- Dump completed on 2026-10-30 21:07:54
