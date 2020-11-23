-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1:3306
-- Tiempo de generación: 24-10-2020 a las 17:15:46
-- Versión del servidor: 5.7.31
-- Versión de PHP: 7.3.21

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `protocolos`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `continuidad`
--

DROP DATABASE IF EXISTS `protocolos`;
CREATE DATABASE `protocolos`;
USE `protocolos`;

DROP TABLE IF EXISTS `continuidad`;
CREATE TABLE IF NOT EXISTS `continuidad` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `idtablero` int(11) NULL,
  `seccion` text NULL,
  `valor` float NULL,
  `comentarios` text NULL,
  `fecha` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `vfase` float NULL,
  `nfases` float NULL,
  `status` text NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=latin1  COMMENT='RESULTADO DE LA PRUEBA DE CONTINUIDAD';

--
-- Volcado de datos para la tabla `continuidad`
--

INSERT INTO `continuidad` (`id`, `idtablero`, `seccion`, `valor`, `comentarios`, `fecha`, `vfase`, `nfases`, `status`) VALUES
(1, 1, 'SECCIÓN 1 DE PRUEBA', 0.19, 'COMENTARIOS DE PRUEBA', '2020-01-21 16:03:17', 480, 277, 'APROBADO');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `equipo`
--

DROP TABLE IF EXISTS `equipo`;
CREATE TABLE IF NOT EXISTS `equipo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `equipo` text NULL,
  `marca` text NULL,
  `modelo` text NULL,
  `nserie` text NULL,
  `comentarios` text NULL,
  `fecha` date,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=latin1  COMMENT='EQUIPO UTILIZADO PARA HACER PRUEBAS';

--
-- Volcado de datos para la tabla `equipo`
--

INSERT INTO `equipo` (`id`, `equipo`, `marca`, `modelo`, `nserie`, `comentarios`, `fecha`) VALUES
(1, 'MultiServicer XA', 'Metreol', 'MI3321', '16400917', '', '2019-04-05');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `hipot`
--

DROP TABLE IF EXISTS `hipot`;
CREATE TABLE IF NOT EXISTS `hipot` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `idtablero` int(11) NULL,
  `seccion` text NULL,
  `f1ohm` float NULL,
  `f1volt` float NULL,
  `f2ohm` float NULL,
  `f2volt` float NULL,
  `f3ohm` float NULL,
  `f3volt` float NULL,
  `comentarios` text NULL,
  `fecha` timestamp DEFAULT CURRENT_TIMESTAMP,
  `status` text NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `inspeccion`
--

DROP TABLE IF EXISTS `inspeccion`;
CREATE TABLE IF NOT EXISTS `inspeccion` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `equipo` text NULL,
  `valor` text NULL,
  `comentario` text NULL,
  `tag` text NULL,
  `idtablero` int(11) NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `reportes`
--

DROP TABLE IF EXISTS `reportes`;
CREATE TABLE IF NOT EXISTS `reportes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `idtablero` int(11) NULL,
  `responsable` text NULL,
  `solucion` text NULL,
  `descripcion` text NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `resistencia`
--

DROP TABLE IF EXISTS `resistencia`;
CREATE TABLE IF NOT EXISTS `resistencia` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `idtablero` int(11) NULL,
  `seccion` text NULL,
  `n` float NULL,
  `f1` float NULL,
  `f2` float NULL,
  `f3` float NULL,
  `comentarios` text NULL,
  `fecha` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `status` text NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tablero`
--

DROP TABLE IF EXISTS `tablero`;
CREATE TABLE IF NOT EXISTS `tablero` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` text NULL,
  `cliente` text NULL,
  `proyecto` text NULL,
  `sistema` text NULL,
  `voltaje` text NULL,
  `unifilar` text NULL,
  `layout` text NULL,
  `material` text NULL,
  `metrel` text NULL,
  `comentario` text NULL,
  `fecha` timestamp  DEFAULT CURRENT_TIMESTAMP,
  `idequipo` int(11) DEFAULT NULL,
  `idinspeccion` int(11) DEFAULT NULL,
  `idcontinuidad` int(11) DEFAULT NULL,
  `idresistencia` int(11) DEFAULT NULL,
  `idhipot` int(11) DEFAULT NULL,
  `idreportes` int(11) DEFAULT NULL,
  `sttablero` text NULL,
  `stinspeccion` text NULL,
  `stcontinuidad` text NULL,
  `stresistencia` text NULL,
  `sthipot` text NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=70 DEFAULT CHARSET=latin1  COMMENT='DATOS ESCENCIALES DE TABLERO';

--
-- Volcado de datos para la tabla `tablero`
--

