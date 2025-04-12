--actors Total appearance;
SELECT a.first_name, a.last_name, COUNT(*) AS total_appearance
FROM film_actor f
JOIN actor a ON f.actor_id = a.actor_id
GROUP BY a.actor_id
--ORDER BY total_appearance DESC;

--customers total payments;
SELECT
    c.first_name,
    c.last_name,
    ROUND(SUM(py.amount), 2) AS total_spent
FROM payment py
JOIN customer c ON py.customer_id = c.customer_id
GROUP BY c.customer_id
ORDER BY total_spent DESC;

--Which firm category made the highest revenue;
SELECT
    c.name AS category,
    ROUND(SUM(py.amount), 2) AS total_revenue
FROM payment py
JOIN rental re ON py.rental_id = re.rental_id
JOIN inventory inv ON re.inventory_id = inv.inventory_id
JOIN film_category fc ON inv.film_id = fc.film_id
JOIN category c ON fc.category_id = c.category_id
GROUP BY c.category_id
--ORDER BY total_revenue DESC;

--On average, how many days is_each film rented
SELECT
    f.title,
    AVG(DATEDIFF(r.return_date, r.rental_date)) AS avg_rental_days
FROM rental rn
JOIN inventory inv ON r.inventory_id = inv.inventory_id
JOIN film f ON inv.film_id = f.film_id
GROUP BY f.film_id
ORDER BY avg_rental_days DESC
