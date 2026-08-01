/*
===============================================================================
QUESTION
===============================================================================

Perform a comprehensive retail sales performance analysis using SQL.

The management team wants to evaluate overall business performance by answering
the following questions:

1. What is the total revenue generated?
2. How many orders were placed?
3. What is the average order value?
4. Which products generated the highest revenue?
5. Which product categories perform the best?
6. Who are the top spending customers?
7. Which months generated the highest sales?
8. What are the monthly sales trends?

*/

/*
===============================================================================
BUSINESS SCENARIO
===============================================================================

RetailHub is an online retail company selling products across multiple
categories.

The executive team wants to understand sales performance to improve business
decisions, marketing campaigns, inventory planning, and customer engagement.

As a Data Analyst, your responsibility is to prepare an executive summary
using SQL.

*/

/*
===============================================================================
BUSINESS OBJECTIVE
===============================================================================

Generate key sales KPIs and identify:

• Overall Revenue
• Total Orders
• Average Order Value
• Best Selling Products
• Best Performing Categories
• Top Customers
• Monthly Sales Trends

*/

/*
===============================================================================
CONCEPTS COVERED
===============================================================================

• Aggregate Functions
• GROUP BY
• ORDER BY
• INNER JOIN
• SUM()
• COUNT()
• AVG()
• CTE
• Window Functions
• CASE
• Date Functions

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

Products
--------
ProductID
CategoryID
ProductName
Price

Categories
----------
CategoryID
CategoryName

Orders
------
OrderID
CustomerID
OrderDate
TotalAmount

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
SQL SOLUTION
===============================================================================
*/

----------------------------------------------------------
-- 1 Total Revenue
----------------------------------------------------------

SELECT

    SUM(TotalAmount) AS TotalRevenue

FROM Orders;

----------------------------------------------------------
-- 2 Total Orders
----------------------------------------------------------

SELECT

    COUNT(*) AS TotalOrders

FROM Orders;

----------------------------------------------------------
-- 3 Average Order Value
----------------------------------------------------------

SELECT

    ROUND(AVG(TotalAmount),2) AS AverageOrderValue

FROM Orders;

----------------------------------------------------------
-- 4 Top Selling Products
----------------------------------------------------------

SELECT

    p.ProductName,

    SUM(oi.Quantity) AS TotalUnitsSold,

    SUM(oi.Quantity * oi.UnitPrice) AS Revenue

FROM Order_Items oi

JOIN Products p

ON oi.ProductID = p.ProductID

GROUP BY

    p.ProductName

ORDER BY Revenue DESC;

----------------------------------------------------------
-- 5 Best Performing Categories
----------------------------------------------------------

SELECT

    c.CategoryName,

    SUM(oi.Quantity * oi.UnitPrice) AS Revenue

FROM Categories c

JOIN Products p

ON c.CategoryID = p.CategoryID

JOIN Order_Items oi

ON p.ProductID = oi.ProductID

GROUP BY

    c.CategoryName

ORDER BY Revenue DESC;

----------------------------------------------------------
-- 6 Top Spending Customers
----------------------------------------------------------

SELECT

    CONCAT(c.FirstName,' ',c.LastName) AS Customer,

    SUM(o.TotalAmount) AS TotalSpent

FROM Customers c

JOIN Orders o

ON c.CustomerID = o.CustomerID

GROUP BY

    c.CustomerID,

    c.FirstName,

    c.LastName

ORDER BY TotalSpent DESC;

----------------------------------------------------------
-- 7 Monthly Revenue
----------------------------------------------------------

SELECT

    YEAR(OrderDate) AS SalesYear,

    MONTH(OrderDate) AS SalesMonth,

    SUM(TotalAmount) AS MonthlyRevenue

FROM Orders

GROUP BY

    YEAR(OrderDate),

    MONTH(OrderDate)

ORDER BY

    SalesYear,

    SalesMonth;

----------------------------------------------------------
-- 8 Monthly Revenue Trend
----------------------------------------------------------

WITH MonthlySales AS
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

    LAG(Revenue) OVER
    (
        ORDER BY SalesYear, SalesMonth
    ) AS PreviousMonth,

    Revenue -

    LAG(Revenue) OVER
    (
        ORDER BY SalesYear, SalesMonth
    ) AS Growth

FROM MonthlySales

ORDER BY

    SalesYear,

    SalesMonth;
