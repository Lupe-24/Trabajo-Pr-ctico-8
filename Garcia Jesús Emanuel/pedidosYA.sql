-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost
-- Tiempo de generación: 23-09-2025 a las 02:08:34
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
-- Base de datos: `pedidosYA`
--
CREATE DATABASE IF NOT EXISTS `pedidosYA` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `pedidosYA`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cliente`
--

CREATE TABLE `cliente` (
  `idCliente` int(11) NOT NULL,
  `nombre` varchar(30) NOT NULL,
  `direccion` varchar(50) NOT NULL,
  `correo` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `cliente`
--

INSERT INTO `cliente` (`idCliente`, `nombre`, `direccion`, `correo`) VALUES
(1, 'Enzo Fet', 'Av. Illia 105', 'enzofet@gmail.com'),
(2, 'Naiara Bongiovanni', 'V. Dupuy 1013', 'n.bongiovanni@gmail.com'),
(3, 'Claudia Bonisoni', 'Av. Mitre 733', 'clauboni@gmail.com'),
(4, 'Jose Bossa', 'La Punta s/n', 'josecmyk@gmail.com'),
(5, 'Gonza Achucarro', 'Jujuy 520', 'gonza8bit@gmail.com'),
(6, 'Jesus Emanuel Garcia', 'Suipacha 1618', 'dupre.dev@gmail.com');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detallesPedidos`
--

CREATE TABLE `detallesPedidos` (
  `idPedido` int(11) NOT NULL,
  `idProducto` int(11) NOT NULL,
  `cantidad` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `detallesPedidos`
--

INSERT INTO `detallesPedidos` (`idPedido`, `idProducto`, `cantidad`) VALUES
(1, 2033, 2),
(2, 2057, 1),
(2, 2901, 6),
(3, 2033, 1),
(3, 2901, 12),
(3, 3024, 2),
(4, 2033, 4),
(4, 2057, 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pedidos`
--

CREATE TABLE `pedidos` (
  `idPedido` int(11) NOT NULL,
  `fechaPedido` date NOT NULL,
  `idCliente` int(11) NOT NULL,
  `estado` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `pedidos`
--

INSERT INTO `pedidos` (`idPedido`, `fechaPedido`, `idCliente`, `estado`) VALUES
(1, '2025-08-22', 1, 1),
(2, '2025-08-23', 2, 0),
(3, '2025-08-24', 3, 1),
(4, '2025-08-25', 4, 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `producto`
--

CREATE TABLE `producto` (
  `idProducto` int(11) NOT NULL,
  `nombre` varchar(30) NOT NULL,
  `descripcion` varchar(70) NOT NULL,
  `precio` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `producto`
--

INSERT INTO `producto` (`idProducto`, `nombre`, `descripcion`, `precio`) VALUES
(2033, 'Hamburguesa', 'Hamburguesa Paty 500gr', 1000),
(2057, 'Pizza Muzza', 'Pizza con Queso Muzzarella', 5000),
(2901, 'Empanada Carne', 'Empanada relleno carne cortada a cuchillo', 1500),
(3024, 'Sandwich de Milanesa', 'Sandwich con milanesa de ternera', 4300),
(5102, 'Queso', 'Queso Provolone', 7000);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `cliente`
--
ALTER TABLE `cliente`
  ADD PRIMARY KEY (`idCliente`);

--
-- Indices de la tabla `detallesPedidos`
--
ALTER TABLE `detallesPedidos`
  ADD PRIMARY KEY (`idPedido`,`idProducto`),
  ADD KEY `fk_detalle_producto` (`idProducto`);

--
-- Indices de la tabla `pedidos`
--
ALTER TABLE `pedidos`
  ADD PRIMARY KEY (`idPedido`),
  ADD KEY `fk_pedidos_cliente` (`idCliente`);

--
-- Indices de la tabla `producto`
--
ALTER TABLE `producto`
  ADD PRIMARY KEY (`idProducto`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `cliente`
--
ALTER TABLE `cliente`
  MODIFY `idCliente` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `pedidos`
--
ALTER TABLE `pedidos`
  MODIFY `idPedido` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `producto`
--
ALTER TABLE `producto`
  MODIFY `idProducto` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5103;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `detallesPedidos`
--
ALTER TABLE `detallesPedidos`
  ADD CONSTRAINT `fk_detalle_pedidos` FOREIGN KEY (`idPedido`) REFERENCES `pedidos` (`idPedido`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_detalle_producto` FOREIGN KEY (`idProducto`) REFERENCES `producto` (`idProducto`);

--
-- Filtros para la tabla `pedidos`
--
ALTER TABLE `pedidos`
  ADD CONSTRAINT `fk_pedidos_cliente` FOREIGN KEY (`idCliente`) REFERENCES `cliente` (`idCliente`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
