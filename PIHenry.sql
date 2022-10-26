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
IdProducto VARCHAR(100) NOT NULL,
IdSucursal VARCHAR(80) ,
Precio VARCHAR(80),
Semana VARCHAR(50)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;
LOAD DATA INFILE 'C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads\\PreciosSemana.csv'
INTO TABLE `PreciosSemana`
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


