-- phpMyAdmin SQL Dump
-- version 4.9.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3308
-- Generation Time: Jan 22, 2022 at 06:03 AM
-- Server version: 8.0.18
-- PHP Version: 7.3.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `hospital1`
--

DELIMITER $$
--
-- Procedures
--
DROP PROCEDURE IF EXISTS `display`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `display` ()  begin
select d.dept,d.doc_nam,p.pat_id,p.pat_name,re.rec_id,re.rec_name 
from doctor d,receptionist re,patient ;
end$$

DROP PROCEDURE IF EXISTS `displayi`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `displayi` ()  begin
select d.dept,d.doc_name,p.pat_id,p.pat_name,re.rec_id,re.rec_name 
from doctor d,receptionist re,patient p;
end$$

DROP PROCEDURE IF EXISTS `displayui`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `displayui` ()  begin
select d.dept,d.doc_nam  
from doctor d ;
SELECT p.pat_id,p.pat_name from patient p;
SELECT re.rec_id,re.rec_name from receptionist re;
end$$

DROP PROCEDURE IF EXISTS `showr`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `showr` ()  begin
SELECT pat_id,pat_name from patient;
SELECT doc_id,doc_name from doctor;
SELECT rec_id,rec_name from receptionist;
end$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

DROP TABLE IF EXISTS `admin`;
CREATE TABLE IF NOT EXISTS `admin` (
  `username` varchar(15) NOT NULL,
  `password` varchar(15) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`username`, `password`) VALUES
('Sajeeb', 'Sajeeb'),
('Shafayat', 'Shafayat'),
('Mansur', 'Mansur'),
('vasu', 'vasu'),
('admin', 'admin'),
('gokul', 'gokul'),
('ram bharath', 'ram');

-- --------------------------------------------------------

--
-- Table structure for table `appointment`
--

