-- Find the first_name, last_name and total_combined_film_length of Sci-Fi films for every actor.
-- That is the result should list the names of all of the actors(even if an actor has not been in any Sci-Fi films) and the total length of Sci-Fi films they have been in.
-- Look at the category table to figure out how to filter data for Sci-Fi films.
-- Order your results by the actor_id in descending order.
-- Put query for Q3 here

-- Unique actors in Sci Fi movies
SELECT a.actor_id, a.first_name, a.last_name, c.name, SUM(f.length) as 'film_length' FROM actor a 
INNER JOIN film_actor fa ON a.actor_id=fa.actor_id 
INNER JOIN film f ON f.film_id=fa.film_id 
INNER JOIN film_category fc on f.film_id=fc.film_id
INNER JOIN category c on c.category_id=fc.category_id
WHERE c.name='Sci-Fi' GROUP BY a.actor_id ORDER BY a.actor_id DESC

--Unverse of all of the actors
SELECT a.actor_id, a.first_name, a.last_name FROM actor a 
INNER JOIN film_actor fa ON a.actor_id=fa.actor_id
INNER JOIN film f ON f.film_id=fa.film_id GROUP BY a.actor_id

-- SOLUTION:  Joining all actors with the unique actors only
SELECT q1.actor_id, q1.first_name, IFNULL(q2.total_combined_film_length, 0) FROM(
  SELECT a.actor_id, a.first_name, a.last_name FROM actor a 
  INNER JOIN film_actor fa ON a.actor_id=fa.actor_id
  INNER JOIN film f ON f.film_id=fa.film_id GROUP BY a.actor_id
) AS q1 
LEFT JOIN(
  SELECT a.actor_id, SUM(f.length) AS 'total_combined_film_length' FROM actor a 
  INNER JOIN film_actor fa ON a.actor_id=fa.actor_id 
  INNER JOIN film f ON f.film_id=fa.film_id 
  INNER JOIN film_category fc on f.film_id=fc.film_id
  INNER JOIN category c on c.category_id=fc.category_id
  WHERE c.name='Sci-Fi' GROUP BY a.actor_id ORDER BY a.actor_id DESC
) q2 
ON q1.actor_id=q2.actor_id ORDER BY q1.actor_id DESC