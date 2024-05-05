DROP database IF exists TORNEO_FUTBOL;

CREATE DATABASE TORNEO_FUTBOL;
USE TORNEO_FUTBOL;

CREATE TABLE IF NOT EXISTS TORNEO (
ID_TORNEO INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
NOMBRE_TORNEO varchar(100),
SEDES varchar(100),
EQUIPOS varchar(100),
ARBITROS varchar(100)
);

CREATE TABLE IF NOT EXISTS SEDE (
ID_SEDE INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
ID_TORNEO int,
DIRECCION varchar(100),
APROBADA boolean,
FOREIGN KEY (ID_TORNEO) REFERENCES TORNEO (ID_TORNEO)
);

CREATE TABLE IF NOT EXISTS ARBITROS (
ID_ARBITRO INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
ID_TORNEO int,
NOMBRE_APELLIDO_ARB varchar(100),
TELEFONO varchar(100),
APTO_FISICO_ARB boolean,
FOREIGN KEY (ID_TORNEO) REFERENCES TORNEO (ID_TORNEO)
);

CREATE TABLE IF NOT EXISTS EQUIPOS (
ID_EQUIPO INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
ID_TORNEO int,
NOMBRE_EQUIPO varchar(100),
INSCRIPCION boolean,
FOREIGN KEY (ID_TORNEO) REFERENCES TORNEO (ID_TORNEO)
);

CREATE TABLE IF NOT EXISTS JUGADORES (
ID_JUGADOR INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
ID_EQUIPO int,
CAPITAN boolean,
NOMBRE_APELLIDO_JUG varchar(100),
EDAD varchar(100),
GENERO varchar(100),
APTO_FISICO_JUG boolean,
GOLES int,
TARJETAS_AMARILLAS int,
TARJETAS_ROJAS int,
FOREIGN KEY (ID_EQUIPO) REFERENCES EQUIPOS (ID_EQUIPO)
);

CREATE TABLE IF NOT EXISTS FIXTURE (
ID_PARTIDO INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
FECHA varchar(100),
ID_TORNEO int,
ID_SEDE int,
ID_ARBITRO int,
ID_EQUIPO_L int,
ID_EQUIPO_V int,
RESULTADO varchar(100),
FOREIGN KEY (ID_TORNEO) REFERENCES TORNEO (ID_TORNEO),
FOREIGN KEY (ID_SEDE) REFERENCES SEDE (ID_SEDE),
FOREIGN KEY (ID_ARBITRO) REFERENCES ARBITROS (ID_ARBITRO),
FOREIGN KEY (ID_EQUIPO_L) REFERENCES EQUIPOS (ID_EQUIPO),
FOREIGN KEY (ID_EQUIPO_V) REFERENCES EQUIPOS (ID_EQUIPO)
);

INSERT INTO TORNEO 
(ID_TORNEO, NOMBRE_TORNEO, SEDES, EQUIPOS, ARBITROS) 
VALUES 
(1,'Liga Masculina', 'Estadio Monumental, Estadio Libertadores de América', 'Boca Juniors, River Plate, Racing Club, San Lorenzo, Rosario Central, Lanús', 'Néstor Pitana, Patricio Loustau, Facundo Tello'),
(2,'Liga Femenina', 'Estadio Monumental, Estadio Libertadores de América', 'Independiente, Vélez Sarsfield, Huracán, Banfield, Gimnasia y Esgrima La Plata, Defensa y Justicia', 'Florencia Romano, María Eugenia Rocco, Paula Oliveto');

INSERT INTO SEDE 
(ID_SEDE, ID_TORNEO, DIRECCION, APROBADA) 
VALUES
(1, 1, 'Av. Figueroa Alcorta 7597, Buenos Aires', true),
(2, 2, 'Av. Avellaneda 1249, Avellaneda', true);


