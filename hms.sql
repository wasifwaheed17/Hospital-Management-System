-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 28, 2024 at 12:13 AM
-- Server version: 10.4.25-MariaDB
-- PHP Version: 8.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `hms`
--

-- --------------------------------------------------------

--
-- Table structure for table `bookingpatient`
--

CREATE TABLE `bookingpatient` (
  `id` int(11) NOT NULL,
  `srfid` varchar(50) NOT NULL,
  `bedtype` varchar(50) NOT NULL,
  `hcode` varchar(50) NOT NULL,
  `spo2` int(11) NOT NULL,
  `pname` varchar(50) NOT NULL,
  `pphone` varchar(12) NOT NULL,
  `paddress` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `bookingpatient`
--

INSERT INTO `bookingpatient` (`id`, `srfid`, `bedtype`, `hcode`, `spo2`, `pname`, `pphone`, `paddress`) VALUES
(3, 'KA20210011', 'ICUBed', 'MAT123', 85, 'ARK', '9986786453', 'BANGALORE'),
(4, 'KA20210022', 'ICUBed', 'BBH01', 92, 'kartik', '8088131784', 'banaglore '),
(5, '32154', 'NormalBed', 'MAT123', 50, 'l', '03212321223', 'jgfgdv ghjm ghujftgyhjn tfyguhvcgvhj'),
(6, '895', 'NormalBed', 'MAT123', 50, 'umar', '0322030300', 'gfhbjh jhnkkj jkm, '),
(11, '1236', 'NormalBed', 'MAT123', 9, 'john', '012123122131', 'Tada'),
(15, '321', 'HICUBed', '123', 220, 'jjh', '0333', 'l');

-- --------------------------------------------------------

--
-- Table structure for table `hospitaldata`
--

CREATE TABLE `hospitaldata` (
  `id` int(11) NOT NULL,
  `hcode` varchar(200) NOT NULL,
  `hname` varchar(200) NOT NULL,
  `normalbed` int(11) NOT NULL,
  `hicubed` int(11) NOT NULL,
  `icubed` int(11) NOT NULL,
  `vbed` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `hospitaldata`
--

INSERT INTO `hospitaldata` (`id`, `hcode`, `hname`, `normalbed`, `hicubed`, `icubed`, `vbed`) VALUES
(3, 'MAT123', 'Matha Hospital', 37, 4, 4, 1),
(4, '123', 'Aga Khan', 4, 1, 8, 5),
(5, '789', 'Jinnah Hospital', 50, 10, 20, 15);

--
-- Triggers `hospitaldata`
--
DELIMITER $$
CREATE TRIGGER `Insert` AFTER INSERT ON `hospitaldata` FOR EACH ROW INSERT INTO trig VALUES(null,NEW.hcode,NEW.normalbed,NEW.hicubed,NEW.icubed,NEW.vbed,' INSERTED',NOW())
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `Update` AFTER UPDATE ON `hospitaldata` FOR EACH ROW INSERT INTO trig VALUES(null,NEW.hcode,NEW.normalbed,NEW.hicubed,NEW.icubed,NEW.vbed,' UPDATED',NOW())
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `delet` BEFORE DELETE ON `hospitaldata` FOR EACH ROW INSERT INTO trig VALUES(null,OLD.hcode,OLD.normalbed,OLD.hicubed,OLD.icubed,OLD.vbed,' DELETED',NOW())
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `hospitaluser`
--

CREATE TABLE `hospitaluser` (
  `id` int(11) NOT NULL,
  `hcode` varchar(20) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(1000) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `hospitaluser`
--

INSERT INTO `hospitaluser` (`id`, `hcode`, `email`, `password`) VALUES
(7, 'BBH01', 'aneesrehman95567@gmail.com', 'pbkdf2:sha256:260000$im6PllE9qrd0asQY$3e62fcb9697d2b048acd83cb3658bac8ae5edb5ff58086699d134fb0ed41d788'),
(9, 'MAT123', 'arkprocoder@gmail.com', 'pbkdf2:sha256:260000$CPDXGkSY1zXsarEA$fdbec84d1b2c32e521c75f51bb917daaa4f7a53e567e4478d23ba944c53b1177'),
(10, '123', 'w@gmail.com', 'scrypt:32768:8:1$9FrdJ1aJ4iVnweGi$69099555663c42fbe7df37482ba7416ab6557af5735700e5443965869ef68bb9e40729e2e7afcbc24add6083b3cdc9bb6ecf30aa18242b8c2efa84364dc7f148'),
(11, '123', 'wasifwaheed@gmail.com', 'scrypt:32768:8:1$Z1aUPXcnOr8yjwVY$42271c111c9651bd392f240ee24436e93d143d2e3269a832652dc2b017a27350251f141a3b71096cfcc61f6960aba58742b49ab4bc9312e1f245044fefd5e124'),
(12, '789', 'hasan@gmail.com', 'scrypt:32768:8:1$nysNIFkviJ4sVclj$a6612245a925674d3f9edbcbfda5352377de359baa41e3a9a6c3ae4dfef15b0b8616e0ddfdcdcba9e361f37fa46fdb29d242fb318e185873cea1a258a6697764');

-- --------------------------------------------------------

--
-- Table structure for table `test`
--

CREATE TABLE `test` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `test`
--

INSERT INTO `test` (`id`, `name`) VALUES
(1, 'anees'),
(2, 'rehman');

-- --------------------------------------------------------

--
-- Table structure for table `trig`
--

CREATE TABLE `trig` (
  `id` int(11) NOT NULL,
  `hcode` varchar(50) NOT NULL,
  `normalbed` int(11) NOT NULL,
  `hicubed` int(11) NOT NULL,
  `icubed` int(11) NOT NULL,
  `vbed` int(11) NOT NULL,
  `querys` varchar(50) NOT NULL,
  `date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `trig`
--

INSERT INTO `trig` (`id`, `hcode`, `normalbed`, `hicubed`, `icubed`, `vbed`, `querys`, `date`) VALUES
(1, 'BBH01', 50, 9, 2, 1, ' UPDATED', '2021-11-26'),
(2, 'BBH01', 50, 9, 2, 1, ' DELETED', '2021-11-26'),
(3, 'MAT123', 39, 4, 4, 1, ' UPDATED', '2024-01-08'),
(4, 'MAT123', 38, 4, 4, 1, ' UPDATED', '2024-01-10'),
(5, 'MAT123', 37, 4, 4, 1, ' UPDATED', '2024-01-21'),
(6, 'MAT123', 38, 4, 4, 1, ' UPDATED', '2024-01-21'),
(7, 'MAT123', 37, 4, 4, 1, ' UPDATED', '2024-01-21'),
(8, 'MAT123', 38, 4, 4, 1, ' UPDATED', '2024-01-21'),
(9, 'MAT123', 38, 4, 3, 1, ' UPDATED', '2024-01-21'),
(10, 'MAT123', 38, 4, 4, 1, ' UPDATED', '2024-01-21'),
(11, 'MAT123', 37, 4, 4, 1, ' UPDATED', '2024-01-21'),
(12, 'MAT123', 38, 4, 4, 1, ' UPDATED', '2024-01-21'),
(13, 'MAT123', 37, 4, 4, 1, ' UPDATED', '2024-01-21'),
(14, 'MAT123', 36, 4, 4, 1, ' UPDATED', '2024-01-26'),
(15, 'MAT123', 37, 4, 4, 1, ' UPDATED', '2024-01-26'),
(16, 'MAT123', 36, 4, 4, 1, ' UPDATED', '2024-01-26'),
(17, '123', 4, 2, 8, 5, ' INSERTED', '2024-01-26'),
(18, 'MAT123', 36, 3, 4, 1, ' UPDATED', '2024-01-26'),
(19, 'MAT123', 36, 4, 4, 1, ' UPDATED', '2024-01-26'),
(20, '123', 4, 1, 8, 5, ' UPDATED', '2024-01-26'),
(21, '789', 50, 10, 20, 15, ' INSERTED', '2024-01-26'),
(22, 'MAT123', 37, 4, 4, 1, ' UPDATED', '2024-01-26'),
(23, '789', 49, 10, 20, 15, ' UPDATED', '2024-01-26'),
(24, '789', 50, 10, 20, 15, ' UPDATED', '2024-01-26'),
(25, '789', 50, 9, 20, 15, ' UPDATED', '2024-01-26'),
(26, '789', 50, 10, 20, 15, ' UPDATED', '2024-01-26'),
(27, '789', 50, 10, 19, 15, ' UPDATED', '2024-01-26'),
(28, '789', 50, 10, 20, 15, ' UPDATED', '2024-01-26'),
(29, '789', 50, 9, 20, 15, ' UPDATED', '2024-01-26'),
(30, '789', 50, 10, 20, 15, ' UPDATED', '2024-01-26'),
(31, '789', 50, 10, 19, 15, ' UPDATED', '2024-01-26'),
(32, '789', 50, 10, 20, 15, ' UPDATED', '2024-01-26');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `srfid` varchar(20) NOT NULL,
  `email` varchar(100) NOT NULL,
  `dob` varchar(1000) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `srfid`, `email`, `dob`) VALUES
(14, '256', 'l@g.com', 'scrypt:32768:8:1$X3j3tCv9sfXzqkyP$00d928500569040a4a99976af511dd9c335ff4b171b2fb6d93ab3c749378e3ef15d1e8a4ca8474b4b6abb51d77f549bda22d3c79d7ee4050a7680400441d74ca'),
(15, '12345', 'a@gmail.com', 'scrypt:32768:8:1$KxYJUMaXm9rNpmhu$71eee1fbb9f49b9dcddf756130e657074b912380dc939dd2f4f7de23f4ebea2648b4682ec9b69a8089a09a7ebd28da1422e80936dfe7eb5994e6e4ec3ae681db'),
(16, '32154', 'U@gmail.com', 'scrypt:32768:8:1$Sbi0jAoP7t3SM4jV$1a055d1caa5021f39a8a672748eaaec471bdb2fe6647bb3935a9160743b65bb83fb35f7303f5f26d434f7de5f288892a1d78b2ef736694b5aaeabea42b54a4a2'),
(17, '654', 'k@gmail.com', 'scrypt:32768:8:1$SyhDC7mt3413QTQj$be3bd413ff1534276b45e0f252adbc46775a48f9de9be813c097f3d096983417c7c71979ee7c588e5dfe8c7f7a77db4ae1449cc1d8a27e2c96f4ef717d82d136'),
(18, '456', 's@gmail.com', 'scrypt:32768:8:1$ajUCqTBvxjLxwlnZ$93d0f9bf26e98c98cc16cddb54c53d83b52b27470fdffab9f3adf16df4c0d2a657d1fb3e0cc0557edd9e0409dabdca33c5a2024c95399c8ee81f9c1b83c78cd0'),
(19, '895', 'g@gmail.com', 'scrypt:32768:8:1$CqYg4lK1SI5qhi9q$f4601db76c27dd7059706e89de809153bba3b9f81cb530e654ec187f5c91417b9db6bf9382deca23d8076afd93927ca3693442f8d90b06083d6bdc0de9147ac5'),
(20, '1236', 'w@gmail.com', 'scrypt:32768:8:1$z9mNcJq1K0XaRAf5$121610760fc6e3da1f5df7f8f2008a05edf8599a8096bff56d1108578edc6528ab7906ab2c74698844734da706d45163903a2cd7f404a345bb086489dfde207f'),
(21, '123456', 'wa@gmail.com', 'scrypt:32768:8:1$FsstpBZ8C8IJ5PYG$bc8876a93096ffa5aab22a6cd7a137a17b5dbf6554a180a7ed4e418a2e3f6ebb032de948739ba931cbea6db30650d27ad58d756a8097a745a04deaeb1c0e1516'),
(22, '321', 'h@gmail.com', 'scrypt:32768:8:1$K13ePldVBWX0FIEQ$1130768181e416d442e5d025086d27a51f79744d44e7a7678647469926002b77c96b6eca1ad494deee489b63cfa7c3f8aab3c56582be7c7bb2416983c474ecec');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `bookingpatient`
--
ALTER TABLE `bookingpatient`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `srfid` (`srfid`(20));

--
-- Indexes for table `hospitaldata`
--
ALTER TABLE `hospitaldata`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `hcode` (`hcode`);

--
-- Indexes for table `hospitaluser`
--
ALTER TABLE `hospitaluser`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `test`
--
ALTER TABLE `test`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `trig`
--
ALTER TABLE `trig`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `srfid` (`srfid`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `bookingpatient`
--
ALTER TABLE `bookingpatient`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `hospitaldata`
--
ALTER TABLE `hospitaldata`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `hospitaluser`
--
ALTER TABLE `hospitaluser`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `test`
--
ALTER TABLE `test`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `trig`
--
ALTER TABLE `trig`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
