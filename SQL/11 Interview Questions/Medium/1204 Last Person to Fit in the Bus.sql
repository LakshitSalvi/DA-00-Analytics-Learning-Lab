/*
===============================================================================
                           LEETCODE 1204
                    Last Person to Fit in the Bus
===============================================================================

Difficulty    : Medium
Topics        : Window Functions, SUM(), ORDER BY
Companies     : Amazon, Google, Microsoft, Uber, Oracle

===============================================================================
QUESTION
===============================================================================

Table: Queue

+-------------+---------+
| Column Name | Type    |
+-------------+---------+
| person_id   | int     |
| person_name | varchar |
| weight      | int     |
| turn        | int     |
+-------------+---------+

person_id is the primary key.

turn determines the boarding order.

A bus has a maximum weight capacity of

1000 kg.

People enter the bus one by one according to their turn.

Write a solution to find the name of the last person
who can board the bus without exceeding the weight limit.

===============================================================================
BUSINESS SCENARIO
===============================================================================

A transportation company wants to determine the final passenger who can
board a shuttle before the maximum weight capacity is reached.

Passengers board strictly in queue order.

===============================================================================
OBJECTIVE
===============================================================================

Return:

• person_name

of the last passenger whose cumulative weight
does not exceed

1000 kg.

===============================================================================
CONCEPTS TESTED
===============================================================================

✔ Window Functions

✔ Running Total

✔ SUM() OVER()

✔ ORDER BY

✔ Cumulative Sum

===============================================================================
SQL SOLUTION
===============================================================================
*/

SELECT

    person_name

FROM
(
    SELECT

        person_name,

        SUM(weight)

        OVER
        (
            ORDER BY turn
        ) AS running_weight

    FROM Queue

) AS Boarding

WHERE

    running_weight <= 1000

ORDER BY

    running_weight DESC

LIMIT 1;

/*
===============================================================================
EXPLANATION
===============================================================================

Step 1

Sort passengers
by boarding order.

----------------------------------------------------------

Step 2

Calculate the cumulative weight
using SUM() OVER().

----------------------------------------------------------

Step 3

Keep only passengers whose
running weight is

≤ 1000 kg.

----------------------------------------------------------

Step 4

Return the passenger with
the largest valid cumulative weight.

===============================================================================
VISUAL REPRESENTATION
===============================================================================

Queue

+------+--------+
| Name | Weight |
+------+--------+
| Alex | 200    |
| Bob  | 300    |
| Emma | 250    |
| John | 400    |
+------+--------+

Running Weight

Alex

↓

200

Bob

↓

500

Emma

↓

750

John

↓

1150

✘ Exceeds Limit

↓

Answer

Emma

===============================================================================
EXPECTED OUTPUT
===============================================================================

+-------------+
| person_name |
+-------------+
| Emma        |
+-------------+

===============================================================================
WHY WINDOW FUNCTIONS?
===============================================================================

SUM() OVER()

calculates a running total
without collapsing rows.

This makes cumulative calculations
simple and efficient.

===============================================================================
ALTERNATIVE SOLUTION
===============================================================================

SELECT

    q1.person_name

FROM Queue q1

WHERE
(
    SELECT SUM(weight)

    FROM Queue q2

    WHERE q2.turn <= q1.turn
)

<= 1000

ORDER BY q1.turn DESC

LIMIT 1;

This correlated subquery works,

but the window function solution
is much faster and easier to read.

===============================================================================
TIME COMPLEXITY
===============================================================================

O(n log n)

Sorting by turn dominates execution.

===============================================================================
SPACE COMPLEXITY
===============================================================================

O(n)

For window function computation.

===============================================================================
INTERVIEW FOLLOW-UP QUESTIONS
===============================================================================

Q1. Why use SUM() OVER()?

It computes the running total
without grouping rows.

----------------------------------------------------------

Q2. Why ORDER BY turn?

Passengers board in queue order.

----------------------------------------------------------

Q3. Why ORDER BY running_weight DESC?

To retrieve the last passenger
within the weight limit.

----------------------------------------------------------

Q4. What if the bus capacity changes
to 1500 kg?

Simply replace

1000

with

1500.

===============================================================================
COMMON MISTAKES
===============================================================================

❌ Using GROUP BY.

GROUP BY removes row-level information.

----------------------------------------------------------

❌ Forgetting ORDER BY inside OVER().

The running total would be incorrect.

----------------------------------------------------------

❌ Ordering by person_id instead of turn.

The boarding order is determined
by turn.

===============================================================================
REAL-WORLD APPLICATIONS
===============================================================================

• Passenger Boarding Systems

• Warehouse Capacity Planning

• Inventory Weight Tracking

• Truck Loading Analysis

• Manufacturing Capacity Reports

• Running Balance Calculations

===============================================================================
KEY TAKEAWAYS
===============================================================================

✔ SUM() OVER() computes cumulative totals.

✔ Window functions preserve individual rows.

✔ Running totals are a common analytics pattern.

✔ ORDER BY inside OVER() defines accumulation order.

✔ One of the most frequently asked SQL window function problems.

===============================================================================
*/
