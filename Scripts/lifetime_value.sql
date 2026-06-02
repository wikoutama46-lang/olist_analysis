-- Segmen customer mana yang memiliki Lifetime Value (LTV) tertinggi berdasarkan histori order dan pembayaran?
WITH order_value AS (
	SELECT
		o.order_id,
		SUM(oi.price + oi.freight_value)  AS total_order_value
	FROM order_items oi
	JOIN orders o ON oi.order_id = o.order_id
	GROUP BY 
		o.order_id,
		o.order_purchase_timestamp 
),average_order_value AS (
	SELECT
		c.customer_unique_id,
		ROUND(SUM(total_order_value)::NUMERIC / COUNT(o.order_id), 2) AS average_order_value
	FROM order_value ov
	JOIN orders o ON ov.order_id = o.order_id
	JOIN customers c ON o.customer_id = c.customer_id 
	GROUP BY c.customer_unique_id
), purchase_frequency AS(
	SELECT 
		c.customer_unique_id,
		COUNT(c.customer_unique_id) AS count_of_order
	FROM orders o
	JOIN customers c ON o.customer_id = c.customer_id 
	GROUP BY c.customer_unique_id
	ORDER BY count_of_order DESC
), customer_lifespan AS (
	SELECT 
		c.customer_unique_id,
		GREATEST(
			MAX(o.order_purchase_timestamp::DATE) - MIN(o.order_purchase_timestamp::DATE)
		,1) AS lifespan_by_day
	FROM orders o
	JOIN customers c ON c.customer_id = o.customer_id
	GROUP BY c.customer_unique_id 
), history_payments AS (
	SELECT
		c.customer_unique_id,
		SUM(op.payment_installments) AS total_installments,
		SUM(op.payment_value) AS total_value,
		MAX(op.payment_type) AS payment_type,
		MAX(op.payment_sequential) AS payment_sequential
	FROM order_payments op
	JOIN orders o ON op.order_id = o.order_id
	JOIN customers c ON o.customer_id = c.customer_id 
	GROUP BY c.customer_unique_id 
)


SELECT
	aov.customer_unique_id,
	hp.payment_sequential,
	hp.payment_type,
	hp.total_installments,
	ROUND(hp.total_value::NUMERIC, 2) AS total_value,
	SUM(aov.average_order_value * pf.count_of_order * cl.lifespan_by_day) AS lifetime_value,
	pf.count_of_order,
	cl.lifespan_by_day
FROM
	average_order_value aov
JOIN purchase_frequency pf ON aov.customer_unique_id = pf.customer_unique_id
JOIN customer_lifespan cl ON  pf.customer_unique_id = cl.customer_unique_id
JOIN history_payments hp ON cl.customer_unique_id = hp.customer_unique_id
GROUP BY 
	aov.customer_unique_id,
	hp.payment_sequential,
	hp.payment_type,
	hp.total_installments,
	hp.total_value,
	pf.count_of_order,
	cl.lifespan_by_day
ORDER BY lifetime_value DESC