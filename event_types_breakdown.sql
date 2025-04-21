-- event types breakdown
SELECT event_type, COUNT(*) AS total_events
FROM ecommerce_data
GROUP BY event_type;