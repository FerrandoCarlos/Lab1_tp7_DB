-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 18, 2024 at 04:15 PM
-- Server version: 10.4.24-MariaDB
-- PHP Version: 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_tp7final`
--
CREATE DATABASE IF NOT EXISTS db_tp7final CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
-- --------------------------------------------------------
USE db_tp7final;
--
-- Table structure for table `categoria`
--

CREATE TABLE `categoria` (
  `idCategoria` int(11) NOT NULL,
  `cantPersonas` int(11) NOT NULL,
  `cantCamas` int(11) NOT NULL,
  `tipoCamas` int(11) NOT NULL,
  `tipoHabitacion` varchar(11) NOT NULL,
  `precio` double NOT NULL,
  `activo` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `habitacion`
--

CREATE TABLE `habitacion` (
  `idHabitacion` int(11) NOT NULL,
  `idCategoria` int(11) NOT NULL,
  `nmroHabitacion` int(11) NOT NULL,
  `piso` int(11) NOT NULL,
  `refaccion` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `huesped`
--

CREATE TABLE `huesped` (
  `idHuesped` int(11) NOT NULL,
  `nombre` char(25) NOT NULL,
  `apellido` char(25) NOT NULL,
  `dni` int(20) NOT NULL,
  `domicilio` char(30) NOT NULL,
  `correo` char(30) NOT NULL,
  `celular` varchar(30) NOT NULL,
  `activo` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `reserva`
--

CREATE TABLE `reserva` (
  `idReserva` int(11) NOT NULL,
  `idHabitacion` int(11) NOT NULL,
  `idHuesped` int(11) NOT NULL,
  `fechaInicio` date NOT NULL,
  `fechaFin` date NOT NULL,
  `precioTotal` double NOT NULL,
  `cantPersonas` int(11) NOT NULL,
  `activo` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `categoria`
--
ALTER TABLE `categoria`
  ADD PRIMARY KEY (`idCategoria`);

--
-- Indexes for table `habitacion`
--
ALTER TABLE `habitacion`
  ADD PRIMARY KEY (`idHabitacion`),
  ADD KEY `idCategoria` (`idCategoria`);

--
-- Indexes for table `huesped`
--
ALTER TABLE `huesped`
  ADD PRIMARY KEY (`idHuesped`),
  ADD UNIQUE KEY `dni` (`dni`);

--
-- Indexes for table `reserva`
--
ALTER TABLE `reserva`
  ADD PRIMARY KEY (`idReserva`),
  ADD KEY `idHabitacion` (`idHabitacion`),
  ADD KEY `idHuesped` (`idHuesped`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `categoria`
--
ALTER TABLE `categoria`
  MODIFY `idCategoria` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `habitacion`
--
ALTER TABLE `habitacion`
  MODIFY `idHabitacion` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `huesped`
--
ALTER TABLE `huesped`
  MODIFY `idHuesped` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `reserva`
--
ALTER TABLE `reserva`
  MODIFY `idReserva` int(11) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `habitacion`
--
ALTER TABLE `habitacion`
  ADD CONSTRAINT `habitacion_ibfk_1` FOREIGN KEY (`idCategoria`) REFERENCES `categoria` (`idCategoria`);

--
-- Constraints for table `reserva`
--
ALTER TABLE `reserva`
  ADD CONSTRAINT `reserva_ibfk_1` FOREIGN KEY (`idHabitacion`) REFERENCES `habitacion` (`idHabitacion`),
  ADD CONSTRAINT `reserva_ibfk_2` FOREIGN KEY (`idHuesped`) REFERENCES `huesped` (`idHuesped`);
COMMIT;


--#INSERT de los equipos



/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
