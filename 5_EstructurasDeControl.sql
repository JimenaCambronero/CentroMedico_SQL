-- Subconsultas, cuando hacemos subconsultas debemos asignarle un alias a cada tabla para  que la consulta se realice correctamente y no haya confusion al momento de buscar los datos.

SELECT apellido, nombre, idPais,
    (SELECT pais FROM Pais as ps WHERE pa.idPais=ps.idPais)
FROM Paciente as pa WHERE idPaciente = 10;

-- Estructuras de Control
-- IF

-- declaramos una variable

DECLARE @idPaciente int
set @idPaciente = 12

IF @idPaciente = 12
    SELECT * FROM Paciente WHERE idPaciente = @idPaciente;


DECLARE @idPaciente2 INT
DECLARE @idTurno INT
SET @idPaciente2 = 10 
SET @idTurno = 4

IF @idTurno = 4
    SELECT idPaciente, nombre, apellido, dni FROM Paciente WHERE idPaciente = @idPaciente2
    PRINT @idTurno;


DECLARE @idPaciente3 INT
DECLARE @idTurno2 INT
SET @idPaciente3 = 11 

IF @idPaciente3 = 111
BEGIN
    SET @idTurno2 = 2
    SELECT idPaciente, nombre, apellido, dni FROM Paciente WHERE idPaciente = @idPaciente3
    PRINT @idTurno2;
END
ELSE
BEGIN
     PRINT 'La condicion no se cumple'
END

select * from Turno

-- EXISTS (al usarla con un condicional la funcion EXISTS nos va a permitir evaluarsi existe un grupo de registros de determinada consulta)

IF EXISTS 
    (SELECT * FROM Paciente WHERE idPaciente = 12)
BEGIN 
    SELECT 'Existe' 
END
ELSE
BEGIN
    SELECT 'No existe'
END;

SELECT * FROM Paciente

-- ESTRUCTURA WHILE (ejecuta un codigo hasta que cierta condición se cumpla)

DECLARE @contador INT = 0
WHILE @contador <= 10
BEGIN
    print @contador 
    SET @contador = @contador + 1
END

-- CASE -- Se puede utilizar por ejemplo en un select
DECLARE @valor INT
DECLARE @resultado CHAR (10) = ''
SET @valor = 30

SET @resultado = (CASE WHEN @valor = 10 THEN 'DIEZ'
                        WHEN  @valor = 20 THEN 'VEINTE'
                        WHEN @valor = 30 THEN 'TREINTA'
                        WHEN @valor = 40 THEN 'CUARENTA'
                END )
PRINT @resultado

-- Ejemplo con SELECT 

SELECT *,
    (CASE 
        WHEN estado = 1 THEN 'Rojo'
        WHEN estado = 2 THEN 'Verde'
        WHEN estado = 3 THEN 'Azul'
        WHEN estado = 6 THEN 'Amarillo'
        ELSE 'GRIS'
    END) AS ColoreTurno
FROM Turno;

-- RETURN (sale forzosamente del script) 

DECLARE @contador2 INT = 0
WHILE @contador2 < 5
BEGIN
    PRINT @contador2
    SET @contador2 = @contador2 + 1
    IF @contador2 = 3
    RETURN
    PRINT 'Hola'   
END
PRINT 'Hola no ejecuto'  

-- BREAK
DECLARE @contador3 INT = 0
WHILE @contador3 < 5
BEGIN
    PRINT @contador3
    SET @contador3 = @contador3+ 1
    IF @contador3 = 3
    BREAK  
END
PRINT 'Hola siguo ejecutando'   

-- TRY CACH (Manejo de errores en tiempo de ejecución)

DECLARE @variable INT
BEGIN TRY
    SET @variable = 'Texto'
END TRY
BEGIN CATCH
    print 'No podemos asignar un texto a la variable contador por ser INT'
END CATCH