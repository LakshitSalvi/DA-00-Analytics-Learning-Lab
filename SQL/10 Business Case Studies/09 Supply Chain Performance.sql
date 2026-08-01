/*
===============================================================================
QUESTION
===============================================================================

Analyze supply chain performance using SQL.

The operations team wants to evaluate supplier performance, inventory movement,
and order fulfillment efficiency.

The analysis should answer the following questions:

1. Which suppliers delivered the most products?
2. Which products have the highest inventory turnover?
3. Which categories contribute the highest inventory value?
4. Which suppliers generate the highest purchase value?
5. Rank suppliers based on purchase value.
6. Classify suppliers into performance categories.

*/

/*
===============================================================================
BUSINESS SCENARIO
===============================================================================

RetailHub works with multiple suppliers to maintain product availability.

The procurement department wants to monitor supplier performance and identify
inventory trends that affect operational efficiency.

As a Data Analyst, your task is to prepare a supply chain performance report.

*/

/*
===============================================================================
BUSINESS OBJECTIVE
===============================================================================

Generate supply chain KPIs including:

• Products Supplied
• Units Purchased
• Purchase Value
• Inventory Value
• Inventory Turnover
• Supplier Ranking

*/

/*
===============================================================================
CONCEPTS COVERED
===============================================================================

• Aggregate Functions
• GROUP BY
• INNER JOIN
• CTE
• CASE Statement
• Window Functions
• DENSE_RANK()
• SUM()
• COUNT()
• AVG()

*/

/*
===============================================================================
ASSUMED TABLES
===============================================================================

Suppliers
---------

SupplierID
SupplierName

Products
--------

ProductID
SupplierID
CategoryID
ProductName
Price
Stock

Categories
----------

CategoryID
CategoryName

Purchase_Orders
---------------

PurchaseOrderID
SupplierID
ProductID
Quantity
PurchasePrice
PurchaseDate

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

WITH SupplierSummary AS
(
    SELECT

        s.SupplierID,

        s.SupplierName,

        COUNT(po.PurchaseOrderID) AS PurchaseOrders,

        SUM(po.Quantity) AS UnitsPurchased,

        SUM(po.Quantity * po.PurchasePrice) AS PurchaseValue

    FROM Suppliers s

    JOIN Purchase_Orders po

        ON s.SupplierID = po.SupplierID

    GROUP BY

        s.SupplierID,
        s.SupplierName
),

InventorySummary AS
(
    SELECT

        p.ProductID,

        p.ProductName,

        p.Stock,

        SUM(oi.Quantity) AS UnitsSold,

        ROUND(

            SUM(oi.Quantity) /
            NULLIF(p.Stock,0),

            2

        ) AS InventoryTurnover

    FROM Products p

    LEFT JOIN Order_Items oi

        ON p.ProductID = oi.ProductID

    GROUP BY

        p.ProductID,
        p.ProductName,
        p.Stock
)

----------------------------------------------------------
-- Supplier Performance
----------------------------------------------------------

SELECT

    SupplierName,

    PurchaseOrders,

    UnitsPurchased,

    PurchaseValue,

    CASE

        WHEN PurchaseValue >= 1000000
            THEN 'Strategic Supplier'

        WHEN PurchaseValue >= 500000
            THEN 'Preferred Supplier'

        ELSE 'Standard Supplier'

    END AS SupplierCategory,

    DENSE_RANK()

        OVER
        (
            ORDER BY PurchaseValue DESC
        ) AS SupplierRank

FROM SupplierSummary

ORDER BY

    PurchaseValue DESC;

----------------------------------------------------------
-- Inventory Turnover
----------------------------------------------------------

SELECT

    ProductName,

    Stock,

    UnitsSold,

    InventoryTurnover

FROM InventorySummary

ORDER BY

    InventoryTurnover DESC;

----------------------------------------------------------
-- Category Inventory Value
----------------------------------------------------------

SELECT

    c.CategoryName,

    SUM(p.Stock * p.Price) AS InventoryValue

FROM Categories c

JOIN Products p

    ON c.CategoryID = p.CategoryID

GROUP BY

    c.CategoryName

ORDER BY

    InventoryValue DESC;
