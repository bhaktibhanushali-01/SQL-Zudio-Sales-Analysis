CREATE DATABASE zudio_sales;
USE zudio_sales;

SELECT * 
FROM zudio 
LIMIT 10;



-- / -- 1. Revenue & Profitability Insights -- /

## 1. Which states generate the highest revenue?
SELECT state, SUM(price * quantity) AS revenue 
FROM zudio 
GROUP BY state 
ORDER BY revenue DESC
LIMIT 1;

## 2. Which states generate the highest profit?
SELECT state, SUM(profit) AS net_profit 
FROM zudio 
GROUP BY state 
ORDER BY net_profit DESC 
LIMIT 1;

## 3. Are high-revenue states also high-profit states?
SELECT state, SUM(price * quantity) AS revenue, SUM(profit) AS net_profit 
FROM zudio 
GROUP BY state 
ORDER BY revenue DESC;

## 4. Which cities are underperforming in profit despite good sales?
SELECT state, SUM(price * quantity) AS revenue, SUM(profit) AS net_profit 
FROM zudio 
GROUP BY state 
ORDER BY net_profit ASC;

## 5. What is the overall profit margin (%)?
SELECT ROUND((SUM(profit)/SUM(quantity * price)) *100, 2) AS profit_pct 
FROM zudio;

## 6. What is the profit margin by state?
SELECT state, ROUND((SUM(profit)/SUM(quantity * price)) * 100, 2) AS profit_pct 
FROM zudio 
GROUP BY state;

## 7. What is the profit margin by category (Men, Women, Kids)?
SELECT category, ROUND((SUM(profit)/SUM(quantity * price)) * 100, 2) AS profit_pct 
FROM zudio 
GROUP BY category;

## 8. Which clothing type hAS the highest profit per unit?
SELECT cloth_type, ROUND(SUM(profit)/SUM(quantity) * 100, 2) AS profit_pct 
FROM zudio 
GROUP BY cloth_type 
ORDER BY profit_pct DESC;

## 9. Which clothing type sells the most but earns low profit?
SELECT cloth_type, SUM(quantity) AS qty, SUM(profit) AS net_profit 
FROM zudio 
GROUP BY cloth_type 
ORDER BY qty DESC;

## 10. What are the top 10 most profitable stores?
SELECT store_no, SUM(profit) AS net_profit 
FROM zudio 
GROUP BY store_no 
ORDER BY net_profit DESC 
LIMIT 10;


-- / -- 🏪 2. Store Performance Analysis --/
## 11. Do owned stores perform better than rented stores?
SELECT store_type, SUM(quantity * price) AS revenue, SUM(profit) AS net_profit 
FROM zudio 
GROUP BY store_type;

## 12. What is the average revenue per store type?
SELECT store_type, ROUND(AVG(quantity * price), 2) AS avg_revenue 
FROM zudio 
GROUP BY store_type;

## 13. What is the average profit per store type?
SELECT store_type, ROUND(avg(profit), 2) AS avg_profit 
FROM zudio 
GROUP BY store_type;

## 14. Which store hAS the highest revenue per sq ft?
SELECT store_no, ROUND(SUM(quantity * price)/max(selling_area), 2) AS revenue_per_sqft 
FROM zudio 
GROUP BY store_no 
ORDER BY revenue_per_sqft 
LIMIT 1;

## 15. Does larger selling area mean higher revenue?
SELECT selling_area, SUM(quantity * price) AS revenue 
FROM zudio 
GROUP BY selling_area;

## 16. Does staff count impact sales?
SELECT staff, SUM(quantity * price) AS revenue 
FROM zudio 
GROUP BY staff;

## 17. Does parking availability increASe store sales?
SELECT parking, SUM(quantity * price) AS revenue 
FROM zudio 
GROUP BY parking;

## 18. Do stores with CCTV + Alarm perform better?
SELECT security, SUM(quantity * price) AS revenue 
FROM zudio 
GROUP BY security;

## 19. Which store managers handle the most profitable stores?
SELECT manager, SUM(profit) AS net_profit 
FROM zudio 
GROUP BY manager 
ORDER BY net_profit;

