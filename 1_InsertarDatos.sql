select * from Paciente;

INSERT INTO Paciente (dni, nombre, apellido, fNacimiento, domicilio, idPais, telefono, email, observacion)
VALUES (33434435,'Leandro','Paredes','1982-05-20' ,'Piedras 150','ARG',3434343556,'leandro@gmail.com'	,'sin Observacion'),
(33435435,'Jorge','Ramirez','2019-05-20','Piedras 30','ESP',346783556,'jorge@gmail.com','sin Observacion'),
(29083733,'Maria','Raton','2002-03-12','Calle 30 num 3','ARG',37982256,'maria@gmail.com','sin Observacion'),
(33492839,'Rosa','Miraflores','1989-10-10','Calle 33 num 30','MEX',35583546,'rosa@gmail.com','sin Observacion'),
(33435435,'Jose','Perez','1981-08-10','Almendrales 40','ESP',37789512,'jose@gmail.com','sin Observacion');


SELECT * FROM Pais
INSERT INTO Pais VALUES ('ESP', 'España');

SELECT * FROM TurnoEstado
INSERT INTO TurnoEstado VALUES ('Pendiente'),
                                ('Realizado'),
                                ('Cancelado'),
                                ('Rechazado'),
                                ('Postergado'),
                                ('Anulado'),
                                ('Derivado'),
                                ('Pendiente');

INSERT INTO TurnoEstado VALUES ('En Evaluación')  
DELETE TurnoEstado WHERE descripcion = 'En Evaluación'                             

SELECT * FROM Turno;
INSERT INTO Turno VALUES ('2023-02-14', 1, 'Paciente sin Ayunar'),
                            ('2029-01-22', 1, 'Turno Pendiente de Aprobacion'),
                            ('2019-02-18', 2, 'TPendiente de Análisis'),
                            ('2022-02-14', 3, 'Paciente sin Ayunar'),
                            ('2021-01-22', 6, 'Turno Pendiente de Aprobacion'),
                            ('2023-02-18', 6, 'Pendiente de Análisis');

SELECT * FROM Medico;
INSERT INTO Medico VALUES ('Pedro','Nocchi');

SELECT * FROM TurnoPacienteMedico;
INSERT INTO TurnoPacienteMedico VALUES (2,9,1),
                                        (3,10,2);
INSERT INTO TurnoPacienteMedico VALUES (1009,12,2);                                        

SELECT * FROM Concepto;    
INSERT INTO Concepto VALUES ('Laboratorio'),
                            ('Radiografía');

SELECT * FROM Pago;     
INSERT INTO Pago VALUES (1, 2019-02-15,4500, 0, 'Pago Pendiente'),
                        (2, 2019-05-20, 6800, 0, 'Pago Pndiente'),
                        (1, 2019-09-27,5600, 0, 'Pago Pendiente' );

SELECT * FROM PagoPaciente;    
INSERT INTO PagoPaciente VALUES (1,10,3),
                                (3,12,2),
                                (2,11,3);




