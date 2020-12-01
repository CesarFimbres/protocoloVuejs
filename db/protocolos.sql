-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1:3306
-- Tiempo de generación: 26-11-2020 a las 01:24:50
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
CREATE DATABASE IF NOT EXISTS `protocolos` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `protocolos`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `comentarios`
--

DROP TABLE IF EXISTS `comentarios`;
CREATE TABLE IF NOT EXISTS `comentarios` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `idtablero` int(11) DEFAULT NULL,
  `etapa` text,
  `responsable` text,
  `solucion` text,
  `comentario` text,
  `fecha` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `comentarios`
--

INSERT INTO `comentarios` (`id`, `idtablero`, `etapa`, `responsable`, `solucion`, `comentario`, `fecha`) VALUES
(8, 70, 'hipot', 'César Fimbres', 'Revisar si esta prueba incluye los valores de Neutros.', 'El tablero no esta registrando los valores de Neutros.', '2020-11-22 20:13:40'),
(11, 70, 'torques', 'Anna', 'El huevo es pesado de noche, se le sugiere un poco de cereal con leche caliente.', 'Esta por cenar, ella pide se le prepare huevo.', '2020-11-22 22:35:33'),
(10, 70, 'seguridad', 'Anna', 'Comentar que su hermano es pequeño y ella tiene que cuidar de el.', 'La niña juega brusco con su hermano.', '2020-11-22 22:15:41'),
(12, 70, 'continuidad', 'Anna', 'Se le da masaje para promover la circulación, se le pide que tenga más cuidado en lo sucesivo. ', 'Se lastimo la pierna al sentarse.', '2020-11-22 22:58:46');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `continuidad`
--

DROP TABLE IF EXISTS `continuidad`;
CREATE TABLE IF NOT EXISTS `continuidad` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `idtablero` int(11) DEFAULT NULL,
  `seccion` text,
  `valor` float DEFAULT NULL,
  `fecha` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `vfase` float DEFAULT NULL,
  `nfases` float DEFAULT NULL,
  `status` text,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=latin1 COMMENT='RESULTADO DE LA PRUEBA DE CONTINUIDAD';

--
-- Volcado de datos para la tabla `continuidad`
--

INSERT INTO `continuidad` (`id`, `idtablero`, `seccion`, `valor`, `fecha`, `vfase`, `nfases`, `status`) VALUES
(1, 1, 'SECCIÓN 1 DE PRUEBA', 0.19, '2020-01-21 16:03:17', 480, 277, 'APROBADO');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `equipo`
--

