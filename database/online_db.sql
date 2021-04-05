-- phpMyAdmin SQL Dump
-- version 5.0.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 05, 2021 at 01:33 PM
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
(3, 'Vanshika Agarwal', '12345', '1', '2021-03-09 13:50:25'),
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
(1, 'product', 'color', 'color', 'select', 'INT', 1, 'Model\\Attribute\\Option');

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
(10, 'brown', 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `brand`
--

CREATE TABLE `brand` (
  `brandId` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `image` varchar(255) NOT NULL,
  `sortOrder` tinyint(4) NOT NULL,
  `status` tinyint(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `brand`
--

INSERT INTO `brand` (`brandId`, `name`, `image`, `sortOrder`, `status`) VALUES
(1, 'Ashley', 'brand_1_ashley_symbol.png', 1, 1),
(2, 'Homelegance', 'brand_4_homelegance_logo.png', 2, 1),
(3, 'District Eight', 'brand_2_district_eight.png', 3, 1),
(4, 'Lexington', 'brand_3_Lexington-logo.png', 4, 1),
(5, 'Sunpan', 'brand_3_sunpan_logo.png', 5, 1);

-- --------------------------------------------------------

--
-- Table structure for table `cart`
--

CREATE TABLE `cart` (
  `cartId` int(11) NOT NULL,
  `customerId` int(11) NOT NULL,
  `sessionId` varchar(50) NOT NULL,
  `total` decimal(10,2) NOT NULL,
  `discount` decimal(5,2) NOT NULL,
  `paymentMethodId` int(11) NOT NULL,
  `shippingMethodId` int(11) NOT NULL,
  `shippingAmount` decimal(10,2) NOT NULL,
  `createdAt` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `cart`
--

INSERT INTO `cart` (`cartId`, `customerId`, `sessionId`, `total`, `discount`, `paymentMethodId`, `shippingMethodId`, `shippingAmount`, `createdAt`) VALUES
(2, 4, '', '3120.00', '0.00', 8, 6, '50.00', '2021-04-04 22:44:17'),
(3, 3, '', '3540.31', '0.00', 8, 6, '50.00', '2021-04-04 22:47:40');

-- --------------------------------------------------------

--
-- Table structure for table `cart_address`
--

CREATE TABLE `cart_address` (
  `cartAddressId` int(11) NOT NULL,
  `cartId` int(11) NOT NULL,
  `addressId` int(11) NOT NULL,
  `address_type` tinyint(2) NOT NULL,
  `address` varchar(120) NOT NULL,
  `city` varchar(80) NOT NULL,
  `state` varchar(80) NOT NULL,
  `country` varchar(80) NOT NULL,
  `zipcode` int(6) NOT NULL,
  `sameAsBilling` tinyint(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `cart_address`
--

INSERT INTO `cart_address` (`cartAddressId`, `cartId`, `addressId`, `address_type`, `address`, `city`, `state`, `country`, `zipcode`, `sameAsBilling`) VALUES
(1, 1, 0, 2, '42, Shiv Shakti Apartments', 'Surat', 'Gujarat', 'India', 380023, 0),
(2, 1, 0, 1, '42, Shiv Shakti Apartments', 'Surat', 'Gujarat', 'India', 380023, 0),
(3, 2, 0, 2, '24,Sharda Apartment', 'Ahmedabad', 'Gujarat', 'India', 380021, 0),
(4, 2, 0, 1, '24,Sharda Apartment', 'Ahmedabad', 'Gujarat', 'India', 380021, 0),
(5, 3, 0, 2, '42, Shiv Shakti Apartments', 'Surat', 'Gujarat', 'India', 380023, 0),
(6, 3, 0, 1, '42, Shiv Shakti Apartments', 'Surat', 'Gujarat', 'India', 380023, 0);

-- --------------------------------------------------------

--
-- Table structure for table `cart_item`
--

CREATE TABLE `cart_item` (
  `cartItemId` int(11) NOT NULL,
  `cartId` int(11) NOT NULL,
  `productId` int(11) NOT NULL,
  `quantity` int(5) NOT NULL,
  `basePrice` decimal(10,2) NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `discount` decimal(5,2) NOT NULL,
  `createdAt` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `cart_item`
--

INSERT INTO `cart_item` (`cartItemId`, `cartId`, `productId`, `quantity`, `basePrice`, `price`, `discount`, `createdAt`) VALUES
(4, 2, 1, 1, '1963.00', '1963.00', '125.00', '2021-04-04 19:14:20'),
(5, 2, 4, 1, '1157.00', '1157.00', '100.00', '2021-04-04 19:14:24'),
(6, 3, 3, 1, '1154.29', '1154.29', '120.00', '2021-04-04 19:18:25'),
(7, 3, 6, 1, '1148.40', '1148.40', '125.00', '2021-04-04 19:18:29'),
(8, 3, 7, 1, '1237.62', '1237.62', '130.00', '2021-04-04 19:18:30');

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `categoryId` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `description` text NOT NULL,
  `parentId` int(5) NOT NULL,
  `path` varchar(11) NOT NULL,
  `featured` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`categoryId`, `name`, `status`, `description`, `parentId`, `path`, `featured`) VALUES
(1, 'Bedroom', 1, 'Bedroom            ', 0, '1', 0),
(2, 'Living Room', 1, 'Living Room            ', 0, '2', 0),
(3, 'Dining & Kitchen', 1, 'Dining & Kitchen            ', 0, '3', 0),
(4, 'Office', 1, 'Office            ', 0, '4', 0),
(5, 'Bar & Game Room', 1, 'Bar & Game Room            ', 0, '5', 0),
(6, 'Accessories', 1, 'Accessories            ', 0, '6', 0),
(7, 'Outdoor', 1, 'Outdoor            ', 0, '7', 0),
(8, 'Entry & Mudroom', 1, 'Entry & Mudroom            ', 0, '8', 0),
(9, 'Bedroom Sets', 1, 'Bedroom Sets            ', 1, '1-9', 0),
(10, 'Beds', 1, '        Beds                ', 1, '1-10', 1),
(11, 'Nightstands', 1, '                Nightstands\r\n                    ', 1, '1-11', 1),
(12, 'Dressers', 1, '        Dressers\r\n                ', 1, '1-12', 1),
(13, 'Dresser Mirrors', 1, 'Dresser Mirrors\r\n            ', 1, '1-13', 0),
(14, 'Chests', 1, '        Chests\r\n                ', 1, '1-14', 1),
(15, 'Bedroom Benches', 1, '        Bedroom Benches\r\n                ', 1, '1-15', 1),
(16, 'Bed Frames & Headboards', 1, 'Bed Frames & Headboards\r\n            ', 1, '1-16', 0),
(17, 'Armoires and Wardrobes', 1, 'Armoires and Wardrobes\r\n            ', 1, '1-17', 0),
(18, 'Bedroom Vanities', 1, 'Bedroom Vanities\r\n            ', 1, '1-18', 0),
(19, 'Media Chests', 1, '        Media Chests\r\n    ', 1, '1-19', 1),
(20, 'Jewelry Armoires', 1, 'Jewelry Armoires\r\n         ', 1, '1-20', 0),
(21, 'Day Beds and Futons', 1, 'Day Beds and Futons\r\n            ', 1, '1-21', 0),
(22, 'Kids Room', 1, 'Kids Room\r\n            ', 1, '1-22', 0),
(23, 'Kids and Youth Furniture', 1, 'Kids and Youth Furniture\r\n            ', 1, '1-23', 0),
(24, 'Baby Furniture', 1, 'Baby Furniture\r\n            ', 1, '1-24', 0),
(25, 'Mattresses', 1, '        Mattresses\r\n                ', 1, '1-25', 1),
(26, 'Box Springs & Foundations', 1, 'Box Springs & Foundations\r\n            ', 1, '1-26', 0),
(27, 'Adjustable Beds', 1, 'Adjustable Beds\r\n            ', 1, '1-27', 0),
(28, 'Pillows', 1, '        Pillows\r\n                ', 1, '1-28', 1),
(29, 'Bedding and Comforter Sets', 1, '        Bedding and Comforter Sets\r\n                ', 1, '1-29', 1),
(30, 'Living Room Sets', 1, 'Living Room Sets\r\n            ', 2, '2-30', 0),
(31, 'Sectionals', 1, 'Sectionals\r\n            ', 2, '2-31', 0),
(32, 'Sofas', 1, 'Sofas\r\n            ', 2, '2-32', 0),
(33, 'Loveseats', 1, 'Loveseats\r\n            ', 2, '2-33', 0),
(34, 'Reclining Loveseats', 1, 'Reclining Loveseats\r\n            ', 2, '2-34', 0),
(35, 'Sleeper Sofas', 1, 'Sleeper Sofas\r\n            ', 2, '2-35', 0),
(36, 'Recliners and Rockers', 1, 'Recliners and Rockers\r\n            ', 2, '2-36', 0),
(37, 'Theater Seating', 1, 'Theater Seating\r\n            ', 2, '2-37', 0),
(38, 'Chairs', 1, 'Chairs\r\n            ', 2, '2-38', 0),
(39, 'Accent Chairs', 1, 'Accent Chairs\r\n            ', 2, '2-39', 0),
(40, 'Chaises', 1, ' Chaises\r\n           ', 2, '2-40', 0),
(41, 'Ottomans', 1, 'Ottomans\r\n           ', 2, '2-41', 0),
(42, 'Futons', 1, 'Futons\r\n', 2, '2-42', 0),
(43, 'Leather Furniture', 1, 'Leather Furniture\r\n            ', 2, '2-43', 0),
(44, 'Occasional Table Sets', 1, 'Occasional Table Sets\r\n            ', 2, '2-44', 0),
(45, 'Sofa Tables', 1, ' Sofa Tables\r\n           ', 2, '2-45', 0),
(46, 'Accent Chests and Cabinets', 1, 'Accent Chests and Cabinets\r\n            ', 2, '2-46', 0),
(47, 'Console Tables', 1, 'Console Tables\r\n            ', 2, '2-47', 0),
(48, 'Coffee and Cocktail Tables', 1, 'Coffee and Cocktail Tables\r\n            ', 2, '2-48', 0),
(49, 'End Tables', 1, 'End Tables\r\n           ', 2, '2-49', 0),
(50, 'Accent Tables', 1, 'Accent Tables\r\n            ', 2, '2-50', 0),
(51, 'Side Tables', 1, 'Side Tables\r\n            ', 2, '2-51', 0),
(52, 'Rugs and Accessories', 1, 'Rugs and Accessories\r\n            ', 2, '2-52', 0),
(53, 'Entertainment Centers and Walls', 1, 'Entertainment Centers and Walls\r\n            ', 2, '2-53', 0),
(54, 'TV Stands and TV Consoles', 1, 'TV Stands and TV Consoles\r\n            ', 2, '2-54', 0),
(55, 'CD and DVD Media Storage', 1, 'CD and DVD Media Storage\r\n            ', 2, '2-55', 0),
(56, 'Dining Sets', 1, 'Dining Sets\r\n            ', 3, '3-56', 0),
(57, 'Dinette Sets', 1, 'Dinette Sets\r\n            ', 3, '3-57', 0),
(58, 'Dining Chairs', 1, 'Dining Chairs\r\n            ', 3, '3-58', 0),
(59, 'Dining Tables', 1, 'Dining Tables\r\n            ', 3, '3-59', 0),
(60, 'Dining Benches', 1, 'Dining Benches\r\n            ', 3, '3-60', 0),
(61, 'China Cabinets', 1, 'China Cabinets\r\n            ', 3, '3-61', 0),
(62, 'Curios & Displays', 1, 'Curios & Displays\r\n            ', 3, '3-62', 0),
(63, 'Kitchen Island, Kitchen Cart', 1, 'Kitchen Island, Kitchen Cart\r\n           ', 3, '3-63', 0),
(64, 'Servers, Sideboards & Buffets', 1, 'Servers, Sideboards & Buffets\r\n            ', 3, '3-64', 0),
(65, 'Home Office Sets', 1, 'Home Office Sets\r\n            ', 4, '4-65', 0),
(66, 'Office Chairs', 1, 'Office Chairs\r\n            ', 4, '4-66', 0),
(67, 'Desks & Hutches', 1, 'Desks & Hutches\r\n            ', 4, '4-67', 0),
(68, 'Modular Office Furniture', 1, 'Modular Office Furniture\r\n            ', 4, '4-68', 0),
(69, 'Conference Room', 1, 'Conference Room\r\n', 4, '4-69', 0),
(70, 'Filing Cabinets and Storage', 1, 'Filing Cabinets and Storage\r\n            ', 4, '4-70', 0),
(71, 'Bookcases, Book Shelves', 1, 'Bookcases, Book Shelves\r\n            ', 4, '4-71', 0),
(72, 'Office Accessories', 1, 'Office Accessories\r\n            ', 4, '4-72', 0),
(73, 'Miscellaneous', 1, 'Miscellaneous\r\n            ', 4, '4-73', 0),
(74, 'Home Bar Sets', 1, 'Home Bar Sets\r\n            ', 5, '5-74', 0),
(75, 'Bistro and Bar Table Sets', 1, 'Bistro and Bar Table Sets\r\n            ', 5, '5-75', 0),
(76, 'Game Table Sets', 1, 'Game Table Sets\r\n            ', 5, '5-76', 0),
(77, 'Bar Tables and Pub Tables', 1, 'Bar Tables and Pub Tables\r\n            ', 5, '5-77', 0),
(78, 'Barstools', 1, 'Barstools\r\n            ', 5, '5-78', 0),
(79, 'Wine Racks', 1, 'Wine Racks\r\n            ', 5, '5-79', 0),
(80, 'Game Tables', 1, ' Game Tables\r\n           ', 5, '5-80', 0),
(81, 'Game Room Chairs', 1, 'Game Room Chairs\r\n           ', 5, '5-81', 0),
(82, 'Bar and Wine Cabinets', 1, 'Bar and Wine Cabinets\r\n            ', 5, '5-82', 0),
(83, 'Rugs', 1, 'Rugs\r\n            ', 6, '6-83', 0),
(84, 'Wall Art', 1, 'Wall Art\r\n            ', 6, '6-84', 0),
(85, 'Accent and Storage Benches', 1, 'Accent and Storage Benches\r\n            ', 6, '6-85', 0),
(86, 'Accent Mirrors', 1, 'Accent Mirrors\r\n            ', 6, '6-86', 0),
(87, 'Curios', 1, 'Curios\r\n            ', 6, '6-87', 0),
(88, 'Pillows and Throws', 1, 'Pillows and Throws\r\n            ', 6, '6-88', 0),
(89, 'Decorative Accessories', 1, 'Decorative Accessories\r\n            ', 6, '6-89', 0),
(90, 'Entryway Furniture', 1, 'Entryway Furniture\r\n            ', 6, '6-90', 0),
(91, 'Storage and Organization', 1, 'Storage and Organization\r\n            ', 6, '6-91', 0),
(92, 'Etageres', 1, 'Etageres\r\n            ', 6, '6-92', 0),
(93, 'Clocks', 1, 'Clocks\r\n            ', 6, '6-93', 0),
(94, 'Artificial Plants', 1, 'Artificial Plants\r\n            ', 6, '6-94', 0),
(95, 'Picture Frames', 1, 'Picture Frames\r\n            ', 6, '6-95', 0),
(96, 'Lighting', 1, 'Lighting\r\n            ', 6, '6-96', 0),
(97, 'Desk and Buffet Lamps', 1, 'Desk and Buffet Lamps\r\n            ', 6, '6-97', 0),
(98, 'Lamp Sets', 1, 'Lamp Sets\r\n            ', 6, '6-98', 0),
(99, 'Floor Lamps', 1, 'Floor Lamps\r\n            ', 6, '6-99', 0),
(100, 'Pendant Lighting', 1, 'Pendant Lighting\r\n            ', 6, '6-100', 0),
(101, 'Wall Sconces', 1, 'Wall Sconces\r\n            ', 6, '6-101', 0),
(102, 'Bathroom Furniture', 1, 'Bathroom Furniture\r\n            ', 6, '6-102', 0),
(103, 'Outdoor Conversation Sets', 1, 'Outdoor Conversation Sets\r\n            ', 7, '7-103', 0),
(104, 'Outdoor Dining Furniture', 1, 'Outdoor Dining Furniture\r\n            ', 7, '7-104', 0),
(105, 'Outdoor Tables', 1, 'Outdoor Tables\r\n            ', 7, '7-105', 0),
(106, 'Outdoor Chairs', 1, 'Outdoor Chairs\r\n            ', 7, '7-106', 0),
(107, 'Outdoor Sofas & Loveseats', 1, 'Outdoor Sofas & Loveseats            ', 7, '7-107', 0),
(108, 'Outdoor Chaise Loungers', 1, 'Outdoor Chaise Loungers\r\n            ', 7, '7-108', 0),
(109, 'Outdoor Bar Furniture', 1, 'Outdoor Bar Furniture\r\n            ', 7, '7-109', 0),
(110, 'Outdoor Accessories', 1, 'Outdoor Accessories\r\n            ', 7, '7-110', 0),
(111, 'Outdoor Fireplaces', 1, 'Outdoor Fireplaces\r\n            ', 7, '7-111', 0),
(112, 'Outdoor Benches', 1, 'Outdoor Benches\r\n            ', 7, '7-112', 0),
(113, 'Outdoor Ottomans', 1, 'Outdoor Ottomans\r\n            ', 7, '7-113', 0),
(114, 'Console Tables', 1, 'Console Tables\r\n            ', 8, '8-114', 0),
(115, 'Storage Benches', 1, 'Storage Benches\r\n            ', 8, '8-115', 0),
(116, 'Hall Trees', 1, 'Hall Trees\r\n            ', 8, '8-116', 0),
(117, 'Coat Racks', 1, 'Coat Racks\r\n            ', 8, '8-117', 0),
(123, 'Outdoor', 1, '', 0, '123', 1);

-- --------------------------------------------------------

--
-- Table structure for table `category_media`
--

CREATE TABLE `category_media` (
  `mediaId` int(11) NOT NULL,
  `categoryId` int(11) NOT NULL,
  `image` varchar(255) NOT NULL,
  `icon` tinyint(4) NOT NULL,
  `base` tinyint(4) NOT NULL,
  `banner` tinyint(4) NOT NULL,
  `active` tinyint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `category_media`
--

INSERT INTO `category_media` (`mediaId`, `categoryId`, `image`, `icon`, `base`, `banner`, `active`) VALUES
(1, 10, 'category_6_beds.jpg', 1, 0, 0, 0),
(2, 11, 'category_1_nightstand.jpg', 1, 0, 0, 0),
(3, 12, 'category_3_dressers.jpg', 1, 0, 0, 0),
(4, 13, 'category_4_dresser_mirror.jpg', 1, 0, 0, 0),
(5, 14, 'category_3_chests.jpg', 1, 0, 0, 0),
(6, 15, 'category_4_bedroom_benches.jpg', 1, 0, 0, 0),
(7, 16, 'category_3_bed_frames_headboard.jpg', 1, 0, 0, 0),
(8, 17, 'category_4_armoires_wardrobes.jpg', 1, 0, 0, 0),
(9, 19, 'category_4_media_chest.jpg', 1, 0, 0, 0),
(10, 25, 'category_2_mattress.jpg', 1, 0, 0, 0),
(11, 28, 'category_6_pillows.jpg', 0, 1, 0, 1),
(12, 29, 'category_3_bedding_comforter_sets.jpg', 1, 0, 0, 1);

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
(1, 'Contact Us', 101, '<b><span style=\"font-family: &quot;Arial Black&quot;;\">Contact Us</span></b>', 0, '2021-03-13 16:44:22'),
(7, 'About Us', 102, '<b>About Us</b>', 0, '2021-03-13 16:58:14'),
(12, 'Error Page', 103, '<p><b>404 Page Not Found</b></p>', 1, '2021-03-31 09:27:12');

-- --------------------------------------------------------

--
-- Table structure for table `config`
--

CREATE TABLE `config` (
  `configId` int(11) NOT NULL,
  `groupId` int(11) NOT NULL,
  `title` varchar(120) NOT NULL,
  `code` varchar(120) NOT NULL,
  `value` varchar(120) NOT NULL,
  `createdAt` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `config`
--

INSERT INTO `config` (`configId`, `groupId`, `title`, `code`, `value`, `createdAt`) VALUES
(1, 3, 'site name', 'site_name', 'Questecom', '2021-04-05 13:16:00');

-- --------------------------------------------------------

--
-- Table structure for table `config_group`
--

CREATE TABLE `config_group` (
  `groupId` int(11) NOT NULL,
  `name` varchar(120) NOT NULL,
  `createdAt` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `config_group`
--

INSERT INTO `config_group` (`groupId`, `name`, `createdAt`) VALUES
(3, 'general', '2021-04-05 13:14:54');

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
(6, 5, '			        42, Nehru Park Society			    ', 'Ahmedabad', 'Gujarat', '380022', 'India', '1'),
(7, 28, '45, Shiv Shakti Apartments', 'Ahmedabad', 'Gujarat', '380022', 'India', '2'),
(8, 28, '45, Shiv Shakti Apartments', 'Ahmedabad', 'Gujarat', '380022', 'India', '1'),
(14, 5, '42, Nehru Park Society', 'Ahmedabad', 'Gujarat', '380021', 'India', '2');

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
(4, 'Akash', 'Panchal', 'akashpanchal54@gmail.com', '', '8745963221', '0', '2021-02-16 21:50:30', '2021-04-01 09:14:34', 1),
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
-- Table structure for table `order_address`
--

CREATE TABLE `order_address` (
  `orderAddressId` int(11) NOT NULL,
  `orderId` int(11) NOT NULL,
  `addressId` int(11) NOT NULL,
  `address_type` tinyint(2) NOT NULL,
  `address` varchar(120) NOT NULL,
  `city` varchar(80) NOT NULL,
  `state` varchar(80) NOT NULL,
  `country` varchar(80) NOT NULL,
  `zipcode` int(6) NOT NULL,
  `sameAsBilling` tinyint(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `order_address`
--

INSERT INTO `order_address` (`orderAddressId`, `orderId`, `addressId`, `address_type`, `address`, `city`, `state`, `country`, `zipcode`, `sameAsBilling`) VALUES
(1, 1, 0, 2, '42, Shiv Shakti Apartments', 'Surat', 'Gujarat', 'India', 380023, 0),
(2, 1, 0, 1, '42, Shiv Shakti Apartments', 'Surat', 'Gujarat', 'India', 380023, 0),
(3, 2, 0, 2, '42, Shiv Shakti Apartments', 'Surat', 'Gujarat', 'India', 380023, 0),
(4, 2, 0, 1, '42, Shiv Shakti Apartments', 'Surat', 'Gujarat', 'India', 380023, 0),
(5, 3, 0, 2, '42, Shiv Shakti Apartments', 'Surat', 'Gujarat', 'India', 380023, 0),
(6, 3, 0, 1, '42, Shiv Shakti Apartments', 'Surat', 'Gujarat', 'India', 380023, 0),
(7, 4, 0, 2, '42, Shiv Shakti Apartments', 'Surat', 'Gujarat', 'India', 380023, 0),
(8, 4, 0, 1, '42, Shiv Shakti Apartments', 'Surat', 'Gujarat', 'India', 380023, 0);

-- --------------------------------------------------------

--
-- Table structure for table `order_item`
--

CREATE TABLE `order_item` (
  `orderItemId` int(11) NOT NULL,
  `orderId` int(11) NOT NULL,
  `productId` int(11) NOT NULL,
  `quantity` int(5) NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `discount` decimal(5,2) NOT NULL,
  `createdAt` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `order_item`
--

INSERT INTO `order_item` (`orderItemId`, `orderId`, `productId`, `quantity`, `price`, `discount`, `createdAt`) VALUES
(1, 1, 3, 1, '1154.29', '120.00', '2021-04-04 19:19:40'),
(2, 1, 6, 1, '1148.40', '125.00', '2021-04-04 19:19:40'),
(3, 1, 7, 1, '1237.62', '130.00', '2021-04-04 19:19:40'),
(4, 2, 3, 1, '1154.29', '120.00', '2021-04-04 19:24:09'),
(5, 2, 6, 1, '1148.40', '125.00', '2021-04-04 19:24:09'),
(6, 2, 7, 1, '1237.62', '130.00', '2021-04-04 19:24:09'),
(7, 3, 3, 1, '1154.29', '120.00', '2021-04-04 19:27:43'),
(8, 3, 6, 1, '1148.40', '125.00', '2021-04-04 19:27:43'),
(9, 3, 7, 1, '1237.62', '130.00', '2021-04-04 19:27:44'),
(10, 4, 3, 1, '1154.29', '120.00', '2021-04-04 20:33:18'),
(11, 4, 6, 1, '1148.40', '125.00', '2021-04-04 20:33:18'),
(12, 4, 7, 1, '1237.62', '130.00', '2021-04-04 20:33:19');

-- --------------------------------------------------------

--
-- Table structure for table `order_table`
--

CREATE TABLE `order_table` (
  `orderId` int(11) NOT NULL,
  `customerId` int(11) NOT NULL,
  `discount` decimal(5,2) NOT NULL,
  `total` decimal(10,2) NOT NULL,
  `shippingMethodId` int(11) NOT NULL,
  `paymentMethodId` int(11) NOT NULL,
  `shippingAmount` decimal(10,2) NOT NULL,
  `createdAt` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `order_table`
--

INSERT INTO `order_table` (`orderId`, `customerId`, `discount`, `total`, `shippingMethodId`, `paymentMethodId`, `shippingAmount`, `createdAt`) VALUES
(1, 3, '0.00', '3540.31', 6, 8, '50.00', '2021-04-04 22:49:40'),
(2, 3, '0.00', '3540.31', 6, 8, '50.00', '2021-04-04 22:54:09'),
(3, 3, '0.00', '3540.31', 6, 8, '50.00', '2021-04-04 22:57:43'),
(4, 3, '0.00', '3540.31', 6, 8, '50.00', '2021-04-05 00:03:17');

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
(7, 'Credit Card', 'creditecard1', 'For paying using credit card', '1', '2021-03-27 15:20:45'),
(8, 'Debit Card', 'debitcard2', 'For paying using debit card', '1', '2021-03-27 15:27:09'),
(9, 'UPI ', 'upi3', 'For paying using any upi', '0', '2021-03-27 15:27:30'),
(10, 'Cash On Delivery', 'cod4', 'For paying cash after receiving the order  ', '1', '2021-03-27 09:10:00');

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE `product` (
  `productId` int(11) NOT NULL,
  `name` varchar(150) NOT NULL,
  `sku` varchar(20) NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `discount` decimal(10,2) NOT NULL,
  `quantity` varchar(5) NOT NULL,
  `description` varchar(150) NOT NULL,
  `status` varchar(20) NOT NULL,
  `createdAt` datetime NOT NULL DEFAULT current_timestamp(),
  `updatedAt` datetime NOT NULL DEFAULT current_timestamp(),
  `color` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`productId`, `name`, `sku`, `price`, `discount`, `quantity`, `description`, `status`, `createdAt`, `updatedAt`, `color`) VALUES
(1, 'Birlanny Silver Upholstered Panel Bedroom Set', 'B720-57-54-96;B720-9', '1963.00', '125.00', '50', 'Lose yourself in luxury with this Brilanny Silver Upholstered Panel Bedroom Set, created by the master furniture crafters of Signature Design by Ashle', '', '2021-03-20 22:17:51', '2021-03-22 12:26:14', NULL),
(3, 'Bolanburg White Louvered Panel Bedroom Set', 'B647-54-77-96;B647-1', '1154.29', '120.00', '30', 'This Queen, King, or California King Bolanburg White Louvered Panel Bedroom Set provides casual comfort and long wearing style. The shelter-style pane', '', '2021-03-20 22:17:51', '2021-03-20 22:17:51', NULL),
(4, 'Bolanburg White Panel Bedroom Set', 'B647-54-57-96;B647-1', '1157.00', '100.00', '40', 'The creamy white antique finish of the Bolanburg White Panel Bedroom Set creates a bright, cheery scene. A part of the Bolanburg Collection, this bedr', '', '2021-03-20 22:17:51', '2021-03-20 22:17:51', NULL),
(5, 'Lettner Light Gray Panel Storage Bedroom Set', 'B733-92;B733-QSPNLBE', '1036.34', '95.00', '35', 'This Lettner Light Gray Panel Storage Bedroom Set offers comfort, convenience, and durability all on one beautiful package. Crafted from select birch ', '', '2021-03-20 22:17:51', '2021-03-20 22:17:51', NULL),
(6, 'Lettner Light Gray Panel Bedroom Set', 'B733-57-54-96;B733-9', '1148.40', '125.00', '45', 'The Lettner Light Gray Panel Bedroom Set has an uncomplicated casual style and a pleasingly burnished light gray color for a calming bedroom environme', '', '2021-03-20 22:17:51', '2021-03-20 22:17:51', NULL),
(7, 'Magnolia Manor Antique White Upholstered Panel Bedroom Set', '244-BR-QUB;244-BR63', '1237.62', '130.00', '27', 'The transitional style of the Magnolia Manor Antique White Upholstered Panel Bedroom Set marries traditional and contemporary elements for a unique ap', '', '2021-03-20 22:17:51', '2021-03-20 22:17:51', NULL),
(8, 'Mirage Panel Bedroom Set', '946-BR-QPB;946-BR61', '1147.03', '111.00', '28', 'Contemporary living is highlighted by a design that conveys energy and imagination while silhouettes create a simplistic statement to any room. From r', '', '2021-03-20 22:17:51', '2021-03-20 22:17:51', NULL),
(9, 'Cassimore Pearl Silver Panel Bedroom Set', 'B750-57-54-96', '2568.58', '225.00', '20', 'This Cassimore North Shore Pearl Silver Panel Bedroom Set is just one of many furniture options in the Cassimore Collection from Signature Design by A', '', '2021-03-20 22:17:52', '2021-03-20 22:17:52', NULL),
(10, 'Cassimore North Shore Pearl Silver Panel Bedroom Set', 'B750-57-54-97', '2251.48', '210.00', '25', 'The pearl silver finish of the Cassimore Pearl Silver Panel Bedroom Set bathes your bedroom in pure, regal splendor. Bright nickel hardware has eye-ca', '', '2021-03-20 22:17:52', '2021-03-20 22:17:52', NULL),
(11, 'Birlanny Silver Upholstered Panel Bed', 'B720-570-54-96', '1496.00', '140.00', '25', 'Part of Birlanny Collection\nCrafted from ash swirl and birch veneers and select hardwood solids\nSilver toned finish\nSubtle glazing effects\nLarge and i', '', '2021-03-20 22:17:52', '2021-03-20 22:17:52', NULL),
(12, 'Lettner Light Gray Sleigh Bed', 'B733-77-74-98', '781.59', '75.00', '50', 'Part of Lettner Collection from Ashley\nCrafted fom select birch veneers and hardwood solids\nBurnished light gray finish\nStorage footboard\nOptional Nig', '', '2021-03-20 22:17:52', '2021-03-20 22:17:52', NULL),
(13, 'Bolanburg White Queen Louvered Panel Bed', 'B647-54-77-96', '859.05', '80.00', '45', 'Part of Bolanburg Collection\nCrafted from acacia veneers and solids\nTextured antique white finish\nShelter style panel bed\nLouvered design\nOptional nig', '', '2021-03-20 22:17:52', '2021-03-20 22:17:52', NULL),
(14, 'Magnolia Manor Antique White Queen Upholstered Panel Bed', '244-BR-QUB', '1016.24', '102.00', '25', 'Part of Magnolia Manor Collection\nCrafted from poplar solids and white oak veneer tops with birch veneer fronts\nAntique white finish\nBead molding\nRoun', '', '2021-03-20 22:17:52', '2021-03-20 22:17:52', NULL),
(15, 'Farmhouse Reimagined Antique White Poster Bed', '652-BR-QPS', '972.05', '95.00', '24', 'Wood:Pine Solids with Hickory and Pine Veneers\nFinish:Antique White Finish with Chestnut Tops', '', '2021-03-20 22:17:52', '2021-03-20 22:17:52', NULL),
(16, 'Bolanburg White Panel Bed', 'B647-54-57-96', '859.01', '85.00', '29', 'Part of Bolanburg Collection\nCrafted from acacia veneers and solids\nTextured antique white finish\nShelter style panel headboard\nLattice design\nOptiona', '', '2021-03-20 22:17:52', '2021-03-20 22:17:52', NULL),
(17, 'Trudell Dark Brown Queen Panel Bed', 'B658-54-57-96', '674.05', '65.00', '25', 'Part of Trudell Collection\nCrafted from solid Pine wood\nWeathered golden-brown finish\nSubtle wire brushing\nNatural distressing\nOptional Nightstand\nBed', '', '2021-03-20 22:17:52', '2021-03-20 22:17:52', NULL),
(18, 'Ashley Furniture Lettner Panel Storage Bed', 'B733-QSPNLBED', '788.65', '75.00', '26', 'Made with select Birch veneers and hardwood solids.\nBurnished light gray finish.\nDrawers feature a silver-tone patina color knob and back plate.\nDovet', '', '2021-03-20 22:17:52', '2021-03-20 22:17:52', NULL),
(19, 'Lettner Light Gray Panel Bed', 'B733-57-54-96', '581.70', '58.00', '50', 'Part of Lettner Collection from Ashley\nCrafted fom select birch veneers and hardwood solids\nBurnished light gray finish\nOptional Nightstand\nBox Spring', '', '2021-03-20 22:17:52', '2021-03-20 22:17:52', NULL),
(20, 'Flynnter Porter Medium Brown King Sleigh Storage Bed', 'B719-78-76-99', '1109.70', '109.00', '45', 'Part of Flynnter Collection from Ashley Furniture\nCrafted from acacia veneers, engineered board and hardwood solids\nMedium brown finish\nStorage footbo', '', '2021-03-20 22:17:52', '2021-03-20 22:17:52', NULL),
(21, 'Lettner Light Gray 2 Drawer Nightstand', 'B733-92', '394.78', '40.00', '75', 'B750-36+A46', '', '2021-03-20 22:17:52', '2021-03-20 22:17:52', NULL),
(22, 'Bolanburg Two Tone One Drawer Nightstand', 'B647-191', '284.05', '28.00', '90', 'Made of veneers, wood and engineered wood\nTwo-tone finish (weathered oak top over antique white)\nPlank-style top\n1 smooth-gliding, felt-lined drawer w', '', '2021-03-20 22:17:52', '2021-03-20 22:17:52', NULL),
(23, 'North Shore Nightstand', 'B553-193', '640.61', '64.00', '55', 'Assembly required\nAntiqued goldtone hardware\n3 drawers\nMarble inlay top\nTop drawer with felt bottom\nMade of veneers, wood, engineered wood, cast resin', '', '2021-03-20 22:17:52', '2021-03-20 22:17:52', NULL),
(24, 'Flynnter Medium Brown 2 Drawer Nightstand', ' B719-93', '384.27', '35.00', '85', 'Made of wood, engineered wood and veneers\nAged brass-tone knob hardware\n2 smooth-gliding drawers with dovetail construction (pull-out tray and top dra', '', '2021-03-20 22:17:52', '2021-03-20 22:17:52', NULL),
(25, 'Flynnter Porter Medium Brown 2 Drawer Nightstand', 'B719-92', '386.21', '35.00', '75', 'Made of wood, engineered wood and veneers\nAged brass-tone knob hardware\n2 smooth-gliding drawers with dovetail construction (pull-out tray and top dra', '', '2021-03-20 22:17:52', '2021-03-20 22:17:52', NULL),
(26, 'Birlanny Silver 2 Drawer Nightstand', 'B720-92', '364.22', '35.00', '65', 'Made of ash and birch veneers, wood and engineered wood\nSilvertone finish with subtle glazing effects\nSilvertone hardware\n2 smooth-operating drawers (', '', '2021-03-20 22:17:52', '2021-03-20 22:17:52', NULL),
(27, 'Cassimore North Shore Pearl Silver and Dark Brown 3 Drawer Nightstand', 'B750-93', '1062.52', '105.00', '52', 'Made of wood, engineered wood, veneers and cast resin\nMarble parquetry top\nAntique mirror insets\nNickel-tone hardware with faux crystal inserts\n3 smoo', '', '2021-03-20 22:17:53', '2021-03-20 22:17:53', NULL),
(28, 'Cassimore Pearl Silver and Dark Brown 3 Drawer Nightstand', 'B750-94', '1062.52', '105.00', '45', 'Made of wood, engineered wood, veneers and cast resin\nMarble parquetry top\nAntique mirror insets\nNickel-tone hardware with faux crystal inserts\n3 smoo', '', '2021-03-20 22:17:53', '2021-03-20 22:17:53', NULL),
(29, 'Caitbrook Gray Two Drawer Nightstand', 'B476-92', '201.81', '20.00', '75', 'Made of wood, veneers and engineered wood\nDrawers with contoured fronts\nLinear metal drawer pulls in bright nickel-tone finish\n2 smooth-operating draw', '', '2021-03-20 22:17:53', '2021-03-20 22:17:53', NULL),
(30, 'Mirage Nightstand', '946-BR61', '544.77', '50.00', '65', 'Rubberwood solids w/White Oak veneers\nWirebrushed White finish\nCenter floating style faux Travertine inserts\nSatin nickel bar pull hardware\nFull exten', '', '2021-03-20 22:17:53', '2021-03-20 22:17:53', NULL),
(31, 'Bolanburg Two Tone Dresser', 'B647-131', '877.09', '85.00', '26', 'Dresser only\nMade of veneers, wood and engineered wood\nTwo-tone finish (weathered oak top over antique white)\nPlank-style top\n9 smooth-gliding drawers', '', '2021-03-20 22:17:53', '2021-03-20 22:17:53', NULL),
(32, 'Lettner Light Gray Dresser', 'B733-31', '751.13', '75.00', '52', 'Dresser only\nMade of veneers, wood and engineered wood\nSilvertone patina hardware\n7 smooth-gliding drawers with dovetail construction\nTop drawers felt', '', '2021-03-20 22:17:53', '2021-03-20 22:17:53', NULL),
(33, 'Birlanny Silver Dresser', 'B720-31', '1178.52', '115.00', '35', 'Dresser only\nMade of solid and engineered wood\nSilvertone finish with subtle glazing effects\nMirrored accents\nSilvertone hardware\n6 smooth-operating d', '', '2021-03-20 22:17:53', '2021-03-20 22:17:53', NULL),
(34, 'North Shore Dresser', 'B553-131', '1144.30', '115.00', '30', 'Dresser only\nMade of veneers, wood, engineered wood, cast resin and marble parquetry\nMarble inlay top\nAntiqued goldtone hardware\nFaux keyhole\nSerpenti', '', '2021-03-20 22:17:54', '2021-03-20 22:17:54', NULL),
(35, 'Cassimore Pearl Silver and Dark Brown Dresser', 'B750-31', '1847.00', '185.00', '42', 'Dresser only\nMade of wood, engineered wood, veneers and cast resin\nMarble parquetry top\nAntique mirror insets\nNickel-tone hardware with faux crystal i', '', '2021-03-20 22:17:54', '2021-03-20 22:17:54', NULL),
(36, 'Cassimore North Shore Pearl Silver and Dark Brown Dresser', 'B750-32', '1846.97', '185.00', '38', 'Dresser only\nMade of wood, engineered wood, veneers and cast resin\nMarble parquetry top\nAntique mirror insets\nNickel-tone hardware with faux crystal i', '', '2021-03-20 22:17:54', '2021-03-20 22:17:54', NULL),
(37, 'Caitbrook Gray Dresser', 'B476-31', '746.39', '75.00', '56', 'Dresser only\nMade of wood, veneers and engineered wood\nDrawers with contoured fronts\nLinear metal drawer pulls in bright nickel-tone finish\n7 smooth-o', '', '2021-03-20 22:17:54', '2021-03-20 22:17:54', NULL),
(38, 'Realyn Two Tone Dresser', 'B743-31', '786.16', '75.00', '45', 'Dresser only\nMade of wood, engineered wood and veneers, with cast resin components\nAntiqued two-tone finish\nDark bronze-tone finished metal hardware\n7', '', '2021-03-20 22:17:54', '2021-03-20 22:17:54', NULL),
(39, 'Flynnter Medium Brown Dresser', 'B719-32', '752.26', '75.00', '52', 'Dresser only\nMade of wood, engineered wood and veneers\nAged brass-tone knob hardware\n7 smooth-gliding drawers with dovetail construction (top drawers ', '', '2021-03-20 22:17:55', '2021-03-20 22:17:55', NULL),
(40, 'Flynnter Porter Medium Brown Dresser', 'B719-31', '833.20', '80.00', '43', 'Dresser only\nMade of wood, engineered wood and veneers\nAged brass-tone knob hardware\n7 smooth-gliding drawers with dovetail construction (top drawers ', '', '2021-03-20 22:17:55', '2021-03-20 22:17:55', NULL),
(41, 'Lettner Light Gray Bedroom Mirror', 'B733-36+A41:A44', '287.44', '30.00', '85', 'Part of Lettner Collection from Ashley\nCrafted fom select birch veneers and hardwood solids\nBurnished light gray finish\nBeveled glass', '', '2021-03-20 22:17:55', '2021-03-20 22:17:55', NULL),
(42, 'Bolanburg White Bedroom Mirror', 'B647-36', '289.02', '30.00', '65', 'Bolanburg Collection by Ashley Furniture\nWhite finish\nMade with acacia veneers and solids\nFrench and Englisg dovetailed drawers\nFull finished drawer b', '', '2021-03-20 22:17:55', '2021-03-20 22:17:55', NULL),
(43, 'Magnolia Manor Antique White Mirror', '244-BR51', '444.77', '45.00', '65', 'Part of Magnolia Manor Collection\nCrafted from poplar solids and white oak veneer tops with birch veneer fronts\nAntique white finish\nBead molding\nScro', '', '2021-03-20 22:17:55', '2021-03-20 22:17:55', NULL),
(44, 'Cassimore North Shore Pearl Silver Bedroom Mirror', 'B750-36', '619.42', '60.00', '45', 'Part of Cassimore Collection\nPearl silver finish\nBeveled glass', '', '2021-03-20 22:17:56', '2021-03-20 22:17:56', NULL),
(45, 'Cassimore Pearl Silver Bedroom Mirror', 'B750-37', '619.42', '60.00', '55', 'Part of Cassimore Collection\nPearl silver finish\nBeveled glass', '', '2021-03-20 22:17:56', '2021-03-20 22:17:56', NULL),
(46, 'Summer House Oyster White Mirror', '607-BR51', '407.99', '40.00', '58', 'Part of Summer House Oyster White Collection\nOyster White Finish\nCrafted from Poplar & Pine Solids with Wood Products\nArched Crown Molding', '', '2021-03-20 22:17:56', '2021-03-20 22:17:56', NULL),
(47, 'Birlanny Silver Bedroom Mirror', 'B720-36', '316.76', '30.00', '51', 'Birlanny Collection by Ashley Furniture\nSilver finish\nMade with ash swirl and birch veneers and select hardwood solids\nDimensions: 46\" H x 48\" W x 3\" ', '', '2021-03-20 22:17:56', '2021-03-20 22:17:56', NULL),
(48, 'Cotswold Brown Landscape Mirror', '545-BR52', '453.03', '45.00', '45', 'Part of Cotswold Collection\nCinnamon Finish\nCrafted from Poplar Solids and Cherry Veneers\nFelt Lined Top Drawers\nSerpentine Shaped Cases\nScalloped Acc', '', '2021-03-20 22:17:56', '2021-03-20 22:17:56', NULL),
(49, 'North Shore Mirror', 'B553-36', '396.58', '40.00', '42', 'Premium hardwood construction and luxurious dark finish\nBright luminous mirror with beveled edges for beauty and stability\nSpiral pilasters with intri', '', '2021-03-20 22:17:56', '2021-03-20 22:17:56', NULL),
(50, 'Caitbrook Gray Bedroom Mirror', 'B476-36', '259.77', '25.00', '45', 'Part Of Caitbrook Collection From Ashley\nCrafted from select wood solids, veneers and engineered wood\nGray finish', '', '2021-03-20 22:17:56', '2021-03-20 22:17:56', NULL),
(51, 'Bolanburg Two Tone Five Drawer Chest', 'B647-146', '813.59', '80.00', '45', 'Made of veneers, wood and engineered wood\nTwo-tone finish (weathered oak top over antique white)\nPlank-style top\n5 smooth-gliding drawers with dovetai', '', '2021-03-20 22:17:56', '2021-03-20 22:17:56', NULL),
(52, 'Lettner Light Gray 5 Drawer Chest', 'B733-46', '678.77', '60.00', '53', 'Made of veneers, wood and engineered wood\nSilvertone patina hardware\n5 smooth-gliding drawers with dovetail construction\nTop drawer felt-lined\nSmall S', '', '2021-03-20 22:17:56', '2021-03-20 22:17:56', NULL),
(53, 'Birlanny Silver 5 Drawer Chest', 'B720-46', '1032.36', '100.00', '42', 'Made of solid and engineered wood\nSilvertone finish with subtle glazing effects\nSilvertone hardware\n5 smooth-operating drawers\nTop drawer lined with f', '', '2021-03-20 22:17:56', '2021-03-20 22:17:56', NULL),
(54, 'North Shore Chest', 'B553-46', '930.98', '95.00', '52', 'Made of veneers, wood, engineered wood and cast resin\nAntiqued goldtone hardware\n5 drawers\nSmall Space Solution\nIncludes tipover restraint device', '', '2021-03-20 22:17:56', '2021-03-20 22:17:56', NULL),
(55, 'Magnolia Manor Antique White 5 Drawer Chest', '244-BR41', '859.58', '85.00', '20', 'Part of Magnolia Manor Collection\nCrafted from poplar solids and white oak veneer tops with birch veneer fronts\nAntique white finish\nFull extension me', '', '2021-03-20 22:17:56', '2021-03-20 22:17:56', NULL),
(56, 'Summer House Oyster White 5 Drawer Chest', '607-BR41', '753.96', '75.00', '35', 'Part of Summer House Oyster White Collection\nOyster White Finish\nCrafted from Poplar & Pine Solids with Wood Products\nFrench & English Dovetail Constr', '', '2021-03-20 22:17:56', '2021-03-20 22:17:56', NULL),
(57, 'North Shore Upholstered Bench', 'B553-09', '495.95', '50.00', '65', 'Corner-blocked frame\nAssembly required\nFrame made of veneers, engineered wood, resin and polyurethane\nCushioned seat\nExposed wood-color stain frame', '', '2021-03-20 22:17:57', '2021-03-20 22:17:57', NULL),
(58, 'Summer House Oyster White Bench', '607-C9001B', '251.99', '25.00', '42', 'Part of Summer House Oyster White Collection\nCrafted from Poplar/Pine Solids w/ Wood Products\nOyster White Finish\nUpholstered in Linen\nTurned Legs', '', '2021-03-20 22:17:57', '2021-03-20 22:17:57', NULL),
(59, 'Farmhouse Reimagined Antique White Uph Bench', '652-C9001B', '347.25', '35.00', '56', 'Finish Features Heavy Wire Brush and Distressing\nTapered Legs\nPlanked Panels\nUpholstered in Khaki Linen\nFloor to Bench Clearance: 15\"', '', '2021-03-20 22:17:57', '2021-03-20 22:17:57', NULL),
(60, 'Upholstered Bed Bench', '100-BR47', '531.48', '55.00', '42', 'Natural Linen Fabric\nSoft Contemporary Design\nTapered Block Feet in Kaffe Finish\nHeadboards Work with Bed Frame\nMeets Flammability Requirements of CA ', '', '2021-03-20 22:17:57', '2021-03-20 22:17:57', NULL),
(61, 'Gibbons Cream and Espresso Bench with Silver Nailhead Detail', 'MCR4614B', '340.45', '35.00', '52', 'Luxurious at the foot of a bed or topped with a tray for use as a living room table, the Gibbons Bench is a contemporary designer classic. Cream leath', '', '2021-03-20 22:17:57', '2021-03-20 22:17:57', NULL),
(62, 'Minimalist Black Velvet Bench', '174Black', '188.69', '20.00', '35', 'Soft Black Velvet\nMinimalist Bench\nContmporary Design', '', '2021-03-20 22:17:57', '2021-03-20 22:17:57', NULL),
(63, 'Birlanny Silver Queen Upholstered Panel Headboard', 'B720-571', '858.69', '90.00', '54', 'Made with Ash Swirl and Birch veneers and select hardwood solids, finished in a silver toned color with subtle glazing effects to bring out dimension.', '', '2021-03-20 22:17:57', '2021-03-20 22:17:57', NULL),
(64, 'Bolanburg White Queen Louvered Panel Headboard', 'B647', '503.65', '50.00', '45', 'Made with Acacia veneers and solids finished in a trendy textured antique white color. French/English dovetailed drawers feature fully finished drawer', '', '2021-03-20 22:17:57', '2021-03-20 22:17:57', NULL),
(65, 'North Shore Cal King Panel Headboard', 'B553-159', '524.76', '52.00', '48', 'Headboard only\nBed frame sold separately\nMade of veneers, wood, engineered wood and cast resin\nAssembly required', '', '2021-03-20 22:17:57', '2021-03-20 22:17:57', NULL),
(66, 'Bolanburg White Queen Panel Headboard', 'B647-57', '524.76', '53.00', '56', 'Made with Acacia veneers and solids finished in a trendy textured antique white color. French/English dovetailed drawers feature fully finished drawer', '', '2021-03-20 22:17:57', '2021-03-20 22:17:57', NULL),
(67, 'Trudell Dark Brown Queen Panel Headboard', 'B658-57', '440.42', '45.00', '36', 'All solid Pine wood construction, finished in a weathered golden-brown hue with subtle wire brushing and varying natural distressing. The bed offers a', '', '2021-03-20 22:17:58', '2021-03-20 22:17:58', NULL),
(68, 'North Shore Queen Panel Headboard', 'B553-157', '490.09', '50.00', '75', 'Headboard only\nBed frame sold separately\nMade of veneers, wood, engineered wood and cast resin\nAssembly required', '', '2021-03-20 22:17:59', '2021-03-20 22:17:59', NULL),
(69, 'Birlanny Silver Queen Upholstered Panel Headboard', 'B720-58', '858.69', '85.00', '45', 'Made with Ash Swirl and Birch veneers and select hardwood solids, finished in a silver toned color with subtle glazing effects to bring out dimension.', '', '2021-03-20 22:17:59', '2021-03-20 22:17:59', NULL),
(70, 'Bolanburg White Queen Louvered Panel Headboard', 'B647-771', '503.65', '50.00', '48', 'Made with Acacia veneers and solids finished in a trendy textured antique white color. French/English dovetailed drawers feature fully finished drawer', '', '2021-03-20 22:17:59', '2021-03-20 22:17:59', NULL),
(71, 'North Shore Cal King Panel Headboard', 'B553-158', '524.76', '52.00', '48', 'Headboard only\nBed frame sold separately\nMade of veneers, wood, engineered wood and cast resin\nAssembly required', '', '2021-03-20 22:17:59', '2021-03-20 22:17:59', NULL),
(72, 'Bolanburg White Queen Panel Headboard', 'B647-59', '524.76', '52.00', '23', 'Made with Acacia veneers and solids finished in a trendy textured antique white color. French/English dovetailed drawers feature fully finished drawer', '', '2021-03-20 22:17:59', '2021-03-20 22:17:59', NULL),
(73, 'Trudell Dark Brown Queen Panel Headboard', 'B658-58', '440.74', '44.00', '56', 'All solid Pine wood construction, finished in a weathered golden-brown hue with subtle wire brushing and varying natural distressing. The bed offers a', '', '2021-03-20 22:17:59', '2021-03-20 22:17:59', NULL),
(74, 'North Shore Queen Panel Headboard', 'B553-1114', '490.09', '50.00', '25', 'Headboard only\nBed frame sold separately\nMade of veneers, wood, engineered wood and cast resin\nAssembly required', '', '2021-03-20 22:17:59', '2021-03-20 22:17:59', NULL),
(75, 'Farmhouse Reimagined Antique White Armoire', '652-BR-ARM', '1467.58', '150.00', '42', 'Part of Farmhouse Reimagined Collection from Liberty\nCrafted from pine solids with hickory and pine veneers\nAntique white finish\nHeavy wire brush and ', '', '2021-03-20 22:17:59', '2021-03-20 22:17:59', NULL),
(76, 'Gramercy Modern Freestanding Wardrobe Armoire Closet In Nature And Textured Grey', '107GMC7', '1110.65', '110.00', '25', 'Modern Free Standing 3 Sectional Wardrobe Closet with Hanging, Drawers and Storage Compartments for Bedroom and Storage Use.\nUpon Assembly, Measures: ', '', '2021-03-20 22:17:59', '2021-03-20 22:17:59', NULL),
(77, 'Versatile White 36\'\' Corner Open Storage Unit', '40165-17', '763.95', '75.00', '26', 'Part of Versatile Collection\nWhite finish\nEach unit will help you organize your storage needs perfectly\nDurable 1\" commercial grade work surfaces with', '', '2021-03-20 22:17:59', '2021-03-20 22:17:59', NULL),
(78, 'Pur By Bark Gray Corner Storage Unit', '26165-47', '673.56', '68.00', '35', 'Part of Pur Collection from Bestar\nBark gray finish\n1 fixed shelf\n2 poles to hang clothes', '', '2021-03-20 22:17:59', '2021-03-20 22:17:59', NULL),
(79, 'Mulberry Open 1 Sectional Modern Armoire Wardrobe Closet With 2 Drawers In White', '109GMC1', '437.66', '45.00', '22', 'Modern Free Standing Open Sectional Wardrobe Closet Bedroom, Walk-In Closet, and Storage Use.\nUpon Assembly, Measures: 35.98 in. Length, 81.3 in. Heig', '', '2021-03-20 22:18:00', '2021-03-20 22:18:00', NULL),
(80, '26856 Pure White 72\" Classic Drawer Unit', '26856-17', '1589.05', '159.00', '23', 'Part of Pur Collection\nWhite finish\nCombining style and convenience\nPerfect solution to furnished condos, lofts, studios, guest\'s rooms and home offic', '', '2021-03-20 22:18:00', '2021-03-20 22:18:00', NULL),
(81, 'Rustic Traditions II Vanity', '689-BR35', '346.00', '35.00', '41', 'Part of Rustic Traditions II Collection\nCrafted from Poplar Solids & Birch Veneers\nRustic White Finish\nFrench & English Dovetail Construction\nFull Ext', '', '2021-03-20 22:18:01', '2021-03-20 22:18:01', NULL),
(82, 'Sedona Vanity Set', '5420-72', '625.76', '62.00', '25', 'Crafted from mahogany solids and cherry veneer over engineered wood\nFinish and color may vary.', '', '2021-03-20 22:18:01', '2021-03-20 22:18:01', NULL),
(83, 'Rustic Traditions II Vanity Mirror', '689-BR55', '87.59', '10.00', '56', 'Part of Rustic Traditions II Collection\nCrafted from Poplar Solids & Birch Veneers\nRustic White Finish', '', '2021-03-20 22:18:01', '2021-03-20 22:18:01', NULL),
(84, 'Summer House I Oyster White Vanity Stool', '607-BR99', '128.00', '15.00', '26', 'Part of Summer House I Collection from Liberty\nCrafted from poplar and pine solids with wood products\nNylon chair glides', '', '2021-03-20 22:18:01', '2021-03-20 22:18:01', NULL),
(85, 'Allura Black Vanity Stool', '1916BK-14', '126.72', '15.00', '26', 'Part of Allura Collection from Homelegance\nBlack finish\nFaux alligator embossed front panel\nBeveled mirror framing', '', '2021-03-20 22:18:01', '2021-03-20 22:18:01', NULL),
(86, 'Old World Media Chest', '143153-2606', '1712.00', '170.00', '35', 'Part of the Old World Collection\nConstructed From Cathedral cherry and exotic avodire veneers\nRich and warm Pomegranate Finish with burnished edges, h', '', '2021-03-20 22:18:01', '2021-03-20 22:18:01', NULL),
(87, 'Lettner Light Gray Media Chest', 'B733-39', '611.68', '60.00', '26', 'Made of veneers, wood and engineered wood\nSilvertone patina hardware\n2 smooth-gliding drawers with dovetail construction\nFold-down with 2 cubbies\nSmal', '', '2021-03-20 22:18:01', '2021-03-20 22:18:01', NULL),
(88, 'Flynnter Medium Brown Media Chest', 'B719-39', '596.77', '60.00', '16', 'Made of wood, engineered wood and veneers\nAged brass-tone knob hardware\nTop drop-down door\n2 smooth-gliding drawers with dovetail construction\nSmall S', '', '2021-03-20 22:18:01', '2021-03-20 22:18:01', NULL),
(89, 'New Classic Furniture Tamarack Media Chest In Brown Cherry 00 043 078', 'BB044C-078', '569.30', '55.00', '24', 'Tamarack Collection by New Classic Furniture\nBrown Cherry fniish\nPoplar and basswood solids & veners\nBrushed silver finished hardware\nEuropean side mo', '', '2021-03-20 22:18:02', '2021-03-20 22:18:02', NULL),
(90, 'Westlake Cherry Brown Media Chest', 'WSLCB5740', '950.00', '95.00', '19', 'Part of Westlake Collection\nCrafted from solid plantation-grown mahogany\nSolid wood furniture, no mdf or particle board is used in construction\nKiln-d', '', '2021-03-20 22:18:02', '2021-03-20 22:18:02', NULL),
(91, 'Marston Dark Cherry Tv Chest', '2615DC-11', '821.27', '80.00', '38', 'Part of Marston Collection\nDark Cherry Finish\nBall Bearing Side Glide\nDovetailed Drawer', '', '2021-03-20 22:18:03', '2021-03-20 22:18:03', NULL),
(92, 'Modern 8\" Clear Mirror Crystal Jewelry Box With Silver Royal Cut Crystal', 'MR9211', '72.00', '7.00', '34', 'Part Of Modern Collection From Elegant Lighting\nCrafted from MDF\nClear Mirror finish\nSquare lift top\nBulb included: no\nSilver royal cut crystal trim\nB', '', '2021-03-20 22:18:03', '2021-03-20 22:18:03', NULL),
(93, 'Cherry 7 Drawer Shaped Jewelry Armoire', '500-50-540', '1639.00', '160.00', '24', 'Crafted from solid wood and select wood veneers over durable wood products\nMdf and particle board are used in quality furniture\nMedium wood finish\nMul', '', '2021-03-20 22:18:03', '2021-03-20 22:18:03', NULL),
(94, 'Chatelet Off White Jewelry Armoire Storage Floor Mirror', '5351-50003', '2779.00', '270.00', '31', 'Part of Chatelet Collection from Hooker\nCrafted from poplar and hardwood solids with pecan veneers\nWood Distressing Type : Scraping lines, worm holes,', '', '2021-03-20 22:18:03', '2021-03-20 22:18:03', NULL),
(95, 'Gannon Gold and Dark Mahogany Jewelry Armoire', '97208', '176.92', '15.00', '32', 'Part of Gannon Collection from Acme\nGold and dark mahogany finish\n5 drawers\nMetal tapered legs', '', '2021-03-20 22:18:03', '2021-03-20 22:18:03', NULL),
(96, 'Talor White Jewelry Armoire', '97171', '719.87', '70.00', '25', 'Description\nPart of Talor Collection from Acme\nCrafted from MDF and particle board\nWhite finish\nTop lid with Mirror\nSide doors\n6 drawers\nMirrored draw', '', '2021-03-20 22:18:03', '2021-03-20 22:18:03', NULL),
(97, 'Otis Antique White Jewelry Armoire', '97204', '540.05', '50.00', '42', 'Description\nPart of Otis Collection from Acme\nCrafted from wood, MDF and veneer\nAntique white finish\n2 drawers\n2 doors\n2 shelves', '', '2021-03-20 22:18:03', '2021-03-20 22:18:03', NULL),
(98, 'Justice Daybed w/ Trundle', '39405', '762.86', '75.00', '27', 'Fabric upholstery\nSmoke Gray finish\nVintage style\nChesterfield shape\nDecorative nail head trim\nButton tufted\nRoll-out trundle\nRecommended trundle matt', '', '2021-03-20 22:18:03', '2021-03-20 22:18:03', NULL),
(99, 'Jedda Daybed w/ Trundle', '39400', '658.45', '65.00', '36', 'PU upholstery\nWhite finish\nSloped shape\nRoll-out trundle\nRecommended trundle mattress height: 8 inches\nBox Spring NOT required (Slat System included)\n', '', '2021-03-20 22:18:03', '2021-03-20 22:18:03', NULL),
(100, 'Charlton Cream Linen and Salvage Oak Daybed', '39175', '1058.47', '105.00', '26', 'Part of Charlton Collection from Acme\nCrafted from new zealand pine wood, MDF and plywood\nCream Linen and salvage oak finish\nCream Linen upholstery\nKD', '', '2021-03-20 22:18:03', '2021-03-20 22:18:03', NULL),
(101, 'Suzanne Ivory Twin Daybed With Trundle', 'CM1028T+TR', '1231.36', '120.00', '18', 'Part of Suzanne Collection from Furniture of America\nCrafted from solid wood and wood veneers\nIvory finish\nTuxedo-inspired design\nLinen-like fabric up', '', '2021-03-20 22:18:03', '2021-03-20 22:18:03', NULL),
(102, 'Furniture of America Gartel Nesting Daybed - Trundle Not Included', 'CM1610', '748.70', '75.00', '33', 'Country Style\nSlatted H/B and F/B\nSolid Wood, Wood Veneer & Others\nNesting Design\nTwin Trundle Not Included\nEspresso Finish\nCM1610-1 : Daybed Headboar', '', '2021-03-20 22:18:03', '2021-03-20 22:18:03', NULL),
(103, 'Baxton Studio Mabelle Modern And Contemporary Grey Fabric Trundle Daybed', 'Ashley-Grey-Daybed', '705.80', '70.00', '30', 'Modern and contemporary fabric upholstered daybed with guest trundle bed\nFabric upholstered\nRolled arms with nail heads trim\nRoll-out trundle as guest', '', '2021-03-20 22:18:03', '2021-03-20 22:18:03', NULL),
(104, 'Jasmine Pink Velvet Twin Bed JasminePink-T', 'JasminePink-T', '409.99', '40.00', '35', 'Luxurious Pink Velvet\nContemporary Design\nGold and Chrome Legs Included with each bed', '', '2021-03-20 22:18:03', '2021-03-20 22:18:03', NULL),
(105, 'Via Black Velvet Twin Bed', 'ViaBlack-T', '770.00', '75.00', '26', 'Rich Black Velvet\nDeep Detailed Channel Tufting\nGold and Chrome Legs Included with each bed\nContemporary Design', '', '2021-03-20 22:18:04', '2021-03-20 22:18:04', NULL),
(106, 'Reggie Youth Chest', '30826', '315.33', '30.00', '41', 'Fabric upholstery\nPink finish\nWooden frame\nVintage style\nCrystal-like button tuft details\nCrystal-like pull knob hardware\nSide metal drawer glides\nEng', '', '2021-03-20 22:18:04', '2021-03-20 22:18:04', NULL),
(107, 'Cargo Youth Nightstand (Red)', '35951', '188.90', '18.00', '22', 'Metal\nRed finish\nCargo Container style\nRecessed panels', '', '2021-03-20 22:18:04', '2021-03-20 22:18:04', NULL),
(108, 'Romana II Twin over Twin Bunk Bed w/ Trundle (Gray)', '37855', '755.41', '75.00', '25', 'Fabric upholstery\nGray finish\nDecorative nail head trim\nButton tufted\nLeft facing ladder\nEasy access guard-rail\nTwin-sized trundle with casters for mo', '', '2021-03-20 22:18:04', '2021-03-20 22:18:04', NULL),
(109, 'Graphite Desk Chair', '8942-452', '200.90', '20.00', '35', 'Crafted from Select Veneers and Hardwood Solids\nGraphite Finish', '', '2021-03-20 22:18:04', '2021-03-20 22:18:04', NULL),
(110, 'Grand Isle Firm White Mattress', 'M62111', '503.19', '50.00', '26', 'Built with a .75 inch High Density Quilt Firm Foam and a 2 inch High Density Plush Zoned Sculpted Pressure Relief Foam for the perfect mix of added su', '', '2021-03-20 22:18:04', '2021-03-20 22:18:04', NULL),
(111, 'Recharge Firm White Mattress', 'M62511', '345.65', '35.00', '20', 'A blend of a Luxurious Four Way Stretch Knit Cover and a Luxury Cotton Fiber gives the Recharge Pillowtop Mattress the increased softness and breathab', '', '2021-03-20 22:18:04', '2021-03-20 22:18:04', NULL),
(112, 'echarge Pillowtop White Mattress', 'M62711', '425.26', '40.00', '25', 'A blend of a Luxurious Four Way Stretch Knit Cover and a Luxury Cotton Fiber gives the Recharge Pillowtop Mattress the increased softness and breathab', '', '2021-03-20 22:18:04', '2021-03-20 22:18:04', NULL),
(113, 'Recharge Plush White Mattress', 'M62611', '345.64', '35.00', '28', 'A blend of a Luxurious Four Way Stretch Knit Cover and a Luxury Cotton Fiber gives the Recharge Pillowtop Mattress the increased softness and breathab', '', '2021-03-20 22:18:05', '2021-03-20 22:18:05', NULL),
(114, 'TriBeCa Modern Pillowtop Firm White Queen Mattress', 'M63531', '1436.37', '145.00', '16', 'Comfort level: firm\n4-way stretch fabric top with high loft pillow fiber and cotton fiber\n15\" profile\n1.5 high density quilt foam; 2 pure luxury firm ', '', '2021-03-20 22:18:05', '2021-03-20 22:18:05', NULL),
(115, 'Villa Cora Pillowtop Firm White Mattress', 'M63532', '797.43', '80.00', '31', 'Built with a Four Way Stretch Fabric to enable additional airflow.\nA mix of 1 oz of High Loft Pillow Fiber and .6 oz Cotton Fiber allows for the extra', '', '2021-03-20 22:18:05', '2021-03-20 22:18:05', NULL),
(116, 'Aleksa Grey Full Foundation', 'DM335F-F', '564.01', '50.00', '22', 'Part of Aleksa Collection from Furniture of America\nGrey finish\nDurable with exterior design\nFoundation is available in Full Queen King & Cal. King si', '', '2021-03-20 22:18:05', '2021-03-20 22:18:05', NULL),
(117, 'Kalei Grey Twin Foundation', 'DM111T-F', '554.77', '55.00', '17', 'Part of Kalei Collection from Furniture of America\nGrey finish\nDurable with exterior design\nFoundation is available in Twin & Full sizes', '', '2021-03-20 22:18:05', '2021-03-20 22:18:05', NULL),
(118, 'Framos Silver King Base Foundation', 'MT-FND-EK', '275.03', '25.00', '23', 'Part of Framos Collection from Furniture of America\nSilver finish frame\nCross-braces for extra support\nRound corners\nFoundation is available in Queen ', '', '2021-03-20 22:18:05', '2021-03-20 22:18:05', NULL),
(119, 'Lilium Twin Foundation', 'DM318T-F', '556.11', '55.00', '25', 'Part of Lilium Collection\nMade in USA\nStitching: 1 1/2\" Brown Tape With Tex-45 Flameout Firefly Yellow Thread\nBorder: Designer Brown Damask, Multi-Nee', '', '2021-03-20 22:18:05', '2021-03-20 22:18:05', NULL),
(120, 'Lavender Twin Foundation', 'DM110T-F', '512.16', '50.00', '24', 'Part of Lavender Collection\nMade in USA\nQuilting: 1/2\" Quilted White Damask\nSafety: 16 Cfr Part 1633 Flammability Standard Approved\nU Guard Edge Suppo', '', '2021-03-20 22:18:05', '2021-03-20 22:18:05', NULL),
(121, 'Bird Of Paradise Twin Foundation', 'DM315T-F', '554.48', '55.00', '27', 'Part of Bird Of Paradise Collection\nMade in USA\nDurable foundation\nDesign matches pillow top\nStitching: 1 1/4\" White Tape With Tex-45 Flameout Firefly', '', '2021-03-20 22:18:05', '2021-03-20 22:18:05', NULL),
(122, 'Head Foot Model Better Black Twin XL Adjustable Base (2RQD) M9X872', 'M9X872', '663.27', '60.00', '25', 'Head and foot adjustable\nWireless backlight remote control\nCompatible with the MotoSleep App\nHead and foot massage\n2 memory programmable positions\nUnd', '', '2021-03-20 22:18:06', '2021-03-20 22:18:06', NULL),
(123, 'Head-Foot Model-Good Gray Queen Adjustable Base Elite Series', 'M9X732', '643.69', '60.00', '28', 'Head and foot adjustable\nWireless backlight remote control\n2 USB power ports\nAll steel frame\nQuick set up\nLow profile, foldable design\nAdjustable legs', '', '2021-03-20 22:18:06', '2021-03-20 22:18:06', NULL),
(124, 'Transform Gray Adjustable Queen Wireless Remote Bed Base MOD-6108-GRY', 'MOD-6108-GRY', '1050.95', '100.00', '35', 'Adjustable Queen Bed Frame\nErgonomic Features\nZero-Gravity Position\nWireless Remote Control\nStainless-Steel Metal Frame\nBlack Steel Legs and Frame\nBed', '', '2021-03-20 22:18:06', '2021-03-20 22:18:06', NULL),
(125, 'White Queen Adjustable Base', 'M8X132', '449.71', '40.00', '26', 'Head adjustable\nCompatible with all memory foam, wrapped coil and hybrid mattresses\nWired remote control\nUSB charging available in remote\nState recycl', '', '2021-03-20 22:18:06', '2021-03-20 22:18:06', NULL),
(126, 'Structures S755 Twin XL Adjustable Base', 'STS755TXAB', '2099.99', '210.00', '12', 'Adjustable head tilt and lumbar support with Reach Assist\n5 preset positions including Zero Gravity; 6 programmable positions\n12 dual-zone massage opt', '', '2021-03-20 22:18:06', '2021-03-20 22:18:06', NULL),
(127, 'Beachcroft Beige Pillow PA791-011', 'PA791-011', '35.96', '4.00', '52', 'Contemporary\nSand\nPolyester Velvet\nSand\n100% Polyester Velvet\n2/CTN', '', '2021-03-20 22:18:06', '2021-03-20 22:18:06', NULL),
(128, 'Fawn Sand 20\" X 20\" Pillow (2/Ctn) PL8031-2PK', 'PL8031-2PK', '196.50', '20.00', '62', 'Contemporary\nSand\nPolyester Velvet\nSand\n100% Polyester Velvet\n2/CTN', '', '2021-03-20 22:18:06', '2021-03-20 22:18:06', NULL),
(129, 'Lati Latte 20\" X 20\" Pillow (2/Ctn) PL8030-2PK', 'PL8030-2PK', '198.10', '20.00', '58', 'Contemporary\nLatte\nCotton\nLatte\n100% Cotton\n2/CTN', '', '2021-03-20 22:18:06', '2021-03-20 22:18:06', NULL),
(130, 'Spotted Light Grey Goat Fur Pouf', 'XU-1016-15', '478.99', '45.00', '35', 'Leopard printed goat fur for a glamorous look and feel.\nA glamorous goat-fur pouf in an exotic leopard print.', '', '2021-03-20 22:18:06', '2021-03-20 22:18:06', NULL),
(131, 'Luxury Chinchilla Faux Fur Pillow Black 20 X 20', 'PIL-RSPBK5050', '36.36', '3.00', '65', '100% Polyester\nChinchilla-like fur front\nVelvet backing\nZippered\nHand Tufted\nHand Wash Cold Water. No Tumble Drying. Minor Spills, Spot Clean with Mil', '', '2021-03-20 22:18:07', '2021-03-20 22:18:07', NULL),
(132, 'Luxury Chinchilla Faux Fur Pillow Red 20 X 20', 'PIL-RSPRD5050', '36.36', '3.00', '58', '100% Polyester\nChinchilla-like fur front\nVelvet backing\nZippered\nHand Tufted\nHand Wash Cold Water. No Tumble Drying. Minor Spills, Spot Clean with Mil', '', '2021-03-20 22:18:07', '2021-03-20 22:18:07', NULL),
(133, 'Dietrick Ivory King Quilt Set', 'Q256053K', '112.04', '11.00', '36', 'Matte polyester with polyester fill\nSet includes 1 quilt and 2 shams\nMini diamond machine quilting\nMachine washable\nImported', '', '2021-03-20 22:18:07', '2021-03-20 22:18:07', NULL),
(134, 'Mayda Blue And Off White King Comforter Set', 'Q424003K', '147.14', '15.00', '36', 'Set includes 1 comforter and 2 pillow shams\nMade of polyester microfiber\nPolyester filling\nMachine washable\nImported', '', '2021-03-20 22:18:07', '2021-03-20 22:18:07', NULL),
(135, 'Maxie Multi Twin Comforter Set', 'Q430001T', '54.85', '5.00', '56', 'Set includes 1 coverlet and 1 pillow sham\nMade of polyester microfiber\nPolyester filling\nMachine washable\nImported', '', '2021-03-20 22:18:07', '2021-03-20 22:18:07', NULL),
(136, 'Ekin Navy/Gray Twin Quilt Set', 'Q703001T', '55.22', '5.00', '59', 'Set includes twin comforter and 1 sham\nMade of microfiber polyester with polyester fiber fill\nReversible\nMachine washable\nImported', '', '2021-03-20 22:18:07', '2021-03-20 22:18:07', NULL),
(137, 'Raleda Gray Queen Comforter Set', 'Q498003Q', '78.21', '8.00', '36', 'Poly/cotton blend fill\nSet includes 1 coverlet, 2 pillow shams\nMachine washable\nImported', '', '2021-03-20 22:18:07', '2021-03-20 22:18:07', NULL),
(138, 'Loomis Fuchsia Twin Comforter Set', 'Q758041T', '117.87', '11.00', '25', 'Made of cotton with polyester filling\n200 thread count\nSet includes 1 comforter and 1 standard sham\nImported\nMachine washable', '', '2021-03-20 22:18:08', '2021-03-20 22:18:08', NULL),
(139, 'eghdad Gray and White Twin Comforter Set Q426001T', 'Q426001T', '88.12', '8.00', '56', 'Set includes comforter and sham\nPolyester microfiber cover with polyester filling\nReversible (solid gray over gray/white floral)\nChannel quilting and ', '', '2021-03-20 22:18:08', '2021-03-20 22:18:08', NULL),
(140, 'Rimy Gray Queen Comforter Set', 'Q756023Q', '186.75', '20.00', '45', 'Made of cotton with polyester filling\n200 thread count\nSet includes 1 comforter and 2 standard shams\nReversible\nMachine washable\nImported', '', '2021-03-20 22:18:09', '2021-03-20 22:18:09', NULL),
(141, 'Mirrored Reflections Wire Brushed Heathered Taupe Entertainment Wall Unit', '874-ENTW-ECP', '3075.17', '300.00', '23', 'Part of Mirrored Reflections Collection from Liberty\nCrafted from ash solids and cathedral white oak veneers\nWire brushed heathered taupe finish with ', '', '2021-03-20 22:18:09', '2021-03-20 22:18:09', NULL),
(142, 'Mirrored Reflections Wire Brushed Heathered Taupe Entertainment TV Stand', '874-TV59', '905.95', '90.00', '25', 'Part of Mirrored Reflections Collection from Liberty\nCrafted from ash solids and cathedral white oak veneers\nWire brushed heathered taupe finish with ', '', '2021-03-20 22:18:09', '2021-03-20 22:18:09', NULL),
(143, 'Harbor View Linen 62\" TV Console', '631-TV62', '981.86', '92.00', '45', 'Part of Harbor View Collection\nCrafted from Rubberwood and Poplar Solids\nLinen Finish\nAntique Pewter Knob Hardware\nFully Stained Interior Drawers\nFren', '', '2021-03-20 22:18:09', '2021-03-20 22:18:09', NULL),
(144, 'Harbor Linen Bridge w 60\" Shelf', '631-LB60', '553.70', '55.00', '35', 'Wood:Rubberwood and Poplar Solids\nFinish:Linen Finish\n\nItem Features:\n•Casual Cottage Styling with Distressed Finish\n•Lay on Bridge', '', '2021-03-20 22:18:09', '2021-03-20 22:18:09', NULL),
(145, 'Harbor View Linen Entertainment Wall Unit with 62\" TV Console', '631-ENTW-OEC', '2528.16', '250.00', '15', 'Part of harbor view collection\nCrafted from rubberwood and poplar solids\nLinen finish\nCasual cottage styling\nFull extension metal side drawer glides\nW', '', '2021-03-20 22:18:09', '2021-03-20 22:18:09', NULL),
(146, 'Lancaster Antique White and Brown Entertainment Wall Unit', '612-ENTW-ECP', '2524.96', '250.00', '18', 'Part of Lancaster Collection\nCrafted from Poplar Solids and Acacia and Birch Veneers\nAntique white and brown finish\nStorage compartment behind each do', '', '2021-03-20 22:18:10', '2021-03-20 22:18:10', NULL),
(147, 'Mirrored Reflections Wire Brushed Heathered Taupe Entertainment TV Stand', '874-TV60', '905.95', '90.00', '26', 'Part of Mirrored Reflections Collection from Liberty\nCrafted from ash solids and cathedral white oak veneers\nWire brushed heathered taupe finish with ', '', '2021-03-20 22:18:10', '2021-03-20 22:18:10', NULL),
(148, 'Harbor View Linen 62\" TV Console', '631-TV63', '981.68', '98.00', '35', 'Part of Harbor View Collection\nCrafted from Rubberwood and Poplar Solids\nLinen Finish\nAntique Pewter Knob Hardware\nFully Stained Interior Drawers\nFren', '', '2021-03-20 22:18:11', '2021-03-20 22:18:11', NULL),
(149, 'Saddlebrook Antique White TV Console', '612-TV55', '845.99', '85.00', '36', 'Part of Saddlebrook Collection\nCrafted from Poplar Solids and Acacia and Birch Veneers\nAntique White With Rub Thru and Antique Brown Finish\nWire Manag', '', '2021-03-20 22:18:11', '2021-03-20 22:18:11', NULL),
(150, 'Walt Black Tv Stand', '91174', '584.65', '55.00', '28', 'Part of Walt Collection from Acme\nCrafted from paper veneer, MDF and particle board\nBlack finish\nRectangular shape\n4 drawers\n4 open media compartments', '', '2021-03-20 22:18:11', '2021-03-20 22:18:11', NULL),
(151, 'Willowton Whitewash Large Tv Stand', 'EW0267-468', '159.75', '15.00', '39', 'Made of engineered wood\nWhitewash finish over replicated pine grain\n2 drawers, 2 cubbies\nAntique brass-tone hardware\nCutouts for wire management and v', '', '2021-03-20 22:18:11', '2021-03-20 22:18:11', NULL),
(152, 'Sausalito Whiskey 78\" Fireplace TV Console', 'SL5401.WKY', '1256.96', '125.00', '33', 'Part of Sausalito Collection from Legends Furniture\nCrafted from premium select knotty alder solids and veneers\nDado construction for supreme durabili', '', '2021-03-20 22:18:11', '2021-03-20 22:18:11', NULL),
(153, 'Lancaster Antique White and Brown Entertainment Wall Unit', '612-ENTW-ECP1', '2524.96', '250.00', '26', 'Part of Lancaster Collection\nCrafted from Poplar Solids and Acacia and Birch Veneers\nAntique white and brown finish\nStorage compartment behind each do', '', '2021-03-20 22:18:11', '2021-03-20 22:18:11', NULL),
(154, 'Saddlebrook Weathered Bridge', '612-LB00', '418.38', '40.00', '35', 'Storage Compartment\nSliding Bard Style Doors\nLight Distressing\nTop Compartment: W24.5xD17xH5.5', '', '2021-03-20 22:18:11', '2021-03-20 22:18:11', NULL),
(155, 'Storehouse Universal Pier ZSTR-3000', 'ZSTR-3000', '883.23', '88.00', '43', 'Minor Assembly Required\nQuality Import Designed in the U.S.A.\n23in - Thermostat controlled, Includes remote, Heats a 1000sq foot room', '', '2021-03-20 22:18:11', '2021-03-20 22:18:11', NULL),
(156, 'Willowton Whitewash Pier', 'EW0267-124', '107.18', '10.00', '56', 'Made of engineered wood\nWhitewash finish over replicated pine grain\n4 shelves (3 adjustable)\nAssembly required', '', '2021-03-20 22:18:11', '2021-03-20 22:18:11', NULL),
(157, 'Mid Modern Media Center, Walnut', '1265-75-MET', '1080.00', '110.00', '28', 'Rich walnut finish\nCabinet\nOpen Shelves\n1 drawer with ball bearing glides', '', '2021-03-20 22:18:11', '2021-03-20 22:18:11', NULL),
(158, 'Storehouse Bridge and Doors ZSTR-2001', 'ZSTR-2001', '602.20', '60.00', '18', 'Minor Assembly Required\nQuality Import Designed in the U.S.A.', '', '2021-03-20 22:18:11', '2021-03-20 22:18:11', NULL),
(159, 'Somerset Latte 6 Runner Area Rug', '994463855', '77.88', '70.00', '53', 'Part of Somerset Collection from Nourison\nLatte Finish\nPower Loomed\nFabric content: 50% Polyester, 50% Acrylic\nLatex Backing\nLow shedding', '', '2021-03-20 22:18:11', '2021-03-20 22:18:11', NULL),
(160, 'Fuzzy Electro Blue Area Rug 5 X 7', 'A1012-57', '172.75', '18.00', '56', '\"Fuzzy\" Electro Blue Shaggy 5-ft x 7-ft Area Rug. Hand Tufted, 100% Polyester with cotton backing. Scratch resistant on hardwood floors. Vacuum regula', '', '2021-03-20 22:18:11', '2021-03-20 22:18:11', NULL),
(161, 'Luxury Chinchilla Faux Fur Area Rug Black 79 X 118', 'RSRBK1219-710', '299.99', '30.00', '56', '100% polypropylene\nChinchilla-like fur front\nCotton Backing\nHand Tufted\nScratch resistant on hardwood floors\nVacuum regularly\n1 year limited manufactu', '', '2021-03-20 22:18:11', '2021-03-20 22:18:11', NULL),
(162, 'Fantasy Ivory 8 Runner Area Rug', '99446271419', '106.75', '10.00', '48', 'Part of Fantasy Collection from Nourison\nIvory Finish\nHand Hooked\nFabric content: 100% Polyester\nCotton Backing\nLow shedding', '', '2021-03-20 22:18:11', '2021-03-20 22:18:11', NULL),
(163, '3D Shaggy Hand Tufted Red Swirl Area Rug (5-Ft X 7-Ft)', '3D305R-57', '549.99', '55.00', '35', '100% Polyester\nCotton Backing\nHand Tufted\nScratch Resistant on Hardwood Floors\nVacuum regularly. For minor spills, spot clean with a mild detergent us', '', '2021-03-20 22:18:11', '2021-03-20 22:18:11', NULL),
(164, 'Somerset Multicolor 8 X 11 Area Rug', '9446048141', '419.52', '40.00', '37', 'Part of Somerset Collection from Nourison\nMulticolor Finish\nPower Loomed\nFabric content: 50% Polyester, 50% Acrylic\nLatex Backing\nLow shedding', '', '2021-03-20 22:18:11', '2021-03-20 22:18:11', NULL),
(165, 'Bertie Walnut Side Table', '82836', '157.02', '15.00', '56', 'Part of Bertie Collection from Acme\nCrafted from MDF, wood veneer and solid wood\nWalnut finish\nBottom shelf open storage\nWooden tapered leg\nKD constru', '', '2021-03-20 22:18:11', '2021-03-20 22:18:11', NULL),
(166, 'Shabby Chic Cottage Antique Black Narrow Side Table', 'CC-TAB1792LD-AB', '79.88', '8.00', '58', 'Farmhouse charm with lots of function\nHand-crafted from solid recycled plantation Mahogany\nSame finish front and back\nDrawer interior finish matches e', '', '2021-03-20 22:18:11', '2021-03-20 22:18:11', NULL),
(167, 'Adelyn Crema Gray Rectangular Side Table', '88009', '256.00', '25.00', '42', 'Part of Adelyn Collection from Riverside Furniture\nCrafted from hardwood solid and oak veneer with metal framework\nCrema gray finish', '', '2021-03-20 22:18:12', '2021-03-20 22:18:12', NULL),
(168, 'Jenna White and Gold Side Table', '101450', '64.44', '6.00', '33', 'Supports up to 100 lbs.\nAssembly Required', '', '2021-03-20 22:18:12', '2021-03-20 22:18:12', NULL),
(169, 'Farmhouse Barnwood Chairside Table', 'FH4420.BNW', '210.59', '20.00', '48', 'Part of Farmhouse Collection from Legends Furniture\nCarfted from knotty alder solids and veneers\nBarnwood finish with heavy distressing\nBuilt and desi', '', '2021-03-20 22:18:12', '2021-03-20 22:18:12', NULL),
(170, 'Claudio Green Stone Side Table', 'HGMM173', '1461.61', '145.00', '27', 'The rounded top of the Claudio side table sits effortlessly on a perfectly constructed single pedestal. It is strong shape can stand alone or be paire', '', '2021-03-20 22:18:12', '2021-03-20 22:18:12', NULL),
(171, 'Cairnburg Gray Accent Table Set of 3', 'A4000183', '157.00', '15.00', '56', 'Set of 3\nMade of veneers, wood and engineered wood\nWeathered brown finish', '', '2021-03-20 22:18:12', '2021-03-20 22:18:12', NULL),
(172, 'Winnie White Marble/Brass Round Side Table', 'ACC6200A', '191.60', '19.00', '48', 'Ideal for a cocktail or an espresso, this contemporary round side table elevates any living room with its refined minimalist style. Designed with slee', '', '2021-03-20 22:18:12', '2021-03-20 22:18:12', NULL),
(173, 'Rosalia Antique Gold Butterfly Side Table', 'FOX2594A', '229.75', '22.00', '25', 'This butterfly side table was inspired by a handcrafted piece created by master goldsmiths for an Italian princess\' Tuscan estate. Ethereal and timele', '', '2021-03-20 22:18:12', '2021-03-20 22:18:12', NULL),
(174, 'Hidden Treasures Gray Kidney Nesting Tables', '090-904', '420.00', '40.00', '56', 'Part of Hidden Treasures Collection from Hammary\nWooden frame and legs', '', '2021-03-20 22:18:12', '2021-03-20 22:18:12', NULL),
(175, 'Jenesis White Marble and Gold Round Accent Table', 'ACC3211A', '191.24', '19.00', '26', 'Bring modern luxury to the living room with this posh round accent table. Designed to give a contemporary edge to any decor, its classic white marble ', '', '2021-03-20 22:18:12', '2021-03-20 22:18:12', NULL),
(176, 'LeisureMod Madison Laurel Accent Side Table', 'LS15DW', '330.75', '33.00', '56', 'Durable solid wood in a rich walnut finish.\nCarved, chess-piece-inspired, shape.\nWalnut color coating with transparent paint.\nNon-scratch plastic floo', '', '2021-03-20 22:18:12', '2021-03-20 22:18:12', NULL);
INSERT INTO `product` (`productId`, `name`, `sku`, `price`, `discount`, `quantity`, `description`, `status`, `createdAt`, `updatedAt`, `color`) VALUES
(177, 'Summer House Oyster White End Table', '607-OT1020', '177.60', '17.00', '56', 'Part of summer house collection\nCrafted from poplar & pine solids wood\nOyster white finish\nOpen shelving\nOpen slat bottoms\nV shaped accents\nPlanked to', '', '2021-03-20 22:18:12', '2021-03-20 22:18:12', NULL),
(178, 'Parlone Deep Brown Rectangular End Table', 'T881-3', '298.25', '30.00', '45', 'Part of Parlone Collection\nCrafted from solid acacia wood\nDeep brown finish\nPlanked hand worked surface\nShelves for added storage\nBlack finish tubular', '', '2021-03-20 22:18:12', '2021-03-20 22:18:12', NULL),
(179, 'Talia End Table', 'TL200E', '239.50', '23.00', '52', 'Tempered glass top\nSturdy iron base\nAcrylic legs\nChrome finish', '', '2021-03-20 22:18:12', '2021-03-20 22:18:12', NULL),
(180, 'Mercer Court Tobacco End Table', '109-OT1020', '502.29', '50.00', '28', 'Part of Mercer Court Collection\nCrafted from chinese hardwoods\nTobacco finish\nHeavy block legs\nThick reclaimed tops\nSolid wood construction\nBottom she', '', '2021-03-20 22:18:12', '2021-03-20 22:18:12', NULL),
(181, 'Rocco End Table - Red', '13004', '119.67', '12.00', '56', 'These fun and functional high gloss end tables will bring life to any space! Use beside an occasional chair or stagger them beside one another to crea', '', '2021-03-20 22:18:13', '2021-03-20 22:18:13', NULL),
(182, 'Harvest Home Chalkboard Drop Leaf End Table', '879-OT1022', '293.55', '30.00', '38', 'Part of Harvest Home Collection from Liberty\nCrafted from rubberwood solids with knotty white oak veneers\nChalkboard finish', '', '2021-03-20 22:18:13', '2021-03-20 22:18:13', NULL),
(183, 'Modern Bennett Brown And Gold Cocktail Table', '647801', '794.60', '80.00', '25', 'Part of Bennett Collection from Universal\nMetal frame construction\nPortobello finish\nFaux shagreen top\nBrushed brass finish base', '', '2021-03-20 22:18:13', '2021-03-20 22:18:13', NULL),
(184, 'Mercer Court Tobacco Cocktail Table', '109-OT1010', '659.45', '65.00', '48', 'Part of Mercer Court Collection\nCrafted from chinese hardwoods\nTobacco finish\nHeavy block legs\nThick reclaimed tops\nSolid wood construction\nBottom she', '', '2021-03-20 22:18:13', '2021-03-20 22:18:13', NULL),
(185, 'Magnolia Manor Antique White Rectangular Cocktail Table', '244-OT1010', '383.28', '38.00', '42', 'Part of Magnolia Manor Collection\nCrafted from poplar solids and birch veneers\nAntique white finish\nWhite oak veneer top\nFull extension metal side dra', '', '2021-03-20 22:18:13', '2021-03-20 22:18:13', NULL),
(186, 'Casper Coffee Table 202-CT', '202-CT', '519.69', '50.00', '35', 'Chrome Stainless Steel and Acrylic Coffee Table\nGlass Top\nContemporary Design', '', '2021-03-20 22:18:13', '2021-03-20 22:18:13', NULL),
(187, 'Meridian 227C Contemporary Table', '227-C', '937.38', '90.00', '25', 'The Jocelyn Collection coffee table will add elegance to your home. The mirrored table features a unique design and crystal acrylic knob. This table i', '', '2021-03-20 22:18:13', '2021-03-20 22:18:13', NULL),
(188, 'Madrid Glass Top Oval Cocktail Table', 'SR250CBB-SR250CTB', '135.36', '14.00', '36', 'Part of Madrid Collection from Steve Silver\nGlass Top with Decorative Metal Base\nContemporary Style\nArched Metal Tube Stretchers with Ball Bearing Fin', '', '2021-03-20 22:18:13', '2021-03-20 22:18:13', NULL),
(189, 'Troy Medium Brown Cherry Cocktail Table', 'TY100C', '204.50', '20.00', '45', 'Part of Troy Collection from Steve Silver\nCrafted from Hardwood Solids and Birch Veneers\nMedium Brown Cherry Finish\nTraditional Style\nCorner Blocked C', '', '2021-03-20 22:18:13', '2021-03-20 22:18:13', NULL),
(190, 'Curated Sloane White Living Room Set', 'CM7424IV-SF', '4370.00', '100.00', '10', 'Part of Sloane Collection from Universal\nSky salt finish\nStructural integrity is secured by mortise & tenon joints and corner blocks in all stress are', '', '2021-03-20 22:18:13', '2021-03-20 22:18:13', NULL),
(191, 'Mila Living Room Set (Black) ', 'CM7824IV-SF', '2785.81', '50.00', '5', 'Gold Stainless Steel Base\nBlack Velvet\nThrow Pillows\nSeat guests in complete luxury on the Mila Velvet Collection by Meridian Furniture. The bold colo', '', '2021-03-20 22:18:13', '2021-03-20 22:18:13', NULL),
(192, 'Morgan Rose Accolade Living Room Set', 'FM7424IV-SF', '2555.10', '152.00', '15', 'Part of Morgan Rose Collection from ART\nExposed wood frame construction\nFabric content: 100% Polyester\nUpholstered in fabric\nAccolade finish\nMetallic ', '', '2021-03-20 22:18:13', '2021-03-20 22:18:13', NULL),
(193, 'Greeley Double Reclining Living Room Set', 'OL9624IV-SF', '1734.07', '140.00', '20', 'Part of Greeley Collection from Homelegance\nUpholstered in top grain leather\nPlush seating and backs\nDual reclining mechanism\nContemporary design', '', '2021-03-20 22:18:13', '2021-03-20 22:18:13', NULL),
(194, 'Braelyn Living Room Set (Black / Red)', 'OL9625IV-SF', '1481.22', '45.00', '11', 'Contemporary Style\nSuede, Leatherette, Solid Wood Frame\nBlack / Red Color\nFlared Arms\nLoose Back Pillows\nTapered Feet\nPillows Included\nMade in the USA', '', '2021-03-20 22:18:13', '2021-03-20 22:18:13', NULL),
(195, 'Pierre Black Living Room Set', 'CM7424IJ-SF', '1231.94', '65.00', '25', 'Part of Pierre Collection\nBlack Finish\nContemporary Style\nCushioned Inside Armrests\nDouble Stitching\nBlack Leatherette\nMaximum comfort\nAlthough simple', '', '2021-03-20 22:18:13', '2021-03-20 22:18:13', NULL),
(196, 'A973 Black Italian Leather Living Room Set', '17906111-L', '3640.84', '185.00', '23', 'Thick Premium Italian Leather\nStyle and Comfort\nModernistic Clean Design\n2 Independant Ratchet Headrest\nFirm seating', '', '2021-03-20 22:18:13', '2021-03-20 22:18:13', NULL),
(197, 'Parma Ivory Leatherette Living Room Set', 'CM6324IV-SF', '1579.18', '58.00', '22', 'Part of Parma Collection\nIvory Finish\nContemporary Style\nLarge Padded Arms\nPlush Cushions\nModern and stylish\nUnique décor', '', '2021-03-20 22:18:13', '2021-03-20 22:18:13', NULL),
(198, 'Jamael Brown Living Room Set', 'SM6405-SF', '2324.18', '100.00', '15', 'Part of Jamael Collection\nFabric content: 100% polyester\nBrown finish\nButton tufting\nIntricate wood trim\nRolled arms\nHigh-density foam cushions\nVictor', '', '2021-03-20 22:18:14', '2021-03-20 22:18:14', NULL),
(199, 'Julian Living Room Set (Grey/ Chrome)', '621Grey-S', '2560.11', '10.00', '22', 'Grey Velvet\nChrome Stainless Steel Base\nCurved Back Design\nThe perfect mix of velvet and stainless steel comes to life in your space with the Julian C', '', '2021-03-20 22:18:14', '2021-03-20 22:18:14', NULL),
(200, 'Rawcliffe Parchment Large Sectional', '1960466-1960467-1960', '1606.62', '15.00', '30', 'Part of Rawcliffe Collection from Ashley\nParchment finish\nFabric Content: 100% Polyester\nFrame constructions have been rigorously tested to simulate t', '', '2021-03-20 22:18:14', '2021-03-20 22:18:14', NULL),
(201, 'Kamryn Gray Reclining Sectional With Console', 'CM6771WG-SECTIONAL', '1436.95', '10.00', '10', 'Part of Kamryn Collection\nUpholstered in gray linen-like fabric\nGray finish\nPlush cushions\nTufted headrests\nIncludes dual cup holder and storage', '', '2021-03-20 22:18:14', '2021-03-20 22:18:14', NULL),
(202, '2347 Black Leather Left Side Sectional', '2347-i17276', '2986.82', '250.00', '10', 'Full Leather Cover\nBlack Finish\nLow-Profile Modern Style\nThis sexy full leather black sectional by ESF with a low-profile modern style is surely yours', '', '2021-03-20 22:18:14', '2021-03-20 22:18:14', NULL),
(203, 'Alfio Beige and Taupe 2 Piece RAF Sectional', '9808SC', '1352.95', '100.00', '25', 'Part of Alfio Collection from Homelegance\nCrafted From Solid wood and plywood\nBeige and Taupe Finish\nFabric Content: 100% Polyester\nFoam padding over ', '', '2021-03-20 22:18:14', '2021-03-20 22:18:14', NULL),
(204, 'Cloud Puff White 4 Piece Slipcovered Modular L Shaped Sectional Sofa', 'SU-1458-81-3C-1A', '5423.03', '250.00', '15', 'This sofa lounge includes three corner pieces and one armless chair\nDual performance fabric combines high-performance fibers and high-performance poly', '', '2021-03-20 22:18:14', '2021-03-20 22:18:14', NULL),
(205, 'Eden Premium Miele Leather RAF Sectional', '17625-RHFC', '4829.24', '150.00', '20', 'Part of Eden Collection from JNM\nMiele finish\nUpholstered in Leather\nAdjustable head cushions', '', '2021-03-20 22:18:15', '2021-03-20 22:18:15', NULL),
(206, '397 Grey Italian Leather RAF Chaise Sectional', '175442912-RHFC', '4091.07', '145.00', '5', 'Seats and Backs have High Density Foam\nAvailable as Rhf Chaise Or Lhf Chaise\nTop Grain Gray Italian Leather\nAll Corners are Blocked\nGlued for Strength', '', '2021-03-20 22:18:15', '2021-03-20 22:18:15', NULL),
(207, 'Diamond Sofa Jazz Barley Fabric Corner Sectional with Adjustable Backrests', 'JAZZ4AC1SC2ARLB', '2584.10', '15.00', '6', 'Polyester Fabric in Light Barley Finish\nAdjustable Depth Back Rest\nComplete 5-Seat Modular Collection to Customize Your Seating Preference\nDesigner Fi', '', '2021-03-20 22:18:15', '2021-03-20 22:18:15', NULL),
(208, 'Allegra Slate Gray Leather Power Reclining RAF Sectional', '18205-RHFC', '4091.07', '25.00', '5', 'Part of Allegra Collection\nSlate grey finish\nPower reclining mechanism\nSlate grey thick durable premium grade leather upholstery\n3 adjustable headrest', '', '2021-03-20 22:18:15', '2021-03-20 22:18:15', NULL),
(209, 'Lauren White Leather RAF Sectional', '18243-RHFC', '3116.55', '100.00', '7', 'Part of Lauren Collection\nInspired by innovation\nSimple yet aesthetically pleasing design\nUpholstered in premium leather all around\nOpens to provide a', '', '2021-03-20 22:18:15', '2021-03-20 22:18:15', NULL),
(210, 'Curated Sloane White Living Room Set', '62001270536', '1369.00', '139.00', '5', 'Part of Branson Collection from Catnapper\nCamel finish\nMade in USA\nFabric content: 100% Polyester\nComfort coil seating with comfor-gel\n15 gauge heat t', '', '2021-03-20 22:18:15', '2021-03-20 22:18:15', NULL),
(211, 'Prescott Gray Velvet Sofa', '530501-200', '2325.00', '2325.00', '10', 'Part of Prescott collection\nFabric content: 100% Cotton\nLasting durability\nUnrivaled comfort\nLint free & non allergenic\nStrong textured weave\nUpholste', '', '2021-03-20 22:18:15', '2021-03-20 22:18:15', NULL),
(212, 'Maier Sienna LAF Sofa', '4520266', '482.53', '48.00', '8', 'Part of Prescott collection\nFabric content: 100% Cotton\nLasting durability\nUnrivaled comfort\nLint free & non allergenic\nStrong textured weave\nUpholste', '', '2021-03-20 22:18:15', '2021-03-20 22:18:15', NULL),
(213, 'Ritz Grey Velvet Sofa', '659Grey-S', '1223.01', '122.00', '10', 'Grey Velvet\nGold Metal Legs\nCurved Contemporary Design\n24\" Height of Lower Portion of Back\nGet comfy while remaining chic in this elegant Ritz grey ve', '', '2021-03-20 22:18:15', '2021-03-20 22:18:15', NULL),
(214, 'Curated Sloane White Sofa', ' 685501-615', '2680.00', '268.00', '5', 'Part of Sloane Collection from Universal\nSky salt finish\nStructural integrity is secured by mortise & tenon joints and corner blocks in all stress are', '', '2021-03-20 22:18:15', '2021-03-20 22:18:15', NULL),
(215, 'Game Zone Bark Power Reclining Sofa with Adjustable Headrest', '3850115', '1467.86', '146.00', '6', 'Dual-sided recliner\nPolyurethane/polyester tuck and roll upholstery\nDual-sided recliner\nPolyurethane/polyester tuck and roll upholstery\nCorner-blocked', '', '2021-03-20 22:18:15', '2021-03-20 22:18:15', NULL),
(216, 'Accrington Granite Sofa', '7050938', '512.08', '51.00', '20', 'Corner-blocked frame\nAttached back and loose seat cushions\nHigh-resiliency foam cushions wrapped in thick poly fiber\nPlatform foundation system resist', '', '2021-03-20 22:18:16', '2021-03-20 22:18:16', NULL),
(217, 'Clementine Grey Sofa', '506574', '797.75', '79.00', '5', 'Part of Clementine Collection from Coaster Furniture\nKiln dried hardwood frame\nGray finish\nPocket coil seating\nBack cushions are supportive and have g', '', '2021-03-20 22:18:16', '2021-03-20 22:18:16', NULL),
(218, 'Vacherie Salsa Reclining Sofa', '79310688', '788.08', '78.00', '15', 'Dual-sided recliner; middle seat remains stationary\nPull tab reclining motion\nCorner-blocked frame with metal reinforced seats\nAttached back and seat ', '', '2021-03-20 22:18:16', '2021-03-20 22:18:16', NULL),
(219, 'Meridian Scarlett Velvet Sofa in Navy 663Navy-S', '663Navy-S', '1244.48', '124.00', '20', 'Sink into the welcoming comfort of this Scarlett cream velvet chair. This sofa defines elegance and sophistication with its boxy retro look and its de', '', '2021-03-20 22:18:16', '2021-03-20 22:18:16', NULL),
(220, 'Ritz Pink Velvet Loveseat', '659Pink-L', '954.83', '95.00', '8', 'Pink Velvet\nGold Metal Legs\nCurved Contemporary Design\n24\" Height of Lower Portion of Back\nGet comfy while remaining chic in this elegant Ritz pink ve', '', '2021-03-20 22:18:16', '2021-03-20 22:18:16', NULL),
(221, 'Clementine Brown Loveseat', '506572', '644.56', '64.00', '12', 'Part of Clementine Collection from Coaster Furniture\nKiln dried hardwood frame\nBrown finish\nPocket coil seating\nBack cushions are supportive and have ', '', '2021-03-20 22:18:16', '2021-03-20 22:18:16', NULL),
(222, 'Accrington Granite Loveseat', '7050935', '476.32', '47.00', '10', 'Corner-blocked frame\nAttached back and loose seat cushions\nHigh-resiliency foam cushions wrapped in thick poly fiber\nPlatform foundation system resist', '', '2021-03-20 22:18:16', '2021-03-20 22:18:16', NULL),
(223, 'Meridian Lola Grey Velvet Loveseat', ' 619Grey-L', '1013.95', '103.00', '26', 'Grey Velvet\nBlack Leg with Gold Tip\nChannel Tufting Design\nContemporary Design\nCozy up to the comfort of this Lola Grey Velvet Loveseat. Its rich colo', '', '2021-03-20 22:18:16', '2021-03-20 22:18:16', NULL),
(224, 'Laguna Taupe Loveseat LAGUNA-20-TPE', 'LAGUNA-20-TPE', '1703.00', '170.00', '12', 'Genuine Leather: Top-Grain leather on seating areas and arms rests. Split grain leather is used on the sides and back.\nUltimate Comfort Seating: Remov', '', '2021-03-20 22:18:16', '2021-03-20 22:18:16', NULL),
(225, 'Soho Grey Leather Loveseat', '176551113-LS-GR', '1053.06', '105.00', '10', 'The Soho collection features a attractive contemporary design. This sofa set is upholstered in leather with a solid Oak inner frame. This sofa collect', '', '2021-03-20 22:18:16', '2021-03-20 22:18:16', NULL),
(226, 'Hadley I Espresso Reclining Loveseat', 'CM6870-LV', '1188.01', '118.00', '20', 'Part of Hadley I Collection\nUpholstered in leatherette and champion fabric\nBrown and espresso finish\nPlush cushions\nIncludes cup holders and storage\nF', '', '2021-03-20 22:18:16', '2021-03-20 22:18:16', NULL),
(227, 'Pollux Dark Brown Reclining Loveseat', 'CM6864-LV', '1292.70', '129.00', '15', 'Part of Pollux Collection\nUpholstered in brown leatherette\nDark brown and light brown finish\nPlush cushions\nIncludes cup holders & storage console\nTwo', '', '2021-03-20 22:18:16', '2021-03-20 22:18:16', NULL),
(228, 'Sunset Trading Madison Reclining Loveseat with Console', 'SU-LN550-206', '1122.00', '112.00', '25', 'Easy to clean, soft and durable microsuede fabric\nCharcoal gray upholstery with blue undertones for a soothing, contemporary vibe\nReinforced frames ar', '', '2021-03-20 22:18:16', '2021-03-20 22:18:16', NULL),
(229, 'Sunset Trading Aspen Dual Reclining Loveseat', 'SU-UZI460-205', '1198.90', '119.00', '10', 'Sunset Trading\'s Aspen loveseat beckons you to sit back with a glass of champagne, as the piece\'s color implies, and unwind in the lap of luxury. Dual', '', '2021-03-20 22:18:16', '2021-03-20 22:18:16', NULL),
(230, 'Stanley Mahogany Leather Gel Recliner Loveseat', '1226-L', '1312.64', '132.00', '5', 'Leather Gel\nNail Head Trim\n2 Recliners\nManual Recliner', '', '2021-03-20 22:18:16', '2021-03-20 22:18:16', NULL),
(231, 'Warrendale Power Reclining Loveseat w/ Power Headrest (Cream)', '29PH3324570081', '2229.78', '229.00', '6', 'Leather\nCream Finish\nLeggett and Platt Mech\nBoxed Seat, Pad Over Chaise\nPocketed Coil Springs\nThe Wood Legs are Finished in a Espresso Color\nTradition', '', '2021-03-20 22:18:17', '2021-03-20 22:18:17', NULL),
(232, 'Horizon Navy Slipcovered Sleeper Sofa with Reversible Chaise', 'SU-117678-391049', '2777.48', '277.00', '10', 'Sleeper sofa with reversible chaise and twelve piece slipcover set: One-piece sleeper sofa cover, ottoman cover, three back cushion covers, three seat', '', '2021-03-20 22:18:17', '2021-03-20 22:18:17', NULL),
(233, '262 Brown Leather Sleeper Sofa', '262-i8721', '2581.95', '258.00', '4', 'Genuine Italian Leather\nBrown Finish\nThe 262 Brown Living Room Collection by ESF has an inviting appeal and comfort. Sofa Bed is wrapped in finest gen', '', '2021-03-20 22:18:17', '2021-03-20 22:18:17', NULL),
(234, 'Horizon Linen Slipcovered Sleeper Sofa with Reversible Chaise', 'SU-117678-466082', '2777.48', '278.00', '10', 'Sleeper sofa with reversible chaise and twelve piece slipcover set: One-piece sleeper sofa cover, ottoman cover, three back cushion covers, three seat', '', '2021-03-20 22:18:17', '2021-03-20 22:18:17', NULL),
(235, 'Apolo Sleeper Sofa (Ivory)', 'APOLO3BEDIVORY', '2389.64', '238.00', '15', 'Wrapped in finest genuine Italian leather (Leather/Split)\nIvory finish\nClassic style\nButton tufted\nRemovable cushions\nBun feet\nCollection: SWH Classic', '', '2021-03-20 22:18:17', '2021-03-20 22:18:17', NULL),
(236, 'Carina White Chic Leather Full Sofa Sleeper', 'Carina-WHT', '4459.00', '445.00', '25', 'Part of Carina Collection from Bellini Modern Living\nFull grain italian Leather\nSteel feet\nNot only a sofa, but can also be turned into a daybed, feel', '', '2021-03-20 22:18:17', '2021-03-20 22:18:17', NULL),
(237, 'Ariana White Slipcovered Sleeper Sofa', 'SU-78341-81', '2074.54', '207.00', '10', 'Sofa with pull out bed includes: One-piece frame cover and frame, three back cushion covers with cushions, three seat cushion covers with cushions, tw', '', '2021-03-20 22:18:17', '2021-03-20 22:18:17', NULL),
(238, 'Branson Camel Lay Flat Power Reclining Sofa', '6.20E+11', '1369.00', '139.00', '25', 'Part of Branson Collection from Catnapper\nCamel finish\nMade in USA\nFabric content: 100% Polyester\nComfort coil seating with comfor-gel\n15 gauge heat t', '', '2021-03-20 22:18:17', '2021-03-20 22:18:17', NULL),
(239, 'Berneen Coffee Swivel Rocker Recliner', '5450128', '492.56', '49.00', '20', 'Frames have been tested to GSA government standards\nCorners are glued blocked and stapled\nStripes and patterns are match cut\nAll fabrics are pre-appro', '', '2021-03-20 22:18:18', '2021-03-20 22:18:18', NULL),
(240, 'Mitchiner Fog Rocker Recliner', '7620425', '514.65', '51.00', '20', 'Gentle rocking motion\nPull tab reclining motion\nCorner-blocked frame with metal reinforced seat\nAttached back and seat cushions\nHigh-resiliency foam c', '', '2021-03-20 22:18:18', '2021-03-20 22:18:18', NULL),
(241, 'Vacherie Salsa Reclining Sofa', '7930688', '788.08', '78.00', '14', 'Dual-sided recliner; middle seat remains stationary\nPull tab reclining motion\nCorner-blocked frame with metal reinforced seats\nAttached back and seat ', '', '2021-03-20 22:18:18', '2021-03-20 22:18:18', NULL),
(242, 'Pollux Dark Brown Recliner', 'CM6864-CH', '890.62', '89.00', '10', 'Part of Pollux Collection\nUpholstered in brown leatherette\nDark brown and light brown finish\nPlush cushions\nTwo-tone design', '', '2021-03-20 22:18:18', '2021-03-20 22:18:18', NULL),
(243, 'Kester Power Reclining Sofa in Lorenzo Mint Leather', '39PH-3716-3729-45', '2099.59', '209.00', '14', 'Rongyao Mechanism with Kaidi Power\nHardwood Plywood, Mortise and tenon frames with glued joints and corner blocking, Extremely durable\nLeather feature', '', '2021-03-20 22:18:18', '2021-03-20 22:18:18', NULL),
(244, 'Britten Espresso Reclining Home Theater Seating', '53775', '1092.78', '109.00', '20', 'Part of Britten Collection from Acme\nWooden frame\nEspresso finish\nReclining mechanism\nPolyurethane upholstery\nIncludes cup holder\nButton less tufted\nT', '', '2021-03-20 22:18:18', '2021-03-20 22:18:18', NULL),
(245, 'Cyrus Black Leather Match Three-Seat Home Theater Set - 600130-3', '600130-3', '1799.00', '179.00', '5', 'Contemporary style\nBlack leather match\nPremium style\nBeautiful design\nBlack and metal chrome cup holders\nUnbelievable comfort\nSleek style\nHighly rated', '', '2021-03-20 22:18:18', '2021-03-20 22:18:18', NULL),
(246, 'Chester Chocolate Power Reclining Home Theater With Power Headrest', '603441PPT', '2621.77', '262.00', '10', 'Part of Chester Collection from Coaster\nChocolate finish\nPower reclining\nUpholstered in chocolate top grain leather\n1\" 3.0lbs cool gel memory foam top', '', '2021-03-20 22:18:19', '2021-03-20 22:18:19', NULL),
(247, 'Albany Brown Power Reclining Home Theater With Power Headrest', '603291PPT', '2169.64', '216.00', '5', 'Part of Albany Collection from Coaster\nBrown finish\nPower reclining\nUpholstered in brown breathable performance polyurethane\n1\" 3.0lbs cool gel memory', '', '2021-03-20 22:18:19', '2021-03-20 22:18:19', NULL),
(248, 'Cyrus Black Leather Match Four-Seat Home Theater Set - 600130-4', '600130-4', '1908.25', '190.00', '10', 'Contemporary style\nBlack leather match\nPremium style\nBeautiful design\nBlack and metal chrome cup holders\nUnbelievable comfort\nSleek style\nHighly rated', '', '2021-03-20 22:18:19', '2021-03-20 22:18:19', NULL),
(249, 'Cyrus Black Leather Match Three-Seat with Wedges Home Theater Set', '600001(3)600002(2)', '2099.00', '209.00', '25', 'Contemporary style\nVersatile theater set\nBlack leather match\nExtremely comfortable\nHardwood frames\nSinuous spring construction\nLegget and Platt mechan', '', '2021-03-20 22:18:19', '2021-03-20 22:18:19', NULL),
(250, 'Maier Sienna Accent Chair', '4520221', '444.83', '44.00', '10', 'Part of Sloane Collection from Universal\nSky salt finish\nStructural integrity is secured by mortise & tenon joints and corner blocks in all stress are', '', '2021-03-20 22:18:19', '2021-03-20 22:18:19', NULL),
(251, 'Curated Sloane White Chair', '685503-615', '1690.00', '169.00', '12', 'Part of Sloane Collection from Universal\nSky salt finish\nStructural integrity is secured by mortise & tenon joints and corner blocks in all stress are', '', '2021-03-20 22:18:19', '2021-03-20 22:18:19', NULL),
(252, 'Clementine Brown Chair', '506573', '505.63', '50.00', '25', 'Part of Clementine Collection from Coaster Furniture\nKiln dried hardwood frame\nBrown finish\nPocket coil seating\nBack cushions are supportive and have ', '', '2021-03-20 22:18:19', '2021-03-20 22:18:19', NULL),
(253, 'Ritz Cream Velvet Chair', '659Cream-C', '807.05', '80.00', '10', 'Cream Velvet\nGold Metal Legs\nCurved Contemporary Design\n24\" Height of Lower Portion of Back\nGet comfy while remaining chic in this elegant Ritz cream ', '', '2021-03-20 22:18:19', '2021-03-20 22:18:19', NULL),
(254, 'Meridian Chesterfield Velvet Chair in Black 662BL-C', '662BL-C', '842.53', '84.00', '14', 'Chesterfield Collection by Meridian Furniture\nBlack finish\nBlack velvet\nSilver nailheads\nPillow included\nDimensions: 31\" H x 48\" W x 37.5\" D\nMeridian ', '', '2021-03-20 22:18:19', '2021-03-20 22:18:19', NULL),
(255, 'Meridian Ferrara Leather Chair in Beige 655BE-C', '655BE-C', '783.41', '78.00', '17', 'Ferrara Collection by Meridian Furniture\nBeige finish\nBeige bonded leather\nSilver nailheads\nDimensions: 34\" H x 39.5\" W x 35\" D', '', '2021-03-20 22:18:19', '2021-03-20 22:18:19', NULL),
(256, 'Maier Sienna Accent Chair', '452022ss1', '444.83', '44.00', '22', 'Part of Classic Collection from Caracole\nMetal knuckle finished in whisper of gold\nLoose seat and back cushions\nDecorative carved wood corner blocks\nB', '', '2021-03-20 22:18:19', '2021-03-20 22:18:19', NULL),
(257, 'Classic Empress Accent Chair', 'UPH-419-133-A', '1827.29', '182.00', '14', 'Part of Classic Collection from Caracole\nMetal knuckle finished in whisper of gold\nLoose seat and back cushions\nDecorative carved wood corner blocks\nB', '', '2021-03-20 22:18:19', '2021-03-20 22:18:19', NULL),
(258, 'Diamond Sofa La Brea Champagne Fabric Accent Chair', 'LABREACHCP', '1120.00', '112.00', '17', 'Champagne Fabric Seat & Back\nBrushed Stainless Steel Frame\nSeat Height is 19 Inches\nFunctional & Stylish Addition to Any Room\'s decor\nHardwood Frame w', '', '2021-03-20 22:18:19', '2021-03-20 22:18:19', NULL),
(259, 'Picardy Antique Pearl LAF Leaves Chair', '56883', '989.36', '98.00', '10', 'Part of Picardy Collection from Acme\nCrafted from poplar wood\nAntique pearl finish\nIncludes accent pillow\nButton tufted\nOversized scrolled molding tri', '', '2021-03-20 22:18:20', '2021-03-20 22:18:20', NULL),
(260, 'Fabrizzi Modern Dining/Accent Chair in Walnut and Denim Blue - Set of 2', 'CH-FBZZNL WL+BU', '203.33', '20.00', '14', 'Mid-Century Modern styling\nFixed dining height\nCushioned backrest and seat upholstered in fabric\nOpen design backrest\nBentwood seat back', '', '2021-03-20 22:18:20', '2021-03-20 22:18:20', NULL),
(261, 'Americana White Box Cushion Slipcovered Chair', 'SU-108520-391081', '1347.68', '134.00', '20', 'Dual performance fabric combines high-performance fibers and high-performance polyester yarns which are then encapsulated in a stain and water-resista', '', '2021-03-20 22:18:20', '2021-03-20 22:18:20', NULL),
(262, 'A973B Italian Leather Mini Sectional Left Facing Chaise in Maroon', '179066-LHFC', '2922.76', '292.00', '17', 'A fusion of style, and comfort. This sleek design is sure to add spice to any decor while maintaining a modernistic clean design. Beautifully crafted ', '', '2021-03-20 22:18:20', '2021-03-20 22:18:20', NULL),
(263, 'Meridian Julian 621Grey Velvet Chaise', '621Grey-Chaise', '1215.90', '125.00', '20', 'Grey Velvet\nChrome Stainless Steel Base\nCurved Back Design\nThe perfect mix of grey velvet and chrome stainless steel comes to life in your space with ', '', '2021-03-20 22:18:20', '2021-03-20 22:18:20', NULL),
(264, 'Astro Pumpkin Lounger', ' 18062-LG', '1888.64', '188.00', '14', 'Part of Astro Collection\nAlluring Architecture\nThick Italian Leather\nAdjustable Ratchet Headrests for Maximum Comfort\nClever Chrome Leg Design\nPlusher', '', '2021-03-20 22:18:20', '2021-03-20 22:18:20', NULL),
(265, 'Azusa Ash Grey and Beige Sunlounger', 'PAT6729B', '457.71', '45.00', '10', 'Designed to add exotic tropical charm to any outdoor living area, this sunlounger is a top designer selection. Crafted with ash grey acacia wood for d', '', '2021-03-20 22:18:20', '2021-03-20 22:18:20', NULL),
(266, 'Romeo Light Grey Fabric Left Chaise', 'RN-1117-29', '1525.00', '152.00', '17', 'Build your own modular sectional.\nPlush cushions make for a comfortable oasis.\nRub Count: 30,000.\nModular sectionals are essential for those who need ', '', '2021-03-20 22:18:20', '2021-03-20 22:18:20', NULL),
(267, 'Abigail Sky Blue ChaiseAbigail Sky Blue Chaise', 'ME-1053-28', '1625.00', '162.00', '20', 'A soft velvet finish shows you\'re on trend.\nComfortable foam padding for a relaxing seating experience. Adds stylish mid-century design to your home.\n', '', '2021-03-20 22:18:20', '2021-03-20 22:18:20', NULL),
(268, 'Rawcliffe Parchment Oversized Accent Ottoman', '1960408', '519.64', '51.00', '20', 'Corner-blocked frame\nFirmly cushioned\nHigh-resiliency foam cushion wrapped in thick poly fiber\nPolyester upholstery\nExposed feet with faux wood finish', '', '2021-03-20 22:18:20', '2021-03-20 22:18:20', NULL),
(269, 'Accrington Earth Oversized Accent Ottoman', '7050808', '326.25', '32.00', '20', 'Corner-blocked frame\nFirmly cushioned\nHigh-resiliency foam cushion wrapped in thick poly fiber\nPolyester upholstery\nExposed feet with faux wood finish', '', '2021-03-20 22:18:20', '2021-03-20 22:18:20', NULL),
(270, 'Curated Sloane White Ottoman', '685504-615', '880.00', '88.00', '20', 'Part of Sloane Collection from Universal\nSky salt finish\nStructural integrity is secured by mortise & tenon joints and corner blocks in all stress are', '', '2021-03-20 22:18:21', '2021-03-20 22:18:21', NULL),
(271, 'Meridian Chesterfield Velvet Ottoman in Black 662BL-Ott', '662BL-Ott', '375.89', '37.00', '20', 'Chesterfield Collection by Meridian Furniture\nBlack finish\nBlack velvet\nSilver nailheads\nDimensions: 19\" H x 36\" W x 36\" D', '', '2021-03-20 22:18:21', '2021-03-20 22:18:21', NULL),
(272, 'Declan Blue and Natural Ottoman with Brass Nailhead Detail', 'MCR4639E', '292.64', '29.00', '20', 'The Declan ottoman seamlessly bridges Eastern and Western design influences with its cutout motif inspired by Moroccan architecture and fashion-right ', '', '2021-03-20 22:18:21', '2021-03-20 22:18:21', NULL),
(273, 'Harrison Black Double Tray Ottoman', 'HUD8234B', '374.05', '37.00', '20', 'Get ready to get organized with the Harrison Double Tray Ottoman. This ramped up modern storage piece has two tailored cushions that reverse to reveal', '', '2021-03-20 22:18:21', '2021-03-20 22:18:21', NULL),
(274, 'Sundown Adjustable Sofa Bed (Espresso/Pebble)', '5250-ESP-PEB', '664.41', '66.00', '15', 'Chrome metal legs\nEspresso, pebble finish\nThe Sundown Adjustable Sofa by Crown Mark is ideal for apartments, lofts and condos.', '', '2021-03-20 22:18:21', '2021-03-20 22:18:21', NULL),
(275, 'Hamar Sofa Bed (Chocolate)', '57028', '422.35', '42.00', '10', 'Hamar Sofa Bed (Chocolate) by Acme Furniture\nThe Hamar Adjustable Sofa by Acme Furniture will be a welcome addition to your home, great for smaller sp', '', '2021-03-20 22:18:21', '2021-03-20 22:18:21', NULL),
(276, 'Nettie Futon Sofa', 'CM2605', '743.94', '74.00', '15', 'Mid-Century Modern\nGray\nLinen, Solid Wood, Other\nSleeper Conversion\nTrack Arms\nButton Tufted\nMid-Century Modern StyleGray LinenButton TuftedTrack Arms', '', '2021-03-20 22:18:22', '2021-03-20 22:18:22', NULL),
(277, 'Furniture of America Clifton Twin Loft Bed with Futon Base', 'CM-BK1024', '712.63', '71.00', '20', 'Contemporary Style\nFull Metal Construction\nDrawers not Included\nSilver & Black Finish\nSimple, clean lines create an ultra modern look with the silver ', '', '2021-03-20 22:18:22', '2021-03-20 22:18:22', NULL),
(278, 'Gallagher Sofa Bed (Dark Brown)', 'CM2675BR', '792.28', '79.00', '20', 'Contemporary Style\nChampion Fabric & Leatherette\nConverts into Bed\nBluetooth Speakers along Front\nChrome Legs\nAvailable in 2 Colors\nChampion fabric an', '', '2021-03-20 22:18:22', '2021-03-20 22:18:22', NULL),
(279, 'Aristo Sofa Bed (Dark Brown)', 'CM2906DK', '748.76', '74.00', '20', 'Contemporary\nConverts Into Bed\nLeatherette Seat\nExtra Support Legs\nAvailable in 4 Colors\nLeatherette coverDark brown finishConverts into a bedExtra su', '', '2021-03-20 22:18:22', '2021-03-20 22:18:22', NULL),
(280, 'Berkeley Leather Sumatra Sofa', '417501-500', '4650.00', '465.00', '10', 'Part of Berkeley collection\nFrame is crafted from precision Milled, Kiln Dried solid and laminated hardwood\nFabric content: 100% Leather\nSumatra finis', '', '2021-03-20 22:18:23', '2021-03-20 22:18:23', NULL),
(281, '397 Chocolate Italian Leather RAF Sectional', '175442911-RHFC', '4091.07', '409.00', '15', 'Seats and Backs have High Density Foam\nAvailable as Rhf Chaise Or Lhf Chaise\nTop Grain Chocolate Italian Leather\nAll Corners are Blocked\nGlued for Str', '', '2021-03-20 22:18:23', '2021-03-20 22:18:23', NULL),
(282, 'Allegra Slate Gray Leather Power Reclining RAF Sectional', '18205-SRHFC', '4091.07', '409.00', '15', 'Part of Allegra Collection\nSlate grey finish\nPower reclining mechanism\nSlate grey thick durable premium grade leather upholstery\n3 adjustable headrest', '', '2021-03-20 22:18:23', '2021-03-20 22:18:23', NULL),
(283, 'Winston Antique Blue Bonded Leather Sofa', 'LC10603ATBL', '1483.39', '148.00', '14', 'Part of Winston Collection\nBun finished feet\nTufted back accenting design\nUpholstered in Bonded leather\nThe classic Winston is a staple in every room ', '', '2021-03-20 22:18:23', '2021-03-20 22:18:23', NULL),
(284, 'Lauren White Leather RAF Sectional', '182437-RHFC', '3116.55', '316.00', '15', 'Part of Lauren Collection\nInspired by innovation\nSimple yet aesthetically pleasing design\nUpholstered in premium leather all around\nOpens to provide a', '', '2021-03-20 22:18:23', '2021-03-20 22:18:23', NULL),
(285, 'Brancaster Retro Brown Leather Loveseat', '53546', '1746.07', '174.00', '20', 'Part of Brancaster Collection from Acme\nWooden frame\nRetro brown finish\nTop grain Leather upholstery\nShelter armrest\nTight back and seat\nThe Brancaste', '', '2021-03-20 22:18:23', '2021-03-20 22:18:23', NULL),
(286, 'Nadene Rose Drum Occasional Table Set', '67602-ROOM', '725.46', '72.00', '40', 'Part of Nadene Collection from Riverside Furniture\nAluminum frame construction\nRose finish', '', '2021-03-20 22:18:23', '2021-03-20 22:18:23', NULL),
(287, 'ColChester Dark Cherry 3 Piece Occasional Table Set', 'CM4423-3PK', '654.06', '65.00', '30', 'Part of ColChester Collection\nCrafted from Solid Wood, Wood Veneer & Other materials\nDark Cherry Finish\nTraditional Style\nFaux Marble Table Top\nIntric', '', '2021-03-20 22:18:23', '2021-03-20 22:18:23', NULL),
(288, 'Lantana Antiqued Honey Occasional Table Set by Steve Silver', 'LT150C;LT150E', '796.28', '79.00', '20', 'Part of Lantana Collection from Steve Silver\nCrafted from acacia veneers\nAntiqued honey finish\nBlack finished metal frame\nExposed rivets\nFramed top an', '', '2021-03-20 22:18:23', '2021-03-20 22:18:23', NULL),
(289, 'Morgan Round Occasional Table Set', 'MG200C-MG200E', '260.00', '26.00', '25', 'Faux concrete top constructed from Silvershield with black iron tube base\nGrey modeled finish with industrial concrete look is great for today\'s livin', '', '2021-03-20 22:18:23', '2021-03-20 22:18:23', NULL),
(290, 'Saluki Retro Occasional Table Set by Homelegance', '3602-30;3602-04', '519.10', '51.00', '45', 'Part of Saluki Collection from Homelegance\nCrafted from oak veneer\nClassic look of mid-century modern design\nRetro profile combined with the multi-lay', '', '2021-03-20 22:18:23', '2021-03-20 22:18:23', NULL),
(291, 'T1628 Occasional Table Set by Global Furniture USA', 'T1628C;T1628E', '720.06', '72.00', '25', 'Clear glass tops\nOpposite oval design\nStainless steel bases\nOne oval pedestal is white high gloss laminate and one is a grey wood laminate\nThe T1628 O', '', '2021-03-20 22:18:23', '2021-03-20 22:18:23', NULL),
(292, 'Mercer Court Tobacco Sofa Table', '109-OT1030', '586.37', '58.00', '20', 'Part of Mercer Court Collection\nCrafted from chinese hardwoods\nTobacco finish\nHeavy block legs\nThick reclaimed tops\nSolid wood construction\nBottom she', '', '2021-03-20 22:18:23', '2021-03-20 22:18:23', NULL),
(293, 'Meridian 410T', '410-T', '851.43', '85.00', '45', 'The Jade console table will elevate your decor. The table features a staggered and mirrored geometric base that will add a spacious appeal to your spa', '', '2021-03-20 22:18:23', '2021-03-20 22:18:23', NULL),
(294, 'Barclay Natural Walnut Sofa Table', ' ZBCL-4300', '670.86', '67.00', '41', 'Part of Barclay Collection from Legends Furniture\nCrafted from walnut solids and vaneers\nNatural walnut finish\n2 doors\nMid-century modern styling\n1 op', '', '2021-03-20 22:18:23', '2021-03-20 22:18:23', NULL),
(295, 'Nova Glass Top Rectangular Sofa Table', 'NV100SB-NV100ST', '285.25', '28.00', '20', 'Part of Nova Collection from Steve Silver\n12mm Tempered Glass Top\nX-Shaped Chrome Base\nSturdy Gauge Metal\nContemporary Style\nBring perfection and bril', '', '2021-03-20 22:18:23', '2021-03-20 22:18:23', NULL),
(296, 'Gavelston Dry Vintage Weathered Black Sofa Table', 'T732-4', '423.50', '42.00', '30', 'Hand-finished\n1 fixed shelf\n4 drawers\nMade of veneers, wood and engineered wood\nDry vintage weathered black finish\nAssembly required\nTables are made w', '', '2021-03-20 22:18:24', '2021-03-20 22:18:24', NULL),
(297, 'Sophie Natural Sofa Table with 2 Upholstered Stools', '50316', '788.48', '78.00', '20', 'Part of Sophie Collection from Riverside Furniture\nCrafted from hardwood solid and oak veneer\nNatural finish\n2 stools have an upholstered seat and met', '', '2021-03-20 22:18:24', '2021-03-20 22:18:24', NULL),
(298, 'Mirimyn Antique Teal Door Accent Cabinet', 'T505-762', '584.22', '58.00', '15', 'Made of veneers, wood and engineered wood\n4 cabinet doors with glass inlays revealing 2 adjustable shelves\nAssembly required\nMade with select veneer a', '', '2021-03-20 22:18:24', '2021-03-20 22:18:24', NULL),
(299, 'High Gloss White Chairside Chest', 'DS-D204-014', '478.05', '47.00', '14', 'Solid wood frame construction\nModern contemporary style\nHigh gloss white Polyester finished case frame and shelf\nChrome finished steel frame\n1 drawer ', '', '2021-03-20 22:18:24', '2021-03-20 22:18:24', NULL),
(300, 'Dark Brown Carved 2 Door Accent Chest', 'DS-D273-003', '386.16', '38.00', '15', 'Crafted from sturdy manufactured wood\nDark brown finish\nCarved door designs\n2 doors with 1 adjustable shelf for storage\nUnderstated antiqued brass kno', '', '2021-03-20 22:18:24', '2021-03-20 22:18:24', NULL),
(301, 'Signature Designs Natural Honey Sandblasted Bushido Hall Chest', '01-2118-973', '3188.96', '318.00', '25', 'Part of Signature Designs Collection from Artistica Home\nCrafted from elm solids and veneers wood\nNatural honey sandblasted finish\nAntique brass finis', '', '2021-03-20 22:18:24', '2021-03-20 22:18:24', NULL),
(302, 'Dark Brown 3 Drawer Accent Chest', 'D199-002', '923.06', '92.00', '10', 'Crafted from hardwood, manufactured wood and solid wood veneers\n3 drawers\nBall bearing drawer side glides\nEnglish and french Dovetail Drawer Construct', '', '2021-03-20 22:18:24', '2021-03-20 22:18:24', NULL),
(303, 'Accentrics Home Walnut Brown Geo Serpentine 2 Door Chest', 'DS-D229-027', '909.37', '90.00', '25', 'Part of Accentrics Home Collection from Pulaski\nMid-century modern style\n2 sided adjustable shelf\nCrafted from solid and manufactured wood frame', '', '2021-03-20 22:18:24', '2021-03-20 22:18:24', NULL),
(304, 'Dean Desert Brown 2-Drawer Coffee Table', ' COF5701B', '191.98', '20.00', '30', 'Bring the warmth of retro vintage style to any interior with this contemporary 2-drawer console. Designed with a special water-based paint treatment, ', '', '2021-03-20 22:18:24', '2021-03-20 22:18:24', NULL),
(305, 'Gavelston Dry Vintage Weathered Black Sofa Table', 'T732-48', '423.50', '42.00', '50', 'Hand-finished\n1 fixed shelf\n4 drawers\nMade of veneers, wood and engineered wood\nDry vintage weathered black finish\nAssembly required\nTables are made w', '', '2021-03-20 22:18:24', '2021-03-20 22:18:24', NULL),
(306, 'Nomad Console Table', '101369', '1484.25', '184.00', '40', 'Simple and refined, this console table from our MIXT collection has sharp lines that create visual interest towards the inner frame. Crafted from natu', '', '2021-03-20 22:18:24', '2021-03-20 22:18:24', NULL),
(307, 'Xavier Console Table', '102372', '901.71', '90.00', '25', 'Top and shelf made with tempered glass\nBrushed stainless steel frame\nIndustrial webbing for comfort and durability\nCorner block construction on seat f', '', '2021-03-20 22:18:24', '2021-03-20 22:18:24', NULL),
(308, 'Urban Loft 84 inch Super Console UL1284-MOC', 'UL1284.MOC', '927.20', '92.00', '30', 'Product comes fully assembled\nDesigned and built in the U.S.A.\nDado Construction for supreme durability\nSimplicity in form and function. Urban Loft of', '', '2021-03-20 22:18:24', '2021-03-20 22:18:24', NULL),
(309, 'Morrissey Bezel Hillier Console Table', '218307-2727', '1026.81', '102.00', '15', 'Part of Morrissey Collection\nBezel finish\nPierced pedestal support\nStone top\nAnother dramatic interpretation of traditional patterns. Pierced pedestal', '', '2021-03-20 22:18:25', '2021-03-20 22:18:25', NULL),
(310, 'Liberty Furniture Mirage 7-Piece Trestle Dining Table Set in Wirebrushed White', '946-TDSET', '3.00', '2.00', '300', '7-Piece Trestle Dining Table Set,Rubberwood Solids w/ White Oak Veneers,Includes One 20 Inch Leaf,Block Leg Style,Center Trestle,Unique Center Faux Tr', '', '2021-03-20 22:18:25', '2021-03-20 22:18:25', NULL),
(311, 'Liberty Furniture Mirage 5-Piece Round Dining Table Set in Wirebrushed White', '946-RDSET', '3.00', '1.00', '200', '5-Piece Round Dining Table Set,Rubberwood Solids w/ White Oak Veneers,Fixed Faux Travertine Top,Cylinder Style Pedestal,Wood Framed Upholstered Panel ', '', '2021-03-20 22:18:25', '2021-03-20 22:18:25', NULL),
(312, 'Bevelle Silver Extendable Dining Room Set', '1958-96;1958S', '2.00', '1.00', '100', 'Part of Bevelle Collection from Homelegance,Silver finish,Acrylic inset framing,Extendable table,Includes 1- 18\" leaf,Table extends from 78\" to 96\"', '', '2021-03-20 22:18:25', '2021-03-20 22:18:25', NULL),
(313, 'Havenbrook Rustic Russet Trestle Dining Room Set', '262-P4276-T4276;262-', '2.00', '933.83', '900', 'Part of Havenbrook Collection from Liberty,Crafted from reclaimed oak and rubberwood solids with oak veneers,Rustic russet finish,Live edge top,Block ', '', '2021-03-20 22:18:25', '2021-03-20 22:18:25', NULL),
(314, 'Xanthe Black Rectangular Dining Room Set', ' CM3172T;CM3175SC-2P', '1.00', '365.48', '300', 'Part of Xanthe Collection,Crafted from solid wood and wood veneers,Black finish,Wooden top,Chair features X-cross back design and padded fabric cushio', '', '2021-03-20 22:18:26', '2021-03-20 22:18:26', NULL),
(315, 'Meridian Furniture Pierre 5pcs Dining Room Set in Rich Gold Stainless Steel', '714-T;714BE-C', '3.00', '1.00', '700', 'Pierre Collection by Meridian Furniture,Rich gold stainless steel finish,Glass top,Plush navy velvet chairs,Deep tufting on chairs,Chair available in ', '', '2021-03-20 22:18:26', '2021-03-20 22:18:26', NULL),
(316, 'Deryn Park Cherry Extendable Leg Dining Room Set', '2243-114;2243S', '3.00', '1.00', '300', 'Part of Deryn Park Collection,Cherry Finish,Sophisticated design,Burl inset flanks the book-match veneered cherry-finished tabletop,Gold tipping,Exten', '', '2021-03-20 22:18:26', '2021-03-20 22:18:26', NULL),
(317, 'D4126 Dining Room Set (Oak and Walnut) ', 'D4126NDT;D4126NDC', '1.00', '239.93', '200', 'S-shaped two tone walnut and oak wood tone dining table,Clear glass top,Stainless steel base with polished chrome accent,Matching three drawer buffet ', '', '2021-03-20 22:18:26', '2021-03-20 22:18:26', NULL),
(318, 'D1628 Dining Room Set w/ Two-Tone Chairs ', 'D1628DT;D915DC-GR', '1.00', '523.36', '200', 'Clear glass top,Opposite oval design,Stainless steel base,One oval pedestal is white high gloss laminate and one is a grey wood laminate,Dark grey two', '', '2021-03-20 22:18:26', '2021-03-20 22:18:26', NULL),
(319, 'Berringer Drop Leaf Dinette Set', 'D199-15;D199-01', '1.00', '1.00', '700', 'Part of Berringer Collection,Crafted from select veneers and hardwood solids,Rustic hand applied finish,Table features 2 drop leaves,RTA side chair fe', '', '2021-03-20 22:18:27', '2021-03-20 22:18:27', NULL),
(320, 'Slingsbury Gray and Dark Bronze 3 Piece Dining Set', 'CM3279T-29-3PK', '585.00', '30.86', '600', 'Part of Slingsbury Collection,Crafted from wood and metal,Gray and dark bronze finish,X-cross back design,Unique triple-bar legs,Sleek rounded corners', '', '2021-03-20 22:18:27', '2021-03-20 22:18:27', NULL),
(321, 'Crown Mark Aiden 5pc Dinette Set', '1217SET', '819.00', '175.78', '500', 'Faux Marble table topMetal seats to provide more supportMarble Finish with Black Legs and Trim', '', '2021-03-20 22:18:28', '2021-03-20 22:18:28', NULL),
(322, 'Crown Mark Aiden 5pc Counter Height Dinette Set', '1817SET', '871.00', '220.03', '800', 'Contemporary styling perfect for any Decor Metal chair legs and fabric chair cushionEasy care and cleaningFaux Marble Top with Black Metal Legs and Tr', '', '2021-03-20 22:18:28', '2021-03-20 22:18:28', NULL),
(323, 'Atwood 3-Piece Pack Counter Height Set', '2505BK-36', '759.00', '98.84', '900', '\nTraditional style,Black and rich espresso two-tone Finish,7\" Drop Leaf,Table Extends from 22\" to 29\",Wine storage,Napoleon back chairs', '', '2021-03-20 22:18:28', '2021-03-20 22:18:28', NULL),
(324, 'Geode Warm Kona Mineral Kitchen Island Set', '238254-2303;238209-2', '6.00', '3.00', '300', 'Part of geode collection from art furniture,Crafted from white oak, quarter sawn and cathedral sawn,Warm kona finish,Timeless beauty of natural materi', '', '2021-03-20 22:18:28', '2021-03-20 22:18:28', NULL),
(325, 'Westerlyn Black 5 Burnished Piece Dinette Set', '5592', '759.00', '168.19', '100', 'Part of Westerlyn Collection from Homelegance,Crafted from wood and metal,Burnished finish,Stool seating tucks neatly under the tabletop,Black metal f', '', '2021-03-20 22:18:28', '2021-03-20 22:18:28', NULL),
(326, 'Filbert Gray Oak and Chrome 3 Piece Counter Height Dining Set', '72075', '959.00', '187.12', '800', 'Part of Filbert Collection from Acme,Wood and metal frame construction,Gray oak and chrome finish,KD construction,This contemporary Filbert counter he', '', '2021-03-20 22:18:28', '2021-03-20 22:18:28', NULL),
(327, 'Nyssa Walnut 3 Piece Counter Height Dining Set', '73050', '729.00', '488.08', '800', 'Part of Nyssa Collection from Acme,Crafted from rubberwood, MDF and okumi veneer,Walnut finish,Rectangula shape,3 shelves,Wooden seat,Wooden square le', '', '2021-03-20 22:18:28', '2021-03-20 22:18:28', NULL),
(328, 'Fatima Gray Oak 3 Piece Adjustable Counter Height Dining Set', '73125', '815.00', '154.30', '500', 'Part of Fatima Collection from Acme,Crafted from paulownia wood veneer and MDF,Gray oak and metal finish,Adjustable top and seat height,Metal curved l', '', '2021-03-20 22:18:28', '2021-03-20 22:18:28', NULL),
(329, 'Liberty Furniture Mirage Upholstered Side Chair in Wirebrushed White 946-C6501S Set of 2', ' 946-C6501S', '664.00', '133.09', '400', 'Upholstered Side Chair,Rubberwood Solids w/ White Oak Veneers,Wood Framed Upholstered Panel Back Chair,Upholstered in Gray Linen,Tapered Legs,Sold in ', '', '2021-03-20 22:18:28', '2021-03-20 22:18:28', NULL),
(330, 'Liberty Furniture Mirage Upholstered Arm Chair in Wirebrushed White 946-C6501A Set of 2', '946-C6501A', '800.00', '219.53', '300', 'Upholstered Arm Chair,Rubberwood Solids w/ White Oak Veneers,Wood Framed Upholstered Panel Back Chair,Upholstered in Gray Linen,Tapered Legs,Sold in s', '', '2021-03-20 22:18:28', '2021-03-20 22:18:28', NULL),
(331, 'Farmhouse Reimagined Antique White Splat Back Side Chair Set of 2', '652-C6501S', '722.00', '356.00', '200', 'Pine and Poplar Solids with Hickory & Pine Veneers,Antique White Finish with Chestnut Tops,Finish Features Heavy Wire Brush and Distressing,Tapered Le', '', '2021-03-20 22:18:28', '2021-03-20 22:18:28', NULL),
(332, 'Havenbrook Rustic Russet Upholstered Side Chair set of 2', ' 262-C6501S', '640.00', '85.49', '300', 'Part of Havenbrook Collection from Liberty,Crafted from reclaimed oak and rubberwood solids with oak veneers,Rustic russet finish,Block style legs', '', '2021-03-20 22:18:28', '2021-03-20 22:18:28', NULL),
(333, 'Arlington House Cobblestone Brown Upholstered Host Chair set of 2', '411-C6501S', '739.00', '212.94', '500', 'Part of Arlington House Collection,Crafted from poplar solids and acacia veneers,Cobblestone brown finish,French industrial design,Curved metal base,F', '', '2021-03-20 22:18:28', '2021-03-20 22:18:28', NULL),
(334, 'Sun Valley Sandstone Slat Back Side Chair set of 2', '439-C1501S', '433.00', '230.00', '600', 'Rubberwood Solid Frame & Melamine,Sandstone Finish,Upholstered in Gray Tweed,Tapered Legs,18\" Chair Seat Height,22\" Chair Back Height', '', '2021-03-20 22:18:28', '2021-03-20 22:18:28', NULL),
(335, 'Moriville Beige Upholstered Side Chair Set of 2', 'D631-01', '307.83', '87.95', '200', 'Made of wood,Polyester upholstery over foam cushioned seat,Nailhead trim with antiqued bronze-tone finish,Assembly required,Made with Rubberwood solid', '', '2021-03-20 22:18:28', '2021-03-20 22:18:28', NULL),
(336, 'Cherry Grove Classic Antique Cherry Pierced Back Side Chair Set of 2', '\n 792-654', '1.00', '400.00', '200', 'Part of Cherry Grove Collection,Crafted from Cathedral cherry veneers, alder solids and select hardwoods,Classic Antique Cherry Color Finish,Tradition', '', '2021-03-20 22:18:28', '2021-03-20 22:18:28', NULL),
(337, 'Lawson Splat Back Side Chair set of 2', '116-C2501S', '529.00', '353.56', '100', 'Part of Lawson Collection,Crafted from Rubberwood Solids & Walnut Veneers,Light & Dark Expresso Finish,Upholstered in Chocolate PVCUV Top Coat,Sold as', '', '2021-03-20 22:18:28', '2021-03-20 22:18:28', NULL),
(338, 'Porsha Grey Velvet Dining Chair (Set of 2) 755Grey-C', '755Grey-C', '966.17', '276.05', '200', 'Luxurious Grey Velvet,Rich Gold Metal Legs,Channel Tufted Design on Back,Contemporary Design', '', '2021-03-20 22:18:28', '2021-03-20 22:18:28', NULL),
(339, 'Liberty Furniture Mirage Trestle Dining Table in Wirebrushed White', '946-P4298', '1.00', '1.00', '200', 'Trestle Dining Table,Rubberwood Solids w/ White Oak Veneers,Block Leg Style,Center Trestle,Unique Center Faux Travertine Insert Runs Length of Top,Tab', '', '2021-03-20 22:18:28', '2021-03-20 22:18:28', NULL),
(340, 'Liberty Furniture Mirage Round Dining Table in Wirebrushed White', '946-P5454', '1.00', '116.70', '200', 'Round Dining Table,Rubberwood Solids w/ White Oak Veneers,Cylinder Style Pedestal,Fixed Faux Travertine Top,Table include Table top and base,Wirebrush', '', '2021-03-20 22:18:28', '2021-03-20 22:18:28', NULL),
(341, 'Summer House Oyster White Extendable Rectangular Leg Table', '607-T4078', '849.00', '254.37', '900', 'Part of Summer House Oyster White Collection,Crafted from Poplar/Pine Solids with Wood Products,Oyster White Finish,Extendable Table,Includes 1- 12\" L', '', '2021-03-20 22:18:28', '2021-03-20 22:18:28', NULL),
(342, 'Cinema Shadow Grey Rectangular Extendable Leg Dining Table', 'N7200-222', '1.00', '306.89', '600', 'Part of Cinema Collection from Rachael Ray,Crafted from select hardwoods, walnut veneer,Shadow grey finish,CA CARB P2 Compliant,Include 2- 20.5\" leave', '', '2021-03-20 22:18:28', '2021-03-20 22:18:28', NULL);
INSERT INTO `product` (`productId`, `name`, `sku`, `price`, `discount`, `quantity`, `description`, `status`, `createdAt`, `updatedAt`, `color`) VALUES
(343, 'Bevelle Silver Extendable Dining Table', '1958-96', '1.00', '366.95', '500', 'Part of Bevelle Collection from Homelegance,Silver finish,Acrylic inset framing,Extendable table,Includes 1- 18\" leaf,Table extends from 78\" to 96\",Op', '', '2021-03-20 22:18:28', '2021-03-20 22:18:28', NULL),
(344, 'Meridian Pierre Dining Table in Gold 714-T', '714-T', '1.00', '373.98', '100', 'Pierre Collection by Meridian Furniture,Rich gold stainless steel finish,Glass top', '', '2021-03-20 22:18:28', '2021-03-20 22:18:28', NULL),
(345, 'Meridian Alexis Dining Table in Chrome 731-T', '731-T', '1.00', '338.43', '100', 'Alexis Collection by Meridian Furniture,Chrome finish,Rich Chrome stainless steel,Glass top', '', '2021-03-20 22:18:29', '2021-03-20 22:18:29', NULL),
(346, 'Mercury Acrylic/Gold Dining Table', '916-T', '1.00', '384.52', '500', 'Acrylic & Gold Metal Base Round Dining Table,Tempered Glass Top,Contemporary Design,Bring modern pizzazz to your living room with this Mercury Acrylic', '', '2021-03-20 22:18:29', '2021-03-20 22:18:29', NULL),
(347, 'Meridian Juno Dining Table in Chrome 732-T', '732-T', '1.00', '463.41', '600', 'Juno Collection by Meridian Furniture,Chrome Finish,Rich Chrome stainless steel,Glass top', '', '2021-03-20 22:18:29', '2021-03-20 22:18:29', NULL),
(348, 'Deryn Park Cherry Extendable Rectangular Dining Table', '2243-114', '1.00', '257.34', '290', 'Part of Deryn Park Collection,Cherry Finish,Sophisticated design,Burl inset flanks the book-match veneered cherry-finished tabletop,Gold tipping,Exten', '', '2021-03-20 22:18:29', '2021-03-20 22:18:29', NULL),
(349, 'Aldric Faux Marble Bakers Rack', '73003', '799.00', '135.67', '100', 'Part of Aldric Collection from Acme,Metal frame construction,Antique finish,KD construction,Marble top,Wine bottle storage,Bottom shelf storage', '', '2021-03-20 22:18:30', '2021-03-20 22:18:30', NULL),
(350, 'Urban Rustic Bakers Rack', 'UR-CA-5669-BWH-C', '1.00', '451.71', '700', 'Part of Urban Rustic Collection from Intercon,Crafted from pine solids and pine veneer,Beautiful reclaimed wood styling with a brushed wheat finish,St', '', '2021-03-20 22:18:30', '2021-03-20 22:18:30', NULL),
(351, 'Whitesburg Large Dining Room Bench', 'D583-00', '115.00', '30.12', '200', 'Assembly required,Made of veneers, wood and engineered wood,Two-tone finish,Made with select veneers and hardwood solids in a two-tone finish. Table a', '', '2021-03-20 22:18:30', '2021-03-20 22:18:30', NULL),
(352, 'Magnolia Manor Nook Bench', '244-NC9000B', '350.03', '24.19', '900', 'Poplar solids w/White Oak and Birch veneers,Antique White finish,Wood seat,The blending of European in fluences makes Magnolia Manor Dining Room Colle', '', '2021-03-20 22:18:30', '2021-03-20 22:18:30', NULL),
(353, 'Crown Mark Maldives Counter Height Dining Bench in Brown 2760-BENCH', '2760-BENCH', '819.99', '234.28', '600', 'Maldives Collection by Crown Mark Furniture,Brown finish,Faux leather upholstered seat,Square tapered legs,Hi-back dining bench,Hi-back seat back,Supp', '', '2021-03-20 22:18:30', '2021-03-20 22:18:30', NULL),
(354, 'Ora Dining Bench', 'OR700BN', '416.01', '118.86', '500', 'Constructed of hardwood solids, veneers and engineered woods,Upholstered seat makes for a comfortable dining experience,Lustrous multi-step finish bea', '', '2021-03-20 22:18:30', '2021-03-20 22:18:30', NULL),
(355, 'Magnolia Manor 56 Inch Nook Bench', '244-NLB9000', '740.03', '176.09', '500', 'Poplar solids w/White Oak and Birch veneers,Antique White finish,Wood seat,The blending of European in fluences makes Magnolia Manor Dining Room Colle', '', '2021-03-20 22:18:30', '2021-03-20 22:18:30', NULL),
(356, 'Trulinea Dark Espresso Upholstered Dining Bench', '6084-03', '296.00', '54.34', '200', 'Part of trulinea collection from alpine,Crafted from acacia solids,Dark espresso finish,Tufted upholstered seating,Quick Ship', '', '2021-03-20 22:18:30', '2021-03-20 22:18:30', NULL),
(357, 'Low Country Counter Height Bench', '585-C900124B', '428.03', '181.06', '500', 'Poplar solids w/Cathedral White Oak veneers,Sea Oat White finish w/heavy rub thru and distressing,Seat upholstered in taupe linen,Features one shelf,S', '', '2021-03-20 22:18:30', '2021-03-20 22:18:30', NULL),
(358, 'Yelena Counter Height Bench', '72943', '363.03', '213.52', '200', 'Wood and composite wood,Weathered Espresso finish,Padded seat: Gray fabric,Simple, smart, and stylish, the Yelena Dining Room Collection by Acme Furni', '', '2021-03-20 22:18:30', '2021-03-20 22:18:30', NULL),
(359, 'Avesta 45.28 Mid-Century Modern High Double Cabinet With Funky Colorful Design And Solid Wood Legs In White, Color Stamp And Yellow', '177AMC132', '808.84', '552.41', '600', 'Mid-Century Modern Accent Chest Cabinet Perfect for Home Office, Kids Room, Living Room and Bedroom,Upon Assembly, Measures: 35.43 in Length, 45.28 in', '', '2021-03-20 22:18:30', '2021-03-20 22:18:30', NULL),
(360, 'Shabby Chic Cottage Antique Gray 1 Door Accent Cabinet', 'CC-TAB1032LD-AGOJ', '766.34', '585.21', '500', 'Single door space saving cabinet,Shabby chic lightly distressed antique gray glazed finish,Crafted from solid Mahogany wood,Interior, back and shelves', '', '2021-03-20 22:18:31', '2021-03-20 22:18:31', NULL),
(361, 'Keegan Buffet and Hutch', '2546-50', '1.00', '328.85', '300', 'Rich brown cherry Finish,Ample storage,Satin nickel hardware', '', '2021-03-20 22:18:31', '2021-03-20 22:18:31', NULL),
(362, 'Arcadia File Cabinet ZARC-6010', 'ZARC-6010', '1.00', '289.58', '800', 'Product Comes Fully Assembled,Custom rubbed bronze hardware,Multi-Step Old Forest Glen Finish,Transitional styling,Sophistication in design can be see', '', '2021-03-20 22:18:31', '2021-03-20 22:18:31', NULL),
(363, 'Milam Cream 2 Door Drop Lid Cabinet', '22599', '1.00', '334.17', '200', 'Part of Milam Collection from Coast To Coast,Crafted from MDF and birch wood,Painted finish,Antique brass knob hardware,AC and USB ports,2 fixed shelv', '', '2021-03-20 22:18:31', '2021-03-20 22:18:31', NULL),
(364, 'Bree Two Door Cabinet 53426', '53426', '1.00', '536.58', '200', 'Mango,2 Floral Carved Doors with Flower Carved Hardware,Crown Moulding Trim,One Interior Fixed Shelf,Ball Foot,Adjustable Levelers,Stunningly carved d', '', '2021-03-20 22:18:31', '2021-03-20 22:18:31', NULL),
(365, 'Ottey Cabinet', '92543', '954.73', '272.78', '700', 'Rectangular Office Cabinet,Storage: 1 Drawer & 1 Door,Features: Contemporary Style,Wooden Top & Drawers: White High Gloss,Metal Leg Base: Gold Finish,', '', '2021-03-20 22:18:31', '2021-03-20 22:18:31', NULL),
(366, 'Gorsedd Buffet w/ Hutch', '67444', '2.00', '126.01', '200', 'Wood (Poplar) and wood veneer (Birch)Antique White finishRaised floral trim and crown motifsSide metal drawer glidesEnglish and French dovetailed draw', '', '2021-03-20 22:18:31', '2021-03-20 22:18:31', NULL),
(367, 'Picardy Buffet w/ Hutch', '63464', '5.00', '2.00', '900', 'Wood (Rubberwood) and wood veneer (Cherry)Antique Pearl and Cherry Oak finishPoly resin ornamental detail with antique contrast finishRaised scrolled ', '', '2021-03-20 22:18:31', '2021-03-20 22:18:31', NULL),
(368, 'Sarina White 5-Drawer Cabinet', 'AMH5714A', '500.88', '213.70', '300', 'The classic lingerie chest is treated to a breezy coastal makeover with the Sarina 5-drawer cabinet. Crafted of pine with lightly distressed cream fin', '', '2021-03-20 22:18:31', '2021-03-20 22:18:31', NULL),
(369, 'Render Walnut Display Stand EEI-2542-WAL', 'EEI-2542-WAL', '451.00', '205.05', '200', 'Mid-Century Style Display Stand,Two Slatted Sliding Doors,Smooth Wood Grain laminate,Four Spacious Storage Spaces,Adjustable Shelf On Lower Right,Two ', '', '2021-03-20 22:18:32', '2021-03-20 22:18:32', NULL),
(370, 'Bobby Berk Walnut Gehl Display Cabinet', '239240-1803', '2.00', '758.00', '100', 'Part of Bobby Berk Collection from ART Furniture,Crafted from rubber wood , oak veneer , metal base,Walnut finish,Sleek metal base,Glass doors,Adjusta', '', '2021-03-20 22:18:32', '2021-03-20 22:18:32', NULL),
(371, 'Capri 4 Door China', 'CAPRI4DOORCHINA', '3.00', '703.50', '100', 'High gloss walnut finish,Four glass doors,Mirrored back,Lighting,Four wood doors,Simple satin metal brushed pulls and legs,Straight panels are in chip', '', '2021-03-20 22:18:32', '2021-03-20 22:18:32', NULL),
(372, 'Carrollton Chrome Curio Cabinet', 'CM-CR150', '1.00', '422.60', '900', 'Part of Carrollton Collection from Furniture of America,Crafted from solid wood and wood veneer,Chrome finish,Contemporary style,5-tier shelf,5mm temp', '', '2021-03-20 22:18:32', '2021-03-20 22:18:32', NULL),
(373, 'Sion White Ladder Shelf', 'CM-AC6213WH', '287.97', '82.28', '400', 'Part of Sion Collection,Crafted from solid wood and wood veneer and others,White finish,Unique style,5 shelves for display,5 tier shelf,Also available', '', '2021-03-20 22:18:32', '2021-03-20 22:18:32', NULL),
(374, 'Bolanburg White and Gray Display Cabinet', 'D647-76', '845.00', '395.35', '500', 'Made of veneers, wood and engineered wood,Textured antique white finish,Light distressing,3 shelves, 2 drawers,Back panel has replicated wood veneer s', '', '2021-03-20 22:18:32', '2021-03-20 22:18:32', NULL),
(375, 'Elite 2 Door China', 'ELITE2DRCABINET', '3.00', '632.78', '200', 'Sturdy construction,New Silver Birch finish,Handles in metal alloy Nickel Black chromed matching the aesthetic lines of the collection,Made in Italy,T', '', '2021-03-20 22:18:32', '2021-03-20 22:18:32', NULL),
(376, 'Elite 1 Door China', 'ELITE1DRCABINET', '2.00', '543.38', '800', 'Sturdy construction,New Silver Birch finish,Handles in metal alloy Nickel Black chromed matching the aesthetic lines of the collection,Made in Italy,T', '', '2021-03-20 22:18:32', '2021-03-20 22:18:32', NULL),
(377, 'Antique White Island', '2222-20-I', '987.03', '97.38', '100', 'Solid hardwoods and veneers,Antique white finish,Bottle storage and drawers,Distressed Finish,Top can be assembled in 2 positions for more overhang on', '', '2021-03-20 22:18:32', '2021-03-20 22:18:32', NULL),
(378, 'Brushed Gold and White Bar Cart', 'DS-D204-804', '505.00', '148.40', '100', 'Carfted fom wood and steel,Brushed gold finish,2 high gloss white polyester trays,Brushed gold steel frame,Durable casters for easy mobility', '', '2021-03-20 22:18:32', '2021-03-20 22:18:32', NULL),
(379, 'Beacon Hill Kitchen Island 5102-94', '5102-94', '1.00', '821.41', '700', 'Crafted of hardwood solids with engineered wood panels, shaped solid wood top is finished in an aged cherry, with the body of the Island in an off whi', '', '2021-03-20 22:18:32', '2021-03-20 22:18:32', NULL),
(380, 'Mountain Lodge Kitchen Island 5525-94', '5525-94', '1.00', '376.14', '400', 'Crafted of poplar solids and hardwood veneers with engineered woods,Finish and color may vary.Rustic casual design that is at home in a mountain lodge', '', '2021-03-20 22:18:32', '2021-03-20 22:18:32', NULL),
(381, 'Summer Winds Serving Island, Sea Gull Gray Complete', '0425-80-CIT/CIB', '1.00', '488.00', '200', 'Beautiful White-gray finish,Stemware holder,Wine rack,Drop down door', '', '2021-03-20 22:18:32', '2021-03-20 22:18:32', NULL),
(382, 'Beacon Hill Kitchen Island 5103-94', '5103-94', '1.00', '862.24', '100', 'Crafted of hardwood solids with engineered wood panels, shaped solid wood top is finished in an aged cherry, with the body of the Island in a black pa', '', '2021-03-20 22:18:32', '2021-03-20 22:18:32', NULL),
(383, 'Mountain Lodge Pantry', '5525-69', '1.00', '735.81', '200', 'Crafted of solid poplar and hardwood veneers with engineered woods,Finish and color may vary,Rustic casual design that is at home in a mountain lodge,', '', '2021-03-20 22:18:33', '2021-03-20 22:18:33', NULL),
(384, 'Sunset Trading 3 Piece Antique Black Kitchen Island Set with Gray Tile Top', 'CY-KITT02-B24-AB3PC', '2.00', '857.14', '600', 'Handcrafted solid wood and wood veneer kitchen island set with decorative accents,Set includes two Windsor Style Comfortback swivel stools with curved', '', '2021-03-20 22:18:33', '2021-03-20 22:18:33', NULL),
(385, 'Eliza Brass and Black Glass 2 Tier Bar Cart', 'BCT8005A', '825.00', '437.89', '500', 'A contemporary classic, this 2-tier bar cart was designed to add modern luxury to any room. Its timeless Greek key design is highlighted with a rich b', '', '2021-03-20 22:18:33', '2021-03-20 22:18:33', NULL),
(386, 'Shades of Gray Grey Tile Top Kitchen Island', 'CY-KITT02-AG', '2.00', '736.55', '300', ' Handcrafted solid wood and wood veneer kitchen island with decorative accents,This uniquely designed island offers a ceramic tile sliding counter top', '', '2021-03-20 22:18:33', '2021-03-20 22:18:33', NULL),
(387, 'Lakelyn Rose Gold and Clear Glass Serving Cart', '98192', '885.16', '252.90', '400', 'Part of Lakelyn Collection from Acme,Metal frame construction,Rose gold finish,Oval serving cart,Open storage 2 shelves,5mm clear tempered top glass,B', '', '2021-03-20 22:18:33', '2021-03-20 22:18:33', NULL),
(388, 'Cambridge Kitchen Island 5170-94Q', '5170-94Q', '1.00', '366.77', '900', 'Large work surface with quartz insets covering storage area and kneehole area with room for stools,Finish and color may vary,Traditional Countryside b', '', '2021-03-20 22:18:33', '2021-03-20 22:18:33', NULL),
(389, 'Liberty Furniture Mirage Buffet in Wirebrushed White 946-CB6636', '946-CB6636', '2.00', '1.00', '200', 'Buffet,Full Extension Metal Side Drawer Guides,French & English Dovetail Construction,Features Faux Travertine Waterfall Top,Travertine Inserts on Doo', '', '2021-03-20 22:18:33', '2021-03-20 22:18:33', NULL),
(390, 'Farmhouse Reimagined Antique White Buffet with Hutch', '652-DR-HB', '1.00', '311.70', '800', 'Part of Farmhouse Reimagined Collection from Liberty,Crafted from pine solids with hickory and pine veneers,Antique white finish,Heavy wire brush and ', '', '2021-03-20 22:18:33', '2021-03-20 22:18:33', NULL),
(391, 'Farmhouse Reimagined Antique White Buffet', '652-CB6036', '1.00', '256.95', '200', 'Pine and Poplar Solids with Hickory & Pine Veneers,Antique White Finish with Chestnut Tops', '', '2021-03-20 22:18:33', '2021-03-20 22:18:33', NULL),
(392, 'Crawford Silver Buffet', '5546-55', '949.00', '258.81', '100', 'Part of Crawford Collection from Homelegance,Silver finish,Glass insert top,2 door storage', '', '2021-03-20 22:18:34', '2021-03-20 22:18:34', NULL),
(393, 'Bevelle Silver Server', '1958-40', '1.00', '354.97', '900', 'Part of Bevelle Collection from Homelegance,Silver finish,Acrylic inset framing', '', '2021-03-20 22:18:34', '2021-03-20 22:18:34', NULL),
(394, 'Armand Antique Brownstone Buffet', '242-CB6440', '1.00', '214.26', '700', 'Part of Armand Collection,Crafted from pine, poplar solids and cathedral hickory veneers,Antique brownstone finish,Full extension metal side drawer gl', '', '2021-03-20 22:18:34', '2021-03-20 22:18:34', NULL),
(395, 'Allyson Park Wirebrushed White Executive Home Office Set', '417-HOJ-DSK;417-HO12', '2.00', '730.88', '700', 'Part of Allyson Park Collection from Liberty,Crafted from pine solids with cathedral white oak tops and pine veneer fronts,Wirebrushed white finish wi', '', '2021-03-20 22:18:34', '2021-03-20 22:18:34', NULL),
(396, 'Magnolia Manor Antique White Home Office Set', '244-HO107;244-HO121', '2.00', '527.63', '500', 'Part of Magnolia Manor Collection,Crafted from poplar solids and white oak veneer tops with birch veneer fronts,Antique white,Flip down keyboard tray,', '', '2021-03-20 22:18:34', '2021-03-20 22:18:34', NULL),
(397, 'Bob Weathered Oak and Black Home Office Set', '92396;92398', '766.01', '257.74', '800', 'Part of Bob Collection from Acme,Crafted from paper veneer,Weathered oak and black finish,Wooden top,Metal legs,Open storage compartment and 1 drawer ', '', '2021-03-20 22:18:34', '2021-03-20 22:18:34', NULL),
(398, 'Grand Classic Executive Home Office Set', 'I91-300B-300T-I91-36', '2.00', '358.88', '600', 'Select hardwoods w/ Acacia and Walnut veneers,Tobacco finish,Serpentine pull hardware,Full extension, steel ball bearing drawer slides,Dovetail joiner', '', '2021-03-20 22:18:34', '2021-03-20 22:18:34', NULL),
(399, 'Solay Chocolate L Shaped Desk with Lateral File and Bookcase', '29851-69', '1.00', '192.63', '900', 'Part of Solay Collection from Bestar,Chocolate finish,Durable 1\" commercial grade work surface,Melamine finish that resists scratches, stains and burn', '', '2021-03-20 22:18:34', '2021-03-20 22:18:34', NULL),
(400, 'Ridgeley Dark Chocolate and White Chocolate U Shaped Desk with Lateral File and Bookcase', '52850-31', '1.00', '504.08', '200', 'Part of Ridgeley Collection from Bestar,Dark chocolate and white chocolate finish,Durable 1\" commercial grade work surfaces,Melamine finish that resis', '', '2021-03-20 22:18:34', '2021-03-20 22:18:34', NULL),
(401, 'Magnolia Manor Antique White Jr Executive Desk Chair', '244-HO197', '679.00', '157.01', '900', 'Part of Magnolia Manor Collection from Liberty,Crafted from poplar and rubberwood solids with white oak, birch veneers,Antique white finish,Artistic d', '', '2021-03-20 22:18:35', '2021-03-20 22:18:35', NULL),
(402, 'Primero White Office Chair', '101822', '285.00', '126.76', '300', 'Supports up to 250 lbs,Includes rubber floor protectors to prevent floor surfaces from scratching,Get your work done in style with this classic armcha', '', '2021-03-20 22:18:35', '2021-03-20 22:18:35', NULL),
(403, 'Modern Ergonomic Computer Chair W/Extendable Footrest', '7200-CCH-BLK', '776.40', '135.51', '300', 'Gas Lift Adjustable Height & Full Recline,Back Cushion Comes Attached for Lumbar Support,Black Faux Leather Upholstery & Highlight Stitchin,360? Swive', '', '2021-03-20 22:18:35', '2021-03-20 22:18:35', NULL),
(404, 'Aspenhome arcadia office chair w arm in truffle i92 366a', 'I92-366A', '1.00', '547.11', '600', 'Only 1 left in stock!,Arcadia Collection by Aspenhome Furniture,Truffle finish,With rubber wood solids and white oak veneer,Dimensions: 40\" H x 27\" W ', '', '2021-03-20 22:18:35', '2021-03-20 22:18:35', NULL),
(405, 'Grandover Black Tilt Swivel Chair', '5029-30220', '1.00', '16.00', '800', 'Part of Grandover Collection from Hooker,Crafted from solid wood and select wood veneers over durable wood products,Wood Distressing Type : Scraping l', '', '2021-03-20 22:18:35', '2021-03-20 22:18:35', NULL),
(406, 'Wallace Black Office Chair', 'LCWAOFCHBLACK', '310.00', '84.62', '500', 'Mid-century design,Fabric content: 100% Polyurethane and urethane foam,Durable walnut frame supported by sturdy chrome finished column,Swivel mechanis', '', '2021-03-20 22:18:35', '2021-03-20 22:18:35', NULL),
(407, 'Finley Cream Velvet Office Chair', '165Cream', '724.32', '566.55', '600', 'Swivel and Adjustable Office Chair,Soft Cream Velvet,Deep Channel Tufting,Rich Gold Base,Contemporary Design', '', '2021-03-20 22:18:35', '2021-03-20 22:18:35', NULL),
(408, 'Allyson Park Wirebrushed White Executive Desk', '417-HOJ-DSK', '1.00', '220.00', '200', 'Part of Allyson Park Collection from Liberty,Crafted from pine solids with cathedral white oak tops and pine veneer fronts,Wirebrushed white finish wi', '', '2021-03-20 22:18:35', '2021-03-20 22:18:35', NULL),
(409, 'Magnolia Manor Antique White Jr Executive Desk', '244-HOJ-DSK', '1.00', '290.00', '400', 'Part of Magnolia Manor Collection from Liberty,Crafted from poplar and rubberwood solids with white oak, birch veneers,Antique white finish,Artistic d', '', '2021-03-20 22:18:36', '2021-03-20 22:18:36', NULL),
(410, 'Allyson Park Wirebrushed White Jr Executive Credenza', '417-HO120T-HO120B', '1.00', '332.39', '600', 'Part of Allyson Park Collection from Liberty,Crafted from pine solids with cathedral white oak tops and pine veneer fronts,Wirebrushed white finish wi', '', '2021-03-20 22:18:36', '2021-03-20 22:18:36', NULL),
(411, 'Allyson Park Wirebrushed White Credenza with Hutch', '417-HOJ-CHS', '2.00', '354.09', '800', 'Part of Allyson Park Collection from Liberty,Crafted from pine solids with cathedral white oak tops and pine veneer fronts,Wirebrushed white finish wi', '', '2021-03-20 22:18:36', '2021-03-20 22:18:36', NULL),
(412, 'Magnolia Manor Antique White Jr Executive Credenza With Hutch', '244-HOJ-CHS', '2.00', '390.00', '700', 'Part of Magnolia Manor Collection from Liberty,Crafted from poplar and rubberwood solids with white oak, birch veneers,Antique white finish,Artistic d', '', '2021-03-20 22:18:36', '2021-03-20 22:18:36', NULL),
(413, 'Magnolia Manor Antique White Complete Desk 5 Piece Set', '244-HOJ-CDS', '4.00', '550.00', '300', 'Part of Magnolia Manor Collection from Liberty,Crafted from poplar and rubberwood solids with white oak and birch veneers,Antique white finish,Full ex', '', '2021-03-20 22:18:36', '2021-03-20 22:18:36', NULL),
(414, 'Connexion Slate and Sandstone L-Shaped Workstation', '93880-59\n', '930.84', '147.30', '300', 'Part of Connexion Collection,Slate & Sandstone finish,Contemporary style,Durable collection,Wide variety of configuration options that will adapt to y', '', '2021-03-20 22:18:36', '2021-03-20 22:18:36', NULL),
(415, 'Connexion Slate and Sandstone L-Shaped Workstation Kit', '93859-59', '1.00', '247.40', '200', 'Connexion is a contemporary and durable collection that features a wide variety of configuration options that will adapt to your specific needs,The wo', '', '2021-03-20 22:18:36', '2021-03-20 22:18:36', NULL),
(416, 'Pro-Biz 55\" White Simple Workstation with Red Tack Board', '100871DR-17', '1.00', '313.74', '200', 'Part of Pro-Biz Collection from Bestar,White finish,Smart durable design,Easy assembly,55.5\" high melamine and acrylic glass privacy panels,1 red tack', '', '2021-03-20 22:18:36', '2021-03-20 22:18:36', NULL),
(417, 'Connexion U-Shaped Workstation Kit In Slate and Sandstone', '93863-59', '1.00', '270.76', '600', 'Connexion is a contemporary and durable collection that features a wide variety of configuration options that will adapt to your specific needs,The wo', '', '2021-03-20 22:18:36', '2021-03-20 22:18:36', NULL),
(418, 'Small Computer Station', '800217', '179.00', '47.03', '300', 'Contemporary style,Black finish,Keyboard drawer,Modern style,Highly rated,Small Computer Workstation by Coaster Furniture is a great piece that will m', '', '2021-03-20 22:18:36', '2021-03-20 22:18:36', NULL),
(419, 'Americana Modern Dove Workstation With Led Light', 'AME-350-3-DOV', '1.00', '257.00', '200', 'Part of Americana Modern Collection from Parker House,Crafted from Poplar Solids and Birch Veneers,Dove finish,Weathered natural wood top,Levelers inc', '', '2021-03-20 22:18:36', '2021-03-20 22:18:36', NULL),
(420, 'Glider White Conference Chair', '100378\n', '807.00', '472.00', '400', 'Part of Glider Collection from Zuo,Added Lumbar Support,White Soft Leatherette Upholstery,Accented With Chrome Star Base,Adjustable Seat Height,Maximu', '', '2021-03-20 22:18:36', '2021-03-20 22:18:36', NULL),
(421, 'Gekko Conference Chair White Set of 2', '404142', '987.00', '587.00', '500', 'Product Cover: Leatherette,Product Finish: Chrome,Weight Capacity: 250lbs.', '', '2021-03-20 22:18:36', '2021-03-20 22:18:36', NULL),
(422, 'Lider Plus Conference Chair Black Set of 2', '215210', '859.00', '220.00', '400', 'Product Cover: Leatherette,Product Finish: Chromed Steel Frame,Weight Capacity: 250lbs,With its ergonomical shape, padded back and seat cushions, the ', '', '2021-03-20 22:18:36', '2021-03-20 22:18:36', NULL),
(423, 'Gekko Conference Chair Espresso Set of 2', '404143', '987.00', '587.00', '300', 'Product Cover: Leatherette,Product Finish: Chrome,Weight Capacity: 250lbs.', '', '2021-03-20 22:18:36', '2021-03-20 22:18:36', NULL),
(424, 'Mocha Cherry Boat Top Conference Table with Metal Base', '99TBM120MRSVK', '1.00', '275.62', '300', 'Constructed with thermally fused laminate for durability and superior resistance to scratches and stains,Metal base provides strength and stability,Du', '', '2021-03-20 22:18:36', '2021-03-20 22:18:36', NULL),
(425, 'Mocha Cherry 96\" Boat Top Conference Table', '99TB9642MRK', '759.00', '147.41', '200', 'Constructed with thermally fused laminate for durability and superior resistance to scratches and stains,Wood base provides strength and stability,Dur', '', '2021-03-20 22:18:36', '2021-03-20 22:18:36', NULL),
(426, 'Allyson Park Wirebrushed White Bunching Lateral File Cabinet', '417-HO147', '1.00', '206.34', '800', 'Part of Allyson Park Collection from Liberty,Crafted from pine solids with cathedral white oak tops and pine veneer fronts,Wirebrushed white finish wi', '', '2021-03-20 22:18:37', '2021-03-20 22:18:37', NULL),
(427, 'Bunching Lateral File Cabinet w/ Hutch', '417-HO147-417-HO135', '1.00', '61.55', '200', 'Pine solids with Cathedral White Oak and Pine veneers,Wirebrushed White finish,Planked top,Antique pewter knob and drop bail hardware,English dovetail', '', '2021-03-20 22:18:37', '2021-03-20 22:18:37', NULL),
(428, 'Bestar Small Space 10\" Storage Tower In White', '16702-1117', '200.00', '39.36', '400', 'Within a compact space, choosing the right pieces of furniture is crucial in order to feel relaxed and comfortable. Maximize every square foot of your', '', '2021-03-20 22:18:37', '2021-03-20 22:18:37', NULL),
(429, 'Cherry Creek Brown 32\'\' Wall Storage Cabinet', '258-70-446', '1.00', '80.00', '500', 'Part of Cherry Creek Collection,Crafted from hardwood solids and cherry veneers,Wood Distressing Type : Worm holes,Brown finish,4 shelves,One light co', '', '2021-03-20 22:18:37', '2021-03-20 22:18:37', NULL),
(430, 'Gemma Filing Cabinet - Walnut Grey and White', '107630-000035', '495.00', '190.22', '800', 'This collection is the perfect addition to your home office or workplace. Each piece in this collection provides storage options to create an organize', '', '2021-03-20 22:18:37', '2021-03-20 22:18:37', NULL),
(431, 'Havana Rustic Acacia File Cabinet', ' 2825RA-F', '1.00', '432.49', '700', 'Part of Havana Collection from Sunny Designs,Crafted from rough sawn acacia solids and veneer,Rustic acacia finish,Decorative hardware,Vintage rustic ', '', '2021-03-20 22:18:37', '2021-03-20 22:18:37', NULL),
(432, 'Magnolia Manor Antique White Bunching Bookcase', '244-HO201', '1.00', '246.60', '300', 'Part of Magnolia Manor Collection from Liberty,Crafted from poplar and rubberwood solids with white oak, birch veneers,Antique white finish,Artistic d', '', '2021-03-20 22:18:37', '2021-03-20 22:18:37', NULL),
(433, 'Aspenhome essex door bookcase in molasses brown i24 332 1', 'I24-332-1', '1.00', '513.90', '400', 'Door Bookcase features 2 adjustable shelves and 2 wooden doors,Intricate paneling and traditional molding detail,Traditional copper finished bail pull', '', '2021-03-20 22:18:38', '2021-03-20 22:18:38', NULL),
(434, 'Versatile White 36\" Closet Storage Shell', '40160-2117', '620.00', '13.71', '200', 'Part of Versatile Collection,White finish,Each unit will help you organize your storage needs perfectly,Durable 1\" commercial grade work surfaces with', '', '2021-03-20 22:18:38', '2021-03-20 22:18:38', NULL),
(435, 'Sausalito 80 Inch Bookcase', 'SL6930.WKY', '1.00', '275.04', '400', 'Premium select knotty alder solids and veneers,Whiskey finish,Heavy distressing,Dado Construction for supreme durability,Open shelf storage,Built and ', '', '2021-03-20 22:18:38', '2021-03-20 22:18:38', NULL),
(436, 'Gemma Bookcase - Walnut Grey and White', '107700-000035', '333.00', '115.19', '400', 'This collection is the perfect addition to your home office or workplace. Each piece in this collection provides storage options to create an organize', '', '2021-03-20 22:18:38', '2021-03-20 22:18:38', NULL),
(437, 'Oxford 60 Inch Adjustable Lift Desk (Peppercorn)', 'I07-360T-PEP-IUAB-30', '1.00', '185.83', '300', 'Poplar solids and Cherry veneers,Peppercorn finish,Gunmetal hardware,Full extension, steel ball bearing drawer slides,Dovetail joinery,Drop front keyb', '', '2021-03-20 22:18:38', '2021-03-20 22:18:38', NULL),
(438, 'Catalia Dark Oak and Espresso Book Stand', 'CAT045', '359.00', '3.42', '500', 'Part of Catalia Collection,Crafted from solid wood and wood veneer,Dark oak and espresso finish,Bold and sturdy construction,Reeded leg,Pedestal base,', '', '2021-03-20 22:18:38', '2021-03-20 22:18:38', NULL),
(439, 'Abanson Amber/Gold Finish Metal Desk Lamp', 'L206022', '94.48', '40.90', '200', 'Made of metal with glass shade,Sturdy goldtone frame,On/off switch,Wireless charger; 1 USB charging port,1 type A bulb (not included), 40 watts max or', '', '2021-03-20 22:18:38', '2021-03-20 22:18:38', NULL),
(440, 'Austbeck Gray Metal Desk Lamp', 'L206032', '125.96', '56.14', '400', 'Made of metal with adjustable metal shade,Gray finish,Wireless charger and 1 USB charging port,On/off switch,1 type G bulb (not included), 40 watts ma', '', '2021-03-20 22:18:38', '2021-03-20 22:18:38', NULL),
(441, 'Josetta Gray Bookends (2/CN) A2000243', 'A2000243', '278.75', '209.87', '700', 'Set of 2,Made of gray marble,Set of 2 Bookends. Gray Marble. Due to the use of natural materials, some variations may occur,Marvel of marble. Crafted ', '', '2021-03-20 22:18:38', '2021-03-20 22:18:38', NULL),
(442, 'Marinel Black Metal Desk Lamp', 'L206002', '125.96', '51.49', '400', 'Made of metal,Black finish,Adjustable shade,On/off switch,1 type A bulb (not included); 40 watts max or CFL 8 watts; UL Listed,USB and wireless charge', '', '2021-03-20 22:18:38', '2021-03-20 22:18:38', NULL),
(443, 'Cappucino Catalog Stand', '901690', '1.00', '571.69', '800', 'Crafted from MDF, particle board and laminate,Cappuccino finish\n', '', '2021-03-20 22:18:38', '2021-03-20 22:18:38', NULL),
(444, 'Pro Concept Plus Black Keyboard Shelf', '110830-1118', '89.00', '28.61', '500', 'Part of Pro-Concept Plus Collection from Bestar,Black finish,Modern and personalized design,Durable 1\" commercial grade top surface,Melamine finish th', '', '2021-03-20 22:18:38', '2021-03-20 22:18:38', NULL),
(445, 'Pure White 2 Door Set For 36\" Storage Unit', '26166-1117', '295.00', '64.87', '400', 'Part of Pur Collection,White finish,Combining style and convenience,Perfect solution to furnished condos, lofts, studios, guest\'s rooms and home offic', '', '2021-03-20 22:18:39', '2021-03-20 22:18:39', NULL),
(446, 'Farmhouse Right Pier FH3202-BNW', 'FH3202.BNW\n', '1.00', '470.71', '500', 'Product comes fully assembled,Designed and built in the U.S.A,Dado Construction for supreme durability,Wildly popular, warehouse or barn style doors a', '', '2021-03-20 22:18:39', '2021-03-20 22:18:39', NULL),
(447, 'Prestige Plus Bridge In White Chocolate and Antigua', '99820-1152', '184.23', '41.89', '300', 'Prestige + is a timeless modular collection that will adapt to your needs, over time. With its wide range of products, it is ideal for every type of o', '', '2021-03-20 22:18:39', '2021-03-20 22:18:39', NULL),
(448, 'Bestar Lumina 3-Piece Full Wall Bed And 2 Storage Units In White', '85899-17', '4.00', '1.00', '600', 'The Bestar Lumina collection is a brilliant way to optimize any space. The Lumina collection is the ideal solution when it comes to furnishing condos,', '', '2021-03-20 22:18:39', '2021-03-20 22:18:39', NULL),
(449, 'Bestar Lumina Storage Unit With Drawers and Doors In White Chocolate and Dark Chocolate', '85160-31', '1.00', '249.48', '800', 'The Bestar Lumina collection is a brilliant way to optimize any space. The Lumina collection is the ideal solution when it comes to furnishing condos,', '', '2021-03-20 22:18:39', '2021-03-20 22:18:39', NULL),
(450, 'Joanna 4Pc Sofa Bar Set', 'JA400SB', '762.00', '211.44', '40', 'Constructed of acacia veneers hardwood solids and engineered hardwoods,Turned legs on counter stools and sofa bar, Stretchers on Stools and Sofa Bar a', '', '2021-03-20 22:18:39', '2021-03-20 22:18:39', NULL),
(451, 'Country Grove 24 Inch Windsor Bar  and Counter Stool with Arms Set of 2', 'DLU-CG-B3024A-GO-2', '1188.44', '746.01', '30', 'Includes two counter height barstools with arms, Constructed from solid kiln dried Malaysian Oak also known as rubberwood, Attractive arched back with', '', '2021-03-20 22:18:39', '2021-03-20 22:18:39', NULL),
(452, 'Prossimo Dark Walnut Baciami Bar Table Set ', '250254-1814-ROOM', '5909.00', '3369.59', '50', 'Part of Prossimo Collection from ART, Crafted from veneer, Dark walnut finish, 2 fixed shelves, 1 door, 5 drawers, 15 wine bottles on one side, Polish', '', '2021-03-20 22:18:40', '2021-03-20 22:18:40', NULL),
(453, 'Chrome Bar Room Set', '104873;100295', '1148.00', '549.76', '30', 'Stainless steel frame construction, Chrome finish, Clear tempered rectangular glass top', '', '2021-03-20 22:18:40', '2021-03-20 22:18:40', NULL),
(454, '3078 Cherry Bar Set', '3078;3079', '2842.00', '904.00', '20', 'Cherry Finish,2 shelves,2 drawers,Ice bin,Towel bar,10 bottle wine rack, 2 additional preparation surfaces extending from bar table top', '', '2021-03-20 22:18:40', '2021-03-20 22:18:40', NULL),
(455, 'Brancaster Marble and Aluminum Bar Set', '70450;96556', '5552.00', '2103.34', '30', 'Part of Brancaster Collection from Acme,Crafted from plywood,Aluminum finish,Doors storage,Marble top,Aluminum frame,Chair features metal tube frame c', '', '2021-03-20 22:18:40', '2021-03-20 22:18:40', NULL),
(456, '100654 Black/White Bar Set', '100654;120359', '994.00', '421.02', '20', 'Black/White/Chrome Finish,Impress your guests with this contemporary bar unit,Unique kidney-shaped body,Plenty of storage space,Stemware rack,Chrome f', '', '2021-03-20 22:18:40', '2021-03-20 22:18:40', NULL),
(457, 'Twin Palms Cable Beach Bar Set', '01-0558-862;01-0558-', '6207.00', '1856.21', '30', 'Part of Twin Palms Collection from Tommy Bahama,Casual elegance and sophisticated look,Lighter wood tones,Warm bermuda sands umber finish,Innovative d', '', '2021-03-20 22:18:40', '2021-03-20 22:18:40', NULL),
(458, 'Scarus Natural and Gunmetal Bar Set', '72385;72389', '1545.38', '287.04', '50', 'Part of Scarus Collection from Acme,Crafted from ash wood veneer and MDF,Natural and gunmetal finish,KD construction,Rectangular shape,Wooden fixed to', '', '2021-03-20 22:18:40', '2021-03-20 22:18:40', NULL),
(459, 'Vintage Weathered Gray Pub Set', '179-PUB3636;179-B000', '1607.00', '801.16', '60', 'Part of Vintage Collection,Crafted from Pine Veneers,Wirebrushed Toffee & Weathered Gray with Black Metal,Chairs Have Multiple Finish Options,Classic ', '', '2021-03-20 22:18:40', '2021-03-20 22:18:40', NULL),
(460, 'Ilana Chestnut/Black 3 Piece Pub Set', 'DNS9202A', '540.00', '253.94', '50', 'Ideal for an intimate candlelight dinner or morning espresso, this versatile 3-piece pub set is perfect in any dining area. \nFinely crafted with durab', '', '2021-03-20 22:18:40', '2021-03-20 22:18:40', NULL),
(461, 'Pinehurst Dark Brown Bar Table Set', '1963TL2;1430MS-30', '2542.00', '567.47', '20', 'Part of Pinehurst Collection from Sunny Designs,Crafted from mahogany solids and veneers,Dark brown finish,Tobacco leaf frame finish,2 drawers,Underto', '', '2021-03-20 22:18:40', '2021-03-20 22:18:40', NULL),
(462, 'Vintner Pub Set', 'CDC252 5PC Pub Set', '456.00', '79.77', '30', 'Vintage industrial 5-piece pub set,Medium-density fiberboard and powder-coated metal,Reclaimed-wood seats and tabletop lend a rustic look to dining ro', '', '2021-03-20 22:18:40', '2021-03-20 22:18:40', NULL),
(463, 'Semly 3Pcs Bistro Setting PAT5028A', ' PAT5028A', '625.86', '295.38', '40', 'Create an al fresco lifestyle reminiscent of Tuscany\'s romantic Italian charm with ,this 3-piece bistro set. \nInspired by the work of master artisans,', '', '2021-03-20 22:18:40', '2021-03-20 22:18:40', NULL),
(464, 'Granada Merlot Pub Set', '1437-03;1437-04', '1709.37', '200.00', '30', 'Part of Granada Collection from Alpine,Crafted from acacia solids with ash and birch veneer,Brown merlot finish,Hand laid coconut shells under glass,S', '', '2021-03-20 22:18:40', '2021-03-20 22:18:40', NULL),
(465, 'LeisureMod Spencer Black Rope 5pc Outdoor Bistro Patio Set', 'SCT23BL', '3693.00', '1433.70', '40', '5-Piece outdoor furniture set Includes 4 club chairs, and 1 Bistro Table\nAll-weather, rust, water UV, resistant.Ideal for indoor or outdoor use.High-Q', '', '2021-03-20 22:18:40', '2021-03-20 22:18:40', NULL),
(466, 'Antoinette Warm Brown Round Pub Set ', 'AY300PTB-AY300PTT;AY', '1754.00', '355.01', '50', 'Part of Antoinette Collection from Steve Silver,Crafted from Sturdy Mahogany Solids and Cherry Veneers,Warm Brown Cherry Finish,Multi-Step Hand Applie', '', '2021-03-20 22:18:40', '2021-03-20 22:18:40', NULL),
(467, 'Tuscany Vintage Mocha Pub Set', '1377VM;1508VM-30', '1577.00', '627.38', '40', 'Part of Tuscany Collection from Sunny Designs,Vintage mocha finish,Crafted from mahogany wood,Adjustable heights table 36\" - 42\",Distressed Barstool f', '', '2021-03-20 22:18:40', '2021-03-20 22:18:40', NULL),
(468, 'Modern Farmhouse Console Bar Table Set (Dusty Charcoal) ', '406-OT7837;406-OT900', '1561.31', '321.18', '30', 'Poplar solids w/ Knotty White Oak veneers,Dusty Charcoal finish w/ heavy distressing,Planked top,Features 1 electrical outlet w/ USB charging,Open sla', '', '2021-03-20 22:18:41', '2021-03-20 22:18:41', NULL),
(469, 'Curata Midnight Pub Set', '1600-75202-DKW;1600-', '5139.00', '1732.00', '40', 'Crafted from rubberwood solids with white oak veneers,Midnight deep brown finish,Brushed brass metal base,Chic modern look and inspired by timeless sh', '', '2021-03-20 22:18:41', '2021-03-20 22:18:41', NULL),
(470, 'Marietta Black Convertible Dining Room Set', ' 100171;100172', '4027.00', '2037.76', '30', 'Fabric Color: Black,Constructed of solid oak,Clean defined edges ,single pedestal table base,Clean Smooth Edges,Smooth finished top,Can be converted t', '', '2021-03-20 22:18:41', '2021-03-20 22:18:41', NULL),
(471, 'Gaming 3 In 1 Cherry Poker Bumper Pool Dining Set - 100201', '100201-2(4)', '3303.00', '1317.39', '30', 'Traditional style,Three-in-one,Oak finish,42\" playing surface,Solid oak chairs,Upholstered chairs,Casters included,Amazing comfort,Highly rated,Table ', '', '2021-03-20 22:18:41', '2021-03-20 22:18:41', NULL),
(472, 'Tournament Brown Round Folding Game Room Set', 'TU5050GT-TU5050T-TU5', '1865.00', '493.24', '30', 'Part of Tournament Collection from Steve Silver,Crafted from Finest Hardwood Solids and Cherry Veneers,Multi-Step Rich Cherry Finish,Traditional Style', '', '2021-03-20 22:18:41', '2021-03-20 22:18:41', NULL),
(473, 'Turk Poker/ Bumper Pool Game Room Set', '100871-game-set', '3719.00', '1634.00', '40', 'The Turk Game Collection will add both fun and beauty to your traditional styled home. \nThis game table and chair set features sophisticated style, wi', '', '2021-03-20 22:18:42', '2021-03-20 22:18:42', NULL),
(474, 'Waverly Place Cherry Game Room Set', '366-75-800;366-75-50', '7335.00', '680.00', '50', 'Part of Waverly Place Collection from Hooker,Crafted from hardwood solids cherry veneers,Cherry finish,Reversible top with poker felt on one side,Wood', '', '2021-03-20 22:18:42', '2021-03-20 22:18:42', NULL),
(475, 'Gaming 3 In 1 Poker Bumper Pool Dining Set 100871', '100871-100872(4)', '3336.00', '1267.23', '40', 'Traditional style,Three-in-one,Oak finish,42\" of playing surface,Solid oak chairs,Upholstered chairs,Casters included,Amazing comfort,Highly rated', '', '2021-03-20 22:18:42', '2021-03-20 22:18:42', NULL),
(476, 'Island Estate Plantation Brown Samba Game Room Set', '01-0531-931;01-0531-', '7437.00', '2212.44', '30', 'Part of Island Estate Collection from Tommy Bahama,Crafted from maple and selected hardwoods,Plantation brown finish,Caribbean styling,Cracked cocoa s', '', '2021-03-20 22:18:42', '2021-03-20 22:18:42', NULL),
(477, 'Pinehurst Dark Brown Bar Table', '1963TL2', '1992.00', '600.97', '30', 'Part of Pinehurst Collection from Sunny Designs,Crafted from mahogany solids and veneers,Dark brown finish,Tobacco leaf frame finish,2 drawers,Underto', '', '2021-03-20 22:18:42', '2021-03-20 22:18:42', NULL),
(478, 'Antoinette Warm Brown Round Pub Table', 'AY300PTB-AY300PTT', '685.00', '72.00', '20', 'Part of Antoinette Collection from Steve Silver,Crafted from Sturdy Mahogany Solids and Cherry Veneers,Warm Brown Cherry Finish,Multi-Step Hand Applie', '', '2021-03-20 22:18:42', '2021-03-20 22:18:42', NULL),
(479, 'Alena Silver Bar Table', 'CM3452BT', '1349.00', '145.61', '30', 'Part of Alena Collection from Furniture of America,Crafted from solid wood and wood veneer,Silver finish,Contemporary style', '', '2021-03-20 22:18:42', '2021-03-20 22:18:42', NULL),
(480, 'Brancaster Marble and Aluminum Bar Table', ' 70450', '3462.00', '1176.86', '50', 'Part of Brancaster Collection from Acme,Crafted from plywood,Aluminum finish,Doors storage,Marble top,Aluminum frame,Optional stoolsTable only, stools', '', '2021-03-20 22:18:42', '2021-03-20 22:18:42', NULL),
(481, 'Ikon Enco Antique Gold and White Bar Table', '102915', '2715.00', '855.56', '40', 'Part of Ikon Collection from Sunpan,Crafted from solid carrara marble and metal,Antique gold and white finish,White round marble top,Antique gold fini', '', '2021-03-20 22:18:42', '2021-03-20 22:18:42', NULL),
(482, 'Arianna Brown Counterheight Pub Table', 'AR729-T', '930.00', '310.82', '30', '18\"Leaf,Solid Wood,Rectangular', '', '2021-03-20 22:18:42', '2021-03-20 22:18:42', NULL),
(483, 'Magnolia Manor Antique White Console Swivel Stool', '244-OT9003', '249.00', '68.52', '50', 'Part of Magnolia Manor Collection from Liberty,Crafted from poplar solids with white oak and birch veneers,Antique white finish,Nylon chair glides,Uph', '', '2021-03-20 22:18:42', '2021-03-20 22:18:42', NULL),
(484, 'Moriville Gray Upholstered Barstool Set of 2', ' D631-124', '599.00', '361.76', '50', 'Made of wood,Polyester upholstery,Nailhead trim with antiqued bronze-tone finish,Assembly required', '', '2021-03-20 22:18:42', '2021-03-20 22:18:42', NULL),
(485, 'Odium Brown Swivel Barstool Set of 2', 'D284-224', '359.00', '139.67', '70', 'Made of birch veneer, engineered wood and metal,Planked effect seat with brown finish,Dark bronze-tone powdercoat metal finish,Adjusts to various seat', '', '2021-03-20 22:18:43', '2021-03-20 22:18:43', NULL),
(486, 'Haddigan Dark Brown Upholstered Barstool', 'D596-124S', '160.62', '31.94', '40', 'Made of veneers, wood and engineered wood,Cushioned vinyl upholstered seat', '', '2021-03-20 22:18:43', '2021-03-20 22:18:43', NULL),
(487, 'Luminar Ii Gray and White Counter Height Chair Set of 2', ' CM3559GY-PC-2PK', '496.51', '141.86', '40', 'Part of Luminar II Collection from Furniture of America,Crafted from solid wood and wood veneer,Gray and white finish,Padded Leatherette upholstery,Co', '', '2021-03-20 22:18:43', '2021-03-20 22:18:43', NULL),
(488, 'Meridian Cassie Pink Velvet Stool Set of 2', '793Pink-C', '577.00', '252.24', '40', 'Pink Velvet,Deep Channel Tufting on Back,Black Metal Legs With Gold Tips,Counter/Bar Stools', '', '2021-03-20 22:18:43', '2021-03-20 22:18:43', NULL),
(489, 'Ameillia Dark Oak Server with Two Wine Racks', ' 586-40', '1265.00', '477.47', '50', 'Part of the Ameillia Collection From Homelegance,Crafted From Maple veneer, walnut veneer, engineered wood,Dark Oak Finish,Tapered legs,3 Drawers,2 st', '', '2021-03-20 22:18:43', '2021-03-20 22:18:43', NULL),
(490, 'Tannin Modern Black Wine Rack', 'HU-1124-02', '518.00', '152.17', '50', '100% iron material makes this a long-lasting Decor piece.,Hanging wall mount feature saves space in any room. A light piece that makes for easy instal', '', '2021-03-20 22:18:43', '2021-03-20 22:18:43', NULL),
(491, 'Vox Industrial Grey Wine Rack', 'LCVXWRSBPI', '261.00', '64.63', '40', 'Part Of Vox Collection From Armen Living,Metal construction,Crafted from pine wood,Industrial grey finish,Durable pine wood plaque construction is acc', '', '2021-03-20 22:18:43', '2021-03-20 22:18:43', NULL),
(492, 'Shabby Chic Cottage Distressed Antique Black Wine Rack', 'CC-CAB1921LD-AB', '705.44', '565.80', '30', 'Narrow design will not take up much floor space,Crafted from solid Mahogany wood,Same finish front and back', '', '2021-03-20 22:18:43', '2021-03-20 22:18:43', NULL),
(493, 'Loire Black Metal Wine Rack', 'HU-1129-02', '236.00', '71.16', '30', 'Its metal frame is made from iron, so you know it\'s not going anywhere.,Three tiered and built high to save space in your home.,No assembly required!,', '', '2021-03-20 22:18:43', '2021-03-20 22:18:43', NULL),
(494, 'Silvermist Winter Forest 2 Door Tall Wine Cabinet', '40271', '1235.00', '357.82', '30', 'Crafted from silver leaf finish,Silvermist winter forest finish,Cut out,1 drawer,Metal drawer glides,2 doors,Raised straight line and diamond pattern,', '', '2021-03-20 22:18:43', '2021-03-20 22:18:43', NULL),
(495, 'Homestead Game and Dining Table', '1033TL2', '1488.50', '430.94', '50', 'Mahogany solids and veneers,Tobacco Leaf finish,Rough sawn distressing,Planked old world design,Planked top,Game top has padded black felt insert', '', '2021-03-20 22:18:43', '2021-03-20 22:18:43', NULL),
(496, 'Waverly Place Cherry Reversible Top Poker Game Table', '366-75-800', '3274.00', '935.60', '50', 'Part of Waverly Place Collection from Hooker,Crafted from hardwood solids cherry veneers,Wood Distressing Type : Planing, scraping and sloping of edge', '', '2021-03-20 22:18:43', '2021-03-20 22:18:43', NULL),
(497, 'La Sierra Round Game Table, Gray and White Complete', ' 1164-22-RCGT/RCGB', '1944.00', '648.00', '40', 'Two-tone heavily distressed finish,Quality crafted with hardwood solids and veneers,Flip top game table,Coordinates with other items from the La Sierr', '', '2021-03-20 22:18:43', '2021-03-20 22:18:43', NULL),
(498, 'Shuffleboard Burnt Umber Wood Gaming Table HGDA617', 'HGDA617', '11250.00', '4177.70', '60', 'The District Eight shuffleboard table adheres to the design philosophy behind the Lusine Industrial collection, combining classic French factory indus', '', '2021-03-20 22:18:43', '2021-03-20 22:18:43', NULL),
(499, 'Ping Pong Table Smoked Wood Gaming Table', ' HGDA556', '8550.00', '3175.06', '50', 'The District Eight Ping Pong table adheres to the design philosophy behind the Lusine Industrial collection, combining classic French factory industri', '', '2021-03-20 22:18:43', '2021-03-20 22:18:43', NULL),
(500, 'Hill Country Comfort Anthracite Black Castered Game Chair', '5960-75500-BLK', '1205.00', '176.00', '50', 'Part of Hill Country Collection from Hooker,Crafted from hardwood and rubberwood solids,Wood Distressing Type : Rasping, gouging, chopping, worm holes', '', '2021-03-20 22:18:43', '2021-03-20 22:18:43', NULL),
(501, 'Bali Hai Tarpon Cove Game Chair', '01-0593-972-01', '1635.00', '466.96', '60', 'Part of Bali Hai Collection from Tommy Bahama\nCaribbean Sunset Finish,British West Indies Styling,Eclectic Polynesian,Leather Wrapped Rattan Base,Spli', '', '2021-03-20 22:18:44', '2021-03-20 22:18:44', NULL),
(502, 'Emerin Tan Youth Game Chair', '59800', '395.00', '49.63', '50', 'Part of Emerin Collection from Acme,Metal frame construction,Tan finish,Fabric upholstery,Armless design,Convertible bed lounger,Fully padded seat and', '', '2021-03-20 22:18:44', '2021-03-20 22:18:44', NULL),
(503, 'Mitchell Oak Game Chair', '100952', '659.00', '399.21', '40', 'Finish Color: Oak,Caster wheels on chairs', '', '2021-03-20 22:18:44', '2021-03-20 22:18:44', NULL),
(504, 'Marietta Beige Game Chair', '100172', '747.00', '402.90', '60', 'Fabric Color: Beige,Constructed of solid oak,Caster wheels on chairs,Clean Smooth Edges', '', '2021-03-20 22:18:44', '2021-03-20 22:18:44', NULL),
(505, 'Joker Brown Leather Game Chair', 'GC100-086', '1429.00', '130.00', '70', 'Part of Joker Collection from Hooker,Kiln dried frame construction,Precision machined for fluid and consistent shape,Natchez brown finish,Isadora nut ', '', '2021-03-20 22:18:44', '2021-03-20 22:18:44', NULL),
(506, 'Shimmer Antique Grey Bar Cabinet', ' 6600-17', '1247.00', '287.24', '50', 'Part of Shimmer Collection from Alpine,Crafted from pine solids and veneer,Antique grey finish,Wine bottle storage,Wine glass holders,Adjustable inter', '', '2021-03-20 22:18:44', '2021-03-20 22:18:44', NULL),
(507, 'Caracole Classic Carved Ivory Bar', 'CLA-416-052', '5025.00', '334.02', '60', 'Part of Caracole Classic Collection from Caracole,Metal base in whisper of gold,Carved door panels,Interior in soft taupe,2 doors,2 scooped-out shelve', '', '2021-03-20 22:18:44', '2021-03-20 22:18:44', NULL),
(508, 'Roslyn County Wine Cabinet', '1618-75917-DKW', '5775.00', '966.00', '50', 'Anti-tip hardware,Wood Distressing Type : Rasping, chopping, worm holes, gouging,Two metal-wrapped wood-framed seeded glass doors,One drawer behind le', '', '2021-03-20 22:18:44', '2021-03-20 22:18:44', NULL),
(509, 'Melange Bale Bar Cabinet', '638-50546-02', '2296.94', '347.94', '60', 'Two doors,Two adjustable shelves,Shelves are reversible to allow wine bottle storage,Each shelf holds four wine bottles,Two drawers,Wine glass storage', '', '2021-03-20 22:18:44', '2021-03-20 22:18:44', NULL),
(510, 'Stacked Stacked Bar Cabinet', ' DS-D330-002', '1739.00', '655.78', '50', 'Crafted from select sturdy hardwood,Natural finish,Modern rustic style with touch of industrial feel,Slanted bottle rack to store bottles,Tapered legs', '', '2021-03-20 22:18:44', '2021-03-20 22:18:44', NULL),
(511, 'Santa Fe Dark Chocolate 2 Door Bar Unit', '2421DC', '1716.00', '619.54', '50', 'Part of Santa Fe Collection from Sunny Designs,Dark chocolate finish,Crafted from oak wood,Natural slate,Glass holders,Wine rack', '', '2021-03-20 22:18:45', '2021-03-20 22:18:45', NULL),
(512, 'Somerset Latte 6 Runner Area Rug', '99446385598', '117.00', '39.12', '40', 'Part of Somerset Collection from Nourison,Latte Finish,Power Loomed,Fabric content: 50% Polyester, 50% Acrylic,Latex Backing,Low shedding', '', '2021-03-20 22:18:45', '2021-03-20 22:18:45', NULL),
(513, 'Fuzzy Electro Blue Area Rug 5 X 7', ' A1012-57', '200.00', '27.48', '100', '\"Fuzzy\" Electro Blue Shaggy 5-ft x 7-ft Area Rug. Hand Tufted, 100% Polyester with cotton backing. Scratch resistant on hardwood floors. Vacuum regula', '', '2021-03-20 22:18:45', '2021-03-20 22:18:45', NULL);
INSERT INTO `product` (`productId`, `name`, `sku`, `price`, `discount`, `quantity`, `description`, `status`, `createdAt`, `updatedAt`, `color`) VALUES
(514, 'Luxury Chinchilla Faux Fur Area Rug Black 79 X 118', 'RSRBK1219-712', '325.00', '25.01', '70', '100% polypropylene,Chinchilla-like fur front,Cotton Backing,Hand Tufted,Scratch resistant on hardwood floors,Vacuum regularly.1 year limited manufactu', '', '2021-03-20 22:18:45', '2021-03-20 22:18:45', NULL),
(515, 'Jubilant Ivory And Blue 2 X 4 Area Rug', ' 99446479051', '51.00', '19.33', '200', 'Part of Jubilant Collection from Nourison,Ivory/Blue Finish,Power Loomed,Fabric content: 100% Polypropylene,Latex Backing,Low shedding,Borderless desi', '', '2021-03-20 22:18:45', '2021-03-20 22:18:45', NULL),
(516, 'Fantasy Ivory 8 Runner Area Rug', ' 99446271419', '175.00', '68.85', '150', 'Part of Fantasy Collection from Nourison,Ivory Finish,Hand Hooked,Fabric content: 100% Polyester,Cotton Backing,Low shedding', '', '2021-03-20 22:18:45', '2021-03-20 22:18:45', NULL),
(517, '3D Shaggy Hand Tufted Red Swirl Area Rug (5-Ft X 7-Ft)', '3D305R-578', '769.99', '220.00', '150', '100% Polyester,Cotton Backing,Hand Tufted,Scratch Resistant on Hardwood Floors,Vacuum regularly. For minor spills, spot clean with a mild detergent us', '', '2021-03-20 22:18:45', '2021-03-20 22:18:45', NULL),
(518, 'Zuo Modern Sea 2 Wall Decor Multicolor A11522', 'A11522', '87.00', '57.29', '300', 'Made of Steel and Wood,Print on Paper, Slightly Distressed Frame,Handmade, shape and colors will vary', '', '2021-03-20 22:18:45', '2021-03-20 22:18:45', NULL),
(519, 'Metro Black Luxe Gold I Wall Art', '9901-175AEC', '329.00', '96.00', '200', 'Part of Metro Collection from Bassett Mirror,Splashes of gold and black and a black matte frame,Printed,Modern design', '', '2021-03-20 22:18:45', '2021-03-20 22:18:45', NULL),
(520, 'Silver Rectangles Wall Decor', 'HW-1007-30', '443.00', '22.47', '300', 'Geometric sculpture in a metallic-silver finish to add a touch of glitz and compliment your Decor.Made of iron for a quality and longlisting wall Deco', '', '2021-03-20 22:18:45', '2021-03-20 22:18:45', NULL),
(521, 'Noralie 97571 Wall Decor', ' 97571', '803.45', '229.56', '200', 'Accent Wall Décor,Beveled Mirrored Finish,Faux Diamonds Inlays', '', '2021-03-20 22:18:45', '2021-03-20 22:18:45', NULL),
(522, 'Noralie 97572 Wall Decor', '97572', '959.45', '274.13', '200', 'Accent Wall Décor,Beveled Mirrored Finish,Faux Diamonds Inlays', '', '2021-03-20 22:18:46', '2021-03-20 22:18:46', NULL),
(523, 'Priya Multi Wall Art Set of 2', 'A8000264', '255.00', '190.64', '400', 'Set of 2,Gallery wrapped canvas,Unframed,Sawtooth hanger,Clean with a soft, dry cloth', '', '2021-03-20 22:18:46', '2021-03-20 22:18:46', NULL),
(524, 'Pine Crest 3 Drawer Storage Bench', 'CM-BN6300', '339.00', '22.18', '200', 'Part of Pine Crest Collection,Crafted from Solid Wood & other materials,Oak Finish,Mission Style,Square Legs,3 Under Seat Drawers,Spacious drawers for', '', '2021-03-20 22:18:46', '2021-03-20 22:18:46', NULL),
(525, 'Cortwell Gray Storage Bench', 'A3000224', '356.27', '101.79', '100', 'Polyester upholstery in gray,Wood legs with brown finish,Tufted seat cushion,Hinged seat,Interior storage', '', '2021-03-20 22:18:47', '2021-03-20 22:18:47', NULL),
(526, 'Benches Brown Upholstered Storage Bench', 'B010-109', '499.00', '298.29', '100', 'Made of wood,Faux leather upholstery,Seat with storage,Assembly required,Small Space Solution,Includes tipover restraint device', '', '2021-03-20 22:18:47', '2021-03-20 22:18:47', NULL),
(527, 'Beauland Ivory Accent Bench', 'A3000117', '369.00', '202.83', '100', 'Made of wood,Polyester upholstery,Foam cushioned seat,Exposed legs with faux wood finish', '', '2021-03-20 22:18:47', '2021-03-20 22:18:47', NULL),
(528, 'Salinas Shoe Storage Bench in Cape Cod Gray', 'SAS232CG-03', '402.00', '236.50', '200', 'Four open cubby shelves for organization with a spacious surface for bags or clothing,Two adjustable shelves create flexibility for storing various it', '', '2021-03-20 22:18:47', '2021-03-20 22:18:47', NULL),
(529, 'Demarlos Floor Standing Mirror', 'B693-07', '645.00', '181.24', '100', 'Parchment white finish,Large landscape mirror,Made with select oak veneer and hardwood solids,Shaped fronts,Framed pilaster mouldings,Dimensions: 76\" ', '', '2021-03-20 22:18:47', '2021-03-20 22:18:47', NULL),
(530, 'Oengus Bronze Accent Mirror', 'A8010025', '585.00', '349.29', '200', 'Antiqued silvertone metal frame,Mirrored glass,Square bracket hanger,Clean with a soft, dry cloth', '', '2021-03-20 22:18:47', '2021-03-20 22:18:47', NULL),
(531, 'Elite Buffet Mirror', 'ELITEMIRRORFORBUFFET', '779.03', '46.46', '100', 'Sturdy construction,New Silver Birch finish,Made in Italy', '', '2021-03-20 22:18:48', '2021-03-20 22:18:48', NULL),
(532, 'Kaleidoscope Rectangle Mirror on MDF', '7KALE-MILI', '1475.00', '3.00', '60', 'The design on the frame of this alluring mirror is taken from photos of agate repeated in a way that gives the impression of looking through a kaleido', '', '2021-03-20 22:18:48', '2021-03-20 22:18:48', NULL),
(533, 'Payton Wall Mirror', 'PY922', '444.89', '127.11', '80', 'Round Shape,Wall Mirror,Beveled Mirrored Frame,MDF Back - Black Finish,Hooks Included', '', '2021-03-20 22:18:48', '2021-03-20 22:18:48', NULL),
(534, 'Mr 4019 Modern 32\" Round Clear Mirror', 'MR-4019', '199.00', '33.40', '100', 'Part Of Modern Collection From Elegant Lighting,Clear finish,Round shape,Beveled glass,Can be hung horizontally or vertically', '', '2021-03-20 22:18:49', '2021-03-20 22:18:49', NULL),
(535, 'JandM Float Dining Display Curio in Dark Oak 17705', '17705', '3362.30', '2293.98', '200', 'Float Collection from J&M Furniture,Modern contemporary style,Ultra modern exterior,4 Fixed wooden shelves,Timber Chocolate wooden shelves,Solid glass', '', '2021-03-20 22:18:49', '2021-03-20 22:18:49', NULL),
(536, 'Northville Antique Champagne Curio', '66924', '1939.00', '83.50', '100', 'Part of Northville Collection from ACME Furniture\n2 glass doors for storage,Touch light,3 shelves,Raised scrolled motifs,Acanthus leaves,Carved moldin', '', '2021-03-20 22:18:49', '2021-03-20 22:18:49', NULL),
(537, 'Black Base Glass Curio', '6628-CUR-BLK', '1590.45', '323.40', '100', 'Tempered glass,High Gloss Black Base,The base contains a drawer for storage,All glass, 360 degree view of content,Lock on the top of front door', '', '2021-03-20 22:18:49', '2021-03-20 22:18:49', NULL),
(538, 'Cline Two Tone Curio', '5530-50', '1139.00', '162.89', '200', 'Part of Cline Collection from Homelegance,Two tone finish', '', '2021-03-20 22:18:49', '2021-03-20 22:18:49', NULL),
(539, 'Metal Trim Veneer Sliding Door Curio', 'P021642', '1789.00', '261.13', '100', 'Part of Simplicity Collection from Grove Furniture Designs,Crafted from ebony macassar veneers and poplar solids,Metal trim veneer sliding door curio,', '', '2021-03-20 22:18:49', '2021-03-20 22:18:49', NULL),
(540, 'Mckewen Light Gray Curio', '1820-50', '2079.00', '675.94', '200', 'Part of Mckewen Collection from Homelegance,Crafted From Oak veneer, engineered wood,Light Gray Finish,2 cabinet glass doors,3 adjustable glass shelve', '', '2021-03-20 22:18:49', '2021-03-20 22:18:49', NULL),
(541, 'Grema Pillow PLS7142C-1220', 'PLS7142C-1220', '90.38', '25.82', '600', 'Beautifully bohemian yet playfully posh, the Grema pillow features dainty rows of braided fringe, creating lavish textures to adorn any upholstered ro', '', '2021-03-20 22:18:49', '2021-03-20 22:18:49', NULL),
(542, 'Horizon Linen Slipcover for T-Cushion Sofa', ' SU-117600SC-466082', '1249.34', '781.87', '200', 'Have fun changing the look and feel of your Sunset Trading Horizon Slipcovered Sofa with this well-made T-cushion slipcover,Enjoy the versatility a sl', '', '2021-03-20 22:18:49', '2021-03-20 22:18:49', NULL),
(543, 'Cloud Puff Gray Slipcover for Square Modular Ottoman', 'SU-145830SC-391094', '867.14', '623.23', '300', 'Sunset Performance Fabricmachine washable slipcovers will become your new best friend.Just because you have children and pets doesn\'t mean you can\'t h', '', '2021-03-20 22:18:49', '2021-03-20 22:18:49', NULL),
(544, 'Cloud Puff Gray Slipcover for 5 Piece Modular Sectional Sofa', 'SU-1458SC-94-3C-1A-1', '3206.54', '1470.70', '200', 'Sunset Performance Fabricmachine washable slipcovers will become your new best friend.Just because you have children and pets doesn\'t mean you can\'t h', '', '2021-03-20 22:18:49', '2021-03-20 22:18:49', NULL),
(545, 'Coban Sea Feather Down Throw Pillow', 'LCPICO20SEAF', '125.00', '78.11', '100', 'Part of Coban Collection from Armen Living,Sea finish,Fabric content: 27% Cotton, 35% Polyester, 38% Viscose,Sea foam jacquard fabric,Texture pattern,', '', '2021-03-20 22:18:49', '2021-03-20 22:18:49', NULL),
(546, 'Metea Black and Gray Pillow Set of 4', 'A1000861', '143.00', '45.18', '400', 'Polyester cover (with faux carved fur front/sherpa back),Polyester fill,Zipper closure,Imported,Machine washable', '', '2021-03-20 22:18:49', '2021-03-20 22:18:49', NULL),
(547, 'Ceramic Gold Plated Vase With Diamond Incrustation 8.5 X 7.5 X 15H', 'YS9227J7R', '85.00', '6.01', '1500', 'Ceramic,Crystal Embellished,Clean with damp cloth,1 year limited manufacturer warranty', '', '2021-03-20 22:18:49', '2021-03-20 22:18:49', NULL),
(548, 'Zuo Modern Jaci Large Plate Antique Gold and White A11396', 'A11396', '156.00', '107.41', '300', 'Made of Ceramic,Underside is solid White,Handmade, shape and colors will vary', '', '2021-03-20 22:18:49', '2021-03-20 22:18:49', NULL),
(549, 'Nowles 13 Inch Accent Candleholder 97618', '97618', '414.39', '118.40', '300', 'Candleholder,Features: Beveled Mirrored Finish w/Faux Stones Inlay, 4mm Clear Tempered Glass,2Pc Set', '', '2021-03-20 22:18:50', '2021-03-20 22:18:50', NULL),
(550, 'Modern Ecomix Bird', 'DD-1025-53', '358.00', '311.48', '200', 'Made using reclaimed materials for an eco-friendly product.An eye-catching accent for a nature-themed room.', '', '2021-03-20 22:18:50', '2021-03-20 22:18:50', NULL),
(551, 'Bronze Hammered Trays Set of 2', 'HW-1022-31', '117.00', '32.76', '500', 'The hand finished hammered look gives the trays an artisanal look and feel. The shiny gold finish will add some glitz to your space. Made of quality m', '', '2021-03-20 22:18:50', '2021-03-20 22:18:50', NULL),
(552, 'Ceramic Chrome Plated Vase With Diamond Incrustation 7 X 7 X 17H', 'YS9239LP', '117.00', '8.51', '200', 'Ceramic,Crystal Embellished,Clean with damp cloth,1 year limited manufacturer warranty', '', '2021-03-20 22:18:50', '2021-03-20 22:18:50', NULL),
(553, 'Stream Vessels (set of 3)', '7STRE-VAGB', '322.00', '92.00', '500', 'Multiple colors create an elegant swirled effect under this matte glass finish, producing a distinctive piece where no two will be alike', '', '2021-03-20 22:18:50', '2021-03-20 22:18:50', NULL),
(554, 'Icicle Medium Vessel', '7ICIC-VEWH', '499.10', '142.60', '500', 'Our textured marble collection is inspired by the shapes and contours of ice and snow. The cool marble surface is constructed to elicit bold patterns ', '', '2021-03-20 22:18:50', '2021-03-20 22:18:50', NULL),
(555, 'Small Glass Hurricanes (set of 3)', '7HURR-SMLG', '354.20', '101.20', '500', 'This stunning set of hurricanes are perfect for the holidays or adding sparkle to everyday.', '', '2021-03-20 22:18:50', '2021-03-20 22:18:50', NULL),
(556, 'Canvas Globe', '7GLOB-LGCA', '437.50', '0.50', '500', 'This handsome take on a classic world globe uses vintage canvas and dark stitching to create a unique accessory piece!', '', '2021-03-20 22:18:50', '2021-03-20 22:18:50', NULL),
(557, 'Glacier Small Vessel', '7GLAC-VEWH', '402.50', '115.00', '500', 'Our textured marble collection is inspired by the shapes and contours of ice and snow. The cool marble surface is constructed to elicit bold patterns ', '', '2021-03-20 22:18:50', '2021-03-20 22:18:50', NULL),
(558, 'Black Damani Screen', ' CV-1013-20', '2849.00', '950.00', '600', 'Made with mixed natural hardwood that\'s been mounted onto a strong aluminum frame, the Damani Screen is the perfect solution for separating your offic', '', '2021-03-20 22:18:50', '2021-03-20 22:18:50', NULL),
(559, 'Drift Smoked Wood Display Shelving HGDA545', 'HGDA545', '300.00', '80.00', '700', 'The drift collection - choose from shelves, cabinets and drawers to create a functional wall system that allows you to organize your home or office. M', '', '2021-03-20 22:18:50', '2021-03-20 22:18:50', NULL),
(560, 'Damaris 4 Tier Chrome Wire Corner Rack', 'HAC1004A', '109.80', '43.12', '500', 'Designed to be the ultimate space-saver, the Damaris 4 Tier Corner Rack offers deep vertical layers of storage. Its durable metallic finish and sturdy', '', '2021-03-20 22:18:50', '2021-03-20 22:18:50', NULL),
(561, 'Socalle Natural Four Cube Organizer', 'EA1864-2X2', '66.14', '25.55', '400', 'Two-by-two storage cube,Made of engineered wood and engineered veneer,Natural wood tone finish with replicated oak grain texture,Assembly required,Est', '', '2021-03-20 22:18:50', '2021-03-20 22:18:50', NULL),
(562, 'Paxberry Whitewash Eight Cube Organizer', ' EA1811-4X2', '97.62', '27.51', '400', 'Four-by-two storage cube,Made of engineered wood,Distressed, whitewashed finish,Assembly required,Estimated Assembly Time: 20 Minutes', '', '2021-03-20 22:18:50', '2021-03-20 22:18:50', NULL),
(563, 'Socalle Natural Three Cube Organizer', 'EA1864-3X1', '59.82', '24.09', '300', 'Three-by-one storage cube,Made of engineered wood and engineered veneer,Natural wood tone finish with replicated oak grain texture,Assembly required,E', '', '2021-03-20 22:18:50', '2021-03-20 22:18:50', NULL),
(564, 'Salinas 6 Cube Organizer in Cape Cod Gray', 'SAB148CG-03', '458.00', '253.85', '200', 'Six cubby spaces designed to store home and office supplies or display decorative accents,One fixed shelf and two adjustable shelves offer flexible st', '', '2021-03-20 22:18:50', '2021-03-20 22:18:50', NULL),
(565, 'Alfresco Oyster Lettore Etagere', '6025-10443-90', '3274.60', '935.60', '300', 'Part of Alfresco Collection from Hooker,Crafted from oak veneers,Oyster finish', '', '2021-03-20 22:18:51', '2021-03-20 22:18:51', NULL),
(566, 'Scott Oak 5-Tier Etagere', 'AMH6590A', '879.86', '476.34', '400', 'Industrial and contemporary, the Scott etagere boasts brown-toned elm shelves that seem to float on wrap-around frames of dark metal. Ideal for any ro', '', '2021-03-20 22:18:51', '2021-03-20 22:18:51', NULL),
(567, 'Woodlands Medium Wood Etagere', '5820-10443-84', '2967.00', '628.00', '200', 'Five fixed wood-framed glass shelves,Levelers,Metal sides and shelf frames', '', '2021-03-20 22:18:51', '2021-03-20 22:18:51', NULL),
(568, 'Roslyn County Etagere', '1618-10445-DKW', '2376.00', '387.00', '300', 'Four fixed wood shelves,Wood Distressing Type : Rasping, chopping, worm holes, gouging,Shelf space: 29 1/2W x 13 1/2D x 16 3/4H,Floor bottom of base r', '', '2021-03-20 22:18:51', '2021-03-20 22:18:51', NULL),
(569, 'Twin Palms Seven Seas Etagere', '01-0558-991', '3079.00', '911.01', '200', 'Part of Twin Palms Collection from Tommy Bahama,Casual elegance and sophisticated look,Lighter wood tones,Leather wrapped bamboo carved moldings,Antiq', '', '2021-03-20 22:18:51', '2021-03-20 22:18:51', NULL),
(570, 'Maverick Rustic Saal Etagere', '31616', '1205.00', '337.00', '200', 'Part of Maverick Collection from Riverside Furniture,Crafted from reclaimed saal hardwood solid,Rustic saal finish,Fixed angled shelves,Tip restrainin', '', '2021-03-20 22:18:51', '2021-03-20 22:18:51', NULL),
(571, 'Ramato Wall Clock MC4239', 'MC4239', '850.00', '257.83', '400', 'The Ramato Wall Clock features the classic look of wooden panel and oversized roman numerals. This clock?s charming rusticity and simplistic beauty ma', '', '2021-03-20 22:18:51', '2021-03-20 22:18:51', NULL),
(572, 'Boho Antique Pewter Westminster Wall Clock', 'MC4106EC', '229.00', '55.00', '200', 'Part of Boho Collection from Bassett Mirror,Antique pewter finished,Clipped corner designed,Contemporary design', '', '2021-03-20 22:18:51', '2021-03-20 22:18:51', NULL),
(573, 'Farm Bronze Kinsley Wall Clock', 'MC4173', '949.00', '394.99', '300', 'Part of Farm Collection from Bassett Mirror,Bronze kinsley', '', '2021-03-20 22:18:51', '2021-03-20 22:18:51', NULL),
(574, 'Farm Bronze Flanders Wall Clock', 'MC4172', '949.00', '396.90', '200', 'Part of Farm Collection from Bassett Mirror,Bronze flanders', '', '2021-03-20 22:18:51', '2021-03-20 22:18:51', NULL),
(575, 'Farm Bronze and Natural Wood Eldridge Wall Clock', 'MC4019EC', '469.00', '94.92', '300', 'Part of Farm Collection from Bassett Mirror,Natural wood,Contemporary design', '', '2021-03-20 22:18:51', '2021-03-20 22:18:51', NULL),
(576, 'Nasa Mirrored Wall Clock', '97398', '625.00', '246.31', '200', 'Part of Nasa Collection from Acme,Crafted from MDF,Mirrored finish,Roman numerals,Mirror with beveled edge,Quartz mechanism', '', '2021-03-20 22:18:51', '2021-03-20 22:18:51', NULL),
(577, 'Donisha Antique Brass Finish Planter Set', 'A2000407', '129.12', '57.66', '100', 'Made of metal,Set of 2 planters,Antiqued brass-tone and black finished metal', '', '2021-03-20 22:18:51', '2021-03-20 22:18:51', NULL),
(578, 'Domele Antique Gray/Brown Planter Set', 'A2000405', '129.12', '57.66', '100', 'Made of wood and metal,Set of 2 planters,White and galvanized finished metal planter,Antiqued brown finished wood stand,Set of 2 Planters. White and G', '', '2021-03-20 22:18:51', '2021-03-20 22:18:51', NULL),
(579, 'Everest Planter Large BQ-1053-05', 'BQ-1053-05', '383.00', '76.29', '200', 'Solid Acacia Wood,Solid Ivory Concrete Top,Contemporary Modern,Indoor/Outdoor Use', '', '2021-03-20 22:18:51', '2021-03-20 22:18:51', NULL),
(580, 'Bristol Planter Concrete Grey BQ-1049-25', 'BQ-1049-25', '488.00', '169.51', '100', 'Terrazzo Construction,Rectangular Design,Color: Dark Grey,Style: Contemporary Modern', '', '2021-03-20 22:18:52', '2021-03-20 22:18:52', NULL),
(581, 'Atlantic Rectangular Planter BQ-1047-15', 'Sku: BQ-1047-15', '584.00', '144.16', '200', 'Concrete Construction,Acacia Wood Frame,Rectangular Design,Color: Lava-Grey', '', '2021-03-20 22:18:52', '2021-03-20 22:18:52', NULL),
(582, 'Blue and White Washed Planter', 'A10283', '69.00', '44.07', '400', 'Ceramic frame.Blue and white finish.Casual and laid back, this bright turquoise planter is anything but uptight.Irregular lines on a soft shape makes ', '', '2021-03-20 22:18:52', '2021-03-20 22:18:52', NULL),
(583, 'Sparkle 9\" Rectangular Clear Photo Frame', 'MR9107', '69.00', '22.37', '200', 'Part Of Sparkle Collection From Elegant Lighting,Crafted from MDF,Clear finish,Rectangle shape,Beveled glass,Can be hung horizontally or vertically', '', '2021-03-20 22:18:52', '2021-03-20 22:18:52', NULL),
(584, 'Sparkle 8\" Rectangular Clear Photo Frame', 'MR9106', '59.00', '13.77', '100', 'Part Of Sparkle Collection From Elegant Lighting,Crafted from MDF,Clear finish,Rectangle shape,Beveled glass,Can be hung horizontally or vertically', '', '2021-03-20 22:18:52', '2021-03-20 22:18:52', NULL),
(585, 'Sparkle 10\" Rectangular Clear Photo Frame', 'MR9104', '69.00', '20.53', '200', 'Part Of Sparkle Collection From Elegant Lighting,Crafted from MDF,Clear finish,Rectangle shape,Beveled glass,Can be hung horizontally or vertically', '', '2021-03-20 22:18:52', '2021-03-20 22:18:52', NULL),
(586, 'Sparkle 11\" Rectangular Clear Photo Frame', 'MR9105', '75.00', '23.47', '100', 'Part Of Sparkle Collection From Elegant Lighting,Crafted from MDF,Clear finish,Rectangle shape,Beveled glass,Can be hung horizontally or vertically', '', '2021-03-20 22:18:52', '2021-03-20 22:18:52', NULL),
(587, 'Champagne Floor Display Stand', '920000', '625.00', '130.90', '200', 'Metal frame construction,Champagne finish,Clear acrylic sleeve', '', '2021-03-20 22:18:52', '2021-03-20 22:18:52', NULL),
(588, 'Paloma 14\" Pewter 3 Light Wall Sconce', '1210W13PW', '285.00', '173.86', '300', 'Part of Paloma Collection from Elegant Lighting,Pewter finish,Number of lights: 3,Bulb type: e12,Bulb included: no,Dimmable: yes,Bulb wattage: 40w,Max', '', '2021-03-20 22:18:52', '2021-03-20 22:18:52', NULL),
(589, 'Avalbane Clear and Gray Glass Pendant Light', 'L0004687', '179.00', '21.85', '400', 'Industrial aesthetic glass dome,1 type A bulb (not included); 60-watt max or CFL 13-watt max; UL Listed,Indoor use only,Hardwired; professional instal', '', '2021-03-20 22:18:52', '2021-03-20 22:18:52', NULL),
(590, 'Jocelin Distressed White Wood Pendant Light', 'L0005481', '269.00', '43.28', '200', 'Made of wood and metal,4 type B candelabra-style bulbs (not included); 40-watt max or CFL 8-watt max; UL Listed,Hardwired fixture; professional instal', '', '2021-03-20 22:18:52', '2021-03-20 22:18:52', NULL),
(591, 'Lila 78.5\" Silver Table Lamp', 'L9149T', '615.00', '359.59', '300', 'Part of Lila Collection from Furniture of America,Silver finish,Hanging crystals and a polished chrome base,Double shade,Silver metal,Evokes class and', '', '2021-03-20 22:18:52', '2021-03-20 22:18:52', NULL),
(592, 'Jaxson Brass Gold Wall Sconce', 'SCN4014A', '125.66', '23.47', '100', 'Add polished luxury to any living room, dining room or hall with this modern sconce. Often used in pairs, its classic design features elegant, soft cu', '', '2021-03-20 22:18:53', '2021-03-20 22:18:53', NULL),
(593, 'Meringue White Polymer Pendant Lighting HGVF109', 'HGVF109', '270.00', '110.20', '200', 'Rhythmic sculpted waves characterize the hypnotic merangue pendant. Casting an inviting glow in corrugated polypropylene and brilliant chromed steel t', '', '2021-03-20 22:18:53', '2021-03-20 22:18:53', NULL),
(594, 'Lila 78.5\" Silver Table Lamp', 'L9149T1', '615.00', '359.59', '100', 'Part of Lila Collection from Furniture of America,Silver finish,Hanging crystals and a polished chrome base,Double shade,Silver metal,Evokes class and', '', '2021-03-20 22:18:53', '2021-03-20 22:18:53', NULL),
(595, 'Small Batik Table Lamp', '9BATIKSM131S', '312.50', '2.00', '300', 'Our Batik lamps are available in two sizes and are great accents for today\'s updated blue and white coastal esthetic. Inspired by Japanese ceramics, t', '', '2021-03-20 22:18:53', '2021-03-20 22:18:53', NULL),
(596, 'Furniture of America Silver Table Lamp', ' L9150T', '800.00', '519.49', '200', 'Traditional,Silver,Crystal,Metal,Height: 30\",Metal & Crystal', '', '2021-03-20 22:18:53', '2021-03-20 22:18:53', NULL),
(597, 'Kamdyn Blue and White Table Lamp Set of 2', 'TBL4145A-SET2', '385.82', '164.79', '400', 'A design classic, this refined table lamp elevates any living room with timeless luxury. Finely crafted with a delicate blue and white pattern on its ', '', '2021-03-20 22:18:54', '2021-03-20 22:18:54', NULL),
(598, 'Estilo Silver Gray Column Table Lamp with White Shade Set of 2', ' LIT4304A-SET2', '329.39', '137.97', '200', 'Classically elegant, the set of two Estilo Column table lamps make a dramatic statement in an entry hall of living room. Crafted with silver grey meta', '', '2021-03-20 22:18:54', '2021-03-20 22:18:54', NULL),
(599, 'Marcelo Smoking Gray and Brass Gold Table Lamp Set of 2', 'TBL4133A-SET2', '394.73', '183.53', '100', 'The posh modern glamour of this contemporary table lamp transforms any living room. Its three exquisite glass spheres feature a dramatic smoke grey hu', '', '2021-03-20 22:18:54', '2021-03-20 22:18:54', NULL),
(600, 'Alvaro Clear and Bronze Glass Table Lamp Set of 2', ' L431374', '300.00', '201.33', '300', 'Made of glass and bronze-tone metal with square fabric hardback shade,3-way switch,1 type A bulb (not included); 150 watts max or CFL 25 watts max,Cle', '', '2021-03-20 22:18:54', '2021-03-20 22:18:54', NULL),
(601, 'Vicka Brushed Silver Table Lamp Set of 2', '40048', '192.05', '54.87', '400', 'Part of Vicka Collection from Acme,Metal frame construction,Brushed silver finish,Wattage: 40watts,Socket type: e27 metal shell,Base: metal,Drum shape', '', '2021-03-20 22:18:54', '2021-03-20 22:18:54', NULL),
(602, 'Niobe Ceramic Table Lamp Set of 2', 'L123884', '175.00', '40.94', '300', 'Clean with a soft, dry cloth,3-way switch,1 type A bulb (not included); 150 watts max or CFL 25 watts max; UL-listed,Made of ceramic with fabric shade', '', '2021-03-20 22:18:55', '2021-03-20 22:18:55', NULL),
(603, 'Derek Table Lamps Set of 2', 'L316984', '145.00', '20.90', '200', 'Set of 2 table lamps,Richly rustic base crafted of poly resin,Paper silhouette shade with decorative design,Each table lamp takes 100-watt max bulb or', '', '2021-03-20 22:18:55', '2021-03-20 22:18:55', NULL),
(604, 'Amayeta Silver Poly Table Lamp Set of 2', ' L243134', '119.00', '11.13', '100', 'Lamp base made of resin in silver finish,Rectangular hardback shade enhances the modern, structural aesthetic,3-way switch makes this lamp a smart cho', '', '2021-03-20 22:18:55', '2021-03-20 22:18:55', NULL),
(605, 'Marnina Brown Ceramic Table Lamp Set of 2', ' L121854', '164.18', '46.90', '200', 'Made of white and taupe glazed ceramic with modified drum shade,3-way switch,1 type A bulb (not included); 100 watts max or CFL 23 watts max; UL Liste', '', '2021-03-20 22:18:55', '2021-03-20 22:18:55', NULL),
(606, 'Sadie Floor Lamp', ' SD941', '91.62', '26.18', '100', 'Lamp Shade Shape: Taper,1 Light,Not Dimmable, ON/ OFF Switch Type,Bulb not included, recommended bulb: Type A, 60W, Bulb Base: E26,6 Feet Cord Length,', '', '2021-03-20 22:18:55', '2021-03-20 22:18:55', NULL),
(607, 'Brendon Metal and Antique Brass Floor Lamp', 'FLL4039A', '172.34', '65.64', '300', 'Dramatic and bold, this contemporary floor lamp adds modern sophistication to any living room. Its sleek black lines are paired with an antique brass ', '', '2021-03-20 22:18:55', '2021-03-20 22:18:55', NULL),
(608, 'Lumi Arc Black 69 Inch Floor Lamp', 'LIT4467A', '329.69', '135.69', '200', 'The sensual black metal curves and marble base of this arc 69-inch floor lamp were inspired by a legendary Parisian architect\'s design classic. Its sc', '', '2021-03-20 22:18:55', '2021-03-20 22:18:55', NULL),
(609, 'Veta Chrome Floor Lamp', '40052', '414.93', '118.55', '300', 'Part of Veta Collection from Acme,Metal frame construction,Chrome finish,Wattage: 40watts,Socket type: e27 porcelain,Shade: chandelier style', '', '2021-03-20 22:18:55', '2021-03-20 22:18:55', NULL),
(610, 'Rigel Silver Floor Lamp', 'L9720F', '719.00', '124.69', '400', 'Part of Rigel Collection from Furniture of America,Crystal frame upholstery,Silver finish,Iron stand', '', '2021-03-20 22:18:55', '2021-03-20 22:18:55', NULL),
(611, 'Silver Branch 58 Inch Floor Lamp', 'LIT4075B', '362.43', '165.92', '200', 'Nature or nurture. The sleek, sophisticated sculpted body of the Silver Branch Floor Lamp is a luxurious addition to a contemporary interior. Sculpted', '', '2021-03-20 22:18:55', '2021-03-20 22:18:55', NULL),
(612, 'Avalbane Clear and Gray Glass Pendant Light', 'L000468', '179.00', '21.85', '100', 'Industrial aesthetic glass dome,1 type A bulb (not included); 60-watt max or CFL 13-watt max; UL Listed,Indoor use only,Hardwired; professional instal', '', '2021-03-20 22:18:55', '2021-03-20 22:18:55', NULL),
(613, 'Jocelin Distressed White Wood Pendant Light', 'L000548', '269.00', '43.28', '200', 'Made of wood and metal,4 type B candelabra-style bulbs (not included); 40-watt max or CFL 8-watt max; UL Listed,Hardwired fixture; professional instal', '', '2021-03-20 22:18:55', '2021-03-20 22:18:55', NULL),
(614, 'Rococo 11\" Chrome 3 Light Pendant With Clear Royal Cut Crystal Trim', 'V7803D11C/RC', '159.00', '43.91', '100', 'Part of Rococo Collection from Elegant Lighting,Chrome finish,Chrome finished steel hardware,Steel and glass fixture\nShade included: no,Number of ligh', '', '2021-03-20 22:18:55', '2021-03-20 22:18:55', NULL),
(615, 'Stanton 14.8\" Wood Grain And Burnished Nickel 1 Light Pendant', 'LDPD2107', '119.00', '26.64', '200', 'Part of Stanton Collection from Elegant Lighting,Wood grain and burnished nickel finish,Wood grain finished iron hardware,Wood and iron fixture,Wood g', '', '2021-03-20 22:18:56', '2021-03-20 22:18:56', NULL),
(616, 'Evelyn Pendant Light 105182', '105182', '715.94', '585.92', '200', 'Pendant Lighting 6\"D x 13\"H,Weight 2', '', '2021-03-20 22:18:56', '2021-03-20 22:18:56', NULL),
(617, 'String 30 White String Pendant', 'HGML368', '995.00', '137.00', '200', 'White molded string shade,Chrome steel canopy,Bulb Type: 1- E26,Wattage Per Bulb: 100W,Bulb Included: No,Quick Ship', '', '2021-03-20 22:18:56', '2021-03-20 22:18:56', NULL),
(618, 'Brede Silver Finish Wall Sconce', 'A8010190', '113.36', '50.04', '300', 'Made of metal and glass,Silvertone finish,Holds 1 pillar candle (not included),Keyhole bracket for hanging', '', '2021-03-20 22:18:56', '2021-03-20 22:18:56', NULL),
(619, 'Blueprint Sconce', '4BLUE-SCABGR', '531.30', '151.80', '200', 'Our Blueprint wall sconce comes in three finishes and has an architectural profile and glass shade. The contrast of the glass and the metal along with', '', '2021-03-20 22:18:57', '2021-03-20 22:18:57', NULL),
(620, 'Tate 20.6\" Chrome 3 Light Wall Sconce', 'LD7001W21C', '119.00', '2.00', '100', 'Part of Tate Collection from Elegant Lighting,Chrome finish,Clear royal cut crystal trim,Chrome finished stainless steel and iron hardware,Stainless s', '', '2021-03-20 22:18:57', '2021-03-20 22:18:57', NULL),
(621, 'Lyndon 10\" Dark Bronze 2 Light Wall Sconce', '1452W9DB', '109.00', '41.00', '200', 'Part of Lyndon Collection from Elegant Lighting,Dark bronze finish,Gently sweeping lines,Dark bronze finished steel hardware,Metal fixture,Backplate i', '', '2021-03-20 22:18:57', '2021-03-20 22:18:57', NULL),
(622, 'Bavaria 8\" Burnished Brass 2 Light Wall Sconce', '1491W8BB', '389.00', '178.96', '300', 'Part of Bavaria Collection from Elegant Lighting,Burnished brass finish,Burnished brass finished steel hardware,Metal fixture,Backplate included: yes,', '', '2021-03-20 22:18:57', '2021-03-20 22:18:57', NULL),
(623, 'Bavaria 5\" Burnished Brass 1 Light Wall Sconce', '1491W5BB', '349.00', '156.05', '100', 'Part of Bavaria Collection from Elegant Lighting,Burnished brass finish,Burnished brass finished steel hardware,Metal fixture,Backplate included: yes,', '', '2021-03-20 22:18:57', '2021-03-20 22:18:57', NULL),
(624, 'White Linen Basket Bathroom Storage', 'DS-A049-857', '329.00', '97.88', '200', 'Crafted from hardwood solids and birch veneers,Clean white linen finish,1 Drawer,Full extension drawer glides,2 fabric lined shelves,Aged brass hardwa', '', '2021-03-20 22:18:57', '2021-03-20 22:18:57', NULL),
(625, 'Atrian Black Marble and Mirrrored Sink Cabinet', '90345', '1209.00', '287.00', '100', 'Part of Atrian Collection from ACME Furniture,2 top drawers for storage,2 Mirrored doors,1 shelf,Black marble panel,Tapered leg,Mirror inlay,Glide sid', '', '2021-03-20 22:18:57', '2021-03-20 22:18:57', NULL),
(626, 'Cayman 36 Inch Bathroom Sink EEI-4203-WHI', 'EEI-4203-WHI', '495.00', '293.51', '200', 'Modern Bathroom Sink,Ceramic Construction,8-Inch Centerset,Integrated Countertop,Square Basin', '', '2021-03-20 22:18:57', '2021-03-20 22:18:57', NULL),
(627, 'Cayman 24 Inch Bathroom Sink EEI-3766-WHI', 'EEI-3766-WHI', '269.00', '151.27', '300', 'Modern 24\" Bathroom Sink,Ceramic Construction,8-Inch Centerset,Narrow Integrated Countertop,Rectangular Basin', '', '2021-03-20 22:18:57', '2021-03-20 22:18:57', NULL),
(628, 'Grenada 16.5 Inch Pedestal Bathroom Sink EEI-4491-WHI', 'EEI-4491-WHI', '899.00', '541.25', '400', 'Contemporary Pedestal Sink,White Ceramic Construction,1.4\" Faucet Hole,Fixtures Not Included', '', '2021-03-20 22:18:57', '2021-03-20 22:18:57', NULL),
(629, 'Mid-Century - Modern Herald Over The Toilet Storage With 3 Shelves In White', '172AMC6', '647.84', '495.13', '200', 'Modern Over the Toilet Storage Shelves for Compact and Space saving Bathroom Design.Upon Assembly Measures: 21.06 in. Length, 71.65 in. Height, 9.84 i', '', '2021-03-20 22:18:57', '2021-03-20 22:18:57', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `product_category`
--

CREATE TABLE `product_category` (
  `id` int(11) NOT NULL,
  `productId` int(11) NOT NULL,
  `categoryId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `product_category`
--

INSERT INTO `product_category` (`id`, `productId`, `categoryId`) VALUES
(5, 1, 9),
(7, 3, 9),
(8, 8, 9),
(9, 9, 9);

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
(1, 1, 'product4_244_br-kubdmcn_244_br-qubdmcn-set_2.jpg', 'Birlanny Silver Upholstered Panel Bedroom Set', 0, 1, 0, 0),
(2, 2, 'product2_b733-58-56-97-92_1.jpg', 'Lettner Light Gray Sleigh Bedroom Set', 0, 1, 0, 0),
(4, 3, 'product5_bolanburg-white-panel-bedroom-set_qb1167629_50.jpg', 'Bolanburg White Panel Bedroom Set', 0, 1, 0, 0),
(5, 8, 'product6_mirage-panel-bedroom-set_qb13210259.jpg', 'Mirage Panel Bedroom Set', 0, 1, 0, 0),
(6, 9, 'product1_cassimore-north-shore-pearl-silver-panel-bedroom-set_qb1196017.jpg', 'Cassimore Pearl Silver Panel Bedroom Set', 0, 1, 0, 0);

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
(5, 'Express Delivery', 'expressdelivery1', '100', '1 Day ', '1', '2021-03-27 15:18:14'),
(6, 'Platinum Delivery', 'platinumdelivery3', '50', '3 Days', '1', '2021-03-27 15:19:09'),
(7, 'Free delivery', 'freedelivery', '0', '7 days ', '1', '2021-03-27 15:20:00'),
(8, 'Gold Delivery', 'goldelivery2day', '70', '2 Days', '1', '2021-03-31 09:06:08');

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
-- Indexes for table `brand`
--
ALTER TABLE `brand`
  ADD PRIMARY KEY (`brandId`);

--
-- Indexes for table `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`cartId`);

--
-- Indexes for table `cart_address`
--
ALTER TABLE `cart_address`
  ADD PRIMARY KEY (`cartAddressId`);

--
-- Indexes for table `cart_item`
--
ALTER TABLE `cart_item`
  ADD PRIMARY KEY (`cartItemId`);

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`categoryId`);

--
-- Indexes for table `category_media`
--
ALTER TABLE `category_media`
  ADD PRIMARY KEY (`mediaId`);

--
-- Indexes for table `cms_table`
--
ALTER TABLE `cms_table`
  ADD PRIMARY KEY (`pageId`),
  ADD UNIQUE KEY `identifier` (`identifier`);

--
-- Indexes for table `config`
--
ALTER TABLE `config`
  ADD PRIMARY KEY (`configId`);

--
-- Indexes for table `config_group`
--
ALTER TABLE `config_group`
  ADD PRIMARY KEY (`groupId`);

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
-- Indexes for table `order_address`
--
ALTER TABLE `order_address`
  ADD PRIMARY KEY (`orderAddressId`);

--
-- Indexes for table `order_item`
--
ALTER TABLE `order_item`
  ADD PRIMARY KEY (`orderItemId`);

--
-- Indexes for table `order_table`
--
ALTER TABLE `order_table`
  ADD PRIMARY KEY (`orderId`);

--
-- Indexes for table `payment_method`
--
ALTER TABLE `payment_method`
  ADD PRIMARY KEY (`paymentMethodId`);

--
-- Indexes for table `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`productId`),
  ADD UNIQUE KEY `sku` (`sku`);

--
-- Indexes for table `product_category`
--
ALTER TABLE `product_category`
  ADD PRIMARY KEY (`id`),
  ADD KEY `categoryId` (`categoryId`),
  ADD KEY `productId` (`productId`);

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
  MODIFY `adminId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `attribute`
--
ALTER TABLE `attribute`
  MODIFY `attributeId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `attribute_option`
--
ALTER TABLE `attribute_option`
  MODIFY `optionId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `brand`
--
ALTER TABLE `brand`
  MODIFY `brandId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `cart`
--
ALTER TABLE `cart`
  MODIFY `cartId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `cart_address`
--
ALTER TABLE `cart_address`
  MODIFY `cartAddressId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `cart_item`
--
ALTER TABLE `cart_item`
  MODIFY `cartItemId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
  MODIFY `categoryId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=124;

--
-- AUTO_INCREMENT for table `category_media`
--
ALTER TABLE `category_media`
  MODIFY `mediaId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `cms_table`
--
ALTER TABLE `cms_table`
  MODIFY `pageId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `config`
--
ALTER TABLE `config`
  MODIFY `configId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `config_group`
--
ALTER TABLE `config_group`
  MODIFY `groupId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `customer_address`
--
ALTER TABLE `customer_address`
  MODIFY `addressId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `customer_details`
--
ALTER TABLE `customer_details`
  MODIFY `customerId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- AUTO_INCREMENT for table `customer_group`
--
ALTER TABLE `customer_group`
  MODIFY `groupId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `order_address`
--
ALTER TABLE `order_address`
  MODIFY `orderAddressId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `order_item`
--
ALTER TABLE `order_item`
  MODIFY `orderItemId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `order_table`
--
ALTER TABLE `order_table`
  MODIFY `orderId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `payment_method`
--
ALTER TABLE `payment_method`
  MODIFY `paymentMethodId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `product`
--
ALTER TABLE `product`
  MODIFY `productId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=636;

--
-- AUTO_INCREMENT for table `product_category`
--
ALTER TABLE `product_category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `product_group_price`
--
ALTER TABLE `product_group_price`
  MODIFY `entityId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `product_media`
--
ALTER TABLE `product_media`
  MODIFY `mediaId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `shipping_methods`
--
ALTER TABLE `shipping_methods`
  MODIFY `shippingMethodId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `attribute_option`
--
ALTER TABLE `attribute_option`
  ADD CONSTRAINT `attribute_option_ibfk_1` FOREIGN KEY (`attributeId`) REFERENCES `attribute` (`attributeId`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `product_category`
--
ALTER TABLE `product_category`
  ADD CONSTRAINT `product_category_ibfk_1` FOREIGN KEY (`productId`) REFERENCES `product` (`productId`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
