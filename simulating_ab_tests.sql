-- simulating a/b tests
SELECT
CASE WHEN MOD(user_id, 2) = 0 THEN 'A' ELSE 'B' END as group_id,
AVG(price) AS avg_purchase_price
FROM ecommerce_data
WHERE event_type = 'purchase'
GROUP BY group_id;