DROP TABLE IF EXISTS `equipo`;
CREATE TABLE IF NOT EXISTS `equipo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `equipo` text,
  `marca` text,
  `modelo` text,
  `nserie` text,
  `fecha` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=latin1 COMMENT='EQUIPO UTILIZADO PARA HACER PRUEBAS';

--
-- Volcado de datos para la tabla `equipo`
--

INSERT INTO `equipo` (`id`, `equipo`, `marca`, `modelo`, `nserie`, `fecha`) VALUES
(1, 'MultiServicer XA', 'Metreol', 'MI3321', '16400917', '2019-04-05');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `hipot`
--

DROP TABLE IF EXISTS `hipot`;
CREATE TABLE IF NOT EXISTS `hipot` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `idtablero` int(11) DEFAULT NULL,
  `seccion` text,
  `f1ohm` float DEFAULT NULL,
  `f1volt` float DEFAULT NULL,
  `f2ohm` float DEFAULT NULL,
  `f2volt` float DEFAULT NULL,
  `f3ohm` float DEFAULT NULL,
  `f3volt` float DEFAULT NULL,
  `fecha` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `status` text,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=23 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `hipot`
--

INSERT INTO `hipot` (`id`, `idtablero`, `seccion`, `f1ohm`, `f1volt`, `f2ohm`, `f2volt`, `f3ohm`, `f3volt`, `fecha`, `status`) VALUES
(20, 70, '1CN', 1, 5, 2, 6, 3, 7, '2020-11-23 02:12:26', 'statusHipot'),
(21, 70, '1CR', 9, 13, 10, 14, 11, 15, '2020-11-23 02:12:26', 'statusHipot'),
(22, 70, '1CP', 17, 21, 18, 22, 19, 23, '2020-11-23 02:12:26', 'statusHipot');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `inspeccion`
--

DROP TABLE IF EXISTS `inspeccion`;
CREATE TABLE IF NOT EXISTS `inspeccion` (
  `id` int(12) NOT NULL AUTO_INCREMENT,
  `equipo` text,
  `valor` text,
  `tag` text,
  `idtablero` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=656 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `inspeccion`
--

INSERT INTO `inspeccion` (`id`, `equipo`, `valor`, `tag`, `idtablero`) VALUES
(612, NULL, 'false', 'Check1', 57),
(613, NULL, 'false', 'Check2', 57),
(614, NULL, 'false', 'Check8', 57),
(615, NULL, 'false', 'Check9', 57),
(616, NULL, 'false', 'Check10', 57),
(617, NULL, 'false', 'Check11', 57),
(618, NULL, 'false', 'Check12', 57),
(619, NULL, 'false', 'Check13', 57),
(620, NULL, 'false', 'Check17', 57),
(621, NULL, 'false', 'Check18', 57),
(622, NULL, 'false', 'Check19', 57),
(623, NULL, 'false', 'Check20', 57),
(624, NULL, 'false', 'Check21', 57),
(625, NULL, 'false', 'Check22', 57),
(626, NULL, 'false', 'Check23', 57),
(627, NULL, 'false', 'Check24', 57),
(628, NULL, 'false', 'Check25', 57),
(629, NULL, 'false', 'Check26', 57),
(630, NULL, 'false', 'Check27', 57),
(631, NULL, 'false', 'Check28', 57),
(632, NULL, 'false', 'Check29', 57),
(633, NULL, 'false', 'Check30', 57),
(634, NULL, 'false', 'Check31', 57),
(635, NULL, 'false', 'Check32', 57),
(636, NULL, 'false', 'Check33', 57),
(637, NULL, 'false', 'Check34', 57),
(638, NULL, 'false', 'Check35', 57),
(639, NULL, 'false', 'Check36', 57),
(640, NULL, 'false', 'Check37', 57),
(641, NULL, 'false', 'Check38', 57),
(642, NULL, 'false', 'Check39', 57),
(643, NULL, 'false', 'Check40', 57),
(644, NULL, 'false', 'Check41', 57),
(645, NULL, 'false', 'Check42', 57),
(646, NULL, 'false', 'Check43', 57),
(647, NULL, 'false', 'Check44', 57),
(648, NULL, 'false', 'Check45', 57),
(649, NULL, 'false', 'Check46', 57),
(650, NULL, 'false', 'Check47', 57),
(651, NULL, 'César', 'tst0', 57),
(652, NULL, 'Selección de id tablero 56 - concentración 03', 'tst1', 57),
(653, NULL, 'Tipo de alimentacion...', 'sel1', 57),
(654, NULL, 'Modelo de analizador...', 'preg6', 57),
(655, NULL, 'Tipo de transferencia...', 'preg14', 57);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `resistencia`
--

DROP TABLE IF EXISTS `resistencia`;
CREATE TABLE IF NOT EXISTS `resistencia` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `idtablero` int(11) DEFAULT NULL,
  `seccion` text,
  `n` float DEFAULT NULL,
  `f1` float DEFAULT NULL,
  `f2` float DEFAULT NULL,
  `f3` float DEFAULT NULL,
  `comentarios` text,
  `fecha` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `status` text,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `resistencia`
--

INSERT INTO `resistencia` (`id`, `idtablero`, `seccion`, `n`, `f1`, `f2`, `f3`, `comentarios`, `fecha`, `status`) VALUES
(5, 57, 'sección 1', 1, 2, 3, 4, 'comentarios', '2020-11-07 20:09:21', 'statusAislamiento'),
(6, 57, 'sección 2', 5, 6, 7, 8, 'comentarios', '2020-11-07 20:09:21', 'statusAislamiento'),
(7, 57, 'sección 3', 9, 10, 11, 12, 'comentarios', '2020-11-07 20:09:21', 'statusAislamiento'),
(8, 70, 'seccion 1', 1, 2, 3, 4, NULL, '2020-11-20 03:22:52', 'statusAislamiento'),
(9, 70, 'seccion 2', 5, 6, 7, 8, NULL, '2020-11-20 03:22:52', 'statusAislamiento'),
(10, 70, 'seccion 3', 9, 10, 11, 12, NULL, '2020-11-20 03:22:52', 'statusAislamiento');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tablero`
--

