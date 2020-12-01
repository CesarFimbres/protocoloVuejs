-- phpMyAdmin SQL Dump
-- version 4.9.2
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1:3306
-- Tiempo de generación: 01-12-2020 a las 19:51:53
-- Versión del servidor: 10.4.10-MariaDB
-- Versión de PHP: 7.3.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
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
  `etapa` text DEFAULT NULL,
  `responsable` text DEFAULT NULL,
  `solucion` text DEFAULT NULL,
  `comentario` text DEFAULT NULL,
  `fecha` datetime DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=17 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `comentarios`
--

INSERT INTO `comentarios` (`id`, `idtablero`, `etapa`, `responsable`, `solucion`, `comentario`, `fecha`) VALUES
(8, 70, 'hipot', 'César Fimbres', 'Revisar si esta prueba incluye los valores de Neutros.', 'El tablero no esta registrando los valores de Neutros.', '2020-11-22 20:13:40'),
(11, 70, 'torques', 'Anna', 'El huevo es pesado de noche, se le sugiere un poco de cereal con leche caliente.', 'Esta por cenar, ella pide se le prepare huevo.', '2020-11-22 22:35:33'),
(10, 70, 'seguridad', 'Anna', 'Comentar que su hermano es pequeño y ella tiene que cuidar de el.', 'La niña juega brusco con su hermano.', '2020-11-22 22:15:41'),
(12, 70, 'continuidad', 'Anna', 'Se le da masaje para promover la circulación, se le pide que tenga más cuidado en lo sucesivo. ', 'Se lastimo la pierna al sentarse.', '2020-11-22 22:58:46'),
(13, 68, 'hipot', 'César Fimbres', 'solución ', 'Primer comentario', '2020-11-26 10:50:11'),
(14, 70, 'seguridad', 'César Fimbres', 'Solución', 'Comentarios', '2020-11-26 10:52:35'),
(15, 70, 'inspeccion', 'César Fimbres', 'revisar el tablero y reparar averías', 'inspeccion', '2020-12-01 13:48:31'),
(16, 70, 'inspeccion', 'César Fimbres', 'solucion inspeccion', 'comentarios inspeccio', '2020-12-01 13:51:16');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `continuidad`
--

DROP TABLE IF EXISTS `continuidad`;
CREATE TABLE IF NOT EXISTS `continuidad` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fecha` timestamp NOT NULL DEFAULT current_timestamp(),
  `valor` text DEFAULT NULL,
  `tag` text DEFAULT NULL,
  `idtablero` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `continuidad`
--

INSERT INTO `continuidad` (`id`, `fecha`, `valor`, `tag`, `idtablero`) VALUES
(1, '2020-12-01 18:58:24', 'INCOMPLETO', 'validationCustom07', 70),
(2, '2020-12-01 18:59:30', 'NO APLICA', 'continuidad', 70);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `equipo`
--

DROP TABLE IF EXISTS `equipo`;
CREATE TABLE IF NOT EXISTS `equipo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `equipo` text DEFAULT NULL,
  `marca` text DEFAULT NULL,
  `modelo` text DEFAULT NULL,
  `nserie` text DEFAULT NULL,
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
  `seccion` text DEFAULT NULL,
  `f1ohm` float DEFAULT NULL,
  `f1volt` float DEFAULT NULL,
  `f2ohm` float DEFAULT NULL,
  `f2volt` float DEFAULT NULL,
  `f3ohm` float DEFAULT NULL,
  `f3volt` float DEFAULT NULL,
  `fecha` timestamp NULL DEFAULT current_timestamp(),
  `status` text DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=25 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `hipot`
--

INSERT INTO `hipot` (`id`, `idtablero`, `seccion`, `f1ohm`, `f1volt`, `f2ohm`, `f2volt`, `f3ohm`, `f3volt`, `fecha`, `status`) VALUES
(20, 70, '1CN', 1, 5, 2, 6, 3, 7, '2020-11-23 02:12:26', 'statusHipot'),
(21, 70, '1CR', 9, 13, 10, 14, 11, 15, '2020-11-23 02:12:26', 'statusHipot'),
(22, 70, '1CP', 17, 21, 18, 22, 19, 23, '2020-11-23 02:12:26', 'statusHipot'),
(23, 70, 'S1', 10.11, 11.11, 10.12, 11.12, 10.13, 11.13, '2020-12-01 18:20:20', 'statusHipot'),
(24, 70, 'S2', 20.11, 21.11, 20.13, 21.12, 20.13, 21.13, '2020-12-01 18:20:20', 'statusHipot');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `inspeccion`
--

