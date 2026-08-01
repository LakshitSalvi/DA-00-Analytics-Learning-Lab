/*
===============================================================================
                          LEETCODE 1581
          Customer Who Visited but Did Not Make Any Transactions
===============================================================================

Difficulty    : Easy
Topics        : LEFT JOIN, GROUP BY, COUNT()
Companies     : Amazon, Google, Microsoft, Meta, Uber

===============================================================================
QUESTION
===============================================================================

Table: Visits

+-------------+---------+
| Column Name | Type    |
+-------------+---------+
| visit_id    | int     |
| customer_id | int     |
+-------------+---------+

visit_id is the primary key.

----------------------------------------------------------

Table: Transactions

+----------------+---------+
| Column Name    | Type    |
+----------------+---------+
| transaction_id | int     |
| visit_id       | int     |
| amount         | int     |
+----------------+---------+

transaction_id is the primary key.

Each transaction belongs to exactly one visit.

Write a solution to find the IDs of customers who visited the mall
without making any transactions and report how many such visits they had.

Return the result table in any order.

===============================================================================
BUSINESS SCENARIO
===============================================================================

A shopping mall wants to understand customer behavior.

Many customers visit the mall but leave without making a purchase.

The marketing team wants to identify these customers and count how many
times they visited without buying anything so they can design targeted
promotional campaigns.

As a Data Analyst, your task is to prepare this report.

===============================================================================
OBJECTIVE
===============================================================================

Return:

• customer_id

• count_no_trans

Where:

count_no_trans = Number of visits that had no transaction.

===============================================================================
CONCEPTS TESTED
===============================================================================

✔ LEFT JOIN

✔ NULL Handling

✔ GROUP BY

✔ COUNT()

✔ Aggregate Functions

===============================================================================
SQL SOLUTION
===============================================================================
*/

SELECT

    v.customer_id,

    COUNT(*) AS count_no_trans

FROM Visits AS v

LEFT JOIN Transactions AS t

ON v.visit_id = t.visit_id

WHERE

    t.transaction_id IS NULL

GROUP BY

    v.customer_id;

/*
===============================================================================
EXPLANATION
===============================================================================

Step 1

Start with the Visits table.

Every visit should be considered.

----------------------------------------------------------

Step 2

LEFT JOIN Transactions using visit_id.

----------------------------------------------------------

Step 3

Visits without transactions will have

NULL

in the transaction_id column.

----------------------------------------------------------

Step 4

Filter those visits using

transaction_id IS NULL.

----------------------------------------------------------

Step 5

Group the remaining visits by customer_id.

----------------------------------------------------------

Step 6

Count the number of non-purchasing visits
for each customer.

===============================================================================
VISUAL REPRESENTATION
===============================================================================

Visits

+----------+-------------+
| visit_id | customer_id |
+----------+-------------+
| 1        | 100         |
| 2        | 100         |
| 3        | 101         |
| 4        | 102         |
+----------+-------------+

Transactions

+----------------+----------+
| transaction_id | visit_id |
+----------------+----------+
| 1              | 1        |
| 2              | 4        |
+----------------+----------+

LEFT JOIN

Visit 1 → Transaction ✔

Visit 2 → NULL

Visit 3 → NULL

Visit 4 → Transaction ✔

↓

Filter NULL

↓

Customer 100

Customer 101

↓

GROUP BY

↓

100 → 1 Visit

101 → 1 Visit

===============================================================================
EXPECTED OUTPUT
===============================================================================

+-------------+----------------+
| customer_id | count_no_trans |
+-------------+----------------+
| 100         | 1              |
| 101         | 1              |
+-------------+----------------+

===============================================================================
WHY LEFT JOIN?
===============================================================================

Every visit should be examined.

LEFT JOIN keeps all visits.

Visits without transactions produce NULL values,
making them easy to identify.

===============================================================================
ALTERNATIVE SOLUTION
===============================================================================

SELECT

    customer_id,

    COUNT(*) AS count_no_trans

FROM Visits

WHERE visit_id NOT IN
(
    SELECT visit_id
    FROM Transactions
)

GROUP BY customer_id;

Although correct,

LEFT JOIN is generally preferred because it clearly
expresses the relationship between the tables and
avoids NULL-related issues.

===============================================================================
TIME COMPLEXITY
===============================================================================

O(n)

Assuming visit_id is indexed.

===============================================================================
SPACE COMPLEXITY
===============================================================================

O(1)

===============================================================================
INTERVIEW FOLLOW-UP QUESTIONS
===============================================================================

Q1. Why use LEFT JOIN?

Because every visit must be checked,
including visits without transactions.

----------------------------------------------------------

Q2. Why GROUP BY customer_id?

Because the report requires the count
for each customer.

----------------------------------------------------------

Q3. Why COUNT(*) instead of COUNT(transaction_id)?

After filtering NULL transaction records,

each remaining row represents one visit
without a transaction.

----------------------------------------------------------

Q4. Can NOT EXISTS solve this problem?

Yes.

It is another common approach for finding
missing related records.

===============================================================================
COMMON MISTAKES
===============================================================================

❌ Using INNER JOIN.

Visits without transactions disappear.

----------------------------------------------------------

❌ Counting transaction_id.

transaction_id is NULL after filtering,
so COUNT(transaction_id) returns 0.

Use COUNT(*).

----------------------------------------------------------

❌ Forgetting GROUP BY.

The query would return only one total count.

===============================================================================
REAL-WORLD APPLICATIONS
===============================================================================

• Customer Behavior Analysis

• Shopping Mall Analytics

• Conversion Funnel Analysis

• Marketing Campaign Planning

• Retail Business Intelligence

• Customer Journey Analytics

===============================================================================
KEY TAKEAWAYS
===============================================================================

✔ LEFT JOIN identifies missing related records.

✔ NULL filtering finds unmatched rows.

✔ GROUP BY summarizes results.

✔ COUNT(*) counts unmatched visits correctly.

✔ A common SQL interview question involving joins and aggregation.

===============================================================================
*/
