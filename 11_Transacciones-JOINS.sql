-- TRANSACCIONES (Como podemos aplicar la estructura de transacciones para un script determinado o para incluirla dentro de un gestor, 
-- normalmente se utiliza para evaluar una porción de código en la que estamos actualizando datos o borrando datos.)

SELECT * FROM Paciente;

BEGIN TRANSACTION
    UPDATE paciente SET telefono = 4444444 WHERE idPaciente = 9
    
IF @@ROWCOUNT = 1   
    COMMIT TRANSACTION
ELSE 
    ROLLBACK TRANSACTION -- cancela la transacción

---------------------------------

-- JOINS
-- INNER JOIN

SELECT * FROM Paciente as p 
INNER JOIN TurnoPacienteMedico as t
ON t.idPaciente = p.idPaciente;

-- LEFT JOIN (registros de la izq y los q coindicen de la derecha)
SELECT * FROM Paciente as p 
LEFT JOIN TurnoPacienteMedico as t 
ON t.idPaciente = p.idPaciente

-- RIGHT JOIN
SELECT * FROM Paciente as p 
RIGHT JOIN TurnoPacienteMedico as t 
ON t.idPaciente = p.idPaciente

-- COnsideraciones en sql para joins
-- cdo realizamos un inner tenemos que asegurarnos la conección siempre con las PK. 
-- Siempre se aconseja que el primer campo de la cláusula ON sea en de la tabla inmediata por la que estoy haciendo la conexión. 
-- Utilizar alias de tabla para evitar errores.

-- UNION requiere que ambos SELECT sean los mismos y tengas los mismos tipos de datos
SELECT * FROM turno where estado = 1
UNION
SELECT * FROM turno where estado = 2

-- Registros sin repeticiones
SELECT * FROM turno 
UNION 
SELECT * FROM turno 

--Registros totales 
SELECT * FROM turno 
UNION ALL
SELECT * FROM turno 

SELECT idTurno from Turno WHERE estado = 3
UNION
SELECT idPaciente FROM Paciente