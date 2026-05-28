-- Berapa Average Order Value (AOV) berdasarkan metode pembayaran, status order, dan lokasi customer?
WITH order_value AS (
	SELECT 
		order_id,
		SUM(oi.price + oi.freight_value ) AS total_order_value
	FROM order_items oi 
	GROUP BY order_id
), payment_type_clean AS (
	SELECT 
		order_id,
		MAX(payment_type) AS payment_type
	FROM order_payments op
	GROUP BY order_id
)

SELECT 
	c.customer_city, 
	ptc.payment_type,
	o.order_status,
	AVG(order_value.total_order_value) AS average_order_value
FROM order_value
JOIN orders o ON order_value.order_id = o.order_id
JOIN payment_type_clean ptc ON o.order_id = ptc.order_id 
JOIN customers c ON o.customer_id = c.customer_id
GROUP BY 
	c.customer_city,
	o.order_status,
	ptc.payment_type
ORDER BY average_order_value ASC;




