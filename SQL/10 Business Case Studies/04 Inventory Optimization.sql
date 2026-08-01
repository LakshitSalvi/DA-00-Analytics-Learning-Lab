/*
===============================================================================
QUESTION
===============================================================================

Perform inventory optimization analysis using SQL.

The inventory management team wants to monitor stock levels and identify
products that require replenishment or have excess inventory.

The analysis should answer the following questions:

1. Which products have low stock?
2. Which products have high stock?
3. Which products generate the highest revenue?
4. Which products sell the most units?
5. Which products need immediate restocking?
6. Calculate inventory value for each product.

*/

/*
===============================================================================
BUSINESS SCENARIO
===============================================================================

RetailHub maintains hundreds of products across multiple categories.

Running out of stock leads to lost sales, while holding excessive inventory
increases storage costs.

As a Data Analyst, your task is to help the inventory team optimize stock
levels by analyzing inventory performance.

*/

/*
===============================================================================
BUSINESS OBJECTIVE
===============================================================================

Generate inventory KPIs including:

• Current Stock
• Units Sold
• Revenue Generated
• Inventory Value
• Stock Status
• Restocking Priority

*/

/*
===============================================================================
CONCEPTS COVERED
===============================================================================

• Aggregate Functions
• LEFT JOIN
• GROUP BY
• CASE Statement
• COALESCE()
• SUM()
• COUNT()
• Inventory Calculations

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
Stock

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

SELECT

    p.ProductID,

    p.ProductName,

    p.Price,

    p.Stock AS CurrentStock,

    COALESCE(SUM(oi.Quantity),0) AS UnitsSold,

    COALESCE(

        SUM(
            oi.Quantity * oi.UnitPrice
        ),

        0

    ) AS Revenue,

    p.Stock * p.Price AS InventoryValue,

    CASE

        WHEN p.Stock < 20
            THEN 'Critical'

        WHEN p.Stock BETWEEN 20 AND 50
            THEN 'Low'

        WHEN p.Stock BETWEEN 51 AND 100
            THEN 'Healthy'

        ELSE 'Overstock'

    END AS StockStatus,

    CASE

        WHEN p.Stock < 20
            THEN 'Immediate Restock'

        WHEN p.Stock BETWEEN 20 AND 50
            THEN 'Plan Purchase'

        ELSE 'No Action Required'

    END AS Recommendation

FROM Products p

LEFT JOIN Order_Items oi

ON p.ProductID = oi.ProductID

GROUP BY

    p.ProductID,

    p.ProductName,

    p.Price,

    p.Stock

ORDER BY

    InventoryValue DESC;
