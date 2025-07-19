-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 19, 2025 at 02:09 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ecommerce`
--

-- --------------------------------------------------------

--
-- Table structure for table `address`
--

CREATE TABLE `address` (
  `id` int(11) NOT NULL,
  `type_address` varchar(100) NOT NULL,
  `city` varchar(100) NOT NULL,
  `street` varchar(255) NOT NULL,
  `detail_address` text DEFAULT NULL,
  `latitude` double NOT NULL,
  `longitude` double NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `address`
--

INSERT INTO `address` (`id`, `type_address`, `city`, `street`, `detail_address`, `latitude`, `longitude`, `user_id`) VALUES
(71, 'Home', 'Tareem', '12th street and 5 main cross', '5floorth, 106 room ', 13.1364966, 77.5706638, 6);

-- --------------------------------------------------------

--
-- Table structure for table `admins`
--

CREATE TABLE `admins` (
  `id` int(11) NOT NULL,
  `username` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(20) NOT NULL,
  `phone` varchar(20) NOT NULL,
  `verify_code` int(4) NOT NULL,
  `approve` tinyint(1) NOT NULL DEFAULT 0,
  `time_create` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `admins`
--

INSERT INTO `admins` (`id`, `username`, `email`, `password`, `phone`, `verify_code`, `approve`, `time_create`) VALUES
(1, 'admain', 'admin@gmail.com', '654321', '771565645', 6920, 1, '2025-06-08 10:07:18');

-- --------------------------------------------------------

--
-- Table structure for table `admins_notification`
--

CREATE TABLE `admins_notification` (
  `id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `body` text NOT NULL,
  `recipient` tinyint(1) NOT NULL DEFAULT 0 COMMENT '0=>admin_receive\r\n1=>users\r\n2=>delivery',
  `time_create` datetime DEFAULT current_timestamp(),
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `admins_notification`
--

