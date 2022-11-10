USE vbk10;

#Task 1
use sakila;
SELECT c.name, f.title, f.description, f.release_year from film as f 
join film_category as fc on f.film_id = fc.film_id 
join category as c on fc.category_id = c.category_id 
where c.name = 'Documentary' and f.description like '%drama%'
group by c.name, f.title, f.description, f.release_year;

#Challenge
DELIMITER $$
CREATE DEFINER=`vbk10`@`%` PROCEDURE `getMovies`(IN releaseYear int)
BEGIN
	SELECT c.name, f.title, f.description, f.release_year from sakila.film as f 
    join sakila.film_category as fc on f.film_id = fc.film_id 
    join sakila.category as c on fc.category_id = c.category_id 
    where c.name = 'Documentary' and f.description like '%drama%' and f.release_year = releaseYear
    group by c.name, f.title, f.description, f.release_year;
END $$
DELIMITER ;

CALL getMovies(2006);

#Task 2
use sakila;
SELECT f.title, CONCAT(last_name, ' , ', first_name) as actor_name FROM film as f
join film_actor as fa on f.film_id = fa.film_id 
join actor as a on fa.actor_id = a.actor_id
WHERE a.first_name = 'JULIA' and a.last_name = 'MCQUEEN'
GROUP BY f.title, a.last_name, a.first_name;

#Challenge
DELIMITER $$
CREATE DEFINER=`vbk10`@`%` PROCEDURE `getMovie`(IN lastName varchar(45), IN firstName varchar(45))
BEGIN
	SELECT f.title, CONCAT(last_name, ' , ', first_name) AS actor_name 
    FROM sakila.film AS f
	JOIN sakila.film_actor AS fa ON f.film_id = fa.film_id 
	JOIN sakila.actor AS a ON fa.actor_id = a.actor_id
	WHERE a.first_name = firstName AND a.last_name = lastName
	GROUP BY f.title, a.first_name, a.last_name;
END $$
DELIMITER ;

CALL getMovie('MCQUEEN', 'JULIA');

#Task 3
use sakila;
SELECT CONCAT(a.last_name, ' , ', a.first_name) as actor_name FROM film as f
join film_actor as fa on f.film_id = fa.film_id 
join actor as a on fa.actor_id = a.actor_id
WHERE f.title = 'AMADEUS HOLY'
GROUP BY f.title, a.first_name, a.last_name;

SELECT COUNT(*) as total FROM film as f
join film_actor as fa on f.film_id = fa.film_id 
join actor as a on fa.actor_id = a.actor_id
WHERE f.title = 'AMADEUS HOLY'
GROUP BY f.title;

#Challenge
DELIMITER $$
CREATE DEFINER=`vbk10`@`%` PROCEDURE `getActors`()
BEGIN
	SELECT COUNT(*) as total FROM sakila.film as f
	join sakila.film_actor as fa on f.film_id = fa.film_id 
	join sakila.actor as a on fa.actor_id = a.actor_id
	WHERE f.title = 'AMADEUS HOLY'
	GROUP BY f.title;
END $$
DELIMITER ;

CALL getActors();
