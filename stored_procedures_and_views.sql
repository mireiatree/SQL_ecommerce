-- stored procedures & views
CREATE OR REPLACE VIEW product_summary AS
SELECT product_id, COUNT(*) AS events, SUM(CASE WHEN event_type = 'purchase' THEN 1 ELSE 0 END) AS purchases
FROM ecommerce_data
GROUP BY product_id;