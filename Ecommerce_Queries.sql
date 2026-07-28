/*
========================================================
E-Commerce Business Analytics 
 SQL Business Questions
Database: Ecommerce_data
Executive KPIs, Sales, Customers, Regions, Shipping & Profitability
========================================================
*/

------------------------------------------------------------------------------------------

1. What are the total sales revenue, total profit, total orders, and total unique customers?


SELECT 
    ROUND(SUM(sales_per_order),2) AS total_sales_revenue,
    ROUND(SUM(profit_per_order),2) AS total_profit,
    COUNT(DISTINCT order_id) AS total_orders,
    COUNT(DISTINCT customer_id) AS total_unique_customers
FROM orders;

------------------------------------------------------------------------------------------
2. What is the average sales value per order?


SELECT ROUND(AVG(order_total),2) AS avg_sales_value_per_order
FROM (
    SELECT order_id, SUM(sales_per_order) AS order_total
    FROM orders
    GROUP BY order_id
);

------------------------------------------------------------------------------------------                

3. What is the overall profit margin percentage?

SELECT ROUND(SUM(profit_per_order) * 100.0 / SUM(sales_per_order), 2) AS profit_margin_pct
FROM orders;

------------------------------------------------------------------------------------------           

4. What percentage of orders are profitable versus loss-making?

SELECT 
    profit_status,
    COUNT(*) AS record_count,
    ROUND(COUNT(*) * 100.0 / (SELECT COUNT(*) FROM orders), 2) AS percentage
FROM orders
GROUP BY profit_status
ORDER BY record_count DESC;

------------------------------------------------------------------------------------------   

5. How does sales performance change month by month?

SELECT 
    order_year,
    order_month_name,
    ROUND(SUM(sales_per_order),2) AS total_sales
FROM orders
GROUP BY order_year, order_month, order_month_name
ORDER BY order_year, order_month;

------------------------------------------------------------------------------------------  

6. Which month generated the highest sales revenue?

SELECT 
    order_year,
    order_month_name,
    ROUND(SUM(sales_per_order),2) AS total_sales
FROM orders
GROUP BY order_year, order_month, order_month_name
ORDER BY total_sales DESC
LIMIT 1;

------------------------------------------------------------------------------------------

7. Which product categories generate the highest and lowest sales?

SELECT 
    category_name,
    ROUND(SUM(sales_per_order),2) AS total_sales
FROM orders
GROUP BY category_name
ORDER BY total_sales DESC;

------------------------------------------------------------------------------------------
8. Which products generate the highest total sales revenue?

SELECT 
    product_name,
    ROUND(SUM(sales_per_order),2) AS total_sales
FROM orders
GROUP BY product_name
ORDER BY total_sales DESC
LIMIT 10;

------------------------------------------------------------------------------------------

9. Which products generate the highest total profit?

SELECT 
    product_name,
    ROUND(SUM(profit_per_order),2) AS total_profit
FROM orders
GROUP BY product_name
ORDER BY total_profit DESC
LIMIT 10;

------------------------------------------------------------------------------------------

10. Who are the top 10 customers based on total sales?

SELECT 
    customer_id,
    customer_first_name || ' ' || customer_last_name AS customer_name,
    ROUND(SUM(sales_per_order),2) AS total_sales
FROM orders
GROUP BY customer_id, customer_name
ORDER BY total_sales DESC
LIMIT 10;

------------------------------------------------------------------------------------------ 

11. Who are the top 10 customers based on total profit?

SELECT 
    customer_id,
    customer_first_name || ' ' || customer_last_name AS customer_name,
    ROUND(SUM(profit_per_order),2) AS total_profit
FROM orders
GROUP BY customer_id, customer_name
ORDER BY total_profit DESC
LIMIT 10;

------------------------------------------------------------------------------------------  

12. Which customer segment contributes the highest sales and profit?

SELECT 
    customer_segment,
    ROUND(SUM(sales_per_order),2) AS total_sales,
    ROUND(SUM(profit_per_order),2) AS total_profit
FROM orders
GROUP BY customer_segment
ORDER BY total_sales DESC;

