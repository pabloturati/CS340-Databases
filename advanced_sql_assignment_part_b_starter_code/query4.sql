-- Find the first_name and last_name of all actors who have never been in a Sci-Fi film.
-- Order by the actor_id in ascending order.

-- Put your query for q4 here

SELECT actor.actor_id, actor.first_name, actor.last_name FROM actor
WHERE actor.actor_id NOT IN (
	SELECT actor.actor_id FROM actor
	INNER JOIN film_actor ON film_actor.actor_id = actor.actor_id
	INNER JOIN film ON film.film_id = film_actor.film_id
	INNER JOIN film_category ON film_category.film_id = film.film_id
	INNER JOIN category ON category.category_id = film_category.category_id
	WHERE category.name = 'Sci-Fi'
) ORDER BY actor.actor_id;