
-- 1. __Birthyear__
-- Buscá todas las películas filmadas en el año que naciste.

SELECT * 
FROM movies 
WHERE year = 1982;


-- 2. __1982__
-- Cuantas películas hay en la DB que sean del año 1982?

SELECT count(*) 
FROM movies
WHERE year = 1982;

-- 3. __Stacktors__
-- Buscá actores que tengan el substring `stack` en su apellido.

SELECT * 
FROM actors
WHERE nombre LIKE "%stack%";

-- 4. __Fame Name Game__
-- Buscá los 10 nombres y apellidos más populares entre los actores. Cuantos actores tienen cada uno de esos nombres y apellidos?

SELECT first_name, last_name,
count(*) as Total
FROM actors
group by lower(first_name), lower(last_name)
order by Total desc
limit 10;


-- 5. __Prolific__
-- Listá el top 100 de actores más activos junto con el número de roles que haya realizado.


SELECT a.id, a.first_name, a.last_name,
count (*) as Total
from actors as a
join roles as r on a.id = r.actor_id
group by a.id
order by Total desc
limit 100;



-- 6. __Bottom of the Barrel__
-- Cuantas películas tiene IMDB por género? Ordená la lista por el género menos popular.

SELECT genre, 
count (*) as Total
FROM movies_genres
group by genre
order by Total asc;


-- 7. __Braveheart__
-- Listá el nombre y apellido de todos los actores que trabajaron en la película "Braveheart" de 1995, ordená la lista alfabéticamente por apellido.

select a.first_name, a.last_name 
from actors as a
join roles as r on a.id = r.actor_id
join movies as m on r.movie_id = m.id
where name = 'Be Cool' and year = 2005
order by a.last_name asc;


-- 8. __Leap Noir__
-- Listá todos los directores que dirigieron una película de género 'Film-Noir' en un año bisiesto (para reducir la complejidad, asumí que cualquier año divisible por cuatro es bisiesto). Tu consulta debería devolver el nombre del director, el nombre de la peli y el año. Todo ordenado por el nombre de la película.

select (d.first_name || ' ' || d.last_name) as director, m.name, m.year
from directors as d
join directors_genres as dg on d.id = dg.director_id
join movies_directors as md on md.director_id = dg.director_id
join movies as m on m.id = md.movie_id
where dg.genre = 'Film-Noir' and m.year%4 = 0
order by m.name asc;


-- 9. __° Bacon__
-- Listá todos los actores que hayan trabajado con _Kevin Bacon_ en películas de Drama (incluí el título de la peli). Excluí al señor Bacon de los resultados.

select (a.first_name || ' ' || a.last_name) as actors, m.name as Pelicula
from actors as a
join roles as r on r.actor_id = a.id
join movies as m on m.id = r.movie_id
join movies_genres as mg on mg.movie_id = m.id 
where mg.genre = 'Drama'
and m.id in (select m.id 
     from movies as m
     join roles as r on r.movie_id = m.id
     join actors as a on a.id = r.actor_id
     where first_name = 'Kevin' and last_name = 'Bacon')
and (first_name != 'Kevin' and last_name != 'Bacon')


