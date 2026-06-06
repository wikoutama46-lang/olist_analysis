-- Berapa Cancellation Rate berdasarkan seller, kategori produk, dan periode order?
SELECT 
	s.seller_id,
	DATE_TRUNC('month' ,o.order_purchase_timestamp::DATE) AS order_month,
	pcnt.product_category_name_english AS product_category,
	ROUND(SUM(CASE WHEN order_status = 'canceled' THEN 1.0 ELSE 0.0 END) / COUNT(DISTINCT o.order_id), 2) AS cancenllation_rate
FROM orders o
LEFT JOIN order_items oi ON o.order_id = oi.order_id
LEFT JOIN sellers s ON oi.seller_id = s.seller_id 
LEFT JOIN products p ON oi.product_id = p.product_id 
LEFT JOIN product_category_name_translation pcnt ON p.product_category_name = pcnt.product_category_name 
GROUP BY 
	s.seller_id,
	product_category,
	order_month

	
