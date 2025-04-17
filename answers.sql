-- DROP TABLE ProductDetail_1NF;
-- CREATE TABLE ProductDetail_1NF (
--     OrderID INT,
--     CustomerName VARCHAR(255),
--     Product VARCHAR(255)
-- );

-- Insert data into the ProductDetail_1NF table
-- INSERT INTO ProductDetail_1NF (OrderID, CustomerName, Product)
-- SELECT OrderID, CustomerName, TRIM(SUBSTRING_INDEX(SUBSTRING_INDEX(Products, ',', n.n), ',', -1)) AS Product
-- FROM ProductDetail
-- JOIN (SELECT 1 AS n UNION ALL SELECT 2 UNION ALL SELECT 3 UNION ALL SELECT 4 UNION ALL SELECT 5 UNION ALL SELECT 6 UNION ALL SELECT 7 UNION ALL SELECT 8) n
--   ON CHAR_LENGTH(Products) - CHAR_LENGTH(REPLACE(Products, ',', '')) >= n.n - 1
-- ORDER BY OrderID, n.n;

-- Create the OrderDetails table without CustomerName
-- CREATE TABLE OrderDetails_2NF (
--     OrderID INT,
--     Product VARCHAR(255),
--     Quantity INT
-- );

-- -- Create the CustomerDetails table
-- CREATE TABLE CustomerDetails_2NF (
--     OrderID INT,
--     CustomerName VARCHAR(255)
-- );

-- Insert data into the OrderDetails_2NF table
-- INSERT INTO OrderDetails_2NF (OrderID, Product, Quantity)
-- SELECT orderNumber, productCode, quantityOrdered
-- FROM OrderDetails;

-- SHOW COLUMNS FROM orders;

-- INSERT INTO CustomerDetails_2NF (OrderID, CustomerName)
-- SELECT DISTINCT o.orderNumber, c.CustomerName
-- FROM orders o
-- JOIN cust_table c ON o.customerNumber = c.CustomerID;

-- INSERT INTO cust_table (CustomerID, CustomerName)
-- VALUES
-- (103, 'Customer 103'),
-- (112, 'Customer 112'),
-- (114, 'Customer 114'),
-- (119, 'Customer 119'),
-- (121, 'Customer 121'),
-- (124, 'Customer 124'),
-- (128, 'Customer 128'),
-- (129, 'Customer 129'),
-- (131, 'Customer 131'),
-- (141, 'Customer 141');

-- INSERT INTO CustomerDetails_2NF (OrderID, CustomerName)
-- SELECT DISTINCT o.orderNumber, c.CustomerName
-- FROM orders o
-- JOIN cust_table c ON o.customerNumber = c.CustomerID;

-- 1. OrderDetails_3NF
-- CREATE TABLE OrderDetails_3NF (
--     OrderID INT,
--     Product VARCHAR(255),
--     Quantity INT
-- );

-- -- 2. CustomerOrder_3NF
-- CREATE TABLE CustomerOrder_3NF (
--     OrderID INT,
--     CustomerName VARCHAR(255)
-- );

-- -- 3. CustomerInfo_3NF
-- CREATE TABLE CustomerInfo_3NF (
--     CustomerName VARCHAR(255),
--     CustomerCity VARCHAR(255)
-- );

-- INSERT INTO OrderDetails_3NF (OrderID, Product, Quantity)
-- SELECT OrderID, Product, Quantity
-- FROM OrderDetails_2NF;

-- INSERT INTO CustomerOrder_3NF (OrderID, CustomerName)
-- SELECT OrderID, CustomerName
-- FROM CustomerDetails_2NF;

-- INSERT INTO CustomerInfo_3NF (CustomerName, CustomerCity)
-- VALUES
-- ('Customer 103', 'New York'),
-- ('Customer 112', 'Los Angeles'),
-- ('Customer 114', 'Chicago'),
-- ('Customer 119', 'Houston'),
-- ('Customer 121', 'Miami'),
-- ('Customer 124', 'Dallas'),
-- ('Customer 128', 'Atlanta'),
-- ('Customer 129', 'Phoenix'),
-- ('Customer 131', 'Seattle'),
-- ('Customer 141', 'San Francisco');
