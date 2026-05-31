-- Berapa Customer Retention Rate berdasarkan wilayah customer dan periode pembelian?

WITH period AS(
	SELECT
		MIN(TO_CHAR(o.order_purchase_timestamp::DATE,'YYYY-MM')) AS start_of_period,
		MAX(TO_CHAR(o.order_purchase_timestamp::DATE,'YYYY-MM')) AS end_of_period
	FROM orders o
), start_period AS (
	SELECT
		o.customer_id,
		SUM(CASE WHEN TO_CHAR(o.order_purchase_timestamp::DATE, 'YYYY-MM') = start_of_period THEN 1 ELSE 0 END) AS start_period_count
	FROM orders o, period p
	GROUP BY o.customer_id
), end_period AS (
	SELECT
		o.customer_id,
		SUM(CASE WHEN TO_CHAR(o.order_purchase_timestamp::DATE, 'YYYY-MM') = end_of_period THEN 1 ELSE 0 END) AS end_period_count
	FROM orders o, period p
	GROUP BY o.customer_id
), first_purchase AS (
	SELECT
		customer_id,
		MIN(o.order_purchase_timestamp::DATE) AS first_purchase_date
	FROM orders o
	GROUP BY customer_id
), new_customers AS (
	SELECT
		customer_id,
	 	COUNT(DISTINCT customer_id) AS new_customer_count
	FROM first_purchase 
	WHERE TO_CHAR(first_purchase_date, 'YYYY-MM') BETWEEN '2016-09' AND '2018-10'
	GROUP BY customer_id
)

SELECT
	s.customer_city,
	s.customer_state,
	100.0 * SUM(ep.end_period_count) - SUM(nc.new_customer_count) / NULLIF(SUM(sp.start_period_count),0) AS customer_retention_rate
FROM customers s
JOIN start_period sp ON s.customer_id = sp.customer_id
JOIN end_period ep ON sp.customer_id = ep.customer_id
JOIN new_customers nc ON ep.customer_id = nc.customer_id
GROUP BY 
	s.customer_city,
	s.customer_state;




SELECT 
	c.customer_unique_id,
	COUNT(c.customer_unique_id) AS count
FROM customers c 
JOIN orders o ON c.customer_id = o.customer_id 
GROUP BY c.customer_unique_id 
ORDER BY count DESC;


SELECT *
FROM customers c; 
	
	