-- Que evento dispara un TRIGGERS
-- 1.- Insertamos datos
-- 2.- Actualizamos datos
-- 3.- Borramos datos
/*
--Creamos una tabla 
CREATE TABLE [dbo].[PacienteLog] (
    [idpaciente] INT      NOT NULL,
    [idpais]     CHAR (3) NULL,
    [fechaAlta]  DATETIME NULL,
    CONSTRAINT [PK_PacienteLog] PRIMARY KEY CLUSTERED ([idpaciente] ASC)
);
*/

-- TRIGGER DE TIPO INSERT
CREATE TRIGGER PacientesCreados On Paciente
AFTER INSERT
AS

IF (SELECT idpais FROM inserted) = 'MEX'
    INSERT into PacienteLog(idpaciente, idpais, fechaAlta)
        SELECT i.idpaciente, i.idpais, GETDATE() FROM inserted i

GO
--Insertamos un paciente para probar el trigger 
INSERT into Paciente VALUES('29999837', 'Juliana', 'Pez', '19850110', 'Alcan 33','MEX', 608999908, 'juliana@gmail.com', 'No tiene observaciones')

-- Comprobamos el Trigger
select * from PacienteLog

GO 
