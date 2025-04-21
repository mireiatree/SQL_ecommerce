-- product conversion funnel
WITH product_events AS (
SELECT
product_id,
SUM(CASE WHEN event_type = 'view' THEN 1 ELSE 0 END) AS views,
SUM(CASE WHEN event_type = 'cart' THEN 1 ELSE 0 END) AS cart_adds,
SUM(CASE WHEN event_type = 'purchase' THEN 1 ELSE 0 END) AS purchases
FROM ecommerce_data
GROUP BY product_id
)
SELECT *,
ROUND(purchases / views * 100, 2) AS conversion_rate
FROM product_events
ORDER BY conversion_rate DESC;