-- phpMyAdmin SQL Dump
-- version 5.0.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 18, 2021 at 02:09 PM
-- Server version: 10.4.14-MariaDB
-- PHP Version: 7.2.34

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `online_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin_details`
--

CREATE TABLE `admin_details` (
  `adminId` int(11) NOT NULL,
  `username` varchar(60) NOT NULL,
  `password` varchar(32) NOT NULL,
  `status` varchar(20) NOT NULL,
  `createdAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `admin_details`
--

INSERT INTO `admin_details` (`adminId`, `username`, `password`, `status`, `createdAt`) VALUES
(3, 'Vanshika Agarwal', '45678', '1', '2021-03-09 13:50:25'),
(4, 'Aniket Deshmukh', '1234', '0', '2021-03-09 13:50:41');

-- --------------------------------------------------------

--
-- Table structure for table `attribute`
--

CREATE TABLE `attribute` (
  `attributeId` int(11) NOT NULL,
  `entityTypeId` enum('product','category') NOT NULL,
  `name` varchar(64) NOT NULL,
  `code` varchar(20) NOT NULL,
  `inputType` varchar(20) NOT NULL,
  `backendType` varchar(64) NOT NULL,
  `sortOrder` int(4) NOT NULL,
  `backendModel` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `attribute`
--

INSERT INTO `attribute` (`attributeId`, `entityTypeId`, `name`, `code`, `inputType`, `backendType`, `sortOrder`, `backendModel`) VALUES
(1, 'product', 'color', 'color', 'select', 'VARCHAR', 1, ''),
(2, 'product', 'size', 'size', 'select', 'INT', 3, '');

-- --------------------------------------------------------

--
-- Table structure for table `attribute_option`
--

CREATE TABLE `attribute_option` (
  `optionId` int(11) NOT NULL,
  `name` varchar(40) NOT NULL,
  `attributeId` int(11) NOT NULL,
  `sortOrder` int(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `attribute_option`
--

INSERT INTO `attribute_option` (`optionId`, `name`, `attributeId`, `sortOrder`) VALUES
(1, 'black', 1, 1),
(2, 'brown', 1, 2),
(3, '12', 2, 1),
(4, '13', 2, 2),
(5, '14', 2, 3),
(6, '15', 2, 4);

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `categoryId` int(11) NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `status` tinyint(4) DEFAULT NULL,
  `parentId` int(11) DEFAULT NULL,
  `featured` varchar(4) DEFAULT NULL,
  `createdAt` datetime DEFAULT current_timestamp(),
  `path` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`categoryId`, `name`, `status`, `parentId`, `featured`, `createdAt`, `path`) VALUES
(1, 'Bedroom', 1, 0, '1', '2021-03-17 19:26:11', '1'),
(2, 'Bedroom Sets', 1, 1, '1', '2021-03-17 19:26:11', '1=2'),
(3, 'Beds', 1, 1, '1', '2021-03-17 19:26:11', '1=3'),
(4, 'Nightstands', 1, 1, '1', '2021-03-17 19:26:11', '1=4'),
(5, 'Dressers', 1, 1, '1', '2021-03-17 19:26:11', '1=5'),
(6, 'Dresser Mirrors', 1, 1, '1', '2021-03-17 19:26:11', '1=6'),
(7, 'Chests', 1, 1, '1', '2021-03-17 19:26:11', '1=7'),
(8, 'Bedroom Benches', 1, 1, '1', '2021-03-17 19:26:11', '1=8'),
(9, 'Bed Frames & Headboards', 1, 1, '1', '2021-03-17 19:26:11', '1=9'),
(10, 'Armoires and Wardrobes', 1, 1, '1', '2021-03-17 19:26:11', '1=10'),
(11, 'Bedroom Vanities', 1, 1, '1', '2021-03-17 19:26:12', '1=11'),
(12, 'Media Chests', 1, 1, '1', '2021-03-17 19:26:12', '1=12'),
(13, 'Jewelry Armoires', 1, 1, '1', '2021-03-17 19:26:12', '1=13'),
(14, 'Day Beds and Futons', 1, 1, '1', '2021-03-17 19:26:12', '1=14'),
(15, 'Kids Room', 1, 1, '1', '2021-03-17 19:26:12', '1=15'),
(16, 'Kids and Youth Furniture', 1, 1, '1', '2021-03-17 19:26:12', '1=16'),
(17, 'Baby Furniture', 1, 1, '1', '2021-03-17 19:26:12', '1=17'),
(18, 'Mattresses', 1, 1, '1', '2021-03-17 19:26:13', '1=18'),
(19, 'Box Springs & Foundations', 1, 1, '1', '2021-03-17 19:26:13', '1=19'),
(20, 'Adjustable Beds', 1, 1, '1', '2021-03-17 19:26:13', '1=20'),
(21, 'Pillows', 1, 1, '1', '2021-03-17 19:26:13', '1=21'),
(22, 'Bedding and Comfort Sets', 1, 1, '1', '2021-03-17 19:26:13', '1=22'),
(23, 'Living Room', 1, 0, '1', '2021-03-17 19:26:13', '23'),
(24, 'Living Room Sets', 1, 24, '1', '2021-03-17 19:26:13', '23=24'),
(25, 'Sectionals', 1, 24, '1', '2021-03-17 19:26:13', '23=25'),
(26, 'Sofas', 1, 24, '1', '2021-03-17 19:26:13', '23=26'),
(27, 'Loveseats', 1, 24, '1', '2021-03-17 19:26:13', '23=27'),
(28, 'Reclining Loveseats', 1, 24, '1', '2021-03-17 19:26:13', '23=28'),
(29, 'Sleeper Sofas', 1, 24, '1', '2021-03-17 19:26:13', '23=29'),
(30, 'Recliners and Rockers', 1, 24, '1', '2021-03-17 19:26:13', '23=30'),
(31, 'Theater Seating', 1, 24, '1', '2021-03-17 19:26:13', '23=31'),
(32, 'Chairs', 1, 24, '0', '2021-03-17 19:26:13', '23=32'),
(33, 'Accent Chairs', 1, 24, '0', '2021-03-17 19:26:13', '23=33'),
(34, 'Chaises', 1, 24, '0', '2021-03-17 19:26:13', '23=34'),
(35, 'Ottomans', 1, 24, '0', '2021-03-17 19:26:13', '23=35'),
(36, 'Futons', 1, 24, '0', '2021-03-17 19:26:13', '23=36'),
(37, 'Leather Furniture', 1, 24, '0', '2021-03-17 19:26:14', '23=37'),
(38, 'Occasional Table Sets', 1, 24, '0', '2021-03-17 19:26:14', '23=38'),
(39, 'Sofa Tables', 1, 24, '0', '2021-03-17 19:26:14', '23=39'),
(40, 'Accent Chests and Cabinets', 1, 24, '0', '2021-03-17 19:26:14', '23=40'),
(41, 'Console Tables', 1, 24, '0', '2021-03-17 19:26:14', '23=41'),
(42, 'Coffee and Cocktail Tables', 1, 24, '0', '2021-03-17 19:26:14', '23=42'),
(43, 'End Tables', 1, 24, '0', '2021-03-17 19:26:14', '23=43'),
(44, 'Accent Tables', 1, 24, '0', '2021-03-17 19:26:14', '23=44'),
(45, 'Side Tables', 1, 24, '0', '2021-03-17 19:26:14', '23=45'),
(46, 'Rugs and Accessories', 1, 24, '0', '2021-03-17 19:26:14', '23=46'),
(47, 'Entertainment Centers and Walls', 1, 24, '0', '2021-03-17 19:26:14', '23=47'),
(48, 'TV Stands and TV Consoles', 1, 24, '0', '2021-03-17 19:26:14', '23=48'),
(49, 'CD and DVD Media Storage', 1, 24, '0', '2021-03-17 19:26:14', '23=49'),
(50, 'Bar and Game Room', 1, 0, '0', '2021-03-17 19:26:14', '50'),
(51, 'Home Bar Sets', 1, 50, '0', '2021-03-17 19:26:14', '50=51'),
(52, 'Bistro and Bar Table Sets', 1, 50, '0', '2021-03-17 19:26:14', '50=52'),
(53, 'Game Table Sets', 1, 50, '0', '2021-03-17 19:26:14', '50=53'),
(54, 'Bar Tables and Pub Tables', 1, 50, '0', '2021-03-17 19:26:14', '50=54'),
(55, 'Barstools', 1, 50, '0', '2021-03-17 19:26:14', '50=55'),
(56, 'Wine Racks', 1, 50, '0', '2021-03-17 19:26:15', '50=56'),
(57, 'Game Tables', 1, 50, '0', '2021-03-17 19:26:15', '50=57'),
(58, 'Game Room Chairs', 1, 50, '0', '2021-03-17 19:26:15', '50=58'),
(59, 'Bar and Wine Cabinets', 1, 50, '0', '2021-03-17 19:26:15', '50=59');

-- --------------------------------------------------------

--
-- Table structure for table `cms_table`
--

CREATE TABLE `cms_table` (
  `pageId` int(11) NOT NULL,
  `title` varchar(100) NOT NULL,
  `identifier` int(11) NOT NULL,
  `content` varchar(500) NOT NULL,
  `status` tinyint(4) NOT NULL,
  `createdAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `cms_table`
--

INSERT INTO `cms_table` (`pageId`, `title`, `identifier`, `content`, `status`, `createdAt`) VALUES
(1, '55', 12, 'One content', 0, '2021-03-13 16:44:22'),
(7, '2', 0, '33', 0, '2021-03-13 16:58:14'),
(8, '1', 2, '<p><b><font color=\"#000000\" style=\"background-color: rgb(115, 165, 173);\">ABCD</font></b></p>', 1, '2021-03-13 17:47:28');

-- --------------------------------------------------------

--
-- Table structure for table `customer_address`
--

CREATE TABLE `customer_address` (
  `addressId` int(11) NOT NULL,
  `customerId` int(11) NOT NULL,
  `address` varchar(120) NOT NULL,
  `city` varchar(80) NOT NULL,
  `state` varchar(80) NOT NULL,
  `zipcode` varchar(6) NOT NULL,
  `country` varchar(80) NOT NULL,
  `address_type` varchar(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `customer_address`
--

INSERT INTO `customer_address` (`addressId`, `customerId`, `address`, `city`, `state`, `zipcode`, `country`, `address_type`) VALUES
(1, 3, '42, Shiv Shakti Apartments', 'Surat', 'Gujarat', '380023', 'India', '2'),
(2, 3, '42, Shiv Shakti Apartments', 'Surat', 'Gujarat', '380023', 'India', '1'),
(3, 4, '24,Sharda Apartment', 'Ahmedabad', 'Gujarat', '380021', 'India', '2'),
(4, 4, '24,Sharda Apartment', 'Ahmedabad', 'Gujarat', '380021', 'India', '1'),
(5, 5, '42, Nehru Park Society', 'Ahmedabad', 'Gujarat', '380021', 'India', '2'),
(6, 5, '42, Nehru Park Society', 'Ahmedabad', 'Gujarat', '380021', 'India', '1'),
(7, 28, '45, Shiv Shakti Apartments', 'Ahmedabad', 'Gujarat', '380022', 'India', '2'),
(8, 28, '45, Shiv Shakti Apartments', 'Ahmedabad', 'Gujarat', '380022', 'India', '1');

-- --------------------------------------------------------

--
-- Table structure for table `customer_details`
--

CREATE TABLE `customer_details` (
  `customerId` int(11) NOT NULL,
  `fname` varchar(50) NOT NULL,
  `lname` varchar(50) NOT NULL,
  `email` varchar(60) NOT NULL,
  `passwordhash` varchar(8) NOT NULL,
  `mobile` varchar(10) NOT NULL,
  `status` varchar(20) NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  `groupId` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `customer_details`
--

INSERT INTO `customer_details` (`customerId`, `fname`, `lname`, `email`, `passwordhash`, `mobile`, `status`, `createdAt`, `updatedAt`, `groupId`) VALUES
(3, 'Sejal', 'Sharma', 'sejalsharma544@gmail.com', '12345', '9874563210', '0', '2021-02-16 20:12:00', '2021-03-17 11:07:47', 2),
(4, 'Akash', 'Panchal', 'akashpanchal54@gmail.com', '12345', '8745963221', '1', '2021-02-16 21:50:30', '2021-02-25 11:17:49', 2),
(5, 'Anjali', 'Sharma', 'anjalisharma123@gmail.com', '12345', '8745963210', '1', '2021-02-17 11:10:29', '2021-02-17 11:10:29', 2);

-- --------------------------------------------------------

--
-- Table structure for table `customer_group`
--

CREATE TABLE `customer_group` (
  `groupId` int(11) NOT NULL,
  `name` varchar(80) NOT NULL,
  `default_type` tinyint(4) NOT NULL,
  `createdAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `customer_group`
--

INSERT INTO `customer_group` (`groupId`, `name`, `default_type`, `createdAt`) VALUES
(1, 'retail', 0, '2021-03-02 15:29:08'),
(2, 'wholesale', 1, '2021-03-02 15:34:34'),
(3, 'other group', 1, '2021-03-10 22:57:37');

-- --------------------------------------------------------

--
-- Table structure for table `payment_method`
--

CREATE TABLE `payment_method` (
  `paymentMethodId` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `code` varchar(60) NOT NULL,
  `description` varchar(150) NOT NULL,
  `status` varchar(20) NOT NULL,
  `createdAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `payment_method`
--

INSERT INTO `payment_method` (`paymentMethodId`, `name`, `code`, `description`, `status`, `createdAt`) VALUES
(2, 'UPI Transfer', 'upit133', 'UPI Transfer Details', '1', '2021-02-17 12:50:19'),
(3, 'Bank Transfer', 'ucobt12', 'UCO bank Transaction', '1', '2021-02-18 12:27:32');

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE `product` (
  `productId` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `sku` varchar(20) NOT NULL,
  `price` varchar(5) NOT NULL,
  `discount` varchar(4) NOT NULL,
  `quantity` varchar(5) NOT NULL,
  `description` varchar(150) NOT NULL,
  `status` varchar(20) NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  `color` varchar(20) DEFAULT NULL,
  `size` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`productId`, `name`, `sku`, `price`, `discount`, `quantity`, `description`, `status`, `createdAt`, `updatedAt`, `color`, `size`) VALUES
(1, 'Maroon Shirt', 'maroonshirt120', '1500', '0', '2', 'Good quality Shirts', '1', '2021-02-25 11:06:47', '2021-03-17 16:57:00', '2', 4),
(10, 'Army Pants', 'pantarmy12', '200', '0', '1', 'Nice quality', '0', '2021-03-13 21:24:41', '2021-03-13 21:24:58', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `product_group_price`
--

CREATE TABLE `product_group_price` (
  `entityId` int(11) NOT NULL,
  `productId` int(11) NOT NULL,
  `customerGroupId` int(11) NOT NULL,
  `price` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `product_group_price`
--

INSERT INTO `product_group_price` (`entityId`, `productId`, `customerGroupId`, `price`) VALUES
(1, 1, 1, '100.00'),
(2, 1, 2, '101.00'),
(3, 1, 3, '100.00');

-- --------------------------------------------------------

--
-- Table structure for table `product_media`
--

CREATE TABLE `product_media` (
  `mediaId` int(11) NOT NULL,
  `productId` int(11) NOT NULL,
  `image` varchar(500) NOT NULL,
  `label` varchar(50) NOT NULL,
  `small` tinyint(2) NOT NULL,
  `thumb` tinyint(2) NOT NULL,
  `base` tinyint(2) NOT NULL,
  `gallery` tinyint(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `product_media`
--

INSERT INTO `product_media` (`mediaId`, `productId`, `image`, `label`, `small`, `thumb`, `base`, `gallery`) VALUES
(11, 1, 'Maroon Shirt(2).jpg', 'Maroon Shirt 2', 1, 0, 0, 1),
(17, 1, 'Maroon Shirt.jpg', 'Picture 2', 0, 0, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `shipping_methods`
--

CREATE TABLE `shipping_methods` (
  `shippingMethodId` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `code` varchar(60) NOT NULL,
  `amount` varchar(6) NOT NULL,
  `description` varchar(150) NOT NULL,
  `status` varchar(20) NOT NULL,
  `createdAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `shipping_methods`
--

INSERT INTO `shipping_methods` (`shippingMethodId`, `name`, `code`, `amount`, `description`, `status`, `createdAt`) VALUES
(3, 'By Order Quantity', 'shipoq123', '60', 'Shipping method is order quantity ', '1', '2021-02-17 13:13:15'),
(4, 'By Location', 'shipl12', '60', 'By Location Shipping ', '1', '2021-02-18 12:41:12');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin_details`
--
ALTER TABLE `admin_details`
  ADD PRIMARY KEY (`adminId`);

--
-- Indexes for table `attribute`
--
ALTER TABLE `attribute`
  ADD PRIMARY KEY (`attributeId`);

--
-- Indexes for table `attribute_option`
--
ALTER TABLE `attribute_option`
  ADD PRIMARY KEY (`optionId`),
  ADD KEY `attributeId` (`attributeId`);

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`categoryId`),
  ADD KEY `parentId` (`parentId`);

--
-- Indexes for table `cms_table`
--
ALTER TABLE `cms_table`
  ADD PRIMARY KEY (`pageId`),
  ADD UNIQUE KEY `identifier` (`identifier`);

--
-- Indexes for table `customer_address`
--
ALTER TABLE `customer_address`
  ADD PRIMARY KEY (`addressId`);

--
-- Indexes for table `customer_details`
--
ALTER TABLE `customer_details`
  ADD PRIMARY KEY (`customerId`);

--
-- Indexes for table `customer_group`
--
ALTER TABLE `customer_group`
  ADD PRIMARY KEY (`groupId`);

--
-- Indexes for table `payment_method`
--
ALTER TABLE `payment_method`
  ADD PRIMARY KEY (`paymentMethodId`);

--
-- Indexes for table `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`productId`);

--
-- Indexes for table `product_group_price`
--
ALTER TABLE `product_group_price`
  ADD PRIMARY KEY (`entityId`);

--
-- Indexes for table `product_media`
--
ALTER TABLE `product_media`
  ADD PRIMARY KEY (`mediaId`);

--
-- Indexes for table `shipping_methods`
--
ALTER TABLE `shipping_methods`
  ADD PRIMARY KEY (`shippingMethodId`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin_details`
--
ALTER TABLE `admin_details`
  MODIFY `adminId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `attribute`
--
ALTER TABLE `attribute`
  MODIFY `attributeId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `attribute_option`
--
ALTER TABLE `attribute_option`
  MODIFY `optionId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
  MODIFY `categoryId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=60;

--
-- AUTO_INCREMENT for table `cms_table`
--
ALTER TABLE `cms_table`
  MODIFY `pageId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `customer_address`
--
ALTER TABLE `customer_address`
  MODIFY `addressId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `customer_details`
--
ALTER TABLE `customer_details`
  MODIFY `customerId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT for table `customer_group`
--
ALTER TABLE `customer_group`
  MODIFY `groupId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `payment_method`
--
ALTER TABLE `payment_method`
  MODIFY `paymentMethodId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `product`
--
ALTER TABLE `product`
  MODIFY `productId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `product_group_price`
--
ALTER TABLE `product_group_price`
  MODIFY `entityId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `product_media`
--
ALTER TABLE `product_media`
  MODIFY `mediaId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `shipping_methods`
--
ALTER TABLE `shipping_methods`
  MODIFY `shippingMethodId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `attribute_option`
--
ALTER TABLE `attribute_option`
  ADD CONSTRAINT `attribute_option_ibfk_1` FOREIGN KEY (`attributeId`) REFERENCES `attribute` (`attributeId`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
