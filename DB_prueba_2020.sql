
DROP DATABASE IF EXISTS `prueba_2020`;
CREATE DATABASE IF NOT EXISTS `prueba_2020` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `prueba_2020`;

CREATE TABLE `empleado` (
  `id_empleado` int(11) NOT NULL AUTO_INCREMENT primary key,
  `cedula` int(11) NOT NULL,
  `nombre` varchar(120) NOT NULL,
  `sueldo_base` decimal(10,2) NOT NULL
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
	   
ALTER TABLE `empleado` AUTO_INCREMENT = 1;
       
INSERT INTO `empleado` (`cedula`, `nombre`, `sueldo_base`) VALUES
(5422312, 'Pedro Jose Pedrosa Joseosa', 33998.25),
(4212312, 'Maria Jose Gonzales Pedrosa', 53888.25),
(1233421, 'Mario Alvaro Lopes Martinez', 43778.25),
(1123223, 'Hector Matep Gonzalez', 23775.11),
(1124567, 'Richard Jose Perez Galeano', 23525.15),
(2342345, 'Nubel Mario Sisneros Ramirez', 51622.03);

INSERT INTO `jornalero` ( `id_empleado`, `especialidad`, `horas_extras`) VALUES
(1, 'Cañero', 20),
(2, 'Tratorista', 22),
(3, 'Monteador', 25),
(4, 'Peon', 36),
(5, 'Barrendero', 27),
(6, 'Chofer', 32);
