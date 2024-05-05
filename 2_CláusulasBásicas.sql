-- Clausulas Básicas en SQL

-- TOP
SELECT * FROM Paciente;

SELECT nombre, apellido
FROM Paciente; 

SELECT TOP 2 * 
FROM Paciente;

SELECT TOP 2 nombre, apellido 
FROM Paciente;

--ORDER BY
SELECT * FROM Paciente
ORDER BY fNacimiento;

SELECT * FROM Paciente
ORDER BY fNacimiento DESC;

SELECT * FROM Pago
ORDER BY fecha;

--Error de Tipeo se corrige
UPDATE Pago SET observación = 'Pago Pendiente' WHERE idPago = 2;

-- Combinando TOP y ORDER BY (obtener el paciente con la fecha de nacimiento más reciente y otra que devuelva al paciente más joven)

SELECT TOP 1 * FROM Paciente
ORDER BY fNacimiento DESC;

SELECT TOP 1 * FROM Paciente
ORDER By fNacimiento;

-- Cláusula DISTINCT (agrupamos por paises)

SELECT DISTINCT idPais
FROM Paciente;

SELECT DISTINCT fNacimiento
FROM Paciente; 

-- Cláusula GROUP BY (permite funciones de agregación)

SELECT idPais FROM Paciente
GROUP BY idPais;

-- Cláusula WHERE

SELECT * FROM Paciente
WHERE idPais = 'ARG';

SELECT * FROM Paciente
WHERE apellido = 'Perez';

SELECT * FROM Paciente
WHERE idPaciente = 10;

-- MAX Y MIN

SELECT * FROM pago;
SELECT MAX(fecha) FROM Pago;
SELECT MIN(monto) FROM Pago;

-- SUM (solo para campos de tipo numerico)

SELECT * FROM Pago;

SELECT SUM (monto) as Total_Monto 
FROM Pago;

--Suma 20 a cada monto 
SELECT SUM (monto + 20) as Total_Monto
FROM Pago;
--Suma 20 al monto final
SELECT SUM (monto) + 20 as Total_Monto
FROM Pago;

-- AVG
SELECT AVG(monto) as Promedio
FROM Pago;

-- COUNT (cuenta registros segun condición)
SELECT COUNT (idPaciente) as Pacientes FROM Paciente;
SELECT COUNT (apellido) AS PacientesParedes
FROM Paciente
WHERE apellido = 'Paredes';

-- HAVING (trabaja conjuntamente con la función COUNT y GROUP BY)-Se diferencia del WHERE en que este se aplica sobre un registro en particular, y el having sobre un conjunto de registros.
SELECT estado FROM Turno
GROUP BY estado
HAVING estado = 6;

SELECT estado FROM Turno
GROUP BY estado
HAVING COUNT(estado) = 2;

SELECT estado FROM Turno
GROUP BY estado
HAVING COUNT(estado) > 1;

-- OPERADORES LOGICOS 
SELECT * FROM Paciente;
SELECT * FROM Paciente WHERE nombre = 'Leandro' AND apellido = 'Paredes';
SELECT * FROM Paciente WHERE nombre = 'Leandro' OR idPaciente = 12;
SELECT * FROM Paciente WHERE nombre IN ('Jorge', 'Maria', 'Lucerna')
SELECT * FROM TURNO WHERE estado IN (1,2,3);

-- LIKE (filtra por caracteres)
SELECT * FROM Paciente WHERE nombre LIKE 'jor%';
SELECT * FROM Paciente WHERE nombre LIKE '%or%';

-- NOT (niega la condicion)
SELECT * FROM Paciente WHERE nombre NOT LIKE 'jor%';
SELECT * FROM Paciente WHERE nombre NOT IN ('Jorge', 'Maria', 'Lucerna')

-- BETWEEN (Filtra por determinado rango)
SELECT * FROM Turno WHERE fechaTurno BETWEEN '20190218' AND '20220218';
SELECT * FROM Turno WHERE idTurno BETWEEN 1000 and 1012;

