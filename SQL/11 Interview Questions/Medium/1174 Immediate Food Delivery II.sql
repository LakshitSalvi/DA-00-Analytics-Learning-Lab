/*
===============================================================================
                           LEETCODE 1174
                     Immediate Food Delivery II
===============================================================================

Difficulty    : Medium
Topics        : GROUP BY, MIN(), ROUND(), Aggregate Functions
Companies     : Amazon, Uber, DoorDash, Google, Meta

===============================================================================
QUESTION
===============================================================================

Table: Delivery

+---------------------+---------+
| Column Name         | Type    |
+---------------------+---------+
| delivery_id         | int     |
| customer_id         | int     |
| order_date          | date    |
| customer_pref_date  | date    |
+---------------------+---------+

delivery_id is the primary key.

If

order_date = customer_pref_date

↓

Immediate Order

Otherwise

↓

Scheduled Order

Write a solution to calculate the percentage of customers whose

FIRST ORDER

was an

IMMEDIATE

order.

Round the answer to 2 decimal places.

===============================================================================
BUSINESS SCENARIO
===============================================================================

A food delivery company wants to measure customer ordering behavior.

Product managers are interested in knowing how many customers chose
immediate delivery when placing their very first order.

This metric helps evaluate customer urgency and platform usage.

===============================================================================
OBJECTIVE
===============================================================================

Return:

• immediate_percentage

where

immediate_percentage =

(Customers whose first order is immediate)

÷

(Total Customers)

× 100

===============================================================================
CONCEPTS TESTED
===============================================================================

✔ GROUP BY

✔ MIN()

✔ JOIN

✔ ROUND()

✔ COUNT(DISTINCT)

===============================================================================
SQL SOLUTION
===============================================================================
*/

SELECT

    ROUND
    (
        100 *
        AVG
        (
            CASE

                WHEN d.order_date = d.customer_pref_date

                THEN 1

                ELSE 0

            END
        ),
        2
    ) AS immediate_percentage

FROM Delivery d

INNER JOIN
(
    SELECT

        customer_id,

        MIN(order_date) AS first_order

    FROM Delivery

    GROUP BY

        customer_id

) FirstOrders

ON d.customer_id = FirstOrders.customer_id

AND d.order_date = FirstOrders.first_order;

/*
===============================================================================
EXPLANATION
===============================================================================

Step 1

Find each customer's first order date.

----------------------------------------------------------

Step 2

Join back to the Delivery table.

----------------------------------------------------------

Step 3

Determine whether the first order
was immediate.

order_date = customer_pref_date

↓

Immediate

----------------------------------------------------------

Step 4

AVG()

calculates the fraction of immediate orders.

----------------------------------------------------------

Step 5

Multiply by 100
and round to two decimal places.

===============================================================================
VISUAL REPRESENTATION
===============================================================================

Customer 1

Jan 1

Immediate

✔

------------------------

Customer 2

Jan 3

Scheduled

✘

------------------------

Customer 3

Feb 5

Immediate

✔

Immediate Customers

↓

2

Total Customers

↓

3

↓

66.67%

===============================================================================
EXPECTED OUTPUT
===============================================================================

+----------------------+
| immediate_percentage |
+----------------------+
| 66.67               |
+----------------------+

===============================================================================
WHY AVG()?
===============================================================================

CASE returns

1

for immediate orders

and

0

for scheduled orders.

AVG()

calculates the fraction automatically.

===============================================================================
ALTERNATIVE SOLUTION
===============================================================================

SELECT

ROUND
(
100 *

SUM
(
CASE

WHEN order_date = customer_pref_date

THEN 1

ELSE 0

END
)

/

COUNT(*),

2
)

AS immediate_percentage

FROM
(
    SELECT *

    FROM Delivery d

    WHERE (customer_id, order_date) IN
    (
        SELECT

            customer_id,

            MIN(order_date)

        FROM Delivery

        GROUP BY customer_id
    )
) FirstOrders;

Both solutions are valid.

Using AVG() is shorter and more readable.

===============================================================================
TIME COMPLEXITY
===============================================================================

O(n log n)

Grouping dominates execution.

===============================================================================
SPACE COMPLEXITY
===============================================================================

O(n)

For first-order records.

===============================================================================
INTERVIEW FOLLOW-UP QUESTIONS
===============================================================================

Q1. Why use MIN(order_date)?

To identify each customer's first order.

----------------------------------------------------------

Q2. Why AVG()?

AVG() automatically computes
the percentage of TRUE values.

----------------------------------------------------------

Q3. Why multiply by 100?

To convert the fraction
into a percentage.

----------------------------------------------------------

Q4. What if we wanted the percentage
of scheduled first orders?

Reverse the CASE statement.

===============================================================================
COMMON MISTAKES
===============================================================================

❌ Calculating all orders.

Only the

first order

should be considered.

----------------------------------------------------------

❌ Forgetting ROUND().

The required output
must have two decimal places.

----------------------------------------------------------

❌ Dividing integers.

Using AVG() avoids integer division issues.

===============================================================================
REAL-WORLD APPLICATIONS
===============================================================================

• Customer Behavior Analysis

• Food Delivery Analytics

• User Journey Metrics

• Product Analytics

• E-commerce Dashboards

• Business Intelligence Reporting

===============================================================================
KEY TAKEAWAYS
===============================================================================

✔ MIN() identifies first events.

✔ CASE converts conditions into numeric values.

✔ AVG() is a simple way to calculate percentages.

✔ Customer first-event analysis is a common interview topic.

✔ Frequently asked in product analytics interviews.

===============================================================================
*/
