/*
===============================================================================
                           LEETCODE 1211
                   Queries Quality and Percentage
===============================================================================

Difficulty    : Medium
Topics        : AVG(), CASE, ROUND(), GROUP BY
Companies     : Google, Amazon, Microsoft, Meta, LinkedIn

===============================================================================
QUESTION
===============================================================================

Table: Queries

+-------------+---------+
| Column Name | Type    |
+-------------+---------+
| query_name  | varchar |
| result      | varchar |
| position    | int     |
| rating      | int     |
+-------------+---------+

There may be duplicate rows.

The quality of a query is defined as:

SUM(rating / position) / total number of queries

The poor query percentage is defined as:

(Number of queries with rating < 3)

/

(Total number of queries)

×

100

Write a solution to calculate

• quality

• poor_query_percentage

for each query_name.

Round both values to

2 decimal places.

===============================================================================
BUSINESS SCENARIO
===============================================================================

A search engine company evaluates the quality of search results.

Each query returns multiple results.

Higher ratings and better rankings indicate higher search quality.

Management also wants to know the percentage of poor search results
to improve the ranking algorithm.

===============================================================================
OBJECTIVE
===============================================================================

Return

• query_name

• quality

• poor_query_percentage

===============================================================================
CONCEPTS TESTED
===============================================================================

✔ AVG()

✔ CASE

✔ ROUND()

✔ GROUP BY

✔ Conditional Aggregation

===============================================================================
SQL SOLUTION
===============================================================================
*/

SELECT

    query_name,

    ROUND
    (
        AVG(rating / position),
        2
    ) AS quality,

    ROUND
    (
        100 *

        AVG
        (
            CASE

                WHEN rating < 3

                THEN 1

                ELSE 0

            END
        ),
        2
    ) AS poor_query_percentage

FROM Queries

GROUP BY

    query_name;

/*
===============================================================================
EXPLANATION
===============================================================================

Step 1

Group all rows
by query_name.

----------------------------------------------------------

Step 2

Calculate

rating / position

for every search result.

----------------------------------------------------------

Step 3

AVG()

computes query quality.

----------------------------------------------------------

Step 4

Convert poor queries into

1

and

good queries into

0.

----------------------------------------------------------

Step 5

AVG()

calculates the fraction
of poor queries.

Multiply by

100

to convert into a percentage.

===============================================================================
VISUAL REPRESENTATION
===============================================================================

Query

Laptop

+--------+----------+
| Rating | Position |
+--------+----------+
| 5      | 1        |
| 4      | 2        |
| 2      | 4        |
+--------+----------+

Quality

↓

(5/1 + 4/2 + 2/4)

/

3

↓

2.50

Poor Queries

↓

1

Total

↓

3

↓

33.33%

===============================================================================
EXPECTED OUTPUT
===============================================================================

+------------+---------+-------------------------+
| query_name | quality | poor_query_percentage   |
+------------+---------+-------------------------+
| Laptop     | 2.50    | 33.33                   |
+------------+---------+-------------------------+

===============================================================================
WHY AVG()?
===============================================================================

AVG()

computes

SUM(values)

/

COUNT(values)

automatically.

It simplifies

quality

and

percentage

calculations.

===============================================================================
ALTERNATIVE SOLUTION
===============================================================================

SELECT

    query_name,

    ROUND
    (
        SUM(rating / position) / COUNT(*),
        2
    ) AS quality,

    ROUND
    (
        SUM
        (
            CASE

                WHEN rating < 3

                THEN 1

                ELSE 0

            END
        )

        *100

        / COUNT(*),

        2
    ) AS poor_query_percentage

FROM Queries

GROUP BY query_name;

Both solutions are correct.

AVG()

is generally shorter
and easier to understand.

===============================================================================
TIME COMPLEXITY
===============================================================================

O(n)

Each row is processed once.

===============================================================================
SPACE COMPLEXITY
===============================================================================

O(n)

For grouped query results.

===============================================================================
INTERVIEW FOLLOW-UP QUESTIONS
===============================================================================

Q1. Why use AVG() instead of SUM()/COUNT()?

AVG() performs both operations
internally, making the query cleaner.

----------------------------------------------------------

Q2. Why use CASE?

To convert poor queries
into numeric values.

----------------------------------------------------------

Q3. Why multiply by 100?

To express the fraction
as a percentage.

----------------------------------------------------------

Q4. What if poor queries were defined
as rating ≤ 2?

Simply replace

rating < 3

with

rating <= 2.

===============================================================================
COMMON MISTAKES
===============================================================================

❌ Forgetting ROUND().

The output must contain
two decimal places.

----------------------------------------------------------

❌ Using integer division.

Ensure the database performs
decimal arithmetic.

----------------------------------------------------------

❌ Forgetting GROUP BY.

Metrics would be calculated
across all queries.

===============================================================================
REAL-WORLD APPLICATIONS
===============================================================================

• Search Engine Analytics

• Recommendation Systems

• Customer Feedback Dashboards

• Product Quality Monitoring

• KPI Reporting

• Business Intelligence

===============================================================================
KEY TAKEAWAYS
===============================================================================

✔ AVG() simplifies average calculations.

✔ CASE enables conditional aggregation.

✔ ROUND() formats KPI values.

✔ Percentage metrics are common in analytics.

✔ Frequently asked in SQL reporting interviews.

===============================================================================
*/
