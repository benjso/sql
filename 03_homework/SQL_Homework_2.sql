--SELECT Section

--1st Query
SELECT * FROM customer;

--2nd Query
SELECT * FROM customer ORDER BY customer_last_name, customer_first_name LIMIT 10;


--WHERE Section

--1st Query
SELECT * FROM customer_purchases WHERE product_id IN (4, 9);

--2nd Query
SELECT *, (quantity * cost_to_customer_per_qty) AS price FROM customer_purchases WHERE vendor_id BETWEEN 8 AND 10;


--CASE Section

--1st Query
SELECT product_id, product_name,
	CASE
		WHEN product_qty_type = 'unit'
			THEN 'unit'
		ELSE 'bulk'
	END
	AS prod_qty_type_condensed
FROM product;

--2nd Query
SELECT product_id, product_name,
	CASE
		WHEN product_qty_type = 'unit'
			THEN 'unit'
		ELSE 'bulk'
	END
	AS prod_qty_type_condensed,
	
	CASE
		WHEN product_name LIKE '%pepper%'
			THEN 1
		ELSE 0
	END
	AS pepper_flag
FROM product;


--JOIN Section

--1st Query
SELECT *
FROM vendor
JOIN vendor_booth_assignments
ON vendor.vendor_id = vendor_booth_assignments.vendor_id
ORDER BY vendor_name, market_date;