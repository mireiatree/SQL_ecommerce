-- RFM analysis. Customer segmentation
SELECT
user_id, 
DATEDIFF(MAX(event_time), MAX(CASE WHEN event_type = 'purchase' THEN event_time END)) AS recency, 
COUNT(CASE WHEN event_type = 'purchase' THEN 1 END) AS frequency,
SUM(CASE WHEN event_type = 'purchase' THEN price ELSE 0 END) AS monetary
FROM ecommerce_data
GROUP BY user_id;