DROP TABLE IF EXISTS `inspeccion`;
CREATE TABLE IF NOT EXISTS `inspeccion` (
  `id` int(12) NOT NULL AUTO_INCREMENT,
  `fecha` timestamp NULL DEFAULT current_timestamp(),
  `valor` text DEFAULT NULL,
  `tag` text DEFAULT NULL,
  `idtablero` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=701 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `inspeccion`
--

INSERT INTO `inspeccion` (`id`, `fecha`, `valor`, `tag`, `idtablero`) VALUES
(657, '2020-12-01 17:34:01', 'true', 'Check1', 70),
(658, '2020-12-01 17:34:01', 'true', 'Check2', 70),
(659, '2020-12-01 17:34:01', 'true', 'Check8', 70),
(660, '2020-12-01 17:34:01', 'true', 'Check9', 70),
(661, '2020-12-01 17:34:01', 'true', 'Check10', 70),
(662, '2020-12-01 17:34:01', 'true', 'Check11', 70),
(663, '2020-12-01 17:34:01', 'true', 'Check12', 70),
(664, '2020-12-01 17:34:01', 'true', 'Check13', 70),
(665, '2020-12-01 17:34:01', 'true', 'Check17', 70),
(666, '2020-12-01 17:34:01', 'true', 'Check18', 70),
(667, '2020-12-01 17:34:01', 'true', 'Check19', 70),
(668, '2020-12-01 17:34:01', 'true', 'Check20', 70),
(669, '2020-12-01 17:34:01', 'true', 'Check21', 70),
(670, '2020-12-01 17:34:01', 'false', 'Check22', 70),
(671, '2020-12-01 17:34:01', 'true', 'Check23', 70),
(672, '2020-12-01 17:34:01', 'true', 'Check24', 70),
(673, '2020-12-01 17:34:01', 'true', 'Check25', 70),
(674, '2020-12-01 17:34:01', 'true', 'Check26', 70),
(675, '2020-12-01 17:34:01', 'true', 'Check27', 70),
(676, '2020-12-01 17:34:01', 'true', 'Check28', 70),
(677, '2020-12-01 17:34:01', 'true', 'Check29', 70),
(678, '2020-12-01 17:34:01', 'true', 'Check30', 70),
(679, '2020-12-01 17:34:01', 'true', 'Check31', 70),
(680, '2020-12-01 17:34:01', 'true', 'Check32', 70),
(681, '2020-12-01 17:34:01', 'true', 'Check33', 70),
(682, '2020-12-01 17:34:01', 'true', 'Check34', 70),
(683, '2020-12-01 17:34:01', 'true', 'Check35', 70),
(684, '2020-12-01 17:34:01', 'true', 'Check36', 70),
(685, '2020-12-01 17:34:01', 'true', 'Check37', 70),
(686, '2020-12-01 17:34:01', 'true', 'Check38', 70),
(687, '2020-12-01 17:34:01', 'true', 'Check39', 70),
(688, '2020-12-01 17:34:01', 'true', 'Check40', 70),
(689, '2020-12-01 17:34:01', 'true', 'Check41', 70),
(690, '2020-12-01 17:34:01', 'true', 'Check42', 70),
(691, '2020-12-01 17:34:01', 'true', 'Check43', 70),
(692, '2020-12-01 17:34:01', 'true', 'Check44', 70),
(693, '2020-12-01 17:34:01', 'true', 'Check45', 70),
(694, '2020-12-01 17:34:01', 'true', 'Check46', 70),
(695, '2020-12-01 17:34:01', 'true', 'Check47', 70),
(696, '2020-12-01 17:34:01', 'César Fimbres', 'tst0', 70),
(697, '2020-12-01 17:34:01', 'tablero ok', 'tst1', 70),
(698, '2020-12-01 17:34:01', 'Barras', 'sel1', 70),
(699, '2020-12-01 17:34:01', 'Analizador de red ANR', 'preg6', 70),
(700, '2020-12-01 17:34:01', 'Ninguna', 'preg14', 70);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `reportes`
--

DROP TABLE IF EXISTS `reportes`;
CREATE TABLE IF NOT EXISTS `reportes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `idtablero` int(11) DEFAULT NULL,
  `responsable` text DEFAULT NULL,
  `solucion` text DEFAULT NULL,
  `descripcion` text DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `resistencia`
--

DROP TABLE IF EXISTS `resistencia`;
CREATE TABLE IF NOT EXISTS `resistencia` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `idtablero` int(11) DEFAULT NULL,
  `seccion` text DEFAULT NULL,
  `n` float DEFAULT NULL,
  `f1` float DEFAULT NULL,
  `f2` float DEFAULT NULL,
  `f3` float DEFAULT NULL,
  `comentarios` text DEFAULT NULL,
  `fecha` timestamp NULL DEFAULT current_timestamp(),
  `status` text DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `resistencia`
--

INSERT INTO `resistencia` (`id`, `idtablero`, `seccion`, `n`, `f1`, `f2`, `f3`, `comentarios`, `fecha`, `status`) VALUES
(5, 57, 'sección 1', 1, 2, 3, 4, 'comentarios', '2020-11-07 20:09:21', 'statusAislamiento'),
(6, 57, 'sección 2', 5, 6, 7, 8, 'comentarios', '2020-11-07 20:09:21', 'statusAislamiento'),
(7, 57, 'sección 3', 9, 10, 11, 12, 'comentarios', '2020-11-07 20:09:21', 'statusAislamiento'),
(8, 70, 'seccion 1', 1, 2, 3, 4, NULL, '2020-11-20 03:22:52', 'statusAislamiento'),
(9, 70, 'seccion 2', 5, 6, 7, 8, NULL, '2020-11-20 03:22:52', 'statusAislamiento'),
(10, 70, 'seccion 3', 9, 10, 11, 12, NULL, '2020-11-20 03:22:52', 'statusAislamiento'),
(11, 70, 'S1', 1, 2, 3, 4, NULL, '2020-12-01 18:17:49', 'statusAislamiento'),
(12, 70, 'S2', 11.1, 11.2, 11.3, 11.4, NULL, '2020-12-01 18:17:49', 'statusAislamiento');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `seguridad`
--

DROP TABLE IF EXISTS `seguridad`;
CREATE TABLE IF NOT EXISTS `seguridad` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fecha` timestamp NOT NULL DEFAULT current_timestamp(),
  `valor` text DEFAULT NULL,
  `tag` text DEFAULT NULL,
  `idtablero` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `seguridad`
--

INSERT INTO `seguridad` (`id`, `fecha`, `valor`, `tag`, `idtablero`) VALUES
(1, '2020-12-01 17:15:49', 'Si', 'seguridad', 13),
(2, '2020-12-01 17:16:33', 'Si', 'seguridad', 13),
(3, '2020-12-01 17:22:39', 'true', 'seguridad', 70),
(4, '2020-12-01 17:23:05', 'true', 'seguridad', 70),
(5, '2020-12-01 17:23:35', 'true', 'seguridad', 70),
(6, '2020-12-01 17:24:07', 'true', 'seguridad', 70);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tablero`
--

DROP TABLE IF EXISTS `tablero`;
CREATE TABLE IF NOT EXISTS `tablero` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` text DEFAULT NULL,
  `cliente` text DEFAULT NULL,
  `proyecto` text DEFAULT NULL,
  `sistema` text DEFAULT NULL,
  `voltaje` text DEFAULT NULL,
  `unifilar` text DEFAULT NULL,
  `layout` text DEFAULT NULL,
  `material` text DEFAULT NULL,
  `metrel` text DEFAULT NULL,
  `comentario` text DEFAULT NULL,
  `fecha` timestamp NULL DEFAULT current_timestamp(),
  `idequipo` int(11) DEFAULT NULL,
  `idinspeccion` int(11) DEFAULT NULL,
  `idcontinuidad` int(11) DEFAULT NULL,
  `idresistencia` int(11) DEFAULT NULL,
  `idhipot` int(11) DEFAULT NULL,
  `idreportes` int(11) DEFAULT NULL,
  `sttablero` text DEFAULT NULL,
  `stinspeccion` text DEFAULT NULL,
  `stcontinuidad` text DEFAULT NULL,
  `stresistencia` text DEFAULT NULL,
  `sthipot` text DEFAULT NULL,
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

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `torques`
--

DROP TABLE IF EXISTS `torques`;
CREATE TABLE IF NOT EXISTS `torques` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fecha` timestamp NOT NULL DEFAULT current_timestamp(),
  `valor` text DEFAULT NULL,
  `tag` text DEFAULT NULL,
  `idtablero` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `torques`
--

INSERT INTO `torques` (`id`, `fecha`, `valor`, `tag`, `idtablero`) VALUES
(1, '2020-12-01 17:44:50', 'true', 'Check1', 70);
--
-- Base de datos: `test`
--
CREATE DATABASE IF NOT EXISTS `test` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `test`;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