INSERT INTO `admins_notification` (`id`, `title`, `body`, `recipient`, `time_create`, `user_id`) VALUES
(37, 'Delivery Accepted', '???? Delivery  #1 (omer) has accepted the order.', 0, '2025-06-22 21:34:37', 1),
(39, 'Delivery Accepted', '???? Delivery  #1 (omer) has accepted the order.', 0, '2025-06-22 21:44:59', 1),
(41, 'Delivery Accepted', '???? Delivery  #1 (omer) has accepted the order.', 0, '2025-06-22 21:45:32', 1),
(43, 'Delivery Accepted', '???? Delivery  #1 (omer) has accepted the order.', 0, '2025-06-22 21:48:48', 1),
(44, 'Delivery Accepted', '???? Delivery  #1 (omer) has accepted the order.', 0, '2025-06-22 21:50:28', 1),
(45, 'Delivery Accepted', '???? Delivery  #1 (omer) has accepted the order.', 0, '2025-06-22 21:52:05', 1),
(46, 'Delivery Accepted', '???? Delivery  #1 (omer) has accepted the order.', 0, '2025-06-22 21:53:31', 1),
(47, 'Delivery Accepted', '???? Delivery  #1 (omer) has accepted the order.', 0, '2025-06-22 21:55:00', 1),
(48, 'Delivery Accepted', '???? Delivery  #1 (omer) has accepted the order.', 0, '2025-06-22 21:55:59', 1),
(49, 'Delivery Accepted', '???? Delivery  #1 (omer) has accepted the order.', 0, '2025-06-22 21:58:25', 1),
(50, 'Delivery Accepted', '???? Delivery  #1 (omer) has accepted the order.', 0, '2025-06-22 21:59:55', 1),
(51, 'Delivery Accepted', '???? Delivery  #1 (omer) has accepted the order.', 0, '2025-06-22 22:04:15', 1),
(52, 'Delivery Accepted', '???? Delivery  #1 (omer) has accepted the order.', 0, '2025-06-22 22:06:10', 1),
(53, 'Delivery Accepted', '???? Delivery  #1 (omer) has accepted the order.', 0, '2025-06-22 22:07:24', 1),
(54, 'Delivery Accepted', '???? Delivery  #1 (omer) has accepted the order.', 0, '2025-06-22 22:08:56', 1),
(55, 'Delivery Accepted', '???? Delivery  #1 (omer) has accepted the order.', 0, '2025-06-22 22:10:57', 1),
(56, 'Delivery Accepted', '???? Delivery  #1 (omer) has accepted the order.', 0, '2025-06-22 22:12:46', 1),
(57, 'Delivery Accepted', '???? Delivery  #1 (omer) has accepted the order.', 0, '2025-06-22 22:16:27', 1),
(58, 'Delivery Accepted', '???? Delivery  #1 (omer) has accepted the order.', 0, '2025-06-22 22:22:11', 1),
(59, 'Delivery Accepted', '???? Delivery  #1 (omer) has accepted the order.', 0, '2025-06-22 22:28:50', 1),
(60, 'Delivery Accepted', '???? Delivery  #1 (omer) has accepted the order.', 0, '2025-06-22 22:35:09', 1),
(61, 'Delivery Accepted', '???? Delivery  #1 (omer) has accepted the order.', 0, '2025-06-22 22:38:09', 1),
(62, 'Delivery Accepted', '???? Delivery  #1 (omer) has accepted the order.', 0, '2025-06-22 22:40:44', 1),
(63, 'Delivery Accepted', '???? Delivery  #1 (omer) has accepted the order.', 0, '2025-06-22 22:48:47', 1),
(64, 'Delivery Accepted', '???? Delivery  #1 (omer) has accepted the order.', 0, '2025-06-22 22:51:26', 1),
(65, 'Delivery Accepted', '???? Delivery  #1 (omer) has accepted the order.', 0, '2025-06-22 22:52:07', 1),
(66, 'Delivery Accepted', '???? Delivery  #1 (omer) has accepted the order.', 0, '2025-06-22 22:52:33', 1),
(67, 'Delivery Accepted', '???? Delivery  #1 (omer) has accepted the order.', 0, '2025-06-22 22:52:58', 1),
(68, 'Order Delivered', '✅ Order #231 has been successfully delivered to user #2.', 0, '2025-06-22 22:56:31', 1),
(69, 'Order Delivered', '✅ Order #154 has been successfully delivered to user #2.', 0, '2025-06-22 23:09:51', 1),
(70, 'Delivery Accepted', '???? Delivery  #1 (omer) has accepted the order.', 0, '2025-06-22 23:27:26', 1),
(71, 'Delivery Accepted', '???? Delivery  #1 (omer) has accepted the order.', 0, '2025-06-23 10:35:02', 1),
(72, 'Delivery Accepted', '???? Delivery  #1 (omer) has accepted the order.', 0, '2025-06-23 10:35:25', 1),
(74, 'Delivery Accepted', '???? Delivery  #1 (omer) has accepted the order.', 0, '2025-06-23 10:37:54', 1),
(75, 'Delivery Accepted', '???? Delivery  #1 (omer) has accepted the order.', 0, '2025-06-23 10:45:35', 1),
(76, 'Delivery Accepted', '???? Delivery  #1 (omer) has accepted the order.', 0, '2025-06-23 10:46:08', 1),
(77, 'Delivery Accepted', '???? Delivery  #1 (omer) has accepted the order.', 0, '2025-06-23 10:47:44', 1),
(78, 'Order Delivered', '✅ Order #234 has been successfully delivered to user #2.', 0, '2025-06-23 10:49:16', 1),
(79, 'Order Delivered', '✅ Order #224 has been successfully delivered to user #2.', 0, '2025-06-23 10:58:28', 1),
(80, 'Order Delivered', '✅ Order #224 has been successfully delivered to user #2.', 0, '2025-06-23 11:08:25', 1),
(82, 'Order Delivered', '✅ Order #234 has been successfully delivered to user #2.', 0, '2025-06-23 11:11:16', 1),
(83, 'Order Delivered', '✅ Order #234 has been successfully delivered to user #2.', 0, '2025-06-23 11:13:43', 1),
(84, 'Order Delivered', '✅ Order #224 has been successfully delivered to user #2.', 0, '2025-06-23 11:14:19', 1),
(85, 'Order Delivered', '✅ Order #154 has been successfully delivered to user #2.', 0, '2025-06-23 11:14:55', 1),
(86, 'Order Delivered', '✅ Order #154 has been successfully delivered to user #2.', 0, '2025-06-23 11:38:30', 1),
(87, 'Order Delivered', '✅ Order #154 has been successfully delivered to user #2.', 0, '2025-06-23 11:40:34', 1),
(88, 'Order Delivered', '✅ Order #224 has been successfully delivered to user #2.', 0, '2025-06-23 11:40:52', 1),
(89, 'Order Delivered', '✅ Order #234 has been successfully delivered to user #2.', 0, '2025-06-23 11:41:09', 1),
(94, 'hello5', 'visited us again 999', 1, '2025-06-26 18:58:54', 1),
(96, 'hello98', 'visited us again 888', 2, '2025-06-26 19:37:48', 1),
(97, 'hello5', 'visited us again 999', 1, '2025-06-26 19:37:52', 1),
(98, 'test', 'cra so jao', 1, '2025-06-26 23:53:38', 1),
(99, 'test ', 'bhej urdu hea', 1, '2025-06-26 23:54:30', 1),
(100, 'test', 'sha hev be', 1, '2025-06-26 23:58:29', 1),
(102, 'ja', 'debo', 1, '2025-06-27 00:00:15', 1),
(105, 'Delivery Accepted', '???? Delivery  #2 (khalid) has accepted the order.', 0, '2025-07-05 17:47:37', 1),
(106, 'Delivery Accepted', '???? Delivery  #2 (khalid) has accepted the order.', 0, '2025-07-05 17:50:18', 1),
(107, 'Delivery Accepted', '???? Delivery  #2 (khalid) has accepted the order.', 0, '2025-07-05 17:53:27', 1),
(108, 'Delivery Accepted', '???? Delivery  #2 (khalid) has accepted the order.', 0, '2025-07-05 17:53:51', 1),
(109, 'Delivery Accepted', '???? Delivery  #2 (khalid) has accepted the order.', 0, '2025-07-05 18:13:15', 1),
(110, 'Delivery Accepted', '???? Delivery  #2 (khalid) has accepted the order.', 0, '2025-07-06 05:27:04', 1),
(111, 'Delivery Accepted', '???? Delivery  #2 (khalid) has accepted the order.', 0, '2025-07-06 06:04:07', 1),
(112, 'Delivery Accepted', '???? Delivery  #2 (khalid) has accepted the order.', 0, '2025-07-06 06:10:57', 1),
(113, 'Order Delivered', '✅ Order #154 has been successfully delivered to user #2.', 0, '2025-07-06 13:51:22', 1),
(114, 'Order Delivered', '✅ Order #231 has been successfully delivered to user #2.', 0, '2025-07-06 13:52:55', 1),
(115, 'Order Delivered', '✅ Order #224 has been successfully delivered to user #2.', 0, '2025-07-06 14:04:24', 1),
(116, 'Order Delivered', '✅ Order #224 has been successfully delivered to user #2.', 0, '2025-07-08 04:43:29', 1),
(117, 'Delivery Accepted', '???? Delivery  #2 (khalid) has accepted the order.', 0, '2025-07-17 04:04:46', 1),
(118, 'Order Delivered', '✅ Order #256 has been successfully delivered to user #6.', 0, '2025-07-17 04:17:40', 1),
(119, 'Delivery Accepted', '???? Delivery  #2 (khalid) has accepted the order.', 0, '2025-07-17 08:13:50', 1),
(120, 'Order Delivered', '✅ Order #256 has been successfully delivered to user #6.', 0, '2025-07-17 08:18:48', 1),
(121, 'Delivery Accepted', '???? Delivery  #2 (khalid) has accepted the order.', 0, '2025-07-19 14:18:15', 1);

