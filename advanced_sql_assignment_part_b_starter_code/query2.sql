-- We want to find out how many of each category of film ED CHASE has starred in.

-- So return a table with category_name and the count of the number_of_films that ED was in that category.

-- Your query should return every category even if ED has been in no films in that category

-- Order by the category name in ascending order.


SELECT q1.name AS 'category_name', IFNULL(q2.count, '0') as 'number_of_films'
FROM (SELECT category.name FROM category) AS q1
LEFT JOIN (
	SELECT category.name, COUNT(category.name) AS 'count' FROM category 
	INNER JOIN film_category ON film_category.category_id = category.category_id
	INNER JOIN film ON film.film_id = film_category.film_id
	INNER JOIN film_actor ON film.film_id = film_actor.film_id
	INNER JOIN actor ON actor.actor_id = film_actor.actor_id
	WHERE actor.first_name = 'ED' AND actor.last_name = 'CHASE'
	GROUP BY category.name
) AS q2
ON q1.name = q2.name AND 'Films Ed Chase has starred in' >= 0
GROUP BY q1.name ORDER BY q1.name;