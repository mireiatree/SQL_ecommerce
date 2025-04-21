-- user lifetime value (LTV) estimation
SELECT user_id, SUM(price) AS total_value
FROM ecommerce_data
WHERE event_type = 'purchase'
GROUP BY user_id
ORDER BY total_value DESC;