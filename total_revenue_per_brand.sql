-- total revenue per brand
SELECT brand, ROUND(SUM(price), 2) AS total_revenue
FROM ecommerce_data
WHERE event_type = 'purchase'
GROUP BY brand
ORDER BY total_revenue DESC;