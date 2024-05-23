
ALTER PROC SELECT_TurnosPaciente(
    @idpaciente paciente
)

as 

SET NOCOUNT ON

SELECT * FROM Paciente p 
INNER JOIN TurnoPacienteMedico tp 
ON tp.idPaciente = p.idPaciente
INNER JOIN Turno t 
ON t.idTurno = tp.idTurno
INNER JOIN MedicoEspecialidad m 
ON m.idMedico = tp.idMedico
WHERE p.idPaciente = @idpaciente
go


EXEC SELECT_TurnosPaciente 1003