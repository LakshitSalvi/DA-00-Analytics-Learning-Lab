/*
===============================================================================
                             LEETCODE 183
                         Customers Who Never Order
===============================================================================

Difficulty    : Easy
Topics        : LEFT JOIN, NULL Handling
Companies     : Amazon, Google, Microsoft, Meta, Deloitte

===============================================================================
QUESTION
===============================================================================

Table: Customers

+-------------+---------+
| Column Name | Type    |
+-------------+---------+
| id          | int     |
| name        | varchar |
+-------------+---------+

id is the primary key.

----------------------------------------------------------

Table: Orders

+-------------+---------+
| Column Name | Type    |
+-------------+---------+
| id          | int     |
| customerId  | int     |
+-------------+---------+

id is the primary key.

customerId is a foreign key referencing Customers.id.

Write a solution to find all customers who never placed an order.

Return the result table in any order.

===============================================================================
BUSINESS SCENARIO
===============================================================================

An online shopping company wants to identify registered customers
who have never placed an order.

The marketing team plans to target these customers with welcome
discounts and promotional campaigns.

As a Data Analyst, your task is to generate a report of inactive customers.

===============================================================================
OBJECTIVE
===============================================================================

Return the names of customers who have never placed an order.

===============================================================================
CONCEPTS TESTED
===============================================================================

✔ LEFT JOIN

✔ NULL Handling

✔ Foreign Keys

✔ Filtering Missing Records

===============================================================================
SQL SOLUTION
===============================================================================
*/

SELECT

    c.name AS Customers

FROM Customers AS c

LEFT JOIN Orders AS o

ON c.id = o.customerId

WHERE o.id IS NULL;

/*
===============================================================================
EXPLANATION
===============================================================================

Step 1

Start with the Customers table because every customer should be checked.

----------------------------------------------------------

Step 2

LEFT JOIN the Orders table using customerId.

----------------------------------------------------------

Step 3

Customers without matching orders will have NULL values
for all columns from the Orders table.

----------------------------------------------------------

Step 4

Filter those customers using

WHERE o.id IS NULL

===============================================================================
VISUAL REPRESENTATION
===============================================================================

Customers

+----+-------+
| id | name  |
+----+-------+
| 1  | Joe   |
| 2  | Henry |
| 3  | Sam   |
+----+-------+

Orders

+----+------------+
| id | customerId |
+----+------------+
| 1  | 3          |
| 2  | 1          |
+----+------------+

LEFT JOIN Result

Joe     → Order Exists

Henry   → NULL

Sam     → Order Exists

↓

Output

Henry

===============================================================================
EXPECTED OUTPUT
===============================================================================

+-----------+
| Customers |
+-----------+
| Henry     |
+-----------+

===============================================================================
WHY LEFT JOIN?
===============================================================================

LEFT JOIN returns every customer.

If no matching order exists,

the columns from Orders become NULL.

Filtering NULL values identifies customers who have never ordered.

===============================================================================
ALTERNATIVE SOLUTION
===============================================================================

SELECT

    name AS Customers

FROM Customers

WHERE id NOT IN
(
    SELECT customerId
    FROM Orders
);

Although this works,

LEFT JOIN is generally preferred because it handles relationships
more explicitly and avoids issues when NULL values exist in subqueries.

===============================================================================
TIME COMPLEXITY
===============================================================================

O(n)

assuming indexes on the join columns.

===============================================================================
SPACE COMPLEXITY
===============================================================================

O(1)

===============================================================================
INTERVIEW FOLLOW-UP QUESTIONS
===============================================================================

Q1. Why use LEFT JOIN?

Because we need every customer,
including those without matching orders.

----------------------------------------------------------

Q2. Why check o.id IS NULL?

NULL indicates that no matching record
was found in the Orders table.

----------------------------------------------------------

Q3. Can NOT EXISTS solve this problem?

Yes.

Example:

SELECT

    name AS Customers

FROM Customers c

WHERE NOT EXISTS
(
    SELECT 1

    FROM Orders o

    WHERE c.id = o.customerId
);

Many interviewers actually prefer NOT EXISTS
for this type of problem.

----------------------------------------------------------

Q4. Which is better?

LEFT JOIN

or

NOT EXISTS?

Both are correct.

Modern SQL optimizers often generate similar execution plans.

===============================================================================
COMMON MISTAKES
===============================================================================

❌ Using INNER JOIN

INNER JOIN removes customers
who have no orders.

----------------------------------------------------------

❌ Using

WHERE o.id = NULL

Always use

IS NULL

to compare NULL values.

----------------------------------------------------------

❌ Joining on the wrong columns.

Correct join:

Customers.id = Orders.customerId

===============================================================================
REAL-WORLD APPLICATIONS
===============================================================================

• Inactive Customer Reports

• Marketing Campaigns

• Customer Retention

• CRM Systems

• Loyalty Programs

• Business Analytics

===============================================================================
KEY TAKEAWAYS
===============================================================================

✔ LEFT JOIN returns all rows from the left table.

✔ NULL identifies missing matching records.

✔ IS NULL is used to filter missing matches.

✔ NOT EXISTS is another common interview solution.

✔ One of the most frequently asked SQL interview questions.

===============================================================================
*/
