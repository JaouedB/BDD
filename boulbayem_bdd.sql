-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: mysql-boulbayem.alwaysdata.net
-- Generation Time: Nov 12, 2024 at 08:24 AM
-- Server version: 10.11.8-MariaDB
-- PHP Version: 7.4.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `boulbayem_bdd`
--

-- --------------------------------------------------------

--
-- Table structure for table `AVION`
--

CREATE TABLE `AVION` (
  `NumAvion` int(11) NOT NULL,
  `NomAvion` varchar(45) DEFAULT NULL,
  `Capacite` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `AVION`
--

INSERT INTO `AVION` (`NumAvion`, `NomAvion`, `Capacite`) VALUES
(1, 'A340-', 295),
(2, 'ATR72', 70),
(3, 'B747-400', 420),
(4, 'A319', 120),
(5, 'ATR42/72', 50),
(6, 'B747-400', 420);

-- --------------------------------------------------------

--
-- Table structure for table `PILOTE`
--

CREATE TABLE `PILOTE` (
  `NumPilote` int(11) NOT NULL,
  `NomPilote` varchar(45) DEFAULT NULL,
  `Adresse` varchar(45) DEFAULT NULL,
  `Salaire` float DEFAULT NULL,
  `Bonus` float DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `PILOTE`
--

INSERT INTO `PILOTE` (`NumPilote`, `NomPilote`, `Adresse`, `Salaire`, `Bonus`) VALUES
(1, 'TOTO', '97438 Sainte Marie', 1000, 1100),
(2, 'PAYET', '97487 Saint Denis', 3000, 800),
(3, 'HOAREAU', '97420 Le Port', 3300, 950),
(4, 'DUPUIS', '75130 PARIS', 3200, 900),
(5, 'DUPOND', '75100 Paris', 3500, 1000),
(6, 'PETIT', '34000 Montpellier', 2000, 500),
(7, 'VITRI', '34000 Montpellier', 2500, 0);

-- --------------------------------------------------------

--
-- Table structure for table `VOL`
--

CREATE TABLE `VOL` (
  `NumVol` varchar(45) NOT NULL,
  `VilleDepart` varchar(45) DEFAULT NULL,
  `VilleArrivee` varchar(45) DEFAULT NULL,
  `HeureDepart` time DEFAULT NULL,
  `HeureArrivee` time DEFAULT NULL,
  `PILOTE_NumPilote` int(11) NOT NULL,
  `AVION_NumAvion` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `VOL`
--

INSERT INTO `VOL` (`NumVol`, `VilleDepart`, `VilleArrivee`, `HeureDepart`, `HeureArrivee`, `PILOTE_NumPilote`, `AVION_NumAvion`) VALUES
('AF 380', 'PARIS-ORLY', 'GILOT', '21:00:00', '10:45:00', 1, 3),
('AF 7684', 'Paris CDG', 'MONTPELLIER', '20:45:00', '22:10:00', 6, 4),
('MK 203', 'GILOT', 'MAURICE', '07:30:00', '08:45:00', 4, 5),
('MK 40', 'MAURICE', 'Paris CDG', '09:40:00', '19:05:00', 2, 6),
('MK 45', 'Paris CDG', 'GILOT', '11:40:00', '12:25:00', 7, 1),
('MK230', 'GILOT', 'MAURICE', '11:40:00', '12:25:00', 3, 2);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `AVION`
--
ALTER TABLE `AVION`
  ADD PRIMARY KEY (`NumAvion`);

--
-- Indexes for table `PILOTE`
--
ALTER TABLE `PILOTE`
  ADD PRIMARY KEY (`NumPilote`);

--
-- Indexes for table `VOL`
--
ALTER TABLE `VOL`
  ADD PRIMARY KEY (`NumVol`),
  ADD KEY `fk_VOL_PILOTE_idx` (`PILOTE_NumPilote`),
  ADD KEY `fk_VOL_AVION1_idx` (`AVION_NumAvion`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `VOL`
--
ALTER TABLE `VOL`
  ADD CONSTRAINT `fk_VOL_AVION1` FOREIGN KEY (`AVION_NumAvion`) REFERENCES `AVION` (`NumAvion`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_VOL_PILOTE` FOREIGN KEY (`PILOTE_NumPilote`) REFERENCES `PILOTE` (`NumPilote`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