INSERT INTO ARBITROS 
(ID_ARBITRO, ID_TORNEO, NOMBRE_APELLIDO_ARB, TELEFONO, APTO_FISICO_ARB) 
VALUES
(10, 1, 'Néstor Pitana', '15-1234-5678', false),
(11, 1, 'Patricio Loustau', '15-8765-4321', true),
(12, 1, 'Facundo Tello', '15-2468-1357', true),
(20, 2, 'Florencia Romano', '15-9876-5432', true),
(21, 2, 'María Eugenia Rocco', '15-6543-2109', true),
(22, 2, 'Paula Oliveto', '15-4567-8901', false);

INSERT INTO EQUIPOS 
(ID_EQUIPO, ID_TORNEO, NOMBRE_EQUIPO, INSCRIPCION) 
VALUES
(100, 1, 'Boca Juniors', true),
(101, 1, 'River Plate', true),
(102, 1, 'Racing Club', true),
(103, 1, 'San Lorenzo', true),
(104, 1, 'Rosario Central', true),
(105, 1, 'Lanús', true),
(200, 2, 'Independiente', true),
(201, 2, 'Vélez Sarsfield', true),
(202, 2, 'Huracán', true),
(203, 2, 'Banfield', true),
(204, 2, 'Gimnasia y Esgrima La Plata', true),
(205, 2, 'Defensa y Justicia', true);

INSERT INTO JUGADORES
(ID_JUGADOR,ID_EQUIPO,CAPITAN,NOMBRE_APELLIDO_JUG,EDAD,GENERO,APTO_FISICO_JUG,GOLES,TARJETAS_AMARILLAS,TARJETAS_ROJAS)
VALUES
(1,100,true,'Juan Perez','20','Masculino',true,10,2,0),
(2,101,false,'Carlos Gonzalez','30','Masculino',false,15,1,0),
(3,102,false,'Luis Hernandez','29','Masculino',true,8,3,0),
(4,103,false,'Diego Lopez','26','Masculino',false,5,0,1),
(5,104,false,'Javier Fernandez','32','Masculino',true,20,4,0),
(6,105,false,'Miguel Torres','28','Masculino',false,12,2,0),
(7,200,true,'Maria Rodriguez','25','Femenino',true,7,1,0),
(8,201,false,'Ana Martinez','22','Femenino',true,4,0,0),
(9,202,false,'Laura Garcia','23','Femenino',true,6,2,0),
(10,203,false,'Sofia Perez','18','Femenino',false,3,0,0),
(11,204,false,'Lucia Sanchez','24','Femenino',true,10,1,0),
(12,205,false,'Elena Ramirez','19','Femenino',false,2,0,0),
(13,100,false,'Alejandro Gomez','27','Masculino',true,9,2,0),
(14,101,false,'Daniel Jimenez','31','Masculino',false,13,2,1),
(15,102,false,'Pedro Castro','33','Masculino',true,18,3,0),
(16,103,false,'Jorge Morales','29','Masculino',false,7,1,0),
(17,104,false,'Pablo Serrano','22','Masculino',true,5,1,0),
(18,105,false,'Raul Medina','35','Masculino',true,25,5,0),
(19,100,false,'Alberto Vega','27','Masculino',false,4,0,0),
(20,101,false,'Gonzalo Molina','20','Masculino',true,3,0,0),
(21,102,false,'Eduardo Herrera','25','Masculino',true,11,2,0),
(22,103,false,'Fernando Aguilar','28','Masculino',false,14,1,1),
(23,104,false,'Gabriel Torres','30','Masculino',true,16,3,0),
(24,105,false,'Manuel Morales','26','Masculino',false,8,1,0),
(25,100,false,'Victor Soto','27','Masculino',true,10,2,0),
(26,101,false,'Francisco Reyes','20','Masculino',true,6,1,0),
(27,102,false,'Antonio Rivera','23','Masculino',false,3,0,0),
(28,103,false,'Juan Carlos Moya','25','Masculino',false,7,1,0),
(29,104,false,'David Ramos','19','Masculino',true,4,0,0),
(30,105,false,'Oscar Vargas','30','Masculino',true,19,4,0),
(31,200,false,'Ana Beltran','34','Femenino',false,8,2,0),
(32,201,false,'Maria Jose Gomez','33','Femenino',true,12,2,0),
(33,202,false,'Patricia Marquez','26','Femenino',false,9,1,0),
(34,203,false,'Clara Ruiz','30','Femenino',true,15,2,0),
(35,204,false,'Alba Molina','23','Femenino',true,11,1,0),
(36,205,false,'Sara Lopez','27','Femenino',false,6,1,0),
(37,100,false,'Paula Castro','31','Femenino',true,17,3,0),
(38,101,false,'Silvia Sanchez','28','Femenino',true,14,2,0),
(39,102,false,'Elena Dominguez','29','Femenino',false,10,1,0),
(40,103,false,'Laura Guerrero','32','Femenino',true,20,3,0),
(41,104,false,'Cristina Castro','18','Femenino',false,5,0,0),
(42,105,false,'Monica Suarez','24','Femenino',true,13,2,0),
(43,200,false,'Marina Gutierrez','21','Femenino',false,6,1,0),
(44,201,false,'Beatriz Delgado','22','Femenino',false,3,0,0),
(45,100,false,'Lorenzo Gomez','24','Masculino',false,0,0,0),
(46,101,false,'Santiago Ruiz','31','Masculino',true,9,2,0),
(47,102,false,'Mateo Martinez','28','Masculino',false,12,1,0),
(48,103,false,'Nicolas Diaz','22','Masculino',false,7,1,0),
(49,104,false,'Andres Perez','27','Masculino',false,5,0,1),
(50,105,false,'Jose Gonzalez','29','Masculino',false,8,1,0),
(51,200,false,'Laura Martinez','22','Femenino',true,5,1,0),
(52,201,false,'Carla Lopez','28','Femenino',false,8,2,0),
(53,202,false,'Eva Fernandez','25','Femenino',true,12,1,0),
(54,203,false,'Martina Garcia','29','Femenino',true,15,2,0),
(55,204,false,'Adriana Ruiz','27','Femenino',false,10,1,0),
(56,205,false,'Rocio Torres','24','Femenino',true,13,2,1),
(57,100,false,'Alejandro Gonzalez','26','Masculino',true,9,2,2),
(58,101,false,'Luis Martinez','30','Masculino',false,13,2,1),
(59,102,false,'Carlos Rodriguez','28','Masculino',true,18,3,0),
(60,103,false,'Pedro Serrano','31','Masculino',false,7,1,0);

