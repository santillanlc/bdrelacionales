-- ============================================================
--  BASE DE DATOS: JUGADORES DE FÚTBOL - MUNDIAL 2026
--  Selección Mexicana (lista filtrada mayo 2026) + otras selecciones
--  Práctica de Base de Datos - Sin normalizar
-- ============================================================

DROP DATABASE IF EXISTS futbol_mundial;
CREATE DATABASE futbol_mundial
    CHARACTER SET utf8mb4
    COLLATE utf8mb4_unicode_ci;

USE futbol_mundial;

-- ------------------------------------------------------------
--  TABLA PRINCIPAL (sin normalizar, todo en una sola tabla)
-- ------------------------------------------------------------
CREATE TABLE jugadores (
    id              INT AUTO_INCREMENT PRIMARY KEY,
    nombre          VARCHAR(100)    NOT NULL,
    apellido        VARCHAR(100)    NOT NULL,
    fecha_nac       DATE,
    edad            TINYINT UNSIGNED,
    pais            VARCHAR(60)     NOT NULL,
    posicion        VARCHAR(30)     NOT NULL,  -- Portero / Defensa / Mediocampista / Delantero
    dorsal          TINYINT UNSIGNED,
    club_actual     VARCHAR(100),
    liga_club       VARCHAR(80),
    pais_club       VARCHAR(60),
    valor_mercado_M DECIMAL(5,1),              -- En millones de euros (aprox.)
    goles_seleccion SMALLINT UNSIGNED DEFAULT 0,
    partidos_seleccion SMALLINT UNSIGNED DEFAULT 0,
    capitan         TINYINT(1) DEFAULT 0,      -- 1 = capitán
    convocado_mundial2026 TINYINT(1) DEFAULT 1
);

-- ============================================================
--  SELECCIÓN MEXICANA  (basada en prelista/filtración mayo 2026)
-- ============================================================

INSERT INTO jugadores
    (nombre, apellido, fecha_nac, edad, pais, posicion, dorsal, club_actual, liga_club, pais_club, valor_mercado_M, goles_seleccion, partidos_seleccion, capitan)
VALUES

-- PORTEROS
('Guillermo',  'Ochoa',          '1985-07-13', 40, 'México', 'Portero',        1,  'AVS Futebol',     'Primeira Liga',    'Portugal',   0.5,  0, 148, 0),
('Raúl',       'Rangel',         '1997-02-19', 28, 'México', 'Portero',        13, 'Guadalajara',     'Liga MX',          'México',     3.0,  0,  12, 0),
('Carlos',     'Acevedo',        '1996-03-22', 29, 'México', 'Portero',        23, 'Santos Laguna',   'Liga MX',          'México',     2.5,  0,   8, 0),

-- DEFENSAS
('Jorge',      'Sánchez',        '1998-01-16', 27, 'México', 'Defensa',        2,  'PAOK',            'Super League',     'Grecia',     5.0,  1,  51, 0),
('Mateo',      'Chávez',         '2003-09-29', 22, 'México', 'Defensa',        3,  'AZ Alkmaar',      'Eredivisie',       'Países Bajos',8.0, 0,  15, 0),
('César',      'Montes',         '1997-04-24', 28, 'México', 'Defensa',        4,  'Lokomotiv Moscú', 'Premier Liga',     'Rusia',      4.0,  5,  73, 0),
('Johan',      'Vásquez',        '1999-09-06', 26, 'México', 'Defensa',        5,  'Génova',          'Serie A',          'Italia',    10.0,  1,  36, 0),
('Jesús',      'Gallardo',       '1994-08-14', 31, 'México', 'Defensa',        16, 'Toluca',          'Liga MX',          'México',     3.5,  3,  93, 0),
('Israel',     'Reyes',          '1997-09-06', 28, 'México', 'Defensa',        6,  'Club América',    'Liga MX',          'México',     3.0,  1,  22, 0),
('Julián',     'Araujo',         '2001-08-13', 24, 'México', 'Defensa',        22, 'Celtic FC',       'Scottish Premiership','Escocia', 7.0, 0,  18, 0),

-- MEDIOCAMPISTAS
('Edson',      'Álvarez',        '1997-10-24', 28, 'México', 'Mediocampista',  8,  'Fenerbahçe',      'Süper Lig',        'Turquía',   25.0,  5, 101, 1),
('Álvaro',     'Fidalgo',        '1998-06-14', 27, 'México', 'Mediocampista',  10, 'Club América',    'Liga MX',          'México',     8.0,  4,  28, 0),
('Luis',       'Chávez',         '1996-01-18', 29, 'México', 'Mediocampista',  7,  'Pachuca',         'Liga MX',          'México',     6.0,  8,  47, 0),
('Orbelín',    'Pineda',         '1996-03-24', 29, 'México', 'Mediocampista',  14, 'AEK Atenas',      'Super League',     'Grecia',     5.0,  7,  76, 0),
('Brian',      'Gutiérrez',      '2003-02-09', 22, 'México', 'Mediocampista',  17, 'Guadalajara',     'Liga MX',          'México',    10.0,  1,  14, 0),
('Obed',       'Vargas',         '2004-05-20', 21, 'México', 'Mediocampista',  20, 'Stuttgart',       'Bundesliga',       'Alemania',  12.0,  0,  10, 0),
('Erik',       'Lira',           '2000-02-10', 25, 'México', 'Mediocampista',  15, 'Cruz Azul',       'Liga MX',          'México',     4.0,  0,  20, 0),
('Luis',       'Romo',           '1995-06-05', 30, 'México', 'Mediocampista',  18, 'Guadalajara',     'Liga MX',          'México',     3.5,  2,  38, 0),
('Gilberto',   'Mora',           '2001-12-08', 24, 'México', 'Mediocampista',  19, 'Tijuana',         'Liga MX',          'México',     2.0,  0,   6, 0),

