-- -----------------------------------------------------
-- BASE DE DATOS: GESTIÓN BANCARIA (PostgreSQL)
-- -----------------------------------------------------

-- Limpieza de tablas previas
DROP TABLE IF EXISTS Operacion CASCADE;
DROP TABLE IF EXISTS Cuenta CASCADE;
DROP TABLE IF EXISTS Cliente CASCADE;
DROP TABLE IF EXISTS Empleado CASCADE;
DROP TABLE IF EXISTS Banco CASCADE;

-- 1. Tabla Banco
CREATE TABLE Banco(
    idB INT PRIMARY KEY,
    nombreB VARCHAR(100),
    paginaWebB VARCHAR(100)
);

-- 2. Tabla Cliente
CREATE TABLE Cliente(
    idC INT PRIMARY KEY,
    tipoDocumC VARCHAR(20),
    nroDocumC VARCHAR(20),
    nombresC VARCHAR(50),
    paternoC VARCHAR(50),
    maternoC VARCHAR(50),
    celularC VARCHAR(15)
);

-- 3. Tabla Empleado
CREATE TABLE Empleado(
    idE INT PRIMARY KEY,
    tipoDocumE VARCHAR(20),
    nroDocumE VARCHAR(20),
    nombresE VARCHAR(50),
    paternoE VARCHAR(50),
    maternoE VARCHAR(50),
    celularE VARCHAR(15)
);

-- 4. Tabla Cuenta
CREATE TABLE Cuenta(
    idCuenta INT PRIMARY KEY,
    nroCuenta VARCHAR(20),
    saldoCuenta NUMERIC(10,2),
    idB INT,
    idC INT,
    FOREIGN KEY (idB) REFERENCES Banco(idB),
    FOREIGN KEY (idC) REFERENCES Cliente(idC)
);

-- 5. Tabla Operacion
CREATE TABLE Operacion(
    idOpe INT PRIMARY KEY,
    tipoOpe VARCHAR(50),
    fechaHoraOpe TIMESTAMP,
    montoOpe NUMERIC(10,2),
    comisionOpe NUMERIC(10,2),
    idCuenta INT,
    idE INT,
    idC INT,
    FOREIGN KEY (idCuenta) REFERENCES Cuenta(idCuenta),
    FOREIGN KEY (idE) REFERENCES Empleado(idE),
    FOREIGN KEY (idC) REFERENCES Cliente(idC)
);

-- -----------------------------------------------------
-- CONSULTAS DE VERIFICACIÓN
-- -----------------------------------------------------
SELECT * FROM Banco;
SELECT * FROM Cliente;
SELECT * FROM Empleado;
SELECT * FROM Cuenta;
SELECT * FROM Operacion;
