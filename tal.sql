-- phpMyAdmin SQL Dump
-- version 4.2.11
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Apr 13, 2015 at 03:54 PM
-- Server version: 5.6.21
-- PHP Version: 5.6.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `tal`
--

-- --------------------------------------------------------

--
-- Table structure for table `belongsto`
--

CREATE TABLE IF NOT EXISTS `belongsto` (
  `BId` int(30) NOT NULL DEFAULT '0',
  `OrderNum` int(30) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `branches`
--

CREATE TABLE IF NOT EXISTS `branches` (
  `BId` int(30) NOT NULL DEFAULT '0',
  `city` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `contain`
--

CREATE TABLE IF NOT EXISTS `contain` (
  `FId` int(30) NOT NULL DEFAULT '0',
  `OrderNum` int(30) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `creditcards`
--

CREATE TABLE IF NOT EXISTS `creditcards` (
  `CId` int(30) NOT NULL,
  `CreditNum` int(30) NOT NULL DEFAULT '0',
  `ExpDate` varchar(30) DEFAULT NULL,
  `Type` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `customers`
--

CREATE TABLE IF NOT EXISTS `customers` (
  `CId` int(30) NOT NULL DEFAULT '0',
  `CustomerPhone` int(30) DEFAULT NULL,
  `CustomerName` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `foods`
--

CREATE TABLE IF NOT EXISTS `foods` (
  `FId` int(30) NOT NULL DEFAULT '0',
  `Price` int(30) DEFAULT NULL,
  `foodName` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `orderedby`
--

CREATE TABLE IF NOT EXISTS `orderedby` (
  `CId` int(30) DEFAULT NULL,
  `OrderNum` int(30) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE IF NOT EXISTS `orders` (
  `orderNum` int(30) NOT NULL DEFAULT '0',
  `orderTime` varchar(30) DEFAULT NULL,
  `orderDate` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `paidby`
--

CREATE TABLE IF NOT EXISTS `paidby` (
  `OrderNum` int(30) NOT NULL DEFAULT '0',
  `CreditNum` int(30) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `performedby`
--

CREATE TABLE IF NOT EXISTS `performedby` (
  `SId` int(30) NOT NULL DEFAULT '0',
  `OrderNum` int(30) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `salesmen`
--

CREATE TABLE IF NOT EXISTS `salesmen` (
  `SId` int(30) NOT NULL DEFAULT '0',
  `SmName` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `belongsto`
--
ALTER TABLE `belongsto`
 ADD PRIMARY KEY (`BId`,`OrderNum`), ADD KEY `OrderNum` (`OrderNum`);

--
-- Indexes for table `branches`
--
ALTER TABLE `branches`
 ADD PRIMARY KEY (`BId`);

--
-- Indexes for table `contain`
--
ALTER TABLE `contain`
 ADD PRIMARY KEY (`FId`,`OrderNum`), ADD KEY `OrderNum` (`OrderNum`);

--
-- Indexes for table `creditcards`
--
ALTER TABLE `creditcards`
 ADD PRIMARY KEY (`CreditNum`), ADD KEY `CId` (`CId`);

--
-- Indexes for table `customers`
--
ALTER TABLE `customers`
 ADD PRIMARY KEY (`CId`);

--
-- Indexes for table `foods`
--
ALTER TABLE `foods`
 ADD PRIMARY KEY (`FId`);

--
-- Indexes for table `orderedby`
--
ALTER TABLE `orderedby`
 ADD PRIMARY KEY (`OrderNum`), ADD KEY `CId` (`CId`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
 ADD PRIMARY KEY (`orderNum`);

--
-- Indexes for table `paidby`
--
ALTER TABLE `paidby`
 ADD PRIMARY KEY (`OrderNum`,`CreditNum`), ADD KEY `CreditNum` (`CreditNum`);

--
-- Indexes for table `performedby`
--
ALTER TABLE `performedby`
 ADD PRIMARY KEY (`SId`,`OrderNum`), ADD KEY `OrderNum` (`OrderNum`);

--
-- Indexes for table `salesmen`
--
ALTER TABLE `salesmen`
 ADD PRIMARY KEY (`SId`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `belongsto`
--
ALTER TABLE `belongsto`
ADD CONSTRAINT `belongsto_ibfk_1` FOREIGN KEY (`BId`) REFERENCES `branches` (`BId`),
ADD CONSTRAINT `belongsto_ibfk_2` FOREIGN KEY (`OrderNum`) REFERENCES `orderedby` (`OrderNum`);

--
-- Constraints for table `contain`
--
ALTER TABLE `contain`
ADD CONSTRAINT `contain_ibfk_1` FOREIGN KEY (`FId`) REFERENCES `foods` (`FId`),
ADD CONSTRAINT `contain_ibfk_2` FOREIGN KEY (`OrderNum`) REFERENCES `orders` (`orderNum`);

--
-- Constraints for table `creditcards`
--
ALTER TABLE `creditcards`
ADD CONSTRAINT `creditcards_ibfk_1` FOREIGN KEY (`CId`) REFERENCES `customers` (`CId`);

--
-- Constraints for table `orderedby`
--
ALTER TABLE `orderedby`
ADD CONSTRAINT `orderedby_ibfk_1` FOREIGN KEY (`CId`) REFERENCES `customers` (`CId`),
ADD CONSTRAINT `orderedby_ibfk_2` FOREIGN KEY (`OrderNum`) REFERENCES `orders` (`orderNum`);

--
-- Constraints for table `paidby`
--
ALTER TABLE `paidby`
ADD CONSTRAINT `paidby_ibfk_1` FOREIGN KEY (`CreditNum`) REFERENCES `creditcards` (`CreditNum`),
ADD CONSTRAINT `paidby_ibfk_2` FOREIGN KEY (`OrderNum`) REFERENCES `orders` (`orderNum`);

--
-- Constraints for table `performedby`
--
ALTER TABLE `performedby`
ADD CONSTRAINT `performedby_ibfk_1` FOREIGN KEY (`SId`) REFERENCES `salesmen` (`SId`),
ADD CONSTRAINT `performedby_ibfk_2` FOREIGN KEY (`OrderNum`) REFERENCES `orderedby` (`OrderNum`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
