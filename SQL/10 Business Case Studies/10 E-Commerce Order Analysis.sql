/*
===============================================================================
QUESTION
===============================================================================

Perform an end-to-end e-commerce order analysis using SQL.

The operations and management teams want to evaluate order performance,
payment trends, fulfillment efficiency, and customer purchasing behavior.

The analysis should answer the following questions:

1. How many orders were placed?
2. What is the total revenue?
3. What is the average order value?
4. Which payment methods are used the most?
5. What is the order status distribution?
6. Which customers placed the highest number of orders?
7. What is the monthly order trend?
8. Which orders generated the highest revenue?

*/

/*
===============================================================================
BUSINESS SCENARIO
===============================================================================

RetailHub processes thousands of customer orders every month.

Management wants to monitor sales performance, customer purchasing behavior,
payment preferences, and order fulfillment efficiency.

As a Data Analyst, your responsibility is to build a complete
E-Commerce Order Performance Report.

*/

/*
===============================================================================
BUSINESS OBJECTIVE
===============================================================================

Generate business KPIs including:

• Total Orders
• Total Revenue
• Average Order Value
• Payment Method Analysis
• Order Status Analysis
• Customer Purchase Analysis
• Monthly Order Trend
• Highest Value Orders

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
• Window Functions
• DENSE_RANK()
• SUM()
• COUNT()
• AVG()
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
PaymentID
OrderDate
OrderStatus
TotalAmount

Payments
--------

PaymentID
PaymentMethod
PaymentStatus

*/

/*
===============================================================================
SQL SOLUTION
===============================================================================
*/

----------------------------------------------------------
-- 1 Total Business KPIs
----------------------------------------------------------

SELECT

    COUNT(*) AS TotalOrders,

    SUM(TotalAmount) AS TotalRevenue,

    ROUND(AVG(TotalAmount),2) AS AverageOrderValue

FROM Orders;

----------------------------------------------------------
-- 2 Payment Method Analysis
----------------------------------------------------------

SELECT

    p.PaymentMethod,

    COUNT(o.OrderID) AS TotalOrders,

    SUM(o.TotalAmount) AS Revenue

FROM Payments p

JOIN Orders o

ON p.PaymentID = o.PaymentID

GROUP BY

    p.PaymentMethod

ORDER BY

    Revenue DESC;

----------------------------------------------------------
-- 3 Order Status Analysis
----------------------------------------------------------

SELECT

    OrderStatus,

    COUNT(*) AS Orders,

    ROUND(

        COUNT(*) * 100.0 /

        SUM(COUNT(*)) OVER(),

        2

    ) AS Percentage

FROM Orders

GROUP BY

    OrderStatus

ORDER BY

    Orders DESC;

----------------------------------------------------------
-- 4 Customer Purchase Analysis
----------------------------------------------------------

SELECT

    CONCAT(c.FirstName,' ',c.LastName) AS Customer,

    COUNT(o.OrderID) AS OrdersPlaced,

    SUM(o.TotalAmount) AS TotalSpent,

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

    TotalSpent DESC;

----------------------------------------------------------
-- 5 Monthly Order Trend
----------------------------------------------------------

SELECT

    YEAR(OrderDate) AS SalesYear,

    MONTH(OrderDate) AS SalesMonth,

    COUNT(*) AS Orders,

    SUM(TotalAmount) AS Revenue

FROM Orders

GROUP BY

    YEAR(OrderDate),

    MONTH(OrderDate)

ORDER BY

    SalesYear,

    SalesMonth;

----------------------------------------------------------
-- 6 Highest Revenue Orders
----------------------------------------------------------

SELECT

    OrderID,

    CustomerID,

    OrderDate,

    TotalAmount,

    DENSE_RANK()

    OVER

    (

        ORDER BY TotalAmount DESC

    ) AS RevenueRank

FROM Orders

ORDER BY

    RevenueRank;
