/*
===============================================================================
                           LEETCODE 1321
                          Restaurant Growth
===============================================================================

Difficulty    : Medium
Topics        : Window Functions, Moving Average, Rolling Sum
Companies     : Amazon, Google, Microsoft, Uber, Airbnb

===============================================================================
QUESTION
===============================================================================

Table: Customer

+---------------+---------+
| Column Name   | Type    |
+---------------+---------+
| customer_id   | int     |
| name          | varchar |
| visited_on    | date    |
| amount        | int     |
+---------------+---------+

There may be multiple customers on the same day.

Write a solution to compute the

7-day moving average

of restaurant revenue.

For each day beginning from the

7th day,

return:

• visited_on

• amount (7-day total revenue)

• average_amount (7-day average revenue)

Round the average to

2 decimal places.

Return the result ordered by visited_on.

===============================================================================
BUSINESS SCENARIO
===============================================================================

A restaurant chain wants to monitor weekly revenue trends.

Instead of analyzing daily revenue,
management prefers a rolling 7-day total and average
to smooth out daily fluctuations.

These metrics are displayed on executive dashboards.

===============================================================================
OBJECTIVE
===============================================================================

Return:

• visited_on

• amount

• average_amount

for every 7-day rolling window.

===============================================================================
CONCEPTS TESTED
===============================================================================

✔ Window Functions

✔ SUM() OVER()

✔ ROWS BETWEEN

✔ Moving Average

✔ Rolling Sum

✔ ROUND()

===============================================================================
SQL SOLUTION
===============================================================================
*/

WITH DailyRevenue AS
(
    SELECT

        visited_on,

        SUM(amount) AS daily_amount

    FROM Customer

    GROUP BY

        visited_on
),

RollingRevenue AS
(
    SELECT

        visited_on,

        SUM(daily_amount)

        OVER
        (
            ORDER BY visited_on

            ROWS BETWEEN 6 PRECEDING
            AND CURRENT ROW
        ) AS amount,

        ROUND
        (
            AVG(daily_amount)

            OVER
            (
                ORDER BY visited_on

                ROWS BETWEEN 6 PRECEDING
                AND CURRENT ROW
            ),
            2
        ) AS average_amount,

        ROW_NUMBER()

        OVER
        (
            ORDER BY visited_on
        ) AS DayNumber

    FROM DailyRevenue
)

SELECT

    visited_on,

    amount,

    average_amount

FROM RollingRevenue

WHERE

    DayNumber >= 7

ORDER BY

    visited_on;

/*
===============================================================================
EXPLANATION
===============================================================================

Step 1

Calculate total revenue
for each day.

----------------------------------------------------------

Step 2

Use

SUM() OVER()

to calculate the

7-day rolling revenue.

----------------------------------------------------------

Step 3

Use

AVG() OVER()

to calculate the

7-day moving average.

----------------------------------------------------------

Step 4

Ignore the first six days,

because a complete
7-day window is unavailable.

===============================================================================
VISUAL REPRESENTATION
===============================================================================

Daily Revenue

Day 1

100

Day 2

120

Day 3

90

Day 4

150

Day 5

110

Day 6

130

Day 7

140

↓

Rolling Sum

840

↓

Moving Average

120.00

===============================================================================
EXPECTED OUTPUT
===============================================================================

+------------+--------+----------------+
| visited_on | amount | average_amount |
+------------+--------+----------------+
|2020-01-07  | 840    | 120.00         |
|2020-01-08  | 860    | 122.86         |
+------------+--------+----------------+

===============================================================================
WHY WINDOW FUNCTIONS?
===============================================================================

Window functions compute rolling calculations
without collapsing individual rows.

They are ideal for

moving averages,

running totals,

and trend analysis.

===============================================================================
ALTERNATIVE SOLUTION
===============================================================================

A correlated subquery can calculate the
7-day total,

but it is slower.

Window functions provide a cleaner
and more efficient solution.

===============================================================================
TIME COMPLEXITY
===============================================================================

O(n log n)

Sorting by date dominates execution.

===============================================================================
SPACE COMPLEXITY
===============================================================================

O(n)

For daily revenue aggregation
and window calculations.

===============================================================================
INTERVIEW FOLLOW-UP QUESTIONS
===============================================================================

Q1. Why aggregate daily revenue first?

Multiple customers may visit
on the same day.

----------------------------------------------------------

Q2. Why use

ROWS BETWEEN 6 PRECEDING
AND CURRENT ROW?

It creates a rolling
7-day window.

----------------------------------------------------------

Q3. Why filter

DayNumber >= 7?

The first six rows
do not have a complete
7-day history.

----------------------------------------------------------

Q4. How would you calculate
a 30-day moving average?

Replace

6 PRECEDING

with

29 PRECEDING.

===============================================================================
COMMON MISTAKES
===============================================================================

❌ Applying the window function
directly on customer rows.

Revenue should first be aggregated
per day.

----------------------------------------------------------

❌ Forgetting the rolling window.

Using AVG(amount)
calculates the overall average,
not the moving average.

----------------------------------------------------------

❌ Returning the first six days.

A full 7-day window is required.

===============================================================================
REAL-WORLD APPLICATIONS
===============================================================================

• Restaurant Revenue Analytics

• Sales Trend Dashboards

• Stock Market Analysis

• Inventory Forecasting

• Website Traffic Monitoring

• Financial Reporting

===============================================================================
KEY TAKEAWAYS
===============================================================================

✔ Window functions simplify moving averages.

✔ Rolling sums are common in business dashboards.

✔ Aggregate data before applying window functions.

✔ ROWS BETWEEN defines the moving window.

✔ One of the most important SQL window function interview questions.

===============================================================================
*/
