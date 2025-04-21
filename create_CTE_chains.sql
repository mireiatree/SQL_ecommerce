-- create CTE chains
WITH purchases AS (
SELECT * FROM ecommerce_data WHERE event_type = 'purchase'
),
top_products AS (
SELECT product_id, COUNT(*) AS num_purchases
FROM purchases
GROUP BY product_id
)
SELECT * FROM top_products
ORDER BY num_purchases DESC
LIMIT 10;