INSERT INTO `tablero` (`id`, `nombre`, `cliente`, `proyecto`, `sistema`, `voltaje`, `unifilar`, `layout`, `material`, `metrel`, `comentario`, `fecha`, `idequipo`, `idinspeccion`, `idcontinuidad`, `idresistencia`, `idhipot`, `idreportes`, `sttablero`, `stinspeccion`, `stcontinuidad`, `stresistencia`, `sthipot`) VALUES
(54, 'CONCENTRACION 01', 'LIVERPOOL', 'SANTA ANITA', '3F 4H 60Hz.', '480/220', 'DU - ELÉCTRICO', 'LAYOUT 01', 'MULTIMETRO', 'METREL 2550', 'El paso clásico “Lorem ipsum dolor sit amet…” se atribuye a una remixación del texto de De Finibus Bonorum et Malorum (“En los extremos del bien y del mal”), del filósofo romano Cicerón, de 45 aC. Más específicamente, se piensa que el pasaje proviene de las secciones 1.10.32 - 33 de su texto, con la parte más notable extraída a continuación:\n\n“Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem.”', '2000-02-01 06:00:00', NULL, NULL, NULL, NULL, NULL, NULL, 'NO ESPECIFICADO', 'NO ESPECIFICADO', 'NO ESPECIFICADO', 'NO ESPECIFICADO', 'NO ESPECIFICADO'),
(55, 'CONCENTRACION 02', 'LIVERPOOL', 'SANTA ANITA', '3F 4H 60Hz.', '480/220', 'DU - ELÉCTRICO', 'LAYOUT 01', 'MULTIMETRO', 'METREL 2550', 'TABLEO PRESENTA SUCIEDAD AL FUI¿¿', '2000-02-01 06:00:00', NULL, NULL, NULL, NULL, NULL, NULL, 'NO ESPECIFICADO', 'NO ESPECIFICADO', 'NO ESPECIFICADO', 'NO ESPECIFICADO', 'NO ESPECIFICADO'),
(56, 'CONCENTRACION 03', 'LIVERPOOL', 'SANTA ANITA', '3F 4H 60Hz.', '480/220', 'DU - ELÉCTRICO', 'LAYOUT 01', 'MULTIMETRO', 'METREL 2550', 'TABLEO PRESENTA SUCIEDAD AL FUI¿¿', '2000-02-01 06:00:00', NULL, NULL, NULL, NULL, NULL, NULL, 'NO ESPECIFICADO', 'NO ESPECIFICADO', 'NO ESPECIFICADO', 'NO ESPECIFICADO', 'NO ESPECIFICADO'),
(57, 'CONCENTRACION 04', 'LIVERPOOL', 'SANTA ANITA', '3F 4H 60Hz.', '480/220', 'DU - ELÉCTRICO', 'LAYOUT 01', 'MULTIMETRO', 'METREL 2550', 'TABLEO PRESENTA SUCIEDAD AL FUI¿¿', '2000-02-01 06:00:00', NULL, NULL, NULL, NULL, NULL, NULL, 'NO ESPECIFICADO', 'NO ESPECIFICADO', 'NO ESPECIFICADO', 'NO ESPECIFICADO', 'NO ESPECIFICADO'),
(58, 'CONCENTRACION 05', 'LIVERPOOL', 'SANTA ANITA', '3F 4H 60Hz.', '480/220', 'DU - ELÉCTRICO', 'LAYOUT 01', 'MULTIMETRO', 'METREL 2550', 'TABLEO PRESENTA SUCIEDAD AL FUI¿¿', '2000-02-01 06:00:00', NULL, NULL, NULL, NULL, NULL, NULL, 'NO ESPECIFICADO', 'NO ESPECIFICADO', 'NO ESPECIFICADO', 'NO ESPECIFICADO', 'NO ESPECIFICADO'),
(59, 'CONCENTRACION 06', 'LIVERPOOL', 'SANTA ANITA', '3F 4H 60Hz.', '480/220', 'DU - ELÉCTRICO', 'LAYOUT 01', 'MULTIMETRO', 'METREL 2550', 'TABLEO PRESENTA SUCIEDAD AL FUI¿¿', '2000-02-01 06:00:00', NULL, NULL, NULL, NULL, NULL, NULL, 'NO ESPECIFICADO', 'NO ESPECIFICADO', 'NO ESPECIFICADO', 'NO ESPECIFICADO', 'NO ESPECIFICADO'),
(60, 'CONCENTRACION 07', 'LIVERPOOL', 'SANTA ANITA', '3F 4H 60Hz.', '480/220', 'DU - ELÉCTRICO', 'LAYOUT 01', 'MULTIMETRO', 'METREL 2550', 'TABLEO PRESENTA SUCIEDAD AL FUI¿¿', '2000-02-01 06:00:00', NULL, NULL, NULL, NULL, NULL, NULL, 'NO ESPECIFICADO', 'NO ESPECIFICADO', 'NO ESPECIFICADO', 'NO ESPECIFICADO', 'NO ESPECIFICADO'),
(61, 'CONCENTRACION 08', 'LIVERPOOL', 'SANTA ANITA', '3F 4H 60Hz.', '480/220', 'DU - ELÉCTRICO', 'LAYOUT 01', 'MULTIMETRO', 'METREL 2550', 'TABLEO PRESENTA SUCIEDAD AL FUI¿¿', '2000-02-01 06:00:00', NULL, NULL, NULL, NULL, NULL, NULL, 'NO ESPECIFICADO', 'NO ESPECIFICADO', 'NO ESPECIFICADO', 'NO ESPECIFICADO', 'NO ESPECIFICADO'),
(62, 'CONCENTRACION 09', 'LIVERPOOL', 'SANTA ANITA', '3F 4H 60Hz.', '480/220', 'DU - ELÉCTRICO', 'LAYOUT 01', 'MULTIMETRO', 'METREL 2550', 'TABLEO PRESENTA SUCIEDAD AL FUI¿¿', '2000-02-01 06:00:00', NULL, NULL, NULL, NULL, NULL, NULL, 'NO ESPECIFICADO', 'NO ESPECIFICADO', 'NO ESPECIFICADO', 'NO ESPECIFICADO', 'NO ESPECIFICADO'),
(63, 'CONCENTRACION 10', 'LIVERPOOL', 'SANTA ANITA', '3F 4H 60Hz.', '480/220', 'DU - ELÉCTRICO', 'LAYOUT 01', 'MULTIMETRO', 'METREL 2550', 'TABLEO PRESENTA SUCIEDAD AL FUI¿¿', '2000-02-01 06:00:00', NULL, NULL, NULL, NULL, NULL, NULL, 'NO ESPECIFICADO', 'NO ESPECIFICADO', 'NO ESPECIFICADO', 'NO ESPECIFICADO', 'NO ESPECIFICADO'),
(64, 'CONCENTRACION 00', 'LIVERPOOL', 'SANTA ANITA', '3F 4H + TIERRA AISLADA 60Hz.', '120', 'DU - ELÉCTRICO', 'LAYOUT 01', 'MULTIMETRO', 'METREL 2550', 'TABLEO PRESENTA SUCIEDAD, FALTA ASPIRADO Y LIMPIEZA DE PUERTAS PARA REMOVER MARCAS DE CORTE A LÁPIZ Y PLUMA', '2020-02-24 06:00:00', NULL, NULL, NULL, NULL, NULL, NULL, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO'),
(65, 'CONCENTRACIÓN A0', 'LIVERPOOL', 'SANTA ANITA CENTRO COMERCIAL', '3F 3H 60Hz.', '120', 'DU - ELÉCTRICO', 'LAYOUT 01', 'MULTIMETRO', 'METREL 2550', 'Comentarios de prueba a tablero 65', '2020-01-15 06:00:00', NULL, NULL, NULL, NULL, NULL, NULL, 'NO APROBADO', 'NO APROBADO', 'NO APROBADO', 'NO APROBADO', 'NO APROBADO'),
(66, 'CONCENTRACION A1', 'LIVERPOOL', 'SANTA ANITA', '3F 4H + TIERRA AISLADA 60Hz.', '480-277 / 220-127', 'DU - ELÉCTRICO', 'LAYOUT 01', 'MULTIMETRO', 'METREL 2550', 'Faltan etiquetas de control y limpieza en tablero', '2020-02-28 06:00:00', NULL, NULL, NULL, NULL, NULL, NULL, 'INCOMPLETO', 'INCOMPLETO', 'INCOMPLETO', 'INCOMPLETO', 'INCOMPLETO'),
(67, 'CONCENTRACIÓN A0', 'LIVERPOOL', 'SANTA ANITA CENTRO COMERCIAL', '3F 3H 60Hz.', '120', 'DU - ELÉCTRICO', 'LAYOUT 01', 'MULTIMETRO', 'METREL 2550', 'Comentarios de prueba a tablero 65', '2020-01-15 06:00:00', NULL, NULL, NULL, NULL, NULL, NULL, 'EN PROCESO', 'EN PROCESO', 'EN PROCESO', 'EN PROCESO', 'EN PROCESO'),
(68, 'CONCENTRACIÓN A0', 'LALO', 'PADILLA', '3F 3H 60Hz.', '120', 'DU - ELÉCTRICO', 'LAYOUT 01', 'MULTIMETRO', 'METREL 2550', 'Comentarios de prueba a tablero 65', '2020-01-15 06:00:00', NULL, NULL, NULL, NULL, NULL, NULL, 'NO ESPECIFICADO', 'INCOMPLETO', 'INCOMPLETO', 'INCOMPLETO', 'INCOMPLETO');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
