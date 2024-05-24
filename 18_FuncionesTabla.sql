-- Funciones Tipo TABLA: Retorna una tabla

CREATE FUNCTION listaPaises()
RETURNS @paises TABLE(idPais char(3), 
                    pais VARCHAR(50))

AS
BEGIN
    INSERT into @paises VALUES ('MEX','México')
    INSERT into @paises VALUES ('ARG','Argentina')
    INSERT into @paises VALUES ('CHI','Chile')
    INSERT into @paises VALUES ('PER','Perú')
    INSERT into @paises VALUES ('ESP','España')

    RETURN 
END              

GO
SELECT * FROM listaPaises()

