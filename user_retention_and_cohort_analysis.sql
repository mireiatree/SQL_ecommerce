-- user retention & cohort analysis. How many users return after their first visit
WITH first_visits AS (
 SELECT user_id, MIN(CONVERT(DATE, event_time)) AS first_visit
 FROM ecommerce_data
 GROUP BY user_id
 ),
cohorts AS (
SELECT
t.user_id,
CONVERT(DATE, t.event_time) AS visit_date,
 fv.first_visit,
 DATEDIFF(WEEK, fv.first_visit, CONVERT(DATE, t.event_time)) AS weeks_since_first
 FROM ecommerce_data AS t
 JOIN first_visits AS fv ON t.user_id = fv.user_id
 )
 SELECT first_visit, weeks_since_first, COUNT(DISTINCT user_id) AS retained_users
 FROM cohorts
 GROUP BY first_visit, weeks_since_first
 ORDER BY first_visit, weeks_since_first;