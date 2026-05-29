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
), average_order_value AS (
	SELECT
		o.customer_id,
		SUM(total_order_value) / COUNT(o.order_id) AS average_order_value
	FROM order_value ov
	JOIN orders o ON ov.order_id = o.order_id 
	GROUP BY
		o.customer_id
), purchase_frequency AS(
	SELECT 
		customer_id,
		COUNT(customer_id) AS count_of_order
	FROM orders o 
	GROUP BY customer_id
), customer_lifespan AS (
	SELECT 
		customer_id,
		MAX(order_purchase_timestamp::DATE) - MIN(order_purchase_timestamp::DATE) AS customer_lifespan
	FROM orders o 
	GROUP BY 
		customer_id
), customer_lifespan_conditional AS (
	SELECT 
		customer_id,
		CASE WHEN customer_lifespan = 0 THEN 1 ELSE customer_lifespan END AS customer_lifespan_conditional 
	FROM customer_lifespan
), history_payments AS (
	SELECT
		o.customer_id,
		SUM(op.payment_installments) AS total_installments,
		SUM(op.payment_value) AS total_value,
		MAX(op.payment_type) AS payment_type,
		MAX(op.payment_sequential) AS payment_sequential
	FROM order_payments op
	JOIN orders o ON op.order_id = o.order_id
	GROUP BY 
		o.customer_id
)


SELECT
	aov.customer_id,
	hp.payment_sequential,
	hp.payment_type,
	hp.total_installments,
	hp.total_value AS total_value,
	SUM(aov.average_order_value * pf.count_of_order * clc.customer_lifespan_conditional) AS lifetime_value
FROM
	average_order_value aov
JOIN purchase_frequency pf ON aov.customer_id = pf.customer_id
JOIN customer_lifespan_conditional clc ON pf.customer_id = clc.customer_id
JOIN history_payments hp ON clc.customer_id = hp.customer_id
GROUP BY 
	aov.customer_id,
	hp.payment_sequential,
	hp.payment_type,
	hp.total_installments,
	hp.total_value
ORDER BY lifetime_value DESC