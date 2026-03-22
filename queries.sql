-- Get all customers
SELECT * FROM Customers;

-- Get all products
SELECT * FROM Products;

-- Join example (Orders with Customers)
SELECT 
    Customers.name,
    Orders.order_id,
    Orders.order_date
FROM Orders
JOIN Customers 
ON Orders.customer_id = Customers.customer_id;
