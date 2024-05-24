-- TABLAS TEMPORALES
-- Existe mientras el script se este ejecutando. Se puede volver a ejecutar y no dará error

DECLARE @miTabla TABLE (id int IDENTITY(1,1),
                        pais VARCHAR (50)
                        )

INSERT into @miTabla VALUES ('Argentina')
INSERT into @miTabla VALUES ('México')     
INSERT into @miTabla VALUES ('España')    

SELECT * FROM @miTabla

--TABLA TEMPORAL FISICA.
-- Existe como tabla temporal hasta que reiniciemos el motor. LLeva numeral y no arroba. Creada no puede volver a ejecutarse el script

CREATE TABLE #miTabla  (id int IDENTITY(1,1),
                        nombre VARCHAR (50),
                        apellido VARCHAR (50)
                        )
INSERT INTO #miTabla VALUES ('Juan', 'Tabla')
INSERT INTO #miTabla VALUES ('Maria', 'Tabla')
INSERT INTO #miTabla VALUES ('Pedro', 'Tabla')

SELECT * FROM #miTabla

-- Como la destruimos?
DROP TABLE #miTabla                       



-- SCRIPT
-- Tabla temporal con turnos de todos los pacientes, filtraremos los turnos por un paciente específico.
-- Se utilizan para alivianar la Consultas Principales.

DECLARE @turnos TABLE (id int IDENTITY (1,1), idturno  turno, idpaciente paciente)
DECLARE @idpaciente paciente
SET @idpaciente = 1003


INSERT INTO @turnos (idturno, idpaciente)
SELECT tpm.idTurno, p.idPaciente FROM Paciente p 
INNER JOIN TurnoPacienteMedico tpm 
ON tpm.idPaciente = p.idPaciente

-- recorremos la tabla con un ciclo while
DECLARE @i INT,
        @total INT
SET @i = 1
SET @total = (select count(*)FROM @turnos) 

WHILE @i <= @total 
BEGIN
    if (Select idpaciente from @turnos where id = @i) <> @idpaciente
    DELETE from @turnos WHERE id = @i

    set @i = @i + 1
END
-- hacemos en join. Cuando la consulta es mut grande usar una tabla temporal ayuda a usar menos recursos
SELECT * FROM Paciente p 
inner JOIN @turnos t 
ON t.idPaciente = p.idPaciente

