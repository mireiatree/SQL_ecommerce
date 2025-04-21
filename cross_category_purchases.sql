-- cross-category purchases
SELECT user_session, GROUP_CONCAT(DISTINCT category_code) AS categories
FROM ecommerce_data
WHERE event_type = 'purchase'
GROUP BY user_session
HAVING COUNT(DISTINCT category_code) > 1;