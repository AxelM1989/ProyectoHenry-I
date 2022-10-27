DROP DATABASE IF EXISTS HenryPI;
CREATE DATABASE HenryPI;
USE HenryPI;

SHOW VARIABLES LIKE "secure_file_priv";

DROP TABLE IF EXISTS `Sucursal`;
CREATE TABLE IF NOT EXISTS `Sucursal` (
`IdSucursal` INT NOT NULL,
`DescripcionBandera` VARCHAR(100),
`RazonSocial` VARCHAR(100),
`Direccion` VARCHAR(80),
`Localidad` VARCHAR(50),
`Provincia` VARCHAR(20),
`Latitud` DECIMAL(13,10),
`Longitud` DECIMAL(13,10),
`IdBandera` INT,
`IdComercio` INT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

LOAD DATA INFILE 'C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads\\Sucursal.csv'
INTO TABLE `Sucursal`
FIELDS TERMINATED BY "," ENCLOSED BY '"' ESCAPED BY '"'
LINES TERMINATED BY "\n" IGNORE 1 LINES; 


DROP TABLE IF EXISTS `Producto`;
CREATE TABLE IF NOT EXISTS `Producto` (
IdProducto BIGINT NOT NULL,
Nombre VARCHAR(100),
Marca VARCHAR(80),
Presentacion VARCHAR(100),
Categoria1 VARCHAR(100),
Categoria2 VARCHAR(100),
Categoria3 VARCHAR(100)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;
LOAD DATA INFILE 'C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads\\Producto.csv'
INTO TABLE `Producto`
FIELDS TERMINATED BY "," ENCLOSED BY '"' ESCAPED BY '"'
LINES TERMINATED BY "\n" IGNORE 1 LINES; 

DROP TABLE IF EXISTS `PreciosSemana`;
CREATE TABLE IF NOT EXISTS `PreciosSemana` (
IdProducto BIGINT NOT NULL,
IdSucursal VARCHAR(80) ,
Precio VARCHAR(80),
Semana VARCHAR(50)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;
LOAD DATA INFILE 'C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads\\PreciosSemana.csv'
INTO TABLE `PreciosSemana`
FIELDS TERMINATED BY "," ENCLOSED BY '"' ESCAPED BY '"'
LINES TERMINATED BY "\n" IGNORE 1 LINES; 

DROP TABLE IF EXISTS `PreciosSemanaprueba`;
CREATE TABLE IF NOT EXISTS `PreciosSemanaprueba` (
IdProducto BIGINT NOT NULL,
IdSucursal bigint ,
Precio VARCHAR(80),
Semana VARCHAR(50)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;
LOAD DATA INFILE 'C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads\\PreciosSemana.csv'
INTO TABLE `PreciosSemanaprueba`
FIELDS TERMINATED BY "," ENCLOSED BY '"' ESCAPED BY '"'
LINES TERMINATED BY "\n" IGNORE 1 LINES; 


-- Cheque claves duplicadas en producto
SELECT IdPRODUCTO, COUNT(*) FROM producto GROUP BY Idproducto HAVING COUNT(*) > 1;

-- Chequeo claves Duplicadas en sucursal
SELECT Idsucursal, COUNT(*) as CantidadId FROM sucursal GROUP BY Idsucursal HAVING COUNT(*) > 1;

/*Generacion de clave única tabla sucursales*/ 
UPDATE sucursal 
SET Idsucursal=(IdSucursal*100)+ IdComercio;

-- Chequeo claves Duplicadas en sucursal
SELECT Idsucursal, COUNT(*) as CantidadId FROM sucursal GROUP BY Idsucursal HAVING COUNT(*) > 1;

/*Creamos indices de las tablas determinando claves primarias y foraneas*/

ALTER TABLE Sucursal ADD PRIMARY KEY(IdSucursal); -- Para relacionarla, clave foránea de Precios.
ALTER TABLE Sucursal ADD INDEX(IdBandera); -- Indexamos, para poder buscar a través de las cadenas de empresas.
ALTER TABLE Sucursal ADD INDEX(IdComercio); -- Indexamos, para poder buscar a través del identificador de las empresas.

ALTER TABLE Producto ADD PRIMARY KEY(IdProducto); -- Para relacionarla, clave foránea de Precios.

SET FOREIGN_KEY_CHECKS=0;  -- Para habilitar 
ALTER TABLE PreciosSemana ADD INDEX(Semana); -- Indexamos, para poder buscar a través de las distintas semanas.
ALTER TABLE PreciosSemana ADD INDEX(IdProducto); -- Indexamos los IdProductos para mayor rapidez y eficiencia en las consultas.
ALTER TABLE PreciosSemana ADD CONSTRAINT Precios_fk_Producto 
FOREIGN KEY (IdProducto) REFERENCES Producto(IdProducto) ON DELETE RESTRICT ON UPDATE RESTRICT; -- Realizamos Union a través de las Claves de cada tabla.

SET FOREIGN_KEY_CHECKS=1;
SET FOREIGN_KEY_CHECKS=1;

SELECT IdSucursal, COUNT(*) Total
FROM PreciosSemana
GROUP BY IDSucursal
HAVING COUNT(*) > 1;

ALTER TABLE PreciosSemana ADD INDEX(IdSucursal); -- Indexamos los IdSucursales para mayor rapidez y eficiencia en las consultas.
ALTER TABLE PreciosSemana ADD CONSTRAINT Precios_fk_Sucursal
FOREIGN KEY(IdSucursal) REFERENCES Sucursal(IdSucursal) ON DELETE RESTRICT ON UPDATE RESTRICT;


SELECT AVG(P.PRECIO ) 
FROM  preciossemana P
JOIN SUCURSAL S ON (S.IDSUCURSAL=P.IDSUCURSAL); 

-- Consulta para sacar el Precio Promedio de la Sucursal con Id 91688 
SELECT round(AVG(Precio),2) as PrecioPromedio, IdSucursal as Sucursal91688 
FROM  preciossemana 
WHERE IdSucursal=91688;

-- Consulta de ejemplo coin Joins (left en este caso) para obtener por ejemplo el dulce de leche Castelmar
-- y sus precios durante las semanas.
SELECT p.Nombre, ps.Precio , p.Presentacion ,Semana
FROM producto p
JOIN preciossemana ps on(p.IDProducto=ps.IdProducto)
WHERE p.nombre= ("Dulce de Leche Castelma");




