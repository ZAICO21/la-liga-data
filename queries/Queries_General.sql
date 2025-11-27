
USE [La Liga]

-- KPIs del Reporte de datos de La Liga

-- Recuento de temporadas

CREATE PROCEDURE SP_Recuento_Temporadas(@yi SMALLINT, @yf SMALLINT)
AS
BEGIN
	SELECT COUNT(*)
	FROM temporadas_liga t
	WHERE t.temporadas BETWEEN @yi AND @yf
END

EXEC SP_Recuento_Temporadas 1999,2023;


-- Recuento de descensos

CREATE PROCEDURE SP_Total_Descensos (@yi SMALLINT, @yf SMALLINT)
AS
BEGIN
	SELECT COUNT(*)
	FROM temporadas_liga t
	JOIN clubes_liga c ON t.id = c.idTemporada
	WHERE c.posicion >= 18 AND (t.temporadas BETWEEN @yi AND @yf)
END

EXEC SP_Total_Descensos 1999,2023;

-- Cantidad de títulos por club

CREATE PROCEDURE SP_Titulos_Club (@yi SMALLINT, @yf SMALLINT)
AS
BEGIN
	SELECT cid.club, COUNT(*) AS Titulos
	FROM clubes_liga c
	JOIN clubes_id_liga cid ON c.idClub = cid.id
	JOIN temporadas_liga t ON c.idTemporada = t.id
	WHERE c.posicion = 1 AND (t.temporadas BETWEEN @yi AND @yf)
	GROUP BY cid.club
	ORDER BY Titulos DESC
END

EXEC SP_Titulos_Club 1999,2013;


-- Cantidad de descensos por club

CREATE PROCEDURE SP_Descensos_Club (@yi SMALLINT, @yf SMALLINT)
AS
BEGIN
	SELECT cid.club, COUNT(*) AS Descensos
	FROM clubes_liga c
	JOIN clubes_id_liga cid ON c.idClub = cid.id
	JOIN temporadas_liga t ON c.idTemporada = t.id
	WHERE c.posicion >= 18 AND (t.temporadas BETWEEN @yi AND @yf)
	GROUP BY cid.club
	ORDER BY Descensos DESC
END

EXEC SP_Descensos_Club 1999,2013;