-- --------------------------------------------------------

--
-- Table structure for table `cart`
--

CREATE TABLE `cart` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL DEFAULT 0,
  `count` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `cart`
--

INSERT INTO `cart` (`id`, `user_id`, `product_id`, `order_id`, `count`) VALUES
(304, 6, 25, 246, 11),
(306, 6, 25, 248, 10),
(307, 6, 35, 249, 1),
(308, 6, 35, 250, 1),
(309, 6, 35, 254, 1),
(310, 6, 35, 256, 1),
(311, 6, 25, 257, 1),
(316, 6, 26, 261, 1),
(317, 6, 26, 264, 2);

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` int(11) NOT NULL,
  `arabic_name` varchar(255) NOT NULL,
  `english_name` varchar(255) NOT NULL,
  `image` varchar(255) NOT NULL,
  `time_create` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `arabic_name`, `english_name`, `image`, `time_create`) VALUES
(1, 'الإلكترونيات', 'Electronics', 'laptop.svg', '2025-03-08 10:09:39'),
(2, 'الأثاث', 'Furniture', 'dress.svg', '2025-03-08 10:09:39'),
(3, 'الملابس', 'Clothing', 'shirt.svg', '2025-03-08 10:09:39'),
(4, 'الكتب', 'Books', 'camera.svg', '2025-03-08 10:09:39'),
(5, 'صور', 'pitcure', 'camera.svg', '2025-03-10 05:39:10');

-- --------------------------------------------------------

--
-- Stand-in structure for view `check_product_view`
-- (See below for the actual view)
--
CREATE TABLE `check_product_view` (
`id` int(11)
,`user_id` int(11)
,`product_id` int(11)
,`count` int(11)
,`product_count` int(11)
,`active` tinyint(1)
);

-- --------------------------------------------------------

--
-- Table structure for table `check_users_coupons`
--

CREATE TABLE `check_users_coupons` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `coupons_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `check_users_coupons`
--

INSERT INTO `check_users_coupons` (`id`, `user_id`, `coupons_id`) VALUES
(3, 6, 2);

-- --------------------------------------------------------

--
-- Table structure for table `coupons`
--

