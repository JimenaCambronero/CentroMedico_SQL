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
DECLARE @var1 VARCHAR(20);
DECLARE @var2 VARCHAR(20);

SET @var1 = 'Juana';
SET @var2 = 'Perez';

print LEFT (@var1,2)
print RIGHT (@var1,2)
PRINT LEFT (@var1,5) + LEFT (@var2,1)

--LEN
DECLARE @var1 VARCHAR(20);
SET @var1 = 'Juana';
PRINT LEN(@var1)

-- Ejemplo
-- Obtener un listado de las iniciales de los pacientes, leyendo los campos nombre y apellido, utilizando la función LEFT y el operador + para concatenar las iniciales y obtener el resultado.
SELECT Nombre, Apellido,
LEFT (Nombre, 1) + LEFT (Apellido,1)
FROM Paciente;

-- Obtener un listado de la cantidad de caracteres que tiene el campo domicilio en la tabla paciente
SELECT domicilio,
LEN(domicilio)
FROM Paciente


DECLARE @var1 VARCHAR(20);
DECLARE @var2 VARCHAR(20);

SET @var1 = 'Juana';
SET @var2 = 'Perez';

PRINT LOWER(@var1)
PRINT UPPER(@var1)

--REPLACE
DECLARE @var3 VARCHAR(20)

SET @var3 = 'Juan"a  '
SELECT REPLACE(@var3, '"','')

--REPLICATE
PRINT REPLICATE(0,5)

--LTRIM y RTRIM eliminar espacios
DECLARE @var5 VARCHAR(20)
DECLARE @var6 VARCHAR(20)

SET @var5 = '   Juana'
SET @var6 = 'Perez   '

SELECT LTRIM(@var5) + ' ' + @var6 + '*'
SELECT LTRIM(@var5) + ' ' + RTRIM(@var6) + '*'

--CONCAT
DECLARE @var1 VARCHAR(20);
DECLARE @var2 VARCHAR(20);

SET @var1 = 'Juana';
SET @var2 = 'Perez';

SELECT concat(@var1,' ' ,@var2)

--GETDATE y GETUTCDATE
SELECT GETDATE()
SELECT GETUTCDATE()

--DATEADD, permite agregar intervalos en fechas(dias, meses, años)
--ejemplo, sumamos dos dias a la fecha de hoy
SELECT DATEADD(day,2,GETDATE())

--ejemplo, sumamos dos hs a la fecha de hoy
SELECT DATEADD(HOUR,2,GETDATE())

--DATEDIFF , diferencia de años
SELECT DATEDIFF(year, GETDATE(), '20170120')
--ejemplo diferencia de meses
SELECT DATEDIFF(month, GETDATE(), '20170120')

--DATEPART, intervalo especifico de fecha
SELECT DATEPART(dw,GETDATE())

SELECT DATEPART(YEAR,GETDATE())

--CAST y CONVERT, la segunda es mas amplia
DECLARE @numero money
SET @numero= 500.40
print(@numero)

SELECT CAST(@numero as INT) AS Numero

SELECT CAST(idPaciente as money) FROM Paciente;
GO

--convert
DECLARE @numero2 money
SET @numero2 = 500.40

SELECT CONVERT(int, @numero2)

DECLARE @fecha DATETIME
SET @fecha = GETDATE()

SELECT CONVERT(char(8), @fecha) as fecha_cortada_por_parametro -- 104 111 
SELECT CONVERT(char(8), @fecha, 114)