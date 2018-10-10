-- phpMyAdmin SQL Dump
-- version 4.6.5.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 24, 2017 at 05:49 AM
-- Server version: 10.1.21-MariaDB
-- PHP Version: 5.6.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `arms`
--

DELIMITER $$
--
-- Procedures
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `fare_compute` ()  MODIFIES SQL DATA
UPDATE fare SET fare = 0 + (SELECT distance*a_code FROM airplane,flight WHERE airplane.flight_no = flight.flight_no AND fare.flight_id = flight.flight_id)$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `airline`
--

CREATE TABLE `airline` (
  `a_code` int(2) NOT NULL,
  `a_name` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `airline`
--

INSERT INTO `airline` (`a_code`, `a_name`) VALUES
(1, 'Air India'),
(2, 'Jet Airways'),
(3, 'IndiGo'),
(4, 'SpiceJet'),
(5, 'Vistara');

-- --------------------------------------------------------

--
-- Table structure for table `airplane`
--

CREATE TABLE `airplane` (
  `flight_no` int(3) NOT NULL,
  `seats` int(3) NOT NULL,
  `city1` varchar(3) NOT NULL,
  `city2` varchar(3) NOT NULL,
  `distance` int(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `airplane`
--

INSERT INTO `airplane` (`flight_no`, `seats`, `city1`, `city2`, `distance`) VALUES
(101, 100, 'del', 'bom', 1385),
(102, 150, 'del', 'blr', 2137),
(103, 100, 'del', 'ccu', 1477),
(104, 150, 'bom', 'ccu', 1965),
(105, 100, 'blr', 'ccu', 1845),
(106, 150, 'bom', 'blr', 1008),
(107, 100, 'del', 'maa', 2214),
(108, 150, 'bom', 'maa', 1334),
(109, 120, 'bom', 'maa', 1696),
(110, 100, 'blr', 'maa', 346);

-- --------------------------------------------------------

--
-- Table structure for table `airport`
--

CREATE TABLE `airport` (
  `code` varchar(3) NOT NULL,
  `name` varchar(50) NOT NULL,
  `city` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `airport`
--

INSERT INTO `airport` (`code`, `name`, `city`) VALUES
('blr', 'Kempegowda International Airport', 'Bangalore'),
('bom', ' 	Chhatrapati Shivaji International Airport', 'Mumbai'),
('ccu', 'Netaji Subhas Chandra Bose International Airport', 'Kolkata'),
('del', 'Indira Gandhi International Airport', 'Delhi'),
('maa', 'Chennai International Airport', 'Chennai');

-- --------------------------------------------------------

--
-- Table structure for table `booking`
--

CREATE TABLE `booking` (
  `booking_id` int(4) NOT NULL,
  `flight_id` int(4) NOT NULL,
  `pid` int(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `booking`
--

INSERT INTO `booking` (`booking_id`, `flight_id`, `pid`) VALUES
(1, 2003, 1000);

-- --------------------------------------------------------

--
-- Table structure for table `fare`
--

CREATE TABLE `fare` (
  `flight_id` int(4) NOT NULL,
  `fare` int(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `fare`
--

INSERT INTO `fare` (`flight_id`, `fare`) VALUES
(2001, 1385),
(2002, 2770),
(2003, 6411),
(2004, 8548);

-- --------------------------------------------------------

--
-- Table structure for table `flight`
--

CREATE TABLE `flight` (
  `flight_id` int(4) NOT NULL,
  `flight_no` int(3) NOT NULL,
  `class` varchar(10) NOT NULL,
  `source` varchar(3) NOT NULL,
  `dest` varchar(3) NOT NULL,
  `dep_date` date NOT NULL,
  `dep_time` time NOT NULL,
  `arr_date` date NOT NULL,
  `arr_time` time NOT NULL,
  `a_code` int(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `flight`
--

INSERT INTO `flight` (`flight_id`, `flight_no`, `class`, `source`, `dest`, `dep_date`, `dep_time`, `arr_date`, `arr_time`, `a_code`) VALUES
(2002, 101, 'Economy', 'bom', 'del', '2017-11-12', '09:00:00', '2017-11-12', '11:00:00', 2),
(2001, 101, 'Economy', 'del', 'bom', '2017-11-12', '06:00:00', '2017-11-12', '08:00:00', 1),
(2004, 102, 'Economy', 'blr', 'del', '2017-11-13', '12:30:00', '2017-11-13', '02:30:00', 4),
(2003, 102, 'Economy', 'del', 'blr', '2017-11-13', '10:00:00', '2017-11-13', '12:00:00', 3);

-- --------------------------------------------------------

--
-- Table structure for table `login`
--

CREATE TABLE `login` (
  `pid` int(4) NOT NULL,
  `username` varchar(25) NOT NULL,
  `password` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `login`
--

INSERT INTO `login` (`pid`, `username`, `password`) VALUES
(1000, 'varun', 'asdf'),
(1001, 'harsh', 'zxcv');

-- --------------------------------------------------------

--
-- Table structure for table `passenger`
--

CREATE TABLE `passenger` (
  `pid` int(4) NOT NULL,
  `sex` char(1) NOT NULL,
  `age` int(2) NOT NULL,
  `name` varchar(20) NOT NULL,
  `address` varchar(25) NOT NULL,
  `phone` bigint(10) NOT NULL,
  `email` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `passenger`
--

INSERT INTO `passenger` (`pid`, `sex`, `age`, `name`, `address`, `phone`, `email`) VALUES
(1000, 'm', 20, 'Varun', 'Bangalore', 9998887774, 'varunkaranth97@gmail.com'),
(1001, 'm', 21, 'Harsh', 'Kanpur', 8886667774, 'harshkoomar@gmail.com');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `airline`
--
ALTER TABLE `airline`
  ADD PRIMARY KEY (`a_code`);

--
-- Indexes for table `airplane`
--
ALTER TABLE `airplane`
  ADD PRIMARY KEY (`flight_no`);

--
-- Indexes for table `airport`
--
ALTER TABLE `airport`
  ADD PRIMARY KEY (`code`);

--
-- Indexes for table `booking`
--
ALTER TABLE `booking`
  ADD PRIMARY KEY (`booking_id`);

--
-- Indexes for table `fare`
--
ALTER TABLE `fare`
  ADD PRIMARY KEY (`flight_id`);

--
-- Indexes for table `flight`
--
ALTER TABLE `flight`
  ADD KEY `flight_no` (`flight_no`);

--
-- Indexes for table `login`
--
ALTER TABLE `login`
  ADD PRIMARY KEY (`pid`),
  ADD KEY `pid` (`pid`);

--
-- Indexes for table `passenger`
--
ALTER TABLE `passenger`
  ADD PRIMARY KEY (`pid`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `booking`
--
ALTER TABLE `booking`
  MODIFY `booking_id` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