CREATE TABLE `coupons` (
  `id` int(11) NOT NULL,
  `coupons_name` varchar(20) NOT NULL,
  `amount` int(11) NOT NULL,
  `count` smallint(6) NOT NULL,
  `expiry_date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `coupons`
--

INSERT INTO `coupons` (`id`, `coupons_name`, `amount`, `count`, `expiry_date`) VALUES
(1, 'king', 20, 10, '2029-05-10 15:11:26'),
(2, 'king2', 30, 3, '2026-05-01 21:26:42');

-- --------------------------------------------------------

--
-- Stand-in structure for view `dashboard_counts_view`
-- (See below for the actual view)
--
CREATE TABLE `dashboard_counts_view` (
`total_users` bigint(21)
,`total_delivery_men` bigint(21)
,`active_products` bigint(21)
,`inactive_products` bigint(21)
,`total_orders` bigint(21)
);

-- --------------------------------------------------------

--
-- Table structure for table `delivery_men`
--

CREATE TABLE `delivery_men` (
  `id` int(11) NOT NULL,
  `username` varchar(100) NOT NULL,
  `age` int(11) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` int(20) NOT NULL,
  `phone` varchar(20) NOT NULL,
  `verify_code` int(4) NOT NULL,
  `approve` tinyint(1) NOT NULL DEFAULT 0,
  `available` tinyint(1) NOT NULL DEFAULT 1 COMMENT '1=>available, 2=> unavailable',
  `active` tinyint(1) NOT NULL DEFAULT 1 COMMENT '0=>inactive, 1=>active',
  `time_create` timestamp(6) NOT NULL DEFAULT current_timestamp(6)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `delivery_men`
--

INSERT INTO `delivery_men` (`id`, `username`, `age`, `email`, `password`, `phone`, `verify_code`, `approve`, `available`, `active`, `time_create`) VALUES
(1, 'omer', 33, 'tindog2023@gmail.com', 123456, '771565645', 1234, 1, 1, 0, '2025-06-12 12:17:15.000000'),
(2, 'khalid', 45, 'khalid@gmail.com', 123456, '7715656455', 7504, 1, 1, 0, '2025-06-12 10:22:40.000000'),
(10, 'lion', 36, 'lion@gmail.com', 123456, '7725694384', 2596, 0, 1, 1, '2025-06-30 10:36:34.559094');

-- --------------------------------------------------------

--
-- Table structure for table `delivery_men_notification`
--

CREATE TABLE `delivery_men_notification` (
  `id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `body` text NOT NULL,
  `time_create` datetime DEFAULT current_timestamp(),
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `delivery_men_notification`
--

INSERT INTO `delivery_men_notification` (`id`, `title`, `body`, `time_create`, `user_id`) VALUES
(1, 'hello', 'visited us again 23', '2025-06-23 12:15:15', 1),
(2, 'hello98', 'visited us again 888', '2025-06-26 19:01:17', 1),
(3, 'hello98', 'visited us again 888', '2025-06-26 19:37:47', 1),
(4, 'qu', 'jsw', '2025-06-27 00:12:30', 1);

-- --------------------------------------------------------

--
-- Stand-in structure for view `delivery_prepare_order_view`
-- (See below for the actual view)
--
CREATE TABLE `delivery_prepare_order_view` (
`id` int(11)
,`price` double
,`type_address` varchar(100)
,`city` varchar(100)
,`street` varchar(255)
,`detail_address` text
,`userLatitude` double
,`userLongitude` double
,`quantity` decimal(32,0)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `detail_order_view`
-- (See below for the actual view)
--
CREATE TABLE `detail_order_view` (
`id` int(11)
,`status` tinyint(4)
,`price` double
,`total_price` double
,`address_id` int(11)
,`user_id` int(11)
,`products_data` mediumtext
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `monthly_orders_view`
-- (See below for the actual view)
--
CREATE TABLE `monthly_orders_view` (
`month` int(2)
,`order_count` bigint(21)
);

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` int(11) NOT NULL,
  `type_payment` tinyint(1) NOT NULL COMMENT '0=>cash, 1=>card',
  `type_delivery` tinyint(1) NOT NULL COMMENT '0=>delivery, 1=>receive',
  `delivery_price` double NOT NULL DEFAULT 0 COMMENT '0=>receive',
  `price` double NOT NULL,
  `total_price` double NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 0 COMMENT '0=>pendding, 1=>proper, \r\n2=> acceptedDelivery,\r\n3=>on the way,\r\n4=>done',
  `time_create` datetime NOT NULL DEFAULT current_timestamp(),
  `user_id` int(11) NOT NULL,
  `delivery_id` int(11) DEFAULT NULL COMMENT 'always  = null when type_delivery = 0',
  `address_id` int(11) DEFAULT NULL COMMENT 'null=>receive',
  `coupons_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `type_payment`, `type_delivery`, `delivery_price`, `price`, `total_price`, `status`, `time_create`, `user_id`, `delivery_id`, `address_id`, `coupons_id`) VALUES
(256, 0, 0, 0, 14.7, 14.7, 4, '2025-07-17 03:53:26', 6, 2, 124, NULL),
(257, 1, 0, 0, 1500, 1500, 3, '2025-07-19 13:54:18', 6, 2, 125, NULL),
(261, 1, 1, 0, 300, 300, 0, '2025-07-19 15:41:44', 6, NULL, NULL, NULL),
(264, 0, 1, 0, 600, 600, 0, '2025-07-19 15:43:27', 6, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Stand-in structure for view `orders_per_city_view`
-- (See below for the actual view)
--
CREATE TABLE `orders_per_city_view` (
`city` varchar(100)
,`order_count` bigint(21)
);

-- --------------------------------------------------------

--
-- Table structure for table `order_address`
--

CREATE TABLE `order_address` (
  `id` int(11) NOT NULL,
  `type_address` varchar(100) NOT NULL,
  `city` varchar(100) NOT NULL,
  `street` varchar(255) NOT NULL,
  `detail_address` text DEFAULT NULL,
  `latitude` double NOT NULL,
  `longitude` double NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `order_address`
--

INSERT INTO `order_address` (`id`, `type_address`, `city`, `street`, `detail_address`, `latitude`, `longitude`, `user_id`) VALUES
(123, 'Home', 'Tareem', 'al soq', '4th flloor,room no. 23', 13.1365029, 77.570656, 6),
(124, 'Home', 'Tareem', '12th street and 5 main cross', '5floorth, 106 room ', 13.1364966, 77.5706638, 6),
(125, 'Home', 'Tareem', '12th street and 5 main cross', '5floorth, 106 room ', 13.1364966, 77.5706638, 6),
(126, 'Home', 'Tareem', '12th street and 5 main cross', '5floorth, 106 room ', 13.1364966, 77.5706638, 6),
(127, 'Home', 'Tareem', '12th street and 5 main cross', '5floorth, 106 room ', 13.1364966, 77.5706638, 6);

-- --------------------------------------------------------

--
-- Stand-in structure for view `order_delivery_view`
-- (See below for the actual view)
--
CREATE TABLE `order_delivery_view` (
`id` int(11)
,`type_payment` tinyint(1)
,`price` double
,`total_price` double
,`delivery_price` double
,`status` tinyint(4)
,`delivery_id` int(11)
,`user_id` int(11)
,`username` varchar(100)
,`email` varchar(100)
,`phone` varchar(20)
,`city` varchar(100)
,`street` varchar(255)
,`type_address` varchar(100)
,`detail_address` text
,`latitude` double
,`longitude` double
,`quantity` decimal(32,0)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `order_user_view`
-- (See below for the actual view)
--
CREATE TABLE `order_user_view` (
`id` int(11)
,`type_payment` tinyint(1)
,`type_delivery` tinyint(1)
,`delivery_price` double
,`price` double
,`total_price` double
,`status` tinyint(4)
,`time_create` datetime
,`user_id` int(11)
,`delivery_id` int(11)
,`address_id` int(11)
,`coupons_id` int(11)
,`username` varchar(100)
,`email` varchar(100)
,`phone` varchar(20)
);

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` int(11) NOT NULL,
  `arabic_name` varchar(255) NOT NULL,
  `english_name` varchar(255) NOT NULL,
  `arabic_description` text DEFAULT NULL,
  `english_description` text DEFAULT NULL,
  `image` varchar(255) NOT NULL,
  `count` int(11) NOT NULL,
  `active` tinyint(1) DEFAULT 1,
  `price` double(10,2) NOT NULL,
  `discount` double(10,2) NOT NULL DEFAULT 0.00,
  `time_create` timestamp NOT NULL DEFAULT current_timestamp(),
  `category_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `arabic_name`, `english_name`, `arabic_description`, `english_description`, `image`, `count`, `active`, `price`, `discount`, `time_create`, `category_id`) VALUES
(25, 'حاسوب محمول', 'Laptop', 'حاسوب محمول عالي الأداء', 'High performance laptop', '5.png', 9, 1, 1500.00, 0.00, '2025-03-08 10:09:39', 1),
(26, 'هاتف ذكي', 'Smartphone', 'هاتف ذكي مع كاميرا عالية الجودة', 'Smartphone with high-quality camera', '5.png', 0, 0, 600.00, 50.00, '2025-03-08 10:09:39', 1),
(27, 'سماعات بلوتوث', 'Bluetooth Headphones', 'سماعات بلوتوث عالية الجودة', 'High-quality Bluetooth headphones', '5.png', 10, 1, 150.00, 20.00, '2025-03-08 10:09:39', 1),
(28, 'طاولة طعام', 'Dining Table', 'طاولة طعام خشبية كبيرة', 'Large wooden dining table', '1.png', 10, 1, 300.00, 50.00, '2025-03-08 10:09:39', 1),
(29, 'كرسي مكتب', 'Office Chair', 'كرسي مكتب مريح', 'Comfortable office chair', '1.png', 10, 1, 80.00, 10.00, '2025-03-08 10:09:39', 1),
(30, 'أريكة', 'Sofa', 'أريكة جلدية مريحة', 'Comfortable leather sofa', '1.png', 0, 0, 700.00, 100.00, '2025-03-08 10:09:39', 2),
(31, 'سروال جينز', 'Jeans', 'سروال جينز عالي الجودة', 'High-quality jeans', '4.png', 0, 0, 50.00, 10.00, '2025-03-08 10:09:39', 3),
(32, 'فستان صيفي', 'Summer Dress', 'فستان صيفي مريح', 'Comfortable summer dress', '4.png', 0, 0, 30.00, 5.00, '2025-03-08 10:09:39', 3),
(34, 'كتاب علمي', 'Science Book', 'كتاب علمي حول الفيزياء', 'Science book on physics', '3.png', 0, 0, 25.00, 5.00, '2025-03-08 10:09:39', 4),
(35, 'رواية خيالية', 'Fantasy Novel', 'رواية خيالية مثيرة', 'Exciting fantasy novel', '3.png', 9, 1, 15.00, 2.00, '2025-03-08 10:09:39', 4),
(36, 'دليل السفر', 'Travel Guide', 'دليل السفر إلى أوروبا', 'Travel guide to Europe', '3.png', 30, 1, 18.00, 3.00, '2025-03-08 10:09:39', 4);

-- --------------------------------------------------------

--
-- Stand-in structure for view `product_category_pie_view`
-- (See below for the actual view)
--
CREATE TABLE `product_category_pie_view` (
`category_id` int(11)
,`arabic_name` varchar(255)
,`english_name` varchar(255)
,`product_count` bigint(21)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `product_invalid_view`
-- (See below for the actual view)
--
CREATE TABLE `product_invalid_view` (
`product_id` int(11)
,`count` int(11)
,`arabic_name` varchar(255)
,`english_name` varchar(255)
,`user_id` int(11)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `product_ratings_view`
-- (See below for the actual view)
--
CREATE TABLE `product_ratings_view` (
`product_id` int(11)
,`star` decimal(25,0)
,`count` bigint(21)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `product_view`
-- (See below for the actual view)
--
CREATE TABLE `product_view` (
`id` int(11)
,`arabic_name` varchar(255)
,`english_name` varchar(255)
,`arabic_description` text
,`english_description` text
,`image` varchar(255)
,`countProduct` int(11)
,`count` int(11)
,`active` tinyint(1)
,`price` double(10,2)
,`discount` double(10,2)
,`discountPrice` double(23,6)
,`time_create` timestamp
,`rating` decimal(29,4)
,`category_id` int(11)
,`category_arabic_name` varchar(255)
,`category_english_name` varchar(255)
,`category_image` varchar(255)
,`category_time_create` timestamp
);

-- --------------------------------------------------------

--
-- Table structure for table `ratings`
--

CREATE TABLE `ratings` (
  `id` int(11) NOT NULL,
  `star` tinyint(4) NOT NULL,
  `comment` varchar(255) DEFAULT NULL,
  `product_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `customer_id` varchar(50) NOT NULL COMMENT 'this for stripe payment',
  `username` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(20) NOT NULL,
  `phone` varchar(20) NOT NULL,
  `verify_code` int(4) NOT NULL,
  `approve` tinyint(1) NOT NULL DEFAULT 0,
  `time_create` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `customer_id`, `username`, `email`, `password`, `phone`, `verify_code`, `approve`, `time_create`) VALUES
(6, 'cus_SfNuhSW86Hp1sa', 'king', 'king@gmail.com', '123456', '7715656452', 3130, 1, '2025-07-12 13:06:36');

-- --------------------------------------------------------

--
-- Table structure for table `users_notification`
--

CREATE TABLE `users_notification` (
  `id` int(11) NOT NULL,
  `title` varchar(100) NOT NULL,
  `body` varchar(255) NOT NULL,
  `time_create` datetime NOT NULL DEFAULT current_timestamp(),
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `users_notification`
--

INSERT INTO `users_notification` (`id`, `title`, `body`, `time_create`, `user_id`) VALUES
(5, 'hello', 'king3', '2025-05-19 20:12:06', 6),
(28, 'Order Delivered', '???? Your order has been delivered. Enjoy!', '2025-06-22 21:22:24', 6),
(88, 'Order Delivered', '???? Your order has been delivered. Enjoy!', '2025-07-17 04:17:39', 6),
(89, 'Order Delivered', '???? Your order has been delivered. Enjoy!', '2025-07-17 08:18:46', 6);

-- --------------------------------------------------------

--
-- Structure for view `check_product_view`
--
DROP TABLE IF EXISTS `check_product_view`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `check_product_view`  AS SELECT `cart`.`id` AS `id`, `cart`.`user_id` AS `user_id`, `cart`.`product_id` AS `product_id`, `cart`.`count` AS `count`, `products`.`count` AS `product_count`, `products`.`active` AS `active` FROM (`cart` join `products` on(`products`.`id` = `cart`.`product_id`)) ;

-- --------------------------------------------------------

--
-- Structure for view `dashboard_counts_view`
--
DROP TABLE IF EXISTS `dashboard_counts_view`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `dashboard_counts_view`  AS SELECT (select count(0) from `users`) AS `total_users`, (select count(0) from `delivery_men`) AS `total_delivery_men`, (select count(0) from `products` where `products`.`active` = 1) AS `active_products`, (select count(0) from `products` where `products`.`active` = 0) AS `inactive_products`, (select count(0) from `orders`) AS `total_orders` ;

-- --------------------------------------------------------

--
-- Structure for view `delivery_prepare_order_view`
--
DROP TABLE IF EXISTS `delivery_prepare_order_view`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `delivery_prepare_order_view`  AS SELECT `o`.`id` AS `id`, `o`.`price` AS `price`, `oa`.`type_address` AS `type_address`, `oa`.`city` AS `city`, `oa`.`street` AS `street`, `oa`.`detail_address` AS `detail_address`, `oa`.`latitude` AS `userLatitude`, `oa`.`longitude` AS `userLongitude`, sum(`c`.`count`) AS `quantity` FROM ((`orders` `o` join `order_address` `oa` on(`oa`.`id` = `o`.`address_id`)) join `cart` `c` on(`c`.`order_id` = `o`.`id`)) WHERE `o`.`status` = 1 GROUP BY `o`.`id` ;

-- --------------------------------------------------------

--
-- Structure for view `detail_order_view`
--
DROP TABLE IF EXISTS `detail_order_view`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `detail_order_view`  AS SELECT `orders`.`id` AS `id`, `orders`.`status` AS `status`, `orders`.`price` AS `price`, `orders`.`total_price` AS `total_price`, `orders`.`address_id` AS `address_id`, `orders`.`user_id` AS `user_id`, concat('[',group_concat(concat('{','"product_id":',ifnull(`cart`.`product_id`,0),',','"arabic_name":"',replace(ifnull(`products`.`arabic_name`,''),'"','\\"'),'",','"english_name":"',replace(ifnull(`products`.`english_name`,''),'"','\\"'),'",','"image":"',replace(ifnull(`products`.`image`,''),'"','\\"'),'",','"count":',ifnull(`cart`.`count`,0),',','"price":',ifnull(`products`.`price`,0),',','"total_price":',ifnull(`products`.`price` - `products`.`price` * `products`.`discount` / 100,0),',','"rating":',if(`ratings`.`id` is not null,'true','false'),'}') separator ','),']') AS `products_data` FROM (((`orders` left join `cart` on(`orders`.`id` = `cart`.`order_id`)) join `products` on(`products`.`id` = `cart`.`product_id`)) left join `ratings` on(`ratings`.`order_id` = `orders`.`id` and `ratings`.`product_id` = `cart`.`product_id` and `ratings`.`user_id` = `cart`.`user_id`)) GROUP BY `orders`.`id` ;

-- --------------------------------------------------------

--
-- Structure for view `monthly_orders_view`
--
DROP TABLE IF EXISTS `monthly_orders_view`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `monthly_orders_view`  AS SELECT extract(month from `orders`.`time_create`) AS `month`, count(0) AS `order_count` FROM `orders` GROUP BY extract(month from `orders`.`time_create`) ORDER BY extract(month from `orders`.`time_create`) ASC ;

-- --------------------------------------------------------

--
-- Structure for view `orders_per_city_view`
--
DROP TABLE IF EXISTS `orders_per_city_view`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `orders_per_city_view`  AS SELECT `order_address`.`city` AS `city`, count(`orders`.`id`) AS `order_count` FROM (`orders` join `order_address` on(`order_address`.`id` = `orders`.`address_id`)) GROUP BY `order_address`.`city` ORDER BY count(`orders`.`id`) DESC ;

-- --------------------------------------------------------

--
-- Structure for view `order_delivery_view`
--
DROP TABLE IF EXISTS `order_delivery_view`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `order_delivery_view`  AS SELECT `orders`.`id` AS `id`, `orders`.`type_payment` AS `type_payment`, `orders`.`price` AS `price`, `orders`.`total_price` AS `total_price`, `orders`.`delivery_price` AS `delivery_price`, `orders`.`status` AS `status`, `orders`.`delivery_id` AS `delivery_id`, `orders`.`user_id` AS `user_id`, `users`.`username` AS `username`, `users`.`email` AS `email`, `users`.`phone` AS `phone`, `order_address`.`city` AS `city`, `order_address`.`street` AS `street`, `order_address`.`type_address` AS `type_address`, `order_address`.`detail_address` AS `detail_address`, `order_address`.`latitude` AS `latitude`, `order_address`.`longitude` AS `longitude`, sum(`cart`.`count`) AS `quantity` FROM (((`orders` join `users` on(`orders`.`user_id` = `users`.`id`)) join `order_address` on(`orders`.`address_id` = `order_address`.`id`)) join `cart` on(`cart`.`order_id` = `orders`.`id`)) WHERE `orders`.`status` <> 0 AND `orders`.`type_delivery` = 0 GROUP BY `orders`.`id` ;

-- --------------------------------------------------------

--
-- Structure for view `order_user_view`
--
DROP TABLE IF EXISTS `order_user_view`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `order_user_view`  AS SELECT `orders`.`id` AS `id`, `orders`.`type_payment` AS `type_payment`, `orders`.`type_delivery` AS `type_delivery`, `orders`.`delivery_price` AS `delivery_price`, `orders`.`price` AS `price`, `orders`.`total_price` AS `total_price`, `orders`.`status` AS `status`, `orders`.`time_create` AS `time_create`, `orders`.`user_id` AS `user_id`, `orders`.`delivery_id` AS `delivery_id`, `orders`.`address_id` AS `address_id`, `orders`.`coupons_id` AS `coupons_id`, CASE WHEN `orders`.`type_delivery` = 1 THEN `users`.`username` WHEN `orders`.`type_delivery` = 0 AND `orders`.`delivery_id` is not null THEN `dm`.`username` ELSE NULL END AS `username`, CASE WHEN `orders`.`type_delivery` = 1 THEN `users`.`email` WHEN `orders`.`type_delivery` = 0 AND `orders`.`delivery_id` is not null THEN `dm`.`email` ELSE NULL END AS `email`, CASE WHEN `orders`.`type_delivery` = 1 THEN `users`.`phone` WHEN `orders`.`type_delivery` = 0 AND `orders`.`delivery_id` is not null THEN `dm`.`phone` ELSE NULL END AS `phone` FROM ((`orders` join `users` on(`orders`.`user_id` = `users`.`id`)) left join `delivery_men` `dm` on(`orders`.`delivery_id` = `dm`.`id`)) ;

-- --------------------------------------------------------

--
-- Structure for view `product_category_pie_view`
--
DROP TABLE IF EXISTS `product_category_pie_view`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `product_category_pie_view`  AS SELECT `categories`.`id` AS `category_id`, `categories`.`arabic_name` AS `arabic_name`, `categories`.`english_name` AS `english_name`, count(`products`.`id`) AS `product_count` FROM (`products` join `categories` on(`categories`.`id` = `products`.`category_id`)) GROUP BY `categories`.`id`, `categories`.`arabic_name`, `categories`.`english_name` ORDER BY count(`products`.`id`) DESC ;

-- --------------------------------------------------------

--
-- Structure for view `product_invalid_view`
--
DROP TABLE IF EXISTS `product_invalid_view`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `product_invalid_view`  AS SELECT `cart`.`product_id` AS `product_id`, `products`.`count` AS `count`, `products`.`arabic_name` AS `arabic_name`, `products`.`english_name` AS `english_name`, `cart`.`user_id` AS `user_id` FROM (`cart` join `products` on(`products`.`id` = `cart`.`product_id`)) WHERE `cart`.`order_id` = 0 AND `products`.`count` < `cart`.`count` ;

-- --------------------------------------------------------

--
-- Structure for view `product_ratings_view`
--
DROP TABLE IF EXISTS `product_ratings_view`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `product_ratings_view`  AS SELECT `ratings`.`product_id` AS `product_id`, sum(`ratings`.`star`) AS `star`, count(`ratings`.`product_id`) AS `count` FROM `ratings` GROUP BY `ratings`.`product_id` ;

-- --------------------------------------------------------

--
-- Structure for view `product_view`
--
DROP TABLE IF EXISTS `product_view`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `product_view`  AS SELECT `products`.`id` AS `id`, `products`.`arabic_name` AS `arabic_name`, `products`.`english_name` AS `english_name`, `products`.`arabic_description` AS `arabic_description`, `products`.`english_description` AS `english_description`, `products`.`image` AS `image`, `products`.`count` AS `countProduct`, ifnull(`cart`.`count`,0) AS `count`, `products`.`active` AS `active`, `products`.`price` AS `price`, `products`.`discount` AS `discount`, `products`.`price`- `products`.`price` * `products`.`discount` / 100 AS `discountPrice`, `products`.`time_create` AS `time_create`, CASE WHEN `product_ratings_view`.`count` is null OR `product_ratings_view`.`count` = 0 THEN 5 ELSE `product_ratings_view`.`star`/ `product_ratings_view`.`count` END AS `rating`, `categories`.`id` AS `category_id`, `categories`.`arabic_name` AS `category_arabic_name`, `categories`.`english_name` AS `category_english_name`, `categories`.`image` AS `category_image`, `categories`.`time_create` AS `category_time_create` FROM (((`products` join `categories` on(`categories`.`id` = `products`.`category_id`)) left join `cart` on(`cart`.`product_id` = `products`.`id` and `cart`.`order_id` = 0)) left join `product_ratings_view` on(`product_ratings_view`.`product_id` = `products`.`id`)) ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `address`
--
ALTER TABLE `address`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `admins`
--
ALTER TABLE `admins`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `phone` (`phone`);

--
-- Indexes for table `admins_notification`
--
ALTER TABLE `admins_notification`
  ADD PRIMARY KEY (`id`),
  ADD KEY `admin_id` (`user_id`);

--
-- Indexes for table `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`id`),
  ADD KEY `users_id` (`user_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `check_users_coupons`
--
ALTER TABLE `check_users_coupons`
  ADD PRIMARY KEY (`id`),
  ADD KEY `users_id` (`user_id`),
  ADD KEY `coupons_id` (`coupons_id`);

--
-- Indexes for table `coupons`
--
ALTER TABLE `coupons`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`coupons_name`);

--
-- Indexes for table `delivery_men`
--
ALTER TABLE `delivery_men`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `phone` (`phone`);

--
-- Indexes for table `delivery_men_notification`
--
ALTER TABLE `delivery_men_notification`
  ADD PRIMARY KEY (`id`),
  ADD KEY `delivery_id` (`user_id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `coupons_id` (`coupons_id`),
  ADD KEY `orders_ibfk_2` (`address_id`),
  ADD KEY `delivery_id` (`delivery_id`);

--
-- Indexes for table `order_address`
--
ALTER TABLE `order_address`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `category_id` (`category_id`);

--
-- Indexes for table `ratings`
--
ALTER TABLE `ratings`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `order_id` (`order_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `phone` (`phone`),
  ADD UNIQUE KEY `customer_id` (`customer_id`);

--
-- Indexes for table `users_notification`
--
ALTER TABLE `users_notification`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `address`
--
ALTER TABLE `address`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=72;

--
-- AUTO_INCREMENT for table `admins`
--
ALTER TABLE `admins`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `admins_notification`
--
ALTER TABLE `admins_notification`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=122;

--
-- AUTO_INCREMENT for table `cart`
--
ALTER TABLE `cart`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=318;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- AUTO_INCREMENT for table `check_users_coupons`
--
ALTER TABLE `check_users_coupons`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `coupons`
--
ALTER TABLE `coupons`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `delivery_men`
--
ALTER TABLE `delivery_men`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `delivery_men_notification`
--
ALTER TABLE `delivery_men_notification`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=265;

--
-- AUTO_INCREMENT for table `order_address`
--
ALTER TABLE `order_address`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=128;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=59;

--
-- AUTO_INCREMENT for table `ratings`
--
ALTER TABLE `ratings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=57;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `users_notification`
--
ALTER TABLE `users_notification`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=90;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `address`
--
ALTER TABLE `address`
  ADD CONSTRAINT `address_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `cart`
--
ALTER TABLE `cart`
  ADD CONSTRAINT `cart_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `cart_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `check_users_coupons`
--
ALTER TABLE `check_users_coupons`
  ADD CONSTRAINT `check_users_coupons_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `check_users_coupons_ibfk_2` FOREIGN KEY (`coupons_id`) REFERENCES `coupons` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `orders_ibfk_2` FOREIGN KEY (`address_id`) REFERENCES `order_address` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `orders_ibfk_3` FOREIGN KEY (`coupons_id`) REFERENCES `coupons` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `orders_ibfk_4` FOREIGN KEY (`delivery_id`) REFERENCES `delivery_men` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `order_address`
--
ALTER TABLE `order_address`
  ADD CONSTRAINT `order_address_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `ratings`
--
ALTER TABLE `ratings`
  ADD CONSTRAINT `ratings_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `ratings_ibfk_2` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `ratings_ibfk_3` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `users_notification`
--
ALTER TABLE `users_notification`
  ADD CONSTRAINT `users_notification_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
