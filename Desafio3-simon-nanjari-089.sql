-- Desafío TDefinición de Tablas Top 100 (Desafio3-simon-nanjari-089)

--1. Crear base de datos llamada peliculas.
CREATE DATABASE peliculas;

-- Creacion tabla peliculas
CREATE TABLE tabla_peliculas (
    id INT NOT NULL,
    Pelicula VARCHAR(255),
    Año_estreno SMALLINT, 
    Director VARCHAR (255), 
    PRIMARY KEY(id)
    );

-- Creacion Tabla reparto
CREATE TABLE tabla_reparto(
    id INT NOT NULL, 
    Actor VARCHAR(255), 
    FOREIGN KEY(id) REFERENCES tabla_peliculas(id)
    );

--2. Cargar ambos archivos a su tabla correspondiente.
-- Importar datos del archivo peliculas.CSV
\COPY tabla_peliculas FROM 'C:\Users\Dell.DESKTOP-AN7DSKN\Desktop\Desafios\DesafiosSQL\Desafío3\Apoyo Desafi╠üo - Top 100/peliculas.csv' csv header;
-- Importar datos del archivo reparto.CSV
\COPY tabla_reparto FROM 'C:\Users\Dell.DESKTOP-AN7DSKN\Desktop\Desafios\DesafiosSQL\Desafío3\Apoyo Desafi╠üo - Top 100/reparto.csv' csv header;

--3. Obtener el ID de la película “Titanic”.
SELECT * FROM tabla_peliculas WHERE Pelicula = 'Titanic';
-- 4. Listar a todos los actores que aparecen en la película "Titanic".
SELECT * FROM tabla_reparto WHERE id = 2;

-- 5. Consultar en cuántas películas del top 100 participa Harrison Ford.
SELECT Pelicula FROM tabla_peliculas INNER JOIN tabla_reparto ON tabla_peliculas.id = tabla_reparto.id WHERE tabla_reparto.Actor = 'Harrison Ford';

--6. Indicar las películas estrenadas entre los años 1990 y 1999 ordenadas por título de manera ascendente.
SELECT Año_estreno, Pelicula FROM tabla_peliculas WHERE Año_estreno BETWEEN 1990 AND 1999 ORDER BY Pelicula ASC;

--7. Hacer una consulta SQL que muestre los títulos con su longitud, la longitud debe ser nombrada para la consulta como “longitud_titulo”.
SELECT Pelicula, LENGTH(Pelicula) AS longitud_titulo FROM tabla_peliculas GROUP BY Pelicula ORDER BY Pelicula ASC; 

--8. Consultar cual es la longitud más grande entre todos los títulos de las películas.
SELECT MAX(LENGTH(Pelicula)) FROM tabla_peliculas;
