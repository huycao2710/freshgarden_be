-- MySQL dump 10.13  Distrib 8.0.36, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: freshgarden_be
-- ------------------------------------------------------
-- Server version	8.4.0

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
-- Table structure for table `address`
--

DROP TABLE IF EXISTS `address`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `address` (
  `id` bigint NOT NULL,
  `city` varchar(255) DEFAULT NULL,
  `full_name` varchar(255) DEFAULT NULL,
  `phone_number` varchar(255) DEFAULT NULL,
  `state` varchar(255) DEFAULT NULL,
  `street_address` varchar(255) DEFAULT NULL,
  `zip_code` varchar(255) DEFAULT NULL,
  `user_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKda8tuywtf0gb6sedwk7la1pgi` (`user_id`),
  CONSTRAINT `FKda8tuywtf0gb6sedwk7la1pgi` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `address`
--

LOCK TABLES `address` WRITE;
/*!40000 ALTER TABLE `address` DISABLE KEYS */;
INSERT INTO `address` VALUES (1,'Thanh Xuân','Phạm Trần Công Hoàng','84862-969-049','Hà Nội','194 Giải Phóng','100000',102),(2,'Thanh Xuân','Phạm Trần Công Hoàng','84862-969-049','Hà Nội','194 Giải Phóng','100000',102),(52,'Thanh Xuân','Phạm Trần Công Hoàng','84862-969-049','Hà Nội','194 Giải Phóng','100000',102),(102,'Thanh Xuân','Phạm Trần Công Hoàng','84862-969-049','Hà Nội','194 Giải Phóng','100000',102),(152,'Thanh Xuân','Phạm Trần Công Hoàng','84862-969-049','Hà Nội','Giải Phóng','100000',152);
/*!40000 ALTER TABLE `address` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `address_seq`
--

DROP TABLE IF EXISTS `address_seq`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `address_seq` (
  `next_val` bigint DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `address_seq`
--

LOCK TABLES `address_seq` WRITE;
/*!40000 ALTER TABLE `address_seq` DISABLE KEYS */;
INSERT INTO `address_seq` VALUES (251);
/*!40000 ALTER TABLE `address_seq` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cart`
--

DROP TABLE IF EXISTS `cart`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cart` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `discounted` double NOT NULL,
  `total_discounted_price` double NOT NULL,
  `total_item` int DEFAULT NULL,
  `total_price` double DEFAULT NULL,
  `user_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_9emlp6m95v5er2bcqkjsw48he` (`user_id`),
  CONSTRAINT `FKl70asp4l4w0jmbm1tqyofho4o` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cart`
--

LOCK TABLES `cart` WRITE;
/*!40000 ALTER TABLE `cart` DISABLE KEYS */;
INSERT INTO `cart` VALUES (1,0,320000,1,320000,102),(2,0,320000,1,320000,152);
/*!40000 ALTER TABLE `cart` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cart_item`
--

DROP TABLE IF EXISTS `cart_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cart_item` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `count_in_stock` int NOT NULL,
  `discounted_price` double NOT NULL,
  `price` double NOT NULL,
  `size` varchar(255) DEFAULT NULL,
  `user_id` bigint DEFAULT NULL,
  `cart_id` bigint DEFAULT NULL,
  `product_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK1uobyhgl1wvgt1jpccia8xxs3` (`cart_id`),
  KEY `FKjcyd5wv4igqnw413rgxbfu4nv` (`product_id`),
  CONSTRAINT `FK1uobyhgl1wvgt1jpccia8xxs3` FOREIGN KEY (`cart_id`) REFERENCES `cart` (`id`),
  CONSTRAINT `FKjcyd5wv4igqnw413rgxbfu4nv` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cart_item`
--

LOCK TABLES `cart_item` WRITE;
/*!40000 ALTER TABLE `cart_item` DISABLE KEYS */;
INSERT INTO `cart_item` VALUES (2,1,320000,320000,'size 6 - 16cm',102,1,1),(3,1,320000,320000,'size 6 - 16cm',1,NULL,1),(4,1,320000,320000,'size 6 - 16cm',1,NULL,1),(5,1,320000,320000,'size 6 - 16cm',1,NULL,1),(6,1,320000,320000,'size 6 - 16cm',1,NULL,2),(7,1,320000,320000,'size 6 - 16cm',1,NULL,52),(8,1,320000,320000,'size 6 - 16cm',1,NULL,52),(9,1,320000,320000,'size 6 - 16cm',1,NULL,52),(10,1,320000,320000,'size 6 - 16cm',1,NULL,52),(11,1,320000,320000,'size 6 - 16cm',1,NULL,52),(12,1,320000,320000,NULL,152,2,52);
/*!40000 ALTER TABLE `cart_item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `category`
--

DROP TABLE IF EXISTS `category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `category` (
  `id` bigint NOT NULL,
  `level` int NOT NULL,
  `name` varchar(50) NOT NULL,
  `parent_category_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKs2ride9gvilxy2tcuv7witnxc` (`parent_category_id`),
  CONSTRAINT `FKs2ride9gvilxy2tcuv7witnxc` FOREIGN KEY (`parent_category_id`) REFERENCES `category` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category`
--

LOCK TABLES `category` WRITE;
/*!40000 ALTER TABLE `category` DISABLE KEYS */;
INSERT INTO `category` VALUES (1,1,'Bánh ngọt',NULL),(2,2,'Bánh kem',1),(3,3,'Bánh sinh nhật',2),(4,2,'Bánh bông lan',1),(5,2,'Bánh Chiffon',1),(6,2,'Bánh cuộn',1),(7,2,'Bánh su kem',1),(8,1,'Bánh tráng miệng',NULL),(9,2,'Bánh miếng',8),(10,2,'Bánh mouse',8),(11,2,'Bánh tiramisu',8),(12,2,'Caramel',8),(13,2,'Sữa chua',8),(14,2,'Panna cotta',8),(15,1,'Bánh mì',NULL),(16,2,'Bánh mì kẹp',15),(17,2,'Bánh cán lớp',15),(18,2,'Bánh mì gối',15),(19,2,'Bánh mì baguette',15),(20,2,'Bánh mì mặn',15),(21,2,'Bánh mì ngọt',15),(22,1,'Bánh khô',NULL),(23,2,'Bánh quy',22),(24,2,'Bánh mì nướng',22),(25,2,'Bánh sừng bò mini',22),(26,2,'Bánh Macaron',22),(27,1,'Bánh đông lạnh',NULL),(28,2,'Bánh bao',27),(29,2,'Bánh pizza',27),(30,2,'Bánh Tarte Táo',27),(31,2,'Bánh sừng bò',27),(32,1,'Đồ uống',NULL),(33,1,'Macchi by Fresh Garden',NULL),(34,2,'Bánh Cracker',33),(35,2,'Bánh mì nướng Macchi',33),(36,2,'Bánh Cookies Macchi',33),(37,2,'Bánh Nougat',33);
/*!40000 ALTER TABLE `category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order`
--

DROP TABLE IF EXISTS `order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order` (
  `id` bigint NOT NULL,
  `created_at` datetime(6) DEFAULT NULL,
  `delivery_date` datetime(6) DEFAULT NULL,
  `discounted` double NOT NULL,
  `order_date` datetime(6) DEFAULT NULL,
  `order_id` varchar(255) DEFAULT NULL,
  `order_status` varchar(255) DEFAULT NULL,
  `payment_id` varchar(255) DEFAULT NULL,
  `payment_method` varchar(255) DEFAULT NULL,
  `payment_status` varchar(255) DEFAULT NULL,
  `paypal_payment_id` varchar(255) DEFAULT NULL,
  `paypal_payment_link_id` varchar(255) DEFAULT NULL,
  `paypal_payment_link_reference_id` varchar(255) DEFAULT NULL,
  `paypal_payment_link_status` varchar(255) DEFAULT NULL,
  `total_discounted_price` double NOT NULL,
  `total_item` int NOT NULL,
  `total_price` double NOT NULL,
  `shipping_address_id` bigint DEFAULT NULL,
  `user_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_1stm9mhmocpbggtn5ou43i7vr` (`shipping_address_id`),
  KEY `FKcpl0mjoeqhxvgeeeq5piwpd3i` (`user_id`),
  CONSTRAINT `FK5w1hq48lwcqxmh1bvkdcpr4yh` FOREIGN KEY (`shipping_address_id`) REFERENCES `address` (`id`),
  CONSTRAINT `FKcpl0mjoeqhxvgeeeq5piwpd3i` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order`
--

LOCK TABLES `order` WRITE;
/*!40000 ALTER TABLE `order` DISABLE KEYS */;
INSERT INTO `order` VALUES (102,'2024-05-18 20:48:49.767353',NULL,0,'2024-05-18 20:48:49.767353',NULL,'Đang chờ xử lý',NULL,NULL,'Đang chờ thanh toán',NULL,NULL,NULL,NULL,320000,1,320000,102,102),(152,'2024-05-18 21:18:51.554862',NULL,0,'2024-05-18 21:18:51.554862',NULL,'Đang chờ xử lý',NULL,NULL,'Đang chờ thanh toán',NULL,NULL,NULL,NULL,320000,1,320000,152,152);
/*!40000 ALTER TABLE `order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_item`
--

DROP TABLE IF EXISTS `order_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_item` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `count_in_stock` int NOT NULL,
  `delivery_date` datetime(6) DEFAULT NULL,
  `discounted_price` double NOT NULL,
  `price` double NOT NULL,
  `size` varchar(255) DEFAULT NULL,
  `user_id` bigint DEFAULT NULL,
  `order_id` bigint DEFAULT NULL,
  `product_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK551losx9j75ss5d6bfsqvijna` (`product_id`),
  KEY `FKsgmrolp8skulmo2vyb20c4mfk` (`order_id`),
  CONSTRAINT `FK551losx9j75ss5d6bfsqvijna` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`),
  CONSTRAINT `FKsgmrolp8skulmo2vyb20c4mfk` FOREIGN KEY (`order_id`) REFERENCES `order` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_item`
--

LOCK TABLES `order_item` WRITE;
/*!40000 ALTER TABLE `order_item` DISABLE KEYS */;
INSERT INTO `order_item` VALUES (1,1,NULL,320000,320000,'size 6 - 16cm',102,NULL,1),(2,1,NULL,320000,320000,'size 6 - 16cm',102,NULL,1),(3,1,NULL,320000,320000,'size 6 - 16cm',102,NULL,1),(4,1,NULL,320000,320000,'size 6 - 16cm',102,102,1),(5,1,NULL,320000,320000,NULL,152,152,52);
/*!40000 ALTER TABLE `order_item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_seq`
--

DROP TABLE IF EXISTS `order_seq`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_seq` (
  `next_val` bigint DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_seq`
--

LOCK TABLES `order_seq` WRITE;
/*!40000 ALTER TABLE `order_seq` DISABLE KEYS */;
INSERT INTO `order_seq` VALUES (251);
/*!40000 ALTER TABLE `order_seq` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payment_information`
--

DROP TABLE IF EXISTS `payment_information`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `payment_information` (
  `user_id` bigint NOT NULL,
  `card_number` varchar(255) DEFAULT NULL,
  `cardholder_name` varchar(255) DEFAULT NULL,
  `cvv` varchar(255) DEFAULT NULL,
  `expiration_date` date DEFAULT NULL,
  KEY `FKcb0vkk9ey9j41no8yn0p60j95` (`user_id`),
  CONSTRAINT `FKcb0vkk9ey9j41no8yn0p60j95` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payment_information`
--

LOCK TABLES `payment_information` WRITE;
/*!40000 ALTER TABLE `payment_information` DISABLE KEYS */;
/*!40000 ALTER TABLE `payment_information` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product` (
  `id` bigint NOT NULL,
  `count_in_stock` double DEFAULT NULL,
  `created_at` datetime(6) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `discount_persent` double DEFAULT NULL,
  `discounted_price` double DEFAULT NULL,
  `image_url` varchar(255) DEFAULT NULL,
  `name_product` varchar(255) DEFAULT NULL,
  `num_ratings` int DEFAULT NULL,
  `price` double NOT NULL,
  `category_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK1mtsbur82frn64de7balymq9s` (`category_id`),
  CONSTRAINT `FK1mtsbur82frn64de7balymq9s` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product`
--

LOCK TABLES `product` WRITE;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
INSERT INTO `product` VALUES (1,15,'2024-05-18 16:33:19.930159','Bánh kem tươi cốt bánh 5 lớp chiffon hoa quả khô hỗn hợp, nhân kem tươi, trang trí hoa kem tươi. ',0,320000,'https://product.hstatic.net/200000411281/product/13-02_77c7c970cfcd4043bd4a5b451adea3bb_master.png','Bánh kem A',0,320000,3),(2,15,'2024-05-18 16:45:11.315980','Bánh kem tươi cốt bánh 5 lớp chiffon hoa quả khô hỗn hợp, nhân kem tươi, trang trí hoa kem tươi. ',0,320000,'https://product.hstatic.net/200000411281/product/13-02_77c7c970cfcd4043bd4a5b451adea3bb_master.png','Bánh kem B',0,320000,3),(52,15,'2024-05-18 21:07:21.626998','Bánh kem tươi cốt bánh 5 lớp chiffon hoa quả khô hỗn hợp, nhân kem tươi, trang trí hoa kem tươi. ',0,320000,'https://product.hstatic.net/200000411281/product/13-02_77c7c970cfcd4043bd4a5b451adea3bb_master.png',NULL,0,320000,3);
/*!40000 ALTER TABLE `product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_seq`
--

DROP TABLE IF EXISTS `product_seq`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_seq` (
  `next_val` bigint DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_seq`
--

LOCK TABLES `product_seq` WRITE;
/*!40000 ALTER TABLE `product_seq` DISABLE KEYS */;
INSERT INTO `product_seq` VALUES (151);
/*!40000 ALTER TABLE `product_seq` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_sizes`
--

DROP TABLE IF EXISTS `product_sizes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_sizes` (
  `product_id` bigint NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `quantity` int DEFAULT NULL,
  KEY `FK4w69qsh5hd062xv3hqkpgpdpu` (`product_id`),
  CONSTRAINT `FK4w69qsh5hd062xv3hqkpgpdpu` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_sizes`
--

LOCK TABLES `product_sizes` WRITE;
/*!40000 ALTER TABLE `product_sizes` DISABLE KEYS */;
INSERT INTO `product_sizes` VALUES (2,'size 6 - 16cm',5),(2,'size 8 - 21cm',10),(52,'size 6 - 16cm',5),(52,'size 8 - 21cm',10);
/*!40000 ALTER TABLE `product_sizes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rating`
--

DROP TABLE IF EXISTS `rating`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `rating` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `created_at` datetime(6) DEFAULT NULL,
  `rating` double DEFAULT NULL,
  `product_id` bigint NOT NULL,
  `user_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FKlkuwie0au2dru36asng9nywmh` (`product_id`),
  KEY `FKpn05vbx6usw0c65tcyuce4dw5` (`user_id`),
  CONSTRAINT `FKlkuwie0au2dru36asng9nywmh` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`),
  CONSTRAINT `FKpn05vbx6usw0c65tcyuce4dw5` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rating`
--

LOCK TABLES `rating` WRITE;
/*!40000 ALTER TABLE `rating` DISABLE KEYS */;
/*!40000 ALTER TABLE `rating` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `review`
--

DROP TABLE IF EXISTS `review`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `review` (
  `id` bigint NOT NULL,
  `create_at` datetime(6) DEFAULT NULL,
  `review` varchar(255) DEFAULT NULL,
  `product_id` bigint DEFAULT NULL,
  `user_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKiyof1sindb9qiqr9o8npj8klt` (`product_id`),
  KEY `FKiyf57dy48lyiftdrf7y87rnxi` (`user_id`),
  CONSTRAINT `FKiyf57dy48lyiftdrf7y87rnxi` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`),
  CONSTRAINT `FKiyof1sindb9qiqr9o8npj8klt` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `review`
--

LOCK TABLES `review` WRITE;
/*!40000 ALTER TABLE `review` DISABLE KEYS */;
/*!40000 ALTER TABLE `review` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `review_seq`
--

DROP TABLE IF EXISTS `review_seq`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `review_seq` (
  `next_val` bigint DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `review_seq`
--

LOCK TABLES `review_seq` WRITE;
/*!40000 ALTER TABLE `review_seq` DISABLE KEYS */;
INSERT INTO `review_seq` VALUES (1);
/*!40000 ALTER TABLE `review_seq` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `id` bigint NOT NULL,
  `created_at` datetime(6) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `full_name` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `phone_number` varchar(255) DEFAULT NULL,
  `role` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,NULL,'caovanhuy2710@gmail.com','Cao Văn Huy','$2a$10$Ncpcex.d6CBr.YgwLeSV1ejYomeLslhThDrwSnPmUTFuJcw7Iq0PO',NULL,NULL),(2,NULL,'danhproanchao@gmail.com','Phạm Thế Anh','$2a$10$MENhH0nDakE3WrV/iW4mf.xTIgBYWihuLs.AHV8nbr9OCCS4sPIPK',NULL,NULL),(52,NULL,'huygaoilaga@gmail.com','Phạm Trần Công Hoàng','$2a$10$DoIrkmVpoTf0h6ti9O5Hmea1F/6QsOF5EKXA5038sapjjwmIA/DNa',NULL,NULL),(102,NULL,'huygaoilaga1gmail.com','Phạm Trần Công Hoàng','$2a$10$98m5eviFqQDCoBE0St5wleY6znXqzB8U90rnoXFMDPHHvOz5zktJ2',NULL,NULL),(152,NULL,'huygaoilaga2gmail.com','Phạm Trần Công Hoàng','$2a$10$42S1EuDvNxOo3rfYnyA0s.DGlv.d.IcSSL0RwLJMhGbYp1TMIEvDu',NULL,NULL);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_seq`
--

DROP TABLE IF EXISTS `user_seq`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_seq` (
  `next_val` bigint DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_seq`
--

LOCK TABLES `user_seq` WRITE;
/*!40000 ALTER TABLE `user_seq` DISABLE KEYS */;
INSERT INTO `user_seq` VALUES (251);
/*!40000 ALTER TABLE `user_seq` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'freshgarden_be'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-05-18 21:29:19
