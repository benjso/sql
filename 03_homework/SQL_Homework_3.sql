--AGGREGATE Section

--1st Query
SELECT vendor_id, COUNT(booth_number) AS '# of rental'
FROM vendor_booth_assignments
GROUP BY vendor_id;

--2nd Query
SELECT c.customer_last_name, c.customer_first_name, SUM(quantity * cost_to_customer_per_qty) AS total_spent FROM customer_purchases AS cp
JOIN customer AS c
ON c.customer_id = cp.customer_id
GROUP BY cp.customer_id
HAVING total_spent > 2000
ORDER BY c.customer_last_name, c.customer_first_name;


--Temp Table

--1st Query & DML
DROP TABLE IF EXISTS temp.new_vendor;

CREATE TABLE temp.new_vendor AS
SELECT vendor_id, vendor_name, vendor_type, vendor_owner_first_name, vendor_owner_last_name
FROM vendor;

INSERT INTO temp.new_vendor
VALUES (10, 'Thomass Superfood', 'Fresh Focused', 'Thomas', 'Rosenthal');

--SELECT * from temp.new_vendor;


--Date Section

--1st Query
SELECT customer_id, STRFTIME('%m', market_date) AS month, STRFTIME('%Y', market_date) AS year FROM customer_purchases;

--2nd Query
SELECT c.customer_id, /*c.customer_last_name, c.customer_first_name,*/ SUM(quantity * cost_to_customer_per_qty) AS total_spent FROM customer_purchases AS cp
JOIN customer AS c
ON c.customer_id = cp.customer_id
WHERE STRFTIME('%Y-%m', market_date) like '2019-04'
GROUP BY c.customer_id, STRFTIME('%Y-%m', market_date);
