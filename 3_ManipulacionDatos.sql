--Manipulación de Registros

--UPDATE ( actualizar datos en tablas)
SELECT * FROM Paciente;

UPDATE Paciente SET observacion = 'Con Observaciones' WHERE idPaciente > 11;
UPDATE Paciente SET telefono = 604936980 WHERE idPaciente = 9;

--DELETE (eliminamos un registro)
DELETE FROM Paciente WHERE idPaciente = 13;


SELECT * FROM TurnoPacienteMedico;

-- Si Intentamos eliminar este Registro no podremos, las restricciones no lo permitiran.
DELETE FROM Paciente WHERE idPaciente = 12;

-- Si eliminamos el turnoPacienteMedico podremos eliminar el regitro
SELECT * FROM TurnoPacienteMedico;
DELETE FROM TurnoPacienteMedico WHERE idTurno = 1009;

--Ahora debemos eliminar el registro de la tabla turno
SELECT * FROM Turno;
DELETE FROM Turno WHERE idTurno = 1009;

