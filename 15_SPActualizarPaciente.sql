ALTER PROC UPD_Paciente(
    @idpaciente paciente, 
    @nombre VARCHAR(50),
    @apellido VARCHAR(50), 
    @domicilio VARCHAR(50), 
    @email NVARCHAR(30)
)
AS
set NOCOUNT ON

if exists (SELECT * from Paciente
            where idPaciente = @idpaciente)
    UPDATE Paciente SET nombre = @nombre,
                        apellido = @apellido,
                        domicilio = @domicilio,
                        email = @email
    where idPaciente = @idpaciente
    else 
        SELECT 0 as resultado

--select * from Paciente

EXEC UPD_Paciente 1002, 'Maria', 'Magdale', 'calle MICALLE 33', 'mariamagdalena@gmail.com'