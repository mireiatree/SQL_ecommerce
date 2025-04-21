-- cart abandonment rate
SELECT
ROUND(COUNT(DISTINCT CASE WHEN event_type = 'cart' THEN user_id END)
/ NULLIF(COUNT(DISTINCT CASE WHEN event_type = 'view' THEN user_id END), 0) * 100, 2) AS add_to_cart_rate,

ROUND(COUNT(DISTINCT CASE WHEN event_type = 'purchase' THEN user_id END)
/ NULLIF(COUNT(DISTINCT CASE WHEN event_type = 'cart' THEN user_id END), 0) * 100, 2) AS cart_to_purchase_rate
FROM ecommerce_data; 