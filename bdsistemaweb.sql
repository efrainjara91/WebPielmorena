-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 30-09-2019 a las 17:53:55
-- Versión del servidor: 10.3.16-MariaDB
-- Versión de PHP: 7.3.7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `bdsistemaweb`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cargo`
--

CREATE TABLE `cargo` (
  `idCargo` int(11) NOT NULL,
  `nombreCargo` varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  `vigencia` bit(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `cargo`
--

INSERT INTO `cargo` (`idCargo`, `nombreCargo`, `vigencia`) VALUES
(1, 'ADMINISTRADOR', b'1'),
(2, 'VENDEDOR', b'1');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categoria`
--

CREATE TABLE `categoria` (
  `idCategoria` int(11) NOT NULL,
  `categoria` varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  `estado` bit(1) DEFAULT NULL,
  `mostrar` bit(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `categoria`
--

INSERT INTO `categoria` (`idCategoria`, `categoria`, `estado`, `mostrar`) VALUES
(1, 'Zapatos Hombre', b'1', b'1'),
(2, 'Zapatos Mujer', b'1', b'1'),
(3, 'Zapatos Niños', b'1', b'1'),
(4, 'Zapatos Niñas', b'1', b'1');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cliente`
--

CREATE TABLE `cliente` (
  `idCliente` int(11) NOT NULL,
  `numIdentificación` varchar(11) COLLATE utf8_spanish_ci DEFAULT NULL,
  `nombres` varchar(20) COLLATE utf8_spanish_ci NOT NULL,
  `direccion` varchar(255) COLLATE utf8_spanish_ci DEFAULT NULL,
  `correo_electrónico` varchar(30) COLLATE utf8_spanish_ci NOT NULL,
  `clave` varchar(10) COLLATE utf8_spanish_ci NOT NULL,
  `apellido_paterno` varchar(100) COLLATE utf8_spanish_ci DEFAULT NULL,
  `apellido_materno` varchar(100) COLLATE utf8_spanish_ci DEFAULT NULL,
  `genero` char(1) COLLATE utf8_spanish_ci DEFAULT NULL,
  `celular` varchar(9) COLLATE utf8_spanish_ci DEFAULT NULL,
  `fecha_nacimiento` date DEFAULT NULL,
  `estado` bit(1) DEFAULT NULL,
  `idDocumentoIdentidad` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `cliente`
--

INSERT INTO `cliente` (`idCliente`, `numIdentificación`, `nombres`, `direccion`, `correo_electrónico`, `clave`, `apellido_paterno`, `apellido_materno`, `genero`, `celular`, `fecha_nacimiento`, `estado`, `idDocumentoIdentidad`) VALUES
(2, '343656', 'Alexander Madian', '', 'mamani@gmail.com', '123', 'Torres', 'Mamani', 'M', '988251450', '2019-01-01', b'1', 1),
(3, '98674532', 'Anita ', 'Ferreñafe - Lambayeque', 'anitalaper@gmail.com', '123', 'Rodriguez', 'Lopez', 'F', '985843612', '2019-09-12', b'1', 1),
(5, '46978997', 'Julio ', 'Av. Unión Santa Victoria', 'juliocor@gmail.com', '123', 'Coronel', 'Perez', 'M', '986452148', '2019-09-04', b'1', 1),
(8, '123456789', 'fREDER', 'Av. Luis Gonzales #150', 'freder@hotmail.com', '123', 'García', 'Cruz', 'M', '978946897', '2019-09-19', b'1', 1),
(33, NULL, 'PÚBLICO GENERAL', NULL, '', '', NULL, NULL, NULL, NULL, NULL, b'1', 0),
(37, '56546456', 'José Antonio', 'calle las acacias 150', 'antonior@hotmail.com', 'jose123', 'RodrÃ­guez', 'PÃ©rez', 'M', '543534534', '2019-09-30', b'1', 1),
(42, '32423423', 'Ronald', 'calle marte 120 UrbSanta Elena', 'zumiro14@gmail.com', '3434324324', 'irigoin', 'irigoin', 'M', '939272190', '2019-09-30', b'1', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `compras`
--

CREATE TABLE `compras` (
  `idcompra` int(11) NOT NULL,
  `idProveedor` int(11) NOT NULL,
  `idEmpleado` int(11) NOT NULL,
  `fecha` varchar(10) NOT NULL,
  `monto` double NOT NULL,
  `NumeroSerie` varchar(25) NOT NULL,
  `idComprobante` int(11) NOT NULL,
  `estado` varchar(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `compras`
--

INSERT INTO `compras` (`idcompra`, `idProveedor`, `idEmpleado`, `fecha`, `monto`, `NumeroSerie`, `idComprobante`, `estado`) VALUES
(19, 2, 1, '2019-09-15', 200, '00000123', 2, '1'),
(20, 2, 1, '2019-09-20', 310, '00000256', 2, '1'),
(21, 2, 1, '2019-09-22', 710, '00000258', 2, '1'),
(22, 2, 1, '2019-09-21', 49.8, '00000850', 1, '1'),
(23, 2, 1, '2019-09-20', 50, '00000026', 1, '1'),
(24, 3, 1, '2019-09-24', 589.6, '00000218', 1, '1'),
(26, 2, 1, '2019-09-24', 400, '00000365', 1, '1');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `comprasweb`
--

CREATE TABLE `comprasweb` (
  `idComprasWeb` int(11) NOT NULL,
  `idCliente` int(11) DEFAULT NULL,
  `idPago` int(11) DEFAULT NULL,
  `FechaCompras` varchar(11) DEFAULT NULL,
  `Monto` decimal(8,2) DEFAULT NULL,
  `Estado` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `comprobante`
--

CREATE TABLE `comprobante` (
  `idComprobante` int(11) NOT NULL,
  `nombre` varchar(50) COLLATE utf8_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `comprobante`
--

INSERT INTO `comprobante` (`idComprobante`, `nombre`) VALUES
(1, 'BOLETA'),
(2, 'FACTURA');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalle_compras`
--

CREATE TABLE `detalle_compras` (
  `idDetalle` int(11) NOT NULL,
  `idCompras` int(11) NOT NULL,
  `idProducto` int(11) NOT NULL,
  `cantidad` int(11) NOT NULL,
  `precioCompra` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `detalle_compras`
--

INSERT INTO `detalle_compras` (`idDetalle`, `idCompras`, `idProducto`, `cantidad`, `precioCompra`) VALUES
(7, 19, 43, 1, 200),
(8, 20, 10, 4, 45),
(9, 20, 11, 1, 130),
(10, 21, 39, 2, 65),
(11, 21, 42, 1, 180),
(12, 21, 43, 1, 400),
(13, 22, 8, 1, 25),
(14, 22, 9, 1, 24.8),
(15, 23, 8, 1, 50),
(16, 24, 8, 1, 100),
(17, 24, 9, 1, 49.6),
(18, 24, 10, 2, 90),
(19, 24, 11, 1, 260),
(20, 26, 8, 2, 200);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalle_comprasweb`
--

CREATE TABLE `detalle_comprasweb` (
  `idDetalleWeb` int(11) NOT NULL,
  `idProducto` int(11) NOT NULL,
  `idComprasweb` int(11) NOT NULL,
  `Cantidad` int(11) DEFAULT NULL,
  `PrecioCompra` decimal(8,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalle_ventas`
--

CREATE TABLE `detalle_ventas` (
  `id` int(11) NOT NULL,
  `idventa` int(11) NOT NULL,
  `idproducto` int(11) NOT NULL,
  `cantidad` int(11) NOT NULL,
  `precioventa` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `detalle_ventas`
--

INSERT INTO `detalle_ventas` (`id`, `idventa`, `idproducto`, `cantidad`, `precioventa`) VALUES
(1, 12, 8, 27, 100),
(2, 12, 9, 2, 350),
(3, 14, 8, 1, 100),
(4, 14, 9, 1, 350),
(5, 18, 10, 1, 350),
(6, 18, 11, 1, 350),
(7, 19, 11, 2, 350),
(8, 20, 8, 1, 100),
(9, 21, 8, 1, 100),
(10, 21, 10, 1, 350),
(21, 42, 10, 3, 150),
(22, 43, 39, 1, 167.3),
(23, 44, 8, 4, 49.9),
(24, 45, 8, 2, 49.9);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `documentoidentidad`
--

CREATE TABLE `documentoidentidad` (
  `idDocumentoIdentidad` int(11) NOT NULL,
  `nombre` varchar(50) COLLATE utf8_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `documentoidentidad`
--

INSERT INTO `documentoidentidad` (`idDocumentoIdentidad`, `nombre`) VALUES
(1, 'DNI');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `empleado`
--

CREATE TABLE `empleado` (
  `idEmpleado` int(11) NOT NULL,
  `nombres` varchar(100) COLLATE utf8_spanish_ci NOT NULL,
  `apellidos` varchar(100) COLLATE utf8_spanish_ci NOT NULL,
  `numIdentificación` varchar(11) COLLATE utf8_spanish_ci NOT NULL,
  `telefono` varchar(9) COLLATE utf8_spanish_ci DEFAULT NULL,
  `dirección` varchar(120) COLLATE utf8_spanish_ci DEFAULT NULL,
  `nombreUsuario` varchar(20) COLLATE utf8_spanish_ci NOT NULL,
  `clave` varchar(20) COLLATE utf8_spanish_ci NOT NULL,
  `estado` bit(1) DEFAULT NULL,
  `idCargo` int(11) NOT NULL,
  `idDocumentoIdentidad` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `empleado`
--

INSERT INTO `empleado` (`idEmpleado`, `nombres`, `apellidos`, `numIdentificación`, `telefono`, `dirección`, `nombreUsuario`, `clave`, `estado`, `idCargo`, `idDocumentoIdentidad`) VALUES
(1, 'Ronald', 'Irigoín Núñez', '73059476', '939272190', 'calle marte 120 - santa elena', 'admin', 'admin', b'1', 1, 1),
(3, 'Elmer', 'Olivera Yupanqui', '45896387', '978956354', 'av. pacífico - Urb Ingenieros', 'elmer', '123', b'1', 1, 1),
(5, 'Jean', 'Moncayo Ramos', '68978945', '986954123', 'Chinchaysuyo #120 - La Victoria', 'carlos', '123', b'1', 2, 1),
(6, 'Alexander', 'Fuentes Medina', '73059476', '969878954', 'calle petiso - ferreñafe', 'alex', '123', b'1', 1, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `marca`
--

CREATE TABLE `marca` (
  `idMarca` int(11) NOT NULL,
  `marca` varchar(40) COLLATE utf8_spanish_ci NOT NULL,
  `estado` bit(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `marca`
--

INSERT INTO `marca` (`idMarca`, `marca`, `estado`) VALUES
(1, 'Nike', b'1'),
(2, 'Adidas', b'1'),
(3, 'Puma', b'1'),
(4, 'Reebok', b'1'),
(6, 'Bruno Kids', b'1'),
(7, 'HUSH PUPPIES', b'1'),
(8, 'NATURALIZER', b'1'),
(9, 'CHABELY', b'1'),
(10, 'FORESTA', b'1'),
(11, 'Calzado Luisuana', b'1');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pago`
--

CREATE TABLE `pago` (
  `idPago` int(11) NOT NULL,
  `Monto` decimal(8,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `producto`
--

CREATE TABLE `producto` (
  `idProducto` int(11) NOT NULL,
  `nombre` varchar(70) COLLATE utf8_spanish_ci NOT NULL,
  `foto` varchar(255) COLLATE utf8_spanish_ci DEFAULT NULL,
  `descripcion` varchar(70) COLLATE utf8_spanish_ci DEFAULT NULL,
  `precio` decimal(8,2) DEFAULT NULL,
  `stock` int(11) DEFAULT NULL,
  `precioCompra` double DEFAULT NULL,
  `estado` bit(1) DEFAULT NULL,
  `destacado` tinyint(1) DEFAULT NULL,
  `idCategoria` int(11) DEFAULT NULL,
  `idMarca` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `producto`
--

INSERT INTO `producto` (`idProducto`, `nombre`, `foto`, `descripcion`, `precio`, `stock`, `precioCompra`, `estado`, `destacado`, `idCategoria`, `idMarca`) VALUES
(8, 'Zapatos Espumado', 'http://localhost:80/imagenes/boy.jpg', 'Talla 25 Color MarrÃ³n', '49.90', 54, 800, b'1', 0, 3, 6),
(9, 'Zapato Niño 2 Velc', 'http://localhost:80/imagenes/boy2.jpg', 'Talla 24 Color Marrón', '69.30', 92, 99.2, b'1', NULL, 3, 3),
(10, 'Tacos Luxia', 'http://localhost:80/imagenes/9.jpg', 'Talla 37 Color rojo', '150.00', 95, 180, b'1', NULL, 2, 9),
(11, 'Botas de invierno', 'http://localhost:80/imagenes/bota1.jpg', 'Talla 37 Color beige', '250.00', 99, 520, b'1', NULL, 2, 10),
(36, 'Zapato Niño 2 Velc', 'http://localhost:80/imagenes/boy2.jpg', 'Talla 25 Color Marrón', '69.30', 93, 24.8, b'1', NULL, 3, 3),
(37, 'Zapato Forte Reaction Ii Tan', 'http://localhost:80/imagenes/man.jpg', 'Talla 45 - Cuero - Color Marrón', '174.50', 80, 60.9, b'1', 1, 1, 7),
(38, 'Botin Chaylee', 'http://localhost:80/imagenes/woman.jpg', 'Talla 37 Color negro', '159.50', 86, 112, b'1', NULL, 2, 8),
(39, 'Zapatillas de Fútbol', 'http://localhost:80/imagenes/sport.jpg', 'Talla 45 Color blanco/azul', '167.30', 51, 130, b'1', NULL, 1, 1),
(40, 'Bota Dama', 'http://localhost:80/imagenes/woman2.jpg', 'Talla 37 Material: Sintético', '185.90', 63, 80, b'1', NULL, 2, 9),
(41, 'Zapatos De Vestir Atenea', 'http://localhost:80/imagenes/woman3.jpg', 'Talla: 38\r\nHorma: Normal\r\nMaterial: Cuero', '194.50', 63, 80, b'1', 0, 2, 10),
(42, 'Zapatillas Air Max 90 Essential', 'http://localhost:80/imagenes/nike.jpg', 'Talla 42 \r\nMaterial: Textil \r\nColor:Negro', '380.90', 51, 360, b'1', 1, 1, 1),
(43, 'Zapatillas Urbanas Air Max Motion Racer', 'http://localhost:80/imagenes/nike2.jpg', 'Talla 42 Color Blanco', '399.00', 7, 800, b'1', 1, 1, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `proveedor`
--

CREATE TABLE `proveedor` (
  `idProveedor` int(11) NOT NULL,
  `NombreProveedor` varchar(100) COLLATE utf8_spanish_ci NOT NULL,
  `nombreRrepresentante` varchar(100) COLLATE utf8_spanish_ci DEFAULT NULL,
  `cargo` varchar(30) COLLATE utf8_spanish_ci DEFAULT NULL,
  `tipoProveedor` varchar(80) COLLATE utf8_spanish_ci DEFAULT NULL,
  `telefono` char(9) COLLATE utf8_spanish_ci NOT NULL,
  `RUC` varchar(11) COLLATE utf8_spanish_ci NOT NULL,
  `direccion` varchar(70) COLLATE utf8_spanish_ci DEFAULT NULL,
  `estado` bit(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `proveedor`
--

INSERT INTO `proveedor` (`idProveedor`, `NombreProveedor`, `nombreRrepresentante`, `cargo`, `tipoProveedor`, `telefono`, `RUC`, `direccion`, `estado`) VALUES
(1, 'Consorio Lupita', 'Lupe Fuentes', 'Secretaria', 'Zapatos y Sandalias', '984785958', '20104589614', '', b'0'),
(2, 'Zapatos de Cuero Kale S.A.', 'Roberto Gomez', 'Administrador', '00000', '999999', '12345678902', 'San Antonio de Carapongo\r\nLurigancho', b'1'),
(3, 'Fabricante Origing S.A.C.', 'Fabiano Torres', 'Logistica', 'xxxxxx', '2132321', '2343254357', 'Los Alamos de Arequipa', b'1');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `venta`
--

CREATE TABLE `venta` (
  `idventa` int(11) NOT NULL,
  `idEmpleado` int(11) NOT NULL,
  `IdCliente` int(11) NOT NULL,
  `serie_comprobante` varchar(20) COLLATE utf8_spanish_ci NOT NULL,
  `fecha` varchar(10) COLLATE utf8_spanish_ci NOT NULL,
  `impuesto` decimal(8,2) NOT NULL,
  `total` decimal(8,2) NOT NULL,
  `estado` varchar(1) COLLATE utf8_spanish_ci DEFAULT NULL,
  `idComprobante` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `venta`
--

INSERT INTO `venta` (`idventa`, `idEmpleado`, `IdCliente`, `serie_comprobante`, `fecha`, `impuesto`, `total`, `estado`, `idComprobante`) VALUES
(12, 1, 2, '00000012', '2019-09-12', '612.00', '3400.00', '1', 2),
(14, 1, 3, '00000013', '2019-09-12', '81.00', '450.00', '1', 2),
(18, 1, 3, '00000014', '2019-09-19', '0.00', '700.00', '1', 2),
(19, 1, 2, '00000015', '2019-09-19', '0.00', '700.00', '1', 1),
(20, 1, 2, '00000016', '2019-09-22', '0.00', '100.00', '1', 1),
(21, 1, 5, '00000017', '2019-09-22', '0.00', '450.00', '1', 1),
(42, 1, 3, '00000018', '2019-09-24', '0.00', '450.00', '1', 1),
(43, 1, 8, '00000019', '2019-09-24', '0.00', '167.30', '1', 1),
(44, 1, 8, '00000020', '2019-09-27', '0.00', '199.60', '1', 1),
(45, 1, 2, '00000021', '2019-09-27', '0.00', '99.80', '1', 1);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `cargo`
--
ALTER TABLE `cargo`
  ADD PRIMARY KEY (`idCargo`);

--
-- Indices de la tabla `categoria`
--
ALTER TABLE `categoria`
  ADD PRIMARY KEY (`idCategoria`);

--
-- Indices de la tabla `cliente`
--
ALTER TABLE `cliente`
  ADD PRIMARY KEY (`idCliente`),
  ADD KEY `idDocumentoIdentidad` (`idDocumentoIdentidad`);

--
-- Indices de la tabla `compras`
--
ALTER TABLE `compras`
  ADD PRIMARY KEY (`idcompra`),
  ADD KEY `idProveedor` (`idProveedor`);

--
-- Indices de la tabla `comprasweb`
--
ALTER TABLE `comprasweb`
  ADD PRIMARY KEY (`idComprasWeb`),
  ADD KEY `comprasweb_cliente` (`idCliente`),
  ADD KEY `comprasweb_pago` (`idPago`);

--
-- Indices de la tabla `comprobante`
--
ALTER TABLE `comprobante`
  ADD PRIMARY KEY (`idComprobante`);

--
-- Indices de la tabla `detalle_compras`
--
ALTER TABLE `detalle_compras`
  ADD PRIMARY KEY (`idDetalle`),
  ADD KEY `detalle_compras_compras` (`idCompras`),
  ADD KEY `detalle_compras_producto` (`idProducto`);

--
-- Indices de la tabla `detalle_comprasweb`
--
ALTER TABLE `detalle_comprasweb`
  ADD PRIMARY KEY (`idDetalleWeb`,`idProducto`,`idComprasweb`),
  ADD KEY `detalle_comprasweb_comprasweb` (`idComprasweb`),
  ADD KEY `detalle_comprasweb_producto` (`idProducto`);

--
-- Indices de la tabla `detalle_ventas`
--
ALTER TABLE `detalle_ventas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `detalle_ventas_venta` (`idventa`),
  ADD KEY `detalle_ventas_producto` (`idproducto`);

--
-- Indices de la tabla `documentoidentidad`
--
ALTER TABLE `documentoidentidad`
  ADD PRIMARY KEY (`idDocumentoIdentidad`);

--
-- Indices de la tabla `empleado`
--
ALTER TABLE `empleado`
  ADD PRIMARY KEY (`idEmpleado`),
  ADD KEY `idCargo` (`idCargo`),
  ADD KEY `idDocumentoIdentidad` (`idDocumentoIdentidad`);

--
-- Indices de la tabla `marca`
--
ALTER TABLE `marca`
  ADD PRIMARY KEY (`idMarca`);

--
-- Indices de la tabla `pago`
--
ALTER TABLE `pago`
  ADD PRIMARY KEY (`idPago`);

--
-- Indices de la tabla `producto`
--
ALTER TABLE `producto`
  ADD PRIMARY KEY (`idProducto`),
  ADD KEY `idCategoria` (`idCategoria`),
  ADD KEY `idMarca` (`idMarca`);

--
-- Indices de la tabla `proveedor`
--
ALTER TABLE `proveedor`
  ADD PRIMARY KEY (`idProveedor`);

--
-- Indices de la tabla `venta`
--
ALTER TABLE `venta`
  ADD PRIMARY KEY (`idventa`),
  ADD KEY `idEmpleado` (`idEmpleado`),
  ADD KEY `idComprobante` (`idComprobante`),
  ADD KEY `venta_cliente` (`IdCliente`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `cargo`
--
ALTER TABLE `cargo`
  MODIFY `idCargo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `categoria`
--
ALTER TABLE `categoria`
  MODIFY `idCategoria` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT de la tabla `cliente`
--
ALTER TABLE `cliente`
  MODIFY `idCliente` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=44;

--
-- AUTO_INCREMENT de la tabla `compras`
--
ALTER TABLE `compras`
  MODIFY `idcompra` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT de la tabla `comprasweb`
--
ALTER TABLE `comprasweb`
  MODIFY `idComprasWeb` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de la tabla `comprobante`
--
ALTER TABLE `comprobante`
  MODIFY `idComprobante` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `detalle_compras`
--
ALTER TABLE `detalle_compras`
  MODIFY `idDetalle` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT de la tabla `detalle_comprasweb`
--
ALTER TABLE `detalle_comprasweb`
  MODIFY `idDetalleWeb` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `detalle_ventas`
--
ALTER TABLE `detalle_ventas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT de la tabla `documentoidentidad`
--
ALTER TABLE `documentoidentidad`
  MODIFY `idDocumentoIdentidad` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `empleado`
--
ALTER TABLE `empleado`
  MODIFY `idEmpleado` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT de la tabla `marca`
--
ALTER TABLE `marca`
  MODIFY `idMarca` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT de la tabla `pago`
--
ALTER TABLE `pago`
  MODIFY `idPago` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de la tabla `producto`
--
ALTER TABLE `producto`
  MODIFY `idProducto` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=46;

--
-- AUTO_INCREMENT de la tabla `proveedor`
--
ALTER TABLE `proveedor`
  MODIFY `idProveedor` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `venta`
--
ALTER TABLE `venta`
  MODIFY `idventa` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=47;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `cliente`
--
ALTER TABLE `cliente`
  ADD CONSTRAINT `cliente_ibfk_1` FOREIGN KEY (`idDocumentoIdentidad`) REFERENCES `documentoidentidad` (`idDocumentoIdentidad`);

--
-- Filtros para la tabla `compras`
--
ALTER TABLE `compras`
  ADD CONSTRAINT `detalle_ventas_ibfk_1` FOREIGN KEY (`idProveedor`) REFERENCES `proveedor` (`idProveedor`);

--
-- Filtros para la tabla `comprasweb`
--
ALTER TABLE `comprasweb`
  ADD CONSTRAINT `comprasweb_cliente` FOREIGN KEY (`idCliente`) REFERENCES `cliente` (`idCliente`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `comprasweb_pago` FOREIGN KEY (`idPago`) REFERENCES `pago` (`idPago`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `detalle_compras`
--
ALTER TABLE `detalle_compras`
  ADD CONSTRAINT `detalle_compras_compras` FOREIGN KEY (`idCompras`) REFERENCES `compras` (`idcompra`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `detalle_compras_producto` FOREIGN KEY (`idProducto`) REFERENCES `producto` (`idProducto`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `detalle_comprasweb`
--
ALTER TABLE `detalle_comprasweb`
  ADD CONSTRAINT `detalle_comprasweb_comprasweb` FOREIGN KEY (`idComprasweb`) REFERENCES `comprasweb` (`idComprasWeb`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `detalle_comprasweb_producto` FOREIGN KEY (`idProducto`) REFERENCES `producto` (`idProducto`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `detalle_ventas`
--
ALTER TABLE `detalle_ventas`
  ADD CONSTRAINT `detalle_ventas_producto` FOREIGN KEY (`idproducto`) REFERENCES `producto` (`idProducto`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `detalle_ventas_venta` FOREIGN KEY (`idventa`) REFERENCES `venta` (`idventa`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `empleado`
--
ALTER TABLE `empleado`
  ADD CONSTRAINT `empleado_ibfk_1` FOREIGN KEY (`idCargo`) REFERENCES `cargo` (`idCargo`),
  ADD CONSTRAINT `empleado_ibfk_2` FOREIGN KEY (`idDocumentoIdentidad`) REFERENCES `documentoidentidad` (`idDocumentoIdentidad`);

--
-- Filtros para la tabla `producto`
--
ALTER TABLE `producto`
  ADD CONSTRAINT `producto_ibfk_1` FOREIGN KEY (`idCategoria`) REFERENCES `categoria` (`idCategoria`),
  ADD CONSTRAINT `producto_ibfk_2` FOREIGN KEY (`idMarca`) REFERENCES `marca` (`idMarca`);

--
-- Filtros para la tabla `venta`
--
ALTER TABLE `venta`
  ADD CONSTRAINT `venta_cliente` FOREIGN KEY (`IdCliente`) REFERENCES `cliente` (`idCliente`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `venta_ibfk_2` FOREIGN KEY (`idEmpleado`) REFERENCES `empleado` (`idEmpleado`),
  ADD CONSTRAINT `venta_ibfk_3` FOREIGN KEY (`idComprobante`) REFERENCES `comprobante` (`idComprobante`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
