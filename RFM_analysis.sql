-- RFM analysis: Customer segmentation for users with at least one purchase
WITH purchases AS (
  SELECT *
  FROM ecommerce_data
  WHERE event_type = 'purchase'
),
last_event AS (
  SELECT user_id, MAX(event_time) AS last_seen
  FROM ecommerce_data
  GROUP BY user_id
),
rfm AS (
  SELECT 
    p.user_id,
    DATEDIFF(l.last_seen, MAX(p.event_time)) AS recency,
    COUNT(*) AS frequency,
    SUM(p.price) AS monetary
  FROM purchases p
  JOIN last_event l ON p.user_id = l.user_id
  GROUP BY p.user_id, l.last_seen
)
SELECT * FROM rfm;
