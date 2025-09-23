-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost
-- Tiempo de generación: 23-09-2025 a las 02:08:55
-- Versión del servidor: 10.4.32-MariaDB
-- Versión de PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `veterinariaabarza`
--
CREATE DATABASE IF NOT EXISTS `veterinariaabarza` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `veterinariaabarza`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cliente`
--

CREATE TABLE `cliente` (
  `idCliente` int(11) NOT NULL,
  `dni` int(11) DEFAULT NULL,
  `nombre` varchar(30) DEFAULT NULL,
  `apellido` varchar(30) DEFAULT NULL,
  `telefono` bigint(20) DEFAULT NULL,
  `direccion` varchar(50) DEFAULT NULL,
  `contactoAlternativo` bigint(20) DEFAULT NULL,
  `activo` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `cliente`
--

INSERT INTO `cliente` (`idCliente`, `dni`, `nombre`, `apellido`, `telefono`, `direccion`, `contactoAlternativo`, `activo`) VALUES
(1, 12345678, 'María', 'Martínez', 1122334455, 'Calle 1', 1199887766, 1),
(2, 23456789, 'Juan', 'Méndez', 1133445566, 'Calle 2', 1177665544, 1),
(3, 34567890, 'Ana', 'Pérez', 1144556677, 'Calle 3', 1166554433, 1),
(4, 45678901, 'Carlos', 'Gómez', 1155667788, 'Calle 4', 1155443322, 1),
(5, 56789012, 'Lucía', 'Morales', 1166778899, 'Calle 5', 1144332211, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mascota`
--

CREATE TABLE `mascota` (
  `idMascota` int(11) NOT NULL,
  `alias` varchar(30) DEFAULT NULL,
  `sexo` varchar(30) DEFAULT NULL,
  `especie` varchar(30) DEFAULT NULL,
  `raza` varchar(30) DEFAULT NULL,
  `colorPelo` varchar(50) DEFAULT NULL,
  `fechaNac` date DEFAULT NULL,
  `idCliente` int(11) DEFAULT NULL,
  `activo` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `mascota`
--

INSERT INTO `mascota` (`idMascota`, `alias`, `sexo`, `especie`, `raza`, `colorPelo`, `fechaNac`, `idCliente`, `activo`) VALUES
(1, 'Firulais', 'Macho', 'canino', 'Labrador', 'Marrón', '2020-05-10', 1, 1),
(2, 'Mishi', 'Hembra', 'felino', 'Siames', 'Gris', '2019-03-15', 2, 1),
(3, 'Toby', 'Macho', 'canino', 'Bulldog', 'Blanco', '2021-07-20', 3, 1),
(4, 'Luna', 'Hembra', 'canino', 'Caniche', 'Negro', '2022-01-25', 4, 1),
(5, 'Nala', 'Hembra', 'felino', 'Persa', 'Blanco', '2020-11-05', 5, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tratamiento`
--

CREATE TABLE `tratamiento` (
  `idTratamiento` int(11) NOT NULL,
  `descripcion` varchar(70) DEFAULT NULL,
  `medicamento` varchar(50) DEFAULT NULL,
  `importe` double DEFAULT NULL,
  `tipoTratamiento` varchar(30) DEFAULT NULL,
  `activo` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `tratamiento`
--

INSERT INTO `tratamiento` (`idTratamiento`, `descripcion`, `medicamento`, `importe`, `tipoTratamiento`, `activo`) VALUES
(1, 'Vacunación antirrábica', 'Vacuna Rabia', 1500, 'Preventivo', 1),
(2, 'Desparasitación interna', 'Antiparasitario', 1200, 'Preventivo', 1),
(3, 'Curación de herida', 'Antibiótico', 2000, 'Curativo', 1),
(4, 'Control general', 'Vitaminas', 1000, 'Preventivo', 1),
(5, 'Cirugía menor', 'Anestesia', 5000, 'Quirúrgico', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `visita`
--

CREATE TABLE `visita` (
  `idVisita` int(11) NOT NULL,
  `idMascota` int(11) DEFAULT NULL,
  `fechaVisita` date DEFAULT NULL,
  `detalle` varchar(50) DEFAULT NULL,
  `peso` double DEFAULT NULL,
  `idTratamiento` int(11) DEFAULT NULL,
  `activo` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `visita`
--

INSERT INTO `visita` (`idVisita`, `idMascota`, `fechaVisita`, `detalle`, `peso`, `idTratamiento`, `activo`) VALUES
(1, 1, '2024-09-25', 'Control anual', 30.5, 1, 1),
(2, 2, '2024-09-20', 'Vacunación', 4.2, 2, 1),
(3, 3, '2024-09-25', 'Herida en pata', 15, 3, 1),
(4, 4, '2024-08-10', 'Chequeo general', 6.8, 4, 1),
(5, 5, '2024-09-25', 'Operación programada', 3.5, 5, 1);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `cliente`
--
ALTER TABLE `cliente`
  ADD PRIMARY KEY (`idCliente`);

--
-- Indices de la tabla `mascota`
--
ALTER TABLE `mascota`
  ADD PRIMARY KEY (`idMascota`),
  ADD KEY `fk_mascota_cliente` (`idCliente`);

--
-- Indices de la tabla `tratamiento`
--
ALTER TABLE `tratamiento`
  ADD PRIMARY KEY (`idTratamiento`);

--
-- Indices de la tabla `visita`
--
ALTER TABLE `visita`
  ADD PRIMARY KEY (`idVisita`),
  ADD KEY `fk_visita_tratamiento` (`idTratamiento`),
  ADD KEY `fk_visita_mascota` (`idMascota`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `cliente`
--
ALTER TABLE `cliente`
  MODIFY `idCliente` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `mascota`
--
ALTER TABLE `mascota`
  MODIFY `idMascota` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `tratamiento`
--
ALTER TABLE `tratamiento`
  MODIFY `idTratamiento` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `visita`
--
ALTER TABLE `visita`
  MODIFY `idVisita` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `mascota`
--
ALTER TABLE `mascota`
  ADD CONSTRAINT `fk_mascota_cliente` FOREIGN KEY (`idCliente`) REFERENCES `cliente` (`idCliente`);

--
-- Filtros para la tabla `visita`
--
ALTER TABLE `visita`
  ADD CONSTRAINT `fk_visita_mascota` FOREIGN KEY (`idMascota`) REFERENCES `mascota` (`idMascota`),
  ADD CONSTRAINT `fk_visita_tratamiento` FOREIGN KEY (`idTratamiento`) REFERENCES `tratamiento` (`idTratamiento`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
