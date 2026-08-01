/*
===============================================================================
                           LEETCODE 619
                         Biggest Single Number
===============================================================================

Difficulty    : Easy
Topics        : GROUP BY, HAVING, Aggregate Functions
Companies     : Amazon, Google, Microsoft, Meta, Bloomberg

===============================================================================
QUESTION
===============================================================================

Table: MyNumbers

+-------------+---------+
| Column Name | Type    |
+-------------+---------+
| num         | int     |
+-------------+---------+

There is no primary key for this table.

Each row contains an integer.

A single number is a number that appears exactly once.

Write a solution to find the largest single number.

If there is no single number, return NULL.

===============================================================================
BUSINESS SCENARIO
===============================================================================

A financial institution stores transaction reference numbers.

Due to system retries, some reference numbers appear multiple times.

The audit team needs to identify the largest transaction reference number
that appears exactly once.

As a Data Analyst, your task is to find the biggest unique number.

===============================================================================
OBJECTIVE
===============================================================================

Return:

• Largest number

that appears exactly once.

If no such number exists,

return NULL.

===============================================================================
CONCEPTS TESTED
===============================================================================

✔ GROUP BY

✔ HAVING

✔ COUNT()

✔ MAX()

✔ Aggregate Functions

===============================================================================
SQL SOLUTION
===============================================================================
*/

SELECT

    MAX(num) AS num

FROM
(
    SELECT

        num

    FROM MyNumbers

    GROUP BY

        num

    HAVING

        COUNT(*) = 1

) AS SingleNumbers;

/*
===============================================================================
EXPLANATION
===============================================================================

Step 1

Group identical numbers together.

----------------------------------------------------------

Step 2

Keep only numbers that appear exactly once.

HAVING COUNT(*) = 1

----------------------------------------------------------

Step 3

Return the largest remaining number
using MAX().

If no rows remain,

MAX() automatically returns NULL.

===============================================================================
VISUAL REPRESENTATION
===============================================================================

MyNumbers

+-----+
| num |
+-----+
| 8   |
| 8   |
| 3   |
| 1   |
| 1   |
| 5   |
+-----+

After GROUP BY

8 → 2

3 → 1

1 → 2

5 → 1

↓

HAVING COUNT(*) = 1

3

5

↓

MAX()

↓

5

===============================================================================
EXPECTED OUTPUT
===============================================================================

+-----+
| num |
+-----+
| 5   |
+-----+

===============================================================================
WHY MAX()?
===============================================================================

After filtering unique numbers,

multiple values may still exist.

MAX() returns the largest one.

If no unique numbers exist,

MAX() returns NULL automatically.

===============================================================================
ALTERNATIVE SOLUTION
===============================================================================

SELECT

    num

FROM MyNumbers

GROUP BY

    num

HAVING

    COUNT(*) = 1

ORDER BY

    num DESC

LIMIT 1;

This solution is also correct.

However,

MAX() naturally returns NULL when no rows exist,
matching the problem requirement.

===============================================================================
TIME COMPLEXITY
===============================================================================

O(n)

Grouping scans the table once.

===============================================================================
SPACE COMPLEXITY
===============================================================================

O(n)

For grouped values.

===============================================================================
INTERVIEW FOLLOW-UP QUESTIONS
===============================================================================

Q1. Why use HAVING instead of WHERE?

Because COUNT(*) is an aggregate function.

----------------------------------------------------------

Q2. Why use MAX()?

To return the largest number
among all unique numbers.

----------------------------------------------------------

Q3. What happens if no single number exists?

MAX() returns NULL.

----------------------------------------------------------

Q4. Could ORDER BY + LIMIT be used?

Yes.

But MAX() automatically handles
the NULL case more elegantly.

===============================================================================
COMMON MISTAKES
===============================================================================

❌ Using WHERE COUNT(*) = 1

Aggregate functions cannot be used
inside WHERE.

----------------------------------------------------------

❌ Forgetting GROUP BY.

COUNT() would count the entire table.

----------------------------------------------------------

❌ Returning every unique number.

The problem asks for only
the largest unique number.

===============================================================================
REAL-WORLD APPLICATIONS
===============================================================================

• Transaction Auditing

• Duplicate Detection

• Financial Reporting

• Data Quality Analysis

• Fraud Detection

• ETL Validation

===============================================================================
KEY TAKEAWAYS
===============================================================================

✔ GROUP BY identifies duplicate values.

✔ HAVING filters grouped records.

✔ COUNT(*) = 1 finds unique values.

✔ MAX() returns the largest qualifying value.

✔ A classic SQL aggregation interview problem.

===============================================================================
*/
