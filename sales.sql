-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               10.6.7-MariaDB - mariadb.org binary distribution
-- Server OS:                    Win64
-- HeidiSQL Version:             11.3.0.6414
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Dumping database structure for sales
CREATE DATABASE IF NOT EXISTS `sales` ;
USE `sales`;

-- Dumping structure for table sales.customers
CREATE TABLE IF NOT EXISTS `customers` (
  `customer_id` int(11) NOT NULL,
  `cust_name` varchar(20) NOT NULL,
  `city` varchar(20) NOT NULL,
  `grade` varchar(4) NOT NULL,
  `salesman_id` int(11) NOT NULL,
  PRIMARY KEY (`customer_id`),
  KEY `FK_customers_salesmen` (`salesman_id`),
  CONSTRAINT `FK_customers_salesmen` FOREIGN KEY (`salesman_id`) REFERENCES `salesmen` (`salesman_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Dumping data for table sales.customers: ~8 rows (approximately)
INSERT INTO `customers` (`customer_id`, `cust_name`, `city`, `grade`, `salesman_id`) VALUES
	(3001, 'Brad Guzan', 'London', '', 5005),
	(3002, 'Nick Rimando', 'New York', '100', 5001),
	(3003, 'Jozy Altidor', 'Moscow', '200', 5007),
	(3004, 'Fabian Johnson', 'Paris', '300', 5006),
	(3005, 'Graham Zusi', 'California', '200', 5002),
	(3007, 'Brad Davis', 'New York', '200', 5001),
	(3008, 'Julian Green', 'London', '300', 5002),
	(3009, 'Geoff Cameron', 'Berlin', '100', 5003);

-- Dumping structure for table sales.orderdetails
CREATE TABLE IF NOT EXISTS `orderdetails` (
  `order_no` int(11) NOT NULL,
  `prod_id` int(11) NOT NULL,
  `quantity` tinyint(4) DEFAULT NULL,
  KEY `FK_orddetails_products` (`prod_id`) USING BTREE,
  KEY `ord_no` (`order_no`) USING BTREE,
  CONSTRAINT `FK_orddetails_products` FOREIGN KEY (`prod_id`) REFERENCES `products` (`prod_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_orderdetails_order` FOREIGN KEY (`order_no`) REFERENCES `orders` (`order_no`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Dumping data for table sales.orderdetails: ~165 rows (approximately)
INSERT INTO `orderdetails` (`order_no`, `prod_id`, `quantity`) VALUES
	(70001, 101, 5),
	(70001, 102, 6),
	(70001, 103, 7),
	(70001, 104, 8),
	(70001, 105, 9),
	(70001, 106, 10),
	(70001, 107, 11),
	(70001, 108, 12),
	(70001, 109, 13),
	(70001, 110, 14),
	(70002, 101, 4),
	(70002, 102, 5),
	(70002, 103, 6),
	(70002, 104, 7),
	(70002, 105, 8),
	(70002, 106, 9),
	(70002, 107, 10),
	(70002, 108, 11),
	(70002, 109, 12),
	(70002, 110, 13),
	(70003, 101, 3),
	(70003, 102, 4),
	(70003, 103, 5),
	(70003, 104, 6),
	(70003, 105, 7),
	(70003, 106, 8),
	(70003, 107, 9),
	(70003, 108, 10),
	(70003, 109, 11),
	(70003, 110, 12),
	(70004, 101, 2),
	(70004, 102, 3),
	(70004, 103, 4),
	(70004, 104, 5),
	(70004, 105, 6),
	(70004, 106, 7),
	(70004, 107, 8),
	(70004, 108, 9),
	(70004, 109, 10),
	(70004, 110, 11),
	(70005, 101, 1),
	(70005, 102, 2),
	(70005, 103, 3),
	(70005, 104, 4),
	(70005, 105, 5),
	(70005, 106, 6),
	(70005, 107, 7),
	(70005, 108, 8),
	(70005, 109, 9),
	(70005, 110, 10),
	(70007, 101, 7),
	(70007, 102, 8),
	(70007, 103, 1),
	(70007, 104, 2),
	(70007, 105, 3),
	(70007, 106, 4),
	(70007, 107, 5),
	(70007, 108, 6),
	(70007, 109, 7),
	(70007, 110, 8),
	(70008, 101, 2),
	(70008, 102, 5),
	(70008, 103, 4),
	(70008, 104, 1),
	(70008, 105, 2),
	(70008, 106, 3),
	(70008, 107, 4),
	(70008, 108, 5),
	(70008, 109, 6),
	(70008, 110, 7),
	(70009, 101, 5),
	(70009, 102, 6),
	(70009, 103, 7),
	(70009, 104, 8),
	(70009, 105, 1),
	(70009, 106, 2),
	(70009, 107, 3),
	(70009, 108, 4),
	(70009, 109, 5),
	(70009, 110, 6),
	(70010, 101, 4),
	(70010, 102, 5),
	(70010, 103, 6),
	(70010, 104, 7),
	(70010, 105, 8),
	(70010, 106, 1),
	(70010, 107, 2),
	(70010, 108, 3),
	(70010, 109, 4),
	(70010, 110, 5),
	(70011, 101, 3),
	(70011, 102, 4),
	(70011, 103, 5),
	(70011, 104, 6),
	(70011, 105, 7),
	(70011, 106, 8),
	(70011, 107, 1),
	(70011, 108, 2),
	(70011, 109, 3),
	(70011, 110, 4),
	(70012, 101, 2),
	(70012, 102, 3),
	(70012, 103, 4),
	(70012, 104, 5),
	(70012, 105, 6),
	(70012, 106, 7),
	(70012, 107, 8),
	(70012, 108, 1),
	(70012, 109, 2),
	(70012, 110, 3),
	(70013, 101, 1),
	(70013, 102, 2),
	(70013, 103, 3),
	(70013, 104, 4),
	(70013, 105, 5),
	(70013, 106, 6),
	(70013, 107, 7),
	(70013, 108, 8),
	(70013, 109, 1),
	(70013, 110, 2);

-- Dumping structure for table sales.orders
CREATE TABLE IF NOT EXISTS `orders` (
  `order_no` int(11) NOT NULL,
  `order_date` date NOT NULL,
  `customer_id` int(11) NOT NULL,
  `salesman_id` int(11) NOT NULL,
  PRIMARY KEY (`order_no`) USING BTREE,
  KEY `FK_ord_customers` (`customer_id`),
  KEY `FK_ord_salesmen` (`salesman_id`),
  CONSTRAINT `FK_ord_customers` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`customer_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_ord_salesmen` FOREIGN KEY (`salesman_id`) REFERENCES `salesmen` (`salesman_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Dumping data for table sales.orders: ~11 rows (approximately)
INSERT INTO `orders` (`order_no`, `order_date`, `customer_id`, `salesman_id`) VALUES
	(70001, '2021-01-18', 3005, 5002),
	(70002, '2021-02-21', 3002, 5001),
	(70003, '2021-04-01', 3009, 5003),
	(70004, '2021-02-24', 3009, 5003),
	(70005, '2021-03-19', 3007, 5001),
	(70007, '2021-02-13', 3005, 5002),
	(70008, '2021-03-02', 3002, 5001),
	(70009, '2021-01-19', 3001, 5005),
	(70010, '2021-03-23', 3004, 5006),
	(70011, '2021-05-13', 3003, 5007),
	(70012, '2021-04-12', 3008, 5002),
	(70013, '2021-05-21', 3002, 5001);

-- Dumping structure for table sales.products
CREATE TABLE IF NOT EXISTS `products` (
  `prod_id` int(11) NOT NULL,
  `prod_name` varchar(30) DEFAULT NULL,
  `prod_price` smallint(6) DEFAULT NULL,
  `prod_com` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`prod_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Dumping data for table sales.products: ~10 rows (approximately)
INSERT INTO `products` (`prod_id`, `prod_name`, `prod_price`, `prod_com`) VALUES
	(101, 'Mother Board', 3200, 15),
	(102, 'Key Board', 450, 16),
	(103, 'ZIP drive', 250, 14),
	(104, 'Speaker', 550, 16),
	(105, 'Monitor', 5000, 11),
	(106, 'DVD drive', 900, 12),
	(107, 'CD drive', 800, 12),
	(108, 'Printer', 2600, 13),
	(109, 'Refill cartridge', 350, 13),
	(110, 'Mouse', 250, 12);

-- Dumping structure for table sales.salesmen
CREATE TABLE IF NOT EXISTS `salesmen` (
  `salesman_id` int(11) NOT NULL,
  `sname` varchar(10) NOT NULL,
  `city` varchar(8) NOT NULL,
  `commission` decimal(3,2) DEFAULT NULL,
  PRIMARY KEY (`salesman_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Dumping data for table sales.salesmen: ~6 rows (approximately)
INSERT INTO `salesmen` (`salesman_id`, `sname`, `city`, `commission`) VALUES
	(5001, 'James Hoog', 'New York', 0.15),
	(5002, 'Nail Knite', 'Paris', 0.13),
	(5003, 'Lauson Hen', 'San Jose', 0.12),
	(5005, 'Pit Alex', 'London', 0.11),
	(5006, 'Mc Lyon', 'Paris', 0.14),
	(5007, 'Paul Adam', 'Rome', 0.13);


