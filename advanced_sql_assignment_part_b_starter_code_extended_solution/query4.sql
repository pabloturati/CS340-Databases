-- Find the first_name and last_name of all actors who have never been in a Sci-Fi film.
-- Order by the actor_id in ascending order.

-- Put your query for q4 here

-- Solution.  First: Find all the actors in sci fi movies (their ids) Second: Find all the unverse of actors.  
-- 3. Remove all the actors that are in the list of Sci-Fi actors 

SELECT actor_id, first_name, last_name FROM actor WHERE actor_id NOT IN(
  SELECT a.actor_id FROM actor a
  INNER JOIN film_actor fa ON a.actor_id=fa.actor_id 
  INNER JOIN film f ON f.film_id=fa.film_id
  INNER JOIN film_category fc ON fc.film_id=f.film_id
  INNER JOIN category c ON c.category_id=fc.category_id
  WHERE c.name='Sci-Fi' GROUP BY a.actor_id
) ORDER BY actor_id;