INSERT INTO FIXTURE 
(ID_PARTIDO, FECHA, ID_TORNEO, ID_SEDE, ID_ARBITRO, ID_EQUIPO_L, ID_EQUIPO_V, RESULTADO)  
VALUES  
(1000, '2024-05-01', 1, 1, 10, 100, 101, '3-1'),
(1001, '2024-05-02', 1, 2, 11, 102, 103, '1-2'),
(1002, '2024-05-03', 1, 1, 12, 104, 105, '2-0'),
(2000, '2024-05-01', 2, 1, 20, 200, 201, '4-0'),
(2001, '2024-05-02', 2, 2, 21, 202, 203, '2-2'),
(2002, '2024-05-03', 2, 1, 22, 204, 205, '3-1');

USE TORNEO_FUTBOL;
-- Se crea una vista para ver el total de goles de cada equipo, se ordena por orden descendente.
-- Los datos se toman de los goles individuales de cada jugador.

CREATE VIEW SUMA_GOLES_EQUIPO AS
SELECT 
    	J.ID_EQUIPO
    ,	E.NOMBRE_EQUIPO
    ,	SUM(J.GOLES) AS TOTAL_GOLES
FROM 
    JUGADORES J
JOIN 
    EQUIPOS E ON J.ID_EQUIPO = E.ID_EQUIPO
GROUP BY 
    J.ID_EQUIPO, E.NOMBRE_EQUIPO;
    
SELECT 
* FROM SUMA_GOLES_EQUIPO
ORDER BY TOTAL_GOLES DESC;


