-- Berapa Customer Retention Rate berdasarkan wilayah customer dan periode pembelian?
WITH order_date AS (
	SELECT 
		c.customer_unique_id,
		c.customer_state,
		TO_CHAR(o.order_purchase_timestamp::DATE, 'YYYY-MM') AS order_month
	FROM orders o
	JOIN customers c ON o.customer_id = c.customer_id 
), first_purchase AS (
	SELECT 
		customer_unique_id,
		customer_state,
	 	MIN(order_month) AS first_purchase_month
	FROM order_date
	GROUP BY 
		customer_unique_id,
		customer_state
), all_periods AS (
	SELECT 
		customer_state,
		COUNT(customer_unique_id) AS all_periods_count
	FROM first_purchase
	GROUP BY customer_state
), first_period AS (
	SELECT 
		customer_state,
		COUNT(customer_unique_id) AS first_period_count
	FROM first_purchase 
	WHERE first_purchase_month = '2016-09'
	GROUP BY customer_state 
), end_period AS (
	SELECT 
		customer_state,
		COUNT(customer_unique_id) AS end_period_count
	FROM first_purchase 
	WHERE first_purchase_month = '2018-10'
	GROUP BY customer_state 
)


SELECT 
	fp.customer_state,
	first_period_count,
	COALESCE(end_period_count, 0) AS end_period_count,
	all_periods_count,
	100.0 * (SUM(end_period_count) - SUM(all_periods_count)) / SUM(first_period_count) AS customer_retention_rate
FROM first_period fp
LEFT JOIN end_period ep ON fp.customer_state = ep.customer_state
LEFT JOIN all_periods ap ON fp.customer_state = ap.customer_state
GROUP BY 
	fp.customer_state,
	first_period_count,
	COALESCE(end_period_count, 0),
	all_periods_count