## 20. Which stores are loss-making (if any)?
SELECT store_no, SUM(profit) AS net_profit 
FROM zudio 
GROUP BY store_no 
HAVING net_profit < 0;


-- / --  📦 3. Product & Category Insights -- /
## 21. Which category is best-selling by revenue?
SELECT category, SUM(quantity*price) AS revenue 
FROM zudio 
GROUP BY category 
ORDER BY revenue DESC 
LIMIT 1;

## 22. Which category is best-selling by quantity?
SELECT category, SUM(quantity) AS qty 
FROM zudio 
GROUP BY category 
ORDER BY qty DESC 
LIMIT 1;

## 23. Which clothing type is most profitable?
SELECT category, SUM(profit) AS net_profit 
FROM zudio 
GROUP BY category 
ORDER BY net_profit DESC 
LIMIT 1;

## 24. What are the top 10 most sold products?
SELECT prod_id, SUM(quantity) AS most_sold 
FROM zudio 
GROUP BY prod_id 
ORDER BY most_sold DESC 
LIMIT 1;

## 25. Which clothing types have low sales but high profit margin?
SELECT cloth_type, SUM(quantity*price) AS sales, SUM(profit) AS net_profit 
FROM zudio 
GROUP BY cloth_type 
ORDER BY sales ASC;

## 26. What is the category contribution to total revenue (%)?
SELECT category, (SUM(price * quantity)/(SELECT SUM(price * quantity) FROM zudio)) * 100 AS rev_share 
FROM zudio 
GROUP BY category;

## 27. Which category shows seASonal spikes?
SELECT month, category, SUM(price * quantity) AS revenue 
FROM zudio 
GROUP BY month, category 
ORDER BY month;

## 28. Which clothing types should be expanded bASed on profitability?
SELECT category, SUM(profit) AS net_profit 
FROM zudio 
GROUP BY category 
ORDER BY net_profit DESC;

## 29. What is the average order value by category?
SELECT category, SUM(price*quantity)/count(distinct order_id) AS aov 
FROM zudio 
GROUP BY category;

## 30. Which products have the highest average quantity per order?
SELECT prod_id, AVG(quantity) AS aqpv 
FROM zudio 
GROUP BY prod_id 
ORDER BY aqpv DESC 
LIMIT 1;



-- / -- 👥 4. Customer Insights --/
## 31. Who are the top 10 highest spending customers?
SELECT cust_id, cust_name, SUM(price * quantity) AS spend 
FROM zudio 
GROUP BY cust_id, cust_name 
ORDER BY spend; 

## 32. How many repeat customers are there?
SELECT COUNT(*) AS repeaters 
FROM (SELECT cust_id FROM zudio GROUP BY cust_id HAVING COUNT(order_id) > 1) AS repeat_table;

## 33. What is the average revenue per customer?
SELECT AVG(cust_total) AS avg_revenue 
FROM (SELECT cust_id, SUM(price*quantity) AS cust_total FROM zudio group by cust_id) AS total_custs;

## 34. What is the customer purchASe frequency?
SELECT cust_id, COUNT(DISTINCT order_id) AS freq 
FROM zudio 
GROUP BY cust_id 
ORDER BY freq DESC;

## 35. Which month sees the most unique customers?
SELECT month, COUNT(DISTINCT order_id) AS unique_cust 
FROM zudio 
GROUP BY month 
ORDER BY unique_cust DESC;

## 36. What is the estimated customer lifetime value?
SELECT cust_id, cust_name, SUM(price*quantity) AS ltv 
FROM zudio 
GROUP BY cust_id, cust_name 
ORDER BY ltv DESC; 

## 37. Do high-value customers prefer specific categories?
SELECT cust_id, category, SUM(price*quantity) AS spend 
FROM zudio 
GROUP BY cust_id, category 
ORDER BY spend; 

## 38. What is the distribution of order sizes (single item vs bulk buyers)?
SELECT quantity, COUNT(*) AS orders 
FROM zudio 
GROUP BY quantity 
ORDER BY quantity;

