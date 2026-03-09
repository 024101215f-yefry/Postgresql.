-- -----------------------------------------------------
-- BASE DE DATOS: GESTIÓN DE ASISTENCIAS (PostgreSQL)
-- -----------------------------------------------------

-- Limpieza de tablas previas para evitar conflictos de relación
DROP TABLE IF EXISTS Asistencia CASCADE;
DROP TABLE IF EXISTS Turno CASCADE;
DROP TABLE IF EXISTS Empleado CASCADE;
DROP TABLE IF EXISTS Anio CASCADE;

-- 1. Tabla Anio
CREATE TABLE Anio(
    idAnio INT PRIMARY KEY,
    inicioAnio DATE,
    finAnio DATE
);

-- 2. Tabla Empleado
-- Nota: El campo supervisor hace referencia al id del mismo empleado (Autorelación)
CREATE TABLE Empleado(
    idE INT PRIMARY KEY,
    tipoDocumE VARCHAR(20),
    nroDocumE VARCHAR(20),
    nombresE VARCHAR(50),
    paternoE VARCHAR(50),
    maternoE VARCHAR(50),
    celularE VARCHAR(15),
    supervisor INT
);

-- 3. Tabla Turno
CREATE TABLE Turno(
    idT INT PRIMARY KEY,
    nombreT VARCHAR(50),
    iniT TIME,
    finT TIME,
    idAnio INT,
    FOREIGN KEY (idAnio) REFERENCES Anio(idAnio)
);

-- 4. Tabla Asistencia
CREATE TABLE Asistencia(
    idA INT PRIMARY KEY,
    fechaA DATE,
    diaA VARCHAR(20),
    esFeriadoA BOOLEAN,
    asistioA BOOLEAN,
    turnoA INT,
    horaEntradaA TIME,
    horaSalidaA TIME,
    idE INT,
    FOREIGN KEY (turnoA) REFERENCES Turno(idT),
    FOREIGN KEY (idE) REFERENCES Empleado(idE)
);

-- -----------------------------------------------------
-- CONSULTAS DE VERIFICACIÓN
-- -----------------------------------------------------
SELECT * FROM Anio;
SELECT * FROM Empleado;
SELECT * FROM Turno;
SELECT * FROM Asistencia;
