/*
===============================================================================
QUESTION
===============================================================================

Perform customer retention analysis using SQL.

The marketing and customer success teams want to identify repeat customers,
inactive customers, and customer lifetime value to improve retention
strategies.

The analysis should answer the following questions:

1. How many orders has each customer placed?
2. How much revenue has each customer generated?
3. What is each customer's last purchase date?
4. Which customers are Active, At Risk, or Lost?
5. Rank customers based on lifetime value.
6. Calculate customer lifetime value (CLV).

*/

/*
===============================================================================
BUSINESS SCENARIO
===============================================================================

RetailHub wants to improve customer retention by understanding purchasing
behavior and identifying customers who are becoming inactive.

Instead of focusing only on acquiring new customers, management wants to
increase repeat purchases and customer lifetime value.

As a Data Analyst, your responsibility is to identify customer segments
based on purchase activity.

*/

/*
===============================================================================
BUSINESS OBJECTIVE
===============================================================================

Generate customer retention KPIs including:

• Total Orders
• Lifetime Revenue
• Average Order Value
• Last Purchase Date
• Customer Status
• Customer Lifetime Value Ranking

*/

/*
===============================================================================
CONCEPTS COVERED
===============================================================================

• Aggregate Functions
• GROUP BY
• CASE Statement
• CTE
• Window Functions
• DENSE_RANK()
• SUM()
• COUNT()
• AVG()
• MAX()
• DATEDIFF()

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

*/

/*
===============================================================================
SQL SOLUTION
===============================================================================
*/

WITH CustomerRetention AS
(
    SELECT

        c.CustomerID,

        CONCAT(c.FirstName,' ',c.LastName) AS CustomerName,

        COUNT(o.OrderID) AS TotalOrders,

        SUM(o.TotalAmount) AS LifetimeRevenue,

        ROUND(AVG(o.TotalAmount),2) AS AverageOrderValue,

        MAX(o.OrderDate) AS LastPurchaseDate,

        DATEDIFF(

            CURDATE(),

            MAX(o.OrderDate)

        ) AS DaysSinceLastPurchase

    FROM Customers c

    LEFT JOIN Orders o

        ON c.CustomerID = o.CustomerID

    GROUP BY

        c.CustomerID,
        c.FirstName,
        c.LastName
)

SELECT

    CustomerID,

    CustomerName,

    TotalOrders,

    LifetimeRevenue,

    AverageOrderValue,

    LastPurchaseDate,

    DaysSinceLastPurchase,

    CASE

        WHEN DaysSinceLastPurchase <= 30
            THEN 'Active'

        WHEN DaysSinceLastPurchase <= 90
            THEN 'At Risk'

        ELSE 'Lost'

    END AS CustomerStatus,

    DENSE_RANK()

        OVER
        (
            ORDER BY LifetimeRevenue DESC
        ) AS CustomerRank

FROM CustomerRetention

ORDER BY

    LifetimeRevenue DESC;
