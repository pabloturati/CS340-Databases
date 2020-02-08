-- We want to find out how many of each category of film ED CHASE has starred in.

-- So return a table with category_name and the count of the number_of_films that ED was in that category.

-- Your query should return every category even if ED has been in no films in that category

-- Order by the category name in ascending order.


-- Films where Ed Chase has appeared
SELECT film.title, actor.first_name, actor.last_name FROM film 
INNER JOIN film_actor fa ON film.film_id=fa.film_id 
INNER JOIN actor ON actor.actor_id=fa.actor_id 
WHERE actor.first_name="ED" AND actor.last_name="CHASE";

-- All film categories
SELECT film.film_id, film.title, category.name FROM film INNER JOIN film_category fc ON film.film_id=fc.film_id INNER JOIN category ON category.category_id=fc.category_id;


-- Films categories joined together with Ed Chase's films
SELECT q1.name
FROM (
  SELECT film.film_id, film.title, category.name FROM film INNER JOIN film_category fc ON film.film_id=fc.film_id INNER JOIN category ON category.category_id=fc.category_id
) AS q1
LEFT JOIN(
  SELECT film.film_id, actor.first_name, actor.last_name FROM film 
  INNER JOIN film_actor fa ON film.film_id=fa.film_id 
  INNER JOIN actor ON actor.actor_id=fa.actor_id 
) AS q2
ON q1.film_id = q2.film_id WHERE q2.first_name="ED" AND q2.last_name="CHASE";


-- Categories of the films where Ed Chase has appeared

SELECT q1.name, count(q1.name)
FROM ( 
  SELECT film.film_id, film.title, category.name FROM film INNER JOIN film_category fc ON film.film_id=fc.film_id INNER JOIN category ON category.category_id=fc.category_id;
) AS q1
LEFT JOIN(
  SELECT film.film_id, actor.first_name, actor.last_name FROM film 
  INNER JOIN film_actor fa ON film.film_id=fa.film_id 
  INNER JOIN actor ON actor.actor_id=fa.actor_id 
) AS q2
ON q1.film_id = q2.film_id WHERE q2.first_name="ED" AND q2.last_name="CHASE" GROUP BY q1.name


-- Categories of Ed's films

SELECT film.film_id, actor.first_name, actor.last_name, category.name, count(category.name) FROM film 
INNER JOIN film_actor fa ON film.film_id=fa.film_id 
INNER JOIN actor ON actor.actor_id=fa.actor_id 
INNER JOIN film_category fc ON film.film_id=fc.film_id 
INNER JOIN category ON category.category_id=fc.category_id
WHERE actor.first_name="ED" AND actor.last_name="CHASE" GROUP BY category.name


-- SOLUTION:  Categories of the films where Ed Chase has appeared with all the categories in it

SELECT q1.name, IFNULL(q2.category_count,0) FROM(
  SELECT category.name FROM category
) AS q1
LEFT JOIN(
  SELECT film.film_id, actor.first_name, actor.last_name, category.name, count(category.name) AS 'category_count' FROM film 
  INNER JOIN film_actor fa ON film.film_id=fa.film_id 
  INNER JOIN actor ON actor.actor_id=fa.actor_id 
  INNER JOIN film_category fc ON film.film_id=fc.film_id 
  INNER JOIN category ON category.category_id=fc.category_id
  WHERE actor.first_name="ED" 
  AND actor.last_name="CHASE" 
  GROUP BY category.name
) AS q2 
ON q1.name = q2.name GROUP BY q1.name ORDER BY q1.name ASC