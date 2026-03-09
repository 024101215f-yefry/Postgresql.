-- -----------------------------------------------------
-- BASE DE DATOS: SISTEMA DE VENTAS (PostgreSQL)
-- -----------------------------------------------------

-- Limpieza de tablas con CASCADE para manejar las dependencias
DROP TABLE IF EXISTS Detalle CASCADE;
DROP TABLE IF EXISTS Comprobante CASCADE;
DROP TABLE IF EXISTS Producto CASCADE;
DROP TABLE IF EXISTS Categoria CASCADE;
DROP TABLE IF EXISTS Cliente CASCADE;

-- 1. Tabla Cliente
CREATE TABLE Cliente(
    idC INT PRIMARY KEY,
    tipoDocumC VARCHAR(20),
    nroDocumC VARCHAR(20),
    nombresC VARCHAR(50),
    paternoC VARCHAR(50),
    maternoC VARCHAR(50),
    celularC VARCHAR(15)
);

-- 2. Tabla Categoria
CREATE TABLE Categoria(
    idCat INT PRIMARY KEY,
    nombreCat VARCHAR(50),
    descripcionCat VARCHAR(100)
);

-- 3. Tabla Producto
CREATE TABLE Producto(
    idP INT PRIMARY KEY,
    nombreP VARCHAR(50),
    descripcionP VARCHAR(100),
    precioReferencialP NUMERIC(10,2),
    idCat INT,
    FOREIGN KEY (idCat) REFERENCES Categoria(idCat)
);

-- 4. Tabla Comprobante (Cabecera de la venta)
CREATE TABLE Comprobante(
    idComp INT PRIMARY KEY,
    fechaHoraComp TIMESTAMP,
    totalComp NUMERIC(10,2),
    idC INT,
    FOREIGN KEY (idC) REFERENCES Cliente(idC)
);

-- 5. Tabla Detalle (Artículos por comprobante)
CREATE TABLE Detalle(
    idDet INT PRIMARY KEY,
    cantidadDet INT,
    precioRealUnitarioDet NUMERIC(10,2),
    subtotalDet NUMERIC(10,2),
    idComp INT,
    idP INT,
    FOREIGN
