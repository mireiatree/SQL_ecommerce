-- session duration
SELECT user_session,
TIMESTAMPDIFF(MINUTE, MIN(EVENT_TIME), MAX(event_time)) AS session_duration_minutes
FROM ecommerce_data
GROUP BY user_session;