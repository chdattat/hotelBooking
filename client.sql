-- phpMyAdmin SQL Dump
-- version 4.0.4
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Apr 21, 2015 at 05:49 PM
-- Server version: 5.6.12-log
-- PHP Version: 5.4.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `hotel`
--

-- --------------------------------------------------------

--
-- Table structure for table `client`
--

CREATE TABLE IF NOT EXISTS `client` (
  `id` int(10) NOT NULL,
  `name` text NOT NULL,
  `dob` text NOT NULL,
  `uname` text NOT NULL,
  `pswd` text NOT NULL,
  `addrss` text NOT NULL,
  `mob` text NOT NULL,
  `email` text NOT NULL,
  `checkin` text NOT NULL,
  `checkout` text NOT NULL,
  `person_number` text NOT NULL,
  `room` text NOT NULL,
  `amount` text NOT NULL,
  `debit_card_select` text NOT NULL,
  `dcard_number` text NOT NULL,
  `dname_on_card` text NOT NULL,
  `dcvv_number` text NOT NULL,
  `dexpiry_date_month` text NOT NULL,
  `dexpiry_date_year` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `client`
--

INSERT INTO `client` (`id`, `name`, `dob`, `uname`, `pswd`, `addrss`, `mob`, `email`, `checkin`, `checkout`, `person_number`, `room`, `amount`, `debit_card_select`, `dcard_number`, `dname_on_card`, `dcvv_number`, `dexpiry_date_month`, `dexpiry_date_year`) VALUES
(1, 'zaaa', '11/01/1990', 'aomino', 'asdzxc', 'cxzzx', '1234567890', 'sahil_kullar@outlook.com', '11/01/1997', '12/01/1998', '1', '1', '1234', 'debitcard_MAST_1', '123212321', 'qwe', '123', '03', '2027'),
(2, 'sahil', '03/08/1994', 'sahilkullar', '123', 'axc', '1234567890', 'sahil_kullar@outlook.com', '11/01/1997', '12/2/1998', '1', '1', '123', 'debitcard_VISA_1', '123', 'qwas', '123', '10', '2028');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
