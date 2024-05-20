-- Programación de SP para Insertar Médico en las tablas Medico y MedicoEspecialidad

CREATE PROC ALTA_Medico
    (
        @nombre VARCHAR(50),
        @apellido VARCHAR(50),
        @idEspecielidad INT,
        @descripcion VARCHAR(50)
    )

AS
GO

EXEC ALTA_Medico 'Ismael', 'Ronchoa', 7, 'sin descripción'

go

ALTER PROC ALTA_Medico
    ( 
        @nombre VARCHAR(50),
        @apellido VARCHAR(50),
        @idEspecialidad INT,
        @descripcion VARCHAR(50)
    )
AS

SET NOCOUNT ON

IF NOT EXISTS (SELECT TOP 1 idMedico FROM Medico WHERE nombre = @nombre AND apellido = @apellido)

BEGIN
    INSERT INTO Medico (nombre, apellido)
    VALUES (@nombre, @apellido)

    DECLARE @auxIdMedico INT
    SET @auxIdMedico = @@IDENTITY

    INSERT INTO MedicoEspecialidad (idMedico, idEspecialidad, descripcion)
    VALUES (@auxIdMedico, @idEspecialidad, @descripcion)

    print 'El Médico fue agregado correctamente'
    RETURN

END
BEGIN
    PRINT 'El Medico ya existe'
END
GO


select *from Especialidad
select * from  Medico
SELECT * from MedicoEspecialidad
