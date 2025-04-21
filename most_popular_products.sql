-- most popular product
SELECT product_id, COUNT(*) AS times_viewed
FROM ecommerce_Data
GROUP BY product_id
ORDER BY times_viewed DESC
LIMIT 5;