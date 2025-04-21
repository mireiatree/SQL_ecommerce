-- top revenue by time period
SELECT DATE(event_time) AS date, SUM(price) AS daily_revenue
FROM ecommerce_data
WHERE event_type = 'purchase'
GROUP BY DATE(event_time)
ORDER BY date;