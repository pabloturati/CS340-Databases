-- Find the film_title of all films which feature both KIRSTEN PALTROW and WARREN NOLTE
-- Order the results by film_title in descending order.
--  Warning: this is a tricky one and while the syntax is all things you know, you have to think a bit oustide the box to figure out how to get a table that shows pairs of actors in movies.


-- Put your query for q5 here.

SELECT query1.title as 'film_title' FROM (
	SELECT film.film_id, film.title FROM film
	INNER JOIN film_actor ON film_actor.film_id = film.film_id
	INNER JOIN actor ON actor.actor_id = film_actor.actor_id
	WHERE actor.first_name = 'KIRSTEN' and actor.last_name = 'PALTROW'
) AS query1
INNER JOIN (
	SELECT film.film_id, film.title FROM film
	INNER JOIN film_actor ON film_actor.film_id = film.film_id
	INNER JOIN actor ON actor.actor_id = film_actor.actor_id
	WHERE actor.first_name = 'WARREN' and actor.last_name = 'NOLTE'
) AS query2
WHERE query1.film_id = query2.film_id
ORDER BY query1.title DESC;