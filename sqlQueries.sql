use STORESALE;
-- 1. Select data from Customers, Orders, and Products tables
SELECT c.CustomerName, o.OrderID, p.ProductName, o.OrderDate
FROM Customers c
JOIN Orders o ON c.CustomerID = o.CustomerID
JOIN Order_Items oi ON o.OrderID = oi.OrderID
JOIN Products p ON oi.ProductID = p.ProductID;

-- 2. Perform aggregation (SUM) and grouping operation (GROUP BY customer)
SELECT c.CustomerName, SUM(o.Sales) AS TotalSales
FROM Customers c
JOIN Orders o ON c.CustomerID = o.CustomerID
GROUP BY c.CustomerName;

-- 3. Select data from Categories, Products, and Orders tables
SELECT c.CategoryName, p.ProductName, COUNT(o.OrderID) AS TotalOrders
FROM Categories c
JOIN Products p ON c.CategoryName = p.CategoryName
JOIN Order_Items oi ON p.ProductID = oi.ProductID
JOIN Orders o ON oi.OrderID = o.OrderID
GROUP BY c.CategoryName, p.ProductName;