------------------------------------------------------------------------------------------

13. Which customer segment places the highest number of orders?

SELECT 
    customer_segment,
    COUNT(DISTINCT order_id) AS total_orders
FROM orders
GROUP BY customer_segment
ORDER BY total_orders DESC;

------------------------------------------------------------------------------------------

14. Which regions generate the highest sales and profit?

SELECT 
    customer_region,
    ROUND(SUM(sales_per_order),2) AS total_sales,
    ROUND(SUM(profit_per_order),2) AS total_profit
FROM orders
GROUP BY customer_region
ORDER BY total_sales DESC;

------------------------------------------------------------------------------------------

15. Which states generate the highest sales revenue?

SELECT 
    customer_state,
    ROUND(SUM(sales_per_order),2) AS total_sales
FROM orders
GROUP BY customer_state
ORDER BY total_sales DESC
LIMIT 10;
 
------------------------------------------------------------------------------------------

16. Which cities contribute the most sales?

SELECT 
    customer_city,
    ROUND(SUM(sales_per_order),2) AS total_sales
FROM orders
GROUP BY customer_city
ORDER BY total_sales DESC
LIMIT 10;

------------------------------------------------------------------------------------------

17. Which region has the highest average order value?

SELECT 
    customer_region,
    ROUND(SUM(sales_per_order) * 1.0 / COUNT(DISTINCT order_id), 2) AS avg_order_value
FROM orders
GROUP BY customer_region
ORDER BY avg_order_value DESC;

------------------------------------------------------------------------------------------    

18. What is the distribution of delivery statuses?

SELECT 
    delivery_status,
    COUNT(*) AS record_count,
    ROUND(COUNT(*) * 100.0 / (SELECT COUNT(*) FROM orders), 2) AS percentage
FROM orders
GROUP BY delivery_status
ORDER BY record_count DESC;

------------------------------------------------------------------------------------------   

19. Which shipping type is used most frequently?

SELECT 
    shipping_type,
    COUNT(*) AS record_count
FROM orders
GROUP BY shipping_type
ORDER BY record_count DESC;

------------------------------------------------------------------------------------------       

20. Which shipping type generates the highest sales and profit?


SELECT 
    shipping_type,
    ROUND(SUM(sales_per_order),2) AS total_sales,
    ROUND(SUM(profit_per_order),2) AS total_profit
FROM orders
GROUP BY shipping_type
ORDER BY total_sales DESC;

------------------------------------------------------------------------------------------

21. Which shipping type has the highest average delivery delay?

SELECT 
    shipping_type,
    ROUND(AVG(delivery_delay),2) AS avg_delivery_delay
FROM orders
GROUP BY shipping_type
ORDER BY avg_delivery_delay DESC;

------------------------------------------------------------------------------------------

22. How many orders were delivered early, on time, and late?

SELECT 
    CASE 
        WHEN delivery_delay < 0 THEN 'Early'
        WHEN delivery_delay = 0 THEN 'On Time'
        ELSE 'Late'
    END AS delivery_timing,
    COUNT(*) AS record_count
FROM orders
GROUP BY delivery_timing
ORDER BY record_count DESC;

------------------------------------------------------------------------------------------

23. Which categories generate the highest profit and the highest loss?

SELECT 
    category_name,
    ROUND(SUM(profit_per_order),2) AS total_profit
FROM orders
GROUP BY category_name
ORDER BY total_profit DESC;

------------------------------------------------------------------------------------------

24. Which months recorded the highest profit and the highest loss?

SELECT 
    order_year,
    order_month_name,
    ROUND(SUM(profit_per_order),2) AS total_profit
FROM orders
GROUP BY order_year, order_month, order_month_name
ORDER BY total_profit DESC;

------------------------------------------------------------------------------------------ 

25. Which weekdays generate the highest sales and profit?

SELECT 
    order_day,
    ROUND(SUM(sales_per_order),2) AS total_sales,
    ROUND(SUM(profit_per_order),2) AS total_profit
FROM orders
GROUP BY order_day
ORDER BY total_sales DESC;

------------------------------------------------------------------------------------------