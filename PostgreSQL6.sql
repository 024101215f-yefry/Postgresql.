-- -----------------------------------------------------
-- BASE DE DATOS: GESTIÓN DE ENFERMERÍA (PostgreSQL)
-- -----------------------------------------------------

-- Limpieza de tablas con CASCADE para eliminar dependencias ordenadamente
DROP TABLE IF EXISTS Asistencia CASCADE;
DROP TABLE IF EXISTS Ambiente CASCADE;
DROP TABLE IF EXISTS Calendario CASCADE;
DROP TABLE IF EXISTS Enfermero CASCADE;

-- 1. Tabla Enfermero
CREATE TABLE Enfermero(
    idE INT PRIMARY KEY,
    tipoDocumE VARCHAR(20),
    nroDocumE VARCHAR(20),
    nombresE VARCHAR(50),
    paternoE VARCHAR(50),
    maternoE VARCHAR(50),
    fechaNacimientoE DATE,
    generoE VARCHAR(10)
);

-- 2. Tabla Ambiente (Salas o áreas del hospital)
CREATE TABLE Ambiente(
    idAmb INT PRIMARY KEY,
    nroAmb VARCHAR(20),
    ubicacionAmb VARCHAR(100)
);

-- 3. Tabla Calendario (Turnos programados)
CREATE TABLE Calendario(
    idC INT PRIMARY KEY,
    inicioC DATE,
    finC DATE,
    nombreC VARCHAR(50)
);

-- 4. Tabla Asistencia (Registro detallado de actividad)
CREATE TABLE Asistencia(
    idA INT PRIMARY KEY,
    fechaA DATE,
    diaA VARCHAR(20),
    asistioA BOOLEAN,
    tardoA BOOLEAN,
    horaEntradaA TIME,
    horaSalidaA TIME,
    justificacionA VARCHAR(100),
    esDescansoA BOOLEAN,
    idE INT,
    idAmb INT,
    idC INT,
    FOREIGN KEY (idE) REFERENCES Enfermero(idE),
    FOREIGN KEY (idAmb) REFERENCES Ambiente(idAmb),
    FOREIGN KEY (idC) REFERENCES Calendario(idC)
);

-- -----------------------------------------------------
-- CONSULTAS DE VERIFICACIÓN
-- -----------------------------------------------------
SELECT * FROM Enfermero;
SELECT * FROM Ambiente;
SELECT * FROM Calendario;
SELECT * FROM Asistencia;
