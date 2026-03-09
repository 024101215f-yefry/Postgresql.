-- -----------------------------------------------------
-- BASE DE DATOS: GESTIÓN DE ELECTRODOMÉSTICOS (PostgreSQL)
-- -----------------------------------------------------

-- Limpieza de tablas con CASCADE para manejar las dependencias
DROP TABLE IF EXISTS detalleIngresoSalida CASCADE;
DROP TABLE IF EXISTS OrdenDeCompra CASCADE;
DROP TABLE IF EXISTS Comprobante CASCADE;
DROP TABLE IF EXISTS Electrodomestico CASCADE;
DROP TABLE IF EXISTS Proveedor CASCADE;
DROP TABLE IF EXISTS Cliente CASCADE;

-- 1. Tabla Proveedor
CREATE TABLE Proveedor(
    idP INT PRIMARY KEY,
    razonSocialP VARCHAR(100),
    direccionP VARCHAR(150)
);

-- 2. Tabla Cliente
CREATE TABLE Cliente(
    idC INT PRIMARY KEY,
    tipoDocumC VARCHAR(20),
    nombresC VARCHAR(50),
    nroDocumC VARCHAR(20),
    paternoC VARCHAR(50),
    maternoC VARCHAR(50),
    celularC VARCHAR(15)
);

-- 3. Tabla Electrodomestico
CREATE TABLE Electrodomestico(
    idE INT PRIMARY KEY,
    nombreE VARCHAR(60),
    marcaE VARCHAR(50),
    modeloE VARCHAR(50),
    precioVentaE NUMERIC(10,2),
    precioCompraE NUMERIC(10,2)
);

-- 4. Tabla OrdenDeCompra (Relación con Proveedor)
CREATE TABLE OrdenDeCompra(
    idOrden INT PRIMARY KEY,
    fechaHoraOrden TIMESTAMP,
    totalOrden NUMERIC(10,2),
    idP INT,
    FOREIGN KEY (idP) REFERENCES Proveedor(idP)
);

-- 5. Tabla Comprobante (Relación con Cliente)
CREATE TABLE Comprobante(
    idComp INT PRIMARY KEY,
    tipoComp VARCHAR(30),
    fechaHoraComp TIMESTAMP,
    totalComp NUMERIC(10,2),
    idC INT,
    FOREIGN KEY (idC) REFERENCES Cliente(idC)
);

-- 6. Tabla detalleIngresoSalida (Tabla central de movimientos)
CREATE TABLE detalleIngresoSalida(
    idDet INT PRIMARY KEY
