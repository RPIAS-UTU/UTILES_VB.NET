DROP DATABASE IF EXISTS `prueba_2020`;
CREATE DATABASE IF NOT EXISTS `prueba_2020` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `prueba_2020`;

CREATE TABLE `empleado` (
  `id_empleado` int(11) NOT NULL AUTO_INCREMENT primary key,
  `cedula` int(11) NOT NULL,
  `nombre` varchar(120) NOT NULL
 );

CREATE TABLE `jornalero` (
  `id_jornalero` int(11) NOT NULL AUTO_INCREMENT primary key,
  `id_empleado` int(11) NOT NULL,
  `especialidad` varchar(50) DEFAULT NULL,
  `horas_extras` int(11) NOT NULL
 );

ALTER TABLE `jornalero`
    ADD CONSTRAINT `FK_empleados_jornalero` FOREIGN KEY (`id_empleado`) 
    REFERENCES `empleado` (`id_empleado`);
	   
INSERT INTO `empleado` (`cedula`, `nombre`) VALUES
(5422312, 'Pedro Jose Pedrosa Joseosa'),
(4212312, 'Maria Jose Gonzales Pedrosa'),
(1233421, 'Mario Alvaro Lopes Martinez'),
(1123223, 'Hector Matep Gonzalez'),
(1124567, 'Richard Jose Perez Galeano'),
(2342345, 'Nubel Mario Sisneros Ramirez');

INSERT INTO `jornalero` ( `id_empleado`, `especialidad`, `horas_extras`) VALUES
(1, 'Cañero', 20),
(2, 'Tratorista', 22),
(3, 'Monteador', 25),
(4, 'Peon', 36),
(5, 'Barrendero', 27),
(6, 'Chofer', 32);
