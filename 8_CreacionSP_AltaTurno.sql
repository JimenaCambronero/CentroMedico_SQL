-- Programación de SP para Insertar Turnos

CREATE PROC ALTA_Turno
    (
    @fecha char(14),
    @idPaciente INT,
    @idMedico INT,
    @observacion varchar (300) = ''
)
as 
GO

/*
Estado = 0 pendiente
Estado = 1 realizado
Estado = 2 cancelado
*/


EXEC ALTA_Turno '20340215 17:15', 11, 1003, 'Paciente No toma medicación'
go

ALTER PROC ALTA_Turno
    (
    @fecha char(14),
    @idPaciente INT,
    @idMedico INT,
    @observacion varchar (300) = ''
)
as 

SET NOCOUNT ON 

IF NOT EXISTS (SELECT TOP 1
    idTurno
FROM Turno
WHERE fechaTurno = @fecha)
BEGIN
    INSERT INTO Turno
        (fechaTurno, estado, observacion)
    VALUES
        (@fecha, 0, @observacion)

    DECLARE @auxIdTurno turno
    SET @auxIdTurno = @@IDENTITY

    INSERT INTO TurnoPacienteMedico
        (idTurno,idPaciente,idMedico)
    VALUES
        (@auxIdTurno, @idPaciente, @idMedico)
    PRINT 'El Turno fue agregado correctamente'
    RETURN
END
BEGIN
    PRINT 'El Turno ya existe'
    RETURN
END
GO 

SELECT * from Turno
SELECT * from TurnoPacienteMedico
SELECT * from Paciente
SELECT * from Medico