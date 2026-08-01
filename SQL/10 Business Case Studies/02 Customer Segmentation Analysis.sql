/*
===============================================================================
QUESTION
===============================================================================

Perform customer segmentation analysis using SQL.

The marketing department wants to divide customers into different segments
based on their purchasing behavior.

The analysis should answer the following questions:

1. How much has each customer spent?
2. How many orders has each customer placed?
3. What is the customer's average order value?
4. Classify customers into Business Segments.
5. Rank customers based on total spending.

*/

/*
===============================================================================
BUSINESS SCENARIO
===============================================================================

RetailHub wants to identify its most valuable customers.

Instead of sending the same promotional offers to everyone, the company wants
to create personalized marketing campaigns.

As a Data Analyst, your task is to segment customers based on their spending.

*/

/*
===============================================================================
BUSINESS OBJECTIVE
===============================================================================

Generate customer insights including:

• Total Spending
• Total Orders
• Average Order Value
• Customer Segment
• Customer Ranking

*/

/*
===============================================================================
CONCEPTS COVERED
===============================================================================

• Aggregate Functions
• GROUP BY
• CASE Statement
• Window Functions
• DENSE_RANK()
• INNER JOIN
• CTE
• SUM()
• COUNT()
• AVG()

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

WITH CustomerSummary AS
(
    SELECT

        c.CustomerID,

        CONCAT(c.FirstName,' ',c.LastName) AS CustomerName,

        COUNT(o.OrderID) AS TotalOrders,

        SUM(o.TotalAmount) AS TotalSpent,

        ROUND(AVG(o.TotalAmount),2) AS AverageOrderValue

    FROM Customers c

    JOIN Orders o

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

    TotalSpent,

    AverageOrderValue,

    CASE

        WHEN TotalSpent >= 100000 THEN 'VIP'

        WHEN TotalSpent >= 50000 THEN 'Gold'

        WHEN TotalSpent >= 20000 THEN 'Silver'

        ELSE 'Bronze'

    END AS CustomerSegment,

    DENSE_RANK() OVER
    (
        ORDER BY TotalSpent DESC
    ) AS CustomerRank

FROM CustomerSummary

ORDER BY

    TotalSpent DESC;
