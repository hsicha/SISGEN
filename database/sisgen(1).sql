-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 04-02-2023 a las 04:45:23
-- Versión del servidor: 10.4.27-MariaDB
-- Versión de PHP: 8.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `sisgen`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `almacen`
--

CREATE TABLE `almacen` (
  `CODIGO_ALMACEN` int(11) NOT NULL,
  `DESCRIPCION` varchar(200) NOT NULL,
  `ESTATUS` enum('ACTIVO','INACTIVO') DEFAULT NULL COMMENT 'ACTIVO,INACTIVO'
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `anular_documento`
--

CREATE TABLE `anular_documento` (
  `CODIGO_ANULAR` int(11) NOT NULL,
  `CODIGO_VENTAS` int(11) NOT NULL,
  `MOTIVO` longtext NOT NULL,
  `FECHA_ANULACION` date NOT NULL,
  `TIPO_DOCUMENTO` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `auditoria_dms_envio`
--

CREATE TABLE `auditoria_dms_envio` (
  `ID` int(11) NOT NULL,
  `empresa` varchar(250) DEFAULT NULL,
  `ruc_empresa` varchar(250) DEFAULT NULL,
  `cliente` varchar(250) DEFAULT NULL,
  `cliente_tipo_de_documento` varchar(250) DEFAULT NULL,
  `cliente_numero_de_documento` varchar(250) DEFAULT NULL,
  `codigo_venta` varchar(250) DEFAULT NULL,
  `DigestValue` varchar(250) DEFAULT NULL,
  `DocumentNumber` varchar(250) DEFAULT NULL,
  `DocumentType` varchar(250) DEFAULT NULL,
  `ErrorCode` varchar(250) DEFAULT NULL,
  `ErrorMessage` text DEFAULT NULL,
  `RequestId` varchar(250) DEFAULT NULL,
  `RequestState` varchar(250) DEFAULT NULL,
  `ResponseDate` varchar(250) DEFAULT NULL,
  `SendDate` varchar(250) DEFAULT NULL,
  `ContentBase64String` varchar(250) DEFAULT NULL,
  `tiempo_respuesta` text NOT NULL,
  `CANT_ENV` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `auditoria_venta`
--

CREATE TABLE `auditoria_venta` (
  `CODIGO_AUDITORIA` int(11) NOT NULL,
  `FECHA` datetime NOT NULL,
  `STOCK_ANTERIOR` int(11) NOT NULL,
  `STOCK_ACTUAL` int(11) NOT NULL,
  `PRECIO_TOTAL` double NOT NULL,
  `CODIGO_VENTA` int(11) NOT NULL,
  `CODIGO_PRODUCTO` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cajas`
--

CREATE TABLE `cajas` (
  `CODIGO_CAJA` int(11) NOT NULL,
  `DESCRIPCION` varchar(50) NOT NULL,
  `MONTO_INICIAL` decimal(15,2) NOT NULL,
  `FECHA_INICIAL` date NOT NULL,
  `OBSERVACION` text DEFAULT NULL,
  `CODIGO_ALMACEN` int(11) NOT NULL,
  `MONTO_DISPONIBLE` decimal(15,2) NOT NULL,
  `MODIFICADO` tinyint(1) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categoria`
--

CREATE TABLE `categoria` (
  `CODIGO_CATEGORIA` int(11) NOT NULL,
  `DESCRIPCION` varchar(100) NOT NULL,
  `ESTADO` varchar(10) NOT NULL DEFAULT 'Activo'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Volcado de datos para la tabla `categoria`
--

INSERT INTO `categoria` (`CODIGO_CATEGORIA`, `DESCRIPCION`, `ESTADO`) VALUES
(1, 'GENERAL', 'Activo'),
(2, 'ACCESORIO DEPORTIVO', 'Activo'),
(3, 'MAQUINA ABDOMINAL', 'Activo'),
(4, 'BARRAS ', 'Activo'),
(5, 'BOXEO', 'Activo'),
(6, 'BANCA MULTIFUNCIONAL', 'Activo'),
(7, 'DISCOS', 'Activo'),
(8, 'MANCUERNAS Y PESAS', 'Activo'),
(9, 'BICICLETA ELIPTICA', 'Activo'),
(10, 'CAMINADORA ELECTRICA ', 'Activo'),
(11, 'SUPLEMENTOS DEPORTIVOS', 'Activo'),
(12, 'BANCAS MULTIFUNCIONALES', 'Activo'),
(13, 'PRENSA', 'Activo'),
(14, 'BICICLETA ESTACIONARIA ', 'Activo'),
(15, 'HOME GYM ', 'Activo'),
(16, 'MAQUINA ABDOMMINAL ', 'Activo'),
(17, 'MAQUINA DE REMO', 'Activo'),
(18, 'BICICLETAS ESTACIONARIA ', 'Activo');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cliente`
--

CREATE TABLE `cliente` (
  `CODIGO_CLIENTE` int(11) NOT NULL,
  `TIPO_CONTRIBUYENTE` varchar(30) NOT NULL,
  `TIPO_DOCUMENTO` varchar(50) NOT NULL,
  `DOCUMENTO` varchar(11) NOT NULL,
  `NOMBRE_CLIENTE` varchar(100) NOT NULL,
  `DIRECCION` varchar(200) DEFAULT NULL,
  `TELEFONO` varchar(25) DEFAULT NULL,
  `EMAIL` varchar(100) DEFAULT NULL,
  `ESTADO` varchar(20) DEFAULT NULL,
  `DIRECCION_2` varchar(200) DEFAULT NULL,
  `DIRECCION_3` varchar(200) DEFAULT NULL,
  `UBIGEO_CLIENTE` int(6) UNSIGNED ZEROFILL DEFAULT NULL,
  `TIPO_CLIENTE` varchar(30) DEFAULT 'LOCAL'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `compras`
--

CREATE TABLE `compras` (
  `CODIGO_COMPRAS` int(11) NOT NULL,
  `CODIGO_PROVEEDOR` int(11) NOT NULL,
  `TIPO_DOCUMENTO` varchar(30) NOT NULL,
  `SERIE` varchar(7) NOT NULL,
  `NRO_COMPROBANTE` varchar(10) NOT NULL,
  `TIPO_PAGO` varchar(20) NOT NULL,
  `FECHA_COMPRA` timestamp NOT NULL DEFAULT current_timestamp(),
  `TOTAL` decimal(10,4) NOT NULL,
  `ESTADO` varchar(15) NOT NULL DEFAULT 'PAGADO',
  `OBSERVATION` text DEFAULT NULL,
  `OBSERVACION1` text DEFAULT NULL,
  `MONEY` varchar(30) NOT NULL,
  `TIPO_CAMBIO` decimal(10,4) NOT NULL,
  `DOCUMENTO_PDF` mediumblob DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Volcado de datos para la tabla `compras`
--

INSERT INTO `compras` (`CODIGO_COMPRAS`, `CODIGO_PROVEEDOR`, `TIPO_DOCUMENTO`, `SERIE`, `NRO_COMPROBANTE`, `TIPO_PAGO`, `FECHA_COMPRA`, `TOTAL`, `ESTADO`, `OBSERVATION`, `OBSERVACION1`, `MONEY`, `TIPO_CAMBIO`, `DOCUMENTO_PDF`) VALUES
(24, 5, 'BOLETA', 'B001', '0000001', 'CONTADO', '0000-00-00 00:00:00', '155.4000', 'PAGADO', '', '', 'S/.', '0.0000', NULL),
(25, 4, 'BOLETA', 'B001', '0000001', 'CONTADO', '2023-02-03 05:00:00', '106.6700', 'PAGADO', '', '', 'S/.', '0.0000', NULL),
(26, 2, 'FACTURA', 'F001', '0000001', 'CONTADO', '0000-00-00 00:00:00', '65.5300', 'PAGADO', '', '', 'S/.', '0.0000', NULL),
(27, 3, 'BOLETA', 'B001', '0000001', 'CONTADO', '2023-02-03 05:00:00', '70.8000', 'PAGADO', '', '', 'S/.', '0.0000', NULL),
(28, 0, '', '', '', '', '0000-00-00 00:00:00', '31.5700', 'PAGADO', '', '', 'S/.', '0.0000', NULL),
(29, 15, 'BOLETA', 'B001', '0000001', 'CONTADO', '2023-02-03 05:00:00', '7.6600', 'PAGADO', '', '', 'S/.', '0.0000', NULL),
(30, 0, '', '', '', '', '2023-02-03 05:00:00', '0.0000', 'PAGADO', '', '', 'S/.', '0.0000', NULL),
(31, 0, '', '', '', '', '2023-02-03 05:00:00', '0.0000', 'PAGADO', '', '', 'S/.', '0.0000', NULL),
(34, 0, 'BOLETA', 'B001', '0000001', 'CONTADO', '0000-00-00 00:00:00', '8.3800', 'PAGADO', '', '', 'S/.', '0.0000', NULL),
(35, 2, 'BOLETA', 'B001', '0000001', 'CONTADO', '2023-02-03 05:00:00', '8.3800', 'PAGADO', '', '', 'S/.', '0.0000', NULL),
(36, 2, 'BOLETA', 'B001', '0000001', 'CONTADO', '2023-02-10 05:00:00', '22.8600', 'PAGADO', '', '', 'S/.', '0.0000', NULL),
(37, 2, 'BOLETA', 'B001', '0000001', 'CONTADO', '2023-02-03 05:00:00', '58.4500', 'PAGADO', '', '', 'S/.', '0.0000', NULL),
(38, 3, 'BOLETA', 'B001', '0000001', 'CONTADO', '2023-02-03 05:00:00', '22.8600', 'PAGADO', '', '', 'S/.', '0.0000', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `convenio_pago`
--

CREATE TABLE `convenio_pago` (
  `CODIGO_CONVENIO` int(11) NOT NULL,
  `CODIGO_CLIENTE` int(11) NOT NULL,
  `MONTO` decimal(20,2) NOT NULL,
  `TIPO_CONVENIO` varchar(50) NOT NULL,
  `VALOR` varchar(50) DEFAULT NULL,
  `FECHA_VENCIMIENTO` date NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `credito`
--

CREATE TABLE `credito` (
  `CREDITO_ID` int(11) NOT NULL,
  `CODIGO_VENTA` int(11) NOT NULL,
  `ACUENTA` decimal(10,2) NOT NULL,
  `SALDO` decimal(10,2) NOT NULL,
  `FECHA` datetime NOT NULL,
  `ESTADO_PAGO` varchar(50) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `datanotas`
--

CREATE TABLE `datanotas` (
  `ID_NOTAS` int(11) NOT NULL,
  `NAME` varchar(50) DEFAULT NULL,
  `DESCRIPTION` varchar(150) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `despacho_almacen`
--

CREATE TABLE `despacho_almacen` (
  `CODIGO_DESPACHO` int(11) NOT NULL,
  `CODIGO_VENTA` int(11) NOT NULL,
  `FECHA_REGISTRO` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `NOMBRE_ESTIBADOR` varchar(50) NOT NULL,
  `ESTADO` varchar(50) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `despacho_almacen_detalle_producto`
--

CREATE TABLE `despacho_almacen_detalle_producto` (
  `CODIGO_D_A_D_P` int(11) NOT NULL,
  `CODIGO_DESPACHO` int(11) NOT NULL,
  `CODIGO_DETALLE_VENTA` int(11) NOT NULL,
  `FECHA_ENTREGA` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `CANTIDAD_ENTREGADA` decimal(2,0) NOT NULL,
  `ESTADO_ENTREGA` varchar(50) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalle_compras`
--

CREATE TABLE `detalle_compras` (
  `CODIGO_DETALLE_COMPRAS` int(11) NOT NULL,
  `CODIGO_COMPRAS` int(11) NOT NULL,
  `CODIGO_PRODUCTO` int(11) DEFAULT NULL,
  `CANTIDAD` int(11) NOT NULL,
  `PRECIO` decimal(10,2) NOT NULL,
  `IGV` decimal(10,2) NOT NULL,
  `SUBTOTAL` decimal(10,2) NOT NULL,
  `ESTADO` varchar(15) NOT NULL DEFAULT 'Pagado',
  `STOCK_SOBRANTE` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Volcado de datos para la tabla `detalle_compras`
--

INSERT INTO `detalle_compras` (`CODIGO_DETALLE_COMPRAS`, `CODIGO_COMPRAS`, `CODIGO_PRODUCTO`, `CANTIDAD`, `PRECIO`, `IGV`, `SUBTOTAL`, `ESTADO`, `STOCK_SOBRANTE`) VALUES
(513, 24, 41, 1, '74.00', '11.29', '74.00', 'Pagado', 12),
(514, 24, 37, 1, '81.40', '12.42', '81.40', 'Pagado', 13),
(515, 25, 2, 1, '83.81', '12.78', '83.81', 'Pagado', 10),
(516, 25, 12, 1, '22.86', '3.49', '22.86', 'Pagado', 13),
(517, 26, 16, 1, '19.81', '3.02', '19.81', 'Pagado', 31),
(518, 26, 13, 1, '22.86', '3.49', '22.86', 'Pagado', 16),
(519, 26, 11, 1, '22.86', '3.49', '22.86', 'Pagado', 20),
(520, 27, 15, 1, '25.08', '3.83', '25.08', 'Pagado', 100),
(521, 27, 13, 1, '22.86', '3.49', '22.86', 'Pagado', 17),
(522, 27, 10, 1, '22.86', '3.49', '22.86', 'Pagado', 38),
(523, 28, 21, 1, '2.10', '0.32', '2.10', 'Pagado', 64),
(524, 28, 19, 1, '2.33', '0.36', '2.33', 'Pagado', 151),
(525, 28, 15, 1, '25.08', '3.83', '25.08', 'Pagado', 101),
(526, 28, 22, 1, '2.06', '0.31', '2.06', 'Pagado', 61),
(527, 28, 52, 1, '2.04', '0.31', '2.04', 'Pagado', 15),
(528, 29, 18, 1, '5.62', '0.86', '5.62', 'Pagado', 121),
(529, 31, 25, 1, '8.38', '1.28', '8.38', 'Pagado', 55),
(530, 35, 25, 1, '8.38', '1.28', '8.38', 'Pagado', 56),
(531, 35, 10, 1, '22.86', '3.49', '22.86', 'Pagado', 39),
(532, 37, 31, 1, '58.45', '8.92', '58.45', 'Pagado', 12),
(533, 38, 10, 1, '22.86', '3.49', '22.86', 'Pagado', 40);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalle_ventas`
--

CREATE TABLE `detalle_ventas` (
  `CODIGO_DETALLE_VENTAS` int(11) NOT NULL,
  `CODIGO_VENTAS` int(11) NOT NULL,
  `CODIGO_PRODUCTO` int(11) NOT NULL,
  `CANTIDAD` decimal(11,2) NOT NULL,
  `PRECIO` decimal(20,6) NOT NULL,
  `IGV` decimal(20,6) NOT NULL,
  `SUBTOTAL` decimal(20,6) NOT NULL,
  `ESTADO` varchar(15) NOT NULL DEFAULT 'Pagado',
  `unidad_de_medida` varchar(5) DEFAULT NULL,
  `anticipo_regularizacion` varchar(5) DEFAULT NULL,
  `tipo_de_igv` int(11) DEFAULT NULL,
  `importe` decimal(20,6) NOT NULL,
  `precio_unitario` decimal(20,6) NOT NULL,
  `CODE_NULL` varchar(10) DEFAULT NULL,
  `STOCK_SOBRANTE` int(11) NOT NULL,
  `PORC_IGV` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `document`
--

CREATE TABLE `document` (
  `ID_DOC` int(11) NOT NULL,
  `URLVIST` varchar(100) DEFAULT NULL,
  `URLEMI` varchar(100) DEFAULT NULL,
  `MONEDA` varchar(20) DEFAULT NULL,
  `IGV` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `email_backup`
--

CREATE TABLE `email_backup` (
  `id` int(11) NOT NULL,
  `EMAIL` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `empresa_transporte`
--

CREATE TABLE `empresa_transporte` (
  `ID` int(11) NOT NULL,
  `RUC` varchar(50) NOT NULL,
  `NOMBRE_EMPRESA` varchar(70) NOT NULL,
  `DIRECCION` text DEFAULT NULL,
  `ALIAS_DONDE` varchar(250) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `gastos`
--

CREATE TABLE `gastos` (
  `CODIGO_GASTO` int(11) NOT NULL,
  `CODIGO_ITEM` int(11) NOT NULL,
  `MONTO_GASTO` decimal(15,2) NOT NULL,
  `FECHA_GASTO` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `CAJA` varchar(50) NOT NULL,
  `OBSERVACION_GASTO` text NOT NULL,
  `FORMA_PAGO` varchar(50) DEFAULT NULL,
  `MONTO_DEUDA` decimal(15,2) DEFAULT NULL,
  `TIPO` varchar(50) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `guia_remision`
--

CREATE TABLE `guia_remision` (
  `ID` int(11) NOT NULL,
  `DOCUMENTO_CLIENTE` varchar(100) DEFAULT NULL,
  `RUC_CLIENTE` varchar(50) DEFAULT NULL,
  `DIRECCION_CLIENTE` varchar(255) DEFAULT NULL,
  `DIRECCION_SALIDA` varchar(255) DEFAULT NULL,
  `DIRECCION_DESTINO` varchar(255) DEFAULT NULL,
  `FECHA_DE_EMISION` date DEFAULT NULL,
  `MOTIVO_TRASLADO` varchar(255) DEFAULT NULL,
  `FECHA_TRASLADO` date DEFAULT NULL,
  `DOCUMENTO_TRANSPORTISTA` varchar(100) DEFAULT NULL,
  `NRO_DOCUMENTO_TRANSPORTISTA` varchar(50) DEFAULT NULL,
  `TIPO_DOCUMENTO_CONDUCTOR` varchar(50) DEFAULT NULL,
  `NRO_DOCUMENTO_CONDUCTOR` varchar(50) DEFAULT NULL,
  `NOMBRE_CONDUCTOR` varchar(100) DEFAULT NULL,
  `TIPO_DE_TRANSPORTE` varchar(100) DEFAULT NULL,
  `SERIE` varchar(20) DEFAULT NULL,
  `EMAIL_CLIENTE` varchar(20) DEFAULT NULL,
  `CODIGO_VENTA` int(11) DEFAULT NULL,
  `CODIGO_USUARIO` int(11) DEFAULT NULL,
  `NUMERACION` varchar(7) DEFAULT NULL,
  `TIPO_DOCUMENTO` varchar(50) DEFAULT NULL,
  `STATUS` varchar(50) DEFAULT NULL,
  `ID_SEDE` int(11) NOT NULL,
  `FECHA_EMISION_GUIA` date NOT NULL,
  `NOMBRE_CLIENTE` varchar(150) NOT NULL,
  `NOMBRE_TRANSPORTISTA` varchar(200) NOT NULL,
  `UBIGEO_PARTIDA` int(6) UNSIGNED ZEROFILL DEFAULT NULL,
  `UBIGEO_LLEGADA` int(6) UNSIGNED ZEROFILL DEFAULT NULL,
  `MODALIDAD_DE_TRANSPORTE` varchar(50) DEFAULT NULL,
  `PESO` text DEFAULT NULL,
  `BULTOS` text DEFAULT NULL,
  `SERIE_NUMERACION` text DEFAULT NULL,
  `PLACA_VEHICULO` text DEFAULT NULL,
  `OBSERVACION` text DEFAULT NULL,
  `ID_AUDITORIA` int(11) DEFAULT 0
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `interprise`
--

CREATE TABLE `interprise` (
  `ID_INTERPRISE` int(11) NOT NULL,
  `RAZONCOMERCE` varchar(100) DEFAULT NULL,
  `NAMECOMERCE` varchar(100) DEFAULT NULL,
  `RUC` varchar(11) DEFAULT NULL,
  `ADRESS` varchar(50) DEFAULT NULL,
  `CELLPHONE` varchar(30) DEFAULT NULL,
  `EMAIL` varchar(20) DEFAULT NULL,
  `LOGO` varchar(100) DEFAULT NULL,
  `DESCRIPTION` varchar(80) DEFAULT NULL,
  `WELCOME` varchar(9) DEFAULT NULL,
  `GROUP_PRODUCT` enum('0','1') NOT NULL DEFAULT '0' COMMENT '0:DESAGRUPADO, 1:AGRUPADO',
  `logo_tipo` varchar(200) NOT NULL,
  `TIPO_IMPRESORA` enum('TICKET','IMPRESORA') DEFAULT NULL COMMENT 'TICKET,IMPRESORA',
  `ALMACEN` enum('SI','NO') DEFAULT NULL COMMENT 'SI,NO',
  `LETRA_LOGO` enum('SI','NO') DEFAULT NULL COMMENT 'SI,NO',
  `FORMATO_FACTURA` varchar(100) NOT NULL,
  `TIPO_IMAGEN` varchar(50) NOT NULL,
  `FECHA_RENOVACION` date NOT NULL,
  `MONTO_RENOVACION` decimal(15,2) NOT NULL,
  `ESTATUS_RENOVACION` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `inventario`
--

CREATE TABLE `inventario` (
  `CODIGO_INVENTARIO` int(11) NOT NULL,
  `CODIGO_PRODUCTO` int(11) NOT NULL,
  `FECHA_REGISTRO` timestamp NOT NULL DEFAULT current_timestamp(),
  `CANTIDAD` int(11) NOT NULL,
  `PRECIO` decimal(10,2) NOT NULL,
  `ESTADO` varchar(10) NOT NULL DEFAULT 'ABIERTO'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `items_gastos`
--

CREATE TABLE `items_gastos` (
  `CODIGO_ITEM` int(11) NOT NULL,
  `DESCRIPCION` varchar(100) NOT NULL,
  `TIPO_GASTOS` varchar(50) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `lista_pedidos`
--

CREATE TABLE `lista_pedidos` (
  `ID` int(11) NOT NULL,
  `CODIGO_PEDIDO` varchar(255) DEFAULT NULL,
  `DESCRIPCION_MEDIDA` varchar(255) DEFAULT NULL,
  `FECHA` date DEFAULT NULL,
  `CON_FUNDA` varchar(255) DEFAULT NULL,
  `SIN_FUNDA` varchar(255) DEFAULT NULL,
  `CONTENEDOR` varchar(255) DEFAULT NULL,
  `MES_1` varchar(255) DEFAULT NULL,
  `MES_2` varchar(255) DEFAULT NULL,
  `MES_3` varchar(255) DEFAULT NULL,
  `MES_4` varchar(255) DEFAULT NULL,
  `MES_5` varchar(255) DEFAULT NULL,
  `CODIGO_PROVEEDOR` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `marca`
--

CREATE TABLE `marca` (
  `CODIGO_MARCA` int(11) NOT NULL,
  `DESCRIPCION` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Volcado de datos para la tabla `marca`
--

INSERT INTO `marca` (`CODIGO_MARCA`, `DESCRIPCION`) VALUES
(2, 'VARIOS'),
(3, 'PRO FIT'),
(4, 'S/MARCA'),
(5, 'MAX SPORT'),
(6, 'SANTOLEE'),
(7, 'MUH ALI'),
(8, 'SIN MARCA'),
(9, 'MAX-SPORT'),
(10, 'PRO-FIT');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `nota_ventas`
--

CREATE TABLE `nota_ventas` (
  `CODIGO_NOTA_VENTA` int(11) NOT NULL,
  `CODIGO_DOCUMENTO` int(11) NOT NULL,
  `CODIGO_VENTA` int(11) NOT NULL,
  `SERIE_NOTA` varchar(4) NOT NULL,
  `NUMERACION_NOTA` varchar(7) NOT NULL,
  `FECHA_EMISION` datetime NOT NULL,
  `TYPO_NOTA` int(11) NOT NULL,
  `OBSERVACIONES` longtext DEFAULT NULL,
  `PORCE_DESC` decimal(10,4) DEFAULT NULL,
  `OTRS_CARGOS` decimal(10,4) DEFAULT NULL,
  `TOTAL_ANTES` decimal(20,6) NOT NULL,
  `TOTAL_DESPUES` decimal(20,6) NOT NULL,
  `ESTADO` varchar(45) NOT NULL DEFAULT 'ACTIVO',
  `IMPORTE` decimal(10,4) NOT NULL,
  `IGV` decimal(10,4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `numeracion_guia`
--

CREATE TABLE `numeracion_guia` (
  `ID` int(11) NOT NULL,
  `NRO_GUIA` varchar(7) NOT NULL,
  `ID_GUIA` int(11) NOT NULL,
  `TIPO_DOCUMENTO` varchar(50) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `parametros`
--

CREATE TABLE `parametros` (
  `CODIGO_PARAMETRO` int(11) NOT NULL,
  `SEDES` varchar(100) NOT NULL,
  `NOMBRE_PARAMETRO` varchar(100) NOT NULL,
  `TIPO_PARAMETRO` varchar(100) NOT NULL,
  `OPCIONES_PARAMETRO` text NOT NULL,
  `PARAMETRO` varchar(100) NOT NULL,
  `DESCRIPCION` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `perfil`
--

CREATE TABLE `perfil` (
  `CODIGO_PERFIL` int(11) NOT NULL,
  `DESCRIPCION` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Volcado de datos para la tabla `perfil`
--

INSERT INTO `perfil` (`CODIGO_PERFIL`, `DESCRIPCION`) VALUES
(1, 'ADMINISTRADOR'),
(2, 'CAJERO'),
(3, 'MESERO');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `perfil_recurso`
--

CREATE TABLE `perfil_recurso` (
  `CODIGO_PERFIL_RECURSO` int(11) NOT NULL,
  `CODIGO_PERFIL` int(11) NOT NULL,
  `CODIGO_RECURSO` int(11) NOT NULL,
  `CONSULTAR` int(11) DEFAULT NULL,
  `AGREGAR` int(11) DEFAULT NULL,
  `EDITAR` int(11) DEFAULT NULL,
  `ELIMINAR` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `presentacion`
--

CREATE TABLE `presentacion` (
  `CODIGO_PRESENTACION` int(11) NOT NULL,
  `DESCRIPCION` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Volcado de datos para la tabla `presentacion`
--

INSERT INTO `presentacion` (`CODIGO_PRESENTACION`, `DESCRIPCION`) VALUES
(1, '1');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `producto`
--

CREATE TABLE `producto` (
  `CODIGO_PRODUCTO` int(11) NOT NULL,
  `CODIGO_CATEGORIA` int(11) NOT NULL,
  `CODIGO_PRESENTACION` int(11) NOT NULL,
  `CODIGO_MARCA` int(11) NOT NULL,
  `CODIGO_BARRA` varchar(35) NOT NULL,
  `DESCRIPCION` varchar(250) NOT NULL,
  `UNIDAD_MEDIDA` varchar(50) NOT NULL,
  `STOCK_MINIMO` int(11) NOT NULL,
  `STOCK` decimal(11,2) NOT NULL,
  `PRECIO_COMPRA` decimal(10,4) NOT NULL,
  `PRECIO` decimal(10,4) NOT NULL,
  `PRECIO_COSTO` decimal(10,4) NOT NULL,
  `ESTADO` varchar(10) NOT NULL DEFAULT 'Activo',
  `PROCEDENCIA` int(11) DEFAULT NULL,
  `CODIGO_ALMACEN` int(11) NOT NULL,
  `ZONA_FRANCA` varchar(10) NOT NULL DEFAULT 'NO',
  `MONEY` varchar(30) NOT NULL,
  `TIPO_CAMBIO` decimal(10,4) NOT NULL,
  `CODIGO_EXPORTACION` varchar(30) NOT NULL,
  `TALLA` int(11) DEFAULT NULL,
  `CODIGO_REFERENCIA` varchar(50) DEFAULT NULL,
  `cta_ingreso` int(11) NOT NULL,
  `cta_igv` int(11) NOT NULL,
  `cta_cobrar` int(11) NOT NULL,
  `otros_tributos` int(11) NOT NULL,
  `amarre_1` int(11) NOT NULL,
  `amarre_2` int(11) NOT NULL,
  `amarre_3` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Volcado de datos para la tabla `producto`
--

INSERT INTO `producto` (`CODIGO_PRODUCTO`, `CODIGO_CATEGORIA`, `CODIGO_PRESENTACION`, `CODIGO_MARCA`, `CODIGO_BARRA`, `DESCRIPCION`, `UNIDAD_MEDIDA`, `STOCK_MINIMO`, `STOCK`, `PRECIO_COMPRA`, `PRECIO`, `PRECIO_COSTO`, `ESTADO`, `PROCEDENCIA`, `CODIGO_ALMACEN`, `ZONA_FRANCA`, `MONEY`, `TIPO_CAMBIO`, `CODIGO_EXPORTACION`, `TALLA`, `CODIGO_REFERENCIA`, `cta_ingreso`, `cta_igv`, `cta_cobrar`, `otros_tributos`, `amarre_1`, `amarre_2`, `amarre_3`) VALUES
(1, 2, 1, 2, 'RDO-A', 'RUEDA ACRILICA', 'NIU', 10, '33.00', '18.4400', '18.4400', '16.7600', 'Activo', NULL, 2, 'NO', 'S/', '0.0000', '', NULL, '', 0, 0, 0, 0, 0, 0, 0),
(2, 3, 1, 2, 'AB-TOM', 'APARATO ABDOMINAL AB TOMMY', 'NIU', 10, '10.00', '92.1900', '92.1900', '83.8100', 'Activo', NULL, 2, 'NO', 'S/', '0.0000', '', NULL, '', 0, 0, 0, 0, 0, 0, 0),
(3, 3, 1, 2, 'TOL-MW', 'TOTAL MIVAN SOLO', 'NIU', 10, '8.00', '239.5100', '239.5100', '217.7400', 'Activo', NULL, 2, 'NO', 'S/', '0.0000', '', NULL, '', 0, 0, 0, 0, 0, 0, 0),
(4, 3, 1, 3, 'EVOL-8', 'APARATO DE EJERCICIO EVOL-8', 'SET', 10, '1.00', '190.5500', '190.5500', '173.2300', 'Activo', NULL, 2, 'NO', 'S/', '0.0000', '', NULL, '', 0, 0, 0, 0, 0, 0, 0),
(5, 3, 1, 3, 'XT-5', 'APARATO DE EJERCICIO XT-5', 'NIU', 10, '4.00', '97.7000', '97.7000', '88.8200', 'Activo', NULL, 2, 'NO', 'S/', '0.0000', '', NULL, '', 0, 0, 0, 0, 0, 0, 0),
(6, 3, 1, 4, '1030004', 'MAQUINA TOTAL VERDE BLACK FIT', 'NIU', 10, '19.00', '991.6300', '991.6300', '901.4800', 'Activo', NULL, 2, 'NO', 'S/', '0.0000', '', NULL, '', 0, 0, 0, 0, 0, 0, 0),
(7, 3, 1, 3, 'XTREM-6', 'TOTAL XTREME XTREM-6', 'NIU', 10, '28.00', '97.7000', '97.7000', '88.8200', 'Activo', NULL, 2, 'NO', 'S/', '0.0000', '', NULL, '', 0, 0, 0, 0, 0, 0, 0),
(8, 2, 1, 5, '20  KG', 'CHALECO CON PESO 20KG MAX SPORT', 'NIU', 10, '5.00', '118.5600', '118.5600', '107.7800', 'Activo', NULL, 2, 'NO', 'S/', '0.0000', '', NULL, '', 0, 0, 0, 0, 0, 0, 0),
(9, 2, 1, 5, '10KG', 'CHALECO CON PESO 10KG MAX SPORT', 'NIU', 10, '7.00', '131.5500', '131.5500', '119.5900', 'Activo', NULL, 2, 'NO', 'S/', '0.0000', '', NULL, '', 0, 0, 0, 0, 0, 0, 0),
(10, 2, 1, 2, 'C001', 'CORREA CUERO S', 'NIU', 10, '40.00', '25.1500', '25.1500', '22.8600', 'Activo', NULL, 2, 'NO', 'S/', '0.0000', '', NULL, '', 0, 0, 0, 0, 0, 0, 0),
(11, 2, 1, 2, 'C002', 'CORREA CUERO M', 'NIU', 10, '20.00', '25.1500', '25.1500', '22.8600', 'Activo', NULL, 2, 'NO', 'S/', '0.0000', '', NULL, '', 0, 0, 0, 0, 0, 0, 0),
(12, 2, 1, 2, 'C003', 'CORREA CUERO L', 'NIU', 10, '13.00', '25.1500', '25.1500', '22.8600', 'Activo', NULL, 2, 'NO', 'S/', '0.0000', '', NULL, '', 0, 0, 0, 0, 0, 0, 0),
(13, 2, 1, 2, 'C004', 'CORREA CUERO XL', 'NIU', 10, '17.00', '25.1500', '25.1500', '22.8600', 'Activo', NULL, 2, 'NO', 'S/', '0.0000', '', NULL, '', 0, 0, 0, 0, 0, 0, 0),
(14, 2, 1, 4, '2040002', 'BANDA DE TELA', 'NIU', 10, '121.00', '54.4600', '54.4600', '49.5100', 'Activo', NULL, 2, 'NO', 'S/', '0.0000', '', NULL, '', 0, 0, 0, 0, 0, 0, 0),
(15, 2, 1, 2, 'C005', 'MINI BANDAS,PQTE 5', 'NIU', 10, '101.00', '27.5900', '27.5900', '25.0800', 'Activo', NULL, 2, 'NO', 'S/', '0.0000', '', NULL, '', 0, 0, 0, 0, 0, 0, 0),
(16, 2, 1, 2, 'C006', 'RODILLERA GEL', 'NIU', 10, '31.00', '21.7900', '21.7900', '19.8100', 'Activo', NULL, 2, 'NO', 'S/', '0.0000', '', NULL, '', 0, 0, 0, 0, 0, 0, 0),
(17, 2, 1, 2, 'B001', 'RODILLERA DE POTENCIA', 'NIU', 10, '6.00', '16.7600', '16.7600', '15.2400', 'Activo', NULL, 2, 'NO', 'S/', '0.0000', '', NULL, '', 0, 0, 0, 0, 0, 0, 0),
(18, 2, 1, 2, 'DM-8800', 'RODILLERA CON GEL DM-8800', 'NIU', 10, '121.00', '6.1800', '6.1800', '5.6200', 'Activo', NULL, 2, 'NO', 'S/', '0.0000', '', NULL, '', 0, 0, 0, 0, 0, 0, 0),
(19, 2, 1, 2, 'DM-1852', 'MUÑEQUERA DM-1852', 'NIU', 10, '151.00', '2.5600', '2.5600', '2.3300', 'Activo', NULL, 2, 'NO', 'S/', '0.0000', '', NULL, '', 0, 0, 0, 0, 0, 0, 0),
(20, 2, 1, 2, 'DM-1863', 'FAJA DIMAM DM-1863', 'NIU', 10, '63.00', '11.5100', '11.5100', '10.4600', 'Activo', NULL, 2, 'NO', 'S/', '0.0000', '', NULL, '', 0, 0, 0, 0, 0, 0, 0),
(21, 2, 1, 2, 'DM-1812', 'RODILLERA DIMAN DM-1814', 'NIU', 10, '64.00', '2.3100', '2.3100', '2.1000', 'Activo', NULL, 2, 'NO', 'S/', '0.0000', '', NULL, '', 0, 0, 0, 0, 0, 0, 0),
(22, 2, 1, 2, 'DM- 1812', 'TOBILLERA  DIMAM DM-1812', 'NIU', 10, '61.00', '2.2700', '2.2700', '2.0600', 'Activo', NULL, 2, 'NO', 'S/', '0.0000', '', NULL, '', 0, 0, 0, 0, 0, 0, 0),
(23, 2, 1, 2, 'DM-1834', 'PROTECTOR DM-1834', 'NIU', 10, '61.00', '6.4800', '6.4800', '5.8900', 'Activo', NULL, 2, 'NO', 'S/', '0.0000', '', NULL, '', 0, 0, 0, 0, 0, 0, 0),
(24, 2, 1, 2, 'B002', 'ASIENTO DE BICICCLETA', 'NIU', 10, '25.00', '24.8600', '24.8600', '22.6000', 'Activo', NULL, 2, 'NO', 'S/', '0.0000', '', NULL, '', 0, 0, 0, 0, 0, 0, 0),
(25, 2, 1, 2, 'B003', 'FAJA DE HOMBRE', 'NIU', 10, '56.00', '9.2200', '9.2200', '8.3800', 'Activo', NULL, 2, 'NO', 'S/', '0.0000', '', NULL, '', 0, 0, 0, 0, 0, 0, 0),
(26, 2, 1, 5, '1-20MT', 'COLCHONETA CUERINA 1.20MT', 'NIU', 10, '21.00', '60.2100', '60.2100', '54.7400', 'Activo', NULL, 2, 'NO', 'S/', '0.0000', '', NULL, '', 0, 0, 0, 0, 0, 0, 0),
(27, 2, 1, 5, '1MT', 'COLCHONETA CUERINA 1MT', 'NIU', 10, '7.00', '28.2600', '28.2600', '25.6900', 'Activo', NULL, 2, 'NO', 'S/', '0.0000', '', NULL, '', 0, 0, 0, 0, 0, 0, 0),
(28, 2, 1, 5, '198', 'COLCHONETA OXFORD 1.50MT', 'NIU', 10, '25.00', '52.4700', '52.4700', '47.7000', 'Activo', NULL, 2, 'NO', 'S/', '0.0000', '', NULL, '', 0, 0, 0, 0, 0, 0, 0),
(29, 2, 1, 5, '150MT', 'COLCHONETA CUERINA 1.50MT', 'NIU', 10, '13.00', '53.1100', '53.1100', '48.2800', 'Activo', NULL, 2, 'NO', 'S/', '0.0000', '', NULL, '', 0, 0, 0, 0, 0, 0, 0),
(30, 2, 1, 5, '120MT', 'COLCHONETA OXFORD 1.20MT', 'NIU', 10, '9.00', '70.1600', '70.1600', '63.7800', 'Activo', NULL, 2, 'NO', 'S/', '0.0000', '', NULL, '', 0, 0, 0, 0, 0, 0, 0),
(31, 2, 1, 2, '2060014', 'COLCHONETA ENROLLABLE', 'NIU', 10, '12.00', '64.3000', '64.3000', '58.4500', 'Activo', NULL, 2, 'NO', 'S/', '0.0000', '', NULL, '', 0, 0, 0, 0, 0, 0, 0),
(32, 2, 1, 5, 'B004', 'STEP AEROBIC NACIONAL', 'NIU', 10, '20.00', '18.5500', '18.5500', '16.8600', 'Activo', NULL, 2, 'NO', 'S/', '0.0000', '', NULL, '', 0, 0, 0, 0, 0, 0, 0),
(33, 2, 1, 2, '2070005', 'ACCESORIO DEPORTIVO', 'NIU', 10, '1.00', '18.5500', '18.5500', '16.8600', 'Activo', NULL, 2, 'NO', 'S/', '0.0000', '', NULL, '', 0, 0, 0, 0, 0, 0, 0),
(34, 2, 1, 2, 'B005', 'STEP DE GIMNASIO-EVERBEST', 'NIU', 10, '11.00', '40.2300', '40.2300', '36.5700', 'Activo', NULL, 2, 'NO', 'S/', '0.0000', '', NULL, '', 0, 0, 0, 0, 0, 0, 0),
(35, 2, 1, 2, 'B006', 'BALANZAS SMART', 'NIU', 10, '9.00', '75.9900', '75.9900', '69.0900', 'Activo', NULL, 2, 'NO', 'S/', '0.0000', '', NULL, '', 0, 0, 0, 0, 0, 0, 0),
(36, 2, 1, 2, 'B007', 'BALANZAS SMART CON DISEÑO', 'NIU', 10, '12.00', '78.9300', '78.9300', '71.7500', 'Activo', NULL, 2, 'NO', 'S/', '0.0000', '', NULL, '', 0, 0, 0, 0, 0, 0, 0),
(37, 2, 1, 2, '2110002', 'FAJA DE TRES PLIEGUES', 'NIU', 10, '13.00', '89.5400', '89.5400', '81.4000', 'Activo', NULL, 2, 'NO', 'S/', '0.0000', '', NULL, '', 0, 0, 0, 0, 0, 0, 0),
(38, 2, 1, 2, '2110003', 'PELOTAS 75', 'NIU', 10, '18.00', '110.4600', '110.4600', '100.4200', 'Activo', NULL, 2, 'NO', 'S/', '0.0000', '', NULL, '', 0, 0, 0, 0, 0, 0, 0),
(39, 2, 1, 2, 'B007', 'RULETAS TRAGO', 'NIU', 10, '1.00', '120.0700', '120.0700', '109.1500', 'Activo', NULL, 2, 'NO', 'S/', '0.0000', '', NULL, '', 0, 0, 0, 0, 0, 0, 0),
(40, 2, 1, 2, 'B008', 'CREMA REDUCTORA PIEL SENSIBLE', 'NIU', 10, '6.00', '65.1200', '65.1200', '59.2000', 'Activo', NULL, 2, 'NO', 'S/', '0.0000', '', NULL, '', 0, 0, 0, 0, 0, 0, 0),
(41, 2, 1, 2, '211000 2', 'FAJA DE AVISPA DEPORTIVA', 'NIU', 10, '12.00', '81.4000', '81.4000', '74.0000', 'Activo', NULL, 2, 'NO', 'S/', '0.0000', '', NULL, '', 0, 0, 0, 0, 0, 0, 0),
(42, 2, 1, 2, 'B009', 'ANCLAJE TRX', 'NIU', 10, '6.00', '23.4600', '23.4600', '21.3300', 'Activo', NULL, 2, 'NO', 'S/', '0.0000', '', NULL, '', 0, 0, 0, 0, 0, 0, 0),
(43, 2, 1, 5, '2130001', 'TOMA TODOS', 'NIU', 10, '118.00', '5.6500', '5.6500', '5.1400', 'Activo', NULL, 2, 'NO', 'S/', '0.0000', '', NULL, '', 0, 0, 0, 0, 0, 0, 0),
(44, 2, 1, 2, 'B010', 'ESCALADORA STEPPER', 'NIU', 10, '6.00', '137.9600', '137.9600', '125.4200', 'Activo', NULL, 2, 'NO', 'S/', '0.0000', '', NULL, '', 0, 0, 0, 0, 0, 0, 0),
(45, 2, 1, 2, 'B011', 'MASCARA TRANING MASK DEPORTIVA', 'NIU', 10, '16.00', '179.3600', '179.3600', '163.0500', 'Activo', NULL, 2, 'NO', 'S/', '0.0000', '', NULL, '', 0, 0, 0, 0, 0, 0, 0),
(46, 2, 1, 2, 'B012', 'TOMATODOS MANCUERNA', 'NIU', 10, '6.00', '7.5500', '7.5500', '6.8600', 'Activo', NULL, 2, 'NO', 'S/', '0.0000', '', NULL, '', 0, 0, 0, 0, 0, 0, 0),
(47, 4, 1, 4, '2140001', 'BARRA EXPANDIBLE', 'NIU', 10, '9.00', '33.9100', '33.9100', '30.8300', 'Activo', NULL, 2, 'NO', 'S/', '0.0000', '', NULL, '', 0, 0, 0, 0, 0, 0, 0),
(48, 2, 1, 4, '2150001', 'SOGA DE CROSFIT', 'NIU', 10, '5.00', '158.2800', '158.2800', '143.8900', 'Activo', NULL, 2, 'NO', 'S/', '0.0000', '', NULL, '', 0, 0, 0, 0, 0, 0, 0),
(49, 5, 1, 4, '2160001', 'VENDA DE BOX', 'NIU', 10, '19.00', '41.7100', '41.7100', '37.9200', 'Activo', NULL, 2, 'NO', 'S/', '0.0000', '', NULL, '', 0, 0, 0, 0, 0, 0, 0),
(50, 5, 1, 4, '216000 1', 'CADENA DE BOX', 'NIU', 10, '40.00', '51.7300', '51.7300', '47.0300', 'Activo', NULL, 2, 'NO', 'S/', '0.0000', '', NULL, '', 0, 0, 0, 0, 0, 0, 0),
(51, 2, 1, 2, 'B0013', 'POLO DAMA BLANCO UN / M', 'NIU', 10, '9.00', '4.4900', '4.4900', '4.0800', 'Activo', NULL, 2, 'NO', 'S/', '0.0000', '', NULL, '', 0, 0, 0, 0, 0, 0, 0),
(52, 2, 1, 2, 'B0014', 'MOCHILA CON SOGA //UN', 'NIU', 10, '15.00', '2.2400', '2.2400', '2.0400', 'Activo', NULL, 2, 'NO', 'S/', '0.0000', '', NULL, '', 0, 0, 0, 0, 0, 0, 0),
(53, 2, 1, 2, 'B0015', 'MOCHILA CON SOGA //FIT FEM DAMA', 'NIU', 10, '8.00', '2.2400', '2.2400', '2.0400', 'Activo', NULL, 2, 'NO', 'S/', '0.0000', '', NULL, '', 0, 0, 0, 0, 0, 0, 0),
(54, 2, 1, 2, 'B0016', 'SHORT HOMBRE NEGRO UN', 'NIU', 10, '4.00', '4.4900', '4.4900', '4.0800', 'Activo', NULL, 2, 'NO', 'S/', '0.0000', '', NULL, '', 0, 0, 0, 0, 0, 0, 0),
(55, 2, 1, 2, 'B0017', 'SHORT HOMBRE PLOMO UN', 'NIU', 10, '4.00', '4.4900', '4.4900', '4.0800', 'Activo', NULL, 2, 'NO', 'S/', '0.0000', '', NULL, '', 0, 0, 0, 0, 0, 0, 0),
(56, 2, 1, 2, 'B0018', 'TOMATODO 600ML//UN', 'NIU', 10, '24.00', '2.2400', '2.2400', '2.0400', 'Activo', NULL, 2, 'NO', 'S/', '0.0000', '', NULL, '', 0, 0, 0, 0, 0, 0, 0),
(57, 2, 1, 5, '2180001', 'ACEITE LUBRICANTE MARCA MAX SPORT 500 ML', 'NIU', 10, '72.00', '4.3000', '4.3000', '3.9100', 'Activo', NULL, 2, 'NO', 'S/', '0.0000', '', NULL, '', 0, 0, 0, 0, 0, 0, 0),
(58, 6, 1, 4, '4010003', 'BANCA CON PREDICADOR', 'NIU', 10, '7.00', '920.9200', '920.9200', '837.2000', 'Activo', NULL, 2, 'NO', 'S/', '0.0000', '', NULL, '', 0, 0, 0, 0, 0, 0, 0),
(59, 6, 1, 4, '4030003', 'BANCA MUTIFUNCIONAL PLOMA', 'NIU', 10, '8.00', '689.8300', '689.8300', '627.1200', 'Activo', NULL, 2, 'NO', 'S/', '0.0000', '', NULL, '', 0, 0, 0, 0, 0, 0, 0),
(60, 6, 1, 4, '4030004', 'BANCA CON RACK', 'NIU', 10, '2.00', '1407.2500', '1407.2500', '1279.3200', 'Activo', NULL, 2, 'NO', 'S/', '0.0000', '', NULL, '', 0, 0, 0, 0, 0, 0, 0),
(61, 6, 1, 2, 'BANC', 'BANCA ABDOMINAL EVERBEST', 'NIU', 10, '7.00', '214.7100', '214.7100', '195.1900', 'Activo', NULL, 2, 'NO', 'S/', '0.0000', '', NULL, '', 0, 0, 0, 0, 0, 0, 0),
(62, 4, 1, 4, '5010008', 'BARRA Z CROMADA', 'NIU', 10, '4.00', '73.4800', '73.4800', '66.8000', 'Activo', NULL, 2, 'NO', 'S/', '0.0000', '', NULL, '', 0, 0, 0, 0, 0, 0, 0),
(63, 7, 1, 5, 'DC-2', 'DISCOS CROMADOS DC-2.5KG', 'NIU', 10, '36.00', '11.1700', '11.1700', '10.1500', 'Activo', NULL, 2, 'NO', 'S/', '0.0000', '', NULL, '', 0, 0, 0, 0, 0, 0, 0),
(64, 7, 1, 5, 'DC-7', 'DISCOS CROMADOS DC-7.5KG', 'NIU', 10, '20.00', '33.4800', '33.4800', '30.4400', 'Activo', NULL, 2, 'NO', 'S/', '0.0000', '', NULL, '', 0, 0, 0, 0, 0, 0, 0),
(65, 8, 1, 6, '3KG', 'MANCUERNAS DE GOMA 3KG', 'NIU', 10, '10.00', '62.1700', '62.1700', '56.5200', 'Activo', NULL, 2, 'NO', 'S/', '0.0000', '', NULL, '', 0, 0, 0, 0, 0, 0, 0),
(66, 8, 1, 6, '4 KG', 'MANCUERNAS DE GOMA 4KG', 'NIU', 10, '10.00', '79.1300', '79.1300', '71.9400', 'Activo', NULL, 2, 'NO', 'S/', '0.0000', '', NULL, '', 0, 0, 0, 0, 0, 0, 0),
(67, 8, 1, 6, '5KG', 'MANCUERNAS DE GOMA 5KG', 'NIU', 10, '11.00', '96.1000', '96.1000', '87.3600', 'Activo', NULL, 2, 'NO', 'S/', '0.0000', '', NULL, '', 0, 0, 0, 0, 0, 0, 0),
(68, 8, 1, 5, 'MAX-15KG', 'MANCUERNAS DE MANO MAX-15KG', 'NIU', 10, '29.00', '83.3900', '83.3900', '75.8100', 'Activo', NULL, 2, 'NO', 'S/', '0.0000', '', NULL, '', 0, 0, 0, 0, 0, 0, 0),
(69, 8, 1, 5, 'MAX-20KG', 'MANCUERNAS DE MANO MAX-20KG', 'NIU', 10, '20.00', '108.2000', '108.2000', '98.3600', 'Activo', NULL, 2, 'NO', 'S/', '0.0000', '', NULL, '', 0, 0, 0, 0, 0, 0, 0),
(70, 8, 1, 5, 'MAX-30KG', 'MANCUERNAS DE MANO MAX-30KG', 'NIU', 10, '21.00', '156.3500', '156.3500', '142.1400', 'Activo', NULL, 2, 'NO', 'S/', '0.0000', '', NULL, '', 0, 0, 0, 0, 0, 0, 0),
(71, 8, 1, 4, '20KG', 'MANCUERNA CONVERTIBLE 20KG', 'NIU', 10, '19.00', '351.2900', '351.2900', '319.3500', 'Activo', NULL, 2, 'NO', 'S/', '0.0000', '', NULL, '', 0, 0, 0, 0, 0, 0, 0),
(72, 8, 1, 4, '20 KG', 'MALETA DE 20KG', 'NIU', 10, '10.00', '355.2700', '355.2700', '322.9700', 'Activo', NULL, 2, 'NO', 'S/', '0.0000', '', NULL, '', 0, 0, 0, 0, 0, 0, 0),
(73, 8, 1, 4, '50KG', 'MALETA DE 50KG', 'NIU', 10, '4.00', '793.3100', '793.3100', '721.1900', 'Activo', NULL, 2, 'NO', 'S/', '0.0000', '', NULL, '', 0, 0, 0, 0, 0, 0, 0),
(74, 8, 1, 4, '30 KG', 'MALETA DE 30KG', 'NIU', 10, '20.00', '482.8800', '482.8800', '438.9800', 'Activo', NULL, 2, 'NO', 'S/', '0.0000', '', NULL, '', 0, 0, 0, 0, 0, 0, 0),
(75, 8, 1, 4, '4KG', 'MANCUERNAS DE VINIL 4KG', 'NIU', 10, '10.00', '93.5300', '93.5300', '85.0300', 'Activo', NULL, 2, 'NO', 'S/', '0.0000', '', NULL, '', 0, 0, 0, 0, 0, 0, 0),
(76, 8, 1, 4, '30KG', 'MANCUERNA CONVERTIBLE 30KG', 'NIU', 10, '4.00', '247.2600', '247.2600', '224.7800', 'Activo', NULL, 2, 'NO', 'S/', '0.0000', '', NULL, '', 0, 0, 0, 0, 0, 0, 0),
(77, 8, 1, 2, 'B018', 'MANCUERNA EXAGONAL 10KG', 'NIU', 10, '4.00', '150.8700', '150.8700', '137.1500', 'Activo', NULL, 2, 'NO', 'S/', '0.0000', '', NULL, '', 0, 0, 0, 0, 0, 0, 0),
(78, 8, 1, 2, 'B019', 'MANCUERNA 3KG', 'NIU', 10, '9.00', '40.2300', '40.2300', '36.5700', 'Activo', NULL, 2, 'NO', 'S/', '0.0000', '', NULL, '', 0, 0, 0, 0, 0, 0, 0),
(79, 8, 1, 2, 'B020', 'MANCUERNA EXAGONAL 5 KG', 'NIU', 10, '1.00', '75.4400', '75.4400', '68.5800', 'Activo', NULL, 2, 'NO', 'S/', '0.0000', '', NULL, '', 0, 0, 0, 0, 0, 0, 0),
(80, 8, 1, 5, 'AW-2KG', 'PESAS DE ARENA AW-2KG', 'NIU', 10, '28.00', '6.7400', '6.7400', '6.1300', 'Activo', NULL, 2, 'NO', 'S/', '0.0000', '', NULL, '', 0, 0, 0, 0, 0, 0, 0),
(81, 8, 1, 5, 'AW-3KG', 'PESAS DE ARENA AW-3KG', 'NIU', 10, '22.00', '8.8800', '8.8800', '8.0800', 'Activo', NULL, 2, 'NO', 'S/', '0.0000', '', NULL, '', 0, 0, 0, 0, 0, 0, 0),
(82, 8, 1, 5, 'AW-4KG', 'PESAS DE ARENA AW-4KG', 'NIU', 10, '19.00', '11.6600', '11.6600', '10.6000', 'Activo', NULL, 2, 'NO', 'S/', '0.0000', '', NULL, '', 0, 0, 0, 0, 0, 0, 0),
(83, 8, 1, 2, 'B021', 'TOBILLERA CON PESO 1KG', 'NIU', 10, '23.00', '23.4700', '23.4700', '21.3400', 'Activo', NULL, 2, 'NO', 'S/', '0.0000', '', NULL, '', 0, 0, 0, 0, 0, 0, 0),
(84, 5, 1, 5, 'B022', 'SACO DE BOXEO NIÑO', 'NIU', 10, '3.00', '109.6300', '109.6300', '99.6600', 'Activo', NULL, 2, 'NO', 'S/', '0.0000', '', NULL, '', 0, 0, 0, 0, 0, 0, 0),
(85, 5, 1, 5, '1MTR', 'SACO DE BOXEO NEGRO 1MTR MAX  SPORT', 'NIU', 10, '7.00', '60.7600', '60.7600', '55.2400', 'Activo', NULL, 2, 'NO', 'S/', '0.0000', '', NULL, '', 0, 0, 0, 0, 0, 0, 0),
(86, 5, 1, 5, '120MTR', 'SACO DE BOXEO NEGRO 1.20MTR MAX  SPORT', 'NIU', 10, '8.00', '71.1300', '71.1300', '64.6600', 'Activo', NULL, 2, 'NO', 'S/', '0.0000', '', NULL, '', 0, 0, 0, 0, 0, 0, 0),
(87, 5, 1, 2, 'B0022', 'CABEZAL ADULTO BOXEO', 'NIU', 10, '3.00', '35.0800', '35.0800', '31.8900', 'Activo', NULL, 2, 'NO', 'S/', '0.0000', '', NULL, '', 0, 0, 0, 0, 0, 0, 0),
(88, 5, 1, 7, '12ONZ', 'GUANTES DE BOX MUHALI 12ONZ', 'NIU', 10, '8.00', '73.4800', '73.4800', '66.8000', 'Activo', NULL, 2, 'NO', 'S/', '0.0000', '', NULL, '', 0, 0, 0, 0, 0, 0, 0),
(89, 9, 1, 5, 'MXP-3400', 'BICICLETA ELIPTICA MXP-3400', 'NIU', 10, '7.00', '489.5300', '489.5300', '445.0300', 'Activo', NULL, 2, 'NO', 'S/', '0.0000', '', NULL, '', 0, 0, 0, 0, 0, 0, 0),
(90, 9, 1, 5, 'MXP-3000', 'BICICLETA ELIPTICA MXP-3000', 'NIU', 10, '9.00', '477.7800', '477.7800', '434.3400', 'Activo', NULL, 2, 'NO', 'S/', '0.0000', '', NULL, '', 0, 0, 0, 0, 0, 0, 0),
(91, 9, 1, 5, 'MXP-4000', 'BICICLETA ELIPTICA MXP-4000', 'SET', 10, '5.00', '444.6400', '444.6400', '404.2200', 'Activo', NULL, 2, 'NO', 'S/', '0.0000', '', NULL, '', 0, 0, 0, 0, 0, 0, 0),
(92, 9, 1, 5, 'MXP-4500', 'BICICLETA ELIPTICA MXP-4500', 'SET', 10, '4.00', '845.9300', '845.9300', '769.0300', 'Activo', NULL, 2, 'NO', 'S/', '0.0000', '', NULL, '', 0, 0, 0, 0, 0, 0, 0),
(93, 9, 1, 5, 'GT-25', 'BICILETA ELIPTICA GT-25', 'NIU', 10, '2.00', '670.5400', '670.5400', '609.5800', 'Activo', NULL, 2, 'NO', 'S/', '0.0000', '', NULL, '', 0, 0, 0, 0, 0, 0, 0),
(94, 10, 1, 3, 'F-2', 'CAMINADORA ELECTRICA F-2', 'NIU', 10, '15.00', '713.1400', '713.1400', '648.3100', 'Activo', NULL, 2, 'NO', 'S/', '0.0000', '', NULL, '', 0, 0, 0, 0, 0, 0, 0),
(95, 10, 1, 3, 'F-8', 'CAMINADORA ELECTRICA F-8', 'NIU', 10, '2.00', '1014.9900', '1014.9900', '922.7200', 'Activo', NULL, 2, 'NO', 'S/', '0.0000', '', NULL, '', 0, 0, 0, 0, 0, 0, 0),
(96, 10, 1, 5, 'K-5', 'CAMINADORA ELECTRICA K-5', 'NIU', 10, '9.00', '793.8800', '793.8800', '721.7100', 'Activo', NULL, 2, 'NO', 'S/', '0.0000', '', NULL, '', 0, 0, 0, 0, 0, 0, 0),
(97, 10, 1, 3, 'K-6', 'CAMINADORA ELECTRICA K-6', 'NIU', 10, '1.00', '885.9600', '885.9600', '805.4200', 'Activo', NULL, 2, 'NO', 'S/', '0.0000', '', NULL, '', 0, 0, 0, 0, 0, 0, 0),
(98, 10, 1, 5, 'MAX-2', 'CAMINADORA ELECTRICA MAX-2', 'NIU', 10, '17.00', '849.5000', '849.5000', '772.2700', 'Activo', NULL, 2, 'NO', 'S/', '0.0000', '', NULL, '', 0, 0, 0, 0, 0, 0, 0),
(99, 10, 1, 5, 'MAX-3', 'CAMINADORA ELECTRICA MAX-3', 'NIU', 10, '4.00', '502.2500', '502.2500', '456.5900', 'Activo', NULL, 2, 'NO', 'S/', '0.0000', '', NULL, '', 0, 0, 0, 0, 0, 0, 0),
(100, 10, 1, 5, 'MAX-5', 'CAMINADORA ELECTRICA MAX-5', 'NIU', 10, '6.00', '893.8400', '893.8400', '812.5800', 'Activo', NULL, 2, 'NO', 'S/', '0.0000', '', NULL, '', 0, 0, 0, 0, 0, 0, 0),
(101, 10, 1, 5, 'MAX-7', 'CAMINADORA ELECTRICA MAX-7', 'SET', 10, '2.00', '498.0100', '498.0100', '452.7400', 'Activo', NULL, 2, 'NO', 'S/', '0.0000', '', NULL, '', 0, 0, 0, 0, 0, 0, 0),
(102, 10, 1, 3, 'Z-2', 'CAMINADORA ELECTRICA Z-2', 'NIU', 10, '4.00', '489.1300', '489.1300', '441.9400', 'Activo', NULL, 2, 'NO', 'S/', '0.0000', '', NULL, '', 0, 0, 0, 0, 0, 0, 0),
(103, 11, 1, 2, 'B0023', 'SUPLEMENTO NITRO WHEY 1.200 G VAINILLA,CHOCOLATE,COOKIS,ETC', 'NIU', 10, '16.00', '60.8100', '60.8100', '55.2800', 'Activo', NULL, 2, 'NO', 'S/', '0.0000', '', NULL, '', 0, 0, 0, 0, 0, 0, 0),
(104, 11, 1, 2, 'B002', 'SUPLEMENTO NITRO WHEY 5.000 G VAINILLA,CHOCOLATE,COOKIS,ETC', 'NIU', 10, '6.00', '93.3800', '93.3800', '84.8900', 'Activo', NULL, 2, 'NO', 'S/', '0.0000', '', NULL, '', 0, 0, 0, 0, 0, 0, 0),
(105, 11, 1, 2, 'PRO-BCA', 'PRO BCAA 6000 400G FRUYTIPUNCH,NARANJA,MANZANA,ETC POTE', 'NIU', 10, '4.00', '23.5700', '23.5700', '21.4300', 'Activo', NULL, 2, 'NO', 'S/', '0.0000', '', NULL, '', 0, 0, 0, 0, 0, 0, 0),
(106, 11, 1, 2, 'B0024', 'BEST GAINER 2KG VAINILLA,CHOCOLATE,COOKIS,FRESA POTE', 'NIU', 10, '5.00', '20.2100', '20.2100', '18.3700', 'Activo', NULL, 2, 'NO', 'S/', '0.0000', '', NULL, '', 0, 0, 0, 0, 0, 0, 0),
(107, 11, 1, 2, 'B0025', 'BIGM  5.000 G VAINILLA,CHOCOLATE,FRESA Y COOKIES BOLSA', 'NIU', 10, '7.00', '259.1700', '259.1700', '235.6100', 'Activo', NULL, 2, 'NO', 'S/', '0.0000', '', NULL, '', 0, 0, 0, 0, 0, 0, 0),
(108, 11, 1, 2, 'B0054', 'BIGM CAJA 10 TOMAS VAINILLA,CHOCOLATE,FRESA Y COOKIES', 'NIU', 10, '7.00', '5.7800', '5.7800', '5.2500', 'Activo', NULL, 2, 'NO', 'S/', '0.0000', '', NULL, '', 0, 0, 0, 0, 0, 0, 0),
(109, 11, 1, 2, 'B0026', 'FEM BODY 1.500 G VAINILLA,CHOCOLATE Y FRESA DAMA//POTE', 'NIU', 10, '12.00', '25.2600', '25.2600', '22.9600', 'Activo', NULL, 2, 'NO', 'S/', '0.0000', '', NULL, '', 0, 0, 0, 0, 0, 0, 0),
(110, 11, 1, 2, 'B0027', 'FEM PRO 1.100KG VAINILLA,FRESA Y CHOCOLATE POTE DAMA', 'NIU', 10, '11.00', '23.5700', '23.5700', '21.4300', 'Activo', NULL, 2, 'NO', 'S/', '0.0000', '', NULL, '', 0, 0, 0, 0, 0, 0, 0),
(111, 11, 1, 2, '1101000 9', 'ISO WHEY 1.200 KG VAINILA,CHOCOLATE Y FRESA // POTE', 'NIU', 10, '9.00', '37.7100', '37.7100', '34.2800', 'Activo', NULL, 2, 'NO', 'S/', '0.0000', '', NULL, '', 0, 0, 0, 0, 0, 0, 0),
(112, 11, 1, 2, '11010009', 'ISO WHEY CAJA 10 SACHEST VAINILA,FRESA,CHOCOLATE', 'NIU', 10, '6.00', '12.5600', '12.5600', '11.4200', 'Activo', NULL, 2, 'NO', 'S/', '0.0000', '', NULL, '', 0, 0, 0, 0, 0, 0, 0),
(113, 11, 1, 2, 'B0028', 'COLLAGEN FEM 500G FRUTIPUNCH', 'NIU', 10, '6.00', '19.1100', '19.1100', '17.3700', 'Activo', NULL, 2, 'NO', 'S/', '0.0000', '', NULL, '', 0, 0, 0, 0, 0, 0, 0),
(114, 11, 1, 2, 'B0028', 'FIT MASS 2000G CHOCOLATE', 'NIU', 10, '6.00', '19.1100', '19.1100', '17.3700', 'Activo', NULL, 2, 'NO', 'S/', '0.0000', '', NULL, '', 0, 0, 0, 0, 0, 0, 0),
(115, 11, 1, 2, 'BIGM-2000G', 'BIGM 2000G VAINILLA', 'NIU', 10, '8.00', '47.9200', '47.9200', '43.5600', 'Activo', NULL, 2, 'NO', 'S/', '0.0000', '', NULL, '', 0, 0, 0, 0, 0, 0, 0),
(116, 11, 1, 2, 'BIGM-2000G', 'BIGM 2000G COOKIES', 'NIU', 10, '7.00', '52.0300', '52.0300', '47.3000', 'Activo', NULL, 2, 'NO', 'S/', '0.0000', '', NULL, '', 0, 0, 0, 0, 0, 0, 0),
(117, 11, 1, 2, 'BIGM-2000G', 'BIGM 2000G CHOCOLATE', 'NIU', 10, '5.00', '65.2100', '65.2100', '59.2800', 'Activo', NULL, 2, 'NO', 'S/', '0.0000', '', NULL, '', 0, 0, 0, 0, 0, 0, 0),
(118, 11, 1, 2, 'B0029', 'DIABULOS CAJA 28 SACHJETS MARACUYA', 'NIU', 10, '9.00', '9.1000', '9.1000', '8.2700', 'Activo', NULL, 2, 'NO', 'S/', '0.0000', '', NULL, '', 0, 0, 0, 0, 0, 0, 0),
(119, 11, 1, 2, 'FIT-2000G', 'FIT MASS 2000G  VAINILLA', 'NIU', 10, '6.00', '19.1100', '19.1100', '17.3700', 'Activo', NULL, 2, 'NO', 'S/', '0.0000', '', NULL, '', 0, 0, 0, 0, 0, 0, 0),
(120, 11, 1, 2, 'COLLAG', 'COLLAGEN FIT PACK X 15 BOTELLAS X 135ML BLUEBERRY', 'NIU', 10, '58.00', '10.4700', '10.4700', '9.5200', 'Activo', NULL, 2, 'NO', 'S/', '0.0000', '', NULL, '', 0, 0, 0, 0, 0, 0, 0),
(121, 11, 1, 2, 'XB-PIÑA', 'XB PACK X 15 BOTELLAS X 135 ML PIÑA', 'NIU', 10, '53.00', '11.0700', '11.0700', '10.0600', 'Activo', NULL, 2, 'NO', 'S/', '0.0000', '', NULL, '', 0, 0, 0, 0, 0, 0, 0),
(122, 11, 1, 2, 'XB-GU', 'XB PACK X 15 BOTELLAS X 135 ML GUARANA', 'NIU', 10, '18.00', '16.2300', '16.2300', '14.7500', 'Activo', NULL, 2, 'NO', 'S/', '0.0000', '', NULL, '', 0, 0, 0, 0, 0, 0, 0),
(123, 11, 1, 2, 'XB-BL', 'XB PACK X 15 BOTELLAS X 135 ML BLUEBERRY', 'NIU', 10, '60.00', '10.2900', '10.2900', '9.3500', 'Activo', NULL, 2, 'NO', 'S/', '0.0000', '', NULL, '', 0, 0, 0, 0, 0, 0, 0),
(124, 11, 1, 2, 'ISO WHEY 90', 'ISO WHEY 90 - 5.000 G VAINILLA,CHOCOLATE', 'NIU', 10, '6.00', '419.4500', '419.4500', '381.3200', 'Activo', NULL, 2, 'NO', 'S/', '0.0000', '', NULL, '', 0, 0, 0, 0, 0, 0, 0),
(125, 2, 1, 2, 'MVP124-11', 'TOMATODO 600ML UN // PROVINCIA MVP124-11', 'NIU', 10, '3.00', '35.0800', '35.0800', '31.8900', 'Activo', NULL, 2, 'NO', 'S/', '0.0000', '', NULL, '', 0, 0, 0, 0, 0, 0, 0),
(126, 2, 1, 9, 'RD-16CM', 'RUEDA ABDOMINAL RD-16CM MAX SPORT', 'NIU', 10, '20.00', '1.4800', '1.4800', '1.3500', 'Activo', NULL, 3, 'SI', '$', '3.8200', '', NULL, '', 0, 0, 0, 0, 0, 0, 0),
(127, 2, 1, 9, 'RD-20CM', 'RUEDA ABDOMINAL RD-20CM MAX SPORT', 'NIU', 10, '54.00', '1.6400', '1.6400', '1.4872', 'Activo', NULL, 3, 'SI', '$', '3.8200', '', NULL, '', 0, 0, 0, 0, 0, 0, 0),
(128, 2, 1, 9, 'RD-4D', 'RUEDA ABDOMINAL RD-4D MAX SPORT', 'NIU', 10, '17.00', '1.4300', '1.4300', '1.3000', 'Activo', NULL, 3, 'SI', '$', '3.8200', '', NULL, '', 0, 0, 0, 0, 0, 0, 0),
(129, 2, 1, 9, 'RD-18CM', 'RUEDA ABDOMINAL RD-18CM MAX SPORT', 'NIU', 10, '26.00', '1.3200', '1.3200', '1.2000', 'Activo', NULL, 3, 'SI', '$', '3.8200', '', NULL, '', 0, 0, 0, 0, 0, 0, 0),
(130, 2, 1, 9, 'RD-19CM', 'RUEDA ABDOMINAL RD-19CM MAX SPORT', 'NIU', 10, '40.00', '1.1000', '1.1000', '1.0000', 'Activo', NULL, 3, 'SI', '$', '3.8200', '', NULL, '', 0, 0, 0, 0, 0, 0, 0),
(131, 3, 1, 9, 'B0030', 'APARATO ABDOMINAL ABPOWER-02 MAX SPORT', 'NIU', 10, '1.00', '10.1200', '10.1200', '9.1970', 'Activo', NULL, 3, 'SI', '$', '3.8200', '', NULL, '', 0, 0, 0, 0, 0, 0, 0),
(132, 3, 1, 10, 'EVOL-7', 'APARATO DE EJERCICIO EVOL-7 PRO FIT', 'NIU', 10, '6.00', '33.0000', '33.0000', '30.0000', 'Activo', NULL, 3, 'SI', '$', '3.8200', '', NULL, '', 0, 0, 0, 0, 0, 0, 0),
(133, 3, 1, 10, 'EVOL-8', 'APARATO DE EJERCICIO EVOL-8', 'SET', 10, '5.00', '33.0000', '33.0000', '30.0000', 'Activo', NULL, 3, 'SI', '$', '3.8200', '', NULL, '', 0, 0, 0, 0, 0, 0, 0),
(134, 3, 1, 9, 'DMX-6000', 'MAQUINA ABDOMINAL DMX-6000 MAX SPORT', 'SET', 10, '5.00', '73.6200', '73.6200', '66.9289', 'Activo', NULL, 3, 'SI', '$', '3.8200', '', NULL, '', 0, 0, 0, 0, 0, 0, 0),
(135, 2, 1, 6, 'PG-2001G', 'CINTURON REDUCTOR-PG2001G SANTOLEE', 'NIU', 10, '2.00', '7.1500', '7.1500', '6.5000', 'Activo', NULL, 3, 'SI', '$', '3.8200', '', NULL, '', 0, 0, 0, 0, 0, 0, 0),
(136, 2, 1, 9, 'RP-12M', 'SOGA DE CROFITT RP-12M MAX SPORT', 'NIU', 10, '4.00', '9.9000', '9.9000', '9.0000', 'Activo', NULL, 3, 'SI', '$', '3.8200', '', NULL, '', 0, 0, 0, 0, 0, 0, 0),
(137, 2, 1, 9, 'RP-9M', 'SOGA DE CROSFITT RP-9M MAX SPORT', 'NIU', 10, '4.00', '9.0400', '9.0400', '8.2175', 'Activo', NULL, 3, 'SI', '$', '3.8200', '', NULL, '', 0, 0, 0, 0, 0, 0, 0),
(138, 2, 1, 10, 'BOZU-03', 'PELOTA BOZU BOZU-03 PRO FIT', 'NIU', 10, '5.00', '11.7000', '11.7000', '10.6400', 'Activo', NULL, 3, 'SI', '$', '3.8200', '', NULL, '', 0, 0, 0, 0, 0, 0, 0),
(139, 2, 1, 10, 'BOZU-04', 'PELOTA BOZU BOZU-04 PRO FIT', 'NIU', 10, '3.00', '11.7700', '11.7700', '10.7000', 'Activo', NULL, 3, 'SI', '$', '3.8200', '', NULL, '', 0, 0, 0, 0, 0, 0, 0),
(140, 2, 1, 9, 'BAN-05', 'BANDA DE RESISTENCIA BAN-05 MAX SPORT', 'NIU', 10, '74.00', '2.2400', '2.2400', '2.0391', 'Activo', NULL, 3, 'SI', '$', '3.8200', '', NULL, '', 0, 0, 0, 0, 0, 0, 0),
(141, 2, 1, 9, 'PAD-20', 'FUNDA PARA BARRA PAD-20 MAX SPORT', 'NIU', 10, '23.00', '1.2800', '1.2800', '1.1550', 'Activo', NULL, 3, 'SI', '$', '3.8200', '', NULL, '', 0, 0, 0, 0, 0, 0, 0),
(142, 2, 1, 9, 'MAT-15MM', 'COLCHONETA MAT-15MM MAX SPORT', 'NIU', 10, '38.00', '3.0900', '3.0900', '2.8063', 'Activo', NULL, 3, 'SI', '$', '3.8200', '', NULL, '', 0, 0, 0, 0, 0, 0, 0),
(143, 2, 1, 9, 'MAT-10MM', 'COLCHONETAS MAT-10MM MAX SPORT', 'NIU', 10, '25.00', '2.8400', '2.8400', '2.5800', 'Activo', NULL, 3, 'SI', '$', '3.8200', '', NULL, '', 0, 0, 0, 0, 0, 0, 0),
(144, 2, 1, 9, 'MAT-6M', 'COLCHONETAS MAT-6M MAX SPORT', 'NIU', 10, '24.00', '2.9500', '2.9500', '2.6840', 'Activo', NULL, 3, 'SI', '$', '3.8200', '', NULL, '', 0, 0, 0, 0, 0, 0, 0),
(145, 2, 1, 9, 'MAT-6MM2C', 'COLCHONETAS MAT-6MM MAX SPORT', 'NIU', 10, '36.00', '3.7700', '3.7700', '3.4347', 'Activo', NULL, 3, 'SI', '$', '3.8200', '', NULL, '', 0, 0, 0, 0, 0, 0, 0),
(146, 2, 1, 9, 'MAT-8MM2C', 'COLCHONETAS MAT-8MM2C MAX SPORT', 'NIU', 10, '11.00', '4.1500', '4.1500', '3.7697', 'Activo', NULL, 3, 'SI', '$', '3.8200', '', NULL, '', 0, 0, 0, 0, 0, 0, 0),
(147, 2, 1, 9, 'MAT-08 CM', 'COLCHONETAS MAT-08 CM MAX SPORT', 'UNID', 10, '24.00', '3.3000', '3.3000', '3.0000', 'Activo', NULL, 3, 'SI', '$', '3.8200', '', NULL, '', 0, 0, 0, 0, 0, 0, 0),
(148, 2, 1, 9, 'STEP-02', 'STEP AEROBIC STEP-02 MAX SPORT', 'UNID', 10, '4.00', '9.7500', '9.7500', '8.8554', 'Activo', NULL, 3, 'SI', '$', '3.8200', '', NULL, '', 0, 0, 0, 0, 0, 0, 0),
(149, 2, 1, 9, 'STEP-03', 'STEP AEROBIC STEP-03 MAX SPORT', 'UNID', 10, '2.00', '10.7400', '10.7400', '9.7616', 'Activo', NULL, 3, 'SI', '$', '3.8200', '', NULL, '', 0, 0, 0, 0, 0, 0, 0),
(150, 2, 1, 9, 'BL-03', 'BALANZA BL-03MAX SPORT', 'UNID', 10, '45.00', '1.6500', '1.6500', '1.5000', 'Activo', NULL, 3, 'SI', '$', '3.8200', '', NULL, '', 0, 0, 0, 0, 0, 0, 0),
(151, 2, 1, 9, 'BL-05', 'BALANZA BL-05MAX SPORT', 'UNID', 10, '40.00', '2.2000', '2.2000', '2.0000', 'Activo', NULL, 3, 'SI', '$', '3.8200', '', NULL, '', 0, 0, 0, 0, 0, 0, 0),
(152, 2, 1, 9, 'FIT-01', 'ACCESORIO FIT-01-MAX SPORT', 'UNID', 10, '3.00', '1.6500', '1.6500', '1.5000', 'Activo', NULL, 3, 'SI', '$', '3.8200', '', NULL, '', 0, 0, 0, 0, 0, 0, 0),
(153, 2, 1, 9, 'FIT-04', 'ACCESORIO FIT-04-MAX SPORT', 'UNID', 10, '16.00', '2.4000', '2.4000', '2.1800', 'Activo', NULL, 3, 'SI', '$', '3.8200', '', NULL, '', 0, 0, 0, 0, 0, 0, 0),
(154, 2, 1, 9, 'FIT-06', 'ACCESORIO FIT-06-MAX SPORT', 'UNID', 10, '9.00', '2.4000', '2.4000', '2.1800', 'Activo', NULL, 3, 'SI', '$', '3.8200', '', NULL, '', 0, 0, 0, 0, 0, 0, 0),
(155, 2, 1, 9, 'HG-04', 'HAND GRYPS HG-04 MAX SPORT', 'UNID', 10, '74.00', '0.4400', '0.4400', '0.4000', 'Activo', NULL, 3, 'SI', '$', '3.8200', '', NULL, '', 0, 0, 0, 0, 0, 0, 0),
(156, 2, 1, 9, 'RODLL-02', 'RODILLERA MAX SPORT RODLL-02', 'UNID', 10, '178.00', '0.3300', '0.3300', '0.3000', 'Activo', NULL, 3, 'SI', '$', '3.8200', '', NULL, '', 0, 0, 0, 0, 0, 0, 0),
(157, 2, 1, 9, 'FAJ-05', 'FAJA CON TIRANTE FAJ-05 MAX SPORT', 'UNID', 10, '120.00', '0.1300', '0.1300', '0.1200', 'Activo', NULL, 3, 'SI', '$', '3.8200', '', NULL, '', 0, 0, 0, 0, 0, 0, 0),
(158, 2, 1, 9, 'MA-3', 'ESCALERA P/ EJERCICIOS MA-3 MAX SPORT', 'UNID', 10, '14.00', '2.5300', '2.5300', '2.3000', 'Activo', NULL, 3, 'SI', '$', '3.8200', '', NULL, '', 0, 0, 0, 0, 0, 0, 0),
(159, 2, 1, 9, 'SP-02', 'SOPORTE PARA PLANCHAS SP-02 MAX SPORT', 'UNID', 10, '80.00', '0.5500', '0.5500', '0.5000', 'Activo', NULL, 3, 'SI', '$', '3.8200', '', NULL, '', 0, 0, 0, 0, 0, 0, 0),
(160, 2, 1, 9, 'HAND-10', 'HAND GRYPS  HAND-10', 'UNID', 10, '99.00', '0.5500', '0.5500', '0.5000', 'Activo', NULL, 3, 'SI', '$', '3.8200', '', NULL, '', 0, 0, 0, 0, 0, 0, 0),
(161, 5, 1, 9, 'CB-04', 'PROTECTOR PARA CABEZA CB-04 MAX SPORT', 'UNID', 10, '24.00', '1.1000', '1.1000', '1.0000', 'Activo', NULL, 3, 'SI', '$', '3.8200', '', NULL, '', 0, 0, 0, 0, 0, 0, 0),
(162, 2, 1, 9, 'CR-05', 'SOGA PARA SALTAR CR-05 MAX SPORT', 'UNID', 10, '100.00', '0.5500', '0.5500', '0.5000', 'Activo', NULL, 3, 'SI', '$', '3.8200', '', NULL, '', 0, 0, 0, 0, 0, 0, 0),
(163, 1, 1, 10, 'POWER-03', 'PLATAFORMA VIBRATORIA POWER-03 PRO FIT', 'UNID', 10, '27.00', '16.6800', '16.6800', '15.1632', 'Activo', NULL, 3, 'SI', '$', '3.8200', '', NULL, '', 0, 0, 0, 0, 0, 0, 0),
(164, 12, 1, 9, 'PRESS32', 'BANCA PARA PESAS PRESS-05 MAX SPORT', 'UNID', 10, '4.00', '27.5000', '27.5000', '25.0000', 'Activo', NULL, 3, 'SI', '$', '3.8200', '', NULL, '', 0, 0, 0, 0, 0, 0, 0),
(165, 13, 1, 9, 'PRESS-', 'PRENSADOR DE PIERNAS  PRE-20 MAX SPORT', 'UNID', 10, '2.00', '165.0000', '165.0000', '150.0000', 'Activo', NULL, 3, 'SI', '$', '3.8200', '', NULL, '', 0, 0, 0, 0, 0, 0, 0),
(166, 12, 1, 9, 'PRESS-03', 'BANCA PARA PESAS PRESS-03MAX SPORT', 'UNID', 10, '6.00', '22.0000', '22.0000', '20.0000', 'Activo', NULL, 3, 'SI', '$', '3.8200', '', NULL, '', 0, 0, 0, 0, 0, 0, 0),
(167, 12, 1, 9, 'PRESS-07', 'BANCA PARA PESAS PRESS-07 MAX SPORT', 'UNID', 10, '3.00', '27.5000', '27.5000', '25.0000', 'Activo', NULL, 3, 'SI', '$', '3.8200', '', NULL, '', 0, 0, 0, 0, 0, 0, 0),
(168, 3, 1, 9, 'SS-20', 'BANCA PARA PESAS SS-20 MAX SPORT', 'UNID', 10, '10.00', '13.2000', '13.2000', '12.0000', 'Activo', NULL, 3, 'SI', '$', '3.8200', '', NULL, '', 0, 0, 0, 0, 0, 0, 0),
(169, 12, 1, 9, 'BP-2200', 'BANCA RECTAS BP-2200 MAX SPORT', 'UNID', 10, '4.00', '16.5000', '16.5000', '15.0000', 'Activo', NULL, 3, 'SI', '$', '3.8200', '', NULL, '', 0, 0, 0, 0, 0, 0, 0),
(170, 12, 1, 9, 'BP-3000', 'BANCA ABDOMINAL BP-3000 MAX SPORT', 'UNID', 10, '1.00', '24.9200', '24.9200', '22.6518', 'Activo', NULL, 3, 'SI', '$', '3.8200', '', NULL, '', 0, 0, 0, 0, 0, 0, 0),
(171, 12, 1, 9, 'BP-4000', 'BANCA ABDOMINAL BP-4000 MAX SPORT', 'UNID', 10, '5.00', '19.8000', '19.8000', '18.0000', 'Activo', NULL, 3, 'SI', '$', '3.8200', '', NULL, '', 0, 0, 0, 0, 0, 0, 0),
(172, 4, 1, 9, 'BARM', 'BARRA DE METAL BARMC-14P MAX SPORT', 'UNID', 10, '32.00', '1.2200', '1.2200', '1.1143', 'Activo', NULL, 3, 'SI', '$', '3.8200', '', NULL, '', 0, 0, 0, 0, 0, 0, 0),
(173, 4, 1, 9, 'OLBAR-1', 'BARRA OLIMPICA OLBAR-1..50 MAX SPORT', 'UNID', 10, '15.00', '10.5900', '10.5900', '9.6250', 'Activo', NULL, 3, 'SI', '$', '3.8200', '', NULL, '', 0, 0, 0, 0, 0, 0, 0),
(174, 4, 1, 9, 'OLBARH', 'BARRA OLIMPICA ROMANA OLBARH-34P MAX SPORT', 'UNID', 10, '7.00', '12.5600', '12.5600', '11.4500', 'Activo', NULL, 3, 'SI', '$', '3.8200', '', NULL, '', 0, 0, 0, 0, 0, 0, 0),
(175, 4, 1, 9, 'OLBAR-2', 'BARRA OLMIPICA OLBAR-2.20 MAX SPORT', 'UNID', 10, '20.00', '16.7800', '16.7800', '15.2559', 'Activo', NULL, 3, 'SI', '$', '3.8200', '', NULL, '', 0, 0, 0, 0, 0, 0, 0),
(176, 4, 1, 9, 'BARSZ-1', 'BARRA SUPER Z BARSZ-1.2M MAX SPORT', 'UNID', 10, '12.00', '6.2300', '6.2300', '5.6600', 'Activo', NULL, 3, 'SI', '$', '3.8200', '', NULL, '', 0, 0, 0, 0, 0, 0, 0),
(177, 4, 1, 9, 'BARZ-1', 'BARRA Z BARZ-1.20M MAX SPORT', 'UNID', 10, '12.00', '5.9000', '5.9000', '5.3700', 'Activo', NULL, 3, 'SI', '$', '3.8200', '', NULL, '', 0, 0, 0, 0, 0, 0, 0),
(178, 4, 1, 9, 'BARR-1', 'BARRA RECTA BARR-1.50M MAX SPORT', 'UNID', 10, '13.00', '6.2600', '6.2600', '5.6863', 'Activo', NULL, 3, 'SI', '$', '3.8200', '', NULL, '', 0, 0, 0, 0, 0, 0, 0),
(179, 4, 1, 9, 'BARR-1.80M', 'BARRA RECTA BARR-1.80M MAX SPORT', 'UNID', 10, '17.00', '8.8000', '8.8000', '8.0000', 'Activo', NULL, 3, 'SI', '$', '3.8200', '', NULL, '', 0, 0, 0, 0, 0, 0, 0),
(180, 4, 1, 9, 'OLBARZ-1.20', 'BARRA OLIMPICA OLBARZ-1.20 MAX SPORT', 'UNID', 10, '8.00', '9.9000', '9.9000', '9.0000', 'Activo', NULL, 3, 'SI', '$', '3.8200', '', NULL, '', 0, 0, 0, 0, 0, 0, 0),
(181, 7, 1, 9, 'DOH-10KG', 'DISCO OLIMPICO ENGOMADO DOH-10KG', 'UNID', 10, '16.00', '11.8000', '11.8000', '10.7304', 'Activo', NULL, 3, 'SI', '$', '3.8200', '', NULL, '', 0, 0, 0, 0, 0, 0, 0),
(182, 7, 1, 9, 'DOH-15KG', 'DISCO OLIMPICO ENGOMADO DOH-15KG', 'UNID', 10, '2.00', '23.6000', '23.6000', '21.4527', 'Activo', NULL, 3, 'SI', '$', '3.8200', '', NULL, '', 0, 0, 0, 0, 0, 0, 0),
(183, 7, 1, 9, 'DOH-20KG', 'DISCO OLIMPICO ENGOMADO DOH-20KG', 'UNID', 10, '6.00', '25.8500', '25.8500', '23.5000', 'Activo', NULL, 3, 'SI', '$', '3.8200', '', NULL, '', 0, 0, 0, 0, 0, 0, 0),
(184, 7, 1, 9, 'DC-2.5KG', 'DISCOS CROMADOS DC-2.5KG MAX SPORT', 'UNID', 10, '19.00', '2.8300', '2.8300', '2.5700', 'Activo', NULL, 3, 'SI', '$', '3.8200', '', NULL, '', 0, 0, 0, 0, 0, 0, 0),
(185, 7, 1, 9, 'DC-7.5KG', 'DISCOS CROMADOS DC-7.5KG MAX SPORT', 'UNID', 10, '15.00', '4.5000', '4.5000', '4.0900', 'Activo', NULL, 3, 'SI', '$', '3.8200', '', NULL, '', 0, 0, 0, 0, 0, 0, 0),
(186, 7, 1, 9, 'DC-5KG', 'DISCOS CROMADOS DC-5KG MAX SPORT', 'UNID', 10, '20.00', '5.5000', '5.5000', '5.0000', 'Activo', NULL, 3, 'SI', '$', '3.8200', '', NULL, '', 0, 0, 0, 0, 0, 0, 0),
(187, 7, 1, 9, 'DC- 5KG', 'DISCOS CROMADOS DC-10 KG MAX SPORT', 'UNID', 10, '6.00', '11.0000', '11.0000', '10.0000', 'Activo', NULL, 3, 'SI', '$', '3.8200', '', NULL, '', 0, 0, 0, 0, 0, 0, 0),
(188, 7, 1, 9, 'DOH-2.5KG', 'DISCO OLIMPICO ENGOMADO DOH-2.5KG', 'UNID', 10, '18.00', '2.7500', '2.7500', '2.5000', 'Activo', NULL, 3, 'SI', '$', '3.8200', '', NULL, '', 0, 0, 0, 0, 0, 0, 0),
(189, 7, 1, 9, 'DOH-5KG', 'DISCO OLIMPICO ENGOMADO DOH-5KG', 'UNID', 10, '34.00', '5.5000', '5.5000', '5.0000', 'Activo', NULL, 3, 'SI', '$', '3.8200', '', NULL, '', 0, 0, 0, 0, 0, 0, 0),
(190, 8, 1, 9, 'MAX-15KG', 'MANCUERNA DE MANO MAX-15KG MAX SPORT', 'UNID', 10, '26.00', '16.5000', '16.5000', '15.0000', 'Activo', NULL, 3, 'SI', '$', '3.8200', '', NULL, '', 0, 0, 0, 0, 0, 0, 0),
(191, 8, 1, 9, 'MAX-20KG', 'MANCUERNA DE MANO MAX-20KG MAX SPORT', 'UNID', 10, '50.00', '21.7400', '21.7400', '19.7596', 'Activo', NULL, 3, 'SI', '$', '3.8200', '', NULL, '', 0, 0, 0, 0, 0, 0, 0),
(192, 8, 1, 9, 'MAX-50KG', 'MANCUERNA DE MANO MAX-50 KG MAX SPORT', 'UNID', 10, '3.00', '45.6500', '45.6500', '41.5024', 'Activo', NULL, 3, 'SI', '$', '3.8200', '', NULL, '', 0, 0, 0, 0, 0, 0, 0),
(193, 8, 1, 9, 'MAX-30KG', 'MANCUERNAS DE MANO MAX-30KG MAX SPORT', 'UNID', 10, '27.00', '35.5600', '35.5600', '32.3296', 'Activo', NULL, 3, 'SI', '$', '3.8200', '', NULL, '', 0, 0, 0, 0, 0, 0, 0),
(194, 8, 1, 9, 'MV-3KG', 'MANCUERNAS DE VINIL MV-3KG MAX SPORT', 'UNID', 10, '2.00', '1.1000', '1.1000', '1.0000', 'Activo', NULL, 3, 'SI', '$', '3.8200', '', NULL, '', 0, 0, 0, 0, 0, 0, 0),
(195, 8, 1, 9, 'MV-4KG', 'MANCUERNAS DE VINIL MV-4KG MAX SPORT', 'UNID', 10, '12.00', '1.6500', '1.6500', '1.5000', 'Activo', NULL, 3, 'SI', '$', '3.8200', '', NULL, '', 0, 0, 0, 0, 0, 0, 0),
(196, 8, 1, 9, 'MV-5KG', 'MANCUERNAS DE VINIL MV-5KG MAX SPORT', 'UNID', 10, '13.00', '4.4400', '4.4400', '4.0424', 'Activo', NULL, 3, 'SI', '$', '3.8200', '', NULL, '', 0, 0, 0, 0, 0, 0, 0),
(197, 8, 1, 9, 'SC-80016A', 'MANCUERNA DE MANO SC-80016A40KG', 'UNID', 10, '3.00', '16.5000', '16.5000', '15.0000', 'Activo', NULL, 3, 'SI', '$', '3.8200', '', NULL, '', 0, 0, 0, 0, 0, 0, 0),
(198, 8, 1, 9, 'SC-80016', 'MANCUERNA DE MANO SC-80016A30KG', 'UNID', 10, '10.00', '14.8500', '14.8500', '13.5000', 'Activo', NULL, 3, 'SI', '$', '3.8200', '', NULL, '', 0, 0, 0, 0, 0, 0, 0),
(199, 8, 1, 9, 'RD-16KG', 'MANCUERNA HEXAGONAL RD-16KG MAX SPORT', 'UNID', 10, '4.00', '14.3800', '14.3800', '13.0714', 'Activo', NULL, 3, 'SI', '$', '3.8200', '', NULL, '', 0, 0, 0, 0, 0, 0, 0),
(200, 8, 1, 9, 'RD-18KG', 'MANCUERNA HEXAGONAL RD-18KG MAX SPORT', 'UNID', 10, '2.00', '8.9900', '8.9900', '8.1667', 'Activo', NULL, 3, 'SI', '$', '3.8200', '', NULL, '', 0, 0, 0, 0, 0, 0, 0),
(201, 8, 1, 9, 'RD-20KG', 'MANCUERNA HEXAGONAL RD-20KG MAX SPORT', 'UNID', 10, '4.00', '9.9000', '9.9000', '9.0000', 'Activo', NULL, 3, 'SI', '$', '3.8200', '', NULL, '', 0, 0, 0, 0, 0, 0, 0),
(202, 8, 1, 9, 'RD-6KG', 'MANCUERNA HEXAGONAL RD-6KG MAX SPORT', 'UNID', 10, '4.00', '6.6000', '6.6000', '6.0000', 'Activo', NULL, 3, 'SI', '$', '3.8200', '', NULL, '', 0, 0, 0, 0, 0, 0, 0),
(203, 8, 1, 9, 'RD-8KG', 'MANCUERNA HEXAGONAL RD-8KG MAX SPORT', 'UNID', 10, '2.00', '8.8000', '8.8000', '8.0000', 'Activo', NULL, 3, 'SI', '$', '3.8200', '', NULL, '', 0, 0, 0, 0, 0, 0, 0),
(204, 8, 1, 9, 'RD-10KG', 'MANCUERNA HEXAGONAL RD-10KG MAX SPORT', 'UNID', 10, '2.00', '11.0000', '11.0000', '10.0000', 'Activo', NULL, 3, 'SI', '$', '3.8200', '', NULL, '', 0, 0, 0, 0, 0, 0, 0),
(205, 8, 1, 9, 'RD-12KG', 'MANCUERNA HEXAGONAL RD-12KG MAX SPORT', 'UNID', 10, '2.00', '13.2000', '13.2000', '12.0000', 'Activo', NULL, 3, 'SI', '$', '3.8200', '', NULL, '', 0, 0, 0, 0, 0, 0, 0),
(206, 8, 1, 9, 'AW-5KG', 'PESAS PARA TOBILLO AW-5KG MAX SPORT', 'UNID', 10, '20.00', '1.8150', '1.8150', '1.6500', 'Activo', NULL, 3, 'SI', '$', '3.8200', '', NULL, '', 0, 0, 0, 0, 0, 0, 0),
(207, 8, 1, 9, 'AW-6KG', 'PESAS PARA TOBILLO AW-6KG MAX SPORT', 'UNID', 10, '6.00', '2.3650', '2.3650', '2.1500', 'Activo', NULL, 3, 'SI', '$', '3.8200', '', NULL, '', 0, 0, 0, 0, 0, 0, 0),
(208, 8, 1, 9, 'AW-2KG', 'PESAS DE ARENA AW-2KG', 'UNID', 10, '2.00', '0.5500', '0.5500', '0.5000', 'Activo', NULL, 3, 'SI', '$', '3.8200', '', NULL, '', 0, 0, 0, 0, 0, 0, 0),
(209, 8, 1, 9, 'AW-4KG', 'PESAS DE ARENA AW-4KG', 'UNID', 10, '9.00', '0.6600', '0.6600', '0.6000', 'Activo', NULL, 3, 'SI', '$', '3.8200', '', NULL, '', 0, 0, 0, 0, 0, 0, 0),
(210, 8, 1, 9, 'AW-3KG', 'PESAS DE ARENA AW-3KG', 'UNID', 10, '23.00', '1.1000', '1.1000', '1.0000', 'Activo', NULL, 3, 'SI', '$', '3.8200', '', NULL, '', 0, 0, 0, 0, 0, 0, 0),
(211, 8, 1, 10, 'KET-6KG', 'PESAS RUSAS KET-6KG PRO FIT', 'UNID', 10, '12.00', '6.6000', '6.6000', '6.0000', 'Activo', NULL, 3, 'SI', '$', '3.8200', '', NULL, '', 0, 0, 0, 0, 0, 0, 0),
(212, 8, 1, 10, 'KET-4KG', 'PESAS RUSAS KET-4KG PRO FIT', 'UNID', 10, '7.00', '4.4000', '4.4000', '4.0000', 'Activo', NULL, 3, 'SI', '$', '3.8200', '', NULL, '', 0, 0, 0, 0, 0, 0, 0),
(213, 4, 1, 9, 'SP-200', 'SOPORTE DE BARRAS SP-200  MAX  SPORT', 'UNID', 10, '7.00', '14.6900', '14.6900', '13.3531', 'Activo', NULL, 3, 'SI', '$', '3.8200', '', NULL, '', 0, 0, 0, 0, 0, 0, 0),
(214, 4, 1, 9, 'GYM-10', 'BARRA DE PARED GYM-10 MAX SPORT', 'UNID', 10, '27.00', '12.6100', '12.6100', '11.4585', 'Activo', NULL, 3, 'SI', '$', '3.8200', '', NULL, '', 0, 0, 0, 0, 0, 0, 0),
(215, 4, 1, 9, 'GYM-20', 'BARRA MULTIFUNCIONAL GYM-20 MAX SPORT', 'UNID', 10, '7.00', '14.0600', '14.0600', '12.7785', 'Activo', NULL, 3, 'SI', '$', '3.8200', '', NULL, '', 0, 0, 0, 0, 0, 0, 0),
(216, 4, 1, 9, 'GYM-5', 'BARRA DE PARED GYM-5 MAX SPORT', 'UNID', 10, '30.00', '0.5500', '0.5500', '0.5000', 'Activo', NULL, 3, 'SI', '$', '3.8200', '', NULL, '', 0, 0, 0, 0, 0, 0, 0),
(217, 4, 1, 9, 'BAR-15P', 'UNION DE BARRA BAR-15P MAX SPORT', 'UNID', 10, '35.00', '1.6500', '1.6500', '1.5000', 'Activo', NULL, 3, 'SI', '$', '3.8200', '', NULL, '', 0, 0, 0, 0, 0, 0, 0),
(218, 5, 1, 9, 'BOX-50', 'SACO DE BOX CON BASE BOX-50 MAX SPORT', 'SET', 10, '4.00', '21.1400', '21.1400', '19.2249', 'Activo', NULL, 3, 'SI', '$', '3.8200', '', NULL, '', 0, 0, 0, 0, 0, 0, 0),
(219, 5, 1, 9, 'BOX- 50', 'SACO DE BOX CON BASE BOX-60 MAX SPORT', 'SET', 10, '3.00', '22.0000', '22.0000', '20.0000', 'Activo', NULL, 3, 'SI', '$', '3.8200', '', NULL, '', 0, 0, 0, 0, 0, 0, 0),
(220, 5, 1, 9, 'BOX-100', 'SACO DE BOX BOX-100  MAX SPORT', 'UNID', 10, '5.00', '11.0000', '11.0000', '10.0000', 'Activo', NULL, 3, 'SI', '$', '3.8200', '', NULL, '', 0, 0, 0, 0, 0, 0, 0),
(221, 5, 1, 9, 'BOX-80', 'SACO DE BOX BOX-80 MAX SPORT', 'UNID', 10, '5.00', '11.8800', '11.8800', '10.8000', 'Activo', NULL, 3, 'SI', '$', '3.8200', '', NULL, '', 0, 0, 0, 0, 0, 0, 0),
(222, 5, 1, 9, 'SPBOX-03', 'SOPORTE PARA BOXEO SPBOX-03 MAX SPORT', 'UNID', 10, '18.00', '5.3600', '5.3600', '4.8700', 'Activo', NULL, 3, 'SI', '$', '3.8200', '', NULL, '', 0, 0, 0, 0, 0, 0, 0),
(223, 5, 1, 9, 'GUANT-01', 'GUANTES DE BOX GUANT-01 MAX SPORT', 'UNID', 10, '401.00', '0.8800', '0.8800', '0.8016', 'Activo', NULL, 3, 'SI', '$', '3.8200', '', NULL, '', 0, 0, 0, 0, 0, 0, 0),
(224, 5, 1, 9, 'GUAT2BX', 'GUANTILLAS DE BOX GUANT2BX-8Z MAX SPORT', 'UNID', 10, '16.00', '2.2000', '2.2000', '2.0000', 'Activo', NULL, 3, 'SI', '$', '3.8200', '', NULL, '', 0, 0, 0, 0, 0, 0, 0),
(225, 5, 1, 9, 'T2BX-10Z', 'GUANTILLAS DE BOX GUANT2BX-10Z MAX SPORT', 'UNID', 10, '8.00', '2.2000', '2.2000', '2.0000', 'Activo', NULL, 3, 'SI', '$', '3.8200', '', NULL, '', 0, 0, 0, 0, 0, 0, 0),
(226, 5, 1, 9, 'GBX-12', 'GUANTILLAS DE BOX GUANT2BX-12 Z MAX SPORT', 'UNID', 10, '13.00', '2.2000', '2.2000', '2.0000', 'Activo', NULL, 3, 'SI', '$', '3.8200', '', NULL, '', 0, 0, 0, 0, 0, 0, 0),
(227, 5, 1, 9, 'G1BX-10Z', 'GUANTILLAS DE BOX GUANT1BX-10Z', 'UNID', 10, '9.00', '1.7800', '1.7800', '1.6200', 'Activo', NULL, 3, 'SI', '$', '3.8200', '', NULL, '', 0, 0, 0, 0, 0, 0, 0),
(228, 5, 1, 9, 'G12Z', 'GUANTILLAS DE BOX GUANT1BX-12Z', 'UNID', 10, '7.00', '1.7800', '1.7800', '1.6200', 'Activo', NULL, 3, 'SI', '$', '3.8200', '', NULL, '', 0, 0, 0, 0, 0, 0, 0),
(229, 5, 1, 9, 'NTLL-06', 'GUANTILLAS DE BOX  GUANTLL-06 MAX SPORT', 'UNID', 10, '67.00', '1.1000', '1.1000', '1.0000', 'Activo', NULL, 3, 'SI', '$', '3.8200', '', NULL, '', 0, 0, 0, 0, 0, 0, 0),
(230, 5, 1, 9, 'MNP-08', 'MANOPLA DE BOX MODELO MNP-08  MARCA MAX SPORT', 'UNID', 10, '38.00', '1.3200', '1.3200', '1.2000', 'Activo', NULL, 3, 'SI', '$', '3.8200', '', NULL, '', 0, 0, 0, 0, 0, 0, 0),
(231, 5, 1, 9, 'MNP-05', 'MANOPLA DE BOX MODELO MNP-05  MARCA MAX SPORT', 'UNID', 10, '46.00', '1.1000', '1.1000', '1.0000', 'Activo', NULL, 3, 'SI', '$', '3.8200', '', NULL, '', 0, 0, 0, 0, 0, 0, 0),
(232, 14, 1, 9, 'X-5', 'BICICLETA ESTACIONARIA X-5 MAX SPORT', 'UNID', 10, '5.00', '71.7200', '71.7200', '65.2048', 'Activo', NULL, 3, 'SI', '$', '3.8200', '', NULL, '', 0, 0, 0, 0, 0, 0, 0),
(233, 14, 1, 9, 'X-6GT', 'BICICLETA ESTACIONARIA X-6GT MAX SPORT', 'UNID', 10, '4.00', '66.0000', '66.0000', '60.0000', 'Activo', NULL, 3, 'SI', '$', '3.8200', '', NULL, '', 0, 0, 0, 0, 0, 0, 0),
(234, 14, 1, 10, 'X-46T', 'BICICLETA ESTACIONARIA X-4GT PRO FIT', 'UNID', 10, '5.00', '66.8400', '66.8400', '60.7607', 'Activo', NULL, 3, 'SI', '$', '3.8200', '', NULL, '', 0, 0, 0, 0, 0, 0, 0),
(235, 14, 1, 10, 'X-4', 'BICICLETA ESTACIONARIA X-4', 'UNID', 10, '4.00', '66.0000', '66.0000', '60.0000', 'Activo', NULL, 3, 'SI', '$', '3.8200', '', NULL, '', 0, 0, 0, 0, 0, 0, 0),
(236, 14, 1, 10, 'X-8', 'BICICLETA ESTACIONARIA X-8 PRO FIT', 'UNID', 10, '3.00', '82.5000', '82.5000', '75.0000', 'Activo', NULL, 3, 'SI', '$', '3.8200', '', NULL, '', 0, 0, 0, 0, 0, 0, 0),
(237, 9, 1, 9, 'MXP-4000', 'BICICLETA ELIPTICA MXP-4000 MAX SPORT', 'SET', 10, '6.00', '74.6500', '74.6500', '67.8571', 'Activo', NULL, 3, 'SI', '$', '3.8200', '', NULL, '', 0, 0, 0, 0, 0, 0, 0),
(238, 9, 1, 9, 'MXP-3000', 'BICICLETA ELIPTICA MXP-3000', 'SET', 10, '5.00', '66.7800', '66.7800', '60.7143', 'Activo', NULL, 3, 'SI', '$', '3.8200', '', NULL, '', 0, 0, 0, 0, 0, 0, 0),
(239, 9, 1, 9, 'MXP-4500', 'BICICLETA ELIPTICA MXP-4500', 'SET', 10, '7.00', '71.7600', '71.7600', '65.2381', 'Activo', NULL, 3, 'SI', '$', '3.8200', '', NULL, '', 0, 0, 0, 0, 0, 0, 0),
(240, 9, 1, 9, 'GT-25', 'BICICLETA ELIPTICA MAGNETICA GT-25 MAX SPORT', 'UNID', 10, '12.00', '73.7100', '73.7100', '67.0095', 'Activo', NULL, 3, 'SI', '$', '3.8200', '', NULL, '', 0, 0, 0, 0, 0, 0, 0),
(241, 9, 1, 10, 'B033', 'BICICLETA ELIPTICA CHALLENGUE 3.0  PRO FIT', 'UNID', 10, '4.00', '49.5000', '49.5000', '45.0000', 'Activo', NULL, 3, 'SI', '$', '3.8200', '', NULL, '', 0, 0, 0, 0, 0, 0, 0),
(242, 9, 1, 9, 'MXP-6000', 'BICICLETA ELIPTICA MXP-6000 MAX SPORT', 'SET', 10, '5.00', '71.5000', '71.5000', '65.0000', 'Activo', NULL, 3, 'SI', '$', '3.8200', '', NULL, '', 0, 0, 0, 0, 0, 0, 0),
(243, 9, 1, 9, 'GT-15', 'BICICLETA ELIPTICA MAGNETICA GT-15 MAX SPORT', 'UNID', 10, '7.00', '44.0000', '44.0000', '40.0000', 'Activo', NULL, 3, 'SI', '$', '3.8200', '', NULL, '', 0, 0, 0, 0, 0, 0, 0),
(244, 15, 1, 9, 'HG-6500', 'HOME GYM HG-6500 MAX SPORT', 'SET', 10, '4.00', '111.2800', '111.2800', '101.1602', 'Activo', NULL, 3, 'SI', '$', '3.8200', '', NULL, '', 0, 0, 0, 0, 0, 0, 0),
(245, 15, 1, 9, 'HG-7200', 'HOME GYM HG-7200 MAX SPORT', 'SET', 10, '3.00', '175.3100', '175.3100', '159.3715', 'Activo', NULL, 3, 'SI', '$', '3.8200', '', NULL, '', 0, 0, 0, 0, 0, 0, 0),
(246, 15, 1, 9, 'HG-7500', 'HOME GYM HG-7500 MAX SPORT', 'SET', 10, '2.00', '179.3000', '179.3000', '163.0000', 'Activo', NULL, 3, 'SI', '$', '3.8200', '', NULL, '', 0, 0, 0, 0, 0, 0, 0),
(247, 15, 1, 10, 'G-9', 'APARATO DE EJERCICIO JAULA SMITH _X000D_\nMINI GIMNACIO G-9 PRO FIT', 'SET', 10, '1.00', '110.0000', '110.0000', '100.0000', 'Activo', NULL, 3, 'SI', '$', '3.8200', '', NULL, '', 0, 0, 0, 0, 0, 0, 0),
(248, 15, 1, 10, 'G-8', 'APARATO DE EJERCICIO JAULA SMITH _X000D_\nMINI GIMNACIO G-8 PRO FIT', 'SET', 10, '2.00', '110.0000', '110.0000', '100.0000', 'Activo', NULL, 3, 'SI', '$', '3.8200', '', NULL, '', 0, 0, 0, 0, 0, 0, 0),
(249, 10, 1, 10, 'R-3', 'CAMINADORA ELECRTICA R-3 PRO FIT', 'UNID', 10, '3.00', '128.8500', '128.8500', '117.1429', 'Activo', NULL, 3, 'SI', '$', '3.8200', '', NULL, '', 0, 0, 0, 0, 0, 0, 0),
(250, 10, 1, 10, 'K-7', 'CAMINADORA ELECTRICA K-7 PRO FIT', 'UNID', 10, '1.00', '143.0000', '143.0000', '130.0000', 'Activo', NULL, 3, 'SI', '$', '3.8200', '', NULL, '', 0, 0, 0, 0, 0, 0, 0),
(251, 10, 1, 9, 'MAX-3', 'CAMINADORA ELECTRICA MAX-3 MAX SPORT', 'UNID', 10, '6.00', '115.5000', '115.5000', '105.0000', 'Activo', NULL, 3, 'SI', '$', '3.8200', '', NULL, '', 0, 0, 0, 0, 0, 0, 0),
(252, 10, 1, 9, 'MAX-5', 'CAMINADORA ELECTRICA MAX-5 MAX SPORT', 'UNID', 10, '4.00', '121.9500', '121.9500', '110.8571', 'Activo', NULL, 3, 'SI', '$', '3.8200', '', NULL, '', 0, 0, 0, 0, 0, 0, 0),
(253, 10, 1, 9, 'MAX-6', 'CAMINADORA ELECTRICA MAX-6 MAX SPORT', 'UNID', 10, '4.00', '117.0400', '117.0400', '106.4033', 'Activo', NULL, 3, 'SI', '$', '3.8200', '', NULL, '', 0, 0, 0, 0, 0, 0, 0),
(254, 10, 1, 9, 'R-4', 'CAMINADORA ELECTRICA R-4 MAX SPORT', 'UNID', 10, '1.00', '143.3000', '143.3000', '133.2872', 'Activo', NULL, 3, 'SI', '$', '3.8200', '', NULL, '', 0, 0, 0, 0, 0, 0, 0),
(255, 10, 1, 9, 'YA-4700', 'CAMINADORA ELECTRICA YA-4700 MAX SPORT', 'UNID', 10, '1.00', '84.9200', '84.9200', '77.2000', 'Activo', NULL, 3, 'SI', '$', '3.8200', '', NULL, '', 0, 0, 0, 0, 0, 0, 0),
(256, 10, 1, 10, 'Z-2GT', 'CAMINADORA ELECTRICA Z-2GT PRO FIT', 'UNID', 10, '4.00', '112.7500', '112.7500', '102.5000', 'Activo', NULL, 3, 'SI', '$', '3.8200', '', NULL, '', 0, 0, 0, 0, 0, 0, 0),
(257, 10, 1, 10, 'Z-4', 'CAMINADORA ELECTRICA Z-4 PRO FIT', 'UNID', 10, '3.00', '143.7200', '143.7200', '130.6458', 'Activo', NULL, 3, 'SI', '$', '3.8200', '', NULL, '', 0, 0, 0, 0, 0, 0, 0),
(258, 10, 1, 9, 'M-2', 'CAMINADORA MECANICA M-2 MAX SPORT', 'UNID', 10, '3.00', '72.4100', '72.4100', '65.8333', 'Activo', NULL, 3, 'SI', '$', '3.8200', '', NULL, '', 0, 0, 0, 0, 0, 0, 0),
(259, 10, 1, 9, 'K-4', 'CAMINADORA ELECTRICA K-4 MAX SPORT', 'UNID', 10, '1.00', '129.0900', '129.0900', '117.3507', 'Activo', NULL, 3, 'SI', '$', '3.8200', '', NULL, '', 0, 0, 0, 0, 0, 0, 0),
(260, 10, 1, 9, 'MAX-1', 'CAMINADORA ELECRTICA MAX-1 MAX  SPORT', 'UNID', 10, '4.00', '77.0000', '77.0000', '70.0000', 'Activo', NULL, 3, 'SI', '$', '3.8200', '', NULL, '', 0, 0, 0, 0, 0, 0, 0),
(261, 10, 1, 9, 'K-5', 'CAMINADORA ELECTRICA K-5 MAX SPORT', 'UNID', 10, '3.00', '110.0000', '110.0000', '100.0000', 'Activo', NULL, 3, 'SI', '$', '3.8200', '', NULL, '', 0, 0, 0, 0, 0, 0, 0),
(262, 2, 1, 9, '12010001', 'CAMA SALTARINA MODELO TRH-44P MARCA MAX SPORT', 'UNID', 10, '4.00', '5.5000', '5.5000', '5.0000', 'Activo', NULL, 3, 'SI', '$', '3.8200', '', NULL, '', 0, 0, 0, 0, 0, 0, 0),
(263, 2, 1, 9, '1201000 1', 'CAMA SALTARINA MODELO TRH-48P MARCA MAX SPORT', 'UNID', 10, '4.00', '5.5000', '5.5000', '5.0000', 'Activo', NULL, 3, 'SI', '$', '3.8200', '', NULL, '', 0, 0, 0, 0, 0, 0, 0),
(264, 2, 1, 9, 'TR-38P', 'CAMA SALTARINA MODELO TR-38P MAX SPORT', 'UNID', 10, '5.00', '5.5000', '5.5000', '5.0000', 'Activo', NULL, 3, 'SI', '$', '3.8200', '', NULL, '', 0, 0, 0, 0, 0, 0, 0),
(265, 2, 1, 9, 'TR-40P', 'CAMA SALTARINA MODELO TR-40P MAX SPORT', 'UNID', 10, '5.00', '5.5000', '5.5000', '5.0000', 'Activo', NULL, 3, 'SI', '$', '3.8200', '', NULL, '', 0, 0, 0, 0, 0, 0, 0),
(266, 2, 1, 9, 'TR-45P', 'CAMA SALTARINA MODELO TR-45P MAX SPORT', 'UNID', 10, '5.00', '6.6000', '6.6000', '6.0000', 'Activo', NULL, 3, 'SI', '$', '3.8200', '', NULL, '', 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `producto` (`CODIGO_PRODUCTO`, `CODIGO_CATEGORIA`, `CODIGO_PRESENTACION`, `CODIGO_MARCA`, `CODIGO_BARRA`, `DESCRIPCION`, `UNIDAD_MEDIDA`, `STOCK_MINIMO`, `STOCK`, `PRECIO_COMPRA`, `PRECIO`, `PRECIO_COSTO`, `ESTADO`, `PROCEDENCIA`, `CODIGO_ALMACEN`, `ZONA_FRANCA`, `MONEY`, `TIPO_CAMBIO`, `CODIGO_EXPORTACION`, `TALLA`, `CODIGO_REFERENCIA`, `cta_ingreso`, `cta_igv`, `cta_cobrar`, `otros_tributos`, `amarre_1`, `amarre_2`, `amarre_3`) VALUES
(267, 2, 1, 9, '144CM', 'CAMA SALTARINA MODELO TRNET-144CM MAX SPORT', 'UNID', 10, '3.00', '11.0000', '11.0000', '10.0000', 'Activo', NULL, 3, 'SI', '$', '3.8200', '', NULL, '', 0, 0, 0, 0, 0, 0, 0),
(268, 16, 1, 5, 'DMX-6000', 'MAQUINA ABDOMINAL DMX-6000 MAX SPORT', 'SET', 10, '16.00', '401.6700', '401.6700', '365.1500', 'Activo', NULL, 1, 'NO', 'S/', '0.0000', '', NULL, '', 0, 0, 0, 0, 0, 0, 0),
(269, 16, 1, 5, 'DMX- 6000', 'APARATO PARA ABDOMINALES MARCA MAX SPORT DMX-6000', 'UNID', 10, '197.00', '252.3400', '252.3400', '229.4000', 'Activo', NULL, 1, 'NO', 'S/', '0.0000', '', NULL, '', 0, 0, 0, 0, 0, 0, 0),
(270, 17, 1, 5, 'RM-03', 'MAQUINA DE REMO RM-03', 'UNID', 10, '24.00', '400.0000', '400.0000', '363.6400', 'Activo', NULL, 1, 'NO', 'S/', '0.0000', '', NULL, '', 0, 0, 0, 0, 0, 0, 0),
(271, 6, 1, 5, 'PRESS-07', 'BANCA PARA PESAS PRESS-07 MAX SPORT', 'UNID', 10, '36.00', '441.8400', '441.8400', '401.6700', 'Activo', NULL, 1, 'NO', 'S/', '0.0000', '', NULL, '', 0, 0, 0, 0, 0, 0, 0),
(272, 6, 1, 5, 'PRESS-03', 'BANCO DE MANCUERNAS PRESS-03 MAX SPORT', 'UNID', 10, '34.00', '338.9900', '338.9900', '308.1700', 'Activo', NULL, 1, 'NO', 'S/', '0.0000', '', NULL, '', 0, 0, 0, 0, 0, 0, 0),
(273, 6, 1, 5, 'BP-2200', 'BANCO DE MANCUERNAS  BP-2200 MAX SPORT', 'UNID', 10, '16.00', '138.6200', '138.6200', '126.0200', 'Activo', NULL, 1, 'NO', 'S/', '0.0000', '', NULL, '', 0, 0, 0, 0, 0, 0, 0),
(274, 6, 1, 5, 'BP-2400', 'BANCO DE MANCUERNAS  BP-2400 MAX SPORT', 'UNID', 10, '45.00', '156.1700', '156.1700', '141.9700', 'Activo', NULL, 1, 'NO', 'S/', '0.0000', '', NULL, '', 0, 0, 0, 0, 0, 0, 0),
(275, 6, 1, 5, 'BP-2350', 'BANCO PARA ABDOMINALES  BP-2350 MAX SPORT', 'UNID', 10, '43.00', '160.0000', '160.0000', '145.4500', 'Activo', NULL, 1, 'NO', 'S/', '0.0000', '', NULL, '', 0, 0, 0, 0, 0, 0, 0),
(276, 6, 1, 5, 'BP-2300', 'BANCO DE MANCUERNAS  BP-2300 MAX SPORT', 'UNID', 10, '101.00', '127.9700', '127.9700', '116.3300', 'Activo', NULL, 1, 'NO', 'S/', '0.0000', '', NULL, '', 0, 0, 0, 0, 0, 0, 0),
(277, 6, 1, 5, 'BP-4000', 'BANCO DE MANCUERNAS  BP-4000 MAX SPORT', 'UNID', 10, '19.00', '202.6500', '202.6500', '184.2200', 'Activo', NULL, 1, 'NO', 'S/', '0.0000', '', NULL, '', 0, 0, 0, 0, 0, 0, 0),
(278, 8, 1, 5, 'MAX-20KG', 'MANCUERNAS DE MANO MAX-20KG', 'UNID', 10, '10.00', '108.1800', '108.1800', '98.3500', 'Activo', NULL, 1, 'NO', 'S/', '0.0000', '', NULL, '', 0, 0, 0, 0, 0, 0, 0),
(279, 8, 1, 5, 'MAX-30KG', 'MANCUERNAS DE MANO MAX-30KG', 'UNID', 10, '12.00', '156.3700', '156.3700', '142.1500', 'Activo', NULL, 1, 'NO', 'S/', '0.0000', '', NULL, '', 0, 0, 0, 0, 0, 0, 0),
(280, 5, 1, 5, '1MTR', 'SACO DE BOXEO NEGRO 1MTR MAX  SPORT', 'UNID', 10, '325.00', '60.7700', '60.7700', '55.2400', 'Activo', NULL, 1, 'NO', 'S/', '0.0000', '', NULL, '', 0, 0, 0, 0, 0, 0, 0),
(281, 5, 1, 5, '1.20MTR', 'SACO DE BOXEO NEGRO 1.20MTR MAX  SPORT', 'UNID', 10, '262.00', '71.1400', '71.1400', '64.6800', 'Activo', NULL, 1, 'NO', 'S/', '0.0000', '', NULL, '', 0, 0, 0, 0, 0, 0, 0),
(282, 18, 1, 3, 'X-4', 'BICICLETA ESTACIONARIA  X-4  PRO FIT', 'UNID', 10, '17.00', '447.9400', '447.9400', '407.2200', 'Activo', NULL, 1, 'NO', 'S/', '0.0000', '', NULL, '', 0, 0, 0, 0, 0, 0, 0),
(284, 9, 1, 5, 'MXP-4000', 'BICICLETA ELIPTICA MXP-4000', 'SET', 10, '245.00', '444.6500', '444.6500', '404.2300', 'Activo', NULL, 1, 'NO', 'S/', '0.0000', '', NULL, '', 0, 0, 0, 0, 0, 0, 0),
(285, 9, 1, 3, 'B0031', 'BICICLETA ELIPTICA CHALLENGUE 3.0  PRO FIT', 'UNID', 10, '89.00', '398.8600', '398.8600', '362.6000', 'Activo', NULL, 1, 'NO', 'S/', '0.0000', '', NULL, '', 0, 0, 0, 0, 0, 0, 0),
(286, 10, 1, 3, 'K-6', 'CAMINADORA ELECTRICA K-6', 'UNID', 10, '1.00', '885.9600', '885.9600', '805.4200', 'Activo', NULL, 1, 'NO', 'S/', '0.0000', '', NULL, '', 0, 0, 0, 0, 0, 0, 0),
(287, 10, 1, 5, 'MAX-7', 'CAMINADORA ELECTRICA MAX-7', 'UNID', 10, '1.00', '498.0000', '498.0000', '452.7300', 'Activo', NULL, 1, 'NO', 'S/', '0.0000', '', NULL, '', 0, 0, 0, 0, 0, 0, 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `proveedor`
--

CREATE TABLE `proveedor` (
  `CODIGO_PROVEEDOR` int(11) NOT NULL,
  `TIPO_CONTRIBUYENTE` int(11) NOT NULL,
  `RUC` char(11) NOT NULL,
  `TIPO_DOCUMENTO` int(11) NOT NULL,
  `RAZON_SOCIAL` varchar(100) NOT NULL,
  `REPRESENTANTE` varchar(100) DEFAULT NULL,
  `CELULAR` varchar(30) DEFAULT NULL,
  `DIRECCION` varchar(200) DEFAULT NULL,
  `TELEFONO` varchar(30) DEFAULT NULL,
  `EMAIL` varchar(100) DEFAULT NULL,
  `ESTADO` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Volcado de datos para la tabla `proveedor`
--

INSERT INTO `proveedor` (`CODIGO_PROVEEDOR`, `TIPO_CONTRIBUYENTE`, `RUC`, `TIPO_DOCUMENTO`, `RAZON_SOCIAL`, `REPRESENTANTE`, `CELULAR`, `DIRECCION`, `TELEFONO`, `EMAIL`, `ESTADO`) VALUES
(2, 2, '10476611666', 6, 'SICHA ROMANI HERNAN', 'HERNAN SICHA ROMANI', '', 'av nicolas arriola', '978904893', 'hsicha@gmail.com', NULL),
(3, 2, '20552103816', 6, 'AGROLIGHT PERU S.A.C.', '-', '', 'PJ. JORGE BASADRE NRO 158 URB. POP LA UNIVERSAL 2DA ET. ', '8984324', '-', NULL),
(4, 2, '20538856674', 6, 'ARTROSCOPICTRAUMA S.A.C.', '-', '', 'AV. GRAL.GARZON NRO 2320 URB. FUNDO OYAGUE ', '-', '-', NULL),
(5, 2, '20553856451', 6, 'BI GRAND CONFECCIONES S.A.C.', '-', '', 'JR. SAN GABRIEL NRO 284 URB. SAN CARLOS COMAS ', '-', '-', NULL),
(6, 2, '20100017491', 6, 'TELEFONICA DEL PERU SAA', 'HERNAN SICHA ROMANI', '', 'CAL. DEAN VALDIVIA NRO 148 DEP. 201 URB. JARDIN ', '-', '-', NULL),
(7, 1, '47661166', 1, 'SICHA ROMANI HERNAN', '-', '', '-', '-', '-', NULL),
(8, 2, '20556347931', 6, 'CENTRO DE SEGURIDAD INFORMATICA INTERNATIONAL SERVICES S.A.C.', '-', '', 'JR. ANTONIO BAZO NRO 491 DEP. B ', '-', '-', NULL),
(9, 2, '20602361307', 6, 'CASTILLO MAQUINARIAS S.A.C', '-', '', 'AV. REPÚBLICA DE ARGENTINA NRO 339 INT. 11 C.C. LA BELLOTA ', '-', '-', NULL),
(10, 2, '20603209975', 6, 'CADENA DE BOTICAS LA SANTA CRUZ S.A.C.', '-', '', 'BL. BARRIO SANTA ELENA MZA. A LOTE 6 ', '-', '-', NULL),
(11, 2, '20293910767', 6, 'C & J TRADE EMPRESA INDIVIDUAL DE RESPONSABILIDAD LIMITADA - C & J TRADE E.I.R.L.', '-', '', 'AV. MARCAVELICA MZA. D LOTE 14 URB. LOS FICUS ', '-', '-', NULL),
(12, 2, '20487932150', 6, 'BOTICAS INMACULADA VIRGENCITA DE GUADALUPE S.R.L.', '-', '', 'JR. MANCO CAPAC NRO 105 CENTRO ', '-', '-', NULL),
(13, 2, '20136157133', 6, 'BODEGA OJEDA S.R.LTDA.', '-', '', 'JR. ALFONSO UGARTE NRO 535 ', '-', '-', NULL),
(14, 2, '20101031854', 6, 'CONSTRUCTORA UPACA S A', '-', '', 'AV. CANAVAL Y MOREYRA NRO 452 URB. CORPAC ', '-', '-', NULL),
(15, 2, '20112091221', 6, 'IMPRESIONES Y UTILES SAC', '-', '', 'JR. MELCHOR MALO NRO 140 URB. PROLONGACION BENAVIDES ', '-', '-', NULL),
(16, 2, '20115190165', 6, 'DISTRIBUIDORA ABARROTERA DEL SUR EIRL', '-', '', 'AV. TACNA Y ARICA NRO S/N ', '-', '-', NULL),
(17, 2, '20120877055', 6, 'LADRILLERA EL DIAMANTE S.A.C.', '-', '', 'CAR. VARIANTE DE UCHUMAYO NRO 4 ', '-', '-', NULL),
(18, 2, '20123531389', 6, 'TECNOLOGIA DE MATERIALES S.A.', '-', '', 'AV. ALAMEDA LOS HORIZONTES NRO 905 URB. LOT.PRE URBA H. DE VILLA ', '-', '-', NULL),
(19, 2, '20145496170', 6, 'UNIVERSIDAD NACIONAL DEL ALTIPLANO PUNO', '-', '', 'AV. EL SOL NRO 329 BARRIO BELLAVISTA ', '-', '-', NULL),
(20, 2, '20164486720', 6, 'EMPRESA DE BIENES Y SERVICIOS PARA EL HOGAR S.A.C.', '-', '', 'AV. REPUBLICA DE PANAMA NRO 3647 URB. EL PALOMAR ', '-', '-', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `recursos`
--

CREATE TABLE `recursos` (
  `CODIGO_RECURSO` int(11) NOT NULL,
  `NOMBRE` varchar(100) NOT NULL,
  `FECHA_REGISTRO` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sedes`
--

CREATE TABLE `sedes` (
  `ID_SEDE` int(11) NOT NULL,
  `ADRESS` varchar(100) DEFAULT NULL,
  `LOCAL` varchar(100) DEFAULT NULL,
  `UBIGEO` varchar(50) DEFAULT NULL,
  `CONTRY` varchar(30) DEFAULT NULL,
  `CELLPHONE` varchar(20) DEFAULT NULL,
  `CODIGO_USUARIO` int(11) DEFAULT NULL,
  `RUTA` varchar(150) DEFAULT NULL,
  `TOKEN` varchar(150) DEFAULT NULL,
  `CODIGO_ALMACEN` int(11) NOT NULL,
  `REGISTRO_INVENTARIO` enum('SI','NO') DEFAULT NULL COMMENT 'SI,NO',
  `MOSTRAR_STOCK` varchar(20) NOT NULL COMMENT 'SI,NO',
  `PRODUCTO_EXPORTACION` enum('SI','NO') DEFAULT NULL COMMENT 'SI,NO',
  `ESTATUS` enum('ACTIVO','INACTIVO') DEFAULT NULL COMMENT 'ACTIVO,INACTIVO'
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sistemalog`
--

CREATE TABLE `sistemalog` (
  `CODIGO_SISTEMALOG` int(11) NOT NULL,
  `CODIGO_USUARIO` int(11) NOT NULL,
  `FECHA_REGISTRO` datetime(6) NOT NULL,
  `NOMBRE_PC` varchar(30) NOT NULL,
  `USUARIO_PC` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `sistemalog`
--

INSERT INTO `sistemalog` (`CODIGO_SISTEMALOG`, `CODIGO_USUARIO`, `FECHA_REGISTRO`, `NOMBRE_PC`, `USUARIO_PC`) VALUES
(1, 1, '2021-01-15 11:35:28.000000', 'DESKTOP-JOV3D7N', 'DELTA'),
(2, 1, '2021-01-15 11:36:53.000000', 'DESKTOP-JOV3D7N', 'DELTA'),
(3, 1, '2021-01-15 11:54:36.000000', 'DESKTOP-JOV3D7N', 'DELTA'),
(4, 1, '2021-01-15 11:56:49.000000', 'DESKTOP-JOV3D7N', 'DELTA'),
(5, 2, '2021-01-15 12:47:51.000000', 'DESKTOP-JOV3D7N', 'DELTA'),
(6, 2, '2021-01-15 12:55:37.000000', 'DESKTOP-JOV3D7N', 'DELTA'),
(7, 2, '2021-01-15 12:58:55.000000', 'DESKTOP-JOV3D7N', 'DELTA'),
(8, 2, '2021-01-15 12:59:19.000000', 'DESKTOP-JOV3D7N', 'DELTA'),
(9, 2, '2021-01-15 13:05:54.000000', 'DESKTOP-JOV3D7N', 'DELTA'),
(10, 2, '2021-01-15 13:07:07.000000', 'DESKTOP-JOV3D7N', 'DELTA'),
(11, 2, '2021-01-15 13:58:36.000000', 'DESKTOP-JOV3D7N', 'DELTA'),
(12, 2, '2021-01-15 13:59:27.000000', 'DESKTOP-JOV3D7N', 'DELTA'),
(13, 2, '2021-01-15 14:00:11.000000', 'DESKTOP-JOV3D7N', 'DELTA'),
(14, 2, '2021-01-15 14:51:22.000000', 'DESKTOP-JOV3D7N', 'DELTA'),
(15, 2, '2021-01-15 15:02:49.000000', 'DESKTOP-JOV3D7N', 'DELTA'),
(16, 2, '2021-01-15 15:04:49.000000', 'DESKTOP-JOV3D7N', 'DELTA'),
(17, 2, '2021-01-15 15:05:27.000000', 'DESKTOP-JOV3D7N', 'DELTA'),
(18, 2, '2021-01-15 15:06:08.000000', 'DESKTOP-JOV3D7N', 'DELTA'),
(19, 2, '2021-01-15 15:07:03.000000', 'DESKTOP-JOV3D7N', 'DELTA'),
(20, 2, '2021-01-15 15:07:37.000000', 'DESKTOP-JOV3D7N', 'DELTA'),
(21, 2, '2021-01-15 15:09:32.000000', 'DESKTOP-JOV3D7N', 'DELTA'),
(22, 2, '2021-01-15 17:25:02.000000', 'DESKTOP-JOV3D7N', 'DELTA'),
(23, 2, '2021-01-15 17:26:39.000000', 'DESKTOP-JOV3D7N', 'DELTA'),
(24, 2, '2021-01-15 17:28:45.000000', 'DESKTOP-JOV3D7N', 'DELTA'),
(25, 2, '2021-01-15 17:33:00.000000', 'DESKTOP-JOV3D7N', 'DELTA'),
(26, 2, '2021-01-15 17:37:23.000000', 'DESKTOP-JOV3D7N', 'DELTA'),
(27, 2, '2021-01-15 17:53:48.000000', 'DESKTOP-JOV3D7N', 'DELTA'),
(28, 2, '2021-01-15 18:15:07.000000', 'DESKTOP-JOV3D7N', 'DELTA'),
(29, 2, '2021-01-15 20:24:01.000000', 'DESKTOP-JOV3D7N', 'DELTA'),
(30, 2, '2021-01-15 20:34:39.000000', 'DESKTOP-JOV3D7N', 'DELTA'),
(31, 2, '2021-01-15 20:38:03.000000', 'DESKTOP-JOV3D7N', 'DELTA'),
(32, 2, '2021-01-15 20:41:15.000000', 'DESKTOP-JOV3D7N', 'DELTA'),
(33, 2, '2021-01-18 11:15:36.000000', 'DESKTOP-JOV3D7N', 'DELTA'),
(34, 2, '2021-01-18 11:19:18.000000', 'DESKTOP-JOV3D7N', 'DELTA'),
(35, 2, '2021-01-18 11:21:10.000000', 'DESKTOP-JOV3D7N', 'DELTA'),
(36, 2, '2021-01-18 11:47:55.000000', 'DESKTOP-JOV3D7N', 'DELTA'),
(37, 2, '2021-01-18 12:15:20.000000', 'DESKTOP-JOV3D7N', 'DELTA'),
(38, 2, '2021-01-18 12:19:03.000000', 'DESKTOP-JOV3D7N', 'DELTA'),
(39, 2, '2021-01-18 12:19:51.000000', 'DESKTOP-JOV3D7N', 'DELTA'),
(40, 2, '2021-01-18 14:02:42.000000', 'DESKTOP-JOV3D7N', 'DELTA'),
(41, 2, '2021-01-18 14:23:03.000000', 'DESKTOP-JOV3D7N', 'DELTA'),
(42, 2, '2021-01-18 14:28:50.000000', 'DESKTOP-JOV3D7N', 'DELTA'),
(43, 2, '2021-01-19 08:18:36.000000', 'DESKTOP-JOV3D7N', 'DELTA'),
(44, 2, '2021-01-19 11:01:47.000000', 'DESKTOP-JOV3D7N', 'DELTA'),
(45, 2, '2021-01-19 11:05:52.000000', 'DESKTOP-JOV3D7N', 'DELTA'),
(46, 2, '2021-01-19 11:10:14.000000', 'DESKTOP-JOV3D7N', 'DELTA'),
(47, 2, '2021-01-19 11:47:21.000000', 'DESKTOP-JOV3D7N', 'DELTA'),
(48, 2, '2021-01-19 11:49:40.000000', 'DESKTOP-JOV3D7N', 'DELTA'),
(49, 2, '2021-01-19 11:50:26.000000', 'DESKTOP-JOV3D7N', 'DELTA'),
(50, 2, '2021-01-19 11:51:36.000000', 'DESKTOP-JOV3D7N', 'DELTA'),
(51, 2, '2021-01-19 11:52:19.000000', 'DESKTOP-JOV3D7N', 'DELTA'),
(52, 2, '2021-01-19 11:57:38.000000', 'DESKTOP-JOV3D7N', 'DELTA'),
(53, 2, '2021-01-19 13:49:25.000000', 'DESKTOP-JOV3D7N', 'DELTA'),
(54, 2, '2021-01-19 13:52:40.000000', 'DESKTOP-JOV3D7N', 'DELTA'),
(55, 2, '2021-01-19 13:57:49.000000', 'DESKTOP-JOV3D7N', 'DELTA'),
(56, 2, '2021-01-19 13:58:51.000000', 'DESKTOP-JOV3D7N', 'DELTA'),
(57, 2, '2021-01-19 14:00:00.000000', 'DESKTOP-JOV3D7N', 'DELTA'),
(58, 2, '2021-01-19 14:02:55.000000', 'DESKTOP-JOV3D7N', 'DELTA'),
(59, 2, '2021-01-19 14:14:20.000000', 'DESKTOP-JOV3D7N', 'DELTA'),
(60, 2, '2021-01-19 14:16:50.000000', 'DESKTOP-JOV3D7N', 'DELTA'),
(61, 2, '2021-01-19 14:17:44.000000', 'DESKTOP-JOV3D7N', 'DELTA'),
(62, 2, '2021-01-19 14:23:11.000000', 'DESKTOP-JOV3D7N', 'DELTA'),
(63, 2, '2021-01-19 14:27:53.000000', 'DESKTOP-JOV3D7N', 'DELTA'),
(64, 2, '2021-01-19 14:41:00.000000', 'DESKTOP-JOV3D7N', 'DELTA'),
(65, 2, '2021-01-19 14:58:17.000000', 'DESKTOP-JOV3D7N', 'DELTA'),
(66, 2, '2021-01-19 15:00:15.000000', 'DESKTOP-JOV3D7N', 'DELTA'),
(67, 2, '2021-01-19 15:11:46.000000', 'DESKTOP-JOV3D7N', 'DELTA'),
(68, 2, '2021-01-19 15:18:04.000000', 'DESKTOP-JOV3D7N', 'DELTA'),
(69, 2, '2021-01-19 15:19:35.000000', 'DESKTOP-JOV3D7N', 'DELTA'),
(70, 2, '2021-01-19 15:21:01.000000', 'DESKTOP-JOV3D7N', 'DELTA'),
(71, 2, '2021-01-19 15:34:00.000000', 'DESKTOP-JOV3D7N', 'DELTA'),
(72, 2, '2021-01-19 15:36:33.000000', 'DESKTOP-JOV3D7N', 'DELTA'),
(73, 2, '2021-01-19 15:38:10.000000', 'DESKTOP-JOV3D7N', 'DELTA'),
(74, 2, '2021-01-19 15:40:50.000000', 'DESKTOP-JOV3D7N', 'DELTA'),
(75, 2, '2021-01-19 15:41:31.000000', 'DESKTOP-JOV3D7N', 'DELTA'),
(76, 2, '2021-01-19 15:43:11.000000', 'DESKTOP-JOV3D7N', 'DELTA'),
(77, 2, '2021-01-19 15:44:31.000000', 'DESKTOP-JOV3D7N', 'DELTA'),
(78, 2, '2021-01-19 15:45:43.000000', 'DESKTOP-JOV3D7N', 'DELTA'),
(79, 2, '2021-01-19 15:46:23.000000', 'DESKTOP-JOV3D7N', 'DELTA'),
(80, 2, '2021-01-19 15:49:17.000000', 'DESKTOP-JOV3D7N', 'DELTA'),
(81, 2, '2021-01-19 16:17:18.000000', 'DESKTOP-JOV3D7N', 'DELTA'),
(82, 2, '2021-01-19 16:22:06.000000', 'DESKTOP-JOV3D7N', 'DELTA'),
(83, 2, '2021-01-19 16:23:22.000000', 'DESKTOP-JOV3D7N', 'DELTA'),
(84, 2, '2021-01-19 16:25:46.000000', 'DESKTOP-JOV3D7N', 'DELTA'),
(85, 2, '2021-01-19 16:27:38.000000', 'DESKTOP-JOV3D7N', 'DELTA'),
(86, 2, '2021-01-19 16:29:58.000000', 'DESKTOP-JOV3D7N', 'DELTA'),
(87, 2, '2021-01-19 16:31:19.000000', 'DESKTOP-JOV3D7N', 'DELTA'),
(88, 2, '2021-01-19 16:31:56.000000', 'DESKTOP-JOV3D7N', 'DELTA'),
(89, 2, '2021-01-19 16:33:17.000000', 'DESKTOP-JOV3D7N', 'DELTA'),
(90, 2, '2021-01-19 16:37:20.000000', 'DESKTOP-JOV3D7N', 'DELTA'),
(91, 2, '2021-01-19 16:38:07.000000', 'DESKTOP-JOV3D7N', 'DELTA'),
(92, 2, '2021-01-19 17:36:09.000000', 'DESKTOP-JOV3D7N', 'DELTA'),
(93, 2, '2021-01-19 17:43:45.000000', 'DESKTOP-JOV3D7N', 'DELTA'),
(94, 2, '2021-01-19 17:44:56.000000', 'DESKTOP-JOV3D7N', 'DELTA'),
(95, 2, '2021-01-19 17:46:37.000000', 'DESKTOP-JOV3D7N', 'DELTA'),
(96, 2, '2021-01-19 17:48:50.000000', 'DESKTOP-JOV3D7N', 'DELTA'),
(97, 2, '2021-01-19 17:50:08.000000', 'DESKTOP-JOV3D7N', 'DELTA'),
(98, 2, '2021-01-19 18:05:06.000000', 'DESKTOP-JOV3D7N', 'DELTA'),
(99, 2, '2021-01-19 18:08:19.000000', 'DESKTOP-JOV3D7N', 'DELTA'),
(100, 2, '2021-01-20 08:24:24.000000', 'DESKTOP-JOV3D7N', 'DELTA'),
(101, 2, '2021-01-20 08:24:55.000000', 'DESKTOP-JOV3D7N', 'DELTA'),
(102, 2, '2021-01-20 11:17:50.000000', 'DESKTOP-JOV3D7N', 'DELTA'),
(103, 2, '2021-01-20 11:18:25.000000', 'DESKTOP-JOV3D7N', 'DELTA'),
(104, 2, '2021-01-20 11:20:41.000000', 'DESKTOP-JOV3D7N', 'DELTA'),
(105, 2, '2021-01-20 11:22:09.000000', 'DESKTOP-JOV3D7N', 'DELTA'),
(106, 2, '2021-01-20 11:24:47.000000', 'DESKTOP-JOV3D7N', 'DELTA'),
(107, 2, '2021-01-20 11:27:35.000000', 'DESKTOP-JOV3D7N', 'DELTA'),
(108, 2, '2021-01-20 11:33:39.000000', 'DESKTOP-JOV3D7N', 'DELTA'),
(109, 2, '2021-01-20 11:35:01.000000', 'DESKTOP-JOV3D7N', 'DELTA'),
(110, 2, '2021-01-20 11:36:22.000000', 'DESKTOP-JOV3D7N', 'DELTA'),
(111, 2, '2021-01-20 11:37:35.000000', 'DESKTOP-JOV3D7N', 'DELTA'),
(112, 2, '2021-01-20 11:39:11.000000', 'DESKTOP-JOV3D7N', 'DELTA'),
(113, 2, '2021-01-20 11:40:11.000000', 'DESKTOP-JOV3D7N', 'DELTA'),
(114, 2, '2021-01-20 11:40:55.000000', 'DESKTOP-JOV3D7N', 'DELTA'),
(115, 2, '2021-01-20 11:41:26.000000', 'DESKTOP-JOV3D7N', 'DELTA'),
(116, 2, '2021-01-20 11:42:17.000000', 'DESKTOP-JOV3D7N', 'DELTA'),
(117, 2, '2021-01-20 11:50:05.000000', 'DESKTOP-JOV3D7N', 'DELTA'),
(118, 2, '2021-01-20 11:50:45.000000', 'DESKTOP-JOV3D7N', 'DELTA'),
(119, 2, '2021-01-20 11:51:19.000000', 'DESKTOP-JOV3D7N', 'DELTA'),
(120, 2, '2021-01-20 12:00:00.000000', 'DESKTOP-JOV3D7N', 'DELTA'),
(121, 2, '2021-01-20 12:01:20.000000', 'DESKTOP-JOV3D7N', 'DELTA'),
(122, 2, '2021-01-20 12:02:07.000000', 'DESKTOP-JOV3D7N', 'DELTA'),
(123, 2, '2021-01-20 12:02:36.000000', 'DESKTOP-JOV3D7N', 'DELTA'),
(124, 2, '2021-01-20 12:03:32.000000', 'DESKTOP-JOV3D7N', 'DELTA'),
(125, 2, '2021-01-20 13:48:55.000000', 'DESKTOP-JOV3D7N', 'DELTA'),
(126, 2, '2021-01-20 13:49:36.000000', 'DESKTOP-JOV3D7N', 'DELTA'),
(127, 2, '2021-01-20 13:52:27.000000', 'DESKTOP-JOV3D7N', 'DELTA'),
(128, 2, '2021-01-20 13:54:46.000000', 'DESKTOP-JOV3D7N', 'DELTA'),
(129, 2, '2021-01-20 14:05:00.000000', 'DESKTOP-JOV3D7N', 'DELTA'),
(130, 2, '2021-01-20 14:07:27.000000', 'DESKTOP-JOV3D7N', 'DELTA'),
(131, 2, '2021-01-20 14:14:16.000000', 'DESKTOP-JOV3D7N', 'DELTA'),
(132, 2, '2021-01-20 14:15:10.000000', 'DESKTOP-JOV3D7N', 'DELTA'),
(133, 2, '2021-01-20 14:15:52.000000', 'DESKTOP-JOV3D7N', 'DELTA'),
(134, 2, '2021-01-20 15:22:59.000000', 'DESKTOP-JOV3D7N', 'DELTA'),
(135, 2, '2021-01-20 16:10:42.000000', 'DESKTOP-JOV3D7N', 'DELTA'),
(136, 2, '2021-01-20 17:34:56.000000', 'DESKTOP-JOV3D7N', 'DELTA'),
(137, 2, '2021-01-20 17:41:01.000000', 'DESKTOP-JOV3D7N', 'DELTA'),
(138, 2, '2021-01-21 11:31:49.000000', 'DESKTOP-JOV3D7N', 'DELTA'),
(139, 2, '2021-01-21 11:37:08.000000', 'DESKTOP-JOV3D7N', 'DELTA'),
(140, 2, '2021-01-21 11:49:39.000000', 'DESKTOP-JOV3D7N', 'DELTA'),
(141, 2, '2021-01-21 11:51:05.000000', 'DESKTOP-JOV3D7N', 'DELTA'),
(142, 2, '2021-01-21 11:53:45.000000', 'DESKTOP-JOV3D7N', 'DELTA'),
(143, 2, '2021-01-21 11:54:21.000000', 'DESKTOP-JOV3D7N', 'DELTA'),
(144, 2, '2021-01-22 08:34:01.000000', 'DESKTOP-JOV3D7N', 'DELTA'),
(145, 2, '2021-01-22 10:06:19.000000', 'DESKTOP-JOV3D7N', 'DELTA'),
(146, 2, '2021-01-24 08:58:26.000000', 'DESKTOP-JOV3D7N', 'DELTA'),
(147, 2, '2021-01-24 13:38:57.000000', 'DESKTOP-JOV3D7N', 'DELTA'),
(148, 2, '2021-01-24 13:40:52.000000', 'DESKTOP-JOV3D7N', 'DELTA'),
(149, 2, '2021-01-24 13:42:39.000000', 'DESKTOP-JOV3D7N', 'DELTA'),
(150, 2, '2021-01-24 13:48:13.000000', 'DESKTOP-JOV3D7N', 'DELTA'),
(151, 2, '2021-01-24 13:57:25.000000', 'DESKTOP-JOV3D7N', 'DELTA'),
(152, 2, '2021-01-24 13:59:29.000000', 'DESKTOP-JOV3D7N', 'DELTA'),
(153, 2, '2021-01-24 14:02:15.000000', 'DESKTOP-JOV3D7N', 'DELTA'),
(154, 2, '2021-01-24 14:45:18.000000', 'DESKTOP-JOV3D7N', 'DELTA'),
(155, 2, '2021-01-24 14:55:16.000000', 'DESKTOP-JOV3D7N', 'DELTA'),
(156, 2, '2021-01-24 14:56:51.000000', 'DESKTOP-JOV3D7N', 'DELTA'),
(157, 2, '2021-01-24 15:21:16.000000', 'DESKTOP-JOV3D7N', 'DELTA'),
(158, 2, '2021-01-24 15:22:48.000000', 'DESKTOP-JOV3D7N', 'DELTA'),
(159, 2, '2021-01-24 20:37:48.000000', 'DESKTOP-JOV3D7N', 'DELTA'),
(160, 2, '2021-01-24 20:45:01.000000', 'DESKTOP-JOV3D7N', 'DELTA'),
(161, 2, '2021-01-24 20:47:05.000000', 'DESKTOP-JOV3D7N', 'DELTA'),
(162, 2, '2021-01-24 20:48:48.000000', 'DESKTOP-JOV3D7N', 'DELTA'),
(163, 2, '2021-01-24 20:58:22.000000', 'DESKTOP-JOV3D7N', 'DELTA'),
(164, 2, '2021-01-24 21:03:02.000000', 'DESKTOP-JOV3D7N', 'DELTA'),
(165, 2, '2021-01-24 21:07:36.000000', 'DESKTOP-JOV3D7N', 'DELTA'),
(166, 2, '2021-01-24 21:09:41.000000', 'DESKTOP-JOV3D7N', 'DELTA'),
(167, 2, '2021-01-24 21:13:04.000000', 'DESKTOP-JOV3D7N', 'DELTA'),
(168, 2, '2021-01-24 21:25:35.000000', 'DESKTOP-JOV3D7N', 'DELTA'),
(169, 2, '2021-01-24 21:28:33.000000', 'DESKTOP-JOV3D7N', 'DELTA'),
(170, 2, '2021-01-24 21:30:37.000000', 'DESKTOP-JOV3D7N', 'DELTA'),
(171, 2, '2021-01-24 21:31:24.000000', 'DESKTOP-JOV3D7N', 'DELTA'),
(172, 2, '2021-01-24 21:32:29.000000', 'DESKTOP-JOV3D7N', 'DELTA'),
(173, 2, '2021-01-24 21:34:18.000000', 'DESKTOP-JOV3D7N', 'DELTA'),
(174, 2, '2021-01-24 21:38:53.000000', 'DESKTOP-JOV3D7N', 'DELTA'),
(175, 2, '2021-01-24 21:41:07.000000', 'DESKTOP-JOV3D7N', 'DELTA'),
(176, 2, '2021-01-24 21:49:11.000000', 'DESKTOP-JOV3D7N', 'DELTA'),
(177, 2, '2021-01-24 21:51:54.000000', 'DESKTOP-JOV3D7N', 'DELTA'),
(178, 2, '2021-01-24 21:54:17.000000', 'DESKTOP-JOV3D7N', 'DELTA'),
(179, 2, '2021-01-24 21:57:59.000000', 'DESKTOP-JOV3D7N', 'DELTA'),
(180, 2, '2021-01-24 21:58:52.000000', 'DESKTOP-JOV3D7N', 'DELTA'),
(181, 2, '2021-01-24 22:04:31.000000', 'DESKTOP-JOV3D7N', 'DELTA'),
(182, 2, '2021-01-24 22:07:14.000000', 'DESKTOP-JOV3D7N', 'DELTA'),
(183, 2, '2021-01-24 22:10:41.000000', 'DESKTOP-JOV3D7N', 'DELTA'),
(184, 2, '2021-01-24 22:13:38.000000', 'DESKTOP-JOV3D7N', 'DELTA'),
(185, 2, '2021-01-25 08:45:26.000000', 'DESKTOP-JOV3D7N', 'DELTA'),
(186, 2, '2021-01-25 08:46:15.000000', 'DESKTOP-JOV3D7N', 'DELTA'),
(187, 2, '2021-01-25 08:59:02.000000', 'DESKTOP-JOV3D7N', 'DELTA'),
(188, 2, '2021-01-25 09:02:21.000000', 'DESKTOP-JOV3D7N', 'DELTA'),
(189, 2, '2021-01-25 09:14:28.000000', 'DESKTOP-JOV3D7N', 'DELTA'),
(190, 2, '2021-01-25 09:46:45.000000', 'DESKTOP-JOV3D7N', 'DELTA'),
(191, 2, '2021-01-25 10:12:16.000000', 'DESKTOP-JOV3D7N', 'DELTA'),
(192, 2, '2021-01-25 10:23:46.000000', 'DESKTOP-JOV3D7N', 'DELTA'),
(193, 2, '2021-01-25 10:31:19.000000', 'DESKTOP-JOV3D7N', 'DELTA'),
(194, 2, '2021-01-25 10:33:06.000000', 'DESKTOP-JOV3D7N', 'DELTA'),
(195, 2, '2021-01-25 10:51:02.000000', 'DESKTOP-JOV3D7N', 'DELTA'),
(196, 2, '2021-01-25 10:56:30.000000', 'DESKTOP-JOV3D7N', 'DELTA'),
(197, 2, '2021-01-25 11:19:41.000000', 'DESKTOP-JOV3D7N', 'DELTA'),
(198, 2, '2021-01-25 12:09:04.000000', 'DESKTOP-JOV3D7N', 'DELTA'),
(199, 2, '2021-01-25 12:23:54.000000', 'DESKTOP-JOV3D7N', 'DELTA'),
(200, 2, '2021-01-25 12:31:20.000000', 'DESKTOP-JOV3D7N', 'DELTA'),
(201, 2, '2021-01-25 15:31:31.000000', 'DESKTOP-JOV3D7N', 'DELTA'),
(202, 2, '2021-01-25 17:28:04.000000', 'DESKTOP-JOV3D7N', 'DELTA'),
(203, 2, '2021-01-26 14:30:58.000000', 'DESKTOP-JOV3D7N', 'DELTA'),
(204, 2, '2021-01-26 14:31:20.000000', 'DESKTOP-JOV3D7N', 'DELTA'),
(205, 2, '2021-01-27 16:25:54.000000', 'DESKTOP-JOV3D7N', 'DELTA'),
(206, 2, '2021-01-28 08:19:48.000000', 'DESKTOP-JOV3D7N', 'DELTA'),
(207, 2, '2021-01-28 10:08:49.000000', 'DESKTOP-JOV3D7N', 'DELTA'),
(208, 2, '2021-01-28 11:05:14.000000', 'DESKTOP-JOV3D7N', 'DELTA'),
(209, 2, '2021-01-28 11:40:28.000000', 'DESKTOP-JOV3D7N', 'DELTA'),
(210, 2, '2021-01-28 11:59:08.000000', 'DESKTOP-JOV3D7N', 'DELTA'),
(211, 2, '2021-01-28 12:09:42.000000', 'DESKTOP-JOV3D7N', 'DELTA'),
(212, 2, '2021-01-28 12:16:56.000000', 'DESKTOP-JOV3D7N', 'DELTA'),
(213, 2, '2021-01-28 14:45:20.000000', 'DESKTOP-JOV3D7N', 'DELTA'),
(214, 2, '2021-01-28 14:47:29.000000', 'DESKTOP-JOV3D7N', 'DELTA'),
(215, 2, '2021-01-28 14:48:44.000000', 'DESKTOP-JOV3D7N', 'DELTA'),
(216, 2, '2021-01-28 15:03:32.000000', 'DESKTOP-JOV3D7N', 'DELTA'),
(217, 2, '2021-01-28 15:04:51.000000', 'DESKTOP-JOV3D7N', 'DELTA'),
(218, 2, '2021-01-28 15:13:09.000000', 'DESKTOP-JOV3D7N', 'DELTA'),
(219, 2, '2021-01-28 15:41:19.000000', 'DESKTOP-JOV3D7N', 'DELTA'),
(220, 2, '2021-01-28 15:42:09.000000', 'DESKTOP-JOV3D7N', 'DELTA'),
(221, 2, '2021-01-28 15:42:51.000000', 'DESKTOP-JOV3D7N', 'DELTA'),
(222, 2, '2021-01-28 15:46:17.000000', 'DESKTOP-JOV3D7N', 'DELTA'),
(223, 2, '2021-01-28 15:48:36.000000', 'DESKTOP-JOV3D7N', 'DELTA'),
(224, 2, '2021-01-28 15:55:31.000000', 'DESKTOP-JOV3D7N', 'DELTA'),
(225, 2, '2021-01-29 08:25:13.000000', 'DESKTOP-JOV3D7N', 'DELTA'),
(226, 2, '2021-01-29 08:29:31.000000', 'DESKTOP-JOV3D7N', 'DELTA'),
(227, 2, '2021-01-29 19:04:09.000000', 'DESKTOP-JOV3D7N', 'DELTA'),
(228, 2, '2021-01-29 19:34:20.000000', 'DESKTOP-JOV3D7N', 'DELTA'),
(229, 2, '2021-01-29 19:40:03.000000', 'DESKTOP-JOV3D7N', 'DELTA'),
(230, 2, '2021-01-29 19:48:50.000000', 'DESKTOP-JOV3D7N', 'DELTA'),
(231, 2, '2021-01-29 19:55:49.000000', 'DESKTOP-JOV3D7N', 'DELTA'),
(232, 2, '2021-01-29 20:02:05.000000', 'DESKTOP-JOV3D7N', 'DELTA'),
(233, 2, '2021-01-29 20:03:17.000000', 'DESKTOP-JOV3D7N', 'DELTA'),
(234, 2, '2021-01-29 20:08:16.000000', 'DESKTOP-JOV3D7N', 'DELTA'),
(235, 2, '2021-01-29 20:13:55.000000', 'DESKTOP-JOV3D7N', 'DELTA'),
(236, 2, '2021-01-29 20:20:20.000000', 'DESKTOP-JOV3D7N', 'DELTA'),
(237, 2, '2021-01-29 20:28:59.000000', 'DESKTOP-JOV3D7N', 'DELTA'),
(238, 2, '2021-01-29 20:30:25.000000', 'DESKTOP-JOV3D7N', 'DELTA'),
(239, 2, '2021-01-29 20:31:39.000000', 'DESKTOP-JOV3D7N', 'DELTA'),
(240, 2, '2021-01-29 20:38:39.000000', 'DESKTOP-JOV3D7N', 'DELTA'),
(241, 2, '2021-01-29 20:40:12.000000', 'DESKTOP-JOV3D7N', 'DELTA'),
(242, 2, '2021-01-29 20:42:03.000000', 'DESKTOP-JOV3D7N', 'DELTA'),
(243, 2, '2021-01-29 20:43:54.000000', 'DESKTOP-JOV3D7N', 'DELTA'),
(244, 2, '2021-01-29 20:47:58.000000', 'DESKTOP-JOV3D7N', 'DELTA'),
(245, 2, '2021-01-29 20:49:05.000000', 'DESKTOP-JOV3D7N', 'DELTA'),
(246, 2, '2021-01-29 20:49:51.000000', 'DESKTOP-JOV3D7N', 'DELTA'),
(247, 2, '2021-01-29 20:51:00.000000', 'DESKTOP-JOV3D7N', 'DELTA'),
(248, 2, '2021-01-29 20:51:59.000000', 'DESKTOP-JOV3D7N', 'DELTA'),
(249, 2, '2021-01-29 20:54:21.000000', 'DESKTOP-JOV3D7N', 'DELTA'),
(250, 2, '2021-01-29 20:55:14.000000', 'DESKTOP-JOV3D7N', 'DELTA'),
(251, 2, '2021-01-29 21:00:26.000000', 'DESKTOP-JOV3D7N', 'DELTA'),
(252, 2, '2021-01-29 21:04:17.000000', 'DESKTOP-JOV3D7N', 'DELTA'),
(253, 2, '2021-01-29 21:07:08.000000', 'DESKTOP-JOV3D7N', 'DELTA'),
(254, 2, '2021-01-29 21:09:10.000000', 'DESKTOP-JOV3D7N', 'DELTA'),
(255, 2, '2021-01-29 21:14:30.000000', 'DESKTOP-JOV3D7N', 'DELTA'),
(256, 2, '2021-01-29 21:17:25.000000', 'DESKTOP-JOV3D7N', 'DELTA'),
(257, 2, '2021-01-29 21:19:02.000000', 'DESKTOP-JOV3D7N', 'DELTA'),
(258, 2, '2021-01-29 21:21:10.000000', 'DESKTOP-JOV3D7N', 'DELTA'),
(259, 2, '2021-01-29 21:22:41.000000', 'DESKTOP-JOV3D7N', 'DELTA'),
(260, 2, '2021-01-29 21:28:05.000000', 'DESKTOP-JOV3D7N', 'DELTA'),
(261, 2, '2021-01-29 21:34:18.000000', 'DESKTOP-JOV3D7N', 'DELTA'),
(262, 2, '2021-01-29 21:43:15.000000', 'DESKTOP-JOV3D7N', 'DELTA'),
(263, 2, '2021-01-29 21:44:21.000000', 'DESKTOP-JOV3D7N', 'DELTA'),
(264, 2, '2021-01-29 21:59:10.000000', 'DESKTOP-JOV3D7N', 'DELTA'),
(265, 2, '2021-01-29 22:05:08.000000', 'DESKTOP-JOV3D7N', 'DELTA'),
(266, 2, '2021-01-29 22:08:18.000000', 'DESKTOP-JOV3D7N', 'DELTA'),
(267, 2, '2021-01-29 22:23:34.000000', 'DESKTOP-JOV3D7N', 'DELTA'),
(268, 2, '2021-01-29 22:28:03.000000', 'DESKTOP-JOV3D7N', 'DELTA'),
(269, 2, '2021-01-29 22:32:31.000000', 'DESKTOP-JOV3D7N', 'DELTA'),
(270, 2, '2021-01-30 08:48:03.000000', 'DESKTOP-JOV3D7N', 'DELTA'),
(271, 2, '2021-01-30 08:58:06.000000', 'DESKTOP-JOV3D7N', 'DELTA'),
(272, 2, '2021-01-30 09:00:33.000000', 'DESKTOP-JOV3D7N', 'DELTA'),
(273, 2, '2021-01-30 09:05:59.000000', 'DESKTOP-JOV3D7N', 'DELTA'),
(274, 2, '2021-01-30 09:08:01.000000', 'DESKTOP-JOV3D7N', 'DELTA'),
(275, 2, '2021-01-30 09:34:04.000000', 'DESKTOP-JOV3D7N', 'DELTA'),
(276, 2, '2021-01-30 09:39:48.000000', 'DESKTOP-JOV3D7N', 'DELTA'),
(277, 2, '2021-01-30 09:43:54.000000', 'DESKTOP-JOV3D7N', 'DELTA'),
(278, 2, '2021-01-30 09:48:07.000000', 'DESKTOP-JOV3D7N', 'DELTA'),
(279, 2, '2021-01-30 10:04:29.000000', 'DESKTOP-JOV3D7N', 'DELTA'),
(280, 2, '2021-01-30 10:18:47.000000', 'DESKTOP-JOV3D7N', 'DELTA'),
(281, 2, '2021-01-30 10:19:50.000000', 'DESKTOP-JOV3D7N', 'DELTA'),
(282, 2, '2021-01-30 10:29:29.000000', 'DESKTOP-JOV3D7N', 'DELTA'),
(283, 2, '2021-01-30 10:31:07.000000', 'DESKTOP-JOV3D7N', 'DELTA'),
(284, 2, '2021-01-30 12:04:34.000000', 'DESKTOP-JOV3D7N', 'DELTA'),
(285, 2, '2021-01-30 12:14:36.000000', 'DESKTOP-JOV3D7N', 'DELTA'),
(286, 2, '2021-01-30 12:15:29.000000', 'DESKTOP-JOV3D7N', 'DELTA'),
(287, 2, '2021-01-30 12:17:13.000000', 'DESKTOP-JOV3D7N', 'DELTA'),
(288, 2, '2021-01-30 12:17:49.000000', 'DESKTOP-JOV3D7N', 'DELTA'),
(289, 2, '2021-01-30 12:21:05.000000', 'DESKTOP-JOV3D7N', 'DELTA'),
(290, 2, '2021-01-30 12:23:32.000000', 'DESKTOP-JOV3D7N', 'DELTA'),
(291, 2, '2021-01-30 12:28:16.000000', 'DESKTOP-JOV3D7N', 'DELTA'),
(292, 2, '2021-01-30 12:29:12.000000', 'DESKTOP-JOV3D7N', 'DELTA'),
(293, 2, '2021-01-30 12:32:25.000000', 'DESKTOP-JOV3D7N', 'DELTA'),
(294, 2, '2021-01-30 12:33:37.000000', 'DESKTOP-JOV3D7N', 'DELTA'),
(295, 2, '2021-01-30 12:36:59.000000', 'DESKTOP-JOV3D7N', 'DELTA'),
(296, 2, '2021-01-30 12:42:05.000000', 'DESKTOP-JOV3D7N', 'DELTA'),
(297, 2, '2021-01-30 12:43:03.000000', 'DESKTOP-JOV3D7N', 'DELTA'),
(298, 2, '2021-01-30 12:43:53.000000', 'DESKTOP-JOV3D7N', 'DELTA'),
(299, 2, '2021-01-30 12:44:45.000000', 'DESKTOP-JOV3D7N', 'DELTA'),
(300, 2, '2021-01-30 12:45:23.000000', 'DESKTOP-JOV3D7N', 'DELTA'),
(301, 2, '2021-01-30 12:54:02.000000', 'DESKTOP-JOV3D7N', 'DELTA'),
(302, 2, '2021-01-30 13:57:28.000000', 'DESKTOP-JOV3D7N', 'DELTA'),
(303, 2, '2021-01-30 14:03:55.000000', 'DESKTOP-JOV3D7N', 'DELTA'),
(304, 2, '2021-01-30 14:05:29.000000', 'DESKTOP-JOV3D7N', 'DELTA'),
(305, 2, '2021-01-30 14:09:05.000000', 'DESKTOP-JOV3D7N', 'DELTA'),
(306, 2, '2021-01-30 14:10:11.000000', 'DESKTOP-JOV3D7N', 'DELTA'),
(307, 2, '2021-01-30 14:10:28.000000', 'DESKTOP-JOV3D7N', 'DELTA'),
(308, 2, '2021-01-30 14:13:02.000000', 'DESKTOP-JOV3D7N', 'DELTA'),
(309, 2, '2021-01-30 14:14:00.000000', 'DESKTOP-JOV3D7N', 'DELTA'),
(310, 2, '2021-01-30 14:41:22.000000', 'DESKTOP-JOV3D7N', 'DELTA'),
(311, 2, '2021-01-30 14:43:00.000000', 'DESKTOP-JOV3D7N', 'DELTA'),
(312, 2, '2021-01-30 14:47:28.000000', 'DESKTOP-JOV3D7N', 'DELTA'),
(313, 2, '2021-01-30 14:49:46.000000', 'DESKTOP-JOV3D7N', 'DELTA'),
(314, 2, '2021-01-30 14:51:46.000000', 'DESKTOP-JOV3D7N', 'DELTA'),
(315, 2, '2021-01-30 14:54:44.000000', 'DESKTOP-JOV3D7N', 'DELTA'),
(316, 2, '2021-01-30 15:00:54.000000', 'DESKTOP-JOV3D7N', 'DELTA'),
(317, 2, '2021-01-30 15:03:19.000000', 'DESKTOP-JOV3D7N', 'DELTA'),
(318, 2, '2021-01-30 15:20:15.000000', 'DESKTOP-JOV3D7N', 'DELTA'),
(319, 2, '2021-01-30 15:21:09.000000', 'DESKTOP-JOV3D7N', 'DELTA'),
(320, 2, '2021-01-30 15:22:39.000000', 'DESKTOP-JOV3D7N', 'DELTA'),
(321, 2, '2021-01-30 15:24:49.000000', 'DESKTOP-JOV3D7N', 'DELTA'),
(322, 2, '2021-01-30 15:26:49.000000', 'DESKTOP-JOV3D7N', 'DELTA'),
(323, 2, '2021-01-30 15:35:16.000000', 'DESKTOP-JOV3D7N', 'DELTA'),
(324, 2, '2021-01-30 15:39:11.000000', 'DESKTOP-JOV3D7N', 'DELTA'),
(325, 2, '2021-01-30 15:56:07.000000', 'DESKTOP-JOV3D7N', 'DELTA'),
(326, 2, '2021-01-30 15:57:06.000000', 'DESKTOP-JOV3D7N', 'DELTA'),
(327, 2, '2021-01-30 16:00:54.000000', 'DESKTOP-JOV3D7N', 'DELTA'),
(328, 2, '2021-01-30 16:03:47.000000', 'DESKTOP-JOV3D7N', 'DELTA'),
(329, 2, '2021-01-30 16:10:40.000000', 'DESKTOP-JOV3D7N', 'DELTA'),
(330, 2, '2021-01-30 16:31:25.000000', 'DESKTOP-JOV3D7N', 'DELTA'),
(331, 2, '2021-01-30 16:36:18.000000', 'DESKTOP-JOV3D7N', 'DELTA'),
(332, 2, '2021-01-30 16:40:22.000000', 'DESKTOP-JOV3D7N', 'DELTA'),
(333, 2, '2021-01-30 16:54:40.000000', 'DESKTOP-JOV3D7N', 'DELTA'),
(334, 2, '2021-01-30 16:57:12.000000', 'DESKTOP-JOV3D7N', 'DELTA'),
(335, 2, '2021-01-30 16:58:38.000000', 'DESKTOP-JOV3D7N', 'DELTA'),
(336, 2, '2021-01-30 17:05:39.000000', 'DESKTOP-JOV3D7N', 'DELTA'),
(337, 2, '2021-01-30 17:16:12.000000', 'DESKTOP-JOV3D7N', 'DELTA'),
(338, 2, '2021-01-30 17:18:42.000000', 'DESKTOP-JOV3D7N', 'DELTA'),
(339, 2, '2021-01-30 17:26:15.000000', 'DESKTOP-JOV3D7N', 'DELTA'),
(340, 2, '2021-02-01 09:26:08.000000', 'DESKTOP-JOV3D7N', 'DELTA'),
(341, 2, '2021-02-01 09:28:20.000000', 'DESKTOP-JOV3D7N', 'DELTA'),
(342, 2, '2021-02-01 11:53:39.000000', 'DESKTOP-JOV3D7N', 'DELTA'),
(343, 1, '2021-02-04 16:46:20.000000', 'DESKTOP-PQLM2H5', 'HP'),
(344, 1, '2021-02-04 16:47:23.000000', 'DESKTOP-PQLM2H5', 'HP'),
(345, 1, '2021-02-04 17:40:51.000000', 'DESKTOP-PQLM2H5', 'HP'),
(346, 1, '2021-02-04 17:41:50.000000', 'DESKTOP-PQLM2H5', 'HP'),
(347, 3, '2021-02-04 17:44:52.000000', 'DESKTOP-PQLM2H5', 'HP'),
(348, 3, '2021-02-04 18:05:40.000000', 'DESKTOP-PQLM2H5', 'HP'),
(349, 3, '2021-02-04 18:58:52.000000', 'DESKTOP-PQLM2H5', 'HP'),
(350, 3, '2021-02-04 19:05:33.000000', 'DESKTOP-PQLM2H5', 'HP'),
(351, 3, '2021-02-05 08:22:32.000000', 'DESKTOP-PQLM2H5', 'HP'),
(352, 3, '2021-02-05 10:34:56.000000', 'DESKTOP-PQLM2H5', 'HP'),
(353, 3, '2021-02-06 08:22:11.000000', 'DESKTOP-PQLM2H5', 'HP'),
(354, 3, '2021-02-06 10:13:40.000000', 'DESKTOP-PQLM2H5', 'HP'),
(355, 3, '2021-02-08 08:29:22.000000', 'DESKTOP-PQLM2H5', 'HP'),
(356, 2, '2021-02-08 08:51:19.000000', 'DESKTOP-PQLM2H5', 'HP'),
(357, 2, '2021-02-08 17:23:35.000000', 'DESKTOP-PQLM2H5', 'HP'),
(358, 2, '2021-02-08 18:40:46.000000', 'DESKTOP-PQLM2H5', 'HP'),
(359, 1, '2021-02-08 18:45:58.000000', 'DESKTOP-PQLM2H5', 'HP'),
(360, 1, '2021-02-08 19:07:51.000000', 'DESKTOP-PQLM2H5', 'HP'),
(361, 3, '2021-02-09 08:20:23.000000', 'DESKTOP-PQLM2H5', 'HP'),
(362, 3, '2021-02-09 08:20:23.000000', 'DESKTOP-PQLM2H5', 'HP'),
(363, 3, '2021-02-09 08:20:33.000000', 'DESKTOP-PQLM2H5', 'HP'),
(364, 1, '2021-02-09 09:35:38.000000', 'DESKTOP-PQLM2H5', 'HP'),
(365, 2, '2021-02-09 10:03:38.000000', 'DESKTOP-PQLM2H5', 'HP'),
(366, 1, '2021-02-09 11:14:07.000000', 'DESKTOP-PQLM2H5', 'HP'),
(367, 3, '2021-02-09 11:51:21.000000', 'DESKTOP-PQLM2H5', 'HP'),
(368, 1, '2021-02-09 17:05:14.000000', 'DESKTOP-PQLM2H5', 'HP'),
(369, 3, '2021-02-10 08:33:17.000000', 'DESKTOP-PQLM2H5', 'HP'),
(370, 3, '2021-02-11 08:23:52.000000', 'DESKTOP-PQLM2H5', 'HP'),
(371, 3, '2021-02-11 12:28:11.000000', 'DESKTOP-PQLM2H5', 'HP'),
(372, 3, '2021-02-13 08:40:54.000000', 'DESKTOP-PQLM2H5', 'HP'),
(373, 3, '2021-02-13 08:40:55.000000', 'DESKTOP-PQLM2H5', 'HP'),
(374, 3, '2021-02-13 08:40:55.000000', 'DESKTOP-PQLM2H5', 'HP'),
(375, 1, '2021-02-13 08:44:43.000000', 'DESKTOP-PQLM2H5', 'HP'),
(376, 3, '2021-02-15 08:25:28.000000', 'DESKTOP-PQLM2H5', 'HP'),
(377, 3, '2021-02-15 10:46:45.000000', 'DESKTOP-PQLM2H5', 'HP'),
(378, 3, '2021-02-16 08:31:05.000000', 'DESKTOP-PQLM2H5', 'HP'),
(379, 3, '2021-02-17 08:23:19.000000', 'DESKTOP-PQLM2H5', 'HP'),
(380, 3, '2021-02-17 08:23:19.000000', 'DESKTOP-PQLM2H5', 'HP'),
(381, 3, '2021-02-17 09:05:02.000000', 'DESKTOP-PQLM2H5', 'HP'),
(382, 1, '2021-02-17 09:20:06.000000', 'DESKTOP-PQLM2H5', 'HP'),
(383, 3, '2021-02-17 09:33:30.000000', 'DESKTOP-PQLM2H5', 'HP'),
(384, 3, '2021-02-18 08:09:12.000000', 'DESKTOP-PQLM2H5', 'HP'),
(385, 3, '2021-02-19 08:30:37.000000', 'DESKTOP-PQLM2H5', 'HP'),
(386, 1, '2021-02-19 09:47:04.000000', 'DESKTOP-PQLM2H5', 'HP'),
(387, 3, '2021-02-22 08:22:54.000000', 'DESKTOP-PQLM2H5', 'HP'),
(388, 3, '2021-02-22 08:22:54.000000', 'DESKTOP-PQLM2H5', 'HP'),
(389, 3, '2021-02-22 08:22:56.000000', 'DESKTOP-PQLM2H5', 'HP'),
(390, 3, '2021-02-22 08:23:37.000000', 'DESKTOP-PQLM2H5', 'HP'),
(391, 3, '2021-02-23 08:27:29.000000', 'DESKTOP-PQLM2H5', 'HP'),
(392, 3, '2021-02-24 08:29:10.000000', 'DESKTOP-PQLM2H5', 'HP'),
(393, 3, '2021-02-24 11:56:54.000000', 'DESKTOP-PQLM2H5', 'HP'),
(394, 3, '2021-02-24 19:08:21.000000', 'DESKTOP-PQLM2H5', 'HP'),
(395, 3, '2021-02-25 08:35:36.000000', 'DESKTOP-PQLM2H5', 'HP'),
(396, 3, '2021-02-26 08:37:35.000000', 'DESKTOP-PQLM2H5', 'HP'),
(397, 3, '2021-02-27 08:34:53.000000', 'DESKTOP-PQLM2H5', 'HP'),
(398, 3, '2021-03-01 08:31:12.000000', 'DESKTOP-PQLM2H5', 'HP'),
(399, 3, '2021-03-01 09:12:43.000000', 'DESKTOP-PQLM2H5', 'HP'),
(400, 3, '2021-03-01 09:12:43.000000', 'DESKTOP-PQLM2H5', 'HP'),
(401, 3, '2021-03-01 09:12:43.000000', 'DESKTOP-PQLM2H5', 'HP'),
(402, 3, '2021-03-01 09:12:43.000000', 'DESKTOP-PQLM2H5', 'HP'),
(403, 3, '2021-03-02 08:33:56.000000', 'DESKTOP-PQLM2H5', 'HP'),
(404, 3, '2021-03-04 08:32:27.000000', 'DESKTOP-PQLM2H5', 'HP'),
(405, 3, '2021-03-05 08:57:52.000000', 'DESKTOP-PQLM2H5', 'HP'),
(406, 3, '2021-03-08 08:39:31.000000', 'DESKTOP-PQLM2H5', 'HP'),
(407, 3, '2021-03-09 08:23:28.000000', 'DESKTOP-PQLM2H5', 'HP'),
(408, 3, '2021-03-10 08:27:39.000000', 'DESKTOP-PQLM2H5', 'HP'),
(409, 3, '2021-03-11 08:33:52.000000', 'DESKTOP-PQLM2H5', 'HP'),
(410, 3, '2021-03-11 10:56:16.000000', 'DESKTOP-IBBCT42', 'Hp'),
(411, 3, '2021-03-12 08:40:28.000000', 'DESKTOP-IBBCT42', 'Hp'),
(412, 3, '2021-03-12 16:41:59.000000', 'DESKTOP-IBBCT42', 'Hp'),
(413, 3, '2021-03-13 08:38:56.000000', 'DESKTOP-IBBCT42', 'Hp'),
(414, 3, '2021-03-14 20:07:12.000000', 'DESKTOP-IBBCT42', 'Hp'),
(415, 3, '2021-03-14 20:07:13.000000', 'DESKTOP-IBBCT42', 'Hp'),
(416, 3, '2021-03-15 08:02:43.000000', 'DESKTOP-IBBCT42', 'Hp'),
(417, 3, '2021-03-15 08:59:25.000000', 'DESKTOP-IBBCT42', 'Hp'),
(418, 3, '2021-03-16 08:25:00.000000', 'DESKTOP-IBBCT42', 'Hp'),
(419, 3, '2021-03-17 08:14:29.000000', 'DESKTOP-IBBCT42', 'Hp'),
(420, 3, '2021-03-18 08:34:56.000000', 'DESKTOP-IBBCT42', 'Hp'),
(421, 3, '2021-03-18 13:14:52.000000', 'DESKTOP-IBBCT42', 'Hp'),
(422, 3, '2021-03-18 13:14:52.000000', 'DESKTOP-IBBCT42', 'Hp'),
(423, 3, '2021-03-18 13:16:12.000000', 'DESKTOP-IBBCT42', 'Hp'),
(424, 3, '2021-03-19 08:27:11.000000', 'DESKTOP-IBBCT42', 'Hp'),
(425, 3, '2021-03-19 08:27:12.000000', 'DESKTOP-IBBCT42', 'Hp'),
(426, 3, '2021-03-19 08:29:43.000000', 'DESKTOP-IBBCT42', 'Hp'),
(427, 3, '2021-03-20 08:46:19.000000', 'DESKTOP-IBBCT42', 'Hp'),
(428, 3, '2021-03-22 08:29:45.000000', 'DESKTOP-IBBCT42', 'Hp'),
(429, 3, '2021-03-23 08:49:09.000000', 'DESKTOP-IBBCT42', 'Hp'),
(430, 3, '2021-03-24 08:36:19.000000', 'DESKTOP-IBBCT42', 'Hp'),
(431, 3, '2021-03-24 08:37:13.000000', 'DESKTOP-IBBCT42', 'Hp'),
(432, 3, '2021-03-25 09:30:50.000000', 'DESKTOP-IBBCT42', 'Hp'),
(433, 3, '2021-03-25 09:30:50.000000', 'DESKTOP-IBBCT42', 'Hp'),
(434, 3, '2021-03-25 10:19:03.000000', 'DESKTOP-IBBCT42', 'Hp'),
(435, 3, '2021-03-26 08:22:16.000000', 'DESKTOP-IBBCT42', 'Hp'),
(436, 3, '2021-03-26 09:28:59.000000', 'DESKTOP-IBBCT42', 'Hp'),
(437, 3, '2021-03-26 09:29:04.000000', 'DESKTOP-IBBCT42', 'Hp'),
(438, 3, '2021-03-26 09:29:05.000000', 'DESKTOP-IBBCT42', 'Hp'),
(439, 3, '2021-03-26 09:29:48.000000', 'DESKTOP-IBBCT42', 'Hp'),
(440, 3, '2021-03-26 09:29:48.000000', 'DESKTOP-IBBCT42', 'Hp'),
(441, 3, '2021-03-26 11:23:58.000000', 'DESKTOP-IBBCT42', 'Hp'),
(442, 3, '2021-03-26 11:23:58.000000', 'DESKTOP-IBBCT42', 'Hp'),
(443, 3, '2021-03-26 11:23:58.000000', 'DESKTOP-IBBCT42', 'Hp'),
(444, 3, '2021-03-27 09:35:15.000000', 'DESKTOP-IBBCT42', 'Hp'),
(445, 3, '2021-03-29 08:05:17.000000', 'DESKTOP-IBBCT42', 'Hp'),
(446, 3, '2021-03-29 08:05:18.000000', 'DESKTOP-IBBCT42', 'Hp'),
(447, 3, '2021-03-29 08:05:18.000000', 'DESKTOP-IBBCT42', 'Hp'),
(448, 3, '2021-03-29 08:05:24.000000', 'DESKTOP-IBBCT42', 'Hp'),
(449, 3, '2021-03-29 10:09:34.000000', 'DESKTOP-IBBCT42', 'Hp'),
(450, 3, '2021-03-29 10:09:34.000000', 'DESKTOP-IBBCT42', 'Hp'),
(451, 3, '2021-03-29 10:10:39.000000', 'DESKTOP-IBBCT42', 'Hp'),
(452, 3, '2021-03-30 08:32:38.000000', 'DESKTOP-IBBCT42', 'Hp'),
(453, 3, '2021-03-31 08:30:25.000000', 'DESKTOP-IBBCT42', 'Hp'),
(454, 3, '2021-03-31 17:33:57.000000', 'DESKTOP-IBBCT42', 'Hp'),
(455, 3, '2021-04-05 08:51:04.000000', 'DESKTOP-IBBCT42', 'Hp'),
(456, 3, '2021-04-05 09:27:43.000000', 'DESKTOP-IBBCT42', 'Hp'),
(457, 3, '2021-04-05 09:32:04.000000', 'DESKTOP-IBBCT42', 'Hp'),
(458, 3, '2021-04-06 08:29:34.000000', 'DESKTOP-IBBCT42', 'Hp'),
(459, 3, '2021-04-06 08:29:34.000000', 'DESKTOP-IBBCT42', 'Hp'),
(460, 3, '2021-04-06 11:28:37.000000', 'DESKTOP-IBBCT42', 'Hp'),
(461, 3, '2021-04-07 09:18:52.000000', 'DESKTOP-IBBCT42', 'Hp'),
(462, 3, '2021-04-07 09:18:52.000000', 'DESKTOP-IBBCT42', 'Hp'),
(463, 3, '2021-04-08 08:34:41.000000', 'DESKTOP-IBBCT42', 'Hp'),
(464, 3, '2021-04-09 08:44:47.000000', 'DESKTOP-IBBCT42', 'Hp'),
(465, 3, '2021-04-09 08:44:52.000000', 'DESKTOP-IBBCT42', 'Hp'),
(466, 3, '2021-04-09 09:29:31.000000', 'DESKTOP-IBBCT42', 'Hp'),
(467, 3, '2021-04-09 09:29:32.000000', 'DESKTOP-IBBCT42', 'Hp'),
(468, 3, '2021-04-09 09:29:32.000000', 'DESKTOP-IBBCT42', 'Hp'),
(469, 3, '2021-04-09 09:29:35.000000', 'DESKTOP-IBBCT42', 'Hp'),
(470, 3, '2021-04-09 09:30:39.000000', 'DESKTOP-IBBCT42', 'Hp'),
(471, 3, '2021-04-09 09:30:40.000000', 'DESKTOP-IBBCT42', 'Hp'),
(472, 3, '2021-04-09 09:30:40.000000', 'DESKTOP-IBBCT42', 'Hp'),
(473, 3, '2021-04-09 09:31:27.000000', 'DESKTOP-IBBCT42', 'Hp'),
(474, 3, '2021-04-09 09:31:28.000000', 'DESKTOP-IBBCT42', 'Hp'),
(475, 3, '2021-04-09 09:31:28.000000', 'DESKTOP-IBBCT42', 'Hp'),
(476, 3, '2021-04-09 14:42:47.000000', 'DESKTOP-IBBCT42', 'Hp'),
(477, 3, '2021-04-10 08:50:17.000000', 'DESKTOP-IBBCT42', 'Hp'),
(478, 3, '2021-04-12 08:36:58.000000', 'DESKTOP-IBBCT42', 'Hp'),
(479, 3, '2021-04-13 08:29:33.000000', 'DESKTOP-IBBCT42', 'Hp'),
(480, 3, '2021-04-13 10:16:47.000000', 'DESKTOP-IBBCT42', 'Hp'),
(481, 3, '2021-04-13 14:43:38.000000', 'DESKTOP-IBBCT42', 'Hp'),
(482, 3, '2021-04-13 15:47:47.000000', 'DESKTOP-IBBCT42', 'Hp'),
(483, 3, '2021-04-13 15:47:53.000000', 'DESKTOP-IBBCT42', 'Hp'),
(484, 3, '2021-04-14 08:29:51.000000', 'DESKTOP-IBBCT42', 'Hp'),
(485, 3, '2021-04-15 14:47:03.000000', 'DESKTOP-IBBCT42', 'Hp'),
(486, 3, '2021-04-16 08:30:31.000000', 'DESKTOP-IBBCT42', 'Hp'),
(487, 3, '2021-04-17 08:48:09.000000', 'DESKTOP-IBBCT42', 'Hp'),
(488, 3, '2021-04-19 08:36:58.000000', 'DESKTOP-IBBCT42', 'Hp'),
(489, 3, '2021-04-20 08:26:00.000000', 'DESKTOP-IBBCT42', 'Hp'),
(490, 3, '2021-04-21 08:51:48.000000', 'DESKTOP-IBBCT42', 'Hp'),
(491, 3, '2021-04-22 08:37:21.000000', 'DESKTOP-IBBCT42', 'Hp'),
(492, 3, '2021-04-22 10:25:12.000000', 'DESKTOP-IBBCT42', 'Hp'),
(493, 3, '2021-04-23 09:03:19.000000', 'DESKTOP-IBBCT42', 'Hp'),
(494, 3, '2021-04-23 12:14:52.000000', 'DESKTOP-IBBCT42', 'Hp'),
(495, 3, '2021-04-24 08:49:11.000000', 'DESKTOP-IBBCT42', 'Hp'),
(496, 3, '2021-04-26 08:48:57.000000', 'DESKTOP-IBBCT42', 'Hp'),
(497, 3, '2021-04-26 08:49:38.000000', 'DESKTOP-IBBCT42', 'Hp'),
(498, 3, '2021-04-27 08:34:58.000000', 'DESKTOP-IBBCT42', 'Hp'),
(499, 3, '2021-04-28 08:26:25.000000', 'DESKTOP-IBBCT42', 'Hp'),
(500, 3, '2021-04-29 07:05:11.000000', 'DESKTOP-IBBCT42', 'Hp'),
(501, 3, '2021-04-29 08:41:43.000000', 'DESKTOP-IBBCT42', 'Hp'),
(502, 3, '2021-04-30 08:41:30.000000', 'DESKTOP-IBBCT42', 'Hp'),
(503, 3, '2021-05-01 08:34:48.000000', 'DESKTOP-IBBCT42', 'Hp'),
(504, 3, '2021-05-03 08:40:37.000000', 'DESKTOP-IBBCT42', 'Hp'),
(505, 3, '2021-05-04 08:07:56.000000', 'DESKTOP-IBBCT42', 'Hp'),
(506, 3, '2021-05-05 10:41:09.000000', 'DESKTOP-IBBCT42', 'Hp'),
(507, 3, '2021-05-06 08:17:28.000000', 'DESKTOP-IBBCT42', 'Hp'),
(508, 3, '2021-05-07 08:30:37.000000', 'DESKTOP-IBBCT42', 'Hp'),
(509, 3, '2021-05-10 08:19:55.000000', 'DESKTOP-IBBCT42', 'Hp'),
(510, 3, '2021-05-11 08:39:55.000000', 'DESKTOP-IBBCT42', 'Hp'),
(511, 3, '2021-05-12 08:29:55.000000', 'DESKTOP-IBBCT42', 'Hp'),
(512, 3, '2021-05-13 08:31:49.000000', 'DESKTOP-IBBCT42', 'Hp'),
(513, 3, '2021-05-13 12:02:24.000000', 'DESKTOP-IBBCT42', 'Hp'),
(514, 3, '2021-05-14 08:30:58.000000', 'DESKTOP-IBBCT42', 'Hp'),
(515, 3, '2021-05-14 08:32:37.000000', 'DESKTOP-IBBCT42', 'Hp'),
(516, 3, '2021-05-15 08:30:37.000000', 'DESKTOP-IBBCT42', 'Hp'),
(517, 3, '2021-05-17 08:24:08.000000', 'DESKTOP-IBBCT42', 'Hp'),
(518, 3, '2021-05-18 08:41:48.000000', 'DESKTOP-IBBCT42', 'Hp'),
(519, 3, '2021-05-19 08:27:52.000000', 'DESKTOP-IBBCT42', 'Hp'),
(520, 3, '2021-05-19 15:58:00.000000', 'DESKTOP-IBBCT42', 'Hp'),
(521, 3, '2021-05-20 08:27:11.000000', 'DESKTOP-IBBCT42', 'Hp'),
(522, 3, '2021-05-21 08:38:46.000000', 'DESKTOP-IBBCT42', 'Hp'),
(523, 3, '2021-05-22 08:22:35.000000', 'DESKTOP-IBBCT42', 'Hp'),
(524, 2, '2021-05-22 08:37:26.000000', 'DESKTOP-IBBCT42', 'Hp'),
(525, 2, '2021-05-22 08:42:35.000000', 'DESKTOP-IBBCT42', 'Hp'),
(526, 2, '2021-05-22 09:17:24.000000', 'DESKTOP-IBBCT42', 'Hp'),
(527, 2, '2021-05-22 09:52:49.000000', 'DESKTOP-IBBCT42', 'Hp'),
(528, 3, '2021-05-22 10:00:17.000000', 'DESKTOP-IBBCT42', 'Hp'),
(529, 1, '2021-05-22 10:05:10.000000', 'DESKTOP-IBBCT42', 'Hp'),
(530, 1, '2021-05-22 10:11:27.000000', 'DESKTOP-IBBCT42', 'Hp'),
(531, 1, '2021-05-22 13:03:56.000000', 'DESKTOP-IBBCT42', 'Hp'),
(532, 1, '2021-05-22 13:03:59.000000', 'DESKTOP-IBBCT42', 'Hp'),
(533, 1, '2021-05-22 13:04:30.000000', 'DESKTOP-IBBCT42', 'Hp'),
(534, 1, '2021-05-22 13:11:56.000000', 'DESKTOP-IBBCT42', 'Hp'),
(535, 1, '2021-05-22 13:19:23.000000', 'DESKTOP-IBBCT42', 'Hp'),
(536, 1, '2021-05-22 13:20:29.000000', 'DESKTOP-IBBCT42', 'Hp'),
(537, 3, '2021-05-24 08:17:33.000000', 'DESKTOP-IBBCT42', 'Hp'),
(538, 1, '2021-05-24 08:54:43.000000', 'DESKTOP-IBBCT42', 'Hp'),
(539, 3, '2021-05-24 09:20:12.000000', 'DESKTOP-IBBCT42', 'Hp'),
(540, 3, '2021-05-24 14:05:00.000000', 'DESKTOP-IBBCT42', 'Hp'),
(541, 3, '2021-05-25 08:22:59.000000', 'DESKTOP-IBBCT42', 'Hp'),
(542, 3, '2021-05-26 08:33:49.000000', 'DESKTOP-IBBCT42', 'Hp'),
(543, 3, '2021-05-27 08:39:04.000000', 'DESKTOP-IBBCT42', 'Hp'),
(544, 3, '2021-05-28 08:32:27.000000', 'DESKTOP-IBBCT42', 'Hp'),
(545, 3, '2021-05-30 18:57:10.000000', 'DESKTOP-IBBCT42', 'Hp'),
(546, 3, '2021-05-30 20:22:33.000000', 'DESKTOP-IBBCT42', 'Hp'),
(547, 3, '2021-05-31 08:28:43.000000', 'DESKTOP-IBBCT42', 'Hp'),
(548, 3, '2021-06-01 08:30:35.000000', 'DESKTOP-IBBCT42', 'Hp'),
(549, 3, '2021-06-02 08:22:24.000000', 'DESKTOP-IBBCT42', 'Hp'),
(550, 3, '2021-06-03 08:22:22.000000', 'DESKTOP-IBBCT42', 'Hp'),
(551, 3, '2021-06-03 12:25:22.000000', 'DESKTOP-IBBCT42', 'Hp'),
(552, 3, '2021-06-04 08:33:05.000000', 'DESKTOP-IBBCT42', 'Hp'),
(553, 3, '2021-06-05 10:19:13.000000', 'DESKTOP-IBBCT42', 'Hp'),
(554, 3, '2021-06-07 08:38:06.000000', 'DESKTOP-IBBCT42', 'Hp'),
(555, 3, '2021-06-08 08:33:03.000000', 'DESKTOP-IBBCT42', 'Hp'),
(556, 3, '2021-06-09 08:39:53.000000', 'DESKTOP-IBBCT42', 'Hp'),
(557, 3, '2021-06-09 14:29:15.000000', 'DESKTOP-IBBCT42', 'Hp'),
(558, 3, '2021-06-10 08:37:51.000000', 'DESKTOP-IBBCT42', 'Hp'),
(559, 3, '2021-06-11 08:25:56.000000', 'DESKTOP-IBBCT42', 'Hp'),
(560, 3, '2021-06-12 08:46:52.000000', 'DESKTOP-IBBCT42', 'Hp'),
(561, 3, '2021-06-14 08:28:18.000000', 'DESKTOP-IBBCT42', 'Hp'),
(562, 3, '2021-06-15 08:30:24.000000', 'DESKTOP-IBBCT42', 'Hp'),
(563, 3, '2021-06-16 08:44:02.000000', 'DESKTOP-IBBCT42', 'Hp'),
(564, 3, '2021-06-17 08:30:41.000000', 'DESKTOP-IBBCT42', 'Hp'),
(565, 3, '2021-06-18 10:38:29.000000', 'DESKTOP-IBBCT42', 'Hp'),
(566, 3, '2021-06-19 08:21:57.000000', 'DESKTOP-IBBCT42', 'Hp'),
(567, 3, '2021-06-21 08:34:58.000000', 'DESKTOP-IBBCT42', 'Hp'),
(568, 3, '2021-06-21 16:05:23.000000', 'DESKTOP-IBBCT42', 'Hp'),
(569, 3, '2021-06-22 08:25:01.000000', 'DESKTOP-IBBCT42', 'Hp'),
(570, 3, '2021-06-23 08:39:26.000000', 'DESKTOP-IBBCT42', 'Hp'),
(571, 3, '2021-06-24 08:24:01.000000', 'DESKTOP-IBBCT42', 'Hp'),
(572, 3, '2021-06-25 08:55:13.000000', 'DESKTOP-IBBCT42', 'Hp'),
(573, 3, '2021-06-26 09:26:53.000000', 'DESKTOP-IBBCT42', 'Hp'),
(574, 3, '2021-06-28 08:41:27.000000', 'DESKTOP-IBBCT42', 'Hp'),
(575, 3, '2021-06-29 09:00:38.000000', 'DESKTOP-IBBCT42', 'Hp'),
(576, 3, '2021-06-30 08:28:17.000000', 'DESKTOP-IBBCT42', 'Hp'),
(577, 3, '2021-07-01 08:30:19.000000', 'DESKTOP-IBBCT42', 'Hp'),
(578, 3, '2021-07-05 08:49:48.000000', 'DESKTOP-IBBCT42', 'Hp'),
(579, 3, '2021-07-06 08:35:08.000000', 'DESKTOP-IBBCT42', 'Hp'),
(580, 3, '2021-07-08 08:18:44.000000', 'DESKTOP-IBBCT42', 'Hp'),
(581, 3, '2021-07-09 08:30:39.000000', 'DESKTOP-IBBCT42', 'Hp'),
(582, 3, '2021-07-10 08:28:26.000000', 'DESKTOP-IBBCT42', 'Hp'),
(583, 3, '2021-07-12 08:24:53.000000', 'DESKTOP-IBBCT42', 'Hp'),
(584, 3, '2021-07-13 08:34:16.000000', 'DESKTOP-IBBCT42', 'Hp'),
(585, 3, '2021-07-14 08:32:43.000000', 'DESKTOP-IBBCT42', 'Hp'),
(586, 3, '2021-07-14 10:43:05.000000', 'DESKTOP-IBBCT42', 'Hp'),
(587, 3, '2021-07-15 08:45:32.000000', 'DESKTOP-IBBCT42', 'Hp'),
(588, 3, '2021-07-16 08:43:37.000000', 'DESKTOP-IBBCT42', 'Hp'),
(589, 3, '2021-07-17 08:31:17.000000', 'DESKTOP-IBBCT42', 'Hp'),
(590, 3, '2021-07-19 08:33:30.000000', 'DESKTOP-IBBCT42', 'Hp'),
(591, 3, '2021-07-20 08:53:28.000000', 'DESKTOP-IBBCT42', 'Hp'),
(592, 3, '2021-07-21 08:32:08.000000', 'DESKTOP-IBBCT42', 'Hp'),
(593, 3, '2021-07-22 08:34:05.000000', 'DESKTOP-IBBCT42', 'Hp'),
(594, 3, '2021-07-23 08:39:11.000000', 'DESKTOP-IBBCT42', 'Hp'),
(595, 3, '2021-07-24 08:31:18.000000', 'DESKTOP-IBBCT42', 'Hp'),
(596, 3, '2021-07-26 09:01:38.000000', 'DESKTOP-IBBCT42', 'Hp'),
(597, 3, '2021-07-27 08:50:09.000000', 'DESKTOP-IBBCT42', 'Hp'),
(598, 3, '2021-07-28 09:15:37.000000', 'DESKTOP-IBBCT42', 'Hp'),
(599, 3, '2021-07-29 10:52:39.000000', 'DESKTOP-IBBCT42', 'Hp'),
(600, 3, '2021-08-02 09:24:55.000000', 'DESKTOP-IBBCT42', 'Hp'),
(601, 3, '2021-08-03 08:57:10.000000', 'DESKTOP-IBBCT42', 'Hp'),
(602, 3, '2021-08-04 09:02:32.000000', 'DESKTOP-IBBCT42', 'Hp'),
(603, 3, '2021-08-05 08:50:43.000000', 'DESKTOP-IBBCT42', 'Hp'),
(604, 3, '2021-08-06 09:08:07.000000', 'DESKTOP-IBBCT42', 'Hp'),
(605, 3, '2021-08-07 08:59:12.000000', 'DESKTOP-IBBCT42', 'Hp'),
(606, 3, '2021-08-09 08:32:51.000000', 'DESKTOP-IBBCT42', 'Hp'),
(607, 3, '2021-08-10 08:28:28.000000', 'DESKTOP-IBBCT42', 'Hp'),
(608, 3, '2021-08-11 08:23:24.000000', 'DESKTOP-IBBCT42', 'Hp'),
(609, 3, '2021-08-12 08:36:47.000000', 'DESKTOP-IBBCT42', 'Hp'),
(610, 3, '2021-08-12 08:37:06.000000', 'DESKTOP-IBBCT42', 'Hp'),
(611, 3, '2021-08-12 08:38:03.000000', 'DESKTOP-IBBCT42', 'Hp'),
(612, 3, '2021-08-13 08:34:06.000000', 'DESKTOP-IBBCT42', 'Hp'),
(613, 3, '2021-08-13 08:34:19.000000', 'DESKTOP-IBBCT42', 'Hp'),
(614, 3, '2021-08-13 08:35:57.000000', 'DESKTOP-IBBCT42', 'Hp'),
(615, 3, '2021-08-13 11:10:19.000000', 'DESKTOP-IBBCT42', 'Hp'),
(616, 3, '2021-08-14 08:18:45.000000', 'DESKTOP-IBBCT42', 'Hp'),
(617, 3, '2021-08-14 09:22:13.000000', 'DESKTOP-IBBCT42', 'Hp'),
(618, 3, '2021-08-14 09:22:17.000000', 'DESKTOP-IBBCT42', 'Hp'),
(619, 3, '2021-08-14 09:23:12.000000', 'DESKTOP-IBBCT42', 'Hp'),
(620, 3, '2021-08-16 08:48:52.000000', 'DESKTOP-IBBCT42', 'Hp'),
(621, 3, '2021-08-17 08:25:34.000000', 'DESKTOP-IBBCT42', 'Hp'),
(622, 3, '2021-08-17 09:55:51.000000', 'DESKTOP-IBBCT42', 'Hp'),
(623, 3, '2021-08-18 08:34:29.000000', 'DESKTOP-IBBCT42', 'Hp'),
(624, 3, '2021-08-19 08:25:12.000000', 'DESKTOP-IBBCT42', 'Hp'),
(625, 3, '2021-08-20 08:24:05.000000', 'DESKTOP-IBBCT42', 'Hp'),
(626, 3, '2021-08-21 09:43:15.000000', 'DESKTOP-IBBCT42', 'Hp'),
(627, 3, '2021-08-23 08:14:22.000000', 'DESKTOP-IBBCT42', 'Hp'),
(628, 3, '2021-08-24 08:24:34.000000', 'DESKTOP-IBBCT42', 'Hp'),
(629, 3, '2021-08-25 08:39:30.000000', 'DESKTOP-IBBCT42', 'Hp'),
(630, 3, '2021-08-26 08:26:58.000000', 'DESKTOP-IBBCT42', 'Hp'),
(631, 3, '2021-08-27 08:20:19.000000', 'DESKTOP-IBBCT42', 'Hp'),
(632, 3, '2021-08-28 08:21:58.000000', 'DESKTOP-IBBCT42', 'Hp'),
(633, 3, '2021-08-31 08:23:08.000000', 'DESKTOP-IBBCT42', 'Hp'),
(634, 3, '2021-09-01 08:16:26.000000', 'DESKTOP-IBBCT42', 'Hp'),
(635, 3, '2021-09-02 08:39:08.000000', 'DESKTOP-IBBCT42', 'Hp'),
(636, 3, '2021-09-03 09:05:23.000000', 'DESKTOP-IBBCT42', 'Hp'),
(637, 3, '2021-09-06 08:44:38.000000', 'DESKTOP-IBBCT42', 'Hp'),
(638, 3, '2021-09-07 08:45:06.000000', 'DESKTOP-IBBCT42', 'Hp'),
(639, 3, '2021-09-08 08:45:24.000000', 'DESKTOP-IBBCT42', 'Hp'),
(640, 3, '2021-09-08 08:46:02.000000', 'DESKTOP-IBBCT42', 'Hp'),
(641, 3, '2021-09-09 08:38:38.000000', 'DESKTOP-IBBCT42', 'Hp'),
(642, 3, '2021-09-10 08:33:25.000000', 'DESKTOP-IBBCT42', 'Hp'),
(643, 3, '2021-09-10 09:09:28.000000', 'DESKTOP-IBBCT42', 'Hp'),
(644, 3, '2021-09-10 14:41:44.000000', 'DESKTOP-IBBCT42', 'Hp'),
(645, 3, '2021-09-11 08:56:45.000000', 'DESKTOP-IBBCT42', 'Hp'),
(646, 3, '2021-09-13 08:40:29.000000', 'DESKTOP-IBBCT42', 'Hp'),
(647, 3, '2021-09-14 08:27:29.000000', 'DESKTOP-IBBCT42', 'Hp'),
(648, 3, '2021-09-15 08:56:39.000000', 'DESKTOP-IBBCT42', 'Hp'),
(649, 3, '2021-09-15 17:33:11.000000', 'DESKTOP-IBBCT42', 'Hp'),
(650, 3, '2021-09-16 08:46:40.000000', 'DESKTOP-IBBCT42', 'Hp'),
(651, 3, '2021-09-17 08:27:31.000000', 'DESKTOP-IBBCT42', 'Hp'),
(652, 3, '2021-09-18 08:09:00.000000', 'DESKTOP-IBBCT42', 'Hp'),
(653, 3, '2021-09-20 08:26:10.000000', 'DESKTOP-IBBCT42', 'Hp'),
(654, 3, '2021-09-20 08:26:10.000000', 'DESKTOP-IBBCT42', 'Hp'),
(655, 3, '2021-09-21 08:31:18.000000', 'DESKTOP-IBBCT42', 'Hp'),
(656, 3, '2021-09-22 12:48:23.000000', 'DESKTOP-IBBCT42', 'Hp'),
(657, 3, '2021-09-22 12:54:45.000000', 'DESKTOP-IBBCT42', 'Hp'),
(658, 3, '2021-09-23 08:31:58.000000', 'DESKTOP-IBBCT42', 'Hp'),
(659, 3, '2021-09-24 08:34:25.000000', 'DESKTOP-IBBCT42', 'Hp'),
(660, 3, '2021-09-25 08:33:16.000000', 'DESKTOP-IBBCT42', 'Hp'),
(661, 3, '2021-09-27 08:40:16.000000', 'DESKTOP-IBBCT42', 'Hp'),
(662, 3, '2021-09-28 08:27:22.000000', 'DESKTOP-IBBCT42', 'Hp'),
(663, 3, '2021-09-28 18:40:38.000000', 'DESKTOP-IBBCT42', 'Hp'),
(664, 3, '2021-09-29 08:45:26.000000', 'DESKTOP-IBBCT42', 'Hp'),
(665, 3, '2021-09-30 08:45:45.000000', 'DESKTOP-IBBCT42', 'Hp'),
(666, 3, '2021-10-01 08:23:17.000000', 'DESKTOP-IBBCT42', 'Hp'),
(667, 3, '2021-10-02 08:30:13.000000', 'DESKTOP-IBBCT42', 'Hp'),
(668, 3, '2021-10-04 09:00:43.000000', 'DESKTOP-IBBCT42', 'Hp'),
(669, 3, '2021-10-05 08:33:23.000000', 'DESKTOP-IBBCT42', 'Hp'),
(670, 3, '2021-10-07 08:22:25.000000', 'DESKTOP-IBBCT42', 'Hp'),
(671, 3, '2021-10-08 08:33:38.000000', 'DESKTOP-IBBCT42', 'Hp'),
(672, 3, '2021-10-11 08:42:37.000000', 'DESKTOP-IBBCT42', 'Hp'),
(673, 3, '2021-10-12 08:06:12.000000', 'DESKTOP-IBBCT42', 'Hp'),
(674, 3, '2021-10-12 09:09:12.000000', 'DESKTOP-IBBCT42', 'Hp'),
(675, 3, '2021-10-13 14:25:32.000000', 'DESKTOP-IBBCT42', 'Hp'),
(676, 3, '2021-10-14 08:19:15.000000', 'DESKTOP-IBBCT42', 'Hp'),
(677, 3, '2021-10-15 08:44:13.000000', 'DESKTOP-IBBCT42', 'Hp'),
(678, 3, '2021-10-16 08:46:21.000000', 'DESKTOP-IBBCT42', 'Hp'),
(679, 3, '2021-10-18 08:34:48.000000', 'DESKTOP-IBBCT42', 'Hp'),
(680, 3, '2021-10-19 08:29:28.000000', 'DESKTOP-IBBCT42', 'Hp'),
(681, 3, '2021-10-20 08:34:14.000000', 'DESKTOP-IBBCT42', 'Hp'),
(682, 3, '2021-10-20 08:35:42.000000', 'DESKTOP-IBBCT42', 'Hp'),
(683, 1, '2021-10-21 07:53:22.000000', 'DESKTOP-JSCIEAB', 'LEONILDA'),
(684, 3, '2021-10-21 08:45:04.000000', 'DESKTOP-JSCIEAB', 'LEONILDA'),
(685, 3, '2021-10-21 17:38:40.000000', 'DESKTOP-JSCIEAB', 'LEONILDA'),
(686, 3, '2021-10-22 08:32:07.000000', 'DESKTOP-JSCIEAB', 'LEONILDA'),
(687, 3, '2021-10-23 10:32:12.000000', 'DESKTOP-JSCIEAB', 'LEONILDA'),
(688, 3, '2021-10-25 08:39:32.000000', 'DESKTOP-JSCIEAB', 'LEONILDA'),
(689, 3, '2021-10-26 08:19:13.000000', 'DESKTOP-JSCIEAB', 'LEONILDA'),
(690, 3, '2021-10-27 08:43:33.000000', 'DESKTOP-JSCIEAB', 'LEONILDA'),
(691, 3, '2021-10-28 08:42:35.000000', 'DESKTOP-JSCIEAB', 'LEONILDA'),
(692, 3, '2021-10-28 11:32:36.000000', 'DESKTOP-JSCIEAB', 'LEONILDA'),
(693, 3, '2021-10-29 08:29:47.000000', 'DESKTOP-JSCIEAB', 'LEONILDA'),
(694, 3, '2021-10-30 08:13:53.000000', 'DESKTOP-JSCIEAB', 'LEONILDA'),
(695, 3, '2021-11-01 08:29:32.000000', 'DESKTOP-JSCIEAB', 'LEONILDA'),
(696, 3, '2021-11-02 08:57:32.000000', 'DESKTOP-JSCIEAB', 'LEONILDA'),
(697, 3, '2021-11-03 08:26:20.000000', 'DESKTOP-JSCIEAB', 'LEONILDA'),
(698, 3, '2021-11-04 08:35:31.000000', 'DESKTOP-JSCIEAB', 'LEONILDA'),
(699, 3, '2021-11-08 08:40:43.000000', 'DESKTOP-JSCIEAB', 'LEONILDA'),
(700, 3, '2021-11-09 08:45:00.000000', 'DESKTOP-JSCIEAB', 'LEONILDA'),
(701, 3, '2021-11-10 08:25:34.000000', 'DESKTOP-JSCIEAB', 'LEONILDA'),
(702, 3, '2021-11-11 08:51:34.000000', 'DESKTOP-JSCIEAB', 'LEONILDA'),
(703, 3, '2021-11-12 08:37:59.000000', 'DESKTOP-JSCIEAB', 'LEONILDA'),
(704, 3, '2021-11-13 08:57:11.000000', 'DESKTOP-JSCIEAB', 'LEONILDA'),
(705, 3, '2021-11-15 08:28:14.000000', 'DESKTOP-JSCIEAB', 'LEONILDA'),
(706, 3, '2021-11-16 08:27:54.000000', 'DESKTOP-JSCIEAB', 'LEONILDA'),
(707, 3, '2021-11-17 08:31:18.000000', 'DESKTOP-JSCIEAB', 'LEONILDA'),
(708, 3, '2021-11-18 08:24:31.000000', 'DESKTOP-JSCIEAB', 'LEONILDA'),
(709, 3, '2021-11-19 08:22:18.000000', 'DESKTOP-JSCIEAB', 'LEONILDA'),
(710, 3, '2021-11-20 08:53:31.000000', 'DESKTOP-JSCIEAB', 'LEONILDA'),
(711, 3, '2021-11-22 08:29:20.000000', 'DESKTOP-JSCIEAB', 'LEONILDA'),
(712, 3, '2021-11-23 08:32:36.000000', 'DESKTOP-JSCIEAB', 'LEONILDA'),
(713, 3, '2021-11-24 09:52:12.000000', 'DESKTOP-JSCIEAB', 'LEONILDA'),
(714, 3, '2021-11-25 08:31:17.000000', 'DESKTOP-JSCIEAB', 'LEONILDA'),
(715, 3, '2021-11-26 08:37:36.000000', 'DESKTOP-JSCIEAB', 'LEONILDA'),
(716, 3, '2021-11-27 08:49:02.000000', 'DESKTOP-JSCIEAB', 'LEONILDA'),
(717, 3, '2021-11-29 08:59:22.000000', 'DESKTOP-JSCIEAB', 'LEONILDA'),
(718, 3, '2021-11-30 08:57:51.000000', 'DESKTOP-JSCIEAB', 'LEONILDA'),
(719, 3, '2021-12-01 08:45:31.000000', 'DESKTOP-JSCIEAB', 'LEONILDA'),
(720, 3, '2021-12-02 08:09:08.000000', 'DESKTOP-JSCIEAB', 'LEONILDA'),
(721, 3, '2021-12-03 08:39:27.000000', 'DESKTOP-JSCIEAB', 'LEONILDA'),
(722, 3, '2021-12-03 12:15:26.000000', 'DESKTOP-JSCIEAB', 'LEONILDA'),
(723, 3, '2021-12-03 12:17:44.000000', 'DESKTOP-JSCIEAB', 'LEONILDA'),
(724, 3, '2021-12-06 09:11:23.000000', 'DESKTOP-JSCIEAB', 'LEONILDA'),
(725, 3, '2021-12-06 09:47:28.000000', 'DESKTOP-JSCIEAB', 'LEONILDA'),
(726, 3, '2021-12-07 09:19:31.000000', 'DESKTOP-JSCIEAB', 'LEONILDA'),
(727, 3, '2021-12-08 09:04:02.000000', 'DESKTOP-JSCIEAB', 'LEONILDA'),
(728, 3, '2021-12-09 08:39:32.000000', 'DESKTOP-JSCIEAB', 'LEONILDA'),
(729, 3, '2021-12-10 10:31:21.000000', 'DESKTOP-JSCIEAB', 'LEONILDA'),
(730, 3, '2021-12-11 09:08:05.000000', 'DESKTOP-JSCIEAB', 'LEONILDA'),
(731, 3, '2021-12-13 08:20:22.000000', 'DESKTOP-JSCIEAB', 'LEONILDA'),
(732, 3, '2021-12-14 08:03:16.000000', 'DESKTOP-JSCIEAB', 'LEONILDA'),
(733, 3, '2021-12-15 08:36:55.000000', 'DESKTOP-JSCIEAB', 'LEONILDA'),
(734, 3, '2021-12-16 08:19:42.000000', 'DESKTOP-JSCIEAB', 'LEONILDA'),
(735, 3, '2021-12-17 09:59:43.000000', 'DESKTOP-JSCIEAB', 'LEONILDA'),
(736, 3, '2021-12-18 09:38:28.000000', 'DESKTOP-JSCIEAB', 'LEONILDA'),
(737, 3, '2021-12-20 08:42:21.000000', 'DESKTOP-JSCIEAB', 'LEONILDA'),
(738, 3, '2021-12-21 08:26:06.000000', 'DESKTOP-JSCIEAB', 'LEONILDA'),
(739, 1, '2021-12-21 09:13:56.000000', 'DESKTOP-JSCIEAB', 'LEONILDA'),
(740, 1, '2021-12-21 09:21:57.000000', 'DESKTOP-JSCIEAB', 'LEONILDA'),
(741, 3, '2021-12-22 08:30:27.000000', 'DESKTOP-JSCIEAB', 'LEONILDA'),
(742, 3, '2021-12-23 08:32:53.000000', 'DESKTOP-JSCIEAB', 'LEONILDA'),
(743, 3, '2021-12-24 10:46:11.000000', 'DESKTOP-JSCIEAB', 'LEONILDA'),
(744, 3, '2021-12-27 08:29:00.000000', 'DESKTOP-JSCIEAB', 'LEONILDA'),
(745, 3, '2021-12-27 09:01:40.000000', 'DESKTOP-JSCIEAB', 'LEONILDA'),
(746, 3, '2021-12-28 08:31:05.000000', 'DESKTOP-JSCIEAB', 'LEONILDA'),
(747, 3, '2021-12-29 08:44:36.000000', 'DESKTOP-JSCIEAB', 'LEONILDA'),
(748, 3, '2021-12-30 08:49:50.000000', 'DESKTOP-JSCIEAB', 'LEONILDA'),
(749, 3, '2021-12-31 08:36:39.000000', 'DESKTOP-JSCIEAB', 'LEONILDA'),
(750, 3, '2022-01-03 08:40:56.000000', 'DESKTOP-JSCIEAB', 'LEONILDA'),
(751, 3, '2022-01-04 08:20:08.000000', 'DESKTOP-JSCIEAB', 'LEONILDA'),
(752, 3, '2022-01-05 08:42:03.000000', 'DESKTOP-JSCIEAB', 'LEONILDA'),
(753, 3, '2022-01-06 08:35:35.000000', 'DESKTOP-JSCIEAB', 'LEONILDA'),
(754, 3, '2022-01-07 08:18:10.000000', 'DESKTOP-JSCIEAB', 'LEONILDA'),
(755, 3, '2022-01-08 08:23:09.000000', 'DESKTOP-JSCIEAB', 'LEONILDA'),
(756, 3, '2022-01-08 08:23:10.000000', 'DESKTOP-JSCIEAB', 'LEONILDA'),
(757, 3, '2022-01-08 08:23:42.000000', 'DESKTOP-JSCIEAB', 'LEONILDA'),
(758, 3, '2022-01-10 08:46:56.000000', 'DESKTOP-JSCIEAB', 'LEONILDA'),
(759, 3, '2022-01-11 08:03:45.000000', 'DESKTOP-JSCIEAB', 'LEONILDA'),
(760, 3, '2022-01-12 08:35:11.000000', 'DESKTOP-JSCIEAB', 'LEONILDA'),
(761, 3, '2022-01-13 08:21:33.000000', 'DESKTOP-JSCIEAB', 'LEONILDA'),
(762, 3, '2022-01-13 18:48:32.000000', 'DESKTOP-JSCIEAB', 'LEONILDA'),
(763, 3, '2022-01-14 08:16:52.000000', 'DESKTOP-JSCIEAB', 'LEONILDA'),
(764, 3, '2022-01-15 07:57:09.000000', 'DESKTOP-JSCIEAB', 'LEONILDA'),
(765, 3, '2022-01-17 08:44:03.000000', 'DESKTOP-JSCIEAB', 'LEONILDA'),
(766, 3, '2022-01-18 08:29:33.000000', 'DESKTOP-JSCIEAB', 'LEONILDA'),
(767, 3, '2022-01-18 10:42:25.000000', 'DESKTOP-JSCIEAB', 'LEONILDA'),
(768, 3, '2022-01-19 08:17:44.000000', 'DESKTOP-JSCIEAB', 'LEONILDA');
INSERT INTO `sistemalog` (`CODIGO_SISTEMALOG`, `CODIGO_USUARIO`, `FECHA_REGISTRO`, `NOMBRE_PC`, `USUARIO_PC`) VALUES
(769, 3, '2022-01-20 10:18:56.000000', 'DESKTOP-JSCIEAB', 'LEONILDA'),
(770, 3, '2022-01-21 08:13:19.000000', 'DESKTOP-JSCIEAB', 'LEONILDA'),
(771, 3, '2022-01-22 08:53:21.000000', 'DESKTOP-JSCIEAB', 'LEONILDA'),
(772, 3, '2022-01-24 08:37:05.000000', 'DESKTOP-JSCIEAB', 'LEONILDA'),
(773, 3, '2022-01-25 09:41:13.000000', 'DESKTOP-JSCIEAB', 'LEONILDA'),
(774, 3, '2022-01-26 09:36:24.000000', 'DESKTOP-JSCIEAB', 'LEONILDA'),
(775, 3, '2022-01-27 09:13:40.000000', 'DESKTOP-JSCIEAB', 'LEONILDA'),
(776, 3, '2022-01-28 09:26:18.000000', 'DESKTOP-JSCIEAB', 'LEONILDA'),
(777, 3, '2022-01-29 09:28:42.000000', 'DESKTOP-JSCIEAB', 'LEONILDA'),
(778, 3, '2022-01-31 08:10:43.000000', 'DESKTOP-JSCIEAB', 'LEONILDA'),
(779, 3, '2022-02-01 09:11:31.000000', 'DESKTOP-JSCIEAB', 'LEONILDA'),
(780, 3, '2022-02-02 08:43:04.000000', 'DESKTOP-JSCIEAB', 'LEONILDA'),
(781, 3, '2022-02-03 08:48:50.000000', 'DESKTOP-JSCIEAB', 'LEONILDA'),
(782, 3, '2022-02-04 09:03:11.000000', 'DESKTOP-JSCIEAB', 'LEONILDA'),
(783, 3, '2022-02-05 09:20:53.000000', 'DESKTOP-JSCIEAB', 'LEONILDA'),
(784, 3, '2022-02-07 08:27:55.000000', 'DESKTOP-JSCIEAB', 'LEONILDA'),
(785, 3, '2022-02-08 09:16:56.000000', 'DESKTOP-JSCIEAB', 'LEONILDA'),
(786, 3, '2022-02-09 09:22:48.000000', 'DESKTOP-JSCIEAB', 'LEONILDA'),
(787, 3, '2022-02-10 09:12:48.000000', 'DESKTOP-JSCIEAB', 'LEONILDA'),
(788, 3, '2022-02-11 09:18:23.000000', 'DESKTOP-JSCIEAB', 'LEONILDA'),
(789, 3, '2022-02-12 09:02:58.000000', 'DESKTOP-JSCIEAB', 'LEONILDA'),
(790, 3, '2022-02-14 08:46:12.000000', 'DESKTOP-JSCIEAB', 'LEONILDA'),
(791, 3, '2022-02-15 08:33:12.000000', 'DESKTOP-JSCIEAB', 'LEONILDA'),
(792, 3, '2022-02-16 08:58:08.000000', 'DESKTOP-JSCIEAB', 'LEONILDA'),
(793, 3, '2022-02-17 09:01:19.000000', 'DESKTOP-JSCIEAB', 'LEONILDA'),
(794, 3, '2022-02-18 08:20:06.000000', 'DESKTOP-JSCIEAB', 'LEONILDA'),
(795, 3, '2022-02-19 09:07:05.000000', 'DESKTOP-JSCIEAB', 'LEONILDA'),
(796, 3, '2022-02-21 08:51:32.000000', 'DESKTOP-JSCIEAB', 'LEONILDA'),
(797, 3, '2022-02-22 08:55:32.000000', 'DESKTOP-JSCIEAB', 'LEONILDA'),
(798, 3, '2022-02-23 08:27:40.000000', 'DESKTOP-JSCIEAB', 'LEONILDA'),
(799, 3, '2022-02-24 09:57:47.000000', 'DESKTOP-JSCIEAB', 'LEONILDA'),
(800, 3, '2022-02-25 08:42:14.000000', 'DESKTOP-JSCIEAB', 'LEONILDA'),
(801, 3, '2022-02-26 08:32:29.000000', 'DESKTOP-JSCIEAB', 'LEONILDA'),
(802, 3, '2022-02-28 09:30:58.000000', 'DESKTOP-JSCIEAB', 'LEONILDA'),
(803, 3, '2022-02-28 18:15:35.000000', 'DESKTOP-JSCIEAB', 'LEONILDA'),
(804, 3, '2022-03-01 08:42:04.000000', 'DESKTOP-JSCIEAB', 'LEONILDA'),
(805, 3, '2022-03-02 08:53:02.000000', 'DESKTOP-JSCIEAB', 'LEONILDA'),
(806, 3, '2022-03-03 08:45:40.000000', 'DESKTOP-JSCIEAB', 'LEONILDA'),
(807, 3, '2022-03-03 08:45:41.000000', 'DESKTOP-JSCIEAB', 'LEONILDA'),
(808, 3, '2022-03-03 08:48:02.000000', 'DESKTOP-JSCIEAB', 'LEONILDA'),
(809, 3, '2022-03-04 08:47:08.000000', 'DESKTOP-JSCIEAB', 'LEONILDA'),
(810, 3, '2022-03-05 10:11:49.000000', 'DESKTOP-JSCIEAB', 'LEONILDA'),
(811, 3, '2022-03-07 09:36:25.000000', 'DESKTOP-JSCIEAB', 'LEONILDA'),
(812, 3, '2022-03-08 08:46:21.000000', 'DESKTOP-JSCIEAB', 'LEONILDA'),
(813, 3, '2022-03-09 10:20:15.000000', 'DESKTOP-JSCIEAB', 'LEONILDA'),
(814, 3, '2022-03-09 10:25:38.000000', 'DESKTOP-JSCIEAB', 'LEONILDA'),
(815, 3, '2022-03-10 08:53:43.000000', 'DESKTOP-JSCIEAB', 'LEONILDA'),
(816, 3, '2022-03-11 10:37:22.000000', 'DESKTOP-JSCIEAB', 'LEONILDA'),
(817, 3, '2022-03-12 09:01:22.000000', 'DESKTOP-JSCIEAB', 'LEONILDA'),
(818, 3, '2022-03-14 09:49:05.000000', 'DESKTOP-JSCIEAB', 'LEONILDA'),
(819, 3, '2022-03-15 09:53:01.000000', 'DESKTOP-JSCIEAB', 'LEONILDA'),
(820, 3, '2022-03-16 09:16:40.000000', 'DESKTOP-JSCIEAB', 'LEONILDA'),
(821, 3, '2022-03-17 08:36:51.000000', 'DESKTOP-JSCIEAB', 'LEONILDA'),
(822, 3, '2022-03-18 08:10:23.000000', 'DESKTOP-JSCIEAB', 'LEONILDA'),
(823, 3, '2022-03-19 08:24:16.000000', 'DESKTOP-JSCIEAB', 'LEONILDA'),
(824, 3, '2022-03-21 08:23:23.000000', 'DESKTOP-JSCIEAB', 'LEONILDA'),
(825, 3, '2022-03-22 08:50:17.000000', 'DESKTOP-JSCIEAB', 'LEONILDA'),
(826, 3, '2022-03-23 08:58:31.000000', 'DESKTOP-JSCIEAB', 'LEONILDA'),
(827, 3, '2022-03-24 09:40:31.000000', 'DESKTOP-JSCIEAB', 'LEONILDA'),
(828, 3, '2022-03-25 08:38:51.000000', 'DESKTOP-JSCIEAB', 'LEONILDA'),
(829, 3, '2022-03-26 09:10:26.000000', 'DESKTOP-JSCIEAB', 'LEONILDA'),
(830, 3, '2022-03-28 08:06:07.000000', 'DESKTOP-JSCIEAB', 'LEONILDA'),
(831, 3, '2022-03-29 17:33:18.000000', 'DESKTOP-JSCIEAB', 'LEONILDA'),
(832, 3, '2022-03-30 08:15:30.000000', 'DESKTOP-JSCIEAB', 'LEONILDA'),
(833, 3, '2022-03-31 08:46:27.000000', 'DESKTOP-JSCIEAB', 'LEONILDA'),
(834, 3, '2022-03-31 09:03:07.000000', 'DESKTOP-JSCIEAB', 'LEONILDA'),
(835, 3, '2022-04-01 08:13:15.000000', 'DESKTOP-JSCIEAB', 'LEONILDA'),
(836, 3, '2022-04-02 09:54:34.000000', 'DESKTOP-JSCIEAB', 'LEONILDA'),
(837, 3, '2022-04-04 08:26:10.000000', 'DESKTOP-JSCIEAB', 'LEONILDA'),
(838, 3, '2022-04-05 08:15:15.000000', 'DESKTOP-JSCIEAB', 'LEONILDA'),
(839, 3, '2022-04-06 08:33:02.000000', 'DESKTOP-JSCIEAB', 'LEONILDA'),
(840, 3, '2022-04-07 08:56:45.000000', 'DESKTOP-JSCIEAB', 'LEONILDA'),
(841, 3, '2022-04-07 08:56:45.000000', 'DESKTOP-JSCIEAB', 'LEONILDA'),
(842, 3, '2022-04-08 08:49:41.000000', 'DESKTOP-JSCIEAB', 'LEONILDA'),
(843, 3, '2022-04-09 08:34:33.000000', 'DESKTOP-JSCIEAB', 'LEONILDA'),
(844, 3, '2022-04-11 07:52:16.000000', 'DESKTOP-JSCIEAB', 'LEONILDA'),
(845, 3, '2022-04-12 08:35:19.000000', 'DESKTOP-JSCIEAB', 'LEONILDA'),
(846, 3, '2022-04-12 08:45:54.000000', 'DESKTOP-JSCIEAB', 'LEONILDA'),
(847, 3, '2022-04-12 10:18:35.000000', 'DESKTOP-JSCIEAB', 'LEONILDA'),
(848, 3, '2022-04-12 10:33:11.000000', 'DESKTOP-JSCIEAB', 'LEONILDA'),
(849, 3, '2022-04-13 07:55:54.000000', 'DESKTOP-JSCIEAB', 'LEONILDA'),
(850, 3, '2022-04-14 09:01:40.000000', 'DESKTOP-JSCIEAB', 'LEONILDA'),
(851, 3, '2022-04-15 10:18:19.000000', 'DESKTOP-JSCIEAB', 'LEONILDA'),
(852, 3, '2022-04-16 08:44:28.000000', 'DESKTOP-JSCIEAB', 'LEONILDA'),
(853, 3, '2022-04-18 08:32:29.000000', 'DESKTOP-JSCIEAB', 'LEONILDA'),
(854, 3, '2022-04-18 08:32:36.000000', 'DESKTOP-JSCIEAB', 'LEONILDA'),
(855, 3, '2022-04-18 08:33:23.000000', 'DESKTOP-JSCIEAB', 'LEONILDA'),
(856, 3, '2022-04-18 08:33:23.000000', 'DESKTOP-JSCIEAB', 'LEONILDA'),
(857, 3, '2022-04-18 08:34:43.000000', 'DESKTOP-JSCIEAB', 'LEONILDA'),
(858, 3, '2022-04-19 08:36:17.000000', 'DESKTOP-JSCIEAB', 'LEONILDA'),
(859, 3, '2022-04-20 08:46:47.000000', 'DESKTOP-JSCIEAB', 'LEONILDA'),
(860, 3, '2022-04-20 08:47:46.000000', 'DESKTOP-JSCIEAB', 'LEONILDA'),
(861, 3, '2022-04-21 07:54:07.000000', 'DESKTOP-JSCIEAB', 'LEONILDA'),
(862, 3, '2022-04-22 08:32:47.000000', 'DESKTOP-JSCIEAB', 'LEONILDA'),
(863, 3, '2022-04-23 08:18:24.000000', 'DESKTOP-JSCIEAB', 'LEONILDA'),
(864, 3, '2022-04-25 08:49:42.000000', 'DESKTOP-JSCIEAB', 'LEONILDA'),
(865, 3, '2022-04-26 08:18:56.000000', 'DESKTOP-JSCIEAB', 'LEONILDA'),
(866, 3, '2022-04-26 18:20:00.000000', 'DESKTOP-JSCIEAB', 'LEONILDA'),
(867, 3, '2022-04-27 07:59:16.000000', 'DESKTOP-JSCIEAB', 'LEONILDA'),
(868, 3, '2022-04-27 22:23:23.000000', 'DESKTOP-JSCIEAB', 'LEONILDA'),
(869, 1, '2022-05-03 22:07:03.000000', 'DESKTOP-LB5Q639', 'SICHA'),
(870, 1, '2022-05-03 22:28:32.000000', 'DESKTOP-LB5Q639', 'SICHA'),
(871, 1, '2022-05-03 22:33:05.000000', 'DESKTOP-LB5Q639', 'SICHA'),
(872, 1, '2022-05-03 22:42:31.000000', 'DESKTOP-LB5Q639', 'SICHA'),
(873, 1, '2022-05-03 22:49:45.000000', 'DESKTOP-LB5Q639', 'SICHA'),
(874, 1, '2022-05-03 22:58:53.000000', 'DESKTOP-LB5Q639', 'SICHA'),
(875, 1, '2022-05-03 23:23:10.000000', 'DESKTOP-LB5Q639', 'SICHA'),
(876, 1, '2022-05-03 23:27:44.000000', 'DESKTOP-LB5Q639', 'SICHA'),
(877, 1, '2022-05-04 23:02:38.000000', 'DESKTOP-LB5Q639', 'SICHA'),
(878, 1, '2022-05-05 22:21:05.000000', 'DESKTOP-LB5Q639', 'SICHA'),
(879, 1, '2022-05-05 22:22:07.000000', 'DESKTOP-LB5Q639', 'SICHA'),
(880, 1, '2022-05-05 22:35:09.000000', 'DESKTOP-LB5Q639', 'SICHA'),
(881, 1, '2022-05-06 21:34:08.000000', 'DESKTOP-LB5Q639', 'SICHA'),
(882, 1, '2022-05-06 21:37:52.000000', 'DESKTOP-LB5Q639', 'SICHA'),
(883, 1, '2022-05-09 22:47:20.000000', 'DESKTOP-LB5Q639', 'SICHA'),
(884, 1, '2022-05-09 22:56:39.000000', 'DESKTOP-LB5Q639', 'SICHA'),
(885, 1, '2022-05-09 23:03:10.000000', 'DESKTOP-LB5Q639', 'SICHA'),
(886, 1, '2022-05-09 23:07:30.000000', 'DESKTOP-LB5Q639', 'SICHA'),
(887, 1, '2022-05-09 23:10:54.000000', 'DESKTOP-LB5Q639', 'SICHA'),
(888, 1, '2022-05-09 23:15:43.000000', 'DESKTOP-LB5Q639', 'SICHA'),
(889, 1, '2022-05-09 23:17:27.000000', 'DESKTOP-LB5Q639', 'SICHA'),
(890, 1, '2022-05-09 23:20:33.000000', 'DESKTOP-LB5Q639', 'SICHA'),
(891, 1, '2022-05-09 23:27:03.000000', 'DESKTOP-LB5Q639', 'SICHA'),
(892, 1, '2022-05-09 23:29:10.000000', 'DESKTOP-LB5Q639', 'SICHA'),
(893, 1, '2022-05-09 23:31:04.000000', 'DESKTOP-LB5Q639', 'SICHA'),
(894, 1, '2022-05-09 23:33:03.000000', 'DESKTOP-LB5Q639', 'SICHA'),
(895, 1, '2022-05-09 23:36:15.000000', 'DESKTOP-LB5Q639', 'SICHA'),
(896, 1, '2022-05-09 23:40:05.000000', 'DESKTOP-LB5Q639', 'SICHA'),
(897, 1, '2022-05-09 23:41:57.000000', 'DESKTOP-LB5Q639', 'SICHA'),
(898, 1, '2022-05-09 23:48:40.000000', 'DESKTOP-LB5Q639', 'SICHA'),
(899, 1, '2022-05-09 23:54:18.000000', 'DESKTOP-LB5Q639', 'SICHA'),
(900, 1, '2022-05-09 23:59:23.000000', 'DESKTOP-LB5Q639', 'SICHA'),
(901, 1, '2022-05-16 20:31:57.000000', 'DESKTOP-LB5Q639', 'SICHA'),
(902, 1, '2022-05-19 20:15:26.000000', 'DESKTOP-LB5Q639', 'SICHA'),
(903, 1, '2022-05-19 21:38:45.000000', 'DESKTOP-LB5Q639', 'SICHA'),
(904, 1, '2022-05-19 21:39:47.000000', 'DESKTOP-LB5Q639', 'SICHA'),
(905, 1, '2022-05-19 21:45:16.000000', 'DESKTOP-LB5Q639', 'SICHA'),
(906, 1, '2022-05-19 21:50:27.000000', 'DESKTOP-LB5Q639', 'SICHA'),
(907, 1, '2022-05-19 21:54:18.000000', 'DESKTOP-LB5Q639', 'SICHA'),
(908, 1, '2022-05-19 22:37:58.000000', 'DESKTOP-LB5Q639', 'SICHA'),
(909, 1, '2022-05-19 22:41:41.000000', 'DESKTOP-LB5Q639', 'SICHA'),
(910, 1, '2022-05-19 22:48:03.000000', 'DESKTOP-LB5Q639', 'SICHA'),
(911, 1, '2022-05-19 22:48:59.000000', 'DESKTOP-LB5Q639', 'SICHA'),
(912, 1, '2022-05-19 22:57:45.000000', 'DESKTOP-LB5Q639', 'SICHA'),
(913, 1, '2022-05-19 23:05:09.000000', 'DESKTOP-LB5Q639', 'SICHA'),
(914, 1, '2022-05-19 23:07:38.000000', 'DESKTOP-LB5Q639', 'SICHA'),
(915, 1, '2022-05-19 23:10:28.000000', 'DESKTOP-LB5Q639', 'SICHA'),
(916, 1, '2022-05-19 23:12:07.000000', 'DESKTOP-LB5Q639', 'SICHA'),
(917, 1, '2022-05-19 23:39:03.000000', 'DESKTOP-LB5Q639', 'SICHA'),
(918, 1, '2022-05-19 23:40:09.000000', 'DESKTOP-LB5Q639', 'SICHA'),
(919, 1, '2022-05-19 23:50:03.000000', 'DESKTOP-LB5Q639', 'SICHA'),
(920, 1, '2022-05-19 23:51:02.000000', 'DESKTOP-LB5Q639', 'SICHA'),
(921, 1, '2022-05-20 21:16:10.000000', 'DESKTOP-LB5Q639', 'SICHA'),
(922, 1, '2022-05-20 21:23:51.000000', 'DESKTOP-LB5Q639', 'SICHA'),
(923, 1, '2022-05-20 21:30:20.000000', 'DESKTOP-LB5Q639', 'SICHA'),
(924, 1, '2022-05-20 21:34:12.000000', 'DESKTOP-LB5Q639', 'SICHA'),
(925, 1, '2022-05-20 21:48:10.000000', 'DESKTOP-LB5Q639', 'SICHA'),
(926, 1, '2022-05-20 21:56:45.000000', 'DESKTOP-LB5Q639', 'SICHA'),
(927, 1, '2022-05-20 22:00:34.000000', 'DESKTOP-LB5Q639', 'SICHA'),
(928, 1, '2022-05-20 22:35:19.000000', 'DESKTOP-LB5Q639', 'SICHA'),
(929, 1, '2022-05-20 22:35:51.000000', 'DESKTOP-LB5Q639', 'SICHA'),
(930, 1, '2022-05-20 22:52:27.000000', 'DESKTOP-LB5Q639', 'SICHA'),
(931, 1, '2022-05-20 22:57:23.000000', 'DESKTOP-LB5Q639', 'SICHA'),
(932, 1, '2022-05-20 23:01:53.000000', 'DESKTOP-LB5Q639', 'SICHA'),
(933, 1, '2022-05-20 23:11:32.000000', 'DESKTOP-LB5Q639', 'SICHA'),
(934, 1, '2022-05-20 23:55:40.000000', 'DESKTOP-LB5Q639', 'SICHA'),
(935, 1, '2022-05-22 14:17:39.000000', 'DESKTOP-LB5Q639', 'SICHA'),
(936, 1, '2022-05-22 17:09:53.000000', 'DESKTOP-LB5Q639', 'SICHA'),
(937, 1, '2022-05-22 17:27:10.000000', 'DESKTOP-LB5Q639', 'SICHA'),
(938, 1, '2022-05-22 18:14:28.000000', 'DESKTOP-LB5Q639', 'SICHA'),
(939, 1, '2022-05-22 18:19:13.000000', 'DESKTOP-LB5Q639', 'SICHA'),
(940, 1, '2022-05-22 18:20:57.000000', 'DESKTOP-LB5Q639', 'SICHA'),
(941, 1, '2022-05-22 18:21:52.000000', 'DESKTOP-LB5Q639', 'SICHA'),
(942, 1, '2022-05-22 18:24:30.000000', 'DESKTOP-LB5Q639', 'SICHA'),
(943, 1, '2022-05-22 18:52:13.000000', 'DESKTOP-LB5Q639', 'SICHA'),
(944, 1, '2022-05-22 18:54:36.000000', 'DESKTOP-LB5Q639', 'SICHA'),
(945, 1, '2022-05-22 18:55:53.000000', 'DESKTOP-LB5Q639', 'SICHA'),
(946, 1, '2022-05-22 19:32:59.000000', 'DESKTOP-LB5Q639', 'SICHA'),
(947, 1, '2022-05-22 19:45:17.000000', 'DESKTOP-LB5Q639', 'SICHA'),
(948, 1, '2022-05-22 19:48:12.000000', 'DESKTOP-LB5Q639', 'SICHA'),
(949, 1, '2022-05-22 19:50:37.000000', 'DESKTOP-LB5Q639', 'SICHA'),
(950, 1, '2022-05-22 19:52:25.000000', 'DESKTOP-LB5Q639', 'SICHA'),
(951, 1, '2022-05-22 19:57:10.000000', 'DESKTOP-LB5Q639', 'SICHA'),
(952, 1, '2022-05-22 19:59:49.000000', 'DESKTOP-LB5Q639', 'SICHA'),
(953, 1, '2022-05-22 20:04:47.000000', 'DESKTOP-LB5Q639', 'SICHA'),
(954, 1, '2022-05-22 20:06:44.000000', 'DESKTOP-LB5Q639', 'SICHA'),
(955, 1, '2022-05-22 20:09:26.000000', 'DESKTOP-LB5Q639', 'SICHA'),
(956, 1, '2022-05-22 20:19:57.000000', 'DESKTOP-LB5Q639', 'SICHA'),
(957, 1, '2022-05-22 20:22:44.000000', 'DESKTOP-LB5Q639', 'SICHA'),
(958, 1, '2022-05-22 20:39:58.000000', 'DESKTOP-LB5Q639', 'SICHA'),
(959, 1, '2022-05-22 20:42:04.000000', 'DESKTOP-LB5Q639', 'SICHA'),
(960, 1, '2022-05-22 20:47:01.000000', 'DESKTOP-LB5Q639', 'SICHA'),
(961, 1, '2022-05-22 20:49:19.000000', 'DESKTOP-LB5Q639', 'SICHA'),
(962, 1, '2022-05-22 20:53:05.000000', 'DESKTOP-LB5Q639', 'SICHA'),
(963, 1, '2022-05-22 20:55:57.000000', 'DESKTOP-LB5Q639', 'SICHA'),
(964, 1, '2022-05-22 20:59:43.000000', 'DESKTOP-LB5Q639', 'SICHA'),
(965, 1, '2022-05-22 21:07:04.000000', 'DESKTOP-LB5Q639', 'SICHA'),
(966, 1, '2022-05-22 21:08:47.000000', 'DESKTOP-LB5Q639', 'SICHA'),
(967, 1, '2022-05-22 21:23:52.000000', 'DESKTOP-LB5Q639', 'SICHA'),
(968, 1, '2022-05-22 21:25:47.000000', 'DESKTOP-LB5Q639', 'SICHA'),
(969, 1, '2022-05-22 21:28:56.000000', 'DESKTOP-LB5Q639', 'SICHA'),
(970, 1, '2022-05-22 21:39:39.000000', 'DESKTOP-LB5Q639', 'SICHA'),
(971, 1, '2022-05-22 21:44:28.000000', 'DESKTOP-LB5Q639', 'SICHA'),
(972, 1, '2022-05-22 21:47:50.000000', 'DESKTOP-LB5Q639', 'SICHA'),
(973, 1, '2022-05-22 21:47:50.000000', 'DESKTOP-LB5Q639', 'SICHA'),
(974, 1, '2022-05-22 21:50:27.000000', 'DESKTOP-LB5Q639', 'SICHA'),
(975, 1, '2022-05-22 21:56:27.000000', 'DESKTOP-LB5Q639', 'SICHA'),
(976, 1, '2022-05-22 21:59:16.000000', 'DESKTOP-LB5Q639', 'SICHA'),
(977, 1, '2022-05-22 22:05:46.000000', 'DESKTOP-LB5Q639', 'SICHA'),
(978, 1, '2022-05-22 22:09:57.000000', 'DESKTOP-LB5Q639', 'SICHA'),
(979, 1, '2022-05-22 22:12:48.000000', 'DESKTOP-LB5Q639', 'SICHA'),
(980, 1, '2022-05-22 22:35:48.000000', 'DESKTOP-LB5Q639', 'SICHA'),
(981, 1, '2022-05-22 22:44:41.000000', 'DESKTOP-LB5Q639', 'SICHA'),
(982, 1, '2022-05-22 22:53:14.000000', 'DESKTOP-LB5Q639', 'SICHA'),
(983, 1, '2022-05-22 22:54:18.000000', 'DESKTOP-LB5Q639', 'SICHA'),
(984, 1, '2022-05-22 22:55:31.000000', 'DESKTOP-LB5Q639', 'SICHA'),
(985, 1, '2022-05-22 22:57:04.000000', 'DESKTOP-LB5Q639', 'SICHA'),
(986, 1, '2022-05-22 22:59:54.000000', 'DESKTOP-LB5Q639', 'SICHA'),
(987, 1, '2022-05-22 23:08:27.000000', 'DESKTOP-LB5Q639', 'SICHA'),
(988, 1, '2022-05-22 23:18:32.000000', 'DESKTOP-LB5Q639', 'SICHA'),
(989, 1, '2022-05-22 23:21:16.000000', 'DESKTOP-LB5Q639', 'SICHA'),
(990, 1, '2022-05-23 20:28:03.000000', 'DESKTOP-LB5Q639', 'SICHA'),
(991, 1, '2022-05-23 20:34:19.000000', 'DESKTOP-LB5Q639', 'SICHA'),
(992, 1, '2022-05-23 20:49:41.000000', 'DESKTOP-LB5Q639', 'SICHA'),
(993, 1, '2022-05-23 20:53:17.000000', 'DESKTOP-LB5Q639', 'SICHA'),
(994, 1, '2022-05-23 20:55:35.000000', 'DESKTOP-LB5Q639', 'SICHA'),
(995, 1, '2022-05-23 21:06:06.000000', 'DESKTOP-LB5Q639', 'SICHA'),
(996, 1, '2022-05-23 21:11:26.000000', 'DESKTOP-LB5Q639', 'SICHA'),
(997, 1, '2022-05-23 21:20:18.000000', 'DESKTOP-LB5Q639', 'SICHA'),
(998, 1, '2022-05-23 21:29:01.000000', 'DESKTOP-LB5Q639', 'SICHA'),
(999, 1, '2022-05-23 21:30:06.000000', 'DESKTOP-LB5Q639', 'SICHA'),
(1000, 1, '2022-05-23 21:32:53.000000', 'DESKTOP-LB5Q639', 'SICHA'),
(1001, 1, '2022-05-23 21:35:55.000000', 'DESKTOP-LB5Q639', 'SICHA'),
(1002, 1, '2022-05-23 21:44:52.000000', 'DESKTOP-LB5Q639', 'SICHA'),
(1003, 1, '2022-05-23 21:46:31.000000', 'DESKTOP-LB5Q639', 'SICHA'),
(1004, 1, '2022-05-23 22:32:46.000000', 'DESKTOP-LB5Q639', 'SICHA'),
(1005, 1, '2022-05-23 22:37:01.000000', 'DESKTOP-LB5Q639', 'SICHA'),
(1006, 1, '2022-05-23 22:50:21.000000', 'DESKTOP-LB5Q639', 'SICHA'),
(1007, 1, '2022-05-23 22:53:42.000000', 'DESKTOP-LB5Q639', 'SICHA'),
(1008, 1, '2022-05-23 23:02:25.000000', 'DESKTOP-LB5Q639', 'SICHA'),
(1009, 1, '2022-05-23 23:10:49.000000', 'DESKTOP-LB5Q639', 'SICHA'),
(1010, 1, '2022-05-23 23:12:54.000000', 'DESKTOP-LB5Q639', 'SICHA'),
(1011, 1, '2022-05-23 23:17:54.000000', 'DESKTOP-LB5Q639', 'SICHA'),
(1012, 1, '2022-05-23 23:19:37.000000', 'DESKTOP-LB5Q639', 'SICHA'),
(1013, 1, '2022-05-23 23:22:54.000000', 'DESKTOP-LB5Q639', 'SICHA'),
(1014, 1, '2022-05-23 23:43:15.000000', 'DESKTOP-LB5Q639', 'SICHA'),
(1015, 1, '2022-05-24 21:32:30.000000', 'DESKTOP-LB5Q639', 'SICHA'),
(1016, 1, '2022-05-24 21:37:47.000000', 'DESKTOP-LB5Q639', 'SICHA'),
(1017, 1, '2022-05-24 21:39:27.000000', 'DESKTOP-LB5Q639', 'SICHA'),
(1018, 1, '2022-05-24 21:41:52.000000', 'DESKTOP-LB5Q639', 'SICHA'),
(1019, 1, '2022-05-24 21:47:56.000000', 'DESKTOP-LB5Q639', 'SICHA'),
(1020, 1, '2022-05-24 21:51:34.000000', 'DESKTOP-LB5Q639', 'SICHA'),
(1021, 1, '2022-05-24 21:52:36.000000', 'DESKTOP-LB5Q639', 'SICHA'),
(1022, 1, '2022-05-24 21:59:34.000000', 'DESKTOP-LB5Q639', 'SICHA'),
(1023, 1, '2022-05-24 22:01:29.000000', 'DESKTOP-LB5Q639', 'SICHA'),
(1024, 1, '2022-05-24 22:03:21.000000', 'DESKTOP-LB5Q639', 'SICHA'),
(1025, 1, '2022-05-24 22:04:34.000000', 'DESKTOP-LB5Q639', 'SICHA'),
(1026, 1, '2022-05-24 22:15:55.000000', 'DESKTOP-LB5Q639', 'SICHA'),
(1027, 1, '2022-05-24 22:23:30.000000', 'DESKTOP-LB5Q639', 'SICHA'),
(1028, 1, '2022-05-24 22:24:54.000000', 'DESKTOP-LB5Q639', 'SICHA'),
(1029, 1, '2022-05-24 22:32:28.000000', 'DESKTOP-LB5Q639', 'SICHA'),
(1030, 1, '2022-05-24 22:33:32.000000', 'DESKTOP-LB5Q639', 'SICHA'),
(1031, 1, '2022-05-24 22:35:43.000000', 'DESKTOP-LB5Q639', 'SICHA'),
(1032, 1, '2022-05-24 22:38:30.000000', 'DESKTOP-LB5Q639', 'SICHA'),
(1033, 1, '2022-05-24 22:42:30.000000', 'DESKTOP-LB5Q639', 'SICHA'),
(1034, 1, '2022-05-24 22:46:24.000000', 'DESKTOP-LB5Q639', 'SICHA'),
(1035, 1, '2022-05-24 22:50:47.000000', 'DESKTOP-LB5Q639', 'SICHA'),
(1036, 1, '2022-05-24 22:55:54.000000', 'DESKTOP-LB5Q639', 'SICHA'),
(1037, 1, '2022-05-24 22:56:53.000000', 'DESKTOP-LB5Q639', 'SICHA'),
(1038, 1, '2022-05-24 23:10:37.000000', 'DESKTOP-LB5Q639', 'SICHA'),
(1039, 1, '2022-07-04 17:04:56.000000', 'DESKTOP-LB5Q639', 'SICHA'),
(1040, 1, '2022-07-28 12:57:54.000000', 'DESKTOP-LB5Q639', 'SICHA'),
(1041, 1, '2022-07-28 13:09:26.000000', 'DESKTOP-LB5Q639', 'SICHA'),
(1042, 1, '2022-07-28 13:09:26.000000', 'DESKTOP-LB5Q639', 'SICHA'),
(1043, 1, '2022-07-28 13:15:59.000000', 'DESKTOP-LB5Q639', 'SICHA'),
(1044, 1, '2022-08-02 21:08:21.000000', 'DESKTOP-LB5Q639', 'SICHA'),
(1045, 1, '2022-08-02 21:10:40.000000', 'DESKTOP-LB5Q639', 'SICHA'),
(1046, 1, '2022-08-02 21:12:27.000000', 'DESKTOP-LB5Q639', 'SICHA'),
(1047, 1, '2022-08-02 21:19:31.000000', 'DESKTOP-LB5Q639', 'SICHA'),
(1048, 1, '2022-10-17 22:28:54.000000', 'DESKTOP-LB5Q639', 'SICHA'),
(1049, 1, '2022-11-05 19:48:35.000000', 'DESKTOP-LB5Q639', 'SICHA'),
(1050, 1, '2022-11-13 21:14:19.000000', 'DESKTOP-LB5Q639', 'SICHA'),
(1051, 1, '2023-01-02 23:36:50.000000', 'DESKTOP-LB5Q639', 'SICHA'),
(1052, 1, '2023-01-03 20:02:06.000000', 'DESKTOP-LB5Q639', 'SICHA'),
(1053, 1, '2023-01-04 23:18:39.000000', 'DESKTOP-LB5Q639', 'SICHA'),
(1054, 1, '2023-01-05 22:52:22.000000', 'DESKTOP-LB5Q639', 'SICHA'),
(1055, 1, '2023-01-06 22:34:25.000000', 'DESKTOP-LB5Q639', 'SICHA'),
(1056, 1, '2023-01-06 23:08:28.000000', 'DESKTOP-LB5Q639', 'SICHA');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tema_sistema`
--

CREATE TABLE `tema_sistema` (
  `CODIGO_TEMA` int(11) NOT NULL,
  `DESCRIPCION` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `tema_sistema`
--

INSERT INTO `tema_sistema` (`CODIGO_TEMA`, `DESCRIPCION`) VALUES
(1, 'AMARACH'),
(2, 'AQUA'),
(3, 'ARCHITECTBLUE'),
(4, 'ARCHITECTOLIVE'),
(6, 'B0SUMI'),
(5, 'B0SUMIERGO'),
(7, 'BBJ'),
(8, 'BEIGEAZUL'),
(9, 'BEOS'),
(10, 'BLUEMETAL'),
(11, 'BLUERESH_RAVEN'),
(12, 'BLUETURQUESA'),
(13, 'CELLSHADED'),
(14, 'CHANINJA-BLUE'),
(15, 'CORONAH'),
(16, 'COUGAR'),
(17, 'CRYSTAL2'),
(18, 'FATALE'),
(19, 'GFXOASIS'),
(20, 'GORILLA'),
(45, 'HMMXPBLUE'),
(21, 'HMMXPMONOBLUE'),
(22, 'IBAR'),
(23, 'MACOS'),
(24, 'MIDNIGHT'),
(25, 'MMMAGRA-X'),
(26, 'MODERN'),
(27, 'OLIVEGREENLUNAXP'),
(28, 'OPUSLUNASILVER'),
(29, 'OPUSOSBLUE'),
(30, 'OPUSOSDEEP'),
(31, 'OPUSOSOLIVE'),
(32, 'RESH_RAVEN'),
(33, 'ROUEBLUE'),
(34, 'ROUEBROWN'),
(35, 'ROUEGREEN'),
(36, 'ROYALINSPIRA'),
(37, 'SILVERLUNAXP'),
(38, 'SOLUNAR'),
(40, 'TIGER'),
(39, 'TIGERGRAPHITE'),
(41, 'TOXIC'),
(42, 'UNDERLING'),
(43, 'WHISTLER'),
(44, 'XPLUNA');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tema_usuario`
--

CREATE TABLE `tema_usuario` (
  `CODIGO_TEMA_USUARIO` int(11) NOT NULL,
  `CODIGO_TEMA` int(11) NOT NULL,
  `CODIGO_USUARIO` int(11) NOT NULL,
  `FONDO` longblob DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_cliente`
--

CREATE TABLE `tipo_cliente` (
  `CODIGO_TIPO_CLIENTE` int(11) NOT NULL,
  `NOMBRE_TIPOCLIENTE` varchar(50) DEFAULT 'null'
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Volcado de datos para la tabla `tipo_cliente`
--

INSERT INTO `tipo_cliente` (`CODIGO_TIPO_CLIENTE`, `NOMBRE_TIPOCLIENTE`) VALUES
(1, 'LOCAL'),
(2, 'PROVINCIAL'),
(3, 'INTERPROVINCIAL');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_contribuyente`
--

CREATE TABLE `tipo_contribuyente` (
  `CODIGO_TIPO_CONTRIBUYENTE` int(11) NOT NULL,
  `DESCRIPCION` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Volcado de datos para la tabla `tipo_contribuyente`
--

INSERT INTO `tipo_contribuyente` (`CODIGO_TIPO_CONTRIBUYENTE`, `DESCRIPCION`) VALUES
(1, 'PERSONA NATURAL'),
(2, 'PERSONA JURIDICA'),
(3, 'INTERNACIONAL');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_documentos`
--

CREATE TABLE `tipo_documentos` (
  `CODIGO_DOCUMENTO` int(11) NOT NULL,
  `NOMBRE` varchar(50) NOT NULL,
  `NUMERACION` varchar(5) NOT NULL,
  `NRO_INICIAL` varchar(7) NOT NULL,
  `NRO_FINAL` varchar(7) NOT NULL,
  `FECHA_REGISTRO` timestamp NOT NULL DEFAULT current_timestamp(),
  `ESTADO` enum('ACTIVO','INACTIVO') DEFAULT NULL COMMENT 'ACTIVO,INACTIVO',
  `CODIGO_USUARIO` int(11) DEFAULT NULL,
  `TYPE_DOC` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `tipo_documentos`
--

INSERT INTO `tipo_documentos` (`CODIGO_DOCUMENTO`, `NOMBRE`, `NUMERACION`, `NRO_INICIAL`, `NRO_FINAL`, `FECHA_REGISTRO`, `ESTADO`, `CODIGO_USUARIO`, `TYPE_DOC`) VALUES
(1, 'FACTURA ELECTRÃNICA', 'FFF1', '0000001', '9999999', '2021-01-24 05:00:00', 'ACTIVO', 1, 1),
(2, 'BOLETA DE VENTA ELECTRÃNICA', 'BBB1', '0000001', '9999999', '2021-01-24 05:00:00', 'ACTIVO', 1, 2),
(3, 'NOTA DE CRÃDITO ELECTRÃNICA', 'FFF1', '0000001', '9999999', '2021-05-22 05:00:00', 'ACTIVO', 1, 3),
(4, 'NOTA DE DÃBITO ELECTRÃNICA', 'BBB1', '0000001', '9999999', '2021-05-22 05:00:00', 'ACTIVO', 1, 4);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_documento_contribuyente`
--

CREATE TABLE `tipo_documento_contribuyente` (
  `CODIGO` int(11) NOT NULL,
  `DESCRIPCION` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Volcado de datos para la tabla `tipo_documento_contribuyente`
--

INSERT INTO `tipo_documento_contribuyente` (`CODIGO`, `DESCRIPCION`) VALUES
(1, 'DNI'),
(4, 'CARNET DE EXTRANJERÃA'),
(6, 'RUC'),
(7, 'PASAPORTE');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_nota`
--

CREATE TABLE `tipo_nota` (
  `CODIGO_TIPO_NOTA` int(11) NOT NULL,
  `TYPO_NOTA` int(11) NOT NULL,
  `DESCRIPCION` varchar(100) NOT NULL,
  `CODIGO_DOCUMENTO` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Volcado de datos para la tabla `tipo_nota`
--

INSERT INTO `tipo_nota` (`CODIGO_TIPO_NOTA`, `TYPO_NOTA`, `DESCRIPCION`, `CODIGO_DOCUMENTO`) VALUES
(1, 1, 'ANULACIÃ?N DE LA OPERACIÃ?N', 3),
(2, 2, 'ANULACIÃ?N POR ERROR EN EL RUC', 3),
(3, 3, 'CORRECCIÃ?N POR ERROR EN LA DESCRIPCIÃ?N', 3),
(4, 4, 'DESCUENTO GLOBAL', 3),
(5, 5, 'DESCUENTO POR ÃTEM', 3),
(6, 6, 'DEVOLUCIÃ?N TOTAL', 3),
(7, 7, 'DEVOLUCIÃ?N POR ÃTEM', 3),
(8, 8, 'BONIFICACIÃ?N', 3),
(9, 9, 'DISMINUCIÃ?N EN EL VALOR', 3),
(10, 10, 'OTROS CONCEPTOS', 3),
(11, 11, 'AJUSTES AFECTOS AL IVAP', 3),
(12, 12, 'AJUSTES DE OPERACIONES DE EXPORTACIÃ?N', 3),
(13, 13, 'AJUSTES - MONTOS Y/O FECHAS DE PAGO', 3),
(14, 1, 'INTERESES POR MORA', 4),
(15, 2, 'AUMENTO DE VALOR', 4),
(16, 3, 'PENALIDADES', 4),
(17, 4, 'AJUSTES AFECTOS AL IVAP', 4),
(18, 5, 'AJUSTES DE OPERACIONES DE EXPORTACIÃ?N', 4);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `transacciones`
--

CREATE TABLE `transacciones` (
  `ID` int(11) NOT NULL,
  `CODIGO_PROVEEDOR` int(11) NOT NULL,
  `NRO` varchar(255) DEFAULT NULL,
  `NRO_CONTENEDOR` varchar(255) DEFAULT NULL,
  `CORICO` varchar(255) DEFAULT NULL,
  `DESCRIPCION` varchar(255) DEFAULT NULL,
  `DETALLE` varchar(255) DEFAULT NULL,
  `FLETE` varchar(255) DEFAULT NULL,
  `GIRO_CHINA` varchar(255) DEFAULT NULL,
  `PAGO_YUAN` varchar(255) DEFAULT NULL,
  `FECHA_SALIDA` date DEFAULT NULL,
  `FECHA_LLEGADA` date DEFAULT NULL,
  `BL` varchar(255) DEFAULT NULL,
  `OBSERVACION` text DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `traslado`
--

CREATE TABLE `traslado` (
  `CODIGO_TRASLADO` int(11) NOT NULL,
  `CODIGO_PRODUCTO` int(11) NOT NULL,
  `ALMACEN` int(11) NOT NULL,
  `ALMACEN_TRASLADO` int(11) NOT NULL,
  `CANTIDAD` int(11) NOT NULL,
  `FECHA` date NOT NULL,
  `STATUS_TRASLADO` varchar(30) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ubigeo`
--

CREATE TABLE `ubigeo` (
  `ID` int(11) NOT NULL,
  `UBIGEO` int(6) UNSIGNED ZEROFILL DEFAULT NULL,
  `DISTRITO` varchar(36) NOT NULL,
  `CODIGO_UBIGEO` int(11) NOT NULL,
  `PROVINCIA` varchar(25) NOT NULL,
  `CODIGO_DEPARTAMENTO` int(11) NOT NULL,
  `DEPARTAMENTO` varchar(13) NOT NULL,
  `FIELD7` int(11) NOT NULL,
  `FIELD8` varchar(61) NOT NULL,
  `FIELD9` varchar(73) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE `usuario` (
  `CODIGO_USUARIO` int(11) NOT NULL,
  `NOMBRES` varchar(100) NOT NULL,
  `DNI` char(8) NOT NULL,
  `CLAVE` varchar(100) NOT NULL,
  `FECHA_REGISTRO` datetime NOT NULL DEFAULT current_timestamp(),
  `ESTADO` int(11) NOT NULL DEFAULT 0,
  `APELLIDOS` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`CODIGO_USUARIO`, `NOMBRES`, `DNI`, `CLAVE`, `FECHA_REGISTRO`, `ESTADO`, `APELLIDOS`) VALUES
(1, 'ADMINISTRADOR', '00000000', 'TWFzdGVyMTIz', '2021-01-15 11:34:55', 1, 'MASTER'),
(2, 'JENRRI MAYCOL', '71639672', 'Um9tZXJvMTIzQA==', '2021-01-15 11:57:25', 1, 'ROMERO MONTALBAN'),
(3, 'LEONILDA', '43201747', 'TGVvbmlsZGE0Mw==', '2021-02-04 17:44:01', 1, 'GONZALES ROMANI');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario_perfiles`
--

CREATE TABLE `usuario_perfiles` (
  `CODIGO_USUARIO_PERFILES` int(11) NOT NULL,
  `CODIGO_USUARIO` int(11) NOT NULL,
  `CODIGO_PERFIL` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Volcado de datos para la tabla `usuario_perfiles`
--

INSERT INTO `usuario_perfiles` (`CODIGO_USUARIO_PERFILES`, `CODIGO_USUARIO`, `CODIGO_PERFIL`) VALUES
(1, 1, 1),
(2, 2, 1),
(3, 3, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ventas`
--

CREATE TABLE `ventas` (
  `CODIGO_VENTAS` int(11) NOT NULL,
  `CODIGO_CLIENTE` int(11) NOT NULL,
  `CODIGO_USUARIO` int(11) NOT NULL,
  `TIPO_DOCUMENTO` varchar(50) NOT NULL,
  `SERIE` varchar(4) NOT NULL,
  `NUMERACION` varchar(7) NOT NULL,
  `TIPO_PAGO` varchar(50) NOT NULL,
  `FECHA_VENTA` timestamp NOT NULL DEFAULT current_timestamp(),
  `FECHA_VEN` timestamp NULL DEFAULT NULL,
  `MONTO_RECIBIDO` decimal(20,6) DEFAULT NULL,
  `TOTALS` decimal(20,6) NOT NULL,
  `ESTADO` varchar(25) NOT NULL DEFAULT 'PAGADO',
  `igv` decimal(20,6) DEFAULT NULL,
  `total` decimal(10,4) DEFAULT NULL,
  `MONEY` varchar(5) DEFAULT NULL,
  `TYPE_CHANGE` decimal(10,3) DEFAULT NULL,
  `SUNAT_TRANSANTION` int(11) DEFAULT NULL,
  `OBSERVATION` varchar(150) DEFAULT NULL,
  `TYPE_NOTA` int(11) DEFAULT NULL,
  `SERIENOTA` varchar(5) DEFAULT NULL,
  `NUMBERNOTA` varchar(9) DEFAULT NULL,
  `COMPROBANTE` varchar(50) DEFAULT NULL,
  `CODIGO_ANULACION` int(11) DEFAULT NULL,
  `OBS_ANULACION` text DEFAULT NULL,
  `ID_AUDITORIA` int(11) DEFAULT 0,
  `observacion1` varchar(30) NOT NULL,
  `observacion2` varchar(30) NOT NULL,
  `observacion3` varchar(30) NOT NULL,
  `ESTIBADOR` text DEFAULT NULL,
  `RUTA_DOCUMENTO` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci COMMENT='codigo de venta nÂ° 30 la  numeracion es  27';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ventas_direccion`
--

CREATE TABLE `ventas_direccion` (
  `ID` int(11) NOT NULL,
  `CODIGO_VENTA` int(11) NOT NULL,
  `DIRECCION` varchar(200) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `almacen`
--
ALTER TABLE `almacen`
  ADD PRIMARY KEY (`CODIGO_ALMACEN`);

--
-- Indices de la tabla `anular_documento`
--
ALTER TABLE `anular_documento`
  ADD PRIMARY KEY (`CODIGO_ANULAR`),
  ADD KEY `fk_ventas_anulardocumento_idx` (`CODIGO_VENTAS`);

--
-- Indices de la tabla `auditoria_dms_envio`
--
ALTER TABLE `auditoria_dms_envio`
  ADD PRIMARY KEY (`ID`);

--
-- Indices de la tabla `auditoria_venta`
--
ALTER TABLE `auditoria_venta`
  ADD PRIMARY KEY (`CODIGO_AUDITORIA`);

--
-- Indices de la tabla `cajas`
--
ALTER TABLE `cajas`
  ADD PRIMARY KEY (`CODIGO_CAJA`);

--
-- Indices de la tabla `categoria`
--
ALTER TABLE `categoria`
  ADD PRIMARY KEY (`CODIGO_CATEGORIA`);

--
-- Indices de la tabla `cliente`
--
ALTER TABLE `cliente`
  ADD PRIMARY KEY (`CODIGO_CLIENTE`);

--
-- Indices de la tabla `compras`
--
ALTER TABLE `compras`
  ADD PRIMARY KEY (`CODIGO_COMPRAS`),
  ADD KEY `CODIGO_PROVEEDOR` (`CODIGO_PROVEEDOR`);

--
-- Indices de la tabla `convenio_pago`
--
ALTER TABLE `convenio_pago`
  ADD PRIMARY KEY (`CODIGO_CONVENIO`);

--
-- Indices de la tabla `credito`
--
ALTER TABLE `credito`
  ADD PRIMARY KEY (`CREDITO_ID`);

--
-- Indices de la tabla `datanotas`
--
ALTER TABLE `datanotas`
  ADD PRIMARY KEY (`ID_NOTAS`);

--
-- Indices de la tabla `despacho_almacen`
--
ALTER TABLE `despacho_almacen`
  ADD PRIMARY KEY (`CODIGO_DESPACHO`);

--
-- Indices de la tabla `despacho_almacen_detalle_producto`
--
ALTER TABLE `despacho_almacen_detalle_producto`
  ADD PRIMARY KEY (`CODIGO_D_A_D_P`);

--
-- Indices de la tabla `detalle_compras`
--
ALTER TABLE `detalle_compras`
  ADD PRIMARY KEY (`CODIGO_DETALLE_COMPRAS`),
  ADD KEY `CODIGO_COMPRAS` (`CODIGO_COMPRAS`),
  ADD KEY `CODIGO_PRODUCTO` (`CODIGO_PRODUCTO`);

--
-- Indices de la tabla `detalle_ventas`
--
ALTER TABLE `detalle_ventas`
  ADD PRIMARY KEY (`CODIGO_DETALLE_VENTAS`),
  ADD KEY `detalle_ventas_ibfk_1` (`CODIGO_VENTAS`),
  ADD KEY `detalle_ventas_ibfk_2` (`CODIGO_PRODUCTO`);

--
-- Indices de la tabla `document`
--
ALTER TABLE `document`
  ADD PRIMARY KEY (`ID_DOC`);

--
-- Indices de la tabla `email_backup`
--
ALTER TABLE `email_backup`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `empresa_transporte`
--
ALTER TABLE `empresa_transporte`
  ADD PRIMARY KEY (`ID`);

--
-- Indices de la tabla `gastos`
--
ALTER TABLE `gastos`
  ADD PRIMARY KEY (`CODIGO_GASTO`);

--
-- Indices de la tabla `guia_remision`
--
ALTER TABLE `guia_remision`
  ADD PRIMARY KEY (`ID`);

--
-- Indices de la tabla `interprise`
--
ALTER TABLE `interprise`
  ADD PRIMARY KEY (`ID_INTERPRISE`);

--
-- Indices de la tabla `inventario`
--
ALTER TABLE `inventario`
  ADD PRIMARY KEY (`CODIGO_INVENTARIO`),
  ADD KEY `CODIGO_PRODUCTO` (`CODIGO_PRODUCTO`);

--
-- Indices de la tabla `items_gastos`
--
ALTER TABLE `items_gastos`
  ADD PRIMARY KEY (`CODIGO_ITEM`);

--
-- Indices de la tabla `lista_pedidos`
--
ALTER TABLE `lista_pedidos`
  ADD PRIMARY KEY (`ID`);

--
-- Indices de la tabla `marca`
--
ALTER TABLE `marca`
  ADD PRIMARY KEY (`CODIGO_MARCA`);

--
-- Indices de la tabla `nota_ventas`
--
ALTER TABLE `nota_ventas`
  ADD PRIMARY KEY (`CODIGO_NOTA_VENTA`),
  ADD KEY `fk_nota_venta_tipo_doc_idx` (`CODIGO_DOCUMENTO`),
  ADD KEY `fk_nota_venta_idx` (`CODIGO_VENTA`),
  ADD KEY `fk_nota_venta_tipo_nota_idx` (`TYPO_NOTA`);

--
-- Indices de la tabla `numeracion_guia`
--
ALTER TABLE `numeracion_guia`
  ADD PRIMARY KEY (`ID`);

--
-- Indices de la tabla `perfil`
--
ALTER TABLE `perfil`
  ADD PRIMARY KEY (`CODIGO_PERFIL`);

--
-- Indices de la tabla `perfil_recurso`
--
ALTER TABLE `perfil_recurso`
  ADD PRIMARY KEY (`CODIGO_PERFIL_RECURSO`),
  ADD KEY `CODIGO_PERFIL` (`CODIGO_PERFIL`),
  ADD KEY `CODIGO_RECURSO` (`CODIGO_RECURSO`);

--
-- Indices de la tabla `presentacion`
--
ALTER TABLE `presentacion`
  ADD PRIMARY KEY (`CODIGO_PRESENTACION`);

--
-- Indices de la tabla `producto`
--
ALTER TABLE `producto`
  ADD PRIMARY KEY (`CODIGO_PRODUCTO`),
  ADD KEY `producto_ibfk_1` (`CODIGO_CATEGORIA`),
  ADD KEY `producto_ibfk_2` (`CODIGO_PRESENTACION`),
  ADD KEY `producto_ibfk_3` (`CODIGO_MARCA`);

--
-- Indices de la tabla `proveedor`
--
ALTER TABLE `proveedor`
  ADD PRIMARY KEY (`CODIGO_PROVEEDOR`),
  ADD UNIQUE KEY `RUC_UNIQUE` (`RUC`),
  ADD KEY `fk_tipo_contribuyente_idx` (`TIPO_CONTRIBUYENTE`),
  ADD KEY `fk_tipo_documento_contribuyente_idx` (`TIPO_DOCUMENTO`);

--
-- Indices de la tabla `recursos`
--
ALTER TABLE `recursos`
  ADD PRIMARY KEY (`CODIGO_RECURSO`);

--
-- Indices de la tabla `sedes`
--
ALTER TABLE `sedes`
  ADD PRIMARY KEY (`ID_SEDE`);

--
-- Indices de la tabla `sistemalog`
--
ALTER TABLE `sistemalog`
  ADD PRIMARY KEY (`CODIGO_SISTEMALOG`),
  ADD KEY `CODIGO_SISTEMA_LOG_idx` (`CODIGO_USUARIO`);

--
-- Indices de la tabla `tema_sistema`
--
ALTER TABLE `tema_sistema`
  ADD PRIMARY KEY (`CODIGO_TEMA`),
  ADD UNIQUE KEY `DESCRIPCION_UNIQUE` (`DESCRIPCION`);

--
-- Indices de la tabla `tema_usuario`
--
ALTER TABLE `tema_usuario`
  ADD PRIMARY KEY (`CODIGO_TEMA_USUARIO`),
  ADD KEY `fk_co_temsis_idx` (`CODIGO_TEMA`),
  ADD KEY `fk_co_temusu_idx` (`CODIGO_USUARIO`);

--
-- Indices de la tabla `tipo_cliente`
--
ALTER TABLE `tipo_cliente`
  ADD PRIMARY KEY (`CODIGO_TIPO_CLIENTE`);

--
-- Indices de la tabla `tipo_contribuyente`
--
ALTER TABLE `tipo_contribuyente`
  ADD PRIMARY KEY (`CODIGO_TIPO_CONTRIBUYENTE`);

--
-- Indices de la tabla `tipo_documentos`
--
ALTER TABLE `tipo_documentos`
  ADD PRIMARY KEY (`CODIGO_DOCUMENTO`);

--
-- Indices de la tabla `tipo_documento_contribuyente`
--
ALTER TABLE `tipo_documento_contribuyente`
  ADD PRIMARY KEY (`CODIGO`);

--
-- Indices de la tabla `tipo_nota`
--
ALTER TABLE `tipo_nota`
  ADD PRIMARY KEY (`CODIGO_TIPO_NOTA`),
  ADD KEY `fk_nota_tipo_idx` (`CODIGO_DOCUMENTO`);

--
-- Indices de la tabla `transacciones`
--
ALTER TABLE `transacciones`
  ADD PRIMARY KEY (`ID`);

--
-- Indices de la tabla `traslado`
--
ALTER TABLE `traslado`
  ADD PRIMARY KEY (`CODIGO_TRASLADO`);

--
-- Indices de la tabla `ubigeo`
--
ALTER TABLE `ubigeo`
  ADD PRIMARY KEY (`ID`);

--
-- Indices de la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`CODIGO_USUARIO`),
  ADD UNIQUE KEY `DNI_UNIQUE` (`DNI`);

--
-- Indices de la tabla `usuario_perfiles`
--
ALTER TABLE `usuario_perfiles`
  ADD PRIMARY KEY (`CODIGO_USUARIO_PERFILES`),
  ADD KEY `CODIGO_USUARIO` (`CODIGO_USUARIO`),
  ADD KEY `CODIGO_PERFIL` (`CODIGO_PERFIL`);

--
-- Indices de la tabla `ventas`
--
ALTER TABLE `ventas`
  ADD PRIMARY KEY (`CODIGO_VENTAS`),
  ADD KEY `ventas_ibfk_1` (`CODIGO_CLIENTE`),
  ADD KEY `ventas_ibfk_2` (`CODIGO_USUARIO`);

--
-- Indices de la tabla `ventas_direccion`
--
ALTER TABLE `ventas_direccion`
  ADD PRIMARY KEY (`ID`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `compras`
--
ALTER TABLE `compras`
  MODIFY `CODIGO_COMPRAS` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=39;

--
-- AUTO_INCREMENT de la tabla `detalle_compras`
--
ALTER TABLE `detalle_compras`
  MODIFY `CODIGO_DETALLE_COMPRAS` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=534;

--
-- AUTO_INCREMENT de la tabla `detalle_ventas`
--
ALTER TABLE `detalle_ventas`
  MODIFY `CODIGO_DETALLE_VENTAS` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4650;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `anular_documento`
--
ALTER TABLE `anular_documento`
  ADD CONSTRAINT `fk_ventas_anulardocumento` FOREIGN KEY (`CODIGO_VENTAS`) REFERENCES `ventas` (`CODIGO_VENTAS`);

--
-- Filtros para la tabla `detalle_compras`
--
ALTER TABLE `detalle_compras`
  ADD CONSTRAINT `DETALLE_COMPRAS_ibfk_2` FOREIGN KEY (`CODIGO_PRODUCTO`) REFERENCES `producto` (`CODIGO_PRODUCTO`) ON UPDATE CASCADE,
  ADD CONSTRAINT `DETALLE_COMPRAS_ibfk_3` FOREIGN KEY (`CODIGO_COMPRAS`) REFERENCES `compras` (`CODIGO_COMPRAS`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `detalle_ventas`
--
ALTER TABLE `detalle_ventas`
  ADD CONSTRAINT `DETALLE_VENTAS_ibfk_1` FOREIGN KEY (`CODIGO_VENTAS`) REFERENCES `ventas` (`CODIGO_VENTAS`),
  ADD CONSTRAINT `DETALLE_VENTAS_ibfk_2` FOREIGN KEY (`CODIGO_PRODUCTO`) REFERENCES `producto` (`CODIGO_PRODUCTO`);

--
-- Filtros para la tabla `inventario`
--
ALTER TABLE `inventario`
  ADD CONSTRAINT `INVENTARIO_ibfk_1` FOREIGN KEY (`CODIGO_PRODUCTO`) REFERENCES `producto` (`CODIGO_PRODUCTO`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `nota_ventas`
--
ALTER TABLE `nota_ventas`
  ADD CONSTRAINT `fk_nota_venta` FOREIGN KEY (`CODIGO_VENTA`) REFERENCES `ventas` (`CODIGO_VENTAS`),
  ADD CONSTRAINT `fk_nota_venta_tipo_doc` FOREIGN KEY (`CODIGO_DOCUMENTO`) REFERENCES `tipo_documentos` (`CODIGO_DOCUMENTO`),
  ADD CONSTRAINT `fk_nota_venta_tipo_nota` FOREIGN KEY (`TYPO_NOTA`) REFERENCES `tipo_nota` (`CODIGO_TIPO_NOTA`);

--
-- Filtros para la tabla `perfil_recurso`
--
ALTER TABLE `perfil_recurso`
  ADD CONSTRAINT `PERFIL_RECURSO_ibfk_1` FOREIGN KEY (`CODIGO_PERFIL`) REFERENCES `perfil` (`CODIGO_PERFIL`),
  ADD CONSTRAINT `PERFIL_RECURSO_ibfk_2` FOREIGN KEY (`CODIGO_RECURSO`) REFERENCES `recursos` (`CODIGO_RECURSO`);

--
-- Filtros para la tabla `producto`
--
ALTER TABLE `producto`
  ADD CONSTRAINT `PRODUCTO_ibfk_1` FOREIGN KEY (`CODIGO_CATEGORIA`) REFERENCES `categoria` (`CODIGO_CATEGORIA`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `PRODUCTO_ibfk_2` FOREIGN KEY (`CODIGO_PRESENTACION`) REFERENCES `presentacion` (`CODIGO_PRESENTACION`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `PRODUCTO_ibfk_3` FOREIGN KEY (`CODIGO_MARCA`) REFERENCES `marca` (`CODIGO_MARCA`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `proveedor`
--
ALTER TABLE `proveedor`
  ADD CONSTRAINT `fk_tipo_contribuyente` FOREIGN KEY (`TIPO_CONTRIBUYENTE`) REFERENCES `tipo_contribuyente` (`CODIGO_TIPO_CONTRIBUYENTE`),
  ADD CONSTRAINT `fk_tipo_documento_contribuyente` FOREIGN KEY (`TIPO_DOCUMENTO`) REFERENCES `tipo_documento_contribuyente` (`CODIGO`);

--
-- Filtros para la tabla `sistemalog`
--
ALTER TABLE `sistemalog`
  ADD CONSTRAINT `CODIGO_SISTEMA_LOG` FOREIGN KEY (`CODIGO_USUARIO`) REFERENCES `usuario` (`CODIGO_USUARIO`);

--
-- Filtros para la tabla `tema_usuario`
--
ALTER TABLE `tema_usuario`
  ADD CONSTRAINT `fk_co_temsis` FOREIGN KEY (`CODIGO_TEMA`) REFERENCES `tema_sistema` (`CODIGO_TEMA`),
  ADD CONSTRAINT `fk_co_temusu` FOREIGN KEY (`CODIGO_USUARIO`) REFERENCES `usuario` (`CODIGO_USUARIO`);

--
-- Filtros para la tabla `tipo_nota`
--
ALTER TABLE `tipo_nota`
  ADD CONSTRAINT `fk_nota_tipo` FOREIGN KEY (`CODIGO_DOCUMENTO`) REFERENCES `tipo_documentos` (`CODIGO_DOCUMENTO`);

--
-- Filtros para la tabla `usuario_perfiles`
--
ALTER TABLE `usuario_perfiles`
  ADD CONSTRAINT `USUARIO_PERFILES_ibfk_1` FOREIGN KEY (`CODIGO_USUARIO`) REFERENCES `usuario` (`CODIGO_USUARIO`),
  ADD CONSTRAINT `USUARIO_PERFILES_ibfk_2` FOREIGN KEY (`CODIGO_PERFIL`) REFERENCES `perfil` (`CODIGO_PERFIL`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
