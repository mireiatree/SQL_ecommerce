-- rank top 3 brands per category by revenue
WITH ranked_sales AS (
  SELECT 
    category_code, 
    brand, 
    SUM(price) AS total_sales,
    RANK() OVER (PARTITION BY category_code ORDER BY SUM(price) DESC) AS rnk
  FROM ecommerce_data
  WHERE event_type = 'purchase'
  GROUP BY category_code, brand
)
SELECT *
FROM ranked_sales
WHERE rnk <= 3;