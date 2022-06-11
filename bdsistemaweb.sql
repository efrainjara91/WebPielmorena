-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 10, 2022 at 06:05 PM
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
-- Database: `bdsistemaweb`
--

-- --------------------------------------------------------

--
-- Table structure for table `cargo`
--

CREATE TABLE `cargo` (
  `idCargo` int(11) NOT NULL,
  `nombreCargo` varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  `vigencia` bit(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Dumping data for table `cargo`
--

INSERT INTO `cargo` (`idCargo`, `nombreCargo`, `vigencia`) VALUES
(1, 'ADMINISTRADOR', b'1'),
(2, 'VENDEDOR', b'1');

-- --------------------------------------------------------

--
-- Table structure for table `categoria`
--

CREATE TABLE `categoria` (
  `idCategoria` int(11) NOT NULL,
  `categoria` varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  `estado` bit(1) DEFAULT NULL,
  `mostrar` bit(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Dumping data for table `categoria`
--

INSERT INTO `categoria` (`idCategoria`, `categoria`, `estado`, `mostrar`) VALUES
(1, 'Electronicos', b'1', b'1');

-- --------------------------------------------------------

--
-- Table structure for table `cliente`
--

CREATE TABLE `cliente` (
  `idCliente` int(11) NOT NULL,
  `numIdentificación` varchar(11) COLLATE utf8_spanish_ci DEFAULT NULL,
  `nombres` varchar(20) COLLATE utf8_spanish_ci NOT NULL,
  `direccion` varchar(255) COLLATE utf8_spanish_ci DEFAULT NULL,
  `correo_electrónico` varchar(30) COLLATE utf8_spanish_ci DEFAULT NULL,
  `clave` varchar(10) COLLATE utf8_spanish_ci DEFAULT NULL,
  `apellido_paterno` varchar(100) COLLATE utf8_spanish_ci DEFAULT NULL,
  `apellido_materno` varchar(100) COLLATE utf8_spanish_ci DEFAULT NULL,
  `genero` char(1) COLLATE utf8_spanish_ci DEFAULT NULL,
  `celular` varchar(10) COLLATE utf8_spanish_ci DEFAULT NULL,
  `fecha_nacimiento` date DEFAULT NULL,
  `estado` bit(1) DEFAULT NULL,
  `idDocumentoIdentidad` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Dumping data for table `cliente`
--

INSERT INTO `cliente` (`idCliente`, `numIdentificación`, `nombres`, `direccion`, `correo_electrónico`, `clave`, `apellido_paterno`, `apellido_materno`, `genero`, `celular`, `fecha_nacimiento`, `estado`, `idDocumentoIdentidad`) VALUES
(52, '5806038', 'Efrain', 'Asuncion', 'efrainjara91@gmail.com', '123', 'Benitez', 'Jara', 'M', '0973720210', '2022-06-07', b'1', 2),
(53, '5806039', 'Amilcar', 'Hernandarias', 'efrainjara95@gmail.com', '123', 'Dominguez ', 'Galeano', 'M', '0973720211', '2022-06-08', b'1', 1);

-- --------------------------------------------------------

--
-- Table structure for table `compras`
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

-- --------------------------------------------------------

--
-- Table structure for table `comprasweb`
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
-- Table structure for table `comprobante`
--

CREATE TABLE `comprobante` (
  `idComprobante` int(11) NOT NULL,
  `nombre` varchar(50) COLLATE utf8_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Dumping data for table `comprobante`
--

INSERT INTO `comprobante` (`idComprobante`, `nombre`) VALUES
(1, 'TICKET'),
(2, 'FACTURA');

-- --------------------------------------------------------

--
-- Table structure for table `detalle_compras`
--

CREATE TABLE `detalle_compras` (
  `idDetalle` int(11) NOT NULL,
  `idCompras` int(11) NOT NULL,
  `idProducto` int(11) NOT NULL,
  `cantidad` int(11) NOT NULL,
  `precioCompra` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `detalle_compras`
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
(20, 26, 8, 2, 200),
(21, 27, 11, 1, 520),
(22, 28, 9, 1, 99.2);

-- --------------------------------------------------------

--
-- Table structure for table `detalle_comprasweb`
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
-- Table structure for table `detalle_ventas`
--

CREATE TABLE `detalle_ventas` (
  `id` int(11) NOT NULL,
  `idventa` int(11) NOT NULL,
  `idproducto` int(11) NOT NULL,
  `cantidad` int(11) NOT NULL,
  `precioventa` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `detalle_ventas`
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
(26, 48, 11, 1, 250),
(27, 49, 8, 1, 49.9),
(28, 50, 11, 2, 250),
(29, 51, 8, 1, 49.9),
(30, 52, 10, 1, 150),
(31, 53, 8, 1, 49.9);

-- --------------------------------------------------------

--
-- Table structure for table `documentoidentidad`
--

CREATE TABLE `documentoidentidad` (
  `idDocumentoIdentidad` int(11) NOT NULL,
  `nombre` varchar(50) COLLATE utf8_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Dumping data for table `documentoidentidad`
--

INSERT INTO `documentoidentidad` (`idDocumentoIdentidad`, `nombre`) VALUES
(1, 'DNI'),
(2, 'RUC/CI');

-- --------------------------------------------------------

--
-- Table structure for table `empleado`
--

CREATE TABLE `empleado` (
  `idEmpleado` int(11) NOT NULL,
  `nombres` varchar(100) COLLATE utf8_spanish_ci NOT NULL,
  `apellidos` varchar(100) COLLATE utf8_spanish_ci NOT NULL,
  `numIdentificación` varchar(11) COLLATE utf8_spanish_ci NOT NULL,
  `telefono` varchar(10) COLLATE utf8_spanish_ci DEFAULT NULL,
  `dirección` varchar(120) COLLATE utf8_spanish_ci DEFAULT NULL,
  `nombreUsuario` varchar(20) COLLATE utf8_spanish_ci NOT NULL,
  `clave` varchar(20) COLLATE utf8_spanish_ci NOT NULL,
  `estado` bit(1) DEFAULT NULL,
  `idCargo` int(11) NOT NULL,
  `idDocumentoIdentidad` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Dumping data for table `empleado`
--

INSERT INTO `empleado` (`idEmpleado`, `nombres`, `apellidos`, `numIdentificación`, `telefono`, `dirección`, `nombreUsuario`, `clave`, `estado`, `idCargo`, `idDocumentoIdentidad`) VALUES
(1, 'Amilcar', 'Dominguez', '4.976.142', '0985918044', 'Hernandarias', 'admin', 'admin', b'1', 1, 2),
(3, 'Edgar', 'Fleitas Figueredo', '3.767.024', '0973193683', 'Minga Guazu', 'edgar', 'root', b'1', 1, 2),
(5, 'Efrain', 'Benitez Jara', '5.806.038', '0973720210', 'Hernandarias', 'efrain', 'root', b'1', 1, 2);

-- --------------------------------------------------------

--
-- Table structure for table `marca`
--

CREATE TABLE `marca` (
  `idMarca` int(11) NOT NULL,
  `marca` varchar(40) COLLATE utf8_spanish_ci NOT NULL,
  `estado` bit(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Dumping data for table `marca`
--

INSERT INTO `marca` (`idMarca`, `marca`, `estado`) VALUES
(1, 'Xiaomi', b'1');

-- --------------------------------------------------------

--
-- Table structure for table `pago`
--

CREATE TABLE `pago` (
  `idPago` int(11) NOT NULL,
  `Monto` decimal(8,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `producto`
--

CREATE TABLE `producto` (
  `idProducto` int(11) NOT NULL,
  `nombre` varchar(70) COLLATE utf8_spanish_ci NOT NULL,
  `foto` varchar(255) COLLATE utf8_spanish_ci DEFAULT NULL,
  `descripcion` varchar(70) COLLATE utf8_spanish_ci DEFAULT NULL,
  `precio` decimal(10,0) DEFAULT NULL,
  `stock` int(11) DEFAULT NULL,
  `precioCompra` decimal(10,0) DEFAULT NULL,
  `estado` bit(1) DEFAULT NULL,
  `destacado` tinyint(1) DEFAULT NULL,
  `idCategoria` int(11) DEFAULT NULL,
  `idMarca` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Dumping data for table `producto`
--

INSERT INTO `producto` (`idProducto`, `nombre`, `foto`, `descripcion`, `precio`, `stock`, `precioCompra`, `estado`, `destacado`, `idCategoria`, `idMarca`) VALUES
(52, 'Earbuds Basic 2', 'null', 'Color Negro', '95000', 0, '85000', b'1', 1, 1, 1),
(53, 'Earbuds Basic 3', 'http://localhost:8083/imagenes/', 'Color Negro', '95000', 0, '85000', b'1', 1, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `proveedor`
--

CREATE TABLE `proveedor` (
  `idProveedor` int(11) NOT NULL,
  `NombreProveedor` varchar(100) COLLATE utf8_spanish_ci NOT NULL,
  `nombreRrepresentante` varchar(100) COLLATE utf8_spanish_ci DEFAULT NULL,
  `cargo` varchar(30) COLLATE utf8_spanish_ci DEFAULT NULL,
  `tipoProveedor` varchar(80) COLLATE utf8_spanish_ci DEFAULT NULL,
  `telefono` char(12) COLLATE utf8_spanish_ci NOT NULL,
  `RUC` varchar(11) COLLATE utf8_spanish_ci NOT NULL,
  `direccion` varchar(70) COLLATE utf8_spanish_ci DEFAULT NULL,
  `estado` bit(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Dumping data for table `proveedor`
--

INSERT INTO `proveedor` (`idProveedor`, `NombreProveedor`, `nombreRrepresentante`, `cargo`, `tipoProveedor`, `telefono`, `RUC`, `direccion`, `estado`) VALUES
(2, 'CELL SHOP SRL', 'Jorbel Griebeler', 'Propietario', 'Local', '061-501-474', '80044750-6', 'Av. Carlos Antonio Lopez, Cd. del Este', b'1'),
(3, 'Visao Vip S.R.L.', 'Fausto Centurion', 'Vendedor', 'Local', '061-501-748', '80058606-9', 'Lai Lai Center, Shopping Cd. del Este', b'1');

-- --------------------------------------------------------

--
-- Table structure for table `venta`
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
-- Indexes for dumped tables
--

--
-- Indexes for table `cargo`
--
ALTER TABLE `cargo`
  ADD PRIMARY KEY (`idCargo`);

--
-- Indexes for table `categoria`
--
ALTER TABLE `categoria`
  ADD PRIMARY KEY (`idCategoria`);

--
-- Indexes for table `cliente`
--
ALTER TABLE `cliente`
  ADD PRIMARY KEY (`idCliente`),
  ADD KEY `idDocumentoIdentidad` (`idDocumentoIdentidad`);

--
-- Indexes for table `compras`
--
ALTER TABLE `compras`
  ADD PRIMARY KEY (`idcompra`),
  ADD KEY `idProveedor` (`idProveedor`),
  ADD KEY `compras_empleado` (`idEmpleado`),
  ADD KEY `compras_comprobante` (`idComprobante`);

--
-- Indexes for table `comprasweb`
--
ALTER TABLE `comprasweb`
  ADD PRIMARY KEY (`idComprasWeb`),
  ADD KEY `comprasweb_cliente` (`idCliente`),
  ADD KEY `comprasweb_pago` (`idPago`);

--
-- Indexes for table `comprobante`
--
ALTER TABLE `comprobante`
  ADD PRIMARY KEY (`idComprobante`);

--
-- Indexes for table `detalle_compras`
--
ALTER TABLE `detalle_compras`
  ADD PRIMARY KEY (`idDetalle`),
  ADD KEY `detalle_compras_compras` (`idCompras`),
  ADD KEY `detalle_compras_producto` (`idProducto`);

--
-- Indexes for table `detalle_comprasweb`
--
ALTER TABLE `detalle_comprasweb`
  ADD PRIMARY KEY (`idDetalleWeb`,`idProducto`,`idComprasweb`),
  ADD KEY `detalle_comprasweb_comprasweb` (`idComprasweb`),
  ADD KEY `detalle_comprasweb_producto` (`idProducto`);

--
-- Indexes for table `detalle_ventas`
--
ALTER TABLE `detalle_ventas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `detalle_ventas_venta` (`idventa`),
  ADD KEY `detalle_ventas_producto` (`idproducto`);

--
-- Indexes for table `documentoidentidad`
--
ALTER TABLE `documentoidentidad`
  ADD PRIMARY KEY (`idDocumentoIdentidad`);

--
-- Indexes for table `empleado`
--
ALTER TABLE `empleado`
  ADD PRIMARY KEY (`idEmpleado`),
  ADD KEY `idCargo` (`idCargo`),
  ADD KEY `idDocumentoIdentidad` (`idDocumentoIdentidad`);

--
-- Indexes for table `marca`
--
ALTER TABLE `marca`
  ADD PRIMARY KEY (`idMarca`);

--
-- Indexes for table `pago`
--
ALTER TABLE `pago`
  ADD PRIMARY KEY (`idPago`);

--
-- Indexes for table `producto`
--
ALTER TABLE `producto`
  ADD PRIMARY KEY (`idProducto`),
  ADD KEY `idCategoria` (`idCategoria`),
  ADD KEY `idMarca` (`idMarca`);

--
-- Indexes for table `proveedor`
--
ALTER TABLE `proveedor`
  ADD PRIMARY KEY (`idProveedor`);

--
-- Indexes for table `venta`
--
ALTER TABLE `venta`
  ADD PRIMARY KEY (`idventa`),
  ADD KEY `idEmpleado` (`idEmpleado`),
  ADD KEY `idComprobante` (`idComprobante`),
  ADD KEY `venta_cliente` (`IdCliente`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `cargo`
--
ALTER TABLE `cargo`
  MODIFY `idCargo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `categoria`
--
ALTER TABLE `categoria`
  MODIFY `idCategoria` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `cliente`
--
ALTER TABLE `cliente`
  MODIFY `idCliente` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=54;

--
-- AUTO_INCREMENT for table `compras`
--
ALTER TABLE `compras`
  MODIFY `idcompra` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT for table `comprasweb`
--
ALTER TABLE `comprasweb`
  MODIFY `idComprasWeb` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `comprobante`
--
ALTER TABLE `comprobante`
  MODIFY `idComprobante` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `detalle_compras`
--
ALTER TABLE `detalle_compras`
  MODIFY `idDetalle` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `detalle_comprasweb`
--
ALTER TABLE `detalle_comprasweb`
  MODIFY `idDetalleWeb` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `detalle_ventas`
--
ALTER TABLE `detalle_ventas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT for table `documentoidentidad`
--
ALTER TABLE `documentoidentidad`
  MODIFY `idDocumentoIdentidad` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `empleado`
--
ALTER TABLE `empleado`
  MODIFY `idEmpleado` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `marca`
--
ALTER TABLE `marca`
  MODIFY `idMarca` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `pago`
--
ALTER TABLE `pago`
  MODIFY `idPago` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `producto`
--
ALTER TABLE `producto`
  MODIFY `idProducto` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=54;

--
-- AUTO_INCREMENT for table `proveedor`
--
ALTER TABLE `proveedor`
  MODIFY `idProveedor` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `venta`
--
ALTER TABLE `venta`
  MODIFY `idventa` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=54;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `compras`
--
ALTER TABLE `compras`
  ADD CONSTRAINT `compras_comprobante` FOREIGN KEY (`idComprobante`) REFERENCES `comprobante` (`idComprobante`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `compras_empleado` FOREIGN KEY (`idEmpleado`) REFERENCES `empleado` (`idEmpleado`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `detalle_ventas_ibfk_1` FOREIGN KEY (`idProveedor`) REFERENCES `proveedor` (`idProveedor`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
