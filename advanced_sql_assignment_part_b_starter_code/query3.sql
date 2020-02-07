-- Find the first_name, last_name and total_combined_film_length of Sci-Fi films for every actor.
-- That is the result should list the names of all of the actors(even if an actor has not been in any Sci-Fi films) and the total length of Sci-Fi films they have been in.
-- Look at the category table to figure out how to filter data for Sci-Fi films.
-- Order your results by the actor_id in descending order.
-- Put query for Q3 here

SELECT query1.actor_id, query1.first_name, query1.last_name, IFNULL(SUM(query2.length),0) AS 'total_combined_film_length'
FROM (
	SELECT actor.actor_id, actor.first_name, actor.last_name, film_actor.film_id
	FROM actor INNER JOIN film_actor ON film_actor.actor_id = actor.actor_id
) AS query1
LEFT JOIN 
(
	SELECT film.length, film.film_id FROM film
	INNER JOIN film_category ON film_category.film_id = film.film_id
	INNER JOIN category ON category.category_id = film_category.category_id
	WHERE category.name = 'Sci-Fi'
) AS query2
ON query1.film_id = query2.film_id 
GROUP BY query1.actor_id
ORDER BY query1.actor_id DESC;
