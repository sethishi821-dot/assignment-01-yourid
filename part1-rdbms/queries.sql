-- =====================================
-- BASIC SELECT QUERIES
-- =====================================

-- View all customers
SELECT * FROM Customers;

-- View all products
SELECT * FROM Products;

-- View all orders
SELECT * FROM Orders;


-- =====================================
-- FILTERING DATA
-- =====================================

-- Customers from a specific city
SELECT * 
FROM Customers
WHERE city = 'Mumbai';

-- Products with price greater than 500
SELECT * 
FROM Products
WHERE price > 500;


-- =====================================
-- JOIN QUERIES (IMPORTANT)
-- =====================================

-- Get order details with customer name
SELECT 
    Orders.order_id,
    Customers.name,
    Orders.order_date,
    Orders.quantity
FROM Orders
JOIN Customers 
ON Orders.customer_id = Customers.customer_id;

-- Get order details with product name
SELECT 
    Orders.order_id,
    Products.product_name,
    Orders.quantity
FROM Orders
JOIN Products 
ON Orders.product_id = Products.product_id;

-- Get full order details (Customer + Product)
SELECT 
    Orders.order_id,
    Customers.name AS customer_name,
    Products.product_name,
    Orders.quantity,
    Orders.order_date
FROM Orders
JOIN Customers 
ON Orders.customer_id = Customers.customer_id
JOIN Products 
ON Orders.product_id = Products.product_id;


-- =====================================
-- AGGREGATE FUNCTIONS
-- =====================================

-- Total number of orders
SELECT COUNT(*) AS total_orders 
FROM Orders;

-- Total quantity ordered
SELECT SUM(quantity) AS total_quantity 
FROM Orders;

-- Average product price
SELECT AVG(price) AS avg_price 
FROM Products;

-- Maximum product price
SELECT MAX(price) AS max_price 
FROM Products;

-- Minimum product price
SELECT MIN(price) AS min_price 
FROM Products;


-- =====================================
-- GROUP BY (VERY IMPORTANT FOR MARKS)
-- =====================================

-- Total orders per customer
SELECT 
    customer_id,
    COUNT(order_id) AS total_orders
FROM Orders
GROUP BY customer_id;

-- Total quantity per product
SELECT 
    product_id,
    SUM(quantity) AS total_quantity
FROM Orders
GROUP BY product_id;

-- Total sales per customer (if price used)
SELECT 
    Customers.name,
    SUM(Orders.quantity * Products.price) AS total_sales
FROM Orders
JOIN Customers 
ON Orders.customer_id = Customers.customer_id
JOIN Products 
ON Orders.product_id = Products.product_id
GROUP BY Customers.name;


-- =====================================
-- ORDER BY
-- =====================================

-- Products sorted by price (high to low)
SELECT * 
FROM Products
ORDER BY price DESC;

-- Customers sorted by name
SELECT * 
FROM Customers
ORDER BY name ASC;


-- =====================================
-- LIMIT (TOP RECORDS)
-- =====================================

-- Top 5 expensive products
SELECT * 
FROM Products
ORDER BY price DESC
LIMIT 5;


-- =====================================
-- BONUS (ADVANCED)
-- =====================================

-- Customers who placed more than 2 orders
SELECT 
    customer_id,
    COUNT(order_id) AS total_orders
FROM Orders
GROUP BY customer_id
HAVING COUNT(order_id) > 2;

-- Total revenue of all orders
SELECT 
    SUM(Orders.quantity * Products.price) AS total_revenue
FROM Orders
JOIN Products 
ON Orders.product_id = Products.product_id;
