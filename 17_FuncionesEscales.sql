-- Funciones ESCALARES: Permiten recibir uno o mas valores y devolver un valor de un tipo especifico, 
-- realizar calculos con ese parametro y devolver su valor

--EJEMPLO 1
--Devolver apellido y nombre del paciente

CREATE FUNCTION concatenar (@apellido varchar (50),
                            @nombre varchar (50)
                            )

RETURNS varchar(100)

AS
BEGIN
    DECLARE @resultado VARCHAR (100)
    set @resultado =  @apellido + ', ' + @nombre
    RETURN @resultado
END

go
SELECT dbo.concatenar ('Lopez', 'Roberto') as Apellido_Nombre
GO

--EJEMPLO 2
-- Obtener datos de la Tabla.
-- select * from paciente

SELECT dbo.obtenerPais (9) As Pais

GO
CREATE FUNCTION obtenerPais(
                @idpaciente paciente
)
RETURNS VARCHAR (50)

AS

BEGIN
    DECLARE @pais VARCHAR (50)
    set @pais = (SELECT p.pais FROM Paciente pa
                INNER JOIN Pais p
                ON p.idPais = pa.idPais
                WHERE idPaciente = @idpaciente)
    RETURN @pais
END