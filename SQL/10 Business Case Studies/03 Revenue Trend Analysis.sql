/*
===============================================================================
QUESTION
===============================================================================

Analyze revenue trends over time using SQL.

The finance department wants to understand how revenue changes month by month
to identify business growth patterns and seasonal trends.

The analysis should answer the following questions:

1. What is the monthly revenue?
2. How many orders were placed each month?
3. What is the average order value each month?
4. What is the month-over-month revenue growth?
5. Which month generated the highest revenue?
6. Rank months based on revenue.

*/

/*
===============================================================================
BUSINESS SCENARIO
===============================================================================

RetailHub's finance team reviews monthly business performance before every
quarterly meeting.

Management wants to know:

• Is revenue increasing?
• Which months performed the best?
• Are there any seasonal patterns?
• Is average order value improving?

As a Data Analyst, you need to prepare a monthly revenue report.

*/

/*
===============================================================================
BUSINESS OBJECTIVE
===============================================================================

Generate monthly KPIs including:

• Monthly Revenue
• Monthly Orders
• Average Order Value
• Previous Month Revenue
• Revenue Growth
• Monthly Revenue Rank

*/

/*
===============================================================================
CONCEPTS COVERED
===============================================================================

• Aggregate Functions
• GROUP BY
• CTE
• Window Functions
• LAG()
• DENSE_RANK()
• SUM()
• COUNT()
• AVG()
• YEAR()
• MONTH()

*/

/*
===============================================================================
ASSUMED TABLE
===============================================================================

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

WITH MonthlyRevenue AS
(
    SELECT

        YEAR(OrderDate) AS SalesYear,

        MONTH(OrderDate) AS SalesMonth,

        COUNT(OrderID) AS TotalOrders,

        SUM(TotalAmount) AS Revenue,

        ROUND(AVG(TotalAmount),2) AS AverageOrderValue

    FROM Orders

    GROUP BY

        YEAR(OrderDate),
        MONTH(OrderDate)
)

SELECT

    SalesYear,

    SalesMonth,

    TotalOrders,

    Revenue,

    AverageOrderValue,

    LAG(Revenue)
        OVER
        (
            ORDER BY SalesYear, SalesMonth
        ) AS PreviousMonthRevenue,

    Revenue -

    LAG(Revenue)
        OVER
        (
            ORDER BY SalesYear, SalesMonth
        ) AS RevenueGrowth,

    ROUND(

        (
            Revenue -

            LAG(Revenue)
                OVER
                (
                    ORDER BY SalesYear, SalesMonth
                )
        )

        /

        NULLIF(

            LAG(Revenue)
                OVER
                (
                    ORDER BY SalesYear, SalesMonth
                ),

            0

        )

        * 100,

        2

    ) AS GrowthPercentage,

    DENSE_RANK()
        OVER
        (
            ORDER BY Revenue DESC
        ) AS RevenueRank

FROM MonthlyRevenue

ORDER BY

    SalesYear,
    SalesMonth;
