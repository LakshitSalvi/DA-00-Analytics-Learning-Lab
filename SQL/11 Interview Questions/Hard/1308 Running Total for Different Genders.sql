/*
===============================================================================
                           LEETCODE 1308
                 Running Total for Different Genders
===============================================================================

Difficulty    : Hard
Topics        : Window Functions, SUM() OVER(), Running Total
Companies     : Amazon, Google, Microsoft, Meta, Oracle

===============================================================================
QUESTION
===============================================================================

Table: Scores

+---------------+---------+
| Column Name   | Type    |
+---------------+---------+
| player_name   | varchar |
| gender        | varchar |
| day           | date    |
| score_points  | int     |
+---------------+---------+

(player_name, gender) is the primary key.

Each row represents the score earned by a player
on a given day.

Write a solution to calculate the running total
of score_points separately for each gender.

Return:

• gender

• day

• total

ordered by

gender

then

day.

===============================================================================
BUSINESS SCENARIO
===============================================================================

A sports analytics company tracks daily scores
for men's and women's tournaments.

Analysts need cumulative scores
for each gender independently
to monitor tournament progress.

===============================================================================
OBJECTIVE
===============================================================================

Return

• gender

• day

• total

where total is the cumulative score
up to the current day
for each gender.

===============================================================================
CONCEPTS TESTED
===============================================================================

✔ SUM() OVER()

✔ PARTITION BY

✔ ORDER BY

✔ Running Totals

✔ Window Functions

===============================================================================
SQL SOLUTION
===============================================================================
*/

SELECT

    gender,

    day,

    SUM(score_points)

    OVER
    (
        PARTITION BY gender

        ORDER BY day

        ROWS BETWEEN UNBOUNDED PRECEDING
                 AND CURRENT ROW
    ) AS total

FROM Scores

ORDER BY

    gender,

    day;

/*
===============================================================================
EXPLANATION
===============================================================================

Step 1

Partition rows
by gender.

----------------------------------------------------------

Step 2

Sort records
by day.

----------------------------------------------------------

Step 3

Calculate the cumulative sum
from the first day
to the current day.

----------------------------------------------------------

Step 4

Return the running total
for every row.

===============================================================================
VISUAL REPRESENTATION
===============================================================================

Male

Day 1

100

↓

100

------------------------

Day 2

80

↓

180

------------------------

Day 3

60

↓

240

==================================

Female

Day 1

120

↓

120

------------------------

Day 2

90

↓

210

===============================================================================
EXPECTED OUTPUT
===============================================================================

+--------+------------+-------+
| gender | day        | total |
+--------+------------+-------+
| F      |2020-01-01  |120    |
| F      |2020-01-02  |210    |
| M      |2020-01-01  |100    |
| M      |2020-01-02  |180    |
| M      |2020-01-03  |240    |
+--------+------------+-------+

===============================================================================
WHY PARTITION BY?
===============================================================================

Each gender
has its own independent
running total.

Without PARTITION BY,

both genders
would be combined.

===============================================================================
ALTERNATIVE SOLUTION
===============================================================================

A correlated subquery
can compute the running total,

but it executes much slower.

Window functions
are the preferred solution.

===============================================================================
TIME COMPLEXITY
===============================================================================

O(n log n)

Sorting by gender and day
dominates execution.

===============================================================================
SPACE COMPLEXITY
===============================================================================

O(n)

For window function processing.

===============================================================================
INTERVIEW FOLLOW-UP QUESTIONS
===============================================================================

Q1. Why use PARTITION BY?

Each gender requires
its own running total.

----------------------------------------------------------

Q2. Why ORDER BY day?

Running totals depend
on chronological order.

----------------------------------------------------------

Q3. Why specify

ROWS BETWEEN UNBOUNDED PRECEDING
AND CURRENT ROW?

It explicitly defines
the cumulative window.

----------------------------------------------------------

Q4. How would you calculate
a rolling 7-day total?

Replace

UNBOUNDED PRECEDING

with

6 PRECEDING.

===============================================================================
COMMON MISTAKES
===============================================================================

❌ Forgetting PARTITION BY.

The totals would include
both genders.

----------------------------------------------------------

❌ Ordering by player_name.

Running totals should follow
the timeline.

----------------------------------------------------------

❌ Using GROUP BY.

GROUP BY removes
individual daily records.

===============================================================================
REAL-WORLD APPLICATIONS
===============================================================================

• Sports Analytics

• Sales Dashboards

• Financial Running Balances

• Inventory Tracking

• Website Traffic Monitoring

• Business Intelligence

===============================================================================
KEY TAKEAWAYS
===============================================================================

✔ SUM() OVER() computes running totals.

✔ PARTITION BY creates independent calculations.

✔ ORDER BY defines accumulation order.

✔ Window functions preserve row-level detail.

✔ Running totals are among the most common SQL analytics patterns.

===============================================================================
*/
