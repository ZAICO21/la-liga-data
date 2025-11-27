USE [La Liga]

-- KPIs del Reporte de desempeño de jugadores de La Liga


-- Lugar en la tabla

SELECT g.nombre, g.posicion_tabla
FROM goleadores_liga g
JOIN temporadas_liga t ON g.idTemporada = t.id
WHERE g.nombre LIKE 'Cristiano Ronaldo' AND (t.temporadas = 2010)


-- Nacionalidad del jugador 

SELECT DISTINCT g.nombre, g.nacionalidad
FROM goleadores_liga g
WHERE g.nombre LIKE 'Cristiano Ronaldo'


-- Información sobre goles por partido

CREATE PROCEDURE SP_Goles_Partido(@t INT, @jugador NVARCHAR(50))
AS
BEGIN
	SELECT g.nombre, (g.golesPorPartido/100.0) AS goles_partido
	FROM goleadores_liga g
	JOIN temporadas_liga t ON g.idTemporada = t.id
	WHERE g.nombre LIKE @jugador AND t.temporadas = @t
END

EXEC SP_Goles_Partido 2013, 'Cristiano%'


-- Información sobre minutos por gol

CREATE PROCEDURE SP_Minutos_Gol(@t INT, @jugador NVARCHAR(50))
AS
BEGIN
	SELECT g.nombre, g.minutosPorGol
	FROM goleadores_liga g
	JOIN temporadas_liga t ON g.idTemporada = t.id
	WHERE g.nombre LIKE @jugador AND t.temporadas = @t
END

EXEC SP_Minutos_Gol 2013, 'Cristiano%'


-- Información sobre cantidad de goles

CREATE PROCEDURE SP_Goles(@t INT, @jugador NVARCHAR(50))
AS
BEGIN
	SELECT g.nombre, g.goles
	FROM goleadores_liga g
	JOIN temporadas_liga t ON g.idTemporada = t.id
	WHERE g.nombre LIKE @jugador AND t.temporadas = @t
END

EXEC SP_Goles 2013, 'Cristiano%'


-- Información sobre tipo de gol

CREATE PROCEDURE SP_Tipo_Gol(@t INT, @jugador NVARCHAR(50))
AS
BEGIN
	SELECT	g.nombre,
			g.penales,
			g.goles-g.penales AS no_penales,
			g.goles,
			CAST(ROUND((g.penales*100.0/g.goles),2) AS DECIMAL (5,2)) AS porcentaje_penales, 
			CAST(ROUND(((g.goles-g.penales)*100.0/g.goles),2) AS DECIMAL (5,2)) AS porcentaje_sin_penal
	FROM goleadores_liga g
	JOIN temporadas_liga t ON g.idTemporada = t.id
	WHERE g.nombre LIKE @jugador AND t.temporadas = @t
END

EXEC SP_Tipo_Gol 2013, 'Cristiano%'


-- Información sobre participación activa en gol

CREATE PROCEDURE SP_Participacion_Gol(@t INT, @jugador NVARCHAR(50))
AS
BEGIN
	SELECT	g.nombre,
			g.asistencias,
			g.goles,
			(g.asistencias + g.goles) AS 'G+A',
			CAST(ROUND((g.asistencias*100.0/(g.asistencias + g.goles)),2) AS DECIMAL (5,2)) AS porcentaje_asistencias, 
			CAST(ROUND(((g.goles)*100.0/(g.asistencias + g.goles)),2) AS DECIMAL (5,2)) AS porcentaje_goles
	FROM goleadores_liga g
	JOIN temporadas_liga t ON g.idTemporada = t.id
	WHERE g.nombre LIKE @jugador AND t.temporadas = @t
END

EXEC SP_Participacion_Gol 2013, 'Cristiano%'