## 39. What percentage of customers generate 80% of revenue? (Pareto Analysis)
with store_revenue AS (SELECT store_no, SUM(price * quantity) AS store_revenue FROM zudio GROUP BY store_no),
ranked_stores AS (SELECT *, ntile(5) OVER(ORDER BY store_revenue DESC) AS revenue_bucket FROM store_revenue)
SELECT(SUM(cASe WHEN revenue_bucket = 1 THEN store_revenue END)/(SELECT SUM(price * quantity) FROM zudio)) *100 AS top20_revenue_pct 
FROM ranked_stores;

## 40. Which states have the highest customer spending per order?
SELECT state, SUM(price * quantity)/COUNT(DISTINCT order_id) AS avg_spend_value 
FROM zudio 
GROUP BY state 
ORDER BY avg_spend_value DESC;



-- / -- 📅 5. Time-BASed Insights --/
## 41. What is the monthly revenue trend?
SELECT month, SUM(quantity * price) AS monthly_revenue 
FROM zudio GROUP BY month 
ORDER BY month;

## 42. What is the monthly profit trend?
SELECT month, SUM(profit) AS monthly_profit 
FROM zudio 
GROUP BY month 
ORDER BY month;

## 43. Which month hAS the highest sales?
SELECT month, SUM(quantity * price) AS monthly_revenue 
FROM zudio 
GROUP BY month 
ORDER BY monthly_revenue DESC 
LIMIT 1;

## 44. Which month hAS the lowest profit?
SELECT month, SUM(profit) AS monthly_profit 
FROM zudio 
GROUP BY month 
ORDER BY monthly_profit ASC 
LIMIT 1;

## 45. What is the month-over-month sales growth rate?
SELECT month, SUM(price*quantity) AS revenue, LAG(SUM(price*quantity)) OVER(ORDER BY month) AS prev_month_revenue, 
((SUM(price*quantity) - LAG(SUM(price*quantity)) OVER (ORDER BY month))/LAG(SUM(price * quantity)) OVER(ORDER BY month)) * 100 AS growth_pct 
FROM zudio 
GROUP BY month;

## 46. What are the seASonal trends by category?
SELECT month, category, SUM(price * quantity) AS revenue 
FROM zudio 
GROUP BY month, category 
ORDER BY month;

## 47. Does festive seASon impact Women/Kids category more?
SELECT month, category, SUM(price * quantity) AS revenue 
FROM zudio 
WHERE category IN ('kids', 'Women') 
GROUP BY month, category 
ORDER BY month;

## 48. How do stores perform before and after their opening year?
SELECT YEAR(store_open) AS opening_yr, SUM(price * quantity) AS revenue 
FROM zudio 
GROUP BY opening_yr 
ORDER BY opening_yr;

## 49. Which stores ramped up fAStest after opening?
SELECT store_no, YEAR(order_date) - YEAR(store_open) AS yrs_since_open, SUM(price * quantity) AS revenue 
FROM zudio 
GROUP BY store_no, yrs_since_open 
ORDER BY revenue DESC;

## 50. How does revenue vary by store age (new vs old stores)?
SELECT cASe WHEN YEAR(curdate()) - YEAR(store_open) <= 2 THEN 'New' ELSE 'Old' END AS store_age, SUM(price*quantity) AS revenue 
FROM zudio 
GROUP BY store_age 
ORDER BY revenue;


 -- / -- 📊 6. Operational Efficiency Insights -- /
## 51. What is the revenue per staff member?
SELECT store_no, SUM(price * quantity)/MAX(staff) AS revenue_per_staff 
FROM zudio 
GROUP BY store_no 
ORDER BY revenue_per_staff DESC;

## 52. What is the profit per sq ft?
SELECT store_no, SUM(profit)/MAX(selling_area) AS profit_per_sqft 
FROM zudio 
GROUP BY store_no 
ORDER BY profit_per_sqft DESC;

## 53. What is the revenue per order?
SELECT SUM(price * quantity)/COUNT(DISTINCT order_id) AS rev_per_order 
FROM zudio;

## 54. What is the profit per order?
SELECT SUM(profit)/COUNT(DISTINCT order_id) AS profit_per_order 
FROM zudio;

