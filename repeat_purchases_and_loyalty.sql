-- repeat purchases & loyalty
SELECT user_id, COUNT(DISTINCT DATE(event_time)) as active_days,
COUNT(*) AS total_purchases
FROM ecommerce_data
WHERE event_type = 'purchase'
GROUP BY user_id
HAVING total_purchases > 1
ORDER BY total_purchases DESC;
