-- Programación de SP para Insertar Pacientes
CREATE PROC ALTA_Paciente (
                        @dni varchar(20),
                        @nombre varchar(20),
                        @apellido varchar(50),
                        @fNacimiento varchar(8),
                        @domicilio varchar(50),
                        @idPais char(3),
                        @telefono varchar(20) = '',
                        @email varchar (30),
                        @observacion varchar(100) = ''
                    )
as 

-- Para moficicar el Procedimiento Almacenado usamos ALTER(cambiamos observacion varchar 100 a 1000)
SELECT * FROM Paciente

EXEC ALTA_Paciente '25083729', 'Juana', 'Palma', 20050518, 'calle 89', 'ARG', 'juana@gmail.com',''
go
ALTER PROC ALTA_Paciente (
                        @dni varchar(20),
                        @nombre varchar(20),
                        @apellido varchar(50),
                        @fNacimiento varchar(8),
                        @domicilio varchar(50),
                        @idPais char(3),
                        @telefono varchar(20) = '',
                        @email varchar (30),
                        @observacion varchar(1000) = ''
                    )
as 

IF NOT EXISTS (SELECT * FROM Paciente WHERE dni=@dni)
BEGIN
    INSERT INTO Paciente (dni, nombre, apellido, fNacimiento,domicilio,idPais, telefono, email, observacion)
    VALUES (@dni, @nombre, @apellido, @fNacimiento,@domicilio,@idPais,@telefono,@email,@observacion)
    PRINT 'El Paciente fue agregado correctamente'
    RETURN
END
BEGIN
    PRINT 'El paciente ya existe'
    RETURN
END
GO 