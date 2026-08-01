/*
===============================================================================
                           LEETCODE 1393
                          Capital Gain/Loss
===============================================================================

Difficulty    : Medium
Topics        : CASE, SUM(), GROUP BY, Conditional Aggregation
Companies     : Goldman Sachs, JPMorgan, Amazon, Microsoft, Bloomberg

===============================================================================
QUESTION
===============================================================================

Table: Stocks

+---------------+---------+
| Column Name   | Type    |
+---------------+---------+
| stock_name    | varchar |
| operation     | enum    |
| operation_day | int     |
| price         | int     |
+---------------+---------+

(stock_name, operation_day) is the primary key.

operation is either

'Buy'

or

'Sell'.

Each stock is bought and sold exactly once.

Write a solution to report the capital gain or loss for each stock.

Capital Gain/Loss =

Selling Price

-

Buying Price

===============================================================================
BUSINESS SCENARIO
===============================================================================

An investment company tracks stock trading activity.

For each stock, analysts want to calculate the total profit or loss
after all buy and sell transactions are completed.

Positive values indicate profit.

Negative values indicate loss.

===============================================================================
OBJECTIVE
===============================================================================

Return:

• stock_name

• capital_gain_loss

===============================================================================
CONCEPTS TESTED
===============================================================================

✔ CASE

✔ SUM()

✔ GROUP BY

✔ Conditional Aggregation

===============================================================================
SQL SOLUTION
===============================================================================
*/

SELECT

    stock_name,

    SUM
    (
        CASE

            WHEN operation = 'Sell'

            THEN price

            ELSE -price

        END
    ) AS capital_gain_loss

FROM Stocks

GROUP BY

    stock_name;

/*
===============================================================================
EXPLANATION
===============================================================================

Step 1

Group transactions
by stock.

----------------------------------------------------------

Step 2

Treat

Sell

prices as

positive.

----------------------------------------------------------

Step 3

Treat

Buy

prices as

negative.

----------------------------------------------------------

Step 4

Sum all values.

The result equals

Total Sell

-

Total Buy.

===============================================================================
VISUAL REPRESENTATION
===============================================================================

Apple

Buy

100

↓

-100

Sell

150

↓

+150

↓

50 Profit

----------------------------------------------------------

Tesla

Buy

400

↓

-400

Sell

350

↓

+350

↓

-50 Loss

===============================================================================
EXPECTED OUTPUT
===============================================================================

+------------+-------------------+
| stock_name | capital_gain_loss |
+------------+-------------------+
| Apple      | 50                |
| Tesla      | -50               |
+------------+-------------------+

===============================================================================
WHY CASE?
===============================================================================

CASE converts

Buy

transactions into

negative values

and

Sell

transactions into

positive values.

A simple SUM()

then computes

Profit/Loss.

===============================================================================
ALTERNATIVE SOLUTION
===============================================================================

SELECT

    stock_name,

    SUM
    (
        CASE WHEN operation='Sell'

        THEN price

        END
    )

    -

    SUM
    (
        CASE WHEN operation='Buy'

        THEN price

        END
    )

    AS capital_gain_loss

FROM Stocks

GROUP BY stock_name;

Both approaches are correct.

The first solution is shorter
and easier to understand.

===============================================================================
TIME COMPLEXITY
===============================================================================

O(n)

Each transaction is processed once.

===============================================================================
SPACE COMPLEXITY
===============================================================================

O(n)

For grouped stock summaries.

===============================================================================
INTERVIEW FOLLOW-UP QUESTIONS
===============================================================================

Q1. Why use CASE?

To convert buys into negative values
and sells into positive values.

----------------------------------------------------------

Q2. Why GROUP BY stock_name?

Profit must be calculated
for each stock independently.

----------------------------------------------------------

Q3. Can this handle multiple buys
and sells?

Yes.

The SUM() naturally accumulates
all transactions.

----------------------------------------------------------

Q4. What if transaction fees existed?

Subtract the fee from each
Sell transaction

or

add it to each Buy transaction
before summing.

===============================================================================
COMMON MISTAKES
===============================================================================

❌ Treating Buy prices as positive.

Profit becomes incorrect.

----------------------------------------------------------

❌ Forgetting GROUP BY.

Profit would be calculated
for all stocks together.

----------------------------------------------------------

❌ Using COUNT() instead of SUM().

The problem requires monetary totals,
not transaction counts.

===============================================================================
REAL-WORLD APPLICATIONS
===============================================================================

• Stock Portfolio Analytics

• Trading Dashboards

• Investment Reporting

• Financial Performance Analysis

• Brokerage Systems

• Business Intelligence

===============================================================================
KEY TAKEAWAYS
===============================================================================

✔ CASE transforms values before aggregation.

✔ Conditional aggregation simplifies financial calculations.

✔ SUM() can represent gains and losses elegantly.

✔ GROUP BY enables per-stock reporting.

✔ A common SQL interview problem in finance and analytics.

===============================================================================
*/
