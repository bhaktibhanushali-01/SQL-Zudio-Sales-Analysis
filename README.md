<!DOCTYPE html>
<html>
<head>
</head>

<body>

<h1 align="center">🛍️ SQL: Zudio Sales Analysis</h1>

<h2>📊 Project Overview</h2>

<p>
The <b>Zudio Sales Analysis Project</b> is a SQL-based data analytics project
designed to analyze retail sales data and extract meaningful business insights.
</p>

<p>
Using SQL queries, the project explores sales transactions, product categories,
customer behavior, and revenue patterns to understand the overall performance
of the retail business.
</p>

<p>
The objective of this project is to demonstrate practical SQL skills including
data exploration, aggregation, filtering, and business analysis.
</p>

<hr>

<h2>🎯 Business Problem</h2>

<ul>
<li>Retail businesses generate large volumes of transaction data.</li>
<li>Identifying top-performing products and categories can be difficult.</li>
<li>Sales trends and customer purchasing patterns are often hidden in raw data.</li>
<li>Business managers need insights to improve sales strategies.</li>
</ul>

<p>
This project uses SQL queries to analyze sales data and generate insights that
can support better business decision-making.
</p>

<hr>

<h2>🗄️ Database Structure</h2>

<p>
The dataset contains retail sales information including:
</p>

<ul>
<li>Transaction ID</li>
<li>Customer ID</li>
<li>Product Category</li>
<li>Product Name</li>
<li>Quantity Sold</li>
<li>Unit Price</li>
<li>Total Sales Amount</li>
<li>Order Date</li>
</ul>

<p>
The database was structured using SQL and analyzed through various queries.
</p>

<hr>

<h2>⚙ SQL Operations Performed</h2>

<ul>
<li>Database Creation</li>
<li>Table Creation</li>
<li>Data Cleaning</li>
<li>Exploratory Data Analysis (EDA)</li>
<li>Aggregations using SUM(), COUNT(), AVG()</li>
<li>Filtering using WHERE clause</li>
<li>Grouping using GROUP BY</li>
<li>Sorting using ORDER BY</li>
</ul>

<hr>

<h2>📊 Business Questions Answered</h2>

<ul>
<li>What is the total sales revenue generated?</li>
<li>Which product categories generate the highest sales?</li>
<li>Which products are the top-selling items?</li>
<li>What are the monthly sales trends?</li>
<li>Which customers contribute the most revenue?</li>
</ul>

<hr>

<h2>📈 Example SQL Queries</h2>

<pre>

-- Total Sales Revenue
SELECT SUM(total_sales)
FROM sales;

-- Top Selling Products
SELECT product_name, SUM(quantity) AS total_quantity
FROM sales
GROUP BY product_name
ORDER BY total_quantity DESC;

-- Category Wise Sales
SELECT category, SUM(total_sales) AS category_sales
FROM sales
GROUP BY category
ORDER BY category_sales DESC;

</pre>

<hr>

<h2>📁 Project Structure</h2>

<pre>
SQL--Zudio-Sales-Analysis
│
├── zudio_sales_analysis.sql
└── README.md
</pre>

<hr>

<h2>🛠 Tools & Technologies Used</h2>

<table border="1" cellpadding="8">

<tr>
<th>Tool</th>
<th>Purpose</th>
</tr>

<tr>
<td>SQL</td>
<td>Data Querying & Analysis</td>
</tr>

<tr>
<td>MySQL / PostgreSQL</td>
<td>Database Management</td>
</tr>

<tr>
<td>SQL Workbench</td>
<td>Query Execution</td>
</tr>

<tr>
<td>Excel / CSV</td>
<td>Dataset Storage</td>
</tr>

</table>

<hr>

<h2>🔍 Key Insights</h2>

<ul>
<li>Some product categories contribute significantly more revenue.</li>
<li>Top-selling products drive the majority of sales.</li>
<li>Sales trends show variation across months.</li>
<li>Understanding customer purchasing behavior helps improve marketing strategies.</li>
</ul>

<hr>

<h2>🚀 Skills Demonstrated</h2>

<ul>
<li>SQL Data Analysis</li>
<li>Data Cleaning</li>
<li>Exploratory Data Analysis</li>
<li>Aggregation Functions</li>
<li>Business Insight Generation</li>
<li>Retail Sales Analysis</li>
</ul>

<hr>

<h2>🔮 Future Improvements</h2>

<ul>
<li>Integrate the dataset with Power BI dashboard</li>
<li>Create advanced SQL queries using window functions</li>
<li>Perform customer segmentation analysis</li>
<li>Build automated data pipelines</li>
</ul>

<hr>

<h2>👨‍💻 Author</h2>

<p>
<b>Omkar Chafekar</b><br>
GitHub: 
<a href="https://github.com/Omkar2304">https://github.com/Omkar2304</a>
</p>

<hr>

<p align="center">
⭐ If you found this project useful, consider starring the repository.
</p>

</body>
</html>