-- DELANTEROS
('Santiago',   'Giménez',        '2001-04-18', 24, 'México', 'Delantero',      9,  'AC Milan',        'Serie A',          'Italia',    50.0, 17,  42, 0),
('Raúl',       'Jiménez',        '1991-05-05', 35, 'México', 'Delantero',      11, 'Fiorentina',      'Serie A',          'Italia',     6.0, 40, 119, 0),
('Roberto',    'Alvarado',       '1999-09-07', 26, 'México', 'Delantero',      21, 'Guadalajara',     'Liga MX',          'México',     5.0,  5,  43, 0),
('Alexis',     'Vega',           '1997-11-09', 28, 'México', 'Delantero',      24, 'Toluca',          'Liga MX',          'México',     4.0,  4,  41, 0),
('Julián',     'Quiñones',       '1997-12-12', 28, 'México', 'Delantero',      25, 'Club América',    'Liga MX',          'México',     4.5,  8,  30, 0),
('Guillermo',  'Martínez',       '1992-06-22', 33, 'México', 'Delantero',      26, 'Pumas UNAM',      'Liga MX',          'México',     1.5,  2,  11, 0),
('Armando',    'González',       '2002-11-07', 23, 'México', 'Delantero',      12, 'Guadalajara',     'Liga MX',          'México',     3.0,  0,   5, 0);


-- ============================================================
--  SELECCIÓN DE ARGENTINA  (campeones del mundo 2022)
-- ============================================================

INSERT INTO jugadores
    (nombre, apellido, fecha_nac, edad, pais, posicion, dorsal, club_actual, liga_club, pais_club, valor_mercado_M, goles_seleccion, partidos_seleccion, capitan)
VALUES
('Lionel',     'Messi',          '1987-06-24', 37, 'Argentina', 'Delantero',   10, 'Inter Miami',     'MLS',              'EE.UU.',    35.0, 109, 191, 1),
('Emiliano',   'Martínez',       '1992-09-02', 33, 'Argentina', 'Portero',      1, 'Aston Villa',     'Premier League',   'Inglaterra',25.0,   0,  67, 0),
('Nicolás',    'Otamendi',       '1988-02-18', 37, 'Argentina', 'Defensa',      4, 'Benfica',         'Primeira Liga',    'Portugal',   5.0,   2, 117, 0),
('Rodrigo',    'De Paul',        '1994-05-24', 31, 'Argentina', 'Mediocampista',7, 'Atlético Madrid', 'La Liga',          'España',    30.0,  13,  86, 0),
('Julián',     'Álvarez',        '2000-01-31', 25, 'Argentina', 'Delantero',    9, 'Atlético Madrid', 'La Liga',          'España',    90.0,  23,  57, 0),
('Lautaro',    'Martínez',       '1997-08-22', 28, 'Argentina', 'Delantero',   22, 'Inter de Milán',  'Serie A',          'Italia',    90.0,  31,  68, 0);


-- ============================================================
--  SELECCIÓN DE BRASIL
-- ============================================================

INSERT INTO jugadores
    (nombre, apellido, fecha_nac, edad, pais, posicion, dorsal, club_actual, liga_club, pais_club, valor_mercado_M, goles_seleccion, partidos_seleccion, capitan)
VALUES
('Alisson',    'Becker',         '1992-10-02', 33, 'Brasil', 'Portero',         1, 'Liverpool',       'Premier League',   'Inglaterra',40.0,   0,  79, 0),
('Marquinhos', 'Aoas Corrêa',    '1994-05-14', 31, 'Brasil', 'Defensa',         4, 'PSG',             'Ligue 1',          'Francia',  35.0,   8,  93, 1),
('Vinicius',   'Junior',         '2000-07-12', 25, 'Brasil', 'Delantero',      10, 'Real Madrid',     'La Liga',          'España',  180.0,  12,  60, 0),
('Rodrygo',    'Goes',           '2001-01-09', 24, 'Brasil', 'Delantero',      11, 'Real Madrid',     'La Liga',          'España',  100.0,   9,  42, 0),
('Bruno',      'Guimarães',      '1997-11-16', 28, 'Brasil', 'Mediocampista',   5, 'Newcastle',       'Premier League',   'Inglaterra',80.0,  4,  41, 0),
('Endrick',    'Felipe',         '2006-07-21', 19, 'Brasil', 'Delantero',       9, 'Real Madrid',     'La Liga',          'España',   80.0,   5,  17, 0);


