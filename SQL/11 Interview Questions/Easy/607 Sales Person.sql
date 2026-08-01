/*
===============================================================================
                           LEETCODE 607
                              Sales Person
===============================================================================

Difficulty    : Easy
Topics        : JOIN, Subquery, NOT IN
Companies     : Amazon, Google, Microsoft, Oracle, Salesforce

===============================================================================
QUESTION
===============================================================================

Table: SalesPerson

+-----------------+---------+
| Column Name     | Type    |
+-----------------+---------+
| sales_id        | int     |
| name            | varchar |
| salary          | int     |
| commission_rate | int     |
| hire_date       | date    |
+-----------------+---------+

sales_id is the primary key.

----------------------------------------------------------

Table: Company

+-------------+---------+
| Column Name | Type    |
+-------------+---------+
| com_id      | int     |
| name        | varchar |
| city        | varchar |
+-------------+---------+

com_id is the primary key.

----------------------------------------------------------

Table: Orders

+-------------+---------+
| Column Name | Type    |
+-------------+---------+
| order_id    | int     |
| order_date  | date    |
| com_id      | int     |
| sales_id    | int     |
| amount      | int     |
+-------------+---------+

order_id is the primary key.

Write a solution to find the names of all salespersons who did NOT have
any orders related to the company named "RED".

Return the result table in any order.

===============================================================================
BUSINESS SCENARIO
===============================================================================

A retail organization wants to review salesperson performance.

Management specifically wants to identify salespersons who have never
handled orders for one of its major clients, "RED".

These employees will be assigned to a new campaign targeting RED.

===============================================================================
OBJECTIVE
===============================================================================

Return:

• Salesperson Name

Exclude every salesperson who has at least one order
from the company "RED".

===============================================================================
CONCEPTS TESTED
===============================================================================

✔ INNER JOIN

✔ Subqueries

✔ NOT IN

✔ Filtering

===============================================================================
SQL SOLUTION
===============================================================================
*/

SELECT

    name

FROM SalesPerson

WHERE sales_id NOT IN
(
    SELECT

        o.sales_id

    FROM Orders AS o

    INNER JOIN Company AS c

        ON o.com_id = c.com_id

    WHERE c.name = 'RED'
);

/*
===============================================================================
EXPLANATION
===============================================================================

Step 1

Find every salesperson who sold something
to the company named "RED".

----------------------------------------------------------

Step 2

Return all salespersons whose sales_id
does NOT appear in that list.

===============================================================================
VISUAL REPRESENTATION
===============================================================================

Company

RED

↓

Orders

Salesperson 2

Salesperson 4

↓

NOT IN

↓

Salesperson 1

Salesperson 3

Salesperson 5

===============================================================================
EXPECTED OUTPUT
===============================================================================

+-------+
| name  |
+-------+
| Alice |
| David |
| Emma  |
+-------+

===============================================================================
WHY NOT IN?
===============================================================================

The subquery returns every salesperson who has sold to RED.

NOT IN excludes those salespersons from the final result.

===============================================================================
ALTERNATIVE SOLUTION
===============================================================================

SELECT

    s.name

FROM SalesPerson AS s

WHERE NOT EXISTS
(
    SELECT 1

    FROM Orders o

    INNER JOIN Company c

        ON o.com_id = c.com_id

    WHERE

        o.sales_id = s.sales_id

        AND c.name = 'RED'
);

NOT EXISTS is often preferred because it safely handles NULL values
and is commonly recommended in production SQL.

===============================================================================
TIME COMPLEXITY
===============================================================================

O(n log n)

Depends on indexing of sales_id and com_id.

===============================================================================
SPACE COMPLEXITY
===============================================================================

O(n)

For the subquery result.

===============================================================================
INTERVIEW FOLLOW-UP QUESTIONS
===============================================================================

Q1. Why use NOT IN?

Because we want to exclude all salespersons
who have sold to RED.

----------------------------------------------------------

Q2. Can NOT EXISTS solve this?

Yes.

It is generally preferred when NULL values
may exist in the subquery.

----------------------------------------------------------

Q3. Why join Orders and Company?

Orders stores only com_id.

Company contains the company name.

The join identifies which orders belong to RED.

----------------------------------------------------------

Q4. Which solution is better?

For interview purposes,

both are correct.

For production systems,

NOT EXISTS is usually preferred.

===============================================================================
COMMON MISTAKES
===============================================================================

❌ Filtering directly on Company.name
without joining Orders.

Orders contain the salesperson information.

----------------------------------------------------------

❌ Using INNER JOIN only.

The task is to exclude certain salespersons,
which requires NOT IN or NOT EXISTS.

----------------------------------------------------------

❌ Ignoring NULL values.

NOT IN may produce unexpected results
if the subquery returns NULL.

===============================================================================
REAL-WORLD APPLICATIONS
===============================================================================

• Sales Performance Analysis

• CRM Reporting

• Customer Assignment

• Territory Management

• Business Intelligence

• Sales Analytics

===============================================================================
KEY TAKEAWAYS
===============================================================================

✔ Use subqueries to exclude records.

✔ NOT IN filters values not returned by a subquery.

✔ NOT EXISTS is a robust alternative.

✔ Joins are often required before filtering.

✔ Classic SQL interview problem involving exclusion logic.

===============================================================================
*/
