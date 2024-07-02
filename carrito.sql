-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 01-07-2024 a las 17:54:19
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
-- Base de datos: `carrito`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `carrito`
--

CREATE TABLE `carrito` (
  `idCarrito` int(11) NOT NULL,
  `usuario_id` int(11) NOT NULL,
  `producto_id` int(11) NOT NULL,
  `cantidad` int(11) NOT NULL,
  `talla` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `carrito`
--

INSERT INTO `carrito` (`idCarrito`, `usuario_id`, `producto_id`, `cantidad`, `talla`) VALUES
(64, 2, 1, 3, 'Mediana'),
(65, 2, 3, 13, 'Grande');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ordenes`
--

CREATE TABLE `ordenes` (
  `idOrden` int(11) NOT NULL,
  `usuario_id` int(11) NOT NULL,
  `total` decimal(10,2) NOT NULL,
  `fecha_orden` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `ordenes`
--

INSERT INTO `ordenes` (`idOrden`, `usuario_id`, `total`, `fecha_orden`) VALUES
(1, 2, 1000.00, '2024-06-29 01:04:34'),
(2, 2, 400.00, '2024-06-29 01:06:08'),
(3, 1, 900.00, '2024-06-29 01:16:41'),
(4, 1, 575.00, '2024-06-29 02:14:39'),
(5, 1, 350.00, '2024-06-29 02:19:55');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `orden_productos`
--

CREATE TABLE `orden_productos` (
  `idOrdenProducto` int(11) NOT NULL,
  `orden_id` int(11) NOT NULL,
  `producto_id` int(11) NOT NULL,
  `cantidad` int(11) NOT NULL,
  `precio` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `orden_productos`
--

INSERT INTO `orden_productos` (`idOrdenProducto`, `orden_id`, `producto_id`, `cantidad`, `precio`) VALUES
(1, 1, 4, 13, 25.00),
(2, 1, 2, 13, 25.00),
(3, 1, 3, 14, 25.00),
(4, 2, 12, 13, 25.00),
(5, 2, 7, 3, 25.00),
(6, 3, 3, 15, 25.00),
(7, 3, 10, 21, 25.00),
(8, 4, 3, 11, 25.00),
(9, 4, 10, 12, 25.00),
(10, 5, 1, 14, 25.00);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productos`
--

CREATE TABLE `productos` (
  `idProducto` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `descripcion` text DEFAULT NULL,
  `imagen` blob DEFAULT NULL,
  `precio` decimal(10,2) NOT NULL,
  `stock` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `productos`
--

INSERT INTO `productos` (`idProducto`, `nombre`, `descripcion`, `imagen`, `precio`, `stock`) VALUES
(1, 'VueJS', 'Descripción de VueJS...', NULL, 25.00, 100),
(2, 'AngularJS', 'Descripción de AngularJS...', NULL, 25.00, 100),
(3, 'ReactJS', 'Descripción de ReactJS...', NULL, 25.00, 100),
(4, 'Redux', 'Descripción de Redux...', NULL, 25.00, 100),
(5, 'Node.js', 'Descripción de Node.js...', NULL, 25.00, 100),
(6, 'SASS', 'Descripción de SASS...', NULL, 25.00, 100),
(7, 'HTML5', 'Descripción de HTML5...', NULL, 25.00, 100),
(8, 'Github', 'Descripción de Github...', NULL, 25.00, 100),
(9, 'BulmaCSS', 'Descripción de BulmaCSS...', NULL, 25.00, 100),
(10, 'TypeScript', 'Descripción de TypeScript...', NULL, 25.00, 100),
(11, 'Drupal', 'Descripción de Drupal...', NULL, 25.00, 100),
(12, 'JavaScript', 'Descripción de JavaScript...', NULL, 25.00, 100),
(13, 'GraphQL', 'Descripción de GraphQL...', NULL, 25.00, 100),
(14, 'WordPress', 'Descripción de WordPress...', NULL, 25.00, 100);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `idUsuario` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  `fecha_registro` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`idUsuario`, `nombre`, `email`, `password`, `fecha_registro`) VALUES
(1, 'esteban bunny', 'esteban@gmail.com', '$2y$10$/pr7HGJhqiwgS0dgL6NBHus3AVBvLb5wKKfA9vUrBdhsAv/kz1sCK', '2024-06-28 14:17:06'),
(2, 'Jose', 'jose@gmail.com', '$2y$10$lfTThzaL1jVEZBS7AswI0ONKVpQe19BduC0cAA0lyykX1H72JLfUm', '2024-06-28 14:17:49');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `carrito`
--
ALTER TABLE `carrito`
  ADD PRIMARY KEY (`idCarrito`),
  ADD KEY `usuario_id` (`usuario_id`),
  ADD KEY `producto_id` (`producto_id`);

--
-- Indices de la tabla `ordenes`
--
ALTER TABLE `ordenes`
  ADD PRIMARY KEY (`idOrden`),
  ADD KEY `usuario_id` (`usuario_id`);

--
-- Indices de la tabla `orden_productos`
--
ALTER TABLE `orden_productos`
  ADD PRIMARY KEY (`idOrdenProducto`),
  ADD KEY `orden_id` (`orden_id`),
  ADD KEY `producto_id` (`producto_id`);

--
-- Indices de la tabla `productos`
--
ALTER TABLE `productos`
  ADD PRIMARY KEY (`idProducto`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`idUsuario`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `carrito`
--
ALTER TABLE `carrito`
  MODIFY `idCarrito` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=66;

--
-- AUTO_INCREMENT de la tabla `ordenes`
--
ALTER TABLE `ordenes`
  MODIFY `idOrden` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `orden_productos`
--
ALTER TABLE `orden_productos`
  MODIFY `idOrdenProducto` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `productos`
--
ALTER TABLE `productos`
  MODIFY `idProducto` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `idUsuario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `carrito`
--
ALTER TABLE `carrito`
  ADD CONSTRAINT `carrito_ibfk_1` FOREIGN KEY (`usuario_id`) REFERENCES `usuarios` (`idUsuario`),
  ADD CONSTRAINT `carrito_ibfk_2` FOREIGN KEY (`producto_id`) REFERENCES `productos` (`idProducto`);

--
-- Filtros para la tabla `ordenes`
--
ALTER TABLE `ordenes`
  ADD CONSTRAINT `ordenes_ibfk_1` FOREIGN KEY (`usuario_id`) REFERENCES `usuarios` (`idUsuario`);

--
-- Filtros para la tabla `orden_productos`
--
ALTER TABLE `orden_productos`
  ADD CONSTRAINT `orden_productos_ibfk_1` FOREIGN KEY (`orden_id`) REFERENCES `ordenes` (`idOrden`),
  ADD CONSTRAINT `orden_productos_ibfk_2` FOREIGN KEY (`producto_id`) REFERENCES `productos` (`idProducto`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
