-- Operadores

DECLARE @num1 DECIMAL (9,2) = 20
DECLARE @num2 DECIMAL (9,2) = 30
DECLARE @texto1 VARCHAR (30) = 'Hola me llamo'
DECLARE @texto2 VARCHAR (30) = 'Jimena Gisele Cambronero'
DECLARE @result DECIMAL (9,2) 
DECLARE @result2 VARCHAR (30)


SET @result = @num1 + @num2
PRINT @result 

-- Podemos sumar texto
SET @result2 = @texto1 + ' ' + @texto2
PRINT @result2

SET @result =@num1 - @num2
PRINT @result

SET @result =@num1 / @num2
PRINT @result

SET @result =@num1 * @num2
PRINT @result

SET @result =@num2 % @num1
PRINT @result

-- Operadores Lógicos
IF @num2 < @num1
    PRINT 'Si es Menor'

IF @num2 <= @num1
    PRINT 'Si es Menor o igual'

IF @num2 > @num1
    PRINT 'No es Mayor'

IF @num1 <> @num2
    PRINT 'Si es distinto'

IF @texto1 > @texto2
    PRINT 'No es mayor, es mas corto'

IF @texto1 < @texto2
    PRINT 'Si, es menor, es mas corto'

IF @texto1 <> @texto2
    PRINT 'Si, son distintos'