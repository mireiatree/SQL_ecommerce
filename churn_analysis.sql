-- churn analysis
WITH user_dates AS (
SELECT user_id, MIN(event_time) AS first_date, MAX(event_time) AS last_date
FROM ecommerce_data
GROUP BY user_id
)
SELECT COUNT(*) AS churned_users
FROM user_dates
WHERE DATEDIFF(last_date, first_date) < 2 AND DATEDIFF(NOW(), last_date) > 30;
