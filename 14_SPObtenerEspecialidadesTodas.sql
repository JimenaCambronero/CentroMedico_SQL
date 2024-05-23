

CREATE PROC SELECT_EspecialidadesMedicas

AS
set NOCOUNT ON

if exists(select * FROM Especialidad)
    SELECT * FROM Especialidad
else
    SELECT 0 as resultado

EXEC SELECT_EspecialidadesMedicas