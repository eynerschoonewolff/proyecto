# ************************************************************
# Sequel Pro SQL dump
# Versión 4541
#
# http://www.sequelpro.com/
# https://github.com/sequelpro/sequelpro
#
# Host: 127.0.0.1 (MySQL 5.5.5-10.1.37-MariaDB)
# Base de datos: psicologia
# Tiempo de Generación: 2022-04-15 01:11:32 +0000
# ************************************************************


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


# Volcado de tabla acudiente
# ------------------------------------------------------------

DROP TABLE IF EXISTS `acudiente`;

CREATE TABLE `acudiente` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `nombres` varchar(100) NOT NULL DEFAULT '',
  `apellidos` varchar(11) NOT NULL DEFAULT '',
  `identificacion` bigint(11) NOT NULL,
  `email` varchar(100) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;



# Volcado de tabla curso
# ------------------------------------------------------------

DROP TABLE IF EXISTS `curso`;

CREATE TABLE `curso` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `nombre` varchar(11) NOT NULL DEFAULT '',
  `grado` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

LOCK TABLES `curso` WRITE;
/*!40000 ALTER TABLE `curso` DISABLE KEYS */;

INSERT INTO `curso` (`id`, `nombre`, `grado`)
VALUES
	(1,'matematicas',3),
	(2,'biologia',2),
	(3,'tecnologia',1);

/*!40000 ALTER TABLE `curso` ENABLE KEYS */;
UNLOCK TABLES;


# Volcado de tabla curso_actual
# ------------------------------------------------------------

DROP TABLE IF EXISTS `curso_actual`;

CREATE TABLE `curso_actual` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `id_curso` int(11) unsigned NOT NULL,
  `id_estudiante` int(11) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id_curso` (`id_curso`),
  KEY `id_estudiante` (`id_estudiante`),
  CONSTRAINT `curso_actual_ibfk_1` FOREIGN KEY (`id_curso`) REFERENCES `curso` (`id`),
  CONSTRAINT `curso_actual_ibfk_2` FOREIGN KEY (`id_estudiante`) REFERENCES `estudiante` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

LOCK TABLES `curso_actual` WRITE;
/*!40000 ALTER TABLE `curso_actual` DISABLE KEYS */;

INSERT INTO `curso_actual` (`id`, `id_curso`, `id_estudiante`)
VALUES
	(1,1,1);

/*!40000 ALTER TABLE `curso_actual` ENABLE KEYS */;
UNLOCK TABLES;


# Volcado de tabla estudiante
# ------------------------------------------------------------

DROP TABLE IF EXISTS `estudiante`;

CREATE TABLE `estudiante` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `nombres` char(100) NOT NULL DEFAULT '',
  `apellidos` char(100) NOT NULL DEFAULT '',
  `identificacion` int(11) NOT NULL,
  `fecha_nacimiento` date NOT NULL,
  `correo` varchar(100) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

LOCK TABLES `estudiante` WRITE;
/*!40000 ALTER TABLE `estudiante` DISABLE KEYS */;

INSERT INTO `estudiante` (`id`, `nombres`, `apellidos`, `identificacion`, `fecha_nacimiento`, `correo`)
VALUES
	(1,'Eyner','schoonewolff',23434,'2020-01-01','eneschooneowlff@gmail.com');

/*!40000 ALTER TABLE `estudiante` ENABLE KEYS */;
UNLOCK TABLES;


# Volcado de tabla orientacion
# ------------------------------------------------------------

DROP TABLE IF EXISTS `orientacion`;

CREATE TABLE `orientacion` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `id_psicologo` int(11) DEFAULT NULL,
  `id_estudiante` int(11) DEFAULT NULL,
  `codigo` int(11) DEFAULT NULL,
  `fecha` date DEFAULT NULL,
  `tipo` varchar(11) DEFAULT NULL,
  `diagnostico` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;



# Volcado de tabla profesor_encargado
# ------------------------------------------------------------

DROP TABLE IF EXISTS `profesor_encargado`;

CREATE TABLE `profesor_encargado` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `nombres` varchar(100) NOT NULL DEFAULT '',
  `apellidos` varchar(100) NOT NULL DEFAULT '',
  `identificacion` int(11) NOT NULL,
  `curso_codigo` int(11) NOT NULL,
  `celular` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;



# Volcado de tabla psicologo
# ------------------------------------------------------------

DROP TABLE IF EXISTS `psicologo`;

CREATE TABLE `psicologo` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `nombres` varchar(100) NOT NULL DEFAULT '',
  `apellidos` varchar(100) NOT NULL DEFAULT '',
  `identificacion` int(11) NOT NULL,
  `correo` varchar(100) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;



# Volcado de tabla usuarios
# ------------------------------------------------------------

DROP TABLE IF EXISTS `usuarios`;

CREATE TABLE `usuarios` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `tipo_usuario` int(11) NOT NULL,
  `nickname` varchar(11) NOT NULL,
  `nombres` varchar(100) NOT NULL DEFAULT '',
  `apellidos` varchar(100) NOT NULL DEFAULT '',
  `correo` varchar(100) NOT NULL DEFAULT '',
  `es_anonimo` tinyint(1) NOT NULL,
  `contraseña` varchar(100) NOT NULL DEFAULT '',
  `fecha_registro` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

LOCK TABLES `usuarios` WRITE;
/*!40000 ALTER TABLE `usuarios` DISABLE KEYS */;

INSERT INTO `usuarios` (`id`, `tipo_usuario`, `nickname`, `nombres`, `apellidos`, `correo`, `es_anonimo`, `contraseña`, `fecha_registro`)
VALUES
	(2,1,'ene','eyner','schoonewolff','bschonewolff@gmail.com',1,'dsfdsf234','2022-04-14 00:10:38'),
	(3,1,'andy','Andres','perez','sdf@sdf.co',1,'21313','2022-04-14 00:34:34'),
	(6,1,'andy','carlos','perez','sdf@sdf.co',1,'234','2022-04-14 00:35:56');

/*!40000 ALTER TABLE `usuarios` ENABLE KEYS */;
UNLOCK TABLES;



/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