CREATE VIEW Top10_Masculino_Amarillas AS
SELECT j.NOMBRE_APELLIDO_JUG, j.TARJETAS_AMARILLAS
FROM JUGADORES j
JOIN EQUIPOS e ON j.ID_EQUIPO = e.ID_EQUIPO
JOIN TORNEO t ON e.ID_TORNEO = t.ID_TORNEO
WHERE t.NOMBRE_TORNEO LIKE '%Masculino%'
ORDER BY j.TARJETAS_AMARILLAS DESC
LIMIT 10;

CREATE VIEW Top10_Masculino_Rojas AS
SELECT j.NOMBRE_APELLIDO_JUG, j.TARJETAS_ROJAS
FROM JUGADORES j
JOIN EQUIPOS e ON j.ID_EQUIPO = e.ID_EQUIPO
JOIN TORNEO t ON e.ID_TORNEO = t.ID_TORNEO
WHERE t.NOMBRE_TORNEO LIKE '%Masculino%'
ORDER BY j.TARJETAS_ROJAS DESC
LIMIT 10;


CREATE VIEW Top10_Femenino_Amarillas AS
SELECT j.NOMBRE_APELLIDO_JUG, j.TARJETAS_AMARILLAS
FROM JUGADORES j
JOIN EQUIPOS e ON j.ID_EQUIPO = e.ID_EQUIPO
JOIN TORNEO t ON e.ID_TORNEO = t.ID_TORNEO
WHERE t.NOMBRE_TORNEO LIKE '%Femenino%'
ORDER BY j.TARJETAS_AMARILLAS DESC
LIMIT 10;


CREATE VIEW Top10_Femenino_Rojas AS
SELECT j.NOMBRE_APELLIDO_JUG, j.TARJETAS_ROJAS
FROM JUGADORES j
JOIN EQUIPOS e ON j.ID_EQUIPO = e.ID_EQUIPO
JOIN TORNEO t ON e.ID_TORNEO = t.ID_TORNEO
WHERE t.NOMBRE_TORNEO LIKE '%Femenino%'
ORDER BY j.TARJETAS_ROJAS DESC
LIMIT 10;



-- Se crean dos funciones, cada una suma la cantidad de goles de los equipos masculinos y femeninos.
USE TORNEO_FUTBOL;
DELIMITER //

CREATE FUNCTION sumar_goles_masculino()
RETURNS INT
DETERMINISTIC
BEGIN
    DECLARE total_goles INT;
    SELECT SUM(GOLES) INTO total_goles FROM JUGADORES WHERE GENERO = 'Masculino';
    RETURN total_goles;
END //

CREATE FUNCTION sumar_goles_femenino()
RETURNS INT
DETERMINISTIC
BEGIN
    DECLARE total_goles INT;
    SELECT SUM(GOLES) INTO total_goles FROM JUGADORES WHERE GENERO = 'Femenino';
    RETURN total_goles;
END //
DELIMITER ;

SELECT 
sumar_goles_masculino() AS total_goles_masculino;

SELECT 
sumar_goles_femenino() AS total_goles_femenino;


-- Se crea las tablas de goleadores para el Torneo masculino
USE TORNEO_FUTBOL;
DELIMITER //
CREATE PROCEDURE ObtenerTopGoleadoresMasculinos(IN torneo_id INT)
BEGIN
    DROP TABLE IF EXISTS TempGoleadoresMasculinos;
    
    CREATE TEMPORARY TABLE TempGoleadoresMasculinos (
			ID_JUGADOR INT
		,	NOMBRE_APELLIDO_JUG VARCHAR(100)
        ,	GOLES INT
    );

    INSERT INTO TempGoleadoresMasculinos (ID_JUGADOR, NOMBRE_APELLIDO_JUG, GOLES)
    SELECT ID_JUGADOR, NOMBRE_APELLIDO_JUG, GOLES
    FROM JUGADORES
    WHERE 1 = 1
    AND ID_EQUIPO 
    IN (SELECT ID_EQUIPO FROM EQUIPOS WHERE ID_TORNEO = torneo_id)
    AND GENERO = 'Masculino'
    ORDER BY GOLES DESC
    LIMIT 10;
    
    SELECT 
    * FROM TempGoleadoresMasculinos;
    
    DROP TABLE IF EXISTS TempGoleadoresMasculinos;
