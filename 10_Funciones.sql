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

-- Insertar 2 valores en Tabla Concepto
INSERT INTO Concepto values ('Laboratorio')
INSERT INTO Concepto values ('Radiología')

-- Insertar 3 valores en tabla Pago
INSERT into Pago values (2, '20240522',1200,'0', 'Pago realizado' )
INSERT INTO Pago values( 2, '20290215', 4500, 0, 'Pago Pendiente')
INSERT INTO Pago values( 13, '20190520', 6800, 0, 'Pago Pendiente')

-- Insertar 3 registros enn tabla pago paciente
INSERT INTO PagoPaciente values (1005, 1002, 3)
INSERT INTO PagoPaciente values (2, 10, 2)
INSERT INTO PagoPaciente values (1007, 12, 2010)


select * from Concepto
select * from Pago
