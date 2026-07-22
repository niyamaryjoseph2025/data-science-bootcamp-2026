-- ============================================================
-- Epochs '26 Assignment 2 - Northwind SQL Analysis
-- Database: northwind2000.sqlite
-- ============================================================

-- 1. TOP 10 SELLING PRODUCTS (by quantity sold, with revenue)
SELECT p.ProductName,
       SUM(od.Quantity) AS TotalQuantitySold,
       ROUND(SUM(od.Quantity * od.UnitPrice * (1 - od.Discount)), 2) AS TotalRevenue
FROM "Order Details" od
JOIN Products p ON od.ProductID = p.ProductID
GROUP BY p.ProductID
ORDER BY TotalQuantitySold DESC
LIMIT 10;


-- 2. TOP 10 CUSTOMERS BY REVENUE
SELECT c.CustomerID,
       c.CompanyName,
       ROUND(SUM(od.Quantity * od.UnitPrice * (1 - od.Discount)), 2) AS TotalRevenue
FROM Orders o
JOIN "Order Details" od ON o.OrderID = od.OrderID
JOIN Customers c ON o.CustomerID = c.CustomerID
GROUP BY c.CustomerID
ORDER BY TotalRevenue DESC
LIMIT 10;


-- 3. MONTHLY SALES TRENDS
SELECT strftime('%Y-%m', o.OrderDate) AS Month,
       ROUND(SUM(od.Quantity * od.UnitPrice * (1 - od.Discount)), 2) AS MonthlyRevenue,
       COUNT(DISTINCT o.OrderID) AS NumOrders
FROM Orders o
JOIN "Order Details" od ON o.OrderID = od.OrderID
GROUP BY Month
ORDER BY Month;


-- 4. BEST-PERFORMING PRODUCT CATEGORIES
SELECT cat.CategoryName,
       ROUND(SUM(od.Quantity * od.UnitPrice * (1 - od.Discount)), 2) AS CategoryRevenue,
       SUM(od.Quantity) AS TotalUnitsSold
FROM "Order Details" od
JOIN Products p ON od.ProductID = p.ProductID
JOIN Categories cat ON p.CategoryID = cat.CategoryID
GROUP BY cat.CategoryID
ORDER BY CategoryRevenue DESC;


-- 5. CUSTOMER PURCHASE FREQUENCY
SELECT c.CustomerID,
       c.CompanyName,
       COUNT(DISTINCT o.OrderID) AS NumOrders,
       MIN(o.OrderDate) AS FirstOrder,
       MAX(o.OrderDate) AS LastOrder
FROM Orders o
JOIN Customers c ON o.CustomerID = c.CustomerID
GROUP BY c.CustomerID
ORDER BY NumOrders DESC
LIMIT 10;
