-- Find the film_title of all films which feature both KIRSTEN PALTROW and WARREN NOLTE
-- Order the results by film_title in descending order.
--  Warning: this is a tricky one and while the syntax is all things you know, you have to think a bit oustide the box to figure out how to get a table that shows pairs of actors in movies.


-- Put your query for q5 here.

-- All the films with KIRSTEN PALTROW
SELECT f.film_id, a.first_name, a.last_name FROM film f 
INNER JOIN film_actor fa ON f.film_id=fa.film_id
INNER JOIN actor a ON fa.actor_id=a.actor_id
WHERE a.first_name='KIRSTEN' AND a.last_name='PALTROW';

-- All the films with WARREN NOLTE

SELECT f.film_id, a.first_name, a.last_name FROM film f 
INNER JOIN film_actor fa ON f.film_id=fa.film_id
INNER JOIN actor a ON fa.actor_id=a.actor_id
WHERE a.first_name='WARREN' AND a.last_name='NOLTE';

-- All the films with both

SELECT kirsten_films.title FROM (
  SELECT f.film_id, f.title FROM film f 
  INNER JOIN film_actor fa ON f.film_id=fa.film_id
  INNER JOIN actor a ON fa.actor_id=a.actor_id
  WHERE a.first_name='KIRSTEN' AND a.last_name='PALTROW'
) AS kirsten_films
INNER JOIN (
  SELECT f.film_id FROM film f 
  INNER JOIN film_actor fa ON f.film_id=fa.film_id
  INNER JOIN actor a ON fa.actor_id=a.actor_id
  WHERE a.first_name='WARREN' AND a.last_name='NOLTE'
) AS warren_films
WHERE kirsten_films.film_id=warren_films.film_id
ORDER BY kirsten_films.title DESC;