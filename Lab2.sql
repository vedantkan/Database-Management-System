# Task - 1
USE world;

# Task - 2
SELECT c.Name AS city_name, ct.Name AS country_name, c.District, c.Population  
FROM city AS c
JOIN country as ct ON c.CountryCode = ct.code
WHERE ct.Name = 'Afghanistan'
Order BY population DESC
LIMIT 3;

# Task - 3 
SELECT Name, LifeExpectancy
FROM country
WHERE Region = 'Middle East'
ORDER BY LifeExpectancy ASC
LIMIT 1;

# Task - 4
SELECT SUM(GNP) FROM country WHERE Region = 'Caribbean';

# Task - 5
SELECT *
FROM country AS ct 
JOIN countrylanguage AS cl on ct.code = cl.CountryCode
WHERE cl.Language = 'French' AND Region = 'Western Europe';

# Task - 6
SELECT c.Name
FROM city AS c 
JOIN country AS ct ON c.CountryCode = ct.code
WHERE ct.Name = 'Madagascar' AND c.NAME LIKE 'A%';

# Task - 7
USE sakila;

# Task - 8
SELECT title, rental_rate, replacement_cost
FROM film as f 
JOIN inventory as i ON f.film_id = i.film_id
WHERE inventory_id IN
(SELECT inventory_id FROM rental WHERE MONTH(rental_date) = 5 AND YEAR(rental_date) = 2005);

# Task - 9 
SELECT title, rental_rate, 
(SELECT MAX(amount) FROM payment as p LEFT JOIN rental AS r ON p.rental_id = r.rental_id WHERE r.inventory_id = i.inventory_id)
FROM film as f 
LEFT JOIN inventory as i ON f.film_id = i.film_id;

# Task -10
SELECT title, rental_rate, MAX(amount)
FROM film as f
LEFT JOIN inventory as i 
ON f.film_id = i.film_id
LEFT JOIN rental AS r 
ON r.inventory_id = i.inventory_id
LEFT JOIN payment as p
ON p.rental_id = r.rental_id
GROUP BY title, rental_rate
