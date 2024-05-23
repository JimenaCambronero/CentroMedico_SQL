
ALTER PROC UPD_Turno(
    @idturno turno,
    @estado TINYINT,
    @observacion VARCHAR(300)
)
AS
SET NOCOUNT ON

if exists (SELECT * FROM Turno WHERE idTurno = @idturno)
        UPDATE Turno SET estado = @estado,
                    observacion = @observacion
         WHERE idTurno = @idturno
ELSE
    SELECT 0 AS resultado

go


EXEC UPD_Turno 2010, 0, 'Esperamdo estudios'

select* from Turno
select * from TurnoPacienteMedico