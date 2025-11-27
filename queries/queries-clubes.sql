USE [La Liga]

-- KPIs del Reporte de desempeño de clubes de La Liga


-- Información sobre partidos ganados por club en cierto periodo

SELECT c.club, SUM(c.ganados) AS partidos_ganados
FROM clubes_liga c
JOIN clubes_id_liga cid ON c.idClub = cid.id
JOIN temporadas_liga t ON c.idTemporada = t.id
WHERE cid.club LIKE 'FC Barcelona' AND (t.temporadas BETWEEN 1999 AND 2023)
GROUP BY c.club


-- Información sobre el total de partidos jugados por club en cierto periodo

SELECT c.club, SUM(c.partidos) AS partidos_jugados
FROM clubes_liga c
JOIN clubes_id_liga cid ON c.idClub = cid.id
JOIN temporadas_liga t ON c.idTemporada = t.id
WHERE cid.club LIKE 'FC Barcelona' AND (t.temporadas BETWEEN 1999 AND 2023)
GROUP BY c.club


-- Información sobre la diferencia de goles por club en cierto periodo

SELECT c.club, SUM(c.diferencia_goles) AS diferencia_goles
FROM clubes_liga c
JOIN clubes_id_liga cid ON c.idClub = cid.id
JOIN temporadas_liga t ON c.idTemporada = t.id
WHERE cid.club LIKE 'Girona%' AND (t.temporadas BETWEEN 1999 AND 2023)
GROUP BY c.club


-- Goles a favor y en contra por temporadas

SELECT CONCAT(t.temporadas,'/',(t.temporadas + 1)) AS temporada,
		c.golesAFavor,
		c.golesEnContra
FROM clubes_liga c
JOIN temporadas_liga t ON c.idTemporada = t.id
WHERE c.club LIKE '%Barcelona%'



-- Porcentajes de victoria, empate y derrota de club en cierto periodo

SELECT	c.club, 
		CAST(ROUND(SUM(c.ganados)*100.0/SUM(c.partidos),2) AS DECIMAL(5,2)) AS porcentaje_ganados,
		CAST(ROUND(SUM(c.empatados)*100.0/SUM(c.partidos),2) AS DECIMAL(5,2)) AS porcentaje_empatados,
		CAST(ROUND(SUM(c.perdidos)*100.0/SUM(c.partidos),2) AS DECIMAL(5,2))  AS porcentaje_perdidos
FROM clubes_liga c
JOIN clubes_id_liga cid ON c.idClub = cid.id
JOIN temporadas_liga t ON c.idTemporada = t.id
WHERE cid.club LIKE '%Atlético Madrid%' AND (t.temporadas BETWEEN 1999 AND 2023)
GROUP BY c.club

