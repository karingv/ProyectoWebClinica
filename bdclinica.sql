-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 09-12-2021 a las 05:39:03
-- Versión del servidor: 10.4.21-MariaDB
-- Versión de PHP: 8.0.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `bdclinica`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `especialidad`
--

CREATE TABLE `especialidad` (
  `id_esp` int(11) NOT NULL,
  `nombEsp` varchar(50) NOT NULL,
  `consultorio` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `especialidad`
--

INSERT INTO `especialidad` (`id_esp`, `nombEsp`, `consultorio`) VALUES
(1, 'MEDICINA INTERNA', 'Piso 1 - 101'),
(2, 'BANCO DE SANGRE', 'Piso 1 - 102'),
(3, 'CARDIOLOGIA', 'Piso 1 - 103'),
(4, 'CIRUGIA GENERAL', 'Piso 1 - 104'),
(5, 'DERMATOLOGIA', 'Piso 2 - 201'),
(6, 'GASTROENTEROLOGIA', 'Piso 2 - 202'),
(7, 'NEUROLOGIA', 'Piso 2 - 203'),
(8, 'PEDIATRIA', 'Piso 3 - 301'),
(9, 'PSICOLOGIA', 'Piso 3 - 302'),
(10, 'TRAUMATOLOGIA', 'Piso 3 - 303');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `horarios`
--

CREATE TABLE `horarios` (
  `id_h` int(11) NOT NULL,
  `horario` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `horarios`
--

INSERT INTO `horarios` (`id_h`, `horario`) VALUES
(1, '08:00 a.m.'),
(2, '10:00 a.m.'),
(3, '02:00 p.m.'),
(4, '04:00 p.m.');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `medicos`
--

CREATE TABLE `medicos` (
  `id_med` int(11) NOT NULL,
  `nombres` varchar(50) NOT NULL,
  `apellidos` varchar(50) NOT NULL,
  `sexo` varchar(10) NOT NULL,
  `numcoleg` varchar(10) NOT NULL,
  `usuario` varchar(50) NOT NULL,
  `contraseña` varchar(50) NOT NULL,
  `id_esp` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `medicos`
--

INSERT INTO `medicos` (`id_med`, `nombres`, `apellidos`, `sexo`, `numcoleg`, `usuario`, `contraseña`, `id_esp`) VALUES
(1, 'Oscar Alejandro', 'Espinoza Alegre', 'masculino', '14883', 'oscar148', 'oscar14883', 1),
(2, 'Roberto Alfonso', 'Sano Ito', 'masculino', '13132', '', '', 1),
(3, 'Eddy Renzo', 'Manrique Castagnola', 'masculino', '43318', 'eddy12345', 'eddy123', 2),
(4, 'Giovanna Rocio', 'Vives Rivero', 'femenino', '51133', '', '', 2),
(5, 'Miguel Ricardo', 'Sanchez-Palacios Paiva', 'masculino', '08353', '', '', 3),
(6, 'Enrique Augusto', 'Freitas Alvarado', 'masculino', '12643', '', '', 4),
(7, 'Eduardo', 'Salazar Minaya', 'masculino', '10137', 'num7', 'num7', 4),
(8, 'Patricia Rocio', 'Giglio Basto', 'femenino', '43954', '', '', 5),
(9, 'Jose Antonio', 'Barriga Briceño', 'masculino', '33654', 'jose336', 'jose33654', 6),
(10, 'Leila Axana', 'Barreto Barra', 'femenino', '58306', '', '', 7),
(11, 'Carlos Alberto', 'Carrasco Macedo', 'masculino', '21280', '', '', 7),
(12, 'Maria Ysabel', 'Acosta Gali', 'femenino', '19052', '', '', 8),
(13, 'Luis Martin', 'Callalli Denegri', 'masculino', '28165', '', '', 8),
(14, 'Maria del Carmen', 'Bravo de Rueda Ortega', 'femenino', '01935', 'num14', 'num14', 9),
(15, 'Mary Isabel', 'Castro Ataurima', 'femenino', '11980', '', '', 9),
(16, 'Gustavo Dario', 'Delgado Razuri', 'masculino', '32640', '', '', 10),
(19, 'preuba', 'prueba', 'femenino', '12547', 'prueba', 'prueba', 2),
(20, 'flavio', 'prueba', 'femenino', '14725', '123', '123', 5);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pacientes`
--

CREATE TABLE `pacientes` (
  `id_paciente` int(11) NOT NULL,
  `nombres` varchar(50) NOT NULL,
  `apellidos` varchar(50) NOT NULL,
  `DNI` varchar(10) NOT NULL,
  `fecha_nac` varchar(50) NOT NULL,
  `sexo` varchar(10) NOT NULL,
  `celular` varchar(10) NOT NULL,
  `correo` varchar(50) NOT NULL,
  `usuario` varchar(50) NOT NULL,
  `contraseña` varchar(50) NOT NULL,
  `id_tipo` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `pacientes`
--

INSERT INTO `pacientes` (`id_paciente`, `nombres`, `apellidos`, `DNI`, `fecha_nac`, `sexo`, `celular`, `correo`, `usuario`, `contraseña`, `id_tipo`) VALUES
(1, 'flavio', 'montero', '123456', '2002-03-27', 'masculino', '123456789', 'fla@gmail.com', 'admin', 'admin', 2),
(2, 'juan', 'chavez', '654321', '2001-03-27', 'masculino', '12345678', 'flace@gmail.com', 'paciente', 'paciente', 1),
(3, 'flavio cesar', 'montero', '654321124', '2001/03/27', 'masculino', '12345678', 'flace@gmail.com', '12345', 'admin', 1),
(8, 'karin karelin', 'gutierrez', '985745', '15/08/2000', 'masculino', '12345678', 'karin@gmail.com', 'karin', '123', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `reservarcita`
--

CREATE TABLE `reservarcita` (
  `id_rc` int(11) NOT NULL,
  `id_paciente` int(11) NOT NULL,
  `fecha` varchar(10) NOT NULL,
  `id_h` int(11) NOT NULL,
  `id_med` int(11) NOT NULL,
  `id_esp` int(11) NOT NULL,
  `estado` varchar(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `reservarcita`
--

INSERT INTO `reservarcita` (`id_rc`, `id_paciente`, `fecha`, `id_h`, `id_med`, `id_esp`, `estado`) VALUES
(1, 2, '2021-11-18', 2, 5, 3, ''),
(3, 8, '2021-11-30', 1, 4, 2, ''),
(5, 1, '2021-11-26', 4, 8, 5, ''),
(6, 1, '2021-11-25', 3, 9, 6, 'ATENDIDO'),
(7, 1, '2021-11-29', 4, 9, 6, 'ATENDIDO'),
(8, 1, '2021-12-03', 3, 1, 1, 'ATENDIDO'),
(12, 2, '2021-12-22', 4, 6, 4, ''),
(13, 2, '2021-12-22', 4, 6, 4, ''),
(14, 2, '2021-12-23', 3, 5, 3, ''),
(15, 2, '2021-12-20', 1, 1, 1, 'ATENDIDO'),
(16, 2, '2021-12-20', 1, 1, 1, 'PENDIENTE');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipousuario`
--

CREATE TABLE `tipousuario` (
  `id_tipo` int(11) NOT NULL,
  `tipo` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `tipousuario`
--

INSERT INTO `tipousuario` (`id_tipo`, `tipo`) VALUES
(1, 'PACIENTE'),
(2, 'ADMINISTRADOR SISTEMA');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `especialidad`
--
ALTER TABLE `especialidad`
  ADD PRIMARY KEY (`id_esp`);

--
-- Indices de la tabla `horarios`
--
ALTER TABLE `horarios`
  ADD PRIMARY KEY (`id_h`);

--
-- Indices de la tabla `medicos`
--
ALTER TABLE `medicos`
  ADD PRIMARY KEY (`id_med`,`id_esp`),
  ADD KEY `Fk_medico` (`id_esp`);

--
-- Indices de la tabla `pacientes`
--
ALTER TABLE `pacientes`
  ADD PRIMARY KEY (`id_paciente`,`id_tipo`),
  ADD KEY `Fk_paciente` (`id_tipo`);

--
-- Indices de la tabla `reservarcita`
--
ALTER TABLE `reservarcita`
  ADD PRIMARY KEY (`id_rc`,`id_paciente`,`id_h`,`id_med`,`id_esp`),
  ADD KEY `Fk_reservar1` (`id_h`),
  ADD KEY `Fk_reservar2` (`id_med`,`id_esp`),
  ADD KEY `Fk_reservar3` (`id_paciente`);

--
-- Indices de la tabla `tipousuario`
--
ALTER TABLE `tipousuario`
  ADD PRIMARY KEY (`id_tipo`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `especialidad`
--
ALTER TABLE `especialidad`
  MODIFY `id_esp` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `horarios`
--
ALTER TABLE `horarios`
  MODIFY `id_h` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `medicos`
--
ALTER TABLE `medicos`
  MODIFY `id_med` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT de la tabla `pacientes`
--
ALTER TABLE `pacientes`
  MODIFY `id_paciente` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT de la tabla `reservarcita`
--
ALTER TABLE `reservarcita`
  MODIFY `id_rc` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT de la tabla `tipousuario`
--
ALTER TABLE `tipousuario`
  MODIFY `id_tipo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `medicos`
--
ALTER TABLE `medicos`
  ADD CONSTRAINT `Fk_medico` FOREIGN KEY (`id_esp`) REFERENCES `especialidad` (`id_esp`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `pacientes`
--
ALTER TABLE `pacientes`
  ADD CONSTRAINT `Fk_paciente` FOREIGN KEY (`id_tipo`) REFERENCES `tipousuario` (`id_tipo`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `Fk_pacientes` FOREIGN KEY (`id_tipo`) REFERENCES `tipousuario` (`id_tipo`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `reservarcita`
--
ALTER TABLE `reservarcita`
  ADD CONSTRAINT `Fk_reservar1` FOREIGN KEY (`id_h`) REFERENCES `horarios` (`id_h`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `Fk_reservar2` FOREIGN KEY (`id_med`,`id_esp`) REFERENCES `medicos` (`id_med`, `id_esp`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `Fk_reservar3` FOREIGN KEY (`id_paciente`) REFERENCES `pacientes` (`id_paciente`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
