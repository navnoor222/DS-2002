

SELECT a.first_name, a.last_name
FROM actor AS a
JOIN film_actor AS fa ON a.actor_id = fa.actor_id
JOIN film AS f ON fa.film_id = f.film_id
WHERE f.title = 'ACADEMY DINOSAUR';


SELECT c.name AS CategoryName, COUNT(fc.film_id) AS FilmCount
FROM category AS c
JOIN film_category AS fc ON c.category_id = fc.category_id
GROUP BY c.category_id, c.name
ORDER BY FilmCount DESC;


SELECT rating, AVG(rental_duration) AS average_rental_duration
FROM film
GROUP BY rating
ORDER BY average_rental_duration DESC;


SELECT c.first_name, c.last_name, COUNT(r.rental_id) AS rental_count
FROM customer AS c
JOIN rental AS r ON c.customer_id = r.customer_id
GROUP BY c.customer_id, c.first_name, c.last_name
ORDER BY rental_count DESC;


SELECT i.store_id, COUNT(r.rental_id) AS rental_count
FROM rental AS r
JOIN inventory AS i ON r.inventory_id = i.inventory_id
GROUP BY i.store_id
ORDER BY rental_count DESC
LIMIT 1;


SELECT cat.name AS category_name, COUNT(rent.rental_id) AS rental_count
FROM rental rent
JOIN inventory inv ON rent.inventory_id = inv.inventory_id
JOIN film_category film_cat ON inv.film_id = film_cat.film_id
JOIN category cat ON film_cat.category_id = cat.category_id
GROUP BY cat.name
ORDER BY rental_count DESC
LIMIT 1;


SELECT cat.name AS category_name, AVG(f.rental_rate) AS average_rental_rate
FROM film f
JOIN film_category fc ON f.film_id = fc.film_id
JOIN category cat ON fc.category_id = cat.category_id
GROUP BY cat.name
ORDER BY average_rental_rate DESC;


SELECT f.title, MAX(r.rental_date) AS last_rental_date
FROM film f
LEFT JOIN inventory i ON f.film_id = i.film_id
LEFT JOIN rental r ON i.inventory_id = r.inventory_id
GROUP BY f.title
ORDER BY last_rental_date DESC;


SELECT c.first_name, c.last_name, SUM(p.amount) AS total_spent
FROM customer c
JOIN payment p ON c.customer_id = p.customer_id
GROUP BY c.customer_id, c.first_name, c.last_name
ORDER BY total_spent DESC;


SELECT lang.name AS language, AVG(f.length) AS average_length
FROM film f
JOIN language lang ON f.language_id = lang.language_id
GROUP BY lang.name
ORDER BY average_length DESC;

