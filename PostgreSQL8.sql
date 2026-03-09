-- -----------------------------------------------------
-- BASE DE DATOS: GESTIÓN DEPORTIVA (PostgreSQL)
-- -----------------------------------------------------

-- Limpieza de tablas con CASCADE para manejar las dependencias
DROP TABLE IF EXISTS Asistencia CASCADE;
DROP TABLE IF EXISTS GrupoDisciplina CASCADE;
DROP TABLE IF EXISTS Disciplina CASCADE;
DROP TABLE IF EXISTS Cliente CASCADE;

-- 1. Tabla Cliente
CREATE TABLE Cliente(
    idC INT PRIMARY KEY,
    tipoDocumC VARCHAR(20),
    nroDocumC VARCHAR(20),
    nombresC VARCHAR(50),
    paternoC VARCHAR(50),
    maternoC VARCHAR(50),
    generoC VARCHAR(10),
    fechaNacimientoC DATE,
    enfermedadesC VARCHAR(100),
    celularC VARCHAR(15)
);

-- 2. Tabla Disciplina (Ej: Yoga, CrossFit, Natación)
CREATE TABLE Disciplina(
    idD INT PRIMARY KEY,
    nombreD VARCHAR(50),
    descripcionD VARCHAR(100)
);

-- 3. Tabla GrupoDisciplina (Horarios y periodos por disciplina)
CREATE TABLE GrupoDisciplina(
    idG INT PRIMARY KEY,
    nombreG VARCHAR(50),
    fechaInicioG DATE,
    fechaFinG DATE,
    idD INT,
    FOREIGN KEY (idD) REFERENCES Disciplina(idD)
);

-- 4. Tabla Asistencia (Registro diario de clientes en grupos)
CREATE TABLE Asistencia(
    idA INT PRIMARY KEY,
    fechaA DATE,
    diaA VARCHAR(20),
    esFeriadoA BOOLEAN,
    asistioA BOOLEAN,
    horaEntradaA TIME,
    idC INT,
    idG INT,
    FOREIGN KEY (idC) REFERENCES Cliente(idC),
    FOREIGN KEY (idG) REFERENCES GrupoDisciplina(idG)
);

-- -----------------------------------------------------
-- CONSULTAS DE VERIFICACIÓN
-- -----------------------------------------------------
SELECT * FROM Cliente;
SELECT * FROM Disciplina;
SELECT * FROM GrupoDisciplina;
SELECT * FROM Asistencia;
