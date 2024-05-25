-- TRIGGER DE TIPO DELETE

-- Agregamos a la tabla PacientoLog fechaBaja
ALTER TABLE PacienteLog ADD fechaBaja DATETIME

GO

--SELECT * from paciente

-- Creamos el TRIGGER 
CREATE TRIGGER PacientesBajas ON Paciente
FOR DELETE
AS

IF EXISTS (SELECT idpaciente FROM PacienteLog
           WHERE idpaciente = (SELECT idpaciente FROM deleted)
        )
    UPDATE PacienteLog SET fechaBaja = GETDATE()
    WHERE idpaciente = (SELECT idpaciente FROM deleted)
ELSE 
    INSERT INTO PacienteLog (idpaciente, idpais, fechaBaja)
    SELECT idPaciente, idPais, GETDATE() FROM deleted

-- Modificamos un paciente para corroborar qeu el trigger funcione
SELECT * FROM Paciente 
SELECT * FROM TurnoPacienteMedico

DELETE Paciente WHERE idPaciente =2004

SELECT * FROM PacienteLog

