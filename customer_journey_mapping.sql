-- customer journey mapping
SELECT user_id, user_session, GROUP_CONCAT(event_type ORDER BY event_time) AS journey
FROM ecommerce_data
GROUP BY user_id, user_session;