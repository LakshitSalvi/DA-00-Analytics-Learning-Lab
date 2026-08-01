/*
===============================================================================
QUESTION
===============================================================================

Build an Executive Business Dashboard using SQL.

The executive leadership team requires a single report that summarizes
overall business performance.

The dashboard should answer the following questions:

1. What is the total revenue?
2. How many customers are active?
3. How many orders have been completed?
4. What is the average order value?
5. Which product category generates the highest revenue?
6. Who are the top five customers?
7. Which month generated the highest revenue?
8. Which products generate the highest revenue?
9. What is the current inventory value?
10. What are the key business KPIs?

*/

/*
===============================================================================
BUSINESS SCENARIO
===============================================================================

RetailHub's executive board reviews company performance every month.

Instead of looking at multiple reports, management wants one dashboard
that summarizes sales, customers, products, inventory,
and revenue trends.

As a Data Analyst, your task is to build an executive dashboard that
provides high-level KPIs for strategic decision-making.

*/

/*
===============================================================================
BUSINESS OBJECTIVE
===============================================================================

Generate executive KPIs including:

• Total Revenue
• Total Customers
• Total Orders
• Average Order Value
• Best Product Category
• Top Customers
• Best Products
• Monthly Revenue
• Inventory Value

*/

/*
===============================================================================
CONCEPTS COVERED
===============================================================================

• Aggregate Functions
• GROUP BY
• INNER JOIN
• LEFT JOIN
• CASE Statement
• CTE
• Window Functions
• DENSE_RANK()
• SUM()
• COUNT()
• AVG()
• LAG()
• YEAR()
• MONTH()

*/

/*
===============================================================================
ASSUMED TABLES
===============================================================================

Customers
---------
CustomerID
FirstName
LastName

Orders
------
OrderID
CustomerID
OrderDate
TotalAmount

Products
--------
ProductID
CategoryID
ProductName
Price
Stock

Categories
----------
CategoryID
CategoryName

Order_Items
-----------
OrderItemID
OrderID
ProductID
Quantity
UnitPrice

*/

/*
===============================================================================
EXECUTIVE KPI DASHBOARD
===============================================================================
*/

----------------------------------------------------------
-- Dashboard Summary
----------------------------------------------------------

SELECT

    (SELECT COUNT(*) FROM Customers) AS TotalCustomers,

    (SELECT COUNT(*) FROM Orders) AS TotalOrders,

    (SELECT SUM(TotalAmount) FROM Orders) AS TotalRevenue,

    (SELECT ROUND(AVG(TotalAmount),2) FROM Orders)
        AS AverageOrderValue,

    (SELECT SUM(Price * Stock)
     FROM Products)
        AS InventoryValue;

----------------------------------------------------------
-- Revenue by Category
----------------------------------------------------------

SELECT

    c.CategoryName,

    SUM(oi.Quantity * oi.UnitPrice) AS Revenue,

    DENSE_RANK()

        OVER
        (
            ORDER BY SUM(oi.Quantity * oi.UnitPrice) DESC
        ) AS RevenueRank

FROM Categories c

JOIN Products p

ON c.CategoryID = p.CategoryID

JOIN Order_Items oi

ON p.ProductID = oi.ProductID

GROUP BY

    c.CategoryName

ORDER BY

    Revenue DESC;

----------------------------------------------------------
-- Top Five Customers
----------------------------------------------------------

SELECT

    CONCAT(c.FirstName,' ',c.LastName) AS Customer,

    SUM(o.TotalAmount) AS Revenue,

    DENSE_RANK()

    OVER
    (
        ORDER BY SUM(o.TotalAmount) DESC
    ) AS CustomerRank

FROM Customers c

JOIN Orders o

ON c.CustomerID = o.CustomerID

GROUP BY

    c.CustomerID,

    c.FirstName,

    c.LastName

ORDER BY

    Revenue DESC

LIMIT 5;

----------------------------------------------------------
-- Top Five Products
----------------------------------------------------------

SELECT

    p.ProductName,

    SUM(oi.Quantity * oi.UnitPrice) AS Revenue,

    SUM(oi.Quantity) AS UnitsSold,

    DENSE_RANK()

    OVER
    (
        ORDER BY SUM(oi.Quantity * oi.UnitPrice) DESC
    ) AS ProductRank

FROM Products p

JOIN Order_Items oi

ON p.ProductID = oi.ProductID

GROUP BY

    p.ProductID,

    p.ProductName

ORDER BY

    Revenue DESC

LIMIT 5;

----------------------------------------------------------
-- Monthly Revenue Dashboard
----------------------------------------------------------

WITH MonthlyRevenue AS
(
    SELECT

        YEAR(OrderDate) AS SalesYear,

        MONTH(OrderDate) AS SalesMonth,

        SUM(TotalAmount) AS Revenue

    FROM Orders

    GROUP BY

        YEAR(OrderDate),

        MONTH(OrderDate)
)

SELECT

    SalesYear,

    SalesMonth,

    Revenue,

    LAG(Revenue)

        OVER
        (
            ORDER BY SalesYear, SalesMonth
        ) AS PreviousRevenue,

    Revenue -

    LAG(Revenue)

        OVER
        (
            ORDER BY SalesYear, SalesMonth
        ) AS RevenueGrowth

FROM MonthlyRevenue

ORDER BY

    SalesYear,

    SalesMonth;

----------------------------------------------------------
-- Customer Status Summary
----------------------------------------------------------

SELECT

    CASE

        WHEN COUNT(o.OrderID) >= 10 THEN 'VIP'

        WHEN COUNT(o.OrderID) >= 5 THEN 'Regular'

        ELSE 'New'

    END AS CustomerSegment,

    COUNT(*) AS Customers

FROM Customers c

LEFT JOIN Orders o

ON c.CustomerID = o.CustomerID

GROUP BY

    CASE

        WHEN COUNT(o.OrderID) >= 10 THEN 'VIP'

        WHEN COUNT(o.OrderID) >= 5 THEN 'Regular'

        ELSE 'New'

    END;
