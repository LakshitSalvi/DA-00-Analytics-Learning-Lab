/*
===============================================================================
QUESTION
===============================================================================

Analyze product performance using SQL.

The product management team wants to evaluate product sales performance to
identify top-performing and underperforming products.

The analysis should answer the following questions:

1. Which products generated the highest revenue?
2. Which products sold the most units?
3. What is the average selling price?
4. Which products have the highest average order quantity?
5. Rank products based on revenue.
6. Classify products into performance categories.

*/

/*
===============================================================================
BUSINESS SCENARIO
===============================================================================

RetailHub sells hundreds of products across multiple categories.

Management wants to know which products deserve additional marketing,
which products should be discontinued, and which products require
inventory expansion.

As a Data Analyst, your responsibility is to build a product performance report.

*/

/*
===============================================================================
BUSINESS OBJECTIVE
===============================================================================

Generate product KPIs including:

• Units Sold
• Revenue
• Average Selling Price
• Average Quantity per Order
• Product Rank
• Product Performance Category

*/

/*
===============================================================================
CONCEPTS COVERED
===============================================================================

• Aggregate Functions
• GROUP BY
• INNER JOIN
• CASE Statement
• Window Functions
• DENSE_RANK()
• SUM()
• AVG()
• COUNT()

*/

/*
===============================================================================
ASSUMED TABLES
===============================================================================

Products
--------

ProductID
CategoryID
ProductName
Price

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

WITH ProductSummary AS
(
    SELECT

        p.ProductID,

        p.ProductName,

        SUM(oi.Quantity) AS UnitsSold,

        SUM(oi.Quantity * oi.UnitPrice) AS Revenue,

        ROUND(AVG(oi.UnitPrice),2) AS AverageSellingPrice,

        ROUND(AVG(oi.Quantity),2) AS AverageOrderQuantity

    FROM Products p

    JOIN Order_Items oi

        ON p.ProductID = oi.ProductID

    GROUP BY

        p.ProductID,

        p.ProductName
)

SELECT

    ProductID,

    ProductName,

    UnitsSold,

    Revenue,

    AverageSellingPrice,

    AverageOrderQuantity,

    CASE

        WHEN Revenue >= 500000
            THEN 'Best Seller'

        WHEN Revenue >= 100000
            THEN 'Strong Performer'

        WHEN Revenue >= 25000
            THEN 'Average Performer'

        ELSE 'Low Performer'

    END AS PerformanceCategory,

    DENSE_RANK()

        OVER

        (

            ORDER BY Revenue DESC

        ) AS RevenueRank

FROM ProductSummary

ORDER BY

    Revenue DESC;
