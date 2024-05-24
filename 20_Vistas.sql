-- VISTAS
-- Pueden crearse desde el entorno (Views)
-- Almacena una consulta en la base de datos de forma local y cuando ejecutamos la vista lo que hace es actualizarse y 
-- devolvernos los datos actualizados. Internamente sql guarda una copia de esta consulta para q el resultado sea más rádido

CREATE VIEW pacientesTurnosPendientes AS

SELECT p.nombre, p.idPaciente,p.apellido,T.idTurno, t.estado FROM Paciente P
INNER JOIN TurnoPacienteMedico TPM 
ON TPM.idPaciente = P.idPaciente
INNER JOIN Turno T 
ON T.idTurno = TPM.idTurno
WHERE ISNULL(T.estado,0) = 0

go 

-- Probamos la vista, mismo tratamiento que a cualquier tabla
SELECT * FROM pacientesTurnosPendientes