-- ============================================================
--  SELECCIÓN DE ESPAÑA
-- ============================================================

INSERT INTO jugadores
    (nombre, apellido, fecha_nac, edad, pais, posicion, dorsal, club_actual, liga_club, pais_club, valor_mercado_M, goles_seleccion, partidos_seleccion, capitan)
VALUES
('Unai',       'Simón',          '1997-06-11', 28, 'España', 'Portero',         1, 'Athletic Bilbao', 'La Liga',          'España',   30.0,   0,  40, 0),
('Lamine',     'Yamal',          '2007-07-13', 18, 'España', 'Delantero',      11, 'FC Barcelona',    'La Liga',          'España',  180.0,   9,  28, 0),
('Pedri',      'González',       '2002-11-25', 23, 'España', 'Mediocampista',   8, 'FC Barcelona',    'La Liga',          'España',  120.0,   4,  47, 0),
('Rodri',      'Hernández',      '1996-06-22', 29, 'España', 'Mediocampista',   16,'Manchester City', 'Premier League',   'Inglaterra',100.0,  5,  52, 0),
('Álvaro',     'Morata',         '1992-10-23', 33, 'España', 'Delantero',        7,'AC Milan',        'Serie A',          'Italia',   18.0,  37, 100, 1),
('Nico',       'Williams',       '2002-07-12', 23, 'España', 'Delantero',       10,'Athletic Bilbao', 'La Liga',          'España',   90.0,   7,  28, 0);


-- ============================================================
--  SELECCIÓN DE ALEMANIA
-- ============================================================

INSERT INTO jugadores
    (nombre, apellido, fecha_nac, edad, pais, posicion, dorsal, club_actual, liga_club, pais_club, valor_mercado_M, goles_seleccion, partidos_seleccion, capitan)
VALUES
('Manuel',     'Neuer',          '1986-03-27', 39, 'Alemania', 'Portero',        1, 'Bayern Múnich',   'Bundesliga',       'Alemania',  12.0,  0,  121, 1),
('Joshua',     'Kimmich',        '1995-02-08', 30, 'Alemania', 'Mediocampista',  6, 'Bayern Múnich',   'Bundesliga',       'Alemania',  60.0,  7,   89, 0),
('Jamal',      'Musiala',        '2003-02-26', 22, 'Alemania', 'Mediocampista', 10, 'Bayern Múnich',   'Bundesliga',       'Alemania', 150.0,  9,   45, 0),
('Florian',    'Wirtz',          '2003-05-03', 22, 'Alemania', 'Mediocampista',  8, 'Bayer Leverkusen','Bundesliga',       'Alemania', 150.0, 10,   34, 0),
('Kai',        'Havertz',        '1999-06-11', 26, 'Alemania', 'Mediocampista',  7, 'Arsenal',         'Premier League',   'Inglaterra',70.0, 22,   55, 0),
('Serge',      'Gnabry',         '1995-07-14', 30, 'Alemania', 'Delantero',     10, 'Bayern Múnich',   'Bundesliga',       'Alemania',  25.0, 20,   45, 0);


-- ============================================================
--  CONSULTAS DE EJEMPLO PARA LA PRÁCTICA
-- ============================================================

-- 1. Ver todos los jugadores de México
-- SELECT * FROM jugadores WHERE pais = 'México' ORDER BY posicion, dorsal;

-- 2. Contar jugadores por país
-- SELECT pais, COUNT(*) AS total FROM jugadores GROUP BY pais ORDER BY total DESC;

-- 3. Los 5 jugadores con mayor valor de mercado
-- SELECT nombre, apellido, pais, club_actual, valor_mercado_M
--   FROM jugadores ORDER BY valor_mercado_M DESC LIMIT 5;

-- 4. Delanteros de cualquier selección
-- SELECT nombre, apellido, pais, club_actual, goles_seleccion
--   FROM jugadores WHERE posicion = 'Delantero' ORDER BY goles_seleccion DESC;

-- 5. Jugadores mexicanos que militan en Europa
-- SELECT nombre, apellido, posicion, club_actual, liga_club, pais_club
--   FROM jugadores WHERE pais = 'México' AND pais_club != 'México';

-- 6. Promedio de edad por selección
-- SELECT pais, ROUND(AVG(edad), 1) AS edad_promedio
--   FROM jugadores GROUP BY pais ORDER BY edad_promedio;

-- 7. Capitanes de cada selección
-- SELECT nombre, apellido, pais, club_actual FROM jugadores WHERE capitan = 1;

-- 8. Total de goles anotados por selección
-- SELECT pais, SUM(goles_seleccion) AS goles_totales
--   FROM jugadores GROUP BY pais ORDER BY goles_totales DESC;

-- 9. Porteros del torneo
-- SELECT nombre, apellido, pais, club_actual FROM jugadores WHERE posicion = 'Portero';

-- 10. Jugadores mayores de 33 años (veteranos)
-- SELECT nombre, apellido, edad, pais, posicion, club_actual
--   FROM jugadores WHERE edad > 33 ORDER BY edad DESC;
