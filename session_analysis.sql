-- session analysis: number of actions each user performs per session
SELECT user_id, user_session, COUNT(*) AS total_events
FROM ecommerce_data
GROUP BY user_id, user_session;