-- Berapa total Gross Merchandise Value (GMV) per bulan berdasarkan seller dan kategori produk?
SELECT
	s.seller_id,
	pcnt.product_category_name_english AS category_name,
	TO_CHAR(o.order_purchase_timestamp::DATE, 'YYYY-MM') AS year_month_order,
 	SUM(price) AS gross_merchandise_value
FROM order_items oi
	JOIN orders o ON oi.order_id = o.order_id
	JOIN products p ON oi.product_id = p.product_id
	JOIN product_category_name_translation pcnt ON pcnt.product_category_name = p.product_category_name
	JOIN sellers s ON oi.seller_id = s.seller_id
GROUP BY 
	category_name,
	year_month_order,
	s.seller_id 
ORDER BY year_month_order ASC;