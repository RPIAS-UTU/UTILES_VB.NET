
DROP DATABASE IF EXISTS `empresa`;
CREATE DATABASE IF NOT EXISTS `empresa` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `empresa`;

CREATE TABLE `personas` (
  `id_persona` int(11) NOT NULL AUTO_INCREMENT primary key,
  `cedula` int(11) NOT NULL,
  `foto` LONGTEXT,
  `primer_nombre` varchar(20) NOT NULL,
  `segundo_nombre` varchar(20) DEFAULT NULL,
  `primer_apellido` varchar(20) NOT NULL,
  `segundo_apellido` varchar(20) DEFAULT NULL,
  `telefono` int(15) not null,
  `direccion` varchar(25) not null
 );

CREATE TABLE `tipos_empleados` (
  `id_tipo_empleado` int(11) NOT NULL AUTO_INCREMENT primary key,
  `tipo_empleado` varchar(20) DEFAULT NULL
 );

CREATE TABLE `empleados` (
  `id_empleado` int(11) NOT NULL AUTO_INCREMENT primary key,
  `id_persona` int(11) NOT NULL,
  `id_tipo` int(11) NOT NULL,
  `sueldoMens` int(10) not null
 );

ALTER TABLE `empleados`
    ADD CONSTRAINT `FK_empleados_personas` FOREIGN KEY (`id_persona`) REFERENCES `personas` (`id_persona`),
	ADD CONSTRAINT `FK_empleados_tipos` FOREIGN KEY (`id_tipo`) REFERENCES `tipos_empleados` (`id_tipo_empleado`);
    
INSERT INTO tipos_empleados (tipo_empleado) VALUES ('OPERARIO');
INSERT INTO tipos_empleados (tipo_empleado) VALUES ('ADMINISTRATIVO');
INSERT INTO tipos_empleados (tipo_empleado) VALUES ('GERENTE');

INSERT INTO `personas` (`cedula`, `primer_nombre`, `segundo_nombre`, `primer_apellido`, `segundo_apellido`,`telefono`,`direccion`) VALUES
(5422312, 'Pedro', 'Jose', 'Pedrosa', 'Joseosa', 094232121,'Av Bolivia 2122'),
(4212312, 'Maria', 'Jose', 'Gonzales', 'Pedrosa',092311231,'Av Rivera 4421'),
(1233421, 'Mario', 'Alvaro', 'Lopes', 'Martinez',099231112,'Av Italia 4111'),
(1123223, 'Hector', 'Matep', 'Gonzalez', NULL,098343656,'Cno Carrasco 6643'),
(1124567, 'Richard', NULL, 'pias', NULL,097655342,'Av Rivera 4331'),
(2342345, 'Ricardo', NULL, 'Fort', NULL,098784787,'Av Bolivia 4321');

INSERT INTO	`empleados` (`id_persona`,`id_tipo`, `sueldoMens`) VALUES (1,1,23500);
INSERT INTO	`empleados` (`id_persona`,`id_tipo`, `sueldoMens`) VALUES (2,1,23500);
INSERT INTO	`empleados` (`id_persona`,`id_tipo`, `sueldoMens`) VALUES (3,2,33500);
INSERT INTO	`empleados` (`id_persona`,`id_tipo`, `sueldoMens`) VALUES (4,2,33500);
INSERT INTO	`empleados` (`id_persona`,`id_tipo`, `sueldoMens`) VALUES (5,3,55500);
INSERT INTO	`empleados` (`id_persona`,`id_tipo`, `sueldoMens`) VALUES (6,3,55500);

CREATE TABLE `articulos` (
  `id_articulo` int(11) NOT NULL AUTO_INCREMENT primary key,
  `codigo` int(11) NOT NULL,
  `foto` LONGTEXT,
  `descripcion` varchar(200) NOT NULL,
  `precio` decimal(5,2) NOT NULL DEFAULT 0,
  `fecha_fabricacion` varchar(10) NOT NULL DEFAULT ''
  );
  
  
INSERT INTO `articulos` (`codigo`, `foto`, `descripcion`, `precio`, `fecha_fabricacion`) VALUES
(5422312, '', 'Bolsa para Lavar Ropa de 50x60cm con Cierre', 80, '31/01/2020'),
(5422313, '', 'Escurre Platos Metálico de 2 Niveles', 600, '12/03/20020'),
(5422314, '', 'Funda Protectora de Lavarropas Impermeable 58x62x85cm', 380, '11/02/2020'),
(5422315, '', 'Toallitas Quita Esmalte de Uñas Ideal para Cartera', 70, '15/02/2020'),
(5422316, '', 'Bolsa para Lavar Ropa de 50x60cm con Cierre', 80, '31/01/2020');



################################################################################
# SP_EmpleadosPorTipo
################################################################################
DROP procedure IF EXISTS `SP_EmpleadosPorTipo`;
DELIMITER $$
USE `empresa`$$
CREATE PROCEDURE `SP_EmpleadosPorTipo` (
)

BEGIN 
 
SELECT 
 P.cedula 
,CONCAT(P.primer_nombre, " ", P.primer_apellido ) AS nombre
,TE.tipo_empleado
FROM empleados AS E
INNER JOIN personas AS P ON P.id_persona = E.id_persona
INNER JOIN tipos_empleados AS TE ON TE.id_tipo_empleado = E.id_tipo;

END$$
DELIMITER ; 

################################################################################
# SP_Agregar_Persona
################################################################################
DROP procedure IF EXISTS `SP_Agregar_Persona`;
DELIMITER $$
USE `empresa`$$
CREATE PROCEDURE `SP_Agregar_Persona` (
	cedula INT,
    str_foto LongBlob,
    primer_nombre VARCHAR(50),
    segundo_nombre VARCHAR(50),
    primer_apellido VARCHAR(50),
    segundo_apellido VARCHAR(50),
    telefono VARCHAR(20),
    direccion VARCHAR(100),
    OUT id_ingresado int 
)

BEGIN 
 
INSERT INTO personas (
	cedula, 
    foto, 
    primer_nombre, 
    segundo_nombre, 
    primer_apellido, 
    segundo_apellido, 
    telefono, 
    direccion
) VALUES (
    cedula, 
    str_foto, 
    primer_nombre, 
    segundo_nombre, 
    primer_apellido, 
    segundo_apellido, 
    telefono, 
    direccion
);

SELECT MAX(id_persona) INTO id_ingresado FROM personas;

END$$
DELIMITER ; 


