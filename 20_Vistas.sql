-- VISTAS
--Una vista en SQL es una tabla virtual que se deriva de una o más tablas existentes en una base de datos. 
--En lugar de almacenar los datos físicamente, una vista es una consulta predefinida que se puede utilizar para recuperar los datos de una o más tablas en una base de datos.
--Una vista se crea mediante una instrucción SELECT y puede contener cualquier cláusula válida de SQL, como WHERE, GROUP BY, ORDER BY y JOIN. Una vez creada la vista, se puede consultar como si fuera una tabla real, lo que significa que se pueden realizar consultas y aplicar filtros, y los resultados se devolverán como si se hubieran consultado directamente desde una tabla.
--Las vistas son útiles en situaciones en las que se requiere una consulta frecuente de una misma tabla o combinación de tablas, ya que pueden simplificar la consulta y reducir la complejidad de las consultas que se ejecutan con frecuencia. También se pueden utilizar para restringir el acceso a datos confidenciales o para proporcionar una capa adicional de seguridad en una base de datos.

-- Pueden crearse desde el entorno (Views)
-- Almacena una consulta en la base de datos de forma local y cuando ejecutamos la vista lo que hace es actualizarse y 
-- devolvernos los datos actualizados. Internamente sql guarda una copia de esta consulta para q el resultado sea más rádido

CREATE VIEW pacientesTurnosPendientes AS

SELECT p.nombre, p.idPaciente,p.apellido,T.idTurno, t.estado FROM Paciente P
INNER JOIN TurnoPacienteMedico TPM 
ON TPM.idPaciente = P.idPaciente
INNER JOIN Turno T 
ON T.idTurno = TPM.idTurno
WHERE ISNULL(T.estado,0) = 0

go 

-- Probamos la vista, mismo tratamiento que a cualquier tabla
SELECT * FROM pacientesTurnosPendientes

GO

-- EJEMPLO DE OTRA VISTA

CREATE VIEW VIEW_MedicosEspecialidades AS

select M.idmedico,M.nombre,M.apellido,ME.idEspecialidad,Me.descripcion from Medico M
inner join MedicoEspecialidad ME
on ME.idmedico = M.idMedico


-- Probamos la vista, mismo tratamiento que a cualquier tabla
select * from view_medicosEspecialidades