END //

DELIMITER ;

CALL ObtenerTopGoleadoresMasculinos(1);

-- Se crea las tablas de goleadores para el Torneo femenino
USE TORNEO_FUTBOL;
DELIMITER //
CREATE PROCEDURE ObtenerTopGoleadoresFem(IN torneo_id INT)
BEGIN
    DROP TABLE IF EXISTS TempGoleadoresFem;
    
    CREATE TEMPORARY TABLE TempGoleadoresFem (
			ID_JUGADOR INT
		,	NOMBRE_APELLIDO_JUG VARCHAR(100)
        ,	GOLES INT
    );

    INSERT INTO TempGoleadoresFem (ID_JUGADOR, NOMBRE_APELLIDO_JUG, GOLES)
    SELECT ID_JUGADOR, NOMBRE_APELLIDO_JUG, GOLES
    FROM JUGADORES
    WHERE 1 = 1
    AND ID_EQUIPO 
    IN (SELECT ID_EQUIPO FROM EQUIPOS WHERE ID_TORNEO = torneo_id)
    AND GENERO = 'Femenino'
    ORDER BY GOLES DESC
    LIMIT 10;
    
    SELECT 
    * FROM TempGoleadoresFem;
    
    DROP TABLE IF EXISTS TempGoleadoresFem;
END //
DELIMITER ;

CALL ObtenerTopGoleadoresFem(2);

-- Se crea el TRIGGER que actualiza el estado del arbitro segun el Apto_Fisico_Arb

DELIMITER $$
CREATE TRIGGER actualizar_estado_arbitro
BEFORE INSERT ON ARBITROS
FOR EACH ROW
BEGIN
    IF NEW.APTO_FISICO_ARB = false THEN
        SET NEW.ACTIVO = false;
    ELSE
        SET NEW.ACTIVO = true;
    END IF;
END$$
DELIMITER ;

-- Agrego la columna ACTIVO a la tabla ARBITROS
ALTER TABLE ARBITROS
ADD COLUMN ACTIVO BOOLEAN NOT NULL DEFAULT true;

-- Actualizo los valores de la columna ACTIVO según la condición definida en el trigger
UPDATE ARBITROS
SET ACTIVO = (CASE WHEN APTO_FISICO_ARB = true THEN true ELSE false END);

SELECT * FROM ARBITROS;

-- 
ALTER TABLE JUGADORES
ADD COLUMN TARJETAS_ROJAS INT DEFAULT 0,
ADD COLUMN APTO_PARA_JUGAR BOOLEAN DEFAULT TRUE;


DELIMITER //

CREATE TRIGGER check_tarjetas_rojas
BEFORE INSERT ON JUGADORES
FOR EACH ROW
BEGIN
    IF NEW.TARJETAS_ROJAS > 0 THEN
        SET NEW.APTO_PARA_JUGAR = FALSE;
    END IF;
END;
//

DELIMITER ;

SELECT * FROM JUGADORES WHERE APTO_PARA_JUGAR = FALSE;


CREATE USER 'admin_all_tables'@'localhost' IDENTIFIED BY 'pass456';
GRANT ALL PRIVILEGES 
ON TORNEO_FUTBOL.* TO 'admin_all_tables'@'localhost';
FLUSH PRIVILEGES;


CREATE USER 'user_jugadores_arbitros'@'localhost' IDENTIFIED BY 'pass123';
GRANT SELECT, INSERT, UPDATE, DELETE 
ON TORNEO_FUTBOL.JUGADORES TO 'user_jugadores_arbitros'@'localhost';

GRANT SELECT, INSERT, UPDATE, DELETE 
ON TORNEO_FUTBOL.ARBITROS TO 'user_jugadores_arbitros'@'localhost';
FLUSH PRIVILEGES;

