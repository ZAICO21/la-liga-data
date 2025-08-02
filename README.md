# Análisis del Desempeño en La Liga Española

Este proyecto con fines académicos pretende recopilar y analizar la información de los clubes y jugadores de La Liga de la página de Transfermarkt mediante el uso de técnicas de web scrapping. El trabajo contempla la información desde la temporada 1999/2000 hasta la temporada 2023/2024, de esta manera se puede estudiar el rendimiento de los equipos y jugadores involucrados en La Liga durante este siglo.

### Tecnologías utilizadas:
Para el desarrollo de este trabajo se contempla el uso de:
- Python 3.11.7
  - Pandas
  - Numpy
  - BeautifulSoup
- PowerBI

### Objetivos:
1. Realizar la ejecución de la parte práctica de las técnicas de web scrapping.
2. Obtener la data con el proceso de ETL (extracción, transoformación y carga) para su análisis correspondiente.
3. Visualizar la información en dashboards interactiovos que le impidan que al usuario se limite a la lectura de tablas cuando quiero ver información sobre este tema.

### KPIs:
Para cada sección del dashboard se consideraron los siguientes indicadores como categorías a analizar:

*Reporte de datos de La Liga*
- Total de temporadas analizadas
- Cantidad de descensos
- Títulos ganados por club
- Clubes con mayor número de descensos

*Desempeño de jugador por temporada*
- Total de goles por temporada
- Promedio de goles por partido
- Minutos por gol
- Ranking del jugador entre los goleadores de la temporada
- País de origen del jugador
- Porcentaje de participación en goles (goles y asistencias)
- Tipo de goles (con penal / sin penal)

*Desempeño de cada club*
- Total de partidos jugados
- Total de partidos ganados
- Diferencia de goles acumulada
- Porcentaje de victorias, empate y derrotas
- Evolución de goles a favor y goles en contra por temporada


### Esquema del funcionamiento del programa:
Esquema que muestra el proceso ETL del trabajo.
![Esquema](https://github.com/user-attachments/assets/63917412-0891-4165-9373-edce6072bd3d)


### Dashboard
Previsualización:
<img width="1602" height="847" alt="image" src="https://github.com/user-attachments/assets/2115ba97-5275-4df8-a97d-be8a05fc1bfc" />
<img width="1582" height="840" alt="image" src="https://github.com/user-attachments/assets/4c7997b4-cb52-487c-99d6-7f5bf3bd35a3" />
<img width="1595" height="843" alt="image" src="https://github.com/user-attachments/assets/451ed53e-7ae1-4f16-ac99-e9ba9e249e8d" />



Para visualizar el dashboard ingresar a:  
[Dashboard de La Liga](https://app.powerbi.com/view?r=eyJrIjoiNmUyOWMwZTEtNjgxZi00OWNkLWJlNDAtZTQ1YjFkNDFjZGQ2IiwidCI6IjBlMGNiMDYwLTA5YWQtNDlmNS1hMDA1LTY4YjliNDlhYTFmNiIsImMiOjR9)
