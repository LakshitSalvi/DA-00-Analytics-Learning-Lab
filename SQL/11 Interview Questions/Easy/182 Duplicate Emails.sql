/*
===============================================================================
                             LEETCODE 182
                              Duplicate Emails
===============================================================================

Difficulty    : Easy
Topics        : GROUP BY, HAVING, Aggregate Functions
Companies     : Amazon, Google, Microsoft, Apple, Deloitte

===============================================================================
QUESTION
===============================================================================

Table: Person

+-------------+---------+
| Column Name | Type    |
+-------------+---------+
| id          | int     |
| email       | varchar |
+-------------+---------+

id is the primary key.

Each row of this table contains an email.

Write a solution to report all duplicate emails.

Return the result table in any order.

===============================================================================
BUSINESS SCENARIO
===============================================================================

A company maintains a customer database.

Due to data entry errors or system synchronization issues,
multiple customer records may contain the same email address.

The data quality team wants to identify duplicate email addresses
before performing database cleanup.

===============================================================================
OBJECTIVE
===============================================================================

Find all email addresses that appear more than once.

===============================================================================
CONCEPTS TESTED
===============================================================================

✔ GROUP BY

✔ HAVING

✔ COUNT()

✔ Aggregate Functions

===============================================================================
SQL SOLUTION
===============================================================================
*/

SELECT

    email

FROM Person

GROUP BY

    email

HAVING

    COUNT(*) > 1;

/*
===============================================================================
EXPLANATION
===============================================================================

Step 1

Group all rows having the same email.

----------------------------------------------------------

Step 2

Count the number of records in each group.

----------------------------------------------------------

Step 3

Only keep groups where the count is greater than one.

These are duplicate email addresses.

===============================================================================
VISUAL REPRESENTATION
===============================================================================

Person

+----+-------------------+
| id | email             |
+----+-------------------+
| 1  | a@gmail.com       |
| 2  | b@gmail.com       |
| 3  | a@gmail.com       |
| 4  | c@gmail.com       |
| 5  | b@gmail.com       |
+----+-------------------+

After GROUP BY

a@gmail.com → 2

b@gmail.com → 2

c@gmail.com → 1

HAVING COUNT(*) > 1

↓

a@gmail.com

b@gmail.com

===============================================================================
EXPECTED OUTPUT
===============================================================================

+-------------------+
| email             |
+-------------------+
| a@gmail.com       |
| b@gmail.com       |
+-------------------+

===============================================================================
WHY GROUP BY?
===============================================================================

GROUP BY collects identical email addresses into groups.

COUNT() calculates how many times each email appears.

HAVING filters grouped results based on aggregate values.

WHERE cannot be used here because aggregate functions
are evaluated after grouping.

===============================================================================
ALTERNATIVE SOLUTION
===============================================================================

SELECT DISTINCT

    p1.email

FROM Person p1

JOIN Person p2

ON p1.email = p2.email

AND p1.id <> p2.id;

Although this works,

GROUP BY + HAVING is simpler, faster,
and more commonly expected in interviews.

===============================================================================
TIME COMPLEXITY
===============================================================================

O(n)

assuming efficient grouping.

===============================================================================
SPACE COMPLEXITY
===============================================================================

O(n)

for grouping operations.

===============================================================================
INTERVIEW FOLLOW-UP QUESTIONS
===============================================================================

Q1. Why use HAVING instead of WHERE?

HAVING filters grouped results after aggregation.

WHERE filters rows before grouping.

----------------------------------------------------------

Q2. Can COUNT(email) be used instead of COUNT(*)?

Yes.

Since email is not NULL in this problem,
both produce the same result.

----------------------------------------------------------

Q3. What if the question asked for duplicate records instead of emails?

Return the complete rows using a JOIN or a subquery.

----------------------------------------------------------

Q4. Which clause executes first?

FROM

↓

WHERE

↓

GROUP BY

↓

HAVING

↓

SELECT

↓

ORDER BY

===============================================================================
COMMON MISTAKES
===============================================================================

❌ Using WHERE COUNT(*) > 1

Aggregate functions cannot be used inside WHERE.

----------------------------------------------------------

❌ Forgetting GROUP BY

Without grouping,

COUNT() returns the total number of rows.

----------------------------------------------------------

❌ Using DISTINCT unnecessarily

GROUP BY already groups identical email values.

===============================================================================
REAL-WORLD APPLICATIONS
===============================================================================

• Customer Database Cleanup

• CRM Systems

• Banking Customer Records

• Duplicate Lead Detection

• User Account Validation

• Data Quality Audits

===============================================================================
KEY TAKEAWAYS
===============================================================================

✔ GROUP BY groups identical values.

✔ HAVING filters grouped data.

✔ COUNT() identifies duplicate occurrences.

✔ GROUP BY + HAVING is the standard solution.

✔ One of the most frequently asked SQL interview questions.

===============================================================================
*/
