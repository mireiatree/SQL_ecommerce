-- advanced A/B simulation with CTR
WITH base AS (
SELECT user_id,
CASE WHEN MOD(user_id, 2) = 0 THEN 'A' ELSE 'B' END AS group_id,
event_type
FROM ecommerce_data
)
SELECT group_id,
COUNT(DISTINCT CASE WHEN event_type = 'view' THEN user_id END) AS views,
COUNT(DISTINCT CASE WHEN event_type = 'purchase' THEN user_id END) AS purchases,
ROUND(COUNT(DISTINCT CASE WHEN event_type = 'purchase' THEN user_id END) /
COUNT(DISTINCT CASE WHEN event_type = 'view' THEN user_id END) * 100, 2) AS conversion_rate
FROM base
GROUP BY group_id;