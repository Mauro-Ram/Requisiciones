-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 18-08-2025 a las 18:30:16
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
-- Base de datos: `fuente_group_prod`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `bancos`
--

CREATE TABLE `bancos` (
  `banco_id` int(11) NOT NULL,
  `banco_razonSocial` varchar(100) NOT NULL,
  `banco_nombreComercial` varchar(100) NOT NULL,
  `banco_activo` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `bancos`
--

INSERT INTO `bancos` (`banco_id`, `banco_razonSocial`, `banco_nombreComercial`, `banco_activo`) VALUES
(1, 'Banco Nacional de México, S.A.', 'BANAMEX', 1),
(2, 'Banca Serafin, S.A.', 'SERFIN', 1),
(3, 'Banco del Atlántico, S.A.', 'ATLÁNTICO', 0),
(4, 'Citibank México, S.A.', 'CITIBANK', 1),
(5, 'Banco Unión, S.A.', 'UNIÓN', 1),
(6, 'Confía, S.A. ', 'CONFÍA', 1),
(7, 'BBVA Bancomer, S.A.', 'BBVA BANCOMER', 1),
(8, 'Banco Industrial, S.A.', 'INDUSTRIAL', 1),
(9, 'Banco Santander (México), S.A.', 'SANTANDER', 1),
(10, 'Banco Interestatal, S.A.', 'INTERBANCO', 1),
(11, 'BBVA Bancomer Servicos, S.A.', 'BBVA SERVICIOS', 1),
(12, 'HSBC México, S.A.', 'HSBC', 1),
(13, 'GE Money Bank S.A.', 'GE MONEY', 1),
(14, 'Banco del Sureste, S. A.', 'SURESTE', 1),
(15, 'Banco Capital, S.A.', 'CAPITAL', 1),
(16, 'Banco del Bajío, S.A.', 'BAJÍO', 1),
(17, 'Ixe Banco, S.A.', 'IXE', 1),
(18, 'Banco Inbursa, S.A.', 'INBURSA', 1),
(19, 'Banco Interacciones, S.A.', 'INTERACCIONES', 1),
(20, 'Banca Mifel, S.A.', 'INTERACCIONES', 0),
(21, 'Banca Mifel, S.A.', 'MIFE', 1),
(22, 'Scotiabank Inverlat, S.A.', 'SCOTIABANK INVERLAT', 1),
(23, 'Banco Promotor del Norte, S.A.', 'PRONORTE', 1),
(24, 'Banca Quadrum, S.A.', 'QUADRUM', 1),
(25, 'Banco Regional de Monterrey, S.A.', 'BANREGIO', 1),
(26, 'Banco Invex, S.A.', 'INVEX', 1),
(27, 'Bansi, S.A.', 'BANSI', 1),
(28, 'Banca Afirme, S.A.', 'AFIRME', 1),
(29, 'Banco Anáhuac, S.A.', 'ANÁHUAC', 1),
(30, 'Banca Promex, S.A.', 'PROMEX', 1),
(31, 'Banpaís, S.A.', 'BANPAÍS', 1),
(32, 'Banco Mercantil del Norte, S.A.', 'BANORTE/IXE', 1),
(33, 'Banco de Oriente, S.A.', 'ORIENTE', 1),
(34, 'Banco del Centro, S. A.', 'BANCEN', 1),
(35, 'Banca Cremi, S.A.', 'CREMI', 1),
(36, 'Investa Bank, S.A.', 'INVESTA BANK', 1),
(37, 'American Express Bank (México), S.A.', 'AMERICAN EXPRESS', 1),
(38, 'Banco Santander de Negocios México, S.A.', 'SANTANDER NEGOCIOS', 1),
(39, 'Bank of America México, S.A.', 'BAMSA', 1),
(40, 'BankBoston, S.A.', 'BOSTON', 1),
(41, 'Bank of Tokyo-Mitsubishi UFJ (México), S.A.', 'TOKYO', 1),
(42, 'BNP (México), S.A.', 'BNP', 1),
(43, 'Banco JP Morgan, S.A.', 'JP MORGAN', 1),
(44, 'Banco Monex, S.A.', 'MONEX', 1),
(45, 'Banco Ve por Más, S.A.', 'VE POR MÁS', 1),
(46, 'Bank One(México), S.A.', 'BANK ONE', 1),
(47, 'Fuji Bank (México), S.A', 'FUJI', 1),
(48, 'ING Bank (México), S.A.', 'ING', 1),
(49, 'Nationsbank de México, S.A.', 'NATIONSBANK', 1),
(50, 'HSBC Bank México, S.A.', 'REPUBLIC NY', 1),
(51, 'Société Générale México, S.A.', 'SOCIÉTÉ', 1),
(52, 'Deutsche Bank México, S.A.', 'DEUTSCHE', 1),
(53, 'Banco Credit Suisse (México), S.A.', 'Credit Suisse First Boston', 1),
(54, 'Banco Azteca, S.A.', 'Banco Azteca, S.A.', 1),
(55, 'Banco Autofin México, S.A.', 'AUTOFIN', 1),
(56, 'Barclays Bank México, S.A.', 'BARCLAYS', 1),
(57, 'Banco Compartamos, S.A.', 'COMPARTAMOS', 0),
(58, 'Banco Ahorro Famsa, S.A.', 'Banco Ahorro Famsa, S.A.', 1),
(59, 'Banco Multiva, S.A.', 'BANCO MULTIVA', 1),
(60, 'Banco Actinver, S.A.', 'BM ACTINVER', 1),
(61, 'Banco Wal-Mart de México Adelante, S.A.', 'WAL-MART', 1),
(62, 'Intercam Banco, S.A.', 'INTERCAM BANCO', 1),
(63, 'BanCoppel, S.A.', 'BANCOPPEL', 1),
(64, 'ABC Capital, S.A.', 'ABC CAPITAL', 1),
(65, 'UBS Bank México, S.A.', 'UBS BANK', 1),
(66, 'Consubanco, S.A.', 'CONSUBANCO', 1),
(67, 'Volkswagen Bank, S.A.', 'VOLKSWAGEN', 1),
(68, 'CIBanco, S.A.', 'CIBANCO', 1),
(69, 'The Bank of New York Mellon, S.A.', 'BANK NEW YORK\r\n', 1),
(70, 'Banco Base, S.A.', 'BM BASE', 1),
(71, 'Banco Bicentenario, S.A.', 'BICENTENARIO', 1),
(72, 'Bankaool, S.A.', 'BANKAOOL', 1),
(73, 'Banco Pagatodo, S.A.', 'PAGATODO', 1),
(74, 'Banco Forjadores, S.A.', 'FORJADORES', 1),
(75, 'Banco Inmobiliario Mexicano, S.A.', 'INMOBILIARIO', 1),
(76, 'Fundación Dondé Banco, S.A.', 'DONDÉ', 1),
(77, 'Banco Bancrea, S.A.', 'BANCREA', 1),
(78, 'Banco Progreso Chihuahua, S.A.', 'CHIHUAHUA', 1),
(79, 'Banco Finterra, S.A.', 'FINTERRA', 1),
(80, 'Industrial and Commercial Bank of\r\nChina México, S.A.', 'BANK OF CHINA', 1),
(81, 'Bancrecer, S.A.', 'Bancrecer, S.A.', 1),
(82, 'Banco Obrero, S.A.', 'OBRERO', 1),
(83, 'Banco Prueba', 'Pruebank', 0),
(84, 'Banco Prueba', 'Pruebank', 1),
(85, 'Banco de Prueba 2', 'Pruebank 2', 0),
(86, 'Banco de Prueba 3', 'Pruebank 3', 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `emisores`
--

CREATE TABLE `emisores` (
  `emisor_id` int(11) NOT NULL,
  `emisor_nombre` varchar(100) NOT NULL,
  `emisor_rfc` varchar(15) NOT NULL,
  `emisor_direccion` varchar(100) NOT NULL,
  `emisor_telefono` varchar(10) NOT NULL,
  `emisor_fax` varchar(10) NOT NULL,
  `emisor_zipCode` varchar(5) NOT NULL,
  `emisor_estatus` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `emisores`
--

INSERT INTO `emisores` (`emisor_id`, `emisor_nombre`, `emisor_rfc`, `emisor_direccion`, `emisor_telefono`, `emisor_fax`, `emisor_zipCode`, `emisor_estatus`) VALUES
(1, 'THE FUENTES CORPORATION MEXICAN FILIAL SA DE CV ', 'FCM080718LP5', 'BLVD 28 DE AGOSTO 250 COL FOVISSTE II JARDIN CORONA 29024, TUXTLA GUTIERREZ, CHIAPAS', '9612551635', 'NA', '29024', 'ACTIVO');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estadosobra`
--

CREATE TABLE `estadosobra` (
  `ciudadesObras_id` int(11) NOT NULL,
  `ciudadesObras_nombre` varchar(50) NOT NULL,
  `ciudadesObras_codigo` varchar(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `estadosobra`
--

INSERT INTO `estadosobra` (`ciudadesObras_id`, `ciudadesObras_nombre`, `ciudadesObras_codigo`) VALUES
(1, 'SAN LUIS POTOSI', 'SLP'),
(2, 'CHIAPAS', 'CHI'),
(3, 'OAXACA', 'OXC');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `hojasrequisicion`
--

CREATE TABLE `hojasrequisicion` (
  `hojaRequisicion_id` int(11) NOT NULL,
  `hojaRequisicion_idReq` int(11) NOT NULL,
  `hojaRequisicion_numero` int(11) NOT NULL,
  `hojaRequisicion_FechaSolicitud` date NOT NULL,
  `hojaRequisicion_empresa` int(11) NOT NULL,
  `hojaRequisicion_proveedor` int(11) NOT NULL,
  `hojaRequisicion_observaciones` varchar(250) NOT NULL,
  `hojarequisicion_comentariosValidacion` varchar(250) DEFAULT NULL,
  `hojarequisicion_comentariosAutorizacion` varchar(250) DEFAULT NULL,
  `hojarequisicion_conceptoUnico` varchar(250) NOT NULL,
  `hojaRequisicion_formaPago` varchar(50) NOT NULL,
  `hojaRequisicion_fechaPago` date DEFAULT NULL,
  `hojasRequisicion_bancoPago` varchar(100) DEFAULT NULL,
  `hojaRequisicion_total` double(10,2) NOT NULL,
  `hojarequisicion_adeudo` decimal(10,2) NOT NULL,
  `hojaRequisicion_estatus` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `hojasrequisicion`
--

INSERT INTO `hojasrequisicion` (`hojaRequisicion_id`, `hojaRequisicion_idReq`, `hojaRequisicion_numero`, `hojaRequisicion_FechaSolicitud`, `hojaRequisicion_empresa`, `hojaRequisicion_proveedor`, `hojaRequisicion_observaciones`, `hojarequisicion_comentariosValidacion`, `hojarequisicion_comentariosAutorizacion`, `hojarequisicion_conceptoUnico`, `hojaRequisicion_formaPago`, `hojaRequisicion_fechaPago`, `hojasRequisicion_bancoPago`, `hojaRequisicion_total`, `hojarequisicion_adeudo`, `hojaRequisicion_estatus`) VALUES
(179, 543, 4, '2024-11-19', 1, 18, 'prueba', 'OK', NULL, '', 'Efectivo', '2024-12-05', 'FUENTES', 1.00, 1.00, 'PAGADA'),
(181, 543, 1, '2024-11-06', 1, 16, 'Prueba ', 'OK', '', '', 'Transferencia', '2024-12-06', 'FUENTES', 5.40, 5.00, 'PAGADA'),
(257, 548, 26, '2024-11-20', 1, 2, '', 'OK', NULL, '', 'Efectivo', '2024-12-05', 'FUENTES', 8.00, 8.00, 'PAGADA'),
(335, 546, 1, '2024-11-15', 1, 1, '', NULL, NULL, '', 'Transferencia', NULL, NULL, 19.72, 20.00, 'AUTORIZADA'),
(448, 543, 2, '2024-11-06', 1, 451, 'Prueba 1', NULL, NULL, '', 'Efectivo', NULL, NULL, 6.00, 0.00, 'PAGADA'),
(551, 543, 3, '2024-11-06', 1, 18, 'Prueba', NULL, NULL, '', 'Transferencia', NULL, NULL, 10.53, 0.00, 'PAGADA'),
(574, 545, 1, '2024-11-15', 1, 25, '', NULL, NULL, '', 'Transferencia', NULL, NULL, 34.80, 35.00, 'AUTORIZADA'),
(617, 552, 4, '2024-11-22', 1, 16, '', 'OK', NULL, '', 'Efectivo', '2024-12-05', 'FUENTES', 6.00, 3.00, 'PAGADA'),
(621, 542, 3, '2024-11-28', 1, 15, '', 'OK', '', '', 'Efectivo', NULL, NULL, 3.00, 0.00, 'RECHAZADA'),
(626, 542, 1, '2024-11-05', 1, 1, 'Prueba', NULL, NULL, '', 'Transferencia', NULL, NULL, 17.40, 0.00, 'RECHAZADA'),
(863, 543, 5, '2024-11-23', 1, 3, '', 'OK', NULL, '', 'Transferencia', '2024-12-05', 'FUENTES', 64.96, 65.00, 'PAGADA'),
(994, 542, 2, '2024-11-05', 1, 3, 'Prueba', NULL, NULL, '', 'Efectivo', NULL, NULL, 15.00, 0.00, 'RECHAZADA'),
(125957, 543, 13, '2024-12-17', 1, 1, 'prueba de Edicion', '', '', '', 'Transferencia', NULL, NULL, 1.06, 0.00, 'RECHAZADA'),
(162485, 543, 14, '2024-12-17', 1, 5, 'Prueba de ISR numero 5', '', '', '', 'Transferencia', NULL, NULL, 227920.96, 227920.96, 'AUTORIZADA'),
(271447, 572, 1, '2025-08-15', 1, 6, '', 'OK', NULL, '', 'Efectivo', NULL, NULL, 150.00, 150.00, 'AUTORIZADA'),
(275863, 543, 9, '2024-12-02', 1, 2, '', 'OK', '', '', 'Efectivo', '2024-12-06', 'FUENTES', 1.00, 1.00, 'PAGADA'),
(311939, 554, 7, '2025-08-15', 1, 1, '', '11.6', NULL, '', 'Transferencia', NULL, NULL, 11.60, 116.00, 'LIGADA'),
(373533, 544, 2, '2024-12-02', 1, 15, 'Prueba :D', NULL, NULL, '', 'Efectivo', '0000-00-00', '', 4.00, 4.00, 'PAGADA'),
(384838, 562, 5, '2025-01-13', 1, 6, 'Prueba', NULL, NULL, '', 'Efectivo', NULL, NULL, 20.00, 0.00, 'NUEVO'),
(423388, 543, 16, '2024-12-18', 1, 32, 'Prueba de Deciamles ', '', '', '', 'Transferencia', NULL, NULL, 106000.00, 106000.00, 'AUTORIZADA'),
(426687, 546, 2, '2024-12-31', 1, 16, 'Prueba rechazada', '', '', '', 'Transferencia', NULL, NULL, 7586.50, 75.00, 'AUTORIZADA'),
(454612, 543, 10, '2024-12-02', 1, 15, '', '', NULL, '', 'Transferencia', '0000-00-00', '', 3.48, 3.00, 'PAGADA'),
(516794, 543, 7, '2024-12-02', 1, 2, 'Prueba de comentarios de operacion', 'OK', 'Se rechaza otra vez', '', 'Efectivo', '2024-12-06', 'FUENTES', 4.00, 4.00, 'PAGADA'),
(595573, 562, 6, '2025-01-13', 1, 47, 'Prueba de concepto unico', 'OK', NULL, 'Concepto unico que se verá en la presión', 'Efectivo', NULL, NULL, 36.00, 910.00, 'AUTORIZADA'),
(612364, 571, 1, '2025-08-15', 1, 1, '', 'OK', NULL, '', 'Transferencia', NULL, NULL, 56.00, 56.00, 'LIGADA'),
(627631, 562, 7, '2025-01-13', 1, 95, 'Esta no tiene Comentario Unico', 'OK', NULL, '', 'Transferencia', NULL, NULL, 66.12, 66.12, 'AUTORIZADA'),
(659114, 544, 1, '2024-12-02', 1, 3, 'Prueba  :D', 'Prueba de Validacion :D ', NULL, '', 'Transferencia', '0000-00-00', '', 2.32, 2.00, 'PAGADA'),
(668566, 570, 1, '2025-05-16', 1, 5, 'prueba', 'OK', NULL, '', 'Efectivo', NULL, NULL, 4.00, 4.00, 'AUTORIZADA'),
(671919, 543, 11, '2024-12-02', 1, 2, '', 'OK', 'Array', '', 'Transferencia', '2024-12-06', 'FUENTES', 4.64, 5.00, 'PAGADA'),
(689142, 564, 3, '2025-08-11', 1, 1, '', '4', NULL, '', 'Efectivo', NULL, NULL, 4.00, 2.00, 'AUTORIZADA'),
(718637, 543, 18, '2024-12-18', 1, 306, 'prueba de validacion en linea', '3606.82', NULL, '', 'Efectivo', NULL, NULL, 3606.82, 1803.00, 'AUTORIZADA'),
(724249, 543, 15, '2024-12-18', 1, 299, 'Segunda Prueba', '7.62', NULL, '', 'Transferencia', NULL, NULL, 7.62, 7.62, 'AUTORIZADA'),
(742118, 554, 3, '2024-12-10', 1, 7, '', 'OK', NULL, '', 'Transferencia', '0000-00-00', '', 116.00, 100.00, 'PAGADA'),
(843632, 554, 4, '2025-08-15', 1, 1, '', '102', NULL, '', 'Efectivo', NULL, NULL, 102.00, 102.00, 'AUTORIZADA'),
(861999, 554, 6, '2025-08-15', 1, 2, '', '116', NULL, '', 'Transferencia', NULL, NULL, 116.00, 0.00, 'LIGADA'),
(869725, 543, 6, '2024-12-02', 1, 2, '', 'OK', NULL, '', 'Efectivo', '2024-12-06', 'FUENTES', 1.00, 1.00, 'PAGADA'),
(875676, 551, 5, '2025-05-16', 1, 5, '', 'OK', NULL, '', 'Efectivo', NULL, NULL, 8.00, 6.00, 'AUTORIZADA'),
(878249, 557, 24, '2025-08-05', 1, 1, '', '12', NULL, '', 'Efectivo', NULL, NULL, 12.00, 12.00, 'AUTORIZADA'),
(886839, 554, 5, '2025-08-15', 1, 3, '', '116', NULL, '', 'Transferencia', NULL, NULL, 116.00, 116.00, 'AUTORIZADA'),
(922694, 553, 4, '2024-12-06', 1, 81, 'Prueba ', 'OK', '', '', 'Transferencia', '2024-12-06', 'FUENTES', 4.64, 5.00, 'PAGADA'),
(962234, 543, 8, '2024-12-02', 1, 1, 'se hace una prueba de guardar comentarios de operacion', 'OK', 'se rechaza por prueba de rechazo', '', 'Efectivo', '2024-12-06', 'FUENTES', 1.00, 1.00, 'PAGADA'),
(969496, 544, 3, '2024-12-04', 1, 3, 'Comentarios :D :D', 'OK', 'cambia el precio', '', 'Efectivo', '2024-12-07', 'FUENTES', 50.00, 50.00, 'PAGADA');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `itemrequisicion`
--

CREATE TABLE `itemrequisicion` (
  `itemRequisicion_id` int(11) NOT NULL,
  `itemRequisicion_idHoja` int(11) NOT NULL,
  `itemRequisicion_unidad` varchar(20) NOT NULL,
  `itemRequisicion_producto` varchar(272) NOT NULL,
  `itemRequisicion_iva` decimal(16,6) NOT NULL,
  `itemRequisicion_retenciones` decimal(16,6) NOT NULL,
  `itemRequisicion_banderaFlete` tinyint(1) NOT NULL,
  `itemRequisicion_banderaFisica` tinyint(1) NOT NULL,
  `itemRequisicion_banderaResico` tinyint(1) NOT NULL,
  `itemRequisicion_banderaISR` tinyint(1) NOT NULL,
  `itemRequisicion_precio` decimal(16,6) NOT NULL,
  `itemRequisicion_cantidad` decimal(16,6) NOT NULL,
  `itemRequisicion_parcialidad` decimal(16,6) DEFAULT NULL,
  `itemRequisicion_estatus` varchar(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `itemrequisicion`
--

INSERT INTO `itemrequisicion` (`itemRequisicion_id`, `itemRequisicion_idHoja`, `itemRequisicion_unidad`, `itemRequisicion_producto`, `itemRequisicion_iva`, `itemRequisicion_retenciones`, `itemRequisicion_banderaFlete`, `itemRequisicion_banderaFisica`, `itemRequisicion_banderaResico`, `itemRequisicion_banderaISR`, `itemRequisicion_precio`, `itemRequisicion_cantidad`, `itemRequisicion_parcialidad`, `itemRequisicion_estatus`) VALUES
(2, 626, 'PIEZAS', 'Placas de Acero, 12 x 12 cm ', 2.400000, 0.000000, 0, 0, 0, 0, 1.000000, 15.000000, NULL, 'N'),
(3, 994, 'PIEZAS', 'Acero remachado, 14 x 14', 0.000000, 0.000000, 0, 0, 0, 0, 1.000000, 15.000000, NULL, 'N'),
(5, 181, 'BULTOS', 'Bultos de Cemento', 0.800000, 0.200000, 1, 0, 0, 0, 1.000000, 5.000000, NULL, 'N'),
(6, 448, 'DISEÑO', 'Prueba 2 item 2', 0.000000, 0.000000, 0, 0, 0, 0, 1.000000, 1.000000, NULL, 'N'),
(7, 448, 'DISEÑO', 'Prueba 2 item 1', 0.000000, 0.000000, 0, 0, 0, 0, 1.000000, 5.000000, NULL, 'N'),
(8, 551, 'METROS', 'Prueba 3 item 1', 1.600000, 1.070000, 0, 1, 0, 0, 10.000000, 1.000000, NULL, 'N'),
(9, 574, 'MENSUALIDAD', 'RENTA DE RETROEXCAVADORA 416E PROPIEDAD DE THE FUENTES CORPORATION MEXICAN', 1.920000, 0.000000, 0, 0, 0, 0, 4.000000, 3.000000, NULL, 'N'),
(10, 574, 'TONELADAS', 'SE DEBE RENTA DE CAMION VOLTEO #38 HECTOR HERNANDEZ, POR 7 DIAS DEL DIA 29 DE OCTUBRE AL 07 DE NOVIE', 2.880000, 0.000000, 0, 0, 0, 0, 6.000000, 3.000000, NULL, 'N'),
(11, 335, 'PIEZAS', 'BOMBA 7.5M3', 0.160000, 0.000000, 0, 0, 0, 0, 1.000000, 1.000000, NULL, 'N'),
(12, 335, 'TONELADAS', 'CONCRETO 250 NORMAL A 28 DIAS T.M.A. 20MM REV 14 3.5, SE DEBE 66.5M3 QUE SE OCUPO 59M3 EN CIELO ABIE', 2.560000, 0.000000, 0, 0, 0, 0, 4.000000, 4.000000, NULL, 'N'),
(14, 179, 'BULTOS', 'Bultos de Cemento', 0.000000, 0.000000, 0, 0, 0, 0, 2.000000, 1.000000, NULL, 'N'),
(15, 257, 'CUBETAS', 'Prueba de una Requisición Manual :D', 0.000000, 0.000000, 0, 0, 0, 0, 4.000000, 2.000000, NULL, 'N'),
(16, 617, 'KILOGRAMOS', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.', 0.000000, 0.000000, 0, 0, 0, 0, 3.000000, 2.000000, NULL, 'N'),
(19, 863, 'METROS', 'Bultos 3', 0.960000, 0.000000, 0, 0, 0, 0, 3.000000, 2.000000, NULL, 'N'),
(20, 863, 'BULTOS', 'Bultos 2', 3.200000, 0.000000, 0, 0, 0, 0, 10.000000, 2.000000, NULL, 'N'),
(21, 863, 'BULTOS', 'Bultos carga 1', 4.800000, 0.000000, 0, 0, 0, 0, 10.000000, 3.000000, NULL, 'N'),
(23, 621, 'VIAJES', 'item 3', 0.000000, 0.000000, 0, 0, 0, 0, 1.000000, 1.000000, NULL, 'N'),
(24, 621, 'VIAJES', 'item 2', 0.000000, 0.000000, 0, 0, 0, 0, 1.000000, 1.000000, NULL, 'N'),
(25, 621, 'VIAJES', 'item 1', 0.000000, 0.000000, 0, 0, 0, 0, 1.000000, 1.000000, NULL, 'N'),
(26, 869725, 'KILOGRAMOS', 'Item 1', 0.000000, 0.000000, 0, 0, 0, 0, 1.000000, 1.000000, NULL, 'N'),
(27, 516794, 'PIEZAS', 'item 1', 0.000000, 0.000000, 0, 0, 0, 0, 4.000000, 1.000000, NULL, 'N'),
(28, 962234, 'DISEÑO', 'item 1', 0.000000, 0.000000, 0, 0, 0, 0, 1.000000, 1.000000, NULL, 'N'),
(29, 275863, 'METROS CUADRADOS', 'Item 1', 0.000000, 0.000000, 0, 0, 0, 0, 1.000000, 1.000000, NULL, 'N'),
(30, 454612, 'METROS', 'Item 1 Transferencia ', 0.480000, 0.000000, 0, 0, 0, 0, 3.000000, 1.000000, NULL, 'N'),
(31, 671919, 'METROS CUADRADOS', 'Item 1 Tranferencia ', 0.640000, 0.000000, 0, 0, 0, 0, 4.000000, 1.000000, NULL, 'N'),
(32, 659114, 'METROS CUADRADOS', 'Item 1', 0.320000, 0.000000, 0, 0, 0, 0, 2.000000, 1.000000, NULL, 'N'),
(33, 373533, 'KILOGRAMOS', 'item 1 Efectivo', 0.000000, 0.000000, 0, 0, 0, 0, 2.000000, 2.000000, NULL, 'N'),
(34, 969496, 'METROS CUBICOS', 'item 3', 0.000000, 0.000000, 0, 0, 0, 0, 10.000000, 2.000000, NULL, 'N'),
(35, 922694, 'METROS CUBICOS', 'Concetro 2', 0.320000, 0.000000, 0, 0, 0, 0, 2.000000, 1.000000, NULL, 'N'),
(36, 922694, 'METROS CUBICOS', 'Concreto de prueba ', 0.320000, 0.000000, 0, 0, 0, 0, 2.000000, 1.000000, NULL, 'N'),
(37, 969496, 'METROS CUBICOS', 'Cemento Monterrey', 0.000000, 0.000000, 0, 0, 0, 0, 5.000000, 6.000000, NULL, 'N'),
(39, 742118, 'METROS', 'Item 10', 16.000000, 0.000000, 0, 0, 0, 0, 100.000000, 1.000000, NULL, 'N'),
(42, 162485, 'SER', 'Segunda Prueba de ISR, Item 2 Modificacion :D Prueba de Decimales', 16000.000000, 10000.000000, 0, 0, 0, 0, 1000.000000, 100.000000, NULL, 'N'),
(43, 162485, 'SER', 'Segundo Item de la Prueba de ISR ', 806.850512, 504.281570, 0, 0, 0, 0, 100.856314, 50.000000, NULL, 'N'),
(46, 125957, 'SERVICIOS', 'Prueba de ISR', 0.160000, 0.100000, 0, 0, 0, 0, 1.000000, 1.000000, NULL, 'N'),
(47, 724249, 'METROS', 'Lorem ipsum dolor sit amet, consectetur adipisc', 0.160000, 0.100000, 0, 0, 0, 0, 1.000000, 1.000000, NULL, 'N'),
(48, 724249, 'METROS', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla dignissim pharetra nibh, sed ph', 0.320000, 0.200000, 0, 0, 0, 0, 2.000000, 1.000000, NULL, 'N'),
(49, 724249, 'METROS', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla dignissim pharetra nibh, Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nul', 0.320000, 0.200000, 0, 0, 0, 0, 2.000000, 1.000000, NULL, 'N'),
(50, 724249, 'METROS', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla dignissim pharetra nibh, Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nul Lorem ipsum dolor sit amet, consectetur adi', 0.320000, 0.000000, 0, 0, 0, 0, 2.000000, 1.000000, NULL, 'N'),
(52, 162485, 'METROS', 'Prueba', 86.880000, 54.300000, 0, 0, 0, 0, 10.860000, 50.000000, NULL, 'N'),
(53, 162485, 'SERVICIOS', 'prueba de decimales ', 16000.000000, 0.000000, 0, 0, 0, 0, 1000.000000, 100.000000, NULL, 'N'),
(54, 423388, 'SERVICIOS', 'Prueba de Decimales ', 16000.000000, 10000.000000, 0, 0, 0, 0, 1000.000000, 100.000000, NULL, 'N'),
(56, 718637, 'PIEZAS', 'esta es una prueba de validacion de saltos de linesla paso??', 0.000000, 0.000000, 0, 0, 0, 0, 300.568650, 12.000000, NULL, 'N'),
(63, 426687, 'METROS', 'Prueba 2', 320.000000, 0.000000, 0, 0, 0, 0, 500.000000, 4.000000, NULL, 'N'),
(64, 426687, 'TONELADAS', 'Prueba', 800.000000, 533.500000, 0, 1, 0, 0, 1000.000000, 5.000000, NULL, 'N'),
(65, 384838, 'LITROS', 'Prueba de Cambio', 0.000000, 0.000000, 0, 0, 0, 0, 5.000000, 4.000000, NULL, 'N'),
(66, 595573, 'SERVICIOS', 'Prueba seis de concepto Unico', 0.000000, 0.000000, 0, 0, 0, 0, 3.000000, 4.000000, NULL, 'N'),
(67, 595573, 'CUBETAS', 'Prueba cinco de concepto unico', 0.000000, 0.000000, 0, 0, 0, 0, 3.000000, 2.000000, NULL, 'N'),
(68, 595573, 'CUBETAS', 'Prueba cuatro de concepto unico', 0.000000, 0.000000, 0, 0, 0, 0, 3.000000, 2.000000, NULL, 'N'),
(69, 595573, 'CUBETAS', 'Prueba tres de concepto unico', 0.000000, 0.000000, 0, 0, 0, 0, 2.000000, 2.000000, NULL, 'N'),
(70, 595573, 'TONELADAS', 'Prueba 2 de Concepto Unico', 0.000000, 0.000000, 0, 0, 0, 0, 2.000000, 2.000000, NULL, 'N'),
(71, 595573, 'METROS CUBICOS', 'Prueba 1 de concepto Unico', 0.000000, 0.000000, 0, 0, 0, 0, 4.000000, 1.000000, NULL, 'N'),
(72, 627631, 'TONELADAS', 'Prueba 6', 0.960000, 0.000000, 0, 0, 0, 0, 3.000000, 2.000000, NULL, 'N'),
(73, 627631, 'TONELADAS', 'Prueba 5', 0.960000, 0.000000, 0, 0, 0, 0, 3.000000, 2.000000, NULL, 'N'),
(74, 627631, 'TONELADAS', 'Prueba 4', 1.440000, 0.000000, 0, 0, 0, 0, 3.000000, 3.000000, NULL, 'N'),
(75, 627631, 'TONELADAS', 'Prueba 3', 1.920000, 0.000000, 0, 0, 0, 0, 4.000000, 3.000000, NULL, 'N'),
(76, 627631, 'TONELADAS', 'Prueba 2', 1.440000, 0.000000, 0, 0, 0, 0, 3.000000, 3.000000, NULL, 'N'),
(77, 627631, 'TONELADAS', 'Prueba 1', 2.400000, 0.000000, 0, 0, 0, 0, 5.000000, 3.000000, NULL, 'N'),
(81, 668566, 'PIEZAS', 'Prueba 3', 0.000000, 0.000000, 0, 0, 0, 0, 2.000000, 2.000000, NULL, 'N'),
(82, 875676, 'DISEÑO', 'Prueba 2', 0.000000, 0.000000, 0, 0, 0, 0, 4.000000, 2.000000, NULL, 'N'),
(83, 878249, 'METROS CUADRADOS', 'Ejemplo 2', 0.000000, 0.000000, 0, 0, 0, 0, 4.000000, 3.000000, NULL, 'N'),
(84, 689142, 'VIAJES', 'asdsad', 0.000000, 0.000000, 0, 0, 0, 0, 2.000000, 2.000000, NULL, 'N'),
(85, 843632, 'DISEÑO', 'Item no Thyago 202', 0.000000, 0.000000, 0, 0, 0, 0, 2.000000, 1.000000, NULL, 'N'),
(86, 843632, 'PIEZAS', 'Item Thyago 202', 0.000000, 0.000000, 0, 0, 0, 0, 100.000000, 1.000000, NULL, 'N'),
(87, 886839, 'DISEÑO', 'Joseanna', 16.000000, 0.000000, 0, 0, 0, 0, 100.000000, 1.000000, NULL, 'N'),
(88, 861999, 'DISEÑO', 'Dato 2', 16.000000, 0.000000, 0, 0, 0, 0, 100.000000, 1.000000, NULL, 'N'),
(89, 311939, 'DISEÑO', 'datos 3', 1.600000, 0.000000, 0, 0, 0, 0, 1.000000, 10.000000, NULL, 'N'),
(90, 612364, 'DISEÑO', 'Los labios 4K', 8.000000, 2.000000, 1, 0, 0, 0, 50.000000, 1.000000, NULL, 'N'),
(91, 271447, 'DISEÑO', 'Lo tojos', 0.000000, 0.000000, 0, 0, 0, 0, 150.000000, 1.000000, NULL, 'N');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `logs`
--

CREATE TABLE `logs` (
  `log_id` int(11) NOT NULL,
  `log_accion` varchar(50) NOT NULL,
  `log_fechaAccion` date NOT NULL,
  `log_usuario` int(11) NOT NULL,
  `log_horaAccion` time NOT NULL,
  `log_moduloAccion` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `logs`
--

INSERT INTO `logs` (`log_id`, `log_accion`, `log_fechaAccion`, `log_usuario`, `log_horaAccion`, `log_moduloAccion`) VALUES
(1, 'Agregar', '2024-11-01', 0, '15:00:18', 'Presiones'),
(2, 'Agregar', '2024-11-01', 0, '15:04:33', 'Requesiciones'),
(3, 'Agregar', '2024-11-01', 0, '15:07:40', 'Requesiciones'),
(4, 'Agregar', '2024-11-01', 0, '15:14:10', 'Requesiciones');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `obras`
--

CREATE TABLE `obras` (
  `obras_id` int(11) NOT NULL,
  `obras_nombre` varchar(50) NOT NULL,
  `obras_clave` varchar(5) NOT NULL,
  `obras_tipo` varchar(10) NOT NULL,
  `obras_estatus` varchar(10) NOT NULL,
  `obra_automatico` tinyint(1) NOT NULL,
  `obras_cuidad` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `obras`
--

INSERT INTO `obras` (`obras_id`, `obras_nombre`, `obras_clave`, `obras_tipo`, `obras_estatus`, `obra_automatico`, `obras_cuidad`) VALUES
(1, 'VILLA DE RAMOS', 'VRAM', 'CAMPO', 'ACTIVO', 0, 1),
(2, 'CACTUS', 'CACT', 'CAMPO', 'ACTIVO', 0, 1),
(3, 'AHUALULCO', 'AHUA', 'CAMPO', 'ACTIVO', 0, 1),
(4, 'MATIAS ROMERO', 'MATR', 'CAMPO', 'ACTIVO', 0, 3),
(5, 'LINEA K', 'LINK', 'CAMPO', 'ACTIVO', 0, 3),
(6, 'OFICINAS CHAPULTEPEC', 'OFCHP', 'OFICINA', 'ACTIVO', 0, 1),
(7, 'OFICINAS TUXTLA GUTIERREZ', 'OFITX', 'OFICINA', 'ACTIVO', 0, 2),
(8, 'UNIVERSIDAD (UASLP)', 'UASLP', 'CAMPO', 'ACTIVO', 0, 1),
(9, 'PLANTAS Y TRITURACION', 'PYT', 'CAMPO', 'ACTIVO', 0, 1),
(10, 'TAMPAMOLON', 'TMP', 'CAMPO', 'ACTIVO', 0, 1),
(11, 'VILLA DE RAMOS 2T', 'VRM2', 'CAMPO', 'ACTIVO', 1, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `presiones`
--

CREATE TABLE `presiones` (
  `presiones_id` int(11) NOT NULL,
  `presiones_nombre` varchar(50) NOT NULL,
  `presiones_alias` varchar(50) NOT NULL,
  `presiones_semana` varchar(5) NOT NULL,
  `presiones_dia` varchar(10) NOT NULL,
  `presiones_adeudo` decimal(10,2) NOT NULL,
  `presiones_fechaCreacion` date NOT NULL,
  `presiones_gastosObra` decimal(10,2) NOT NULL,
  `presiones_obra` int(11) NOT NULL,
  `presiones_userCreado` varchar(100) NOT NULL,
  `presiones_userValidado` varchar(100) NOT NULL,
  `presiones_estatus` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `presiones`
--

INSERT INTO `presiones` (`presiones_id`, `presiones_nombre`, `presiones_alias`, `presiones_semana`, `presiones_dia`, `presiones_adeudo`, `presiones_fechaCreacion`, `presiones_gastosObra`, `presiones_obra`, `presiones_userCreado`, `presiones_userValidado`, `presiones_estatus`) VALUES
(2, 'VILLA DE RAMOS-45-Martes', 'Acarreo', '45', 'Martes', 0.00, '2024-11-05', 0.00, 1, '0', '', 'AUTORIZADO'),
(3, 'CACTUS-45-Martes', 'Indirectos', '45', 'Martes', 0.00, '2024-11-05', 0.00, 2, '0', '', 'AUTORIZADO'),
(4, 'AHUALULCO-46-Viernes', 'Indirectos', '46', 'Viernes', 0.00, '2024-11-15', 0.00, 3, '0', '', 'AUTORIZADO'),
(5, 'CACTUS-47-Martes', 'Indirectos', '47', 'Martes', 0.00, '2024-11-19', 0.00, 2, '0', '', 'AUTORIZADO'),
(6, 'VILLA DE RAMOS-47-Sábado', 'Indirectos', '47', 'Sábado', 0.00, '2024-11-23', 0.00, 1, '0', '', 'AUTORIZADO'),
(7, 'AHUALULCO-47-Sábado', 'Selecciona Alias', '47', 'Sábado', 0.00, '2024-11-23', 0.00, 3, '0', '', 'PENDIENTE'),
(8, 'MATIAS ROMERO-47-Sábado', 'Acarreo', '47', 'Sábado', 0.00, '2024-11-23', 0.00, 4, '0', '', 'PENDIENTE'),
(9, 'CACTUS-49-Jueves', 'Indirectos', '49', 'Jueves', 0.00, '2024-12-05', 0.00, 2, '0', '', 'AUTORIZADO'),
(10, 'CACTUS-49-Viernes', 'Indirectos', '49', 'Viernes', 0.00, '2024-12-06', 0.00, 2, '0', '', 'AUTORIZADO'),
(11, 'CACTUS-49-Viernes', 'Acarreo', '49', 'Viernes', 0.00, '2024-12-06', 0.00, 2, '0', '', 'AUTORIZADO'),
(12, 'CACTUS-49-Viernes', 'Indirectos', '49', 'Viernes', 0.00, '2024-12-06', 0.00, 2, '0', '', 'AUTORIZADO'),
(13, 'CACTUS-49-Viernes', 'Indirectos', '49', 'Viernes', 0.00, '2024-12-06', 0.00, 2, '0', '', 'AUTORIZADO'),
(14, 'CACTUS-49-Viernes', 'Indirectos', '49', 'Viernes', 0.00, '2024-12-06', 0.00, 2, '0', '', 'AUTORIZADO'),
(15, 'CACTUS-49-Viernes', 'Indirectos', '49', 'Viernes', 0.00, '2024-12-06', 0.00, 2, '0', '', 'AUTORIZADO'),
(16, 'CACTUS-49-Sábado', 'Indirectos', '49', 'Sábado', 0.00, '2024-12-07', 0.00, 2, '0', '', 'AUTORIZADO'),
(17, 'LINEA K-50-Martes', 'Indirectos', '50', 'Martes', 0.00, '2024-12-10', 0.00, 5, '0', '', 'AUTORIZADO'),
(18, 'LINEA K-50-Viernes', 'Indirectos', '50', 'Viernes', 0.00, '2024-12-13', 0.00, 5, '0', '', 'AUTORIZADO'),
(19, 'CACTUS-51-Miércoles', 'Indirectos', '51', 'Miércoles', 0.00, '2024-12-18', 0.00, 2, '0', '', 'PENDIENTE'),
(20, 'VILLA DE RAMOS-51-Miércoles', 'Acarreo', '51', 'Miércoles', 0.00, '2024-12-18', 0.00, 1, '0', '', 'PENDIENTE'),
(21, 'LINEA K-51-Miércoles', 'Indirectos', '51', 'Miércoles', 0.00, '2024-12-18', 0.00, 5, '0', '', 'PENDIENTE'),
(22, 'UNIVERSIDAD (UASLP)-51-Miércoles', 'Indirectos', '51', 'Miércoles', 0.00, '2024-12-18', 0.00, 8, '0', '', 'PENDIENTE'),
(23, 'PLANTAS Y TRITURACION-51-Miércoles', 'Acarreo', '51', 'Miércoles', 0.00, '2024-12-18', 0.00, 9, '0', '', 'PENDIENTE'),
(24, 'VILLA DE RAMOS 2T-20-Viernes', 'Indirectos', '20', 'Viernes', 0.00, '2025-05-16', 0.00, 11, '0', '', 'PENDIENTE'),
(25, 'OFICINAS CHAPULTEPEC-33-Lunes', 'Indirectos', '33', 'Lunes', 0.00, '2025-08-11', 0.00, 6, '0', '', 'PENDIENTE'),
(26, 'OFICINAS TUXTLA GUTIERREZ-33-Viernes', 'Indirectos', '33', 'Viernes', 0.00, '2025-08-15', 0.00, 7, '0', '', 'PENDIENTE');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `provedores`
--

CREATE TABLE `provedores` (
  `proveedor_id` int(11) NOT NULL,
  `proveedor_nombre` varchar(100) NOT NULL,
  `presiones_type` varchar(50) DEFAULT NULL,
  `proveedor_rfc` varchar(15) DEFAULT NULL,
  `proveedor_clabe` varchar(20) NOT NULL,
  `proveedor_numeroCuenta` varchar(20) NOT NULL,
  `proveedor_sucursal` varchar(50) NOT NULL,
  `proveedor_refBanco` varchar(20) NOT NULL,
  `presiones_tarjetaBanco` varchar(20) DEFAULT NULL,
  `proveedor_banco` varchar(50) NOT NULL,
  `proveedor_email` varchar(50) NOT NULL,
  `proveedor_telefono` varchar(10) NOT NULL,
  `proveedor_estatus` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `provedores`
--

INSERT INTO `provedores` (`proveedor_id`, `proveedor_nombre`, `presiones_type`, `proveedor_rfc`, `proveedor_clabe`, `proveedor_numeroCuenta`, `proveedor_sucursal`, `proveedor_refBanco`, `presiones_tarjetaBanco`, `proveedor_banco`, `proveedor_email`, `proveedor_telefono`, `proveedor_estatus`) VALUES
(1, 'ACEROS ALCALDE S.A. DE C.V', 'COMPRA DE ACERO', 'AAL0512217T3', '14700655029865300', '65502986531', '392', '', '', 'SANTANDER', 'ventasacerosalcalde.com.mx', '4448320200', 'INACTIVO'),
(2, 'ACEROS ALCALDE S.A.DE C.V.', 'MONTEN, ACERO LISO ', 'AAL0512217T3', '14700655029865300', '65502986531', '392', '', '', 'SANTANDER', '', '', 'INACTIVO'),
(3, 'ACEROS VIMAR MEXICO SAPI DE CV', 'ACERO', '', '12180001157082400', '115708249', '', '', '', 'BANCOMER', '', '', 'INACTIVO'),
(4, 'AGENCIAS MERCANTILES SA DE CV', 'CODOS PARA TRACTOR', 'AME-831229-C40', '12914002013374200', '', '', 'CAJAMSTUX1', '', 'BANCOMER', '', '', 'INACTIVO'),
(5, 'AGUSTINA TETUMO SANCHEZ', 'COMIDAS ', '', '127620013041395000', '43391304139566', '', '', '', 'BANCO AZTECA', '', '', 'INACTIVO'),
(6, 'ALBERTO AYALA CASTAÑEDA HERMANOS', 'TOPOGRAFÍA ', 'ROGA7000808SJ2', '555', '555', 'Cenctro', '555', '555', 'Santander', 'VENTAS@GEOCAD.COM.MX', '555', 'ACTIVO'),
(7, 'ALBERTO DIAZ MUÑOZ.', '', 'DIMA 8201237I2', '12886001322068800', '132206889', '', '', '', 'BANCOMER', '', '', 'INACTIVO'),
(8, 'ALEJANDRO PEREZ CORZO LUEVANO', '', 'PECA7506069N5', '137138103874174000', '10387417473', '', '', '', 'BANCOPPEL ', '', '', 'ACTIVO'),
(9, 'ALEJANDRO VELAZQUEZ JIMÉNEZ', 'CAMPAMENTO ', 'VEJA820312-3Z7', '12610015301007800', '1530100788', '', '', '', 'BBVA', '', '', 'ACTIVO'),
(10, 'ALEJANDRO ZEPEDA ARRIOLA', 'ACEITE DE MOTOR ', 'ZEAA951228138', '72133012057964900', '1205796499', '', '', '', 'BANORTE', 'alejandro_contable@outlook.com', '9621220712', 'INACTIVO'),
(11, 'ALERTICA, S.A. DE C.V', 'EQUIPO Y HERRAMIENTA PARA LAS PLANTAS DE TRITURACI', '', '2180700240201750', '4020175', '', '', '', 'BANAMEX ', 'ventas@alertica.com.mx', '', 'ACTIVO'),
(12, 'Alfredo Meléndez Yáñez', 'DURMIENTES DE MADERA ', '', '12240004840158700', '484015878', '', '', '', 'BBVA', '', '4442098748', 'ACTIVO'),
(13, 'ALFREDO RAMOS ZAPATA', '', 'RAZA7111012E9', '2700700088206680', '70008820668', '', '', '5204164361838490', 'BANAMEX', '', '', 'ACTIVO'),
(14, 'ALICIA REYES SALINAS', 'CAMPAMENTO ', '', '', '', '', '', '4915664418553030', 'BANORTE', '', '', 'ACTIVO'),
(15, 'ALMA DELIA RODRIGUEZ NEVAREZ', 'BANDA TRANSPORTADORA', 'RONA6703093X7', '2190701809387860', '7018938786', '', '', '', 'BANAMEX', '', '6181920041', 'ACTIVO'),
(16, 'ANA KARIME ALQUICIRA SAN GERMAN', 'EQUIPO PLANTA DE ASFALTO', 'AUSA880623F65', '2620701415276470', '1527647', '7014', '', '', 'BANAMEX', '', '9721018581', 'INACTIVO'),
(17, 'ANA KARINA CRUZ Y CRUZ', '', 'CUCA8707292LA', '127100013040029000', '13971304002913', '', '', '', 'AZTECA ', 'kary299@hotmail.com', '9612430659', 'INACTIVO'),
(18, 'ANA LAURA VERDEJO CALAO', 'RENTA DE LUMINARIA ', 'VECA810929IN4', '2620700345202570', '4520257', '7003', '', '', 'BANAMEX', 'sumelec18@hotmail.com', '', 'ACTIVO'),
(19, 'ANA LISBETH LOPEZ LOPEZ', 'FABRICACIÓN Y SUMINISTRO DE ANCLAS PIVS', '', '127617017075060000', '63051707506022', '', '', '', 'BANCO AZTECA', '', '', 'ACTIVO'),
(20, 'ANDRÉS ALEJANDRO LÓPEZ LÓPEZ', '', '', '12109029227350800', '', '', '', '', 'BBVA ', '', '', 'ACTIVO'),
(21, 'ARELLANO MATA S.A DE C.V', 'COMBUSTIBLE', 'AMA011205590', '002930016677453883', '7745388', '166', '', '', 'BANAMEX', 'gaasm53@yahoo.com.mx', '4922581158', 'ACTIVO'),
(22, 'AREMY SANCHEZ DEL CASTILLO', 'FERRETERIA', 'SACA870719P72', '72700011757897400', '1175789745', '', '', '', 'BANORTE', '', '4447069491', 'ACTIVO'),
(23, 'AREMY SANCHEZ DEL CASTILLO', '', '', '72700011757897400', '1175789745', '', '', '', 'BANORTE', 'ferreteraelcapi@hotmail.com', '', 'ACTIVO'),
(24, 'ARENERA LA PALMA AS DE CV', 'MATERIAL ARENA, PIEDRA ', 'APA810817CR3', '72700008450037400', '845003742', '', '', '', 'BANORTE', '', '', 'ACTIVO'),
(25, 'ARLYN DUQUE MALDONADO', 'GENERADOR ELÉCTRICO ', 'DUMA920719HK1', '12133015014456300', '1501445637', '', '', '', 'BBVA BANCOMER', 'ING.HERMOSILLO@HOTMAIL.COM', '', 'ACTIVO'),
(26, 'ARQUETICO SA DE CV', 'RENTA MAQUINARIA ', '', '646090258695880000', '', '', '', '', 'SISTEMA DE TRANSFERENCIA Y PAGOS (STP)', '', '', 'ACTIVO'),
(27, 'ARRENDADORA MAQOR', '', 'AMA2306126R3', '113180000006811084', '00000681108', '', '', '', 'VE POR MAS', '', '', 'ACTIVO'),
(28, 'ARRENDAMIENTO Y SERVICIOS JUVA, S. DE R.L. DE C.V.', 'RENTA DE PAVIMENTADORA', 'ASJ141224G69', '44610092027011400', '9202701146', '', '', '', 'SCOTIABANK', '', '', 'ACTIVO'),
(29, 'ARTEMIO PEREZ RAMOS', 'REFACCIONES', '', '72100012403059600', '1240305968', '', '', '', 'BANORTE', '', '', 'ACTIVO'),
(30, 'ASOCIACION MEXICANA DE INGENIERIA DE VIAS TERRESTRES AC', '', 'AMI7410193W2', '72180003364052800', '336405287', '2037', '', '', 'BANORTE', '', '', 'ACTIVO'),
(31, 'ASOCIACION MEXICANA DE INGENIERIA DE VIAS TERRESTRES, ASOCIACION CIVIL, AMIVTAC', 'PAGO DE MEMBRESÍA ', '', '2180650653643650', '', '', '', '', 'BANAMEX', '', '', 'ACTIVO'),
(32, 'AURELIA CASTILLO CABRERA', 'CORDÓN USO RUDO', 'CACX751218CI0', '12100001584640400', '158464049', '5058', '', '', 'BBVA', 'electricairis@yahoo.com.mx', '9611773418', 'ACTIVO'),
(33, 'AUTOMOTORES ORIENTALES DE SAN LUIS S.A DE C.V.', '', 'AOS070328IE0', '12700001557908200', '155790824', '', '', '', 'BANCOMER ', '', '', 'ACTIVO'),
(34, 'AUTOPARTES Y MAS S.A. DE C.V.', '', 'APM8805092U9', '14320920004139700', '92000413970', '', '', '', 'SANTANDER', '', '', 'ACTIVO'),
(35, 'AUTOZONE DE MEXICO S DE RL DE CV', '', 'AME-970109-GW0', '2180700878297560', '7829756', '7008', '', '', 'CITIBANAMEX', '', '', 'ACTIVO'),
(36, 'AYARZA DISTRIBUIDORA Y COMERCIALIZADORA S.A. DE C.V.', 'INSTALACIÓN ELÉCTRICA ', 'ADC-190522-NJ0', '44610256002237200', '25600223722', '92005', '', '', 'SCOTIABANK', '', '', 'ACTIVO'),
(37, 'AYLIN ITZEL ALVAREZ CERVANTE', 'ACERO', 'AACA950902IR6', '36650500597808900', '50059780890', '', '', '', 'ASPEL INBURSA FISICA', '', '', 'ACTIVO'),
(38, 'AZAEL RODRIGUEZ BECERRA', 'FERRETERIA', '', '36930500473592700', '', '', '', '', 'INBURSA', '', '', 'ACTIVO'),
(39, 'BARDAHL DE MEXICO, S.A DE C.V', 'ACEITE HIDRAULICO ', 'BME511128MZ2', '2180087005191130', '519113', '870', '', '', 'CITIBANAMEX', '', '', 'ACTIVO'),
(40, 'BEATRIZ ADRIANA REYES MIGUEL', '', '', '137620101648903000', '10164890347', '', '', '', 'BANCOPPEL', '', '', 'ACTIVO'),
(41, 'BEATRIZ LEONIDEZ MARTINEZ', '', 'LEMB851118SDA', '137620101648903000', '', '54', '', '', 'BANCOPPEL', '', '', 'ACTIVO'),
(42, 'BENIGNO HERRERA CASTILLO', 'MAQUINARIA ', 'HECB4309207D1', '72700008480007700', '848000779', '', '', '', 'BANORTE', 'www.es3055@hotmail.com', '', 'ACTIVO'),
(43, 'BENJAMIN RAMIREZ HERNANDEZ', 'DEFENSA METÁLICA Y AMORTIGUADORES ', '', '', '', '', '', '5263540132348300', 'BANCO AZTECA', '', '', 'ACTIVO'),
(44, 'BERENICE GALINA MONSYVAIS', 'MAQUINARIA ', 'GAMB109168F5', '72700012511498300', '1251149832', '', '', '', 'BANORTE', '', '', 'ACTIVO'),
(45, 'BERENICE GALINA MONSYVAIS', 'MAQUINARIA ', 'GAMB109168F5', '', '1251149832', '', '', '72700012511498300', 'BANORTE', '', '', 'ACTIVO'),
(46, 'BRENDA MARTHA LEON MERCADER', '', '', '', '47631378653638', '', '', '', 'AZTECA', '', '', 'ACTIVO'),
(47, 'BUFETE DE SERVICIOS TECNICO E INDUSTRIAL EN SISTEMA ZAVALA GARCIA E HIJOS', '', 'BST920208VEA', '12100004509497600', '450949760', '', '', '', 'BBVA BANCOMER', '', '', 'ACTIVO'),
(48, 'BULMARO CABALLERO LOPEZ', 'MAQUINARIA ', 'CALB780314KN2', '12100004825558900', '482555891', '', '', '', 'BANCOMER', '', '', 'ACTIVO'),
(49, 'CACTUS FERRETEROS S.A DE C.V.', 'FERRETERIA', 'CFE1503269I6', '72700010370535200', '10370535264', '', '', '', 'BANORTE', '', '', 'ACTIVO'),
(50, 'CADECO', 'ACEITES Y GRASAS', 'CAD850514L17', '30580900012008500', '197698430201', '', '', '', 'BANBAJIO', '', '', 'ACTIVO'),
(51, 'CADECO S.A. DE C.V.', 'REFACCIONES DE MAQUINARIA ', '', '030580900012008567', '0197698430201', '', '', '', 'BANBAJIO', '', '4441214658', 'ACTIVO'),
(52, 'CADECO S.A. DE C.V.', '', '', '30580900012008500', '197698430201', '', '', '', 'BANBAJIO', 'ventasnet@cadoco.com.mx', '', 'ACTIVO'),
(53, 'CALZADO DE TRABAJO S.A. DE C.V.', 'IMPERMEABLE', 'CTR940509JF6', '2320650770323410', '7032341', '6507', '', '', 'BANAMEX', '', '', 'ACTIVO'),
(54, 'CANAN, INGENIERIA, CONSULTORIA Y MEDIO AMBIENTE', '', 'CIC111111695', '72320000000000000', '859304320', '', '', '', 'BANORTE', '', '', 'ACTIVO'),
(55, 'CANO LUNA BRAULIO GERARDO', '', 'CALB800906NV2', '44700256007832600', '25600783263', '', '', '', 'SCOTIABANK', '', '', 'ACTIVO'),
(56, 'CAPPADOCIA BUFETE MINERO Y ADMINISTRATIVO S.C.', '', 'CMA 130731 2P3', '002700700646517982', '4651798', '', '', '', 'BANAMEX', 'pcarrillo@cappadocia.com.mx', '', 'ACTIVO'),
(57, 'CARLOS GUTEMBERG MORENO ESQUINCA', '', 'MOEC900220087', '', '', '', '', '', '', '', '', 'ACTIVO'),
(58, 'CARMEN MARIA CABELLO MATEOS', '', 'CAMC011109DZ8', '14617606290955400', '60629095542', '', '', '', 'SANTANDER', 'grupo_cabello1990@hotmail.com', '9721032770', 'ACTIVO'),
(59, 'CCP PIPE MEXICO S DE RL DE CV', '', 'CPM091020PD7', '12225001717012300', '171701231', '', '', '', 'BBVA', '', '', 'ACTIVO'),
(60, 'CEMENTOS Y CONCRETOS LA CRUZ AZUL, S.A. DE C.V.', 'CONCRETO', 'CCC210806-SI2', '12914002019491300', '1949136', '', '', '', 'BANCOMER', '', '', 'ACTIVO'),
(61, 'CESAR REYES ULLOA', 'TALLER VEHICULO ', '', '12700004848922700', '484892275', '', '', '', 'BBVA', '', '', 'ACTIVO'),
(62, 'CHUBB FIANZAS MONTERREY', '', 'FCM080718LP5', '12914002006137500', '9101663332226', '', '', '', 'BBVA BANCOMER', '', '', 'ACTIVO'),
(63, 'CINDY RUBI ESPINOZA VICTORIO', '', '', '012133027591614571', '2759161457', '', '', '', 'BBVA', '', '', 'ACTIVO'),
(64, 'CIRO GONZALEZ CUNDAPI', '', 'GOCC6708064E8', '14100920005710900', '92000571091', '', '', '', 'SANTANDER', 'electricaciro@hotmail.com', '9611076776', 'ACTIVO'),
(65, 'CLARIVEL JUAREZ CABRERA', '', 'JUCC600930P22', '12100004754354500', '475435455', '5009', '', '', 'BANBAJIO', '', '', 'ACTIVO'),
(66, 'CLARIVEL JUAREZ CABRERA', '', 'JUCC600930P22', '4066796210', '21100040667962100', '', '', '', 'HSBC', '', '', 'ACTIVO'),
(67, 'CLARIVELJUAREZ CABRERA', '', '', '21100040667962100', '4066796210', '', '', '', 'HSBC', 'llantas-servicioscalzada@outlok.com', '', 'ACTIVO'),
(68, 'CLAUDIA PAOLA ALVAREZ VENTURA', 'REFACCIONES PARA MAQUINARIA', 'AAVC960110BY3', '127100013056475000', '95651305647563', '', '', '', 'AZTECA', '', '', 'ACTIVO'),
(69, 'CLAUDIO CHACON BENAVENTE', '', '', '210070155234367', '7015000005234360', '', '', '', 'BANAMEX', 'claudio.c.b.@hotmail.es', '', 'ACTIVO'),
(70, 'COEDESSA SA DE CV', 'CARPETA ASFÁLTICA ', 'COE050404IM3', '72709005085925200', '508592528', '', '', '', 'BANORTE ', '', '', 'ACTIVO'),
(71, 'COEDESSA SA DE CV', 'CARPETA ASFALTICA ', 'COE050404IM3', '72709005085925200', '508592528', '', '', '', 'BANORTE', '', '4441307223', 'ACTIVO'),
(72, 'COEDESSA SA DE CV.', 'REFACCIONES MAQUINARIA ', 'COEO5O4O4IM3', '72709005085925200', '508592528', '', '', '', 'BANORTE', '', '', 'ACTIVO'),
(73, 'COMBUSTIBLES Y REFINADOS BURGOS', 'COMBUSTIBLE MAQUINARIA', 'CRB001117R55', '112580068532618000', '', '', '', '', 'BMONEX', '', '', 'ACTIVO'),
(74, 'COMCRET SA DE CV', 'CONCRETO ', 'COM970811SI4', '012700001195384614', '119538461', '1686', '', '', 'BBVA', '', '', 'ACTIVO'),
(75, 'COMERCIALIZADORA BALZADI SA DE CV', '', 'CBA1012036T4', '12700001815768400', '181576844', '', '', '', 'BBVA', '', '', 'ACTIVO'),
(76, 'COMERCIALIZADORA BALZADI SA DE CV', 'SEÑALAMIENTO ', 'CBA1012036T4', '12700001815768400', '181576844', '', '', '', 'BANCOMER', 'victor.zapata@balzadi.com.mx', '4448175525', 'ACTIVO'),
(77, 'COMERCIALIZADORA DE EQUIPOS INDUSTRIALES Y SERVICIOS DEL GOLFO, SA DE CV', 'EPP', 'CEI080208EE7', '14854920010457100', '92001045719', '5049', '', '', 'SANTANDER SERFIN', 'clientes@ceisgsa.com.mx', '9212148145', 'ACTIVO'),
(78, 'COMERCIALIZADORA IMPORTACIONES Y EXPORTANCIONES TERRAPAM', '', 'CIE180815797', '36180500505807800', '50050580788', 'SAN BORJA', '', '', 'INBURSA', '', '', 'ACTIVO'),
(79, 'COMERCIALIZADORA POTOSINA EN SERVICIOS Y CONSTRUCCIÓN', '', 'CPS230224BT1', '012700001202282816', '0120228281', '', '', '', 'BBVA', '', '', 'ACTIVO'),
(80, 'COMERCIALIZADORA Y ARRENDADORA SAN ROQUE', 'REFACCIONES DE MAQUINARIA ', 'CAS080211AM4', '12100001601429200', '160142921', '', '', '', 'BANCOMER', '', '', 'ACTIVO'),
(81, 'CONCRETOS 3000 S.A. DE C.V.', 'CONCRETO ', 'CTM190903QF8', '012700001139908344', '0113990834', '', '', '', 'BANCOMER', '', '', 'ACTIVO'),
(82, 'CONCRETOS 3000 SA DE CV', 'CONCRETO', '', '12700001139908300', '113990834', '', '', '', 'BANCOMER', '', '', 'ACTIVO'),
(83, 'CONEXIONES Y MANGUERAS ABASTOS S.A DE C.V.', '', '', '12700004481383000', '448138303', '', '', '', 'BANCOMER BBVA', '', '', 'ACTIVO'),
(84, 'CONMEXX DE SAN LUIS, S.A. DE C.V.', 'MAQUINARIA ', 'CSL1709141CA', '72700003586281900', '358628190', '', '', '', 'BANORTE', 'conmexxslp@gmail.com', '', 'ACTIVO'),
(85, 'CONSORCIO TOVAR DIVISION CONCRETOS', 'CONCRETERA ', 'CTD150421T11', '72700002890215400', '289021541', '', '', '', 'BANORTE', '', '', 'ACTIVO'),
(86, 'CONSTRUALCALDE SA DE CV', '', 'CON090220-6P4', '12700001122463200', '112246325', '', '', '', 'BANCOMER', '', '', 'ACTIVO'),
(87, 'CONSTRUALCALDE SA DE CV', 'CEMENTO', 'CON0902206P4', '014700655024630647', '65502463064', '', '', '', 'SANTANDER', '', '', 'ACTIVO'),
(88, 'CONSTRUCCIONES CANALIZACIONES Y SISTEMAS SA DE CV', 'SUMINISTRO DE REGISTROS', 'CCS020123I50', '72320004727294100', '472729416', '1501 GDL LA PAZ', '', '', 'BANORTE', 'concisagdl@hotmail.com', '3336304870', 'ACTIVO'),
(89, 'CONSTRUCCIONES PUNTO CIMA S DE RL DE CV', 'MAQUINARIA ', '', '14700655076880200', '14700655076880200', '', '', '', 'SANTANDER', '', '', 'ACTIVO'),
(90, 'CONSTRUCCIONES Y MANTENIMIENTO NAPOSAX S.A. DE C.V.', '', 'CAM 211215RL4', '12610001180516300', '118051631', '', '', '', 'BBVA', '', '', 'ACTIVO'),
(91, 'CONSTRUCCIONES Y MATERIALES HUAXPALTEPEC S.A. DE C.V.', 'ARENA', 'CMH1911111CA', '72610010988432700', '1098843278', '', '', '', 'BANORTE', '', '', 'ACTIVO'),
(92, 'CONSTRUCCIONES Y MATERIALES HUAXPALTEPEC S.A.DE C.V.', '', 'CMH1911111CA', '72610010988432700', '1098843278', '', '', '', 'BANORTE', '', '', 'ACTIVO'),
(93, 'CONSTRUCTORA Y DESARROLLADORA PALMONT', 'MAQUINARIA ', 'CDP220225RP3', '072930011876096319', '1187609631', '', '', '', 'BANORTE', '', '', 'ACTIVO'),
(94, 'CONSTRUCTORA Y DESARROLLADORA PALMONT SAPI DE CV', 'MAQUINARIA', 'CDP2202225RP3', '072930011876096319', '1187609631', '', '', '', 'BANORTE', '', '4441698193', 'ACTIVO'),
(95, 'CONSTRUCTORA Y DESARROLLADORA PALMONT SAPI DE CV', 'MAQUINARIA ', 'CDP2202225RP3', '072930011876096319', '1187609631', '', '', '', 'BANORTE', '', '', 'ACTIVO'),
(96, 'CONSTRUCTORA YATBALAM SA DE CV', 'MAQUINARIA ', 'CYA151126G19', '44100085092649700', '8509264973', '', '', '', 'SCOTIABANK', 'constructorayatbalam@hotmail.com', '2292508933', 'ACTIVO'),
(97, 'CONSTRUMAC, SAPI DE CV (EMPRESAS AVILA CAMACHO NAUCALPAN)', '', '', '12180004431124700', '443112470', '827', '', '', 'BANCOMER ', '', '', 'ACTIVO'),
(98, 'CONTENEDORES MARITIMOS Y MODULOS OFICINA SA DE CV', 'VENTAS DE CONTENEDORES ', 'CMM170804A91', '72180010201524300', '1020152430', '', '', '', 'BANORTE\r\n', '', '', 'ACTIVO'),
(99, 'COYATOC CONSTRUCCIONES, S.A. DE C.V', '', '', '', '', '', '', '', '', '', '', 'ACTIVO'),
(100, 'CRIBAS Y PRODUCTOS METALICOS', 'MALLAS PARA TRITURADORA', 'CMP780823LB6', '2580039216135970', '1613597', '392', '', '', 'BANAMEX', 'VENTAS@CRIBAS.COM.MX', '8181583800', 'ACTIVO'),
(101, 'CRISTIAN ALEXIS BORRAZ CHACON', '', '', '12180015787035600', '1578703561', '', '', '', 'BBVA', '', '', 'ACTIVO'),
(102, 'CRISTOBAL MANUEL RODRIGUEZ GALLARDO', '', 'ROGC7512234E0', '58700000001162200', '122965680011', '', '', '', 'BANREGIO ', '', '', 'ACTIVO'),
(103, 'CYNTHIA IVEETE SARMIENTO LOPEZ', '', 'SALC950720NWA', '72610002801558900', '280155890', '', '', '', 'BANORTE', 'smotors.cynthia17@gmail.com', '', 'ACTIVO'),
(104, 'DANIA BELEN AGUILAR BORGES', '', '', '', '', '', '', '', '', '', '', 'ACTIVO'),
(105, 'DANIEL BRAVO LEYVA', 'MAQUINARIA ', '', '14700568703786200', '56870378625', '', '', '', 'SANTANDER', '', '', 'ACTIVO'),
(106, 'DESARROLLADORA ALRAK', 'CEMENTO', 'DAL1310228N4', '014700655063070462', '65506307046', '', '', '', 'SANTANDER', ' fuerza.acero12@gmail.com', '', 'ACTIVO'),
(107, 'DESARROLLADORA FORMACRET, S.A DE CV.', 'DESMOLDANTE ', 'DF0140917HA3', '2700002180737510', '8072723', '', '', '', 'BANAMEX', '', '', 'ACTIVO'),
(108, 'Desarrollos y Servicios Valsan S de RL de CV', 'MAQUINARIA ', '', '14700655072734600', '65507273465', '', '', '', 'SANTANDER', '', '', 'ACTIVO'),
(109, 'DESARROLLOS Y SERVICIOS VALSAN S DE RL DE CV.', 'FLETE', '', '14700655072734600', '65507273465', '', '', '', 'SANTANDER', '', '4441366052', 'ACTIVO'),
(110, 'DIANA DOMINGUEZ BARRERA', 'FLETE', 'DOBD8206136M1', '72100006986341800', '698634187', '', '', '', 'BANORTE', '', '', 'ACTIVO'),
(111, 'DICOPLOSA, S.A. DE C.V.', 'BOCAL DE POLIETILENO', 'DIC9004244W2', '72700001741359300', '174135937', '0841 SLP AVENIDA', '', '', 'BANORTE', '', '', 'ACTIVO'),
(112, 'DIEGO ARMANDO PEREZ CRUZ', 'CALIBRACION DE TOPOGRAFIA ', 'PECD900324KQ5', '044700256014234163', '25601423416', '16003', '', '', 'SCOTIANBANK', '', '', 'ACTIVO'),
(113, 'DILODELA, S.A. DE C.V', 'MANGUERAS HIDRAULICA Y REFACIONES ', 'DIL-060123-P19', '12700001509324100', '150932418', '', '', '', 'BBVA BANCOMER', 'dilodela@yahoo.com.mx', '4448181717', 'ACTIVO'),
(114, 'DILODELA, S.A. DE C.V.', '', 'DIL060123P19', '12700001509324100', '150932418', '', '', '', 'BANCOMER', 'dilodela@yahoo.com.mx', '', 'ACTIVO'),
(115, 'DILODELA, S.A. DE C.V.', 'MANGUERAS Y BOMBAS ', '\r\nDIL-060123-P1', '12700001509324100', '150932418', '', '', '', 'BANCOMER', 'DILODELA@YAHOO.COM.MX', '4442561561', 'ACTIVO'),
(116, 'DIONIREN GUADALUPE JIMENEZ LOPEZ ( COMPELEC )', 'MATERIAL ELECTRICO ', 'JILD720617263', '2700077500924590', '92459', '775 JOSE DE GALVEZ', '', '', 'Banamex', 'COMPELEC01@YAHOO.COM.MX', '4444818402', 'ACTIVO'),
(117, 'DISEÑO DE INGENIERIA, CONTROL Y ASESORIA, S. A. DE C.V.', 'LABORATORIO DICA ', 'DIC180116UN8', '72700005955687000', '595569315', '', '', '', 'BANORTE ', '', '', 'ACTIVO'),
(118, 'DISEÑOS DE INGENIERIA, CONTROL Y ASESORIA S.A DE C.V', 'LABORATORIO', 'DIC180116UN8', '072700005955687018 ', '595568701', '1162 ', '', '', 'BANORTE', '', '', 'ACTIVO'),
(119, 'DISTRIBUIDOR DE MAQUINARIA DEL SUR SA DE CV', 'REFACCIONES', '', '12905001841417000', '184141709', '', '', '', 'BANCOMER', '', '', 'ACTIVO'),
(120, 'DR CONSTRUCCION INTEGRAL, S.A. DE C.V.', 'RENTA DE PAVIMENTADORA', 'JCC180514PF6', '36610500515447400', '50051544747', '', '', '', 'INBURSA', '', '', 'ACTIVO'),
(121, 'DULCE MARIA SANCHEZ ESCOBEDO', '', 'SAED780905MW8', '2100445100337760', '33776', '4451', '', '', 'BANAMEX', '', '', 'ACTIVO'),
(122, 'DULCE TOLENTINO', 'APOYO GUARDIA NACIONAL', '', '', '', '', '', '4169160000000000', 'BANCOPPEL ', '', '', 'ACTIVO'),
(123, 'EDGAR RODRIGUEZ MARTINEZ', 'UNIFORMES ', '', '12180015469645100', '1546964511', '', '', '4152314056225930', 'BANCOMER', '', '', 'ACTIVO'),
(124, 'EDIFICACION Y VIALIDADES CAVEJA', '', 'EVC171222EQ1', '12610001140875500', '114087550', '', '', '', 'BBVA', '', '', 'ACTIVO'),
(125, 'EDIFICACIONES EDHA, S.A. de C.V.', 'MAQUINARIA ', 'EED230712JQ3', '30700900037117100', '413273130201', '', '', '', 'BANBAJIO', '', '4442052804', 'ACTIVO'),
(126, 'EDIFICACIONESY VIALIDADES CAVEJA SA DE CV', 'MAQUINARIA ', 'EVC171222EQ1', '12610001140875500', '114087550', '', '', '', 'BBVA', '', '', 'ACTIVO'),
(127, 'EL MADERAL DE SAN LUIS SA DE CV', 'MADERA', 'MSL170510DS3', '14700655064289500', '65506428956', '', '', '', 'SANTANDER', '', '', 'ACTIVO'),
(128, 'ELECTRICA KP', '', '', '', '', '', '', '', '', '', '', 'ACTIVO'),
(129, 'ELECTRONICA DE SALINA CRUZ', '', 'ESC1304255K2', '14626655070786900', '65507078698', '', '', '', 'SANTANDER ', '', '', 'ACTIVO'),
(130, 'ELECTRONICA PLAZA CHIAPAS SA DE CV', 'RADIO ', 'EPC150917R95', '12100001025334800', '102533480', '', '', '', 'BANCOMER', 'galeriastuxtla@steren.com.mx', '', 'ACTIVO'),
(131, 'ELENA BERENICE ALFARO PEREZ', '', 'AAPE030705', '2100701954634820', '', '', '', '2100701954634820', 'CITIBANAMEX', '', '', 'ACTIVO'),
(132, 'ELIA MARGARITA TORRES MATA', '', '', '72700012749123800', '4189140051405590', '', '', '', 'BANORTE', '', '', 'ACTIVO'),
(133, 'ELIAZAR MARTINEZ MENDOZA', 'REGALIAS DE BANCO', '', '4169161444682480', '', '', '', '', 'BANCOOPEL', '', '', 'ACTIVO'),
(134, 'ELIZABETH ESCAMILLA TAPIA (ZONET)', 'TORNILLOS ', 'EATE840921J43', '12180004839768300', '483976831', '', '', '', 'BBVA BANCOMER ', 'ventas2@zonet.com.mx', '4445107755', 'ACTIVO'),
(135, 'EMULSIONES ASFALTICAS Y SERVICIOS DE MORELOS S.A DE C.V.', '', '', '12540001161229400', '116122949', '570', '', '', 'BANCOMER', '', '', 'ACTIVO'),
(136, 'ENGELBERT GRANADOS SAYNES', '', '', '', '62041339391710', '', '', '127620013393917000', 'BANCO AZTECA', '', '', 'ACTIVO'),
(137, 'ENLACE Y CONSTRUCCIONES COLMAN S.A. DE C.V.', '', 'ECC-160224-MK9 ', '12100001054982800', '105498287', '', '', '', 'BANCOMER', '', '', 'ACTIVO'),
(138, 'EPIFANIO ARMANDO GARCIA CAMPOS', 'PIPA ', 'GACE850906KAA', '72700010948706600', '1094870669', '', '', '', 'BANORTE', '', '', 'ACTIVO'),
(139, 'EQUIPOS Y MAQUINARIA DE MATEHUALA S.A DE C.V', 'MAQUINARIA ', 'EMM190620IG7', '72709010907024700', '1090702472', '', '', '', 'BANCO MERCANTIL DEL NORTE S.A', 'Equimmat.maquinaria@gmail.com', '4888850189', 'ACTIVO'),
(140, 'ERGON ASFALTOS MEXICO S. DE R.L DE C.V', 'EMULSION SUPERESTABLE', 'SME970909EX3 ', '14650655019726100', '65501972612', '184\r\n', '', '', 'SANTANDER SERFIN', '', '', 'ACTIVO'),
(141, 'ERGON ASFALTOS MEXICO S. DE R.L DE C.V', '', 'SME970909EX3', '14650655019726100', '65501972612', '184', '', '', 'SANTANDER SERFIN', '', '', 'ACTIVO'),
(142, 'ERIKA ALEJO PIÑA', 'PLANTAS', 'AEPE8511039W3', '2426701172186250', '', '', '', '52041658899498', 'BANAMEX', '', '', 'ACTIVO'),
(143, 'ERIKA SIBAJA RUIZ', '', 'SIRE900319UD9', '12617004609391500', '', '', '', '', 'BANCOMER', 'erikasibaja27@gmail.com', '9711337016', 'ACTIVO'),
(144, 'ERNESTO ESPINOSA RAMOS', 'REFACCIONES', 'EIRE9503093TA', '12095004781353300', '478135339', '4642', '', '', 'BBVA', '', '5656392952', 'ACTIVO'),
(145, 'ESCOBERA CANO CRUZ', '', 'ECC010721CG1', '44620256003430100', '25600343010', '', '', '', 'SCOTIABANK', 'contacto@escoberacanocruz.com.mx', '9727222969', 'ACTIVO'),
(146, 'ESTHER MUNDO SYMOR', 'COMIDAS ', '', '', '', '', '', '5512382357364720', 'BANCO AZTECA', '', '', 'ACTIVO'),
(147, 'EUCOMEX S.A. de C.V.', 'BANDA OJILLADA (MEXICO)', 'EUC-931004-1IA', '12180004463667000', '446366708', '', '', '', 'BBVA', '', '', 'ACTIVO'),
(148, 'EURO REP SAPI DE CV', '', 'ERE-140718-NY8', '2180700919581290', '1958129', '', '', '', 'BANAMEX', 'info@eurorep.mx', '', 'ACTIVO'),
(149, 'EUROFRANCE AUTOS SA DE CV', 'SERVICIO DE VEHICULO', 'EAU010109GG0', '12700004543847200', '454384725', '', '', '', 'BANCOMER', '', '', 'ACTIVO'),
(150, 'EUROTONER SAN LUIS SA DE CV', '', 'ESL140923DE2', '44700016044122700', '16044122731', '', '', '', 'SCOTIABANK', 'eurotonerventas1@hotmail.com', '4448116482', 'ACTIVO'),
(151, 'FABIAN JARQUIN RIOS', 'VIAJÉ ', '', '', '', '', '', '5263540138643123', 'ONE CARD', '', '', 'ACTIVO'),
(152, 'FABIOLA ILIANA ALVAREZ VAZQUEZ', 'MORTERO', 'AAVF790702BU2', '127180013071835000', '', '', '', '95281307183550', 'AZTECA ', '', '', 'ACTIVO'),
(153, 'FERNANDO ESPINOSA SALDAÑA', 'REPARACIÓN Y REFACCIONES', 'EISF810628FN6', '12100004788514000', '478851409', '', '', '', 'BANCOMER ', '', '', 'ACTIVO'),
(154, 'FERNANDO ONESIMO MARISCAL GARCIA', 'MATERIAL ELECTRICO ', 'MAGF7211133R7', '72700008587758000', '858775802', 'GLORIETA ', '', '', 'BANORTE ', 'electricamariscal@hotmail.com', '4448224052', 'ACTIVO'),
(155, 'FERREACERO LOPEZ LENA S.A. DE C,V.', '', 'FLL080416RF9', '2617039853557290', '5355729', '398', '', '', 'BANAMEX', '', '', 'ACTIVO'),
(156, 'FERREACERO LOPEZ LENA S.A. DE C.V', 'ACERO', 'FLL080416RF9', '2617039853557290', '5355729', '', '', '', 'BANAMEX', '', '', 'ACTIVO'),
(157, 'FERREACERO LOPEZ LENA S.A. DE C.V.', 'FERRETERÍA ', 'FLL080416RF9', '2617039853557290', '5355729', '398', '', '', 'BANAMEX', '', '9717137262', 'ACTIVO'),
(158, 'FIBREMEX', 'POLIDUCTO LISO', 'FIB000411840', '112320180729133000', '', '', '', '', 'BMONEX', '', '', 'ACTIVO'),
(159, 'FIDEL GILDARDO DE ITA GONZÁLEZ', '', '', '2700080000000000', '77532065', '', '', '', 'BANAMEX', '', '', 'ACTIVO'),
(160, 'FIDEL JIMENEZ GARCIA', 'ELECTRICO INSTALACIONES Y MANTENIMIENTO ', '', '4189143077716240', '', '', '', '', 'BANORTE ', '', '', 'ACTIVO'),
(161, 'FIERROS FLEXIBLES, S.A. DE C.V', 'REJILLAS', 'FFL010525422', '12700001092575300', '109257535', '', '', '', 'BANCOMER', '', '', 'ACTIVO'),
(162, 'FILOMENO FAUSTINO ISODORO', '', '', '137700103175470000', '10317547027', '', '', '4169161433076280', 'BANCOOPEL', '', '', 'ACTIVO'),
(163, 'FLOR DE ALHELI LOPEZ CANSECO', 'PAGO DE MECÁNICA ', 'LOCF800619121', '72620011447647200', '1144764720', '', '', '', 'BANORTE', 'manguerasmatias@hotmail.com', '9727222946', 'ACTIVO'),
(164, 'FLOR DE MARIA DE LOURDES GOMEZ GONZALEZ', 'VALES DE ACARREOS ', 'GOGF711005NC9', '12100004600408000', '460040800', '', '', '', 'BBVA BANCOMER ', '', '', 'ACTIVO'),
(165, 'FLORIDALMA PEREZ RAMIREZ', 'MANO DE OBRA', '', '127111013704136000', '4027665766596680', '', '', '', 'AZTECA', '', '', 'ACTIVO'),
(166, 'FORTUNATO GOMEZ VAZQUEZ', '', '', '12111015212270100', '1521227017', '', '', '', 'BBVA', '', '', 'ACTIVO'),
(167, 'FRANCISCO JAVIER LÓPEZ MIRANDA', '', '', '', '', '', '', '4152314264614080', 'BBVA', '', '', 'ACTIVO'),
(168, 'FRANCISCO JAVIER MORALES PEREZ', '', 'MOPF8908019K2', '12100004744204900', '474420497', '', '', '', 'BANCOMER ', '', '', 'ACTIVO'),
(169, 'FRANCISCO MARTINEZ BRACO', '', '', '', '', '', '', '4027665825633180', 'BANCO AZTECA', '', '', 'ACTIVO'),
(170, 'FRIDA GABRIELA FELIX SANCHEZ', '', 'FESF971208EI2', '12100001078288100', '107828810', '', '', '', 'BBVA', 'facturasmafrid27@gmail.com', '9611820679', 'ACTIVO'),
(171, 'FYA REFACCIONES PARA MAQUINARIA PESADA S.A. DE C.V.', '', '', '72610001526965200', '152696520', '', '', '', '', 'pfiliberto@hotmail.com', '9511837170', 'ACTIVO'),
(172, 'GABRIELA LOPEZ DE LARA GONZALEZ', 'REFACCIONARIA', 'LOGG8006054B7', '12700004806538600', '480653861', '', '', '', 'BANCOMER', 'dilodelalosgomez@gmail.com', '4442561561', 'ACTIVO'),
(173, 'GABRIELA LOPEZ DE LARA GONZALEZ', 'MANGUERA Y CONEXIONES ', 'LOGG-800605-4B7', '12700004806538600', '480653861', '', '', '', 'BANCOMER ', '', '', 'ACTIVO'),
(174, 'GAEL GABRIELESQUIVEL RODRIGUEZ.', 'FLETE (CAMIONERO) ', 'EURG040807283', '72700012185931800', '1218593184', '1949', '', '', 'BANORTE', 'rpaulinc@live.com.mx', '', 'ACTIVO'),
(175, 'GALEX SUMINISTROS S.A. DE C.V.', '', '', '72700010267923700', '1026792379', '', '', '', 'BANORTE', '', '4442798375', 'ACTIVO'),
(176, 'GALEX SUMINISTROS S.A. DE C.V.', 'TUBERIAS, CONEXIONES Y VALVULA ', '', '72700010267923700', '1026792379', '', '', '', 'BANORTE', '', '', 'ACTIVO'),
(177, 'GALICIA VAZQUEZ JOSE MANUEL', 'MAQUINARIA', 'GAVM770326DI9', '72700002502891800', '250289181', '', '', '', 'BANORTE', ' \r\n 	\r\ngalicia_servicio@hotmail.com, pscj@live.com', '4444222627', 'ACTIVO'),
(178, 'GALICIA VAZQUEZ JOSE MANUEL', 'MAQUINARIA ', '', '72700002502891800', '250289181', '', '', '', 'BANORTE', '', '', 'ACTIVO'),
(179, 'GALICIA VAZQUEZ JOSE MANUEL', 'MAQUINARIA ', 'GAVM770326DI9', '72700002502891800', '250289181', '', '', '', 'BANORTE', 'galicia_servicio@hotmail.com', '', 'ACTIVO'),
(180, 'GAS DEL TROPICO, S.A DE C.V', 'PLANTA ASFALTO (GAS LP)', '', '2617039852436530', '5243653', '', '', '', 'BANAMEX', '', '7111895', 'ACTIVO'),
(181, 'GASCOM SA DE CV', '', 'GCO-710315-S76', '12100001545210700', '698634187', '', '', '', 'BANCOMER', '', '', 'ACTIVO'),
(182, 'GASOLINERA INTEGRAL SAN IGNACIO, S.A. DE C.V.', 'COMBUSTIBLE ', 'GIS050705HQ7', '72620008325103500', '832510357', '', '', '', 'BANORTE', 'sanignacio_4671@hotmail.com', '', 'ACTIVO'),
(183, 'GENARO MORALES LEON', '', 'MOLG8409204I6', '12100004836064300', '483606430', '', '', '', 'BANCOMER', '', '', 'ACTIVO'),
(184, 'GEOFLUX SA DE CV', '', 'GEO140606FP1', '21100040570062600', '4057006264', '', '', '', 'HSBC', 'catI7601@gmail.com', '9616719391', 'ACTIVO'),
(185, 'GERARDO ALONSO RODRIGUEZ MUÑOZ', 'ARTICULOS PARA DORMITORIOS ', '', '12930015972381600', '1597238162', '', '', '4152314232161760', 'BANCOMER', '', '', 'ACTIVO'),
(186, 'GILBERTO VARGAS GUERRA', 'MAQUINARIA RETRO', '', '14628655089263300', '65508926333', '', '', '', 'SANTANDER ', '', '', 'ACTIVO'),
(187, 'GREEN ENERGY DEL POTOSI SA DE CV', 'EQUIPO MENOR ', 'GEP221122BT9', '12700001201311700', '120131171', '', '', '', 'BANCOMER', 'gep-green-adm@outlook.com', '', 'ACTIVO'),
(188, 'GREEN ENERGY DEL POTOSI SA DE CV', '', 'GEP221122BT9', '12700001201311700', '120131172', '', '', '4555113011292820', 'BANCOMER', 'gep-green-adm@outlook.com', '', 'ACTIVO'),
(189, 'GRUPO CALIZO MAREJUTE SA DE CV', '', 'GCM1308143VA', '12616001130318600', '113031861', '', '', '', 'BBVA', '', '', 'ACTIVO'),
(190, 'GRUPO CALIZO MAREJUTE SA DE CV', 'MATERIAL PEDRAPLEN', 'GCM1308143VA', '12616001130318600', '113031861', '', '', '', 'BBVA', '', '', 'ACTIVO'),
(191, 'GRUPO COMERCIAL ACOMEE SA DE CV', 'MATERIAL ELECTRICOS ', 'GCA900118AX6\r\n', '12700001346128100', '134612817', '', '', '', 'BBVA BANCOMER ', 'info@acomee.com.mx ', '4447020051', 'ACTIVO'),
(192, 'GRUPO CONINTE CONSULTORIA Y SERVICIOS INTEGRALES S.A DE C.V', 'FABRICACIÓN Y SUMINISTRO DE ANCLAS PIVS', 'GCC9903125N7', '30100388792401000', '38879240101', '', '', '', 'BANBAJIO', '', '', 'ACTIVO'),
(193, 'GRUPO LLANTERO SIETE LEGUAS S.A. DE C.V.', '', 'GLS-010115-7M0', '12180004538664800', '453866483', '', '', '', 'BANCOMER', '', '9616153011', 'ACTIVO'),
(194, 'GRUPO MADISA (MAQUINAS DIESEL, S.A. DE C.V.)', '', 'MDI-931014-D37', '2580008777893300', '877789330', '', '', '', 'BANAMEX', '', '', 'ACTIVO'),
(195, 'GRUPO NACIONAL PROVINCIAL', 'SEGUROS-MAQUINARIA ', '', '12914002012518600', '1251864', '', '39234451391', '', 'BANCOMER', '', '', 'ACTIVO'),
(196, 'Grupo Rivend México S.A. de C.V.', 'TUBOS', 'GRM2103236D9', '72225011728976500', '1172897658', '', '', '', 'BANORTE', 'erivera@gruporivend.com', '4771064672', 'ACTIVO'),
(197, 'GRUPO ROCSA REFACCIONES ORIGINALES S.A DE C.V', '', '', '2100700000000000', '70085934773', '', '', '', 'CITI BANAMEX', 'grupo.rocsa@outlook.com', '', 'ACTIVO'),
(198, 'GUADALUPE TOLENTINO GOMEZ', 'DERECHO DE VÍA ', '', '', '', '', '', '4169160493973530', 'BANCOPEL ', '', '', 'ACTIVO'),
(199, 'HDI SEGUROS S.A DE C.V', '', 'HSE701218532 ', '12225004534523200', '453452328', '810', '', '', 'BBVA BANCOMER', '', '', 'ACTIVO'),
(200, 'HECTOR CERRILLO ROMERO', '', 'CERH 730707 KJA', '2700002180137240', '8013724', '´021', '', '', 'BANAMEX', 'hesco_slp@prodigy.net.mx ', '444 813 34', 'ACTIVO'),
(201, 'HECTOR HERNANDEZ ZARAZUA', 'MAQUINARIA', '', '072700005086949272', '508694927', '', '', '', 'BANORTE', '', '4446581625', 'ACTIVO'),
(202, 'HERNAN REYEZ MARTINEZ', 'MATERIAL', 'REMH771228LU5', '2620047478173110', '4747817311', '474', '', '', 'BANAMEX  perfiles          ', '', '', 'ACTIVO'),
(203, 'HERRERA DE ORIENTE SA DE CV', 'SERVICIO CAMIONETA ', 'HOR220610F8A', '12700001209314300', '120931438', '', '', '', 'BBVA BANCOMER', '', '', 'ACTIVO'),
(204, 'HERRERA DEL ORIENTE SA DE CV', 'SERVICIOS Y REFACCIONES', '', '12700001209314300', '120931438', '', '', '', 'BBVA', '', '', 'ACTIVO'),
(205, 'HOME DEPOT MEXICO S. DE R.L. DE C.V.', 'MATERIALES Y FERRETERIA ', 'HDM-001017-AS1', '2580008777305570', '7730557', '87', '', '', 'BANAMEX', '', '', 'ACTIVO'),
(206, 'HOME DEPOT MÉXICO S. DE R.L. DE C.V.', '', 'HDM-001017-AS1', '2580008777305570', '', '', '', '', 'BANAMEX', '', '', 'ACTIVO'),
(207, 'HOSMAN DE LA CRUZ CABRERA', '', 'CUCH750128KH3', '72100008027816300', '802781637', 'LOS LAURELES', '', '', 'BANORTE', '', '', 'ACTIVO'),
(208, 'ING FERNANDO CAÑAS', '', '', '', '', '', '', '', '', '', '', 'ACTIVO'),
(209, 'ING WILBER MENDOZA ROBLES', 'GPS PARA TOPOGRAFÍA ', '', '12100004789234700', '478923477', '', '', '', 'BBVA ', '', '', 'ACTIVO'),
(210, 'ING.ROBERTO ANTONIO BAUTISTA MONTALVO', 'CAJA CHICA', '', '12051015284553100', '1528455312', '', '', '4152313986004410', 'BANCOMER', '', '', 'ACTIVO'),
(211, 'INGENIERIA ESPECIALIZADA AL SERVICIO DE LA CONSTRUCCION, S.A. DE C.V.', 'CALCULO ESTRUCTURAL', 'IEA0708027EA', '2180415201379020', '137902', '', '', '', 'BANAMEX', '', '', 'ACTIVO'),
(212, 'INGENIERIA Y CONSTRUCCIONES CIVILES EDAN SA DE CV', 'MAQUINARIA', 'ICC2008218YA', '30700900032796900', '376530780201', '', '', '', 'BANBAJIO', 'edan_ingenieria@hotmail.com', '4442242045', 'ACTIVO'),
(213, 'INGENIERIA, SUPERVISION Y LABORATORIO \r\nDE CONTROL DE CALIDAD S. DE R.L. DE C.V.', 'LABORATORIO CONTROL DE CALIDAD', 'ISL1002104D8', '012650001140149527', '114014952', '', '', '', 'BBVA', '', '', 'ACTIVO'),
(214, 'INMER ERNESTO MOYA LEMUS', '', '', '', '', '', '', '5062990505315190', 'ONE CARD', '', '', 'ACTIVO'),
(215, 'INSTITUTO MEXICANO DEL SEGURO SOCIAL', '', '', '', '', '', '', '', '', '', '', 'ACTIVO'),
(216, 'IRAM HERNANDEZ BRAVO', 'MAQUINARIA', 'HEBI901005KJ6', '014700605916165296', '60591616529', '', '', '', 'SANTANDER', '', '', 'ACTIVO'),
(217, 'IRVING DANIEL HERNANDEZ CANALES', 'TOPOGRAFIA', 'HECI8712077M5', '012180015686644987', '1568664498', '', '', '', 'BANCOMER', '', '', 'ACTIVO'),
(218, 'ISAIAS ANDRES GARCIA LOPEZ', 'BLOCK', 'GALI7107064I0', '72620012199571600', '1219957167', '', '', '', 'BANORTE', '', '', 'ACTIVO'),
(219, 'ISMAEL ESTRADA PEREZ', '', '', '', '', '', '', '4027665792127410', '', '', '', 'ACTIVO'),
(220, 'ISTMO DIESEL IMAGEN', '', 'IDI1705151K5', '72626003244012400', '324401240', '3525', '', '', 'BANORTE', 'idisacv082017@gmail.com', '', 'ACTIVO'),
(221, 'ISTMO DIESEL IMAGEN S.A DE C.V.', 'CADENA DE AMARRE', 'IDI1705151K5', '72626003244012400', '324401240', '3525', '', '', 'BANORTE ', 'idisacv082017@gmail.com', '9717162271', 'ACTIVO'),
(222, 'IVAN GARCIA BELMONT', '', 'GABI770608U8A', '2790903722290620', '2229062', '', '', '', 'BANAMEX', '', '', 'ACTIVO'),
(223, 'J. SANTOS RAMIREZ VECERRA', '', '', '30700900025084500', '310527230201', '', '', '', 'BAN BAJIO', 'procesos.construccion@hotmail.com', '', 'ACTIVO'),
(224, 'JARZETA INGENIERIA INTEGRAL S.A. DE C.V.', '', 'JII2003206H3', '12100001155624000', '115562406', '', '', '', 'BBVA', 'facturacionjarzeta@gmail.com', '', 'ACTIVO'),
(225, 'JAVIER ALEJANDRO CHAVEZ PERALTA', 'ADHECON, SALCHICHA, CURACRETO ', 'CAPJ770722IX3', '21700040248653400', '4024865347', '', '', '', 'HSBC', '', '', 'ACTIVO'),
(226, 'JAVIER MIRANDA GUTIÉRREZ', '', 'MIGJ950820MQA', '21700040630489800', '4063048987', '', '', '', 'HSBC', 'plasticomiranda@gmail.com', '', 'ACTIVO'),
(227, 'JESUS PEDRO PEREZ MARTINEZ', 'VIÁTICOS ', '', '', '', '', '', '5579099014870520', 'SANTANDER', '', '', 'ACTIVO'),
(228, 'JESUS RIOS USISIMA', 'SOLDADURA', 'RIUJ6805298C0', '2100000000000000', '8041383', '', '', '', 'BANAMEX', '', '9611251293', 'ACTIVO'),
(229, 'JESUS RIOS USISIMA', 'MAQUINA SOLAR', 'RIUJ-680529-8C0', '2100004680413830', '8041383', '46', '', '', 'BANAMEX', 'dituxtla@hotmail.com', '9611251293', 'ACTIVO'),
(230, 'JOAQUIN MUÑIZ CAMACHO', '', 'MUCJ750726HV2', '2100426100760540', '426176054', '', '', '', 'BANAMEX', '', '', 'ACTIVO'),
(231, 'JOE GUADALUPE DEJESUS PEREZ MENDEZ', '', '', '', '', '', '', '4152313704712490', 'BBVA', '', '', 'ACTIVO'),
(232, 'JOEL RODRIGUEZ RAFAEL', '', 'RORJ790615QP5', '44620256008923500', '25600892351', '', '', '', 'SCOTIABANK', 'joel_rodriguez97@hotmail.com', '', 'ACTIVO'),
(233, 'JONATHAN GONZALEZ ESPINOZA', '', 'GOEJ8303162C9', '12540015184485600', '1518448569', '', '', '', 'BBVA', '', '', 'ACTIVO'),
(234, 'JONATHAN GONZALEZ ESPINOZA', 'MATERIAL PEDRAPLEN', 'GOEJ8303162C9', '12540015184485600', '1518448569', '', '', '', 'BBVA', '', '', 'ACTIVO'),
(235, 'JORGE ALBERTO RODRIGUEZ CANSINO', 'FERRETERIA', 'ROCJ850215SH9', '2934060701157680', '', '', '', '', 'BANAMEX', '', '4581180167', 'ACTIVO'),
(236, 'JORGE ANTONIO SANCHEZ', 'MANGUERAS', 'AOSJ780906I44', '44617087005206600', '8700520667', '', '', '', 'SCOTIABANK', 'cotmar_panda@hotmail.com', '9727221986', 'ACTIVO'),
(237, 'JORGE HUICHAN FUENTES', 'MIA-P ', 'HUFJ610128IBA', '12700001680192800', '168019282', '', '', '', 'BANCOMER', '', '', 'ACTIVO'),
(238, 'JORGE LUIS FRAGA CORTES', '', 'FACJ900715U61', '12700001956696400', '195669642', '', '', '', 'BANCOMER', '', '', 'ACTIVO'),
(239, 'JORGE LUIS ROMERO ESPARZA', 'ACARREOS', 'ROEJ0210053J2', '12010004783452200', '4783452289', '', '', '', 'BANCOMER', 'jorgelre0510@gmail.com', '4581090077', 'ACTIVO'),
(240, 'JOSE ALEXANDRO ALVAREZ MARTINEZ', '', '', '5062990505005630', '', '', '', '', 'ONE CARD', '', '', 'ACTIVO'),
(241, 'JOSE ALFREDO SANTIS LOPEZ', 'REFACCIONES', 'SALA710705147', '127100013715478000', '96611371547815', '', '', '', 'BANCO AZTECA', '', '', 'ACTIVO'),
(242, 'JOSE ANTONIO DE JESUS HERNANDEZ', 'MATERIAL PÉTREO ', '', '44620256047491300', '', '', '', '', 'SCOTIABANK', '', '', 'ACTIVO'),
(243, 'JOSE BRAULIO RUIZ DE LA CRUZ', '', '', '137138101709642000', '10170964212', '', '', '', 'BANCOPEL', '', '', 'ACTIVO'),
(244, 'JOSE CARMEN TORRES TRUJILLO', '', 'TOTC660505QJ8', '72700006121267200', '612126727', '', '', '', 'BANORTE', 'jctorres5@prodigy.net.mx', '4448318654', 'ACTIVO'),
(245, 'JOSE JACOB GONZALEZ SANCHEZ', 'FERRETERÍA ', 'GOSJ8602114V9', '127100013612051000', '', '', '', '', 'BANCO AZTECA', '', '', 'ACTIVO'),
(246, 'JOSE JACOB GONZALEZ SANCHEZ', '', 'GOSJ8602114V9', '127100013612051000', '', '', '', '', 'BANCO AZTECA', '', '9616881229', 'ACTIVO'),
(247, 'JOSE JAIME PAULIN CISNEROS', 'FLETES ', 'PACJ7402114V7', '012700001700566775', '0170056677', '', '', '', 'BBVA', '', '', 'ACTIVO'),
(248, 'JOSÉ JAIME TOVAR RODRÍGUEZ', '', '', '2700903993267280', '9326728', '', '', '', 'CITY BANAMEX', '', '4441537538', 'ACTIVO'),
(249, 'JOSÉ JUAN MARTÍNEZ VALERO', '', 'MAVJ8302032Z9', '12700011550708400', '1155070848', '', '', '', 'BBVA', '', '4441210083', 'ACTIVO'),
(250, 'JOSE LUIS BARRIENTOS GOMEZ', 'RENTA DE CAMIÓN ', '', '', '', '', '', '5204165682426190', 'CITI BANAMEX', '', '', 'ACTIVO'),
(251, 'JOSE LUIS ZEPEDA CHAVEZ', '', '', '', '', '', '', '5062990506021940', 'ONECARD', '', '', 'ACTIVO'),
(252, 'JOSE MANUEL JUAREZ COUTIÑO', '', '', '12100004762224100', '476222412', '6699', '', '', 'BBVA BANCOMER', '', '', 'ACTIVO'),
(253, 'JOSE MARTIN PEREZ', 'RENTA BAILARINA ', '', '', '660329761', '', '', '4189143096140510', 'BANORTE', '', '', 'ACTIVO'),
(254, 'JOSE OMAR RUIZ GARCIA', 'MAQUINARIA ', '', '', '', '', '', '4152314277524440', 'BANCOMER', '', '', 'ACTIVO'),
(255, 'JOSE RICARDO ALMENDARIZ ALONSO', '', 'AEAR841124-RJ4', '12180015522555800', '1552255585', '', '', '', 'BVA BANCOMER', '', '', 'ACTIVO'),
(256, 'JOSE ROGELIO VALENCIA GUILLEN', '', '', '', '', '', '', '4169160859459570', 'BANCOPPEL ', '', '', 'ACTIVO'),
(257, 'JOSUÉ IVÁN MOGUEL ESTUDILLO', '', 'MOEJ820503CP7', '72100006191721000', '619172107', 'EL RETIRO', '', '', 'BANORTE', 'gru-top@hotmail.com', '9616165308', 'ACTIVO'),
(258, 'JOSUÉ IVÁN MOGUEL ESTUDILLO', 'GPS', 'MOEJ820503CP7', '72100006191721000', '619172107', 'EL RETIRO', '', '', 'BANORTE', '', '', 'ACTIVO'),
(259, 'JUAN CARLOS FUENTES', 'RENTA NEUMÁTICO ', '', '72164012283133200', '1228313327', '', '', '', 'BANORTE ', 'jcfuentesp@hotmail.com', '6566073583', 'ACTIVO'),
(260, 'JUAN CARLOS FUENTES OLASCOAGA', '', 'FUOJ970424SS0', '72164012283133200', '1228313327', '', '', '', 'BANORTE ', '', '', 'ACTIVO'),
(261, 'JUAN DE DIOS JIMENEZ MONTEJO', '', 'JIMJ9210285S8', '12100001005576000', '100557609', '', '', '', 'BANCOMER', '', '', 'ACTIVO'),
(262, 'JUAN EDGAR PARRA DE LA ROSA', 'MAQUINARIA', 'PARJ860208CN8', '2700702015028780', '10058401011', '0383', '', '', 'CITIBANAMEX', 'edgar6292parrs@gmail.com', '4444151606', 'ACTIVO'),
(263, 'JUAN EDGAR PARRA DE LA ROSA', 'CAMIÓN CISTERNA', 'PARJ860208CN8', '2700702015028780', '', '', '', '', 'CITIBANAMEX', '', '', 'ACTIVO'),
(264, 'Juan Manuel esparza esparza', '', '', '', '', '', '', '4169161413415360', 'BANCOPPEL', '', '', 'ACTIVO'),
(265, 'JUANA ANGELA MAQUEDA MONJARAS', 'INYECTOR', 'MAMJ-820330-MF1', '12460004742509700', '474250974', '', '', '', 'BANCOMER', '', '', 'ACTIVO'),
(266, 'JUANA EMILIA ORTIZ CASTELAN', 'ACCESORIOS TOPOGRAFIA ', 'OICJ6603163J8', '72700003244520100', '324452019', '', '', '', 'BANORTE', 'fazza.admon@gmail.com', '', 'ACTIVO'),
(267, 'JULIO CESAR GRIMALDO REYNOSO (IMEI)', 'INSTALACION Y MANTENIMIENTO ELECTRICO ', 'GIRJ8410211H5', '30700900002196100', '10850758', '', '', '', 'BANCO DEL BAJIO', '', '', 'ACTIVO'),
(268, 'JULIO CESAR RIOS SANCHEZ', 'LLANTAS', 'RISJ690213S35', '72620005356867100', '535686713', '', '', '', 'BANORTE', '', '', 'ACTIVO'),
(269, 'JULIO CESAR RIOS SANCHEZ', 'LLANTAS', 'RISJ690213S35', '72620005356867100', '535686713', '', '', '', 'BANORTE', 'elbochito69@hotmail.com', '9721169459', 'ACTIVO'),
(270, 'JUSTINO ROSALES MARTINEZ', '', '', '', '1575389300', '', '', '', 'BBVA', '', '', 'ACTIVO'),
(271, 'JUVENTINO SANTOS ENRIQUEZ', '', 'SAEJ5701267L0', '21617061338829600', '6133882960', '', '', '', 'HSBC', 'manguerasyconexionesdejuchitan@hotmail.com', '', 'ACTIVO'),
(272, 'KARLA EDITH ARREDONDO MORENO', 'MAQUINARIA ', '', '14700606261070600', '60626107063', '', '', '', 'SANTANDER', '', '', 'ACTIVO'),
(273, 'KOMBITEC, S.A. DE C.V', 'MATERIAL ELECTRICO ', 'KOM0702099T1', '2700038356154550', '5615455', '383', '', '', 'Banamex, S.A.', 'contabilidad@kombitec.com.mx', '4444111599', 'ACTIVO'),
(274, 'LANDERO & SANCHEZ ENERGY SERVICES S.A. DE C.V.', 'APOYO PARA POLICIA DE TRANSITÓ ', 'LAS180830QT9', '2905701311800960', '70131180096', '', '', '', 'CITIBANAMEX', '', '', 'ACTIVO'),
(275, 'LAPTOP STORE S.A DE C.V', 'AIRE COMPRIMIDO ', 'LST1812286M3', '12610001129535500', '112953552', '', '', '', 'BBVA', 'ventas@laptopserviceistmo.com', '9727220061', 'ACTIVO'),
(276, 'LAUMIR EMPRESA DE SEGURIDAD PRIVADA SA DE CV', '', 'LES110616MP9', '72180002980956500', '298095656', '', '', '', 'BANORTE', '', '', 'ACTIVO'),
(277, 'LAURA VAZQUEZ VALERIO', '', '', '', '', '', '', '5062990506019104', 'ONE CARD', '', '', 'ACTIVO'),
(278, 'LEONEL LOPEZ CANSECO', '', '', '72620010941759300', '1094175935', '', '', '', 'BANORTE', 'Leonel.sagitario10@gmail.com', '9727220726', 'ACTIVO'),
(279, 'LEYDI BRISELDA RUIZ VAZQUEZ', 'RENTA DEPARTAMENTO ', '', '14100260328104900', '26032810492', '', '', '', 'SANTANDER', '', '', 'ACTIVO'),
(280, 'LIC. MAURO SANCHEZ LOPEZ', '', '', '127100001561946000', '96610156194631', '', '', '', 'AZTECA', '', '', 'ACTIVO'),
(281, 'LORENA ALVARADO MEDINA', '', '', '127700013018099000', '21611301809912', '', '', '', 'BANCO AZTECA (GUARDADITO)', '', '', 'ACTIVO'),
(282, 'LORENA PATRICIA VIDAL MICELI', 'REFACCIONES', 'VIML870823MCSDC', '12100015002044700', '1500204478', '', '', '', 'BANCOMER', '', '', 'ACTIVO'),
(283, 'LORENA VELAZQUEZ MARTINEZ', 'RENTA CAMPAMENTO ', '', '', '', '', '', '5062990506202640', 'ONECARD', '', '', 'ACTIVO'),
(284, 'LOURDES DEL SOCORRO OCAMPO HERNANDEZ', '', 'OAHL 770627EW1', '2100445100728280', '445172828', '', '', '', 'BANAMEX', '', '', 'ACTIVO'),
(285, 'LOURDES DEL SOCORRO OCAMPO HERNÁNDEZ', '', 'OAHL770627EW1', '2100445100728280', '445172828', '', '', '', 'BBVA', '', '', 'ACTIVO'),
(286, 'LUCIA NATALI HERNÁNDEZ COLUNGA', '', 'HECL850123DJ9', '646015206877192000', '', 'MERCADO PAGO', '', '', 'MERCADO PAGO', 'lunitita8Qgmail.com', '4441884735', 'ACTIVO'),
(287, 'LUIS ALBERTO HERNANDEZ LOPEZ', 'AGUA POTABLE', 'HELL8103128R2', '127620013764915000', '42391376491583', '', '', '', 'BANCO AZTECA', '', '', 'ACTIVO'),
(288, 'LUIS ALBERTO MONTALVO GUTIÉRREZ', 'RENTA CISTERNA', '', '12700026368212800', '2636821286', '', '', '', 'BANCOMER', '', '', 'ACTIVO'),
(289, 'LUIS ALVAREZ MENDOZA', 'FLETE', '', '127620001501285000', '42390150128534', '', '', '', 'BANCO AZTECA ', '', '', 'ACTIVO'),
(290, 'LUIS CARLOS ESCALANTE BECERRA', '', '', '2700700644938740', '4493874', '7006', '', '', 'BANAMEX', 'INFO@IDEA-TEXTIL.COM', '4448100455', 'ACTIVO'),
(291, 'LUIS CARLOS ESCALANTE BECERRA', 'PLAYERAS', 'EABL8509277W0', '2700700644938740', '4493874', '7006', '', '', 'BANAMEX', '', '', 'ACTIVO'),
(292, 'LUIS CARLOS ESCALANTE BECERRA', '', '', '2700700644938740', '4493874', '', '', '', 'BANAMEX', '', '', 'ACTIVO'),
(293, 'LUIS EDGAR ALVARADO DE LA TORRE', 'CAMPAMENTO CACTUS ', 'AATL740205AF2', '12700004796273200', '', '', '', '', 'BBVA BANCOMER', '', '', 'ACTIVO'),
(294, 'LUIS IGNACIO HERNÁNDEZ ORDAZ', 'DESMONTE', '', '', '', '', '', '5129122000821440', 'ONE CARD', '', '', 'ACTIVO'),
(295, 'LUIS JAVIER JIMENEZ RUIZ', 'COMBUSTIBLE ', 'JIRL011221R12', '2191006548660130', '6548660153', '', '', '', 'HSBC', '', '', 'ACTIVO'),
(296, 'LUIS JOAQUIN ZUÑIGA MARQUEZ', 'REFACCIONES', 'ZUML740330DN2', '12700001964823300', '196482333', '', '', '', 'BANCOMER ', '', '', 'ACTIVO'),
(297, 'LUISA ALHELI ROQUE OCAÑA', 'CAJA CHICA', '', '646100146404786151', '', '', '', '4217470137227043', 'SPIN BY OXXO', '', '4442817330', 'ACTIVO'),
(298, 'MA. DE JESUS GUTIERREZ MENDOZA', '', '', '12700004780804200', '478080429', '', '', '', 'BANCOMER', '', '', 'ACTIVO'),
(299, 'MACRO SERVICIO TOCOLLANTA SA DE CV', 'SERVICIO DE VEHICULO ', 'MST-930210-PQA', '12700001121448000', '112144808', '', '', '', 'BANCOMER', 'galvez@tocollanta.com', '', 'ACTIVO'),
(300, 'MADERAS EJL SA DE CV', '', 'MEJ2304046V1', '2100701312150350', '70131215035', '', '', '', 'BANAMEX', 'maderasejl1@gmail.com', '', 'ACTIVO'),
(301, 'MAGALIA GALLEGOS RUEDA', 'RENTA VIBRADOR', 'GARM700529UM1', '72620002081778900', '208177896', '', '', '', 'BANORTE', '', '', 'ACTIVO'),
(302, 'MANUFACTURAS CARMEN S.A DE C.V.', '', '', '2180057484629390', '8462939', '574', '', '', 'BANAMEX', '', '', 'ACTIVO'),
(303, 'MAQRO S.A DE C.V', '', 'FCM080718LP5', '72580001315663400', '131566344', '131', '', '', 'BANORTE', '', '9611500513', 'ACTIVO'),
(304, 'MAQUINARIA WIEBE KM 24', 'RENTA NEUMÁTICO ', 'MWK0901121KA', '12150001667597800', '166759785', '4462', '', '', 'BANCOMER', '', '', 'ACTIVO'),
(305, 'MAQUINAS DIESEL S.A. DE C.V.', '', 'MDI-931014-D37', '', '835722', '', '', '', 'BANCOMER', '', '', 'ACTIVO'),
(306, 'MARCO ANTONIO BRAVO VALERO', 'MAQUINARIA', '', '72700011424252900', '1142425296', '', '', '', 'BANORTE', 'bramaq.slp@gmail.com', '4447181121', 'ACTIVO'),
(307, 'MARCOS ANTONIO CERDA CUELLAR', '', '', '127700013915506000', '53931391550663', '', '', '4027665840014470', 'BANCO AZTECA', '', '', 'ACTIVO'),
(308, 'MARGARITO TORRES GARCÍA', '', '', '', '', '', '', '5512382418752442', 'BANCO AZTECA', '', '', 'ACTIVO'),
(309, 'MARGONZ PROVREDORA DIESEL', 'REFACCIONES DIESEL ', 'MPD-220411', '58700000014383600', '121019820019', '', '', '', 'BANREGIO ', '', '', 'ACTIVO'),
(310, 'MARIA DE LOS ANGELES RAMIREZ CORTES', '', '', '12626004829115500', '482911558', '', '', '', 'BBVA', 'venta.lavcort@gmail.com', '9711600612', 'ACTIVO'),
(311, 'MARIA DEL CARMEN CADENA FERNANDEZ', 'SIKA ', 'CAFC330121H34', '2700002180737510', '218073751', '', '', '', 'BANAMEX', 'sikaslp@hotmail.com', '', 'ACTIVO'),
(312, 'MARIA DEL ROSARIO GARZA RODRIGUEZ', '', 'GARR770909K10', '12709004856398600', '485639867', '', '', '', 'BBVA BANCOMER ', '', '4881092212', 'ACTIVO'),
(313, 'MARIA DEL ROSARIO GARZA RODRIGUEZ', 'VENTA DE BANDAS TRANSPORTADORAS ', 'GARR770909KI0', '12709004856398600', '485639867', '', '', '', 'BBVA BANCOMER', '', '', 'ACTIVO'),
(314, 'MARIA LIBRADA GUIZAR VELASCO', '', '', '', '', '', '', '5512382416922470', 'BANCO AZTECA', '', '', 'ACTIVO'),
(315, 'MARIA LIZBETH DUEÑAS MENDOZA', 'CAMPAMENTO', '', '127934013346564000', '4661334656430', '', '', '4027665793866350', 'BANCO AZTECA', '', '', 'ACTIVO'),
(316, 'MARIO GARCIA ORDOÑEZ', '', '', '', '', '', '', '5256782583344390', 'CITI BANAMEX', '', '', 'ACTIVO'),
(317, 'MARIO SAYNES NUÑES', '', 'SANM600119EM9', '72620008554127300', '855412731', '3565', '', '', 'BANORTE', 'foca95@hotmail.com', '9727220710', 'ACTIVO'),
(318, 'MARTHA CAROLINA CARLOCK LOPEZ', 'COMPRA PIPA', '', '21700065980309700', '6598030976', '', '', '', 'HSBC', '', '', 'ACTIVO'),
(319, 'MARTIN ALBERTO SALAS GONZALES', '', '', '12700015190650000', '1519065000', '', '', '', 'BBVA BANCOMER ', 'albertosalassv@gmail.com', '', 'ACTIVO'),
(320, 'MARTIN ALBERTO SALAS GONZALEZ', '', '', '12700015190650000', '1519065000', '', '', '', 'BBVA', '', '', 'ACTIVO'),
(321, 'MARTIN DELGADO JAZZO', 'FERRETERIA', 'DEJM670514LF3', '72930002414697000', '241469703', '', '', '', 'BANORTE', '', '4922442360', 'ACTIVO'),
(322, 'MARTIN OMAR ALONSO ESTRADA DELGADO', 'PLACAS', 'EADM-850820-TL1', '12100001863288000', '186328806', '', '', '', 'BANCOMER', '', '', 'ACTIVO'),
(323, 'MARTIN QUERO SANCHEZ', 'PATIO DE MÁQUINAS ', '', '72620012324205900', '', '', '', '4189143078327480', 'BANORTE', '', '', 'ACTIVO'),
(324, 'MAURO LAZARO SANCHEZ LOPEZ', 'GASTOS HOSPITALARIOS', '', '127100001502839000', '13970150283941', '', '', '', 'AZTECA', '', '', 'ACTIVO'),
(325, 'MAYORISTAS LA FORTUNA, SA DE CV', '', 'MFO-930819-UY1', '12700001029609300', '102960931', '', '', '', 'BANCOMER', 'FACTURACION@MASPORPIEZA.MX', '', 'ACTIVO'),
(326, 'MELANIA MARTINEZ PATRICIO', '', 'MAPM-591231-GU0', '12180015131006200', '1513100623', '', '', '', 'BANCOMER', '', '', 'ACTIVO'),
(327, 'MERCADO LIBRE', '', '', '646010349379910000', '', '', '', '', 'STP', '', '', 'ACTIVO'),
(328, 'MEREDIT ZAIRAH CANO CARMONA', 'REFACCIONES PARA SERVICIO VEHICULO ', 'CACM8302088J6', '72700010988417700', '1098841779', '', '', '', 'BANORTE', '', '', 'ACTIVO'),
(329, 'MERIT ZAIRAH CANO CARMONA', '', '', '72700010988417700', '1098841779', '', '', '', 'BANORTE', '', '', 'ACTIVO'),
(330, 'MEXICANA DE RIEGOS SA DE CV', 'MANGUERA PARA BOMBA', 'MR1980727DY6', '12700004539822000', '453982203', '', '', '', 'BANCOMER', '', '', 'ACTIVO'),
(331, 'MICHELLE RENEE DIAZLEAL VALDEZ', 'DESMONTE', '', '', '', '', '', '4043130014593380', 'SCOTIABANK', '', '', 'ACTIVO'),
(332, 'MIGUEL AGUILAR SANCHEZ', 'CAJA VELOCIDADES PIPA', 'AUSM570929JU3', '2130410000157310', '15731', '4100', '', '', 'BANAMEX', '', '9611176370', 'ACTIVO'),
(333, 'MIGUEL AGUILAR SANCHEZ', '', 'AUSM-570929-JU3', '2130410000157310', '15731', '4100', '', '', 'BANAMEX', '', '', 'ACTIVO'),
(334, 'MIGUEL ANGEL DE JESUS MOLANO TOALA', '', '', '44100256050665300', '25605066538', '7011', '', '', 'SCOTIABANK', 'serviciomolano@hotmail.com', '', 'ACTIVO'),
(335, 'MOISES ESTRADA ROJO', '', 'EARM830224683', '12290004798974100', '479897410', '', '', '', 'BBVA', 'moises@estradarojo.com', '', 'ACTIVO'),
(336, 'MONICA ALEJANDRA MENDEZ ANGELES', '', '', '12180015621006500', '1562100654', '', '', '', 'BBVA', '', '', 'ACTIVO');
INSERT INTO `provedores` (`proveedor_id`, `proveedor_nombre`, `presiones_type`, `proveedor_rfc`, `proveedor_clabe`, `proveedor_numeroCuenta`, `proveedor_sucursal`, `proveedor_refBanco`, `presiones_tarjetaBanco`, `proveedor_banco`, `proveedor_email`, `proveedor_telefono`, `proveedor_estatus`) VALUES
(337, 'MOYVA DISTRIBUIDORA DE TUBERIAS Y MATERIALES DEL ISTMO S.A DE C.V', '', '', '72617003162226200', '316222628', '', '', '', 'BANORTE', 'cgblanca@hotmail.com', '', 'ACTIVO'),
(338, 'MUNICIPIO DE AHUALULCO SLP', '', 'MAS850101335', '12700001176202000', '117620209', '', '', '', 'BBVA', '', '', 'ACTIVO'),
(339, 'NAYELI ALEJANDRA CARDENAS HERNANDEZ', '', 'CAHN840806329', '12540015033189400', '1503318944', '', '', '', 'BBVA', '', '', 'ACTIVO'),
(340, 'NEUMATICOS MUEVETIERRA SA DE CV', '', 'NMU930618', '12180004461637400', '446163742', '54', '', '', 'BBVA', 'neumaticosmuevetierratuxtla@hotmail.com', '', 'ACTIVO'),
(341, 'NORBERTO TELESFORO SAAVEDRA ZAVALA', 'BATERIAS ', 'SAZN 620105 L13', '36700500040487700', '50004048771', '', '', '', 'INBURSA', 'acumuladoresdelcentro48@gmail.com', '', 'ACTIVO'),
(342, 'NORMA ANGELICA GUTIERREZ MARIN', 'MAQUINARIA ', 'GUMN850504LG4', '014930566542775079', '56654277507', '', '', '', 'SANTANDER', '', '', 'ACTIVO'),
(343, 'OBRAS Y EQUIPOS PESADOS INCO, S.A. DE C.V.', '', 'OEP200930TN1', '44610256009419100', '25600941911', 'MITLA', '', '', 'SCOTIABANK', '', '', 'ACTIVO'),
(344, 'OGILVE MARTINEZ', 'COMIDAS ', '', '', '', '', '', '5129122000821640', 'ONE CARD', '', '', 'ACTIVO'),
(345, 'OMAR ALEJANDRO TORREZ SOLIS', '', 'FCM080718LP5', '2100701646764530', '', '', '', '', 'BANAMEX', '', '', 'ACTIVO'),
(346, 'OMNIUS ASOCIADOS AMBIENTALES, S.A. DE C.V.', 'MATERIAL DE IMPACTO AMBIENTAL', '', '44790088067356600', '8806735665', '', '', '', 'SCOTIABANK', 'omnius2010@hotmail.com', '', 'ACTIVO'),
(347, 'OPERADORA DE COMBUSTIBLE SAN LUIS SA DE CV', '', '', '12100001554665700', '', '', '', '', '', '', '', 'ACTIVO'),
(348, 'OPERADORA DE COMBUSTIBLES SAN LUIS, S.A. DE C.V.', '', 'OCS050303JL3', '12100001554665700', '155466571', '', '', '', 'BANCOMER', '', '', 'ACTIVO'),
(349, 'ORVELIN NURICUMBO PEREZ', 'RENTA BAÑOS PORTÁTILES ', 'NUPO6102221W7', '12617014118797500', '1411879758', '', '', '', 'BBVA', '', '', 'ACTIVO'),
(350, 'OSCAR ANTONIO URCIEL VILLANUEVA', 'VIGILANCIA', '', '0727000011814467952', '1181446795', '', '', '', 'BANORTE', '', '', 'ACTIVO'),
(351, 'OSCAR IVAN ALBORES PALOMEC', 'ARENA', 'AOPO860212P42', '44620086004234800', '', '', '', '', 'SCOTIABANK', 'construramaalbores@hotmail.com', '', 'ACTIVO'),
(352, 'OSCAR NEFTALI FERNANDEZ MARTINEZ', '', 'FEMO0910521JU4', '072700002407982002', '0240798200', '', '', '', 'BANORTE', 'facturacion@topycon.com.mx', '4441131805', 'ACTIVO'),
(353, 'PAPEL PARA PLOTTER SA DE CV', '', 'PPL2007272JA', '30700900024706400', '307290810201', '', '', '', 'BANBAJÍO', '', '', 'ACTIVO'),
(354, 'PATRICIA DEL CARMEN ZARATE JIMENEZ', '', 'ZAJP880204AT9', '2617039853972190', '5397219', '398', '', '', 'BANAMEX', '', '', 'ACTIVO'),
(355, 'PAULINA ABRIL MORALES HERNANDEZ', '', '', '127133013095232000', '31441309523209', '', '', '', 'BANCO AZTECA', '', '', 'ACTIVO'),
(356, 'PAULINA NEGRETE CEBAMANOS', 'FILTROS NEUMÁTICO ', 'NECP801008JC5', '12700004801551300', '480155136', '', '', '', 'BBVA BANCOMER', 'ventasdumanece@hotmail.com', '', 'ACTIVO'),
(357, 'PAULINA NEGRETE CEBAMANOS', 'FILTROS ', 'NECP801008JC5', '12700004801551300', '480155136', '', '', '', 'BANCOMER ', '', '', 'ACTIVO'),
(358, 'PAVISEÑALES SA DE CV', 'SEÑALAMIENTO Y PINTURA ', 'PAV050630CJ9', '36700500568302900', '50056830296', '7007', '', '', 'INBURSA', '', '', 'ACTIVO'),
(359, 'PEDRO ALVAREZ CASALE', '', '', '58580236772200100', '23677220015', '', '', '', 'BANREGIO', '', '', 'ACTIVO'),
(360, 'PEDRO IVAN MORALES JONAPA', '', 'MOJP-810629-1U5', '44100256047723200', '25604772328', '', '', '', 'SCOTIABANK', '', '', 'ACTIVO'),
(361, 'PETROGAS CORPORATION', 'EQUIPO MENOR ', 'PCO140710BM2', '72580002693231300', '269323135', '', '', '', 'BANORTE', 'elizabeth.araujo@petrogas.com.mx', '', 'ACTIVO'),
(362, 'PETROGAS CORPORATION S.A. DE C.V.', 'BOMBA MARIMBA ', 'PCO140710BM2', '72580002693231300', '269323135', '', '', '', 'BANORTE', '', '', 'ACTIVO'),
(363, 'PETROGAS CORPORATION, S.A DE C.V', '', 'PCO140710BM2', '72580002693231300', '269323135', '', '', '', 'BANORTE', 'elizabeth.araujo@petrogas.com.mx', '', 'ACTIVO'),
(364, 'PETROLIZADORA Y PLANTAS DE MEZCLA EN FRIO JABRI, S.A. DE C.V.', 'PETROLIZADORA', 'PPM020615DR3', '2180052865810740', '6581074', '528', '', '', 'BANAMEX', 'www.jabri.com.mx', '', 'ACTIVO'),
(365, 'PINTURAS Y DERIVADOS DEL ITSMO, S.A. DE C.V.', '', 'PDI-880115-Q94', '12610004497390200', '449739025', '5692', '', '', 'BBVA', 'comexistmoju@prodigy.net.mx', '', 'ACTIVO'),
(366, 'PLASTICO PABLIN S.A. DE C.V.', '', 'PPA9203102H3', '14100655006216200', '65500621629', '193', '', '', 'SANTANDER ', '', '', 'ACTIVO'),
(367, 'PLASTICOS Y BLANCOS LA FERIA SA DE CV', '', 'PBL080108PQ6', '72700006746389900', '674638992', '', '', '', 'BANORTE', 'plasticosyblancos_laferia@hotmail.com', '', 'ACTIVO'),
(368, 'PROTECTION SYSTEM OVERALL COMPANY S.A DE C.V', 'RENTA VEHICULOS', 'PS0210129DS3', '12180001188416900', '118841691', '', '', '', 'BBVA', '', '', 'ACTIVO'),
(369, 'PROTECTION SYSTEM OVERALL COMPANY SA DE CV', '', 'PSO210129DS3', '12180001188416900', '118841691', '', '', '', 'BBVA', '', '', 'ACTIVO'),
(370, 'PROYECTO ELECTRICOS Y DE PAILERIA CYG S.A. DE C.V.', 'ESTRUCTURA TOTEM ', 'PEY 120130R62\r\n', '72700003244518900', '324451898', '284', '', '', 'BANORTE', '', '', 'ACTIVO'),
(371, 'PSA PROYECTOS ELECTRICOS Y DE AUTOMATIZACION', '', 'PPE061204VA1', '2855081551930780', '5193078', '815', '', '', 'BANAMEX', '', '', 'ACTIVO'),
(372, 'R. SAMANO Y CIA', 'EQ MENOR Y FERRETERIA ', 'RSA9410056W3', '72700002350016100', '235001616', '', '', '', ' BANORTE', 'mostradorrsamano@gmail.com', '4444238238', 'ACTIVO'),
(373, 'R. SAMANO Y CIA FERRETERIA', 'FERRETERIA', 'RSA9410056W3', '72700002350016100', '235001616', '', '', '', 'BANORTE', 'mostradorrsamano@gmail.com', '', 'ACTIVO'),
(374, 'RAMON LOPEZ CRUZ', '', '', '4169161441441910', '', '', '', '4169161441441911', 'BANCOOPEL', '', '9681202315', 'ACTIVO'),
(375, 'RAUL SILVA GONZALEZ', 'ACARREOS', 'SIGR811001GV2', '2700700216107530', '1610753', '7002', '', '', 'BANAMEX', '', '', 'ACTIVO'),
(376, 'RECICLADOS ECOLOGICOS Y ALTERNOS MASU S.A. DE C.V.', 'COMBUSTIBLE ', '', '30215900010986100', '18862086', '', '', '', 'BANBAJIO', '', '', 'ACTIVO'),
(377, 'RECUBRIMIENTO EN GENERAL AB, S.A DE C.V', '', 'REG070123GV4', '72626008106710800', '810671087', '', '', '', 'BBVA', 'recubro@yahoo.com.mx', '', 'ACTIVO'),
(378, 'REFACCIONARIA TERE (TERESA GOMEZ MATIAS)', '', 'GOMT690924UC2', '2620047476937790', '7693779', '474', '', '', 'BANAMEX', '', '', 'ACTIVO'),
(379, 'RENE DIAZLEAL HERNANDEZ', 'PIPA', 'DIHR830507UU5', '12540026381744500', '2638174458', '', '', '', 'BBVA', '', '', 'ACTIVO'),
(380, 'RENE DIAZLEAL HERNÁNDEZ', '', 'DIHR830507UU5', '12540026381744500', '2638174458', '', '', '', 'BBVA', '', '', 'ACTIVO'),
(381, 'RENE JESSE GONZALEZ LOPEZ', 'ACARREO TERRAPLÉN ', 'GOLR020221IPA', '2620701877258260', '7725826', '7018', '', '', 'CITIBANAMEX', '', '', 'ACTIVO'),
(382, 'RENE MATA ESPINOZA', '', 'MAER720227425', '72700006453588400', '645358843', '', '', '', 'BANORTE', '', '', 'ACTIVO'),
(383, 'RICARDO HERNANDEZ DIAZ', 'BIOMÉTRICO ', '', '14320606201337400', '60620133746', '', '', '5579070128403070', 'SANTANDER', '', '', 'ACTIVO'),
(384, 'RICARDO LINARES TORRES', 'CAJA CHICA', 'LITR740406818', '127100013991402000', '81831399140263', '', '', '', 'BANCO AZTECA', '', '', 'ACTIVO'),
(385, 'RICARDO LINARES TORRES', 'MEDICAMENTOS', '', '127100013991402000', '', '', '', '4027665766365740', 'AZTECA', '', '', 'ACTIVO'),
(386, 'RICARDO LOPEZ MERCADO', '', 'LOMR640410LE8', '12320004655202500', '465520258', '', '', '', 'BBVA BANCOMER', 'facturas@transdiesel.com.mx', '', 'ACTIVO'),
(387, 'Rigoberto Martínez Ortiz', '', '', '127610013049686000', '', '', '', '4027665859105400', 'Banco azteca', '', '', 'ACTIVO'),
(388, 'ROBERTO ANTONIO BAUTISTA MONTALVO', '', '', '12051015284553100', '1528455312', '', '', '', 'BBVA', '', '', 'ACTIVO'),
(389, 'ROBERTO BAUTISTA', '', '', '12051015284553100', '1528455312', '', '', '', 'BBVA', '', '', 'ACTIVO'),
(390, 'ROBERTO RAMIREZ GUZMAN', '', 'RAGR430630163', '14617655063899800', '', '', '', '', 'SANTANDER', 'Gasolineraramirez_13149@gmail.com', '9721153285', 'ACTIVO'),
(391, 'ROCIO LIZBETH MORENO MILAN', 'REFACCIONARIA', 'MOMR830611TF6', '30700900009722700', '17716788', '', '', '', 'BANCO BANJIO', '', '', 'ACTIVO'),
(392, 'ROGELIO SALINAS', 'MADERA', 'SAFR-680216-IK4', '14700655070568300', '65507056831', '', '', '', 'SANTANDER', '', '', 'ACTIVO'),
(393, 'ROGELIO SALINAS FONSECA', '', 'SAFR680216IK4', '14700655070568300', '65507056831', '', '', '', 'SANTANDER', '', '', 'ACTIVO'),
(394, 'ROGELIO SALINAS FONSECA', '', '', '14700655070568300', '65507056831', '', '', '', 'SANTANDER', '', '', 'ACTIVO'),
(395, 'ROGER MORENO RUIZ', 'REPARACIÓN Y REFACCIONES', 'MORR9505146U4', '14100605608210900', '60560821096', '', '', '', 'SANTANDER', '', '', 'ACTIVO'),
(396, 'ROGER OCTAVIO TETUMO SANCHEZ', '', '', '', '', '', '', '4189143012746360', '', '', '', 'ACTIVO'),
(397, 'ROSA DEL CONSUELO ZAVALETA RUIZ', '', 'ZARR671109DZ6', '12100001315273500', '131527355', '', '', '', 'BVA BANCOMER', '', '', 'ACTIVO'),
(398, 'ROSA ISELA BALTAZAR ALEMAN', 'CANASTILLA', 'BAAR861018FK0', '12425004554094700', '455409470', '', '', '', 'BANCOMER', '', '', 'ACTIVO'),
(399, 'RUBEN IRVIN NAVA MENDOZA', 'CHALECO ', 'NAMR880226MV1', '72453010668519200', '1066851928', '', '', '', 'BANORTE', 'FACTURACION@RINAVY.COM.MX', '', 'ACTIVO'),
(400, 'RUBEN IRVING NAVA MENDOZA', '', 'NAMR880226MV1', '72453010668519200', '1066851928', '', '', '', 'BANORTE', 'facturacion@rinavy.com.mx', '', 'ACTIVO'),
(401, 'RUBEN SANCHEZ OVIEDO', 'RENTA CAMPAMENTO ', '', '2700701186995970', '8699597', '', '', '', 'CITY BANAMEX', '', '', 'ACTIVO'),
(402, 'SALES PARTS CASTILLO', '', 'SPC090326P8A', '', '', '', '', '', '', '', '', 'ACTIVO'),
(403, 'SANITARIOS SAN LUIS, S. DE R.L. DE CV', 'RENTA DE BAÑOS ', 'SSL 160105 514', '030700900007063083', '0153097270201', '', '', '', 'BANBAJIO ', '', '', 'ACTIVO'),
(404, 'SANTIAGO ISAI RUIZ MEGCHUN', 'MANO DE OBRA', '', '', '', '', '', '4169161100246150', 'COPPEL', '', '', 'ACTIVO'),
(405, 'SANY EQUIPMENT AND TECHNOLOGY', '', '', '21180040661669500', '4066166950', '', '', '', 'HSBC', '', '', 'ACTIVO'),
(406, 'SECRETARIA DE FINANZAS', '', '', '121914002005821000', '', '', '', '', 'BBVA', '', '', 'ACTIVO'),
(407, 'SEPSA FABRICACIÓN S.A. DE C.V.', 'FABRICACION Y SUMINISTRO DE TRABES PIVS', 'SFA191105HI3', '12540001143213700', '114321375', '817', '', '', 'BBVA', '', '', 'ACTIVO'),
(408, 'SERVICIOS Y COMBUSTIBLES SAN PEDRO, SA DE CV', 'COMBUSTIBLE ', 'AMA2306126R3', '072700000850278831', '85027883', '', '', '', 'BANORTE', '', '4445810532', 'ACTIVO'),
(409, 'SEYER INGENIERIA Y CONSTRUCCIONES S.A DE C.V.', '', 'SIC220304GV4', '72617012184783800', '1218478384', '3530', '', '', 'BANORTE', '', '', 'ACTIVO'),
(410, 'SG PETROGAS, S.A. DE C.V.', '', 'SPE060317DQ5', '12100001515821900', '151582194', '', '', '', 'BANCOMER', '', '', 'ACTIVO'),
(411, 'SOLUCIONES CONSTRUCTIVAS HC3 S.A DE C.V', 'BANDA OJILLADA (SLP) ', '', '072580005412106692', '0541210669', '', '', '', 'BANORTE', '', '', 'ACTIVO'),
(412, 'Soluciones Integrales para Trituración, SAPI de CV\r\n', '', '', '12320001585286100', '158528616', '', '', '', 'BBVA Bancomer', '', '', 'ACTIVO'),
(413, 'SUPER ESTACION MEXQUITIC SA DE CV', 'GASOLINA-EQUIPO MENOR ', 'SEM080423M82', '72700011782110700', '1178211078', '284', '', '', 'BANORTE', 'lucero.espinoza@gasomaxgp.com.mx', '4441781668', 'ACTIVO'),
(414, 'SUSANA ROCIO RODRIGUEZ VILLELA', 'EQH MENOR Y FERRETERIA ', '', '30700900005254500', '', '', '', '4210030034816290', 'BANBAJIO ', '', '', 'ACTIVO'),
(415, 'TABICEL, S.A. DE C.V.', '', 'TAB831019722', '72700000850227900', '85022792', '', '', '', 'BANORTE', 'erivera@gruporivend.com', '', 'ACTIVO'),
(416, 'TABSCOOB EQUIPOS DE SEGURIDAD INDUSTRIAL Y SOLDADURA, SA DE CV', '', 'TES090508AI0', '', '', '', '', '', '', 'tabscoob_tuxtla@hotmail.com', '9616148543', 'ACTIVO'),
(417, 'TALLERES GUEMES, SA DE CV', '', '', '12700004528199200', '', '', '', '452819929', 'BANCOMER', 'ventas@talleresguemes.com.mx', '', 'ACTIVO'),
(418, 'TECNICAS INDUSTRIALES CON VARILLA', 'ACERO', 'TIV2208162C7', '12180001197172200', '119717226', '', '', '', 'BBVA', '', '', 'ACTIVO'),
(419, 'TECNITUBOS DE CONCRETO, S.A. DE C.V.', 'CONCRETO PREFABRICADO', 'TCO850409      ', '012650001356366123', '0135636612', '', '', '', 'BBVA BANCOMER', '', '', 'ACTIVO'),
(420, 'TECNOLOGÍA EN ENERGÍA SA DE CV', '', 'TEN- 980911- TK', '12700004506435200', '450643521', '', '', '', 'BBVA', '', '', 'ACTIVO'),
(421, 'TERESA DE JESÚS BELTRÁN PACHUCA', '', 'BEPT891015UU4', '12700004746780700', '474678079', '', '', '', 'BANCOMER', '', '', 'ACTIVO'),
(422, 'TERESA DE JESÚS BELTRÁN PACHUCA', 'LLANTAS', 'BEPT 891015 UU4', '12700004746780700', '474678079', '', '', '', 'BANCOMER ', 'llantas.cameron@gmail.com', '', 'ACTIVO'),
(423, 'TERESA DE JESUS ESPONDA GONZALEZ (ESPOSA DE TETUMO)', '', '', '127620013013999000', '42391301399916', '', '', '', 'AZTECA', '', '', 'ACTIVO'),
(424, 'TERESA GOMEZ MATIAS', '', 'GOMT690924UC2', '2620047476937790', '7693779', '474', '', '', 'BANAMEX', 'tgmatias09@hotmail.com', '', 'ACTIVO'),
(425, 'TERESA GUADALUPE SARAOZ SANCHEZ', 'MAQUINARIA ', 'SAST951013P97', '12100004780391100', '478039119', '', '', '', 'BBVA', '', '', 'ACTIVO'),
(426, 'TERESA LOPEZ GARCIA', 'DERECHO DE VÍA ', '', '', '', '', '', '5204165910834790', 'CITIBANAMEX', '', '', 'ACTIVO'),
(427, 'TERRACERIA Y PAVIMENTOS DONAJI S.A. DE C.V.', 'DEFENSA METÁLICA Y AMORTIGUADORES ', '', '2632700876532830', '70087653283', '4411', '', '', 'BANAMEX', '', '', 'ACTIVO'),
(428, 'TERRACERIAS Y PAVIMENTOS DONAJI SA DE CV', 'PINTURAS Y SEÑALETICAS', 'TPD1211137N7', '2632700876532830', '70087653283', '4411', '', '', 'BANAMEX', '', '', 'ACTIVO'),
(429, 'TERRACRAFT CONSTRUCTORES\r\n SA DE CV', 'MAQUINARIA ', 'TCO240510SSA', '12225001234659100', '123465918', '', '', '', 'BBVA BANCOMER', '', '', 'ACTIVO'),
(430, 'TERRAPAVIMENTOS SA DE CV', '', 'TER060927PP6', '44610092030695900', '9203069591', '', '', '', 'SCOTIABANK', '', '', 'ACTIVO'),
(431, 'TONY TIENDAS S.A. DE CV.', 'PAPELERIA', 'TT  96 12 02  M', '14849515006032200', '', '', '', '', 'SANTANDER', '', '', 'ACTIVO'),
(432, 'TONY TIENDAS SA DE CV', 'PAPELERIA', 'TTI961202IM1', '14849515006032200', '', '', '', '', 'SANTANDER', '', '', 'ACTIVO'),
(433, 'TRACSA', 'MAQUINARIA ', 'TRA800423S25', '2320068300002060', '45463', '', '', '', 'BANAMEX', '', '', 'ACTIVO'),
(434, 'TRACSA CAT', 'ACEITES', '', '2320068300002060', '', '683', '', '', 'BANAMEX', '', '', 'ACTIVO'),
(435, 'TRACSA S.A.P.I DE C.V.', 'MAQUINARIA', '', '12320004484483500', '448448353', '005', '', '', 'BANCOMER', '', '', 'ACTIVO'),
(436, 'TRACTO REFACCIONARIA S.A. DE C.V.', '', 'TGR211209H87', '12854001191002200', '119100229', '', '', '', 'BANCOMER', '', '9721017340', 'ACTIVO'),
(437, 'TRACTO REFACCIONARIA SA DE CV', '', 'TGR211209H87 ', '', '119100229', '', '', '', 'BBVA', '', '', 'ACTIVO'),
(438, 'TRAFIPLASTIC S.A DE C.V', 'TRAFITAMBOS', 'TRA180131448', '12180001116776300', '111677632', '', '', '', 'BANCOMER', '', '', 'ACTIVO'),
(439, 'TRITURADORA SOCONUSCO SA DE CV', 'MAQUINARIA ', 'TSO041005N45', '72133005285693300', '528569331', '', '', '', 'BANORTE', '', '', 'ACTIVO'),
(440, 'Tubos y productos de concretos industriales de Mexico S.A. de C.V. (TUBOCRETO)', '', 'TPC140220UC3', '012540001960073255', '0196007325', '', '', '', 'BBVA BANCOMER', 'cobranza@tubocreto.com', '5544492261', 'ACTIVO'),
(441, 'URBANIZACIONES MONDRAGON SA DE CV', '', 'UMO091029N52', '72426008986626800', '898662681', '898662681', '', '', 'BANORTE', 'urbanizacionesmondragon@hotmail.com', '', 'ACTIVO'),
(442, 'VALENTIN HERNANDEZ MORALES', 'VIAJES DE BANCO', '', '127700013681359000', '56501368135958', '', '', '', 'BANCO AZTECA', '', '', 'ACTIVO'),
(443, 'VALVULAS Y CONEXIONES INDUSTRIALES, S.A DE C.V', '', 'VCI871105KP2', '72700000850137600', '85013769', '', '', '', 'BANORTE', '', '', 'ACTIVO'),
(444, 'VANESA ZAMORA ORTIZ', 'FERRETERÍA ', '', '646180216900173000', '', '', '', '', 'STP', '', '', 'ACTIVO'),
(445, 'VERONICA CRUZ NIURULU', '', 'CUNV810923QH3', '137100104714469000', '10470446918', '', '', '', 'BANCOPPEL', '', '', 'ACTIVO'),
(446, 'VERONICA GONZALEZ ACEVEDO', 'CAMPAMENTO', '', '', '', '', '', '5062990506959640', 'ONE CARD', '', '', 'ACTIVO'),
(447, 'VICTOR HUGO CABRERA VALDIVIESO', '', '', '', '', '', '', '5062990505316270', 'ONECARD', '', '', 'ACTIVO'),
(448, 'WERCLAIN GOMEZ DE LA CRUZ', 'REFACCIONES', 'GOCW860319AW9', '2100700000000000', '70075474812', '', '', '', 'BANAMEX', 'general.filtros@gmail.com', '9611031080', 'ACTIVO'),
(449, 'WERCLAIN GOMEZ DE LA CRUZ', 'REFACCIONES PARA MAQUINARIA', 'GOCW860319AW9', '2100700754748120', '70075474812', '', '', '', 'BANAMEX', 'general.filtros@gmail.com', '9611031080', 'ACTIVO'),
(450, 'WILFREDO ARGUETA MEJIA', '', '', '12051015284689900', '1528468995', '', '', '', 'BBVA', '', '', 'ACTIVO'),
(451, 'WILFREDO ARGUETA MEJIA', '', '', '12051015284689900', '', '', '', '', 'BBVA', '', '1528468995', 'ACTIVO'),
(452, 'YATBALAM CONSTRUCTORA', '', '', '', '', '', '', '', '', '', '', 'ACTIVO'),
(453, 'ZEYDI LIZZETTE VALVERDE NEPOMUCENO', '', 'VANZ870219UQ8', '12133004772798300', '477279833', '', '', '', 'BBVA', '', '', 'ACTIVO');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `requisiciones`
--

CREATE TABLE `requisiciones` (
  `requisicion_id` int(11) NOT NULL,
  `requisicion_Clave` varchar(5) NOT NULL,
  `requisicion_Numero` varchar(100) NOT NULL,
  `requisicion_Nombre` varchar(50) NOT NULL,
  `requisicion_Obra` int(11) NOT NULL,
  `requisicion_fechaSolicitud` date NOT NULL,
  `requisicion_Folio` int(11) NOT NULL,
  `requisicion_Hojas` int(11) NOT NULL,
  `requisicion_total` decimal(16,6) NOT NULL,
  `requisicion_estatus` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `requisiciones`
--

INSERT INTO `requisiciones` (`requisicion_id`, `requisicion_Clave`, `requisicion_Numero`, `requisicion_Nombre`, `requisicion_Obra`, `requisicion_fechaSolicitud`, `requisicion_Folio`, `requisicion_Hojas`, `requisicion_total`, `requisicion_estatus`) VALUES
(542, 'MAT', 'SLP-VILLA DE RAMOS-MAT-000', 'Prueba de edicion', 1, '2024-11-05', 0, 3, 0.000000, 'ABIERTO'),
(543, 'EQH', 'SLP-CACTUS-EQH-000', 'Nombre Req Cactus', 2, '2024-11-05', 0, 20, 0.000000, 'ABIERTO'),
(544, 'EQH', 'SLP-CACTUS-EQH-011', 'Nombre Cactus prueba 2 ', 2, '2024-11-07', 1, 6, 0.000000, 'ABIERTO'),
(545, 'MAT', 'SLP-AHUALULCO-MAT-000', 'COMBUSTIBLE', 3, '2024-11-16', 0, 2, 0.000000, 'ABIERTO'),
(546, 'MAT', 'SLP-AHUALULCO-MAT-001', 'ACERO', 3, '2024-11-15', 1, 2, 0.000000, 'ABIERTO'),
(548, 'IND', 'SLP-VILLA DE RAMOS-IND-035', 'Prueba Manual Editada', 1, '2024-11-21', 35, 26, 0.000000, 'ABIERTO'),
(549, 'MO', 'SLP-VILLA DE RAMOS-MO-017', 'Prueba de Requisiciones ', 1, '2024-11-22', 17, 2, 0.000000, 'ABIERTO'),
(550, 'MAT', 'SLP-VILLA DE RAMOS-MAT-015', 'Prueba de Requisiciones ', 1, '2024-11-22', 15, 4, 0.000000, 'ABIERTO'),
(551, 'EQH', 'SLP-VILLA DE RAMOS-EQH-003', 'Prueba de Requisiciones Editada ', 1, '2024-11-22', 15, 5, 0.000000, 'ABIERTO'),
(552, 'EQH', 'SLP-VILLA DE RAMOS-EQH-002', 'Prueba de Requisiciones ', 1, '2024-11-22', 2, 4, 0.000000, 'ABIERTO'),
(553, 'MAT', 'SLP-CACTUS-MAT-013', 'Concreto F50', 2, '2024-12-06', 13, 4, 0.000000, 'ABIERTO'),
(554, 'IND', 'OXC-LINEA K-IND-003', 'Concreto F50', 5, '2024-12-10', 3, 7, 0.000000, 'ABIERTO'),
(556, 'MO', 'SLP-CACTUS-MO-015', 'Concreto F5012', 2, '2024-12-18', 15, 2, 0.000000, 'ABIERTO'),
(557, 'IND', 'SLP-CACTUS-IND-015', 'Prueba de Data Table', 2, '2024-12-18', 15, 24, 0.000000, 'ABIERTO'),
(558, 'EQH', 'SLP-CACTUS-EQH-002', 'Segunda Prueba DataTable', 2, '2024-12-18', 2, 4, 0.000000, 'ABIERTO'),
(559, 'MO', 'SLP-CACTUS-MO-003', 'Tercera Prueba DataTable', 2, '2024-12-18', 3, 4, 0.000000, 'ABIERTO'),
(560, 'MO', 'SLP-CACTUS-MO-003', 'Cuarta Prueba DataTable', 2, '2024-12-19', 3, 2, 0.000000, 'ABIERTO'),
(561, 'MO', 'SLP-CACTUS-MO-003', 'Quinta Prueba DataTable', 2, '2024-12-18', 3, 2, 0.000000, 'ABIERTO'),
(562, 'IND', 'SLP-CACTUS-IND-003', 'Prueba de Data Table', 2, '2024-12-18', 3, 7, 0.000000, 'ABIERTO'),
(563, 'MAT', 'SLP-TAMPAMOLON-MAT-003', 'Concreto F5012', 10, '2024-12-18', 3, 0, 0.000000, 'ABIERTO'),
(564, 'IND', 'SLP-OFICINAS CHAPULTEPEC-IND-013', 'Caja chica Oficina', 6, '2024-12-19', 13, 3, 0.000000, 'ABIERTO'),
(565, 'IND', 'SLP-OFICINAS CHAPULTEPEC-IND-000', 'Renta de Oficina', 6, '2024-12-19', 0, 0, 0.000000, 'ABIERTO'),
(566, 'IND', 'SLP-OFICINAS CHAPULTEPEC-IND-000', 'Pago de consumibles', 6, '2024-12-19', 0, 1, 0.000000, 'ABIERTO'),
(567, 'IND', 'SLP-OFICINAS CHAPULTEPEC-IND-000', 'Servicio de Instalacion', 6, '2024-12-19', 0, 1, 0.000000, 'ABIERTO'),
(568, 'IND', 'SLP-OFICINAS CHAPULTEPEC-IND-000', 'Servicio de Limpieza', 6, '2024-12-19', 0, 0, 0.000000, 'ABIERTO'),
(569, 'MAT', 'SLP-UNIVERSIDAD (UASLP)-MAT-013', 'Concreto F5012', 8, '2024-12-19', 13, 3, 0.000000, 'ABIERTO'),
(570, 'IND', 'SLP-VILLA DE RAMOS 2T-IND-000', 'Concreto F50', 11, '2025-05-16', 0, 1, 0.000000, 'ABIERTO'),
(571, 'IND', 'CHI-OFICINAS TUXTLA GUTIERREZ-IND-015', 'Concreto F50', 7, '2025-08-15', 15, 1, 0.000000, 'ABIERTO'),
(572, 'MAT', 'CHI-OFICINAS TUXTLA GUTIERREZ-MAT-000', 'Concreto F50', 7, '2025-08-15', 0, 1, 0.000000, 'ABIERTO');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `requisicionesligadas`
--

CREATE TABLE `requisicionesligadas` (
  `requisicionesLigada_id` int(11) NOT NULL,
  `requisicionesLigada_presionID` int(11) NOT NULL,
  `requisicionesLigadas_requisicionID` int(11) NOT NULL,
  `requisicionesLigadas_hojaID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `requisicionesligadas`
--

INSERT INTO `requisicionesligadas` (`requisicionesLigada_id`, `requisicionesLigada_presionID`, `requisicionesLigadas_requisicionID`, `requisicionesLigadas_hojaID`) VALUES
(1, 2, 542, 626),
(2, 2, 542, 994),
(3, 3, 543, 181),
(4, 3, 543, 448),
(5, 3, 543, 551),
(6, 4, 546, 335),
(7, 4, 545, 574),
(9, 5, 544, 373533),
(10, 5, 544, 659114),
(11, 5, 543, 962234),
(12, 5, 543, 454612),
(13, 5, 543, 671919),
(14, 9, 543, 179),
(15, 9, 543, 863),
(16, 6, 552, 617),
(17, 6, 548, 257),
(18, 6, 542, 621),
(19, 10, 553, 922694),
(20, 10, 553, 922694),
(21, 11, 543, 181),
(22, 11, 543, 869725),
(23, 11, 543, 516794),
(24, 12, 543, 181),
(25, 12, 543, 516794),
(26, 12, 543, 962234),
(27, 12, 543, 275863),
(28, 13, 543, 516794),
(29, 13, 543, 275863),
(30, 13, 543, 962234),
(31, 13, 543, 671919),
(32, 14, 543, 516794),
(33, 14, 543, 962234),
(34, 15, 544, 969496),
(35, 15, 543, 962234),
(36, 16, 544, 969496),
(37, 17, 554, 742118),
(40, 19, 543, 125957),
(41, 19, 543, 162485),
(42, 19, 543, 423388),
(45, 7, 546, 426687),
(46, 19, 562, 595573),
(47, 19, 562, 627631),
(48, 24, 570, 668566),
(49, 20, 551, 875676),
(50, 20, 542, 621),
(51, 19, 543, 724249),
(52, 19, 543, 718637),
(53, 19, 557, 878249),
(54, 25, 564, 689142),
(55, 21, 554, 843632),
(56, 21, 554, 886839),
(57, 21, 554, 861999),
(59, 21, 554, 311939),
(60, 26, 571, 612364),
(61, 26, 572, 271447);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `users`
--

CREATE TABLE `users` (
  `user_id` int(11) NOT NULL COMMENT 'id de los usuario resgistrado en la aplicacion para el uso de la misma ',
  `user_nameUser` varchar(50) NOT NULL COMMENT 'Nombre de usuario dentro de la aplicacion. no confundir con nombre el nombre real del usuario. esto es mas bien un "Alias"',
  `user_password` varchar(100) NOT NULL COMMENT 'es la contraseña del usuario como seguridad para que acceda a la aplicacion ',
  `user_name` varchar(100) NOT NULL COMMENT 'el nombre real del usuario de la aplicacion',
  `user_directionAcess` tinyint(1) NOT NULL,
  `user_editReq` tinyint(1) NOT NULL,
  `user_createPresion` tinyint(1) NOT NULL,
  `user_linkedPresion` tinyint(1) NOT NULL,
  `user_payPresion` tinyint(1) NOT NULL,
  `user_closePresion` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `users`
--

INSERT INTO `users` (`user_id`, `user_nameUser`, `user_password`, `user_name`, `user_directionAcess`, `user_editReq`, `user_createPresion`, `user_linkedPresion`, `user_payPresion`, `user_closePresion`) VALUES
(1, 'IrvinDev', 'Admin123', 'Irvin Alexis Rodriguez Estrada', 1, 1, 1, 1, 1, 1),
(8, 'Tere.Esponda', 'TheFuentes2024', 'Teresa de Jesús Esponda González', 0, 1, 1, 0, 0, 0),
(9, 'Cindy.Espinoza', 'TheFuentes2024', 'Cindy Rubi Espinoza Victorio', 0, 1, 1, 0, 0, 0),
(10, 'Susana.Ramirez', 'TheFuentes2024', 'Susana Rubi Ramirez Perez', 0, 1, 1, 0, 0, 0),
(11, 'wamejia', 'TheFuentes2024', 'Wilfredo Argueta Mejia', 0, 1, 1, 1, 0, 0),
(12, 'Dulce.Vazquez', 'TheFuentes2024', 'Dulce Belén Vázquez Hernández', 1, 1, 1, 1, 1, 1),
(13, 'Luisa.Roque', 'TheFuentes2024', 'Luisa Alheli Roque Ocaña', 0, 1, 1, 0, 0, 0),
(14, 'Ingrid del Rosario Carrillo Cruz', 'TheFuentes2024', 'ingrid.carrillo', 0, 1, 1, 0, 0, 0);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `bancos`
--
ALTER TABLE `bancos`
  ADD PRIMARY KEY (`banco_id`);

--
-- Indices de la tabla `emisores`
--
ALTER TABLE `emisores`
  ADD PRIMARY KEY (`emisor_id`),
  ADD UNIQUE KEY `emisor_rfc` (`emisor_rfc`);

--
-- Indices de la tabla `estadosobra`
--
ALTER TABLE `estadosobra`
  ADD PRIMARY KEY (`ciudadesObras_id`);

--
-- Indices de la tabla `hojasrequisicion`
--
ALTER TABLE `hojasrequisicion`
  ADD PRIMARY KEY (`hojaRequisicion_id`),
  ADD KEY `hojaRequisicion_idReq` (`hojaRequisicion_idReq`),
  ADD KEY `hojaRequisicion_empresa` (`hojaRequisicion_empresa`,`hojaRequisicion_proveedor`),
  ADD KEY `hojaRequisicion_proveedor` (`hojaRequisicion_proveedor`);

--
-- Indices de la tabla `itemrequisicion`
--
ALTER TABLE `itemrequisicion`
  ADD PRIMARY KEY (`itemRequisicion_id`),
  ADD KEY `itemRequisicion_idHoja` (`itemRequisicion_idHoja`);

--
-- Indices de la tabla `logs`
--
ALTER TABLE `logs`
  ADD PRIMARY KEY (`log_id`);

--
-- Indices de la tabla `obras`
--
ALTER TABLE `obras`
  ADD PRIMARY KEY (`obras_id`),
  ADD KEY `obras_cuidad` (`obras_cuidad`);

--
-- Indices de la tabla `presiones`
--
ALTER TABLE `presiones`
  ADD PRIMARY KEY (`presiones_id`),
  ADD KEY `presiones_obra` (`presiones_obra`);

--
-- Indices de la tabla `provedores`
--
ALTER TABLE `provedores`
  ADD PRIMARY KEY (`proveedor_id`);

--
-- Indices de la tabla `requisiciones`
--
ALTER TABLE `requisiciones`
  ADD PRIMARY KEY (`requisicion_id`),
  ADD KEY `requisicion_Obra` (`requisicion_Obra`);

--
-- Indices de la tabla `requisicionesligadas`
--
ALTER TABLE `requisicionesligadas`
  ADD PRIMARY KEY (`requisicionesLigada_id`),
  ADD KEY `requisicionesLigada_presionID` (`requisicionesLigada_presionID`),
  ADD KEY `requisicionesLigadas_requisicionID` (`requisicionesLigadas_requisicionID`),
  ADD KEY `requisicionesLigadas_IdHoja` (`requisicionesLigadas_hojaID`);

--
-- Indices de la tabla `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`),
  ADD UNIQUE KEY `user_nameUser` (`user_nameUser`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `bancos`
--
ALTER TABLE `bancos`
  MODIFY `banco_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=87;

--
-- AUTO_INCREMENT de la tabla `emisores`
--
ALTER TABLE `emisores`
  MODIFY `emisor_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `estadosobra`
--
ALTER TABLE `estadosobra`
  MODIFY `ciudadesObras_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `hojasrequisicion`
--
ALTER TABLE `hojasrequisicion`
  MODIFY `hojaRequisicion_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=969497;

--
-- AUTO_INCREMENT de la tabla `itemrequisicion`
--
ALTER TABLE `itemrequisicion`
  MODIFY `itemRequisicion_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=92;

--
-- AUTO_INCREMENT de la tabla `logs`
--
ALTER TABLE `logs`
  MODIFY `log_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `obras`
--
ALTER TABLE `obras`
  MODIFY `obras_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT de la tabla `presiones`
--
ALTER TABLE `presiones`
  MODIFY `presiones_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT de la tabla `provedores`
--
ALTER TABLE `provedores`
  MODIFY `proveedor_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=454;

--
-- AUTO_INCREMENT de la tabla `requisiciones`
--
ALTER TABLE `requisiciones`
  MODIFY `requisicion_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=573;

--
-- AUTO_INCREMENT de la tabla `requisicionesligadas`
--
ALTER TABLE `requisicionesligadas`
  MODIFY `requisicionesLigada_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=62;

--
-- AUTO_INCREMENT de la tabla `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id de los usuario resgistrado en la aplicacion para el uso de la misma ', AUTO_INCREMENT=15;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `hojasrequisicion`
--
ALTER TABLE `hojasrequisicion`
  ADD CONSTRAINT `hojasrequisicion_ibfk_1` FOREIGN KEY (`hojaRequisicion_idReq`) REFERENCES `requisiciones` (`requisicion_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `hojasrequisicion_ibfk_2` FOREIGN KEY (`hojaRequisicion_empresa`) REFERENCES `emisores` (`emisor_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `hojasrequisicion_ibfk_3` FOREIGN KEY (`hojaRequisicion_proveedor`) REFERENCES `provedores` (`proveedor_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `itemrequisicion`
--
ALTER TABLE `itemrequisicion`
  ADD CONSTRAINT `itemrequisicion_ibfk_1` FOREIGN KEY (`itemRequisicion_idHoja`) REFERENCES `hojasrequisicion` (`hojaRequisicion_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `obras`
--
ALTER TABLE `obras`
  ADD CONSTRAINT `obras_ibfk_1` FOREIGN KEY (`obras_cuidad`) REFERENCES `estadosobra` (`ciudadesObras_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `presiones`
--
ALTER TABLE `presiones`
  ADD CONSTRAINT `presiones_ibfk_1` FOREIGN KEY (`presiones_obra`) REFERENCES `obras` (`obras_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `requisiciones`
--
ALTER TABLE `requisiciones`
  ADD CONSTRAINT `requisiciones_ibfk_1` FOREIGN KEY (`requisicion_Obra`) REFERENCES `obras` (`obras_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `requisicionesligadas`
--
ALTER TABLE `requisicionesligadas`
  ADD CONSTRAINT `requisicionesligadas_ibfk_1` FOREIGN KEY (`requisicionesLigada_presionID`) REFERENCES `presiones` (`presiones_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `requisicionesligadas_ibfk_2` FOREIGN KEY (`requisicionesLigadas_requisicionID`) REFERENCES `requisiciones` (`requisicion_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `requisicionesligadas_ibfk_3` FOREIGN KEY (`requisicionesLigadas_hojaID`) REFERENCES `hojasrequisicion` (`hojaRequisicion_id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
