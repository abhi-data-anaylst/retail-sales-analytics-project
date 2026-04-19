CREATE DATABASE retail_project;
USE retail_project;
CREATE TABLE sales (
    order_id INT PRIMARY KEY,
    order_date DATE,
    customer_name VARCHAR(100),
    region VARCHAR(50),
    product VARCHAR(100),
    category VARCHAR(50),
    sales DECIMAL(10,2),
    quantity INT
);
INSERT INTO sales VALUES
(1, '2024-01-01', 'Amit Sharma', 'West', 'Laptop', 'Electronics', 55000, 1),
(2, '2024-01-02', 'Rahul Verma', 'North', 'Mobile', 'Electronics', 20000, 2),
(3, '2024-01-03', 'Sneha Patil', 'South', 'Chair', 'Furniture', 5000, 3),
(4, '2024-01-04', 'Priya Singh', 'East', 'Table', 'Furniture', 8000, 1),
(5, '2024-01-05', 'Ankit Gupta', 'West', 'Headphones', 'Electronics', 3000, 2),
(6, '2024-01-06', 'Neha Jain', 'North', 'Shoes', 'Fashion', 2500, 2),
(7, '2024-01-07', 'Rohit Mehta', 'South', 'Watch', 'Fashion', 7000, 1),
(8, '2024-01-08', 'Pooja Nair', 'East', 'Bag', 'Fashion', 1500, 3),
(9, '2024-01-09', 'Karan Shah', 'West', 'Tablet', 'Electronics', 15000, 1),
(10, '2024-01-10', 'Simran Kaur', 'North', 'Sofa', 'Furniture', 25000, 1);
SELECT * FROM sales;
--total sales
SELECT SUM(sales) AS total_sales FROM sales;
--total orders
SELECT COUNT(*) FROM sales;
--average sales
SELECT AVG(sales) FROM sales;
--top products
SELECT product, SUM(sales) AS total_sales
FROM sales
GROUP BY product
ORDER BY total_sales DESC;
--sales by region
SELECT region, SUM(sales) AS total_sales
FROM sales
GROUP BY region;
--category analysis
SELECT category, SUM(sales) AS total_sales
FROM sales
GROUP BY category;
--monthly sales
SELECT MONTH(order_date) AS month,
       SUM(sales) AS total_sales
FROM sales
GROUP BY month;
--Ranking
SELECT product,
       SUM(sales) AS total_sales,
       RANK() OVER (ORDER BY SUM(sales) DESC) AS rank_position
FROM sales
GROUP BY product;
--Running total
SELECT order_date,
       SUM(sales) OVER (ORDER BY order_date) AS running_total
FROM sales;