DROP TABLE IF EXISTS `appointment`;
CREATE TABLE IF NOT EXISTS `appointment` (
  `dName` varchar(20) NOT NULL,
  `pName` varchar(15) NOT NULL,
  `room` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `appointment`
--

INSERT INTO `appointment` (`dName`, `pName`, `room`) VALUES
('Sajeeb', 'Shafayat Jamil', 987),
('Sifat Islam', 'Joy Bhowmik', 11),
('Sifat Islam', 'Nazmus Sakib', 806),
('Sifat Islam', 'Nazmus Sakib', 806),
('Sifat Islam', 'Fazle Rabby', 806),
('Mansorol Islam', 'Joy Bhowmik', 202),
('Nusrat Jaman', 'Fahad Mondol', 909),
('Sifat Islam', 'jhasbbhcx', 806),
('Shafayat Jamil', 'KIRAN', 44),
('Nafees Khan', 'Jagadeesh', 809),
('Mansorol Islam', 'Sumanth', 12),
('Sifat Islam', 'Joy Bhowmik', 11),
('Sifat Islam', 'Fahad Mondol', 11),
('Sifat Islam', 'Fahad Mondol', 11);

-- --------------------------------------------------------

--
-- Table structure for table `blood`
--

DROP TABLE IF EXISTS `blood`;
CREATE TABLE IF NOT EXISTS `blood` (
  `b_group` varchar(5) NOT NULL,
  `blood_stock` int(11) DEFAULT NULL,
  PRIMARY KEY (`b_group`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `blood`
--

INSERT INTO `blood` (`b_group`, `blood_stock`) VALUES
('O-', 0),
('A+', 15),
('A-', 6),
('B+', 9),
('B-', 4),
('O+', 17),
('AB+', 5),
('AB-', 0);

-- --------------------------------------------------------

--
-- Table structure for table `blood_group`
--

DROP TABLE IF EXISTS `blood_group`;
CREATE TABLE IF NOT EXISTS `blood_group` (
  `b_group` varchar(5) DEFAULT NULL,
  `Bcamp` varchar(30) DEFAULT NULL,
  `Bdonors` varchar(20) DEFAULT NULL,
  `Location` varchar(30) DEFAULT NULL,
  KEY `b_group` (`b_group`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `blood_group`
--

INSERT INTO `blood_group` (`b_group`, `Bcamp`, `Bdonors`, `Location`) VALUES
('1', 'red_cross', 'Raghava', 'vijayawada'),
('2', 'youth_cross', 'Naveen', 'Guntur'),
('3', 'red_cross', ' Manoj', ' Vaddeswaram'),
('4', 'Youth_cross', 'Mani', 'tenali');

--
-- Triggers `blood_group`
--
DROP TRIGGER IF EXISTS `add_blood_stock`;
DELIMITER $$
CREATE TRIGGER `add_blood_stock` AFTER INSERT ON `blood_group` FOR EACH ROW UPDATE blood
        SET blood_stock = blood_stock + 1
        WHERE b_group = new.b_group
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `doctor`
--

DROP TABLE IF EXISTS `doctor`;
CREATE TABLE IF NOT EXISTS `doctor` (
  `count` int(11) NOT NULL AUTO_INCREMENT,
  `date` varchar(10) NOT NULL,
  `doc_id` varchar(10) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `doc_name` varchar(30) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `age` int(5) NOT NULL,
  `gender` varchar(8) NOT NULL,
  `blood` varchar(4) NOT NULL,
  `dept` varchar(20) NOT NULL,
  `phone` varchar(15) NOT NULL,
  `email` varchar(30) NOT NULL,
  `address` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `room` int(11) NOT NULL,
  `username` varchar(20) NOT NULL,
  `password` varchar(30) NOT NULL,
  PRIMARY KEY (`doc_id`),
  UNIQUE KEY `count` (`count`),
  KEY `blood` (`blood`),
  KEY `room` (`room`)
) ENGINE=MyISAM AUTO_INCREMENT=16 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `doctor`
--

INSERT INTO `doctor` (`count`, `date`, `doc_id`, `doc_name`, `age`, `gender`, `blood`, `dept`, `phone`, `email`, `address`, `room`, `username`, `password`) VALUES
(1, '02-04-2018', 'sjb0HMSd1', 'Sifat Islam', 20, 'Male', 'A-', 'Medicine', '+8801757009622', 'sajeeb3g@gmail.com', 'Faridpur', 11, 'Sifat', 'Sifat'),
(2, '31-01-2018', 'sjb0HMSd2', 'Mansorol Islam', 32, 'Male', 'A+', 'Dental', '+8801665546776', 'mansu@gmail.com', 'Gazipur', 12, 'Mansu', 'Mansu'),
(3, '12-12-2016', 'sjb0HMSd3', 'Nafees Khan', 34, 'Male', 'AB-', 'Neurology', '+8801734253425', 'nafees@gmail.com', 'Patuakhali', 16, 'Nafees', 'Nafees'),
(4, '21-0802015', 'sjb0HMSd4', 'Shafayat Jamil', 43, 'Male', 'B+', 'Nutrition', '+8801754323454', 'shafayat@gmail.com', 'Bogra', 11, 'Shafayat', 'Shafayat'),
(5, '09-08-2017', 'sjb0HMSd0', 'Nusrat Jaman', 23, 'Female', 'O-', 'Gynaecology', '+8801765432187', 'nusrat@gmail.com', 'Rajshahi', 14, 'Nusrat', 'Nusrat'),
(6, '06-03-2016', 'sjb0HMSd6', 'Fahad Ali', 37, 'Male', 'B-', 'Cardiology', '+8801754321678', 'fahad@gmail.com', 'Kustia', 12, 'Fahad', 'Fahad'),
(8, '21-12-2013', 'sjb0HMSd8', 'Fazle Rabby', 44, 'Male', 'B-', 'Microbiology', '+8801745321376', 'rabby@gmail.com', 'Brahmanbaria', 14, 'Rabby', 'Rabby'),
(9, '27-09-2009', 'sjb0HMSd9', 'Marina Naznin', 22, 'Female', 'O+', 'Gynaecology', '+8801756789006', 'marina@gmail.com', 'Tangail', 13, 'Marina', 'Marina'),
(12, '12-23-2015', 'sjb0HMSd5', 'Sajeeb Shahriar', 21, 'Male', 'O+', 'Microbiology', '+8801756432156', 'sajeeb@gmail.com', 'Rajshahi', 13, 'Sajeeb', 'Sajeeb'),
(15, '12-01-2022', 'ACH22D011', 'Sumanth Reddy', 56, 'Male', 'B-', 'Gynaecology', '+9198765432', 'sdfghukjhfd', 'bangalore', 11, 'summi', 'summi');

-- --------------------------------------------------------

--
-- Table structure for table `patient`
--

DROP TABLE IF EXISTS `patient`;
CREATE TABLE IF NOT EXISTS `patient` (
  `count` int(11) NOT NULL AUTO_INCREMENT,
  `date` varchar(10) NOT NULL,
  `pat_id` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `pat_name` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `pat_age` int(5) NOT NULL,
  `gender` varchar(10) NOT NULL,
  `address` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `phone` varchar(20) NOT NULL,
  `disease` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `room` int(11) NOT NULL,
  PRIMARY KEY (`pat_id`),
  UNIQUE KEY `count` (`count`)
) ENGINE=MyISAM AUTO_INCREMENT=23 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `patient`
--

INSERT INTO `patient` (`count`, `date`, `pat_id`, `pat_name`, `pat_age`, `gender`, `address`, `phone`, `disease`, `room`) VALUES
(2, '08-03-2018', 'sjb0HMS2', 'Sajeeb Shahriar', 20, 'Male', 'Naldanga, Natore', '+8801757009622', 'Feaver', 21),
(3, '09-06-2018', 'sjb0HMS3', 'Joy Bhowmik', 21, 'Male', 'Vola', '+8801876543237', 'Dengue', 22),
(4, '03-05-2017', 'sjb0HMS4', 'Fahad Mondol', 78, 'Male', 'Kustia', '+8801889765426', 'Jondish', 2),
(5, '09-03-2016', 'sjb0HMS5', 'Fazle Rabby', 24, 'Male', 'Brahmanbariya', '+8801765432124', 'Malaria', 0),
(6, '22-12-2017', 'sjb0HMS6', 'Shafayat Jamil', 27, 'Male', 'Bogra', '+8801722456657', 'Tyfoyed', 23),
(8, '22-12-2017', 'sjb0HMS7', 'ravi', 22, 'Male', 'ygxvhjjisduhb', '098765432', 'Feaver', 21),
(19, '12-01-2002', 'ACH22AD', 'sujith', 23, 'Male', '12-12a,visualstudio,hindupur', '+91145678676', 'DISESASE', 24),
(18, '12-01-2002', 'ACH22P0012', 'Naveen', 12, 'Male', '1-11A,ELECTEONIC CITY,BANGLORE', '+913456789', 'PSYCHO,SEVERE BURNS', 3),
(20, '12-01-2022', 'ACH22P010', 'Jagadeesh', 20, 'Male', '1-23,malleswaram,bangalore', '+914567812516', 'abnormal conditions', 4),
(21, '12-01-2022', 'ACH22P011', 'Sumanth', 22, 'Male', '11-11,d gollapalli,bangalore', '+9198765433222', 'unknown conditions', 23),
(22, '17-01-2022', 'ACH22AD022', 'seeta', 21, 'Female', 'rajajinagar,bangalore', '+919876543345', 'disease,distraction', 21);

-- --------------------------------------------------------

--
-- Table structure for table `receptionist`
--

DROP TABLE IF EXISTS `receptionist`;
CREATE TABLE IF NOT EXISTS `receptionist` (
  `count` int(11) NOT NULL AUTO_INCREMENT,
  `joining` varchar(15) NOT NULL,
  `rec_id` varchar(15) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `rec_name` varchar(30) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `age` int(5) NOT NULL,
  `gender` varchar(10) NOT NULL,
  `blood` varchar(4) NOT NULL,
  `email` varchar(40) NOT NULL,
  `phone` varchar(17) NOT NULL,
  `address` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `username` varchar(20) NOT NULL,
  `password` varchar(30) NOT NULL,
  PRIMARY KEY (`rec_id`),
  UNIQUE KEY `count` (`count`),
  KEY `blood` (`blood`)
) ENGINE=MyISAM AUTO_INCREMENT=19 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `receptionist`
--

INSERT INTO `receptionist` (`count`, `joining`, `rec_id`, `rec_name`, `age`, `gender`, `blood`, `email`, `phone`, `address`, `username`, `password`) VALUES
(13, '12-01-2022', 'ACH22REC002', 'hems', 34, 'Male', 'A-', 'hems@kavin.com', '+91', 'bangalore', 'hems', 'hems'),
(12, '12-01-2022', 'ACH22REC001', 'chris', 32, 'Male', 'B+', 'chris@hems.com', '+911234567890', 'bangalore', 'chris', 'chris'),
(14, '12-01-2022', 'ACH22REC003', 'peter', 40, 'Male', 'AB-', 'peter@kevin.com', '+9173682421', 'bangalore', 'kevin', 'hello');

-- --------------------------------------------------------

--
-- Table structure for table `rooms`
--

DROP TABLE IF EXISTS `rooms`;
CREATE TABLE IF NOT EXISTS `rooms` (
  `room_num` int(11) NOT NULL,
  `type_` varchar(15) NOT NULL,
  `floor` int(11) NOT NULL,
  PRIMARY KEY (`room_num`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `rooms`
--

INSERT INTO `rooms` (`room_num`, `type_`, `floor`) VALUES
(1, 'Admin/Manager', 0),
(11, 'Doctor', 1),
(12, 'Doctor', 1),
(13, 'Doctor', 1),
(14, 'Doctor', 1),
(16, 'Doctor', 1),
(2, 'GENERAL WARD', 0),
(21, 'CASUALITY_1', 2),
(22, 'CASUALITY_2', 2),
(23, 'CASUALITY_3', 2),
(24, 'ICU WARD', 2),
(3, 'ICU WARD', 0),
(4, 'WARD', 0);

-- --------------------------------------------------------

--
-- Table structure for table `test`
--

DROP TABLE IF EXISTS `test`;
CREATE TABLE IF NOT EXISTS `test` (
  `a` varchar(11) NOT NULL,
  `b` varchar(11) NOT NULL,
  `c` varchar(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `test`
--

INSERT INTO `test` (`a`, `b`, `c`) VALUES
('5', '6', '6'),
('1', '2', '4'),
('gfhf', 'fv', 'hf');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
