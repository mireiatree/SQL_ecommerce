-- Top 1st product by session
WITH first_event AS (
  SELECT user_session, MIN(event_time) AS first_event_time
  FROM ecommerce_data
  GROUP BY user_session
),
first_product AS (
  SELECT e.user_session, e.product_id
  FROM ecommerce_data e
  JOIN first_event f 
    ON e.user_session = f.user_session AND e.event_time = f.first_event_time
)
SELECT product_id, COUNT(*) AS times_first_in_session
FROM first_product
GROUP BY product_id
ORDER BY times_first_in_session DESC
LIMIT 10;
