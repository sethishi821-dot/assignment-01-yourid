-- =====================================
-- Q1: Total sales revenue by product category for each month
-- =====================================
SELECT 
    dim_date.month,
    dim_product.category,
    SUM(fact_sales.total_amount) AS total_revenue
FROM fact_sales
JOIN dim_date 
ON fact_sales.date_id = dim_date.date_id
JOIN dim_product 
ON fact_sales.product_id = dim_product.product_id
GROUP BY dim_date.month, dim_product.category
ORDER BY dim_date.month;


-- =====================================
-- Q2: Top 2 performing stores by total revenue
-- =====================================
SELECT 
    dim_store.store_name,
    SUM(fact_sales.total_amount) AS total_revenue
FROM fact_sales
JOIN dim_store 
ON fact_sales.store_id = dim_store.store_id
GROUP BY dim_store.store_name
ORDER BY total_revenue DESC
LIMIT 2;


-- =====================================
-- Q3: Month-over-month sales trend
-- =====================================
SELECT 
    dim_date.month,
    SUM(fact_sales.total_amount) AS monthly_sales
FROM fact_sales
JOIN dim_date 
ON fact_sales.date_id = dim_date.date_id
GROUP BY dim_date.month
ORDER BY dim_date.month;
