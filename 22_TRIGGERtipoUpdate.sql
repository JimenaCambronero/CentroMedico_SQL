-- TRIGGER DE TIPO UPDATE
-- Agregamos a la tabla PacientoLog fechaModificacion
ALTER TABLE PacienteLog ADD fechaModificacion DATETIME

GO
-- Creamos el TRIGGER 
CREATE TRIGGER PacientesModificados ON Paciente
AFTER UPDATE
AS

IF EXISTS (SELECT idpaciente FROM PacienteLog
           WHERE idpaciente = (SELECT idpaciente FROM inserted)
        )
    UPDATE PacienteLog SET fechaModificacion = GETDATE()
    WHERE idpaciente = (SELECT idpaciente FROM inserted)
ELSE 
    INSERT INTO PacienteLog (idpaciente, idpais, fechaModificacion)
    SELECT idPaciente, idPais, GETDATE() FROM inserted

-- Modificamos un paciente para corroborar qeu el trigger funcione
SELECT * FROM Paciente 

UPDATE Paciente SET dni = 29073564 WHERE idPaciente =9

SELECT * FROM PacienteLog