## 55. Which stores have the highest operational efficiency ratio?
SELECT store_no, SUM(profit)/MAX(op_hours) AS OER 
FROM zudio 
GROUP BY store_no 
ORDER BY OER DESC 
LIMIT 1;

## 56. Which state hAS the highest revenue density (revenue per store)?
SELECT state, SUM(price * quantity)/COUNT(distinct store_no) AS Revenue_density 
FROM zudio 
GROUP BY state 
ORDER BY Revenue_density DESC 
LIMIT 1;

## 57. Does store size correlate with staff count?
SELECT selling_area, AVG(staff) 
FROM zudio 
GROUP BY selling_area 
ORDER BY selling_area;

## 58. Does store size correlate with profitability?
SELECT selling_area, AVG(profit) 
FROM zudio 
GROUP BY selling_area 
ORDER BY selling_area;

## 59. Which large stores are underperforming?
SELECT store_no, MAX(selling_area) AS size, SUM(profit) AS pro 
FROM zudio 
GROUP BY store_no 
HAVING size > 1100 AND pro < 200000;

## 60. Which small stores are highly profitable?
SELECT store_no, MAX(selling_area) AS size, SUM(profit) AS profits 
FROM zudio 
GROUP BY store_no 
HAVING size < 1000 
ORDER BY profits DESC;




-- / -- 🧠 7. Strategic / Executive-Level Questions -- /
## 61. If we close the bottom 10% of stores, what is the profit impact?
with store_profit AS (SELECT store_no, SUM(profit) AS profits FROM zudio GROUP BY store_no),
ranked_stores AS (SELECT *, ntile(10) OVER(order by profits ASC) AS profit_bucket FROM store_profit)
SELECT SUM(profits) AS bottom10_pct_profit FROM ranked_stores WHERE profit_bucket = 1;

## 62. Which 3 states should we expand into more?
SELECT state, SUM(profit) AS profits 
FROM zudio 
GROUP BY state 
ORDER BY profits DESC 
LIMIT 3;

## 63. If we double Women category inventory, what could be the revenue impact?
SELECT (SUM(cASe when category = 'Women' then price * quantity else 0 end)/SUM(price * quantity)) AS women_pct 
FROM zudio;

## 64. Which category should receive more marketing budget?
SELECT category, SUM(price * quantity) AS revenue, (SUM(profit)/SUM(price * quantity)) * 100 AS margin 
FROM zudio 
GROUP BY category 
ORDER BY margin DESC;

## 65. Where are we losing margin?
SELECT category, SUM(price * quantity) AS revenue, (SUM(profit)/SUM(price * quantity)) * 100 AS margin 
FROM zudio 
GROUP BY category 
ORDER BY margin ASC;

## 66. Which stores are high revenue but low margin (pricing issue)?
SELECT store_no, SUM(price * quantity) AS revenue, (SUM(profit)/SUM(price*quantity)) * 100 AS margin 
FROM zudio 
GROUP BY store_no 
ORDER BY margin DESC;

## 67. Which product types need price optimization?
SELECT cloth_type, AVG(price) AS avg_price, SUM(profit) AS profits 
FROM zudio 
GROUP BY cloth_type 
ORDER BY profits ASC;

## 68. What percentage of revenue comes FROM the top 20% stores?
with store_revenue AS (SELECT store_no, SUM(price*quantity) AS store_revenue FROM zudio GROUP BY store_no),
ranked_stores AS (SELECT *, ntile(5) OVER(ORDER BY store_revenue desc) AS revenue_bucket FROM store_revenue)
SELECT(SUM(cASe WHEN revenue_bucket = 1 THEN store_revenue END) / (SELECT SUM(price * quantity) FROM zudio)) * 100 AS top20_revenue_pct 
FROM ranked_stores;

## 69. Which combination (State + Category) is most profitable?
SELECT state, category, SUM(profit) AS profits 
FROM zudio 
GROUP BY state, category 
ORDER BY profits DESC;

## 70. Is the business more dependent on location or category?
SELECT state, category, SUM(price * quantity) AS revenue 
FROM zudio 
GROUP BY state, category 
ORDER BY revenue DESC;
