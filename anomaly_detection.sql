-- anomaly detection. Finding price spikes. Business risk detection
SELECT product_id, DATE(event_time) AS date, 
AVG(price) AS avg_price,
MAX(price) AS max_price
FROM ecommerce_data
GROUP BY product_id, date
HAVING max_price > 2 * avg_price;