-- phpMyAdmin SQL Dump
-- version 4.2.11
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Oct 22, 2017 at 07:21 PM
-- Server version: 5.6.21
-- PHP Version: 5.5.19

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `tulisan_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `cms_blog`
--

CREATE TABLE IF NOT EXISTS `cms_blog` (
`idData` int(11) NOT NULL,
  `title` varchar(100) NOT NULL,
  `date` varchar(100) NOT NULL,
  `subtitle` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `photoBy` varchar(100) NOT NULL,
  `pictures` text NOT NULL,
  `createdBy` varchar(100) NOT NULL,
  `createdDate` datetime NOT NULL,
  `changedBy` varchar(100) DEFAULT NULL,
  `changedDate` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `cms_chatter`
--

CREATE TABLE IF NOT EXISTS `cms_chatter` (
`idData` int(11) NOT NULL,
  `title` varchar(100) NOT NULL,
  `description` text NOT NULL,
  `date` varchar(100) NOT NULL,
  `picture` varchar(100) NOT NULL,
  `createdBy` varchar(100) NOT NULL,
  `createdDate` datetime NOT NULL,
  `chagedBy` varchar(100) DEFAULT NULL,
  `changedDate` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `cms_home`
--

CREATE TABLE IF NOT EXISTS `cms_home` (
`idData` int(11) NOT NULL,
  `title` varchar(100) NOT NULL,
  `description` varchar(255) NOT NULL,
  `picture` varchar(100) NOT NULL,
  `createdBy` varchar(100) NOT NULL,
  `createdDate` datetime NOT NULL,
  `chagedBy` varchar(100) DEFAULT NULL,
  `changedDate` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `cms_story`
--

CREATE TABLE IF NOT EXISTS `cms_story` (
`idData` int(11) NOT NULL,
  `title` varchar(100) NOT NULL,
  `subtitle` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `author` varchar(100) NOT NULL,
  `picture` varchar(100) NOT NULL,
  `createdBy` varchar(100) NOT NULL,
  `createdDate` datetime NOT NULL,
  `changedBy` varchar(100) DEFAULT NULL,
  `changedDate` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `cms_video`
--

CREATE TABLE IF NOT EXISTS `cms_video` (
`idData` int(11) NOT NULL,
  `title` varchar(100) NOT NULL,
  `description` text NOT NULL,
  `fileName` varchar(100) NOT NULL,
  `fileSize` varchar(10) NOT NULL,
  `createdBy` varchar(100) NOT NULL,
  `createdDate` datetime NOT NULL,
  `changedBy` varchar(100) DEFAULT NULL,
  `changedDate` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `color`
--

CREATE TABLE IF NOT EXISTS `color` (
`idData` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `createdBy` varchar(100) NOT NULL,
  `createdDate` datetime NOT NULL,
  `changedBy` varchar(100) DEFAULT NULL,
  `changedDate` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `customers`
--

CREATE TABLE IF NOT EXISTS `customers` (
`idData` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `address` text NOT NULL,
  `city` varchar(100) NOT NULL,
  `countryCode` varchar(5) NOT NULL,
  `zipCode` varchar(10) NOT NULL,
  `mobilePhone` varchar(16) NOT NULL,
  `email` varchar(100) NOT NULL,
  `userId` int(11) NOT NULL,
  `createdBy` varchar(100) NOT NULL,
  `createdDate` datetime NOT NULL,
  `changedBy` varchar(100) DEFAULT NULL,
  `changedDate` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `department`
--

CREATE TABLE IF NOT EXISTS `department` (
`idData` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `createdBy` varchar(100) NOT NULL,
  `createdDate` datetime NOT NULL,
  `changedBy` varchar(100) DEFAULT NULL,
  `changedDate` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE IF NOT EXISTS `orders` (
`idData` int(11) NOT NULL,
  `orderId` varchar(20) NOT NULL,
  `customerId` int(11) NOT NULL,
  `productsId` text NOT NULL,
  `quanties` text NOT NULL,
  `total` int(11) NOT NULL,
  `status` varchar(20) NOT NULL,
  `createdBy` varchar(100) NOT NULL,
  `createdDate` datetime NOT NULL,
  `changedBy` varchar(100) DEFAULT NULL,
  `changedDate` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE IF NOT EXISTS `products` (
`idData` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `sku` varchar(10) NOT NULL,
  `description` text NOT NULL,
  `material` text NOT NULL,
  `dimension` varchar(100) NOT NULL,
  `qty` int(11) NOT NULL,
  `price` varchar(15) NOT NULL,
  `storyId` int(11) NOT NULL,
  `colorId` int(11) NOT NULL,
  `picture` varchar(100) NOT NULL,
  `pattern` text NOT NULL,
  `createdBy` varchar(100) NOT NULL,
  `createdDate` datetime NOT NULL,
  `changedBy` int(11) DEFAULT NULL,
  `changedDate` datetime DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`idData`, `name`, `sku`, `description`, `material`, `dimension`, `qty`, `price`, `storyId`, `colorId`, `picture`, `pattern`, `createdBy`, `createdDate`, `changedBy`, `changedDate`) VALUES
(1, 'test product update', '1123', 'Testing direct insert on database', 'NULL', 'NULL', 100, '300000', 0, 0, '', '', '', '0000-00-00 00:00:00', 0, '2017-10-22 23:36:09'),
(8, 'COBA BLANK IMAGE', 'COBAIMAGE', 'TEST', 'NULL', 'NULL', 0, '0', 0, 0, 'products_8.jpg', '', 'SESSION_TEST', '0000-00-00 00:00:00', 0, '2017-10-22 23:49:26'),
(9, 'test on web form', '11111', 'NULL', 'NULL', 'NULL', 0, '0', 0, 0, '', '', 'SESSION_TEST', '2017-10-22 22:14:47', NULL, NULL),
(10, 'test on web form 2', '222', 'NULL', 'NULL', 'NULL', 0, '0', 0, 0, '', '', 'SESSION_TEST', '2017-10-22 22:16:02', NULL, NULL),
(11, 'test image', '2322', 'NULL', 'NULL', 'NULL', 0, '0', 0, 0, 'products_11.jpg', '', 'SESSION_TEST', '2017-10-22 22:18:46', 0, '2017-10-23 00:09:29'),
(12, 'test image 22', '11112', 'NULL', 'NULL', 'NULL', 0, '0', 0, 0, '', '', 'SESSION_TEST', '2017-10-22 22:20:12', NULL, NULL),
(13, 'test image 22', '11112', 'NULL', 'NULL', 'NULL', 0, '0', 0, 0, '', '', 'SESSION_TEST', '2017-10-22 22:21:51', NULL, NULL),
(14, 'test image 22', '11112', 'NULL', 'NULL', 'NULL', 0, '0', 0, 0, '', '', 'SESSION_TEST', '2017-10-22 22:22:32', NULL, NULL),
(15, 'test', '444', 'NULL', 'NULL', 'NULL', 0, '0', 0, 0, 'products_15.jpg', '', 'SESSION_TEST', '2017-10-22 22:23:28', 0, '2017-10-22 23:59:35'),
(16, 'test', '444', 'NULL', 'NULL', 'NULL', 0, '0', 0, 0, 'products_16.jpg', '', 'SESSION_TEST', '2017-10-22 22:25:21', 0, '2017-10-22 23:58:36'),
(17, 'Test again for image', '23234', 'asdasdasdasd', 'sdfsdf', 'eqewqwe', 22, '2147483647', 0, 0, 'products_17.jpg', '', 'SESSION_TEST', '2017-10-22 22:27:03', NULL, NULL),
(18, 'qweqwe', 'COBALAGI', 'te', 'NULL', 'NULL', 0, '1000000', 0, 0, 'products_18.jpg', '', 'SESSION_TEST', '2017-10-22 22:28:07', 0, '2017-10-22 23:50:01'),
(19, 'asdasd', '234234', 'asd', 'NULL', 'NULL', 0, '0', 0, 0, '', '', 'SESSION_TEST', '2017-10-22 22:41:38', NULL, NULL),
(20, 'asdasd', 'TESTEDIT', 'asd', 'NULL', 'NULL', 0, '450000', 0, 0, 'products_20.jpg', '', 'SESSION_TEST', '2017-10-22 22:41:50', 0, '2017-10-22 23:42:34');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE IF NOT EXISTS `users` (
`idData` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `username` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `type` varchar(100) NOT NULL,
  `departmentId` int(11) NOT NULL,
  `createdBy` varchar(100) NOT NULL,
  `createdDate` datetime NOT NULL,
  `changedBy` varchar(100) DEFAULT NULL,
  `changedDate` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `vendors`
--

CREATE TABLE IF NOT EXISTS `vendors` (
`idData` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `address` text NOT NULL,
  `city` varchar(100) NOT NULL,
  `countryCode` varchar(5) NOT NULL,
  `zipCode` varchar(10) NOT NULL,
  `mobilePhone` varchar(16) NOT NULL,
  `email` varchar(100) NOT NULL,
  `createdBy` varchar(100) NOT NULL,
  `createdDate` datetime NOT NULL,
  `changedBy` varchar(100) DEFAULT NULL,
  `changedDate` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cms_blog`
--
ALTER TABLE `cms_blog`
 ADD PRIMARY KEY (`idData`);

--
-- Indexes for table `cms_chatter`
--
ALTER TABLE `cms_chatter`
 ADD PRIMARY KEY (`idData`);

--
-- Indexes for table `cms_home`
--
ALTER TABLE `cms_home`
 ADD PRIMARY KEY (`idData`);

--
-- Indexes for table `cms_story`
--
ALTER TABLE `cms_story`
 ADD PRIMARY KEY (`idData`);

--
-- Indexes for table `cms_video`
--
ALTER TABLE `cms_video`
 ADD PRIMARY KEY (`idData`);

--
-- Indexes for table `color`
--
ALTER TABLE `color`
 ADD PRIMARY KEY (`idData`);

--
-- Indexes for table `customers`
--
ALTER TABLE `customers`
 ADD PRIMARY KEY (`idData`);

--
-- Indexes for table `department`
--
ALTER TABLE `department`
 ADD PRIMARY KEY (`idData`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
 ADD PRIMARY KEY (`idData`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
 ADD PRIMARY KEY (`idData`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
 ADD PRIMARY KEY (`idData`);

--
-- Indexes for table `vendors`
--
ALTER TABLE `vendors`
 ADD PRIMARY KEY (`idData`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `cms_blog`
--
ALTER TABLE `cms_blog`
MODIFY `idData` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `cms_chatter`
--
ALTER TABLE `cms_chatter`
MODIFY `idData` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `cms_home`
--
ALTER TABLE `cms_home`
MODIFY `idData` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `cms_story`
--
ALTER TABLE `cms_story`
MODIFY `idData` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `cms_video`
--
ALTER TABLE `cms_video`
MODIFY `idData` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `color`
--
ALTER TABLE `color`
MODIFY `idData` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `customers`
--
ALTER TABLE `customers`
MODIFY `idData` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `department`
--
ALTER TABLE `department`
MODIFY `idData` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
MODIFY `idData` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
MODIFY `idData` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=21;
--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
MODIFY `idData` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `vendors`
--
ALTER TABLE `vendors`
MODIFY `idData` int(11) NOT NULL AUTO_INCREMENT;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
