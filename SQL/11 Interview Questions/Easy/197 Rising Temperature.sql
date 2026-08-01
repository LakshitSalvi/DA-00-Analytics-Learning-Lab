/*
===============================================================================
                             LEETCODE 197
                            Rising Temperature
===============================================================================

Difficulty    : Easy
Topics        : SELF JOIN, Date Functions
Companies     : Amazon, Google, Meta, Microsoft, Bloomberg

===============================================================================
QUESTION
===============================================================================

Table: Weather

+---------------+---------+
| Column Name   | Type    |
+---------------+---------+
| id            | int     |
| recordDate    | date    |
| temperature   | int     |
+---------------+---------+

id is the primary key.

There are no two rows with the same recordDate.

Write a solution to find all dates where the temperature is higher than
the previous day's temperature.

Return the ids of those records.

===============================================================================
BUSINESS SCENARIO
===============================================================================

A weather monitoring organization records the daily temperature.

The climate research team wants to identify days where the temperature
increased compared to the previous day to analyze warming trends.

As a Data Analyst, your task is to generate a report of rising
temperature days.

===============================================================================
OBJECTIVE
===============================================================================

Return the IDs of all records where today's temperature
is greater than yesterday's temperature.

===============================================================================
CONCEPTS TESTED
===============================================================================

✔ SELF JOIN

✔ Date Functions

✔ DATEDIFF()

✔ Data Comparison

===============================================================================
SQL SOLUTION
===============================================================================
*/

SELECT

    w1.id

FROM Weather AS w1

JOIN Weather AS w2

ON DATEDIFF(w1.recordDate, w2.recordDate) = 1

WHERE w1.temperature > w2.temperature;

/*
===============================================================================
EXPLANATION
===============================================================================

Step 1

Join the Weather table with itself.

----------------------------------------------------------

Step 2

Match each record with the previous day's record using

DATEDIFF() = 1

----------------------------------------------------------

Step 3

Compare today's temperature with yesterday's.

----------------------------------------------------------

Step 4

Return today's ID if the temperature increased.

===============================================================================
VISUAL REPRESENTATION
===============================================================================

Weather

+----+------------+-------------+
| id | Date       | Temperature |
+----+------------+-------------+
| 1  | 2025-01-01 | 10          |
| 2  | 2025-01-02 | 25          |
| 3  | 2025-01-03 | 20          |
| 4  | 2025-01-04 | 30          |
+----+------------+-------------+

Comparison

Jan 2 > Jan 1 ✔

Jan 3 > Jan 2 ✘

Jan 4 > Jan 3 ✔

Output

2

4

===============================================================================
EXPECTED OUTPUT
===============================================================================

+----+
| id |
+----+
| 2  |
| 4  |
+----+

===============================================================================
WHY SELF JOIN?
===============================================================================

The comparison is between rows within the same table.

A SELF JOIN allows each day's record to be matched
with the previous day's record.

===============================================================================
ALTERNATIVE SOLUTION (WINDOW FUNCTION)
===============================================================================

SELECT

    id

FROM
(
    SELECT

        id,

        temperature,

        recordDate,

        LAG(temperature)

            OVER
            (
                ORDER BY recordDate
            ) AS PreviousTemperature,

        LAG(recordDate)

            OVER
            (
                ORDER BY recordDate
            ) AS PreviousDate

    FROM Weather

) AS WeatherData

WHERE

    DATEDIFF(recordDate, PreviousDate) = 1

AND temperature > PreviousTemperature;

This solution is supported in databases with window functions
(MySQL 8+, PostgreSQL, SQL Server, Oracle).

===============================================================================
TIME COMPLEXITY
===============================================================================

O(n)

assuming recordDate is indexed.

===============================================================================
SPACE COMPLEXITY
===============================================================================

O(1)

===============================================================================
INTERVIEW FOLLOW-UP QUESTIONS
===============================================================================

Q1. Why use DATEDIFF()?

Because consecutive IDs do not necessarily represent consecutive dates.

----------------------------------------------------------

Q2. Can IDs be used instead of dates?

No.

The question compares consecutive dates, not consecutive IDs.

----------------------------------------------------------

Q3. Can this be solved using LAG()?

Yes.

Window functions provide a cleaner solution in modern SQL.

----------------------------------------------------------

Q4. Which solution is better?

SELF JOIN works in older SQL versions.

LAG() is more readable and preferred in modern databases.

===============================================================================
COMMON MISTAKES
===============================================================================

❌ Comparing IDs instead of dates.

Always compare dates.

----------------------------------------------------------

❌ Assuming every date exists.

Using DATEDIFF() ensures only consecutive dates are compared.

----------------------------------------------------------

❌ Forgetting the temperature comparison.

Both date and temperature conditions are required.

===============================================================================
REAL-WORLD APPLICATIONS
===============================================================================

• Weather Analysis

• Sales Growth Comparison

• Daily Revenue Tracking

• Stock Market Analysis

• Website Traffic Monitoring

• Sensor Data Analytics

===============================================================================
KEY TAKEAWAYS
===============================================================================

✔ SELF JOIN compares records within the same table.

✔ DATEDIFF() identifies consecutive dates.

✔ LAG() is a modern alternative.

✔ Never assume IDs represent chronological order.

✔ A classic SQL interview question on date comparisons.

===============================================================================
*/