DROP TABLE IF EXISTS `tablero`;
CREATE TABLE IF NOT EXISTS `tablero` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` text,
  `cliente` text,
  `proyecto` text,
  `sistema` text,
  `voltaje` text,
  `unifilar` text,
  `layout` text,
  `material` text,
  `metrel` text,
  `comentario` text,
  `fecha` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `idequipo` int(11) DEFAULT NULL,
  `idinspeccion` int(11) DEFAULT NULL,
  `idcontinuidad` int(11) DEFAULT NULL,
  `idresistencia` int(11) DEFAULT NULL,
  `idhipot` int(11) DEFAULT NULL,
  `idreportes` int(11) DEFAULT NULL,
  `sttablero` text,
  `stinspeccion` text,
  `stcontinuidad` text,
  `stresistencia` text,
  `sthipot` text,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=71 DEFAULT CHARSET=latin1 COMMENT='DATOS ESCENCIALES DE TABLERO';

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
(63, 'CONCENTRACIÓN 10', 'LIVERPOOL', 'SANTA ANITA', '3F 4H 60Hz.', '480/220', 'DU - ELÉCTRICO', 'LAYOUT 01', 'MULTIMETRO', 'METREL 2550', 'TABLEO PRESENTA SUCIEDAD AL FUI¿¿', '2000-02-01 06:00:00', NULL, NULL, NULL, NULL, NULL, NULL, 'NO ESPECIFICADO', 'NO ESPECIFICADO', 'NO ESPECIFICADO', 'NO ESPECIFICADO', 'NO ESPECIFICADO'),
(64, 'CONCENTRACIÓN 00 ', 'LIVERPOOL', 'SANTA ANITA', '3F 4H + TIERRA AISLADA 60Hz.', '120', 'DU - ELÉCTRICO', 'LAYOUT 01', 'MULTIMETRO', 'METREL 2550', 'TABLEO PRESENTA SUCIEDAD, FALTA ASPIRADO Y LIMPIEZA DE PUERTAS PARA REMOVER MARCAS DE CORTE A LÁPIZ Y PLUMA', '2020-02-24 06:00:00', NULL, NULL, NULL, NULL, NULL, NULL, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO'),
(65, 'CONCENTRACIÓN A0', 'LIVERPOOL', 'SANTA ANITA CENTRO COMERCIAL', '3F 3H 60Hz.', '120', 'DU - ELÉCTRICO', 'LAYOUT 01', 'MULTIMETRO', 'METREL 2550', 'Comentarios de prueba a tablero 65', '2020-01-15 06:00:00', NULL, NULL, NULL, NULL, NULL, NULL, 'NO APROBADO', 'NO APROBADO', 'NO APROBADO', 'NO APROBADO', 'NO APROBADO'),
(66, 'CONCENTRACIÓN A1', 'LIVERPOOL', 'SANTA ANITA', '3F 4H + TIERRA AISLADA 60Hz.', '480-277 / 220-127', 'DU - ELÉCTRICO', 'LAYOUT 01', 'MULTIMETRO', 'METREL 2550', 'Faltan etiquetas de control y limpieza en tablero', '2020-02-28 06:00:00', NULL, NULL, NULL, NULL, NULL, NULL, 'INCOMPLETO', 'INCOMPLETO', 'INCOMPLETO', 'INCOMPLETO', 'INCOMPLETO'),
(67, 'CONCENTRACIÓN A0', 'LIVERPOOL', 'SANTA ANITA CENTRO COMERCIAL', '3F 3H 60Hz.', '480/220', 'DU - ELÉCTRICO', 'LAYOUT 01', 'MULTIMETRO', 'METREL 2550', 'Comentarios de prueba a tablero 65', '2020-11-01 06:00:00', NULL, NULL, NULL, NULL, NULL, NULL, 'EN PROCESO', 'EN PROCESO', 'EN PROCESO', 'EN PROCESO', 'EN PROCESO'),
(70, 'MAQUINAS DE CORTE', 'CESAR FIMBRES', 'CONCENTRACIÓN CFC', '3F 4H 60Hz.', '480-277 / 220-127', 'DU - ELÉCTRICO', 'LAYOUT 01', 'MULTIMETRO', 'METREL 2550', 'TABLERO ESPECIAL PARA EL USO DE MAQUINAS DE CORTE', '2020-11-07 06:00:00', NULL, NULL, NULL, NULL, NULL, NULL, 'NO ESPECIFICADO', 'NO ESPECIFICADO', 'NO ESPECIFICADO', 'NO ESPECIFICADO', 'NO ESPECIFICADO');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
