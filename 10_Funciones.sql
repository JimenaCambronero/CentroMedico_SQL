-- Modificar Tablas
-- Agragación

ALTER TABLE Paciente ADD estado SMALLINT

-- modificamos esa columna 
ALTER TABLE Paciente ALTER COLUMN estado bit

-- lo eliminamos
ALTER TABLE Paciente DROP COLUMN estado

-- Alter Table y FK

ALTER TABLE Paciente ADD FOREIGN KEY (idPais) REFERENCES Pais (idPais)
ALTER TABLE HistoriaPacienteMedico ADD FOREIGN KEY (idPaciente) REFERENCES Paciente(idPaciente)

GO

-- Sentencia Create Function
CREATE FUNCTION nombrefun (@var int)
RETURNS INT

AS 
BEGIN
    set @var = @var * 5
    RETURN @var

END

go

SELECT dbo.nombrefun(256)

-- DROP

--Tabla ejemplo
-- Creamos una tabla
CREATE TABLE tablaejemplo (campo0 int IDENTITY (1,1) ,campo1 int, campo2 int)

--Insertamos Valores
INSERT INTO tablaejemplo values (2,3)
SELECT * FROM tablaejemplo

--TRUNCATE
TRUNCATE TABLE tablaejemplo

DROP TABLE tablaejemplo

--Funciones 
-- LEFT (toma los x primeros caracteres, en este caso 2 de la IZQUIERDA) 
-- RIGHT (toma los x primeros caracteres, en este caso 2 de la DERECHA)
DECLARE @var1 VARCHAR(20)
DECLARE @var2 VARCHAR(20)

SET @var1 = 'Juana'
SET @var2 = 'Perez'
print LEFT (@var1,2)
print RIGHT (@var1,2)
PRINT LEFT (@var1,5) + LEFT (@var2,1)

-- Ejemplo
-- Obtener un listado de las iniciales de los pacientes, leyendo los campos nombre y apellido, utilizando la función LEFT y el operador + para concatenar las iniciales y obtener el resultado.
SELECT Nombre, Apellido,
LEFT (Nombre, 1) + LEFT (Apellido,1)
FROM Paciente;


