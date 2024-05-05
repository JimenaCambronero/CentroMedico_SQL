-- STORE PROCEDURE Conjunto de instrucciones almacenados que tiene un conjunto de procedimientos que se ejecutará cuando lo llame. Sirve para insertar, borrar y actualizar. 

-- Estructura
CREATE PROC SP_paciente(
        @idPaciente  int 
)
AS
SELECT * FROM Paciente WHERE idPaciente = @idPaciente
GO

-- Ejemplo de Ejecución

EXEC SP_paciente 12;


-- Nuevo SP. Lo creamos y luego lo modificamos para declarar una variable

ALTER PROC SP_paciente2(
        @idPaciente  int       
)
AS 
DECLARE @ordenamiento CHAR(1) = 'A'

SELECT nombre, apellido, observacion FROM Paciente WHERE idPaciente = @idPaciente
GO

ALTER PROC SP_paciente2(
        @idPaciente int       
)
AS 
DECLARE @ordenamiento CHAR(1) 
DECLARE @valorOrdenamiento CHAR(1)


SET @valorOrdenamiento = ISNULL(@ordenamiento,'A')
PRINT @valorOrdenamiento

SELECT nombre, apellido, observacion FROM Paciente WHERE idPaciente = @idPaciente
GO

EXEC SP_paciente2 12;

