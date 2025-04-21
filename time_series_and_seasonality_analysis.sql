-- time series & seasonality analysis
SELECT HOUR(event_time) AS hour, COUNT(*) AS events
FROM ecommerce_data
GROUP BY hour
ORDER BY hour; 