/*
===============================================================================
QUESTION
===============================================================================

Perform banking customer analysis using SQL.

The bank wants to analyze customer account activity and identify valuable
customers based on account balances and transaction behavior.

The analysis should answer the following questions:

1. What is the total balance held by each customer?
2. How many transactions has each customer completed?
3. What is the average transaction amount?
4. Which customers are the highest-value customers?
5. Rank customers by account balance.
6. Classify customers into banking segments.

*/

/*
===============================================================================
BUSINESS SCENARIO
===============================================================================

RetailBank serves thousands of customers with savings and current accounts.

The relationship management team wants to identify premium customers,
understand transaction behavior, and improve customer engagement through
personalized banking services.

As a Data Analyst, your task is to generate a customer performance report.

*/

/*
===============================================================================
BUSINESS OBJECTIVE
===============================================================================

Generate banking KPIs including:

• Current Account Balance
• Total Transactions
• Total Transaction Amount
• Average Transaction Amount
• Customer Rank
• Banking Segment

*/

/*
===============================================================================
CONCEPTS COVERED
===============================================================================

• Aggregate Functions
• INNER JOIN
• GROUP BY
• CASE Statement
• CTE
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

Customers
---------

CustomerID
FirstName
LastName

Accounts
--------

AccountID
CustomerID
AccountType
Balance

Transactions
------------

TransactionID
AccountID
TransactionDate
TransactionType
Amount

*/

/*
===============================================================================
SQL SOLUTION
===============================================================================
*/

WITH CustomerBanking AS
(
    SELECT

        c.CustomerID,

        CONCAT(c.FirstName,' ',c.LastName) AS CustomerName,

        SUM(a.Balance) AS TotalBalance,

        COUNT(t.TransactionID) AS TotalTransactions,

        SUM(t.Amount) AS TotalTransactionAmount,

        ROUND(AVG(t.Amount),2) AS AverageTransactionAmount

    FROM Customers c

    JOIN Accounts a

        ON c.CustomerID = a.CustomerID

    JOIN Transactions t

        ON a.AccountID = t.AccountID

    GROUP BY

        c.CustomerID,
        c.FirstName,
        c.LastName
)

SELECT

    CustomerID,

    CustomerName,

    TotalBalance,

    TotalTransactions,

    TotalTransactionAmount,

    AverageTransactionAmount,

    CASE

        WHEN TotalBalance >= 1000000
            THEN 'Platinum'

        WHEN TotalBalance >= 500000
            THEN 'Gold'

        WHEN TotalBalance >= 100000
            THEN 'Silver'

        ELSE 'Standard'

    END AS CustomerSegment,

    DENSE_RANK()

        OVER
        (
            ORDER BY TotalBalance DESC
        ) AS BalanceRank

FROM CustomerBanking

ORDER BY

    TotalBalance DESC;
