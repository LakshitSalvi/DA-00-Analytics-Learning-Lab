/*
===============================================================================
                           LEETCODE 1454
                              Active Users
===============================================================================

Difficulty    : Medium
Topics        : Window Functions, CTE, DATEDIFF(), ROW_NUMBER()
Companies     : Meta, Google, Amazon, Microsoft, LinkedIn

===============================================================================
QUESTION
===============================================================================

Table: Accounts

+--------------+---------+
| Column Name  | Type    |
+--------------+---------+
| id           | int     |
| name         | varchar |
+--------------+---------+

id is the primary key.

----------------------------------------------------------

Table: Logins

+--------------+---------+
| Column Name  | Type    |
+--------------+---------+
| id           | int     |
| login_date   | date    |
+--------------+---------+

(id, login_date) is the primary key.

Write a solution to find the IDs and names of active users.

An active user is defined as someone who logged in for

5 or more consecutive days.

Return the result table in any order.

===============================================================================
BUSINESS SCENARIO
===============================================================================

A social media platform wants to identify highly engaged users.

Marketing considers users active if they have logged in for at least
five consecutive days.

These users are eligible for loyalty rewards and premium campaigns.

===============================================================================
OBJECTIVE
===============================================================================

Return:

• id

• name

for users with at least

5 consecutive login days.

===============================================================================
CONCEPTS TESTED
===============================================================================

✔ Common Table Expressions (CTEs)

✔ ROW_NUMBER()

✔ DATEDIFF()

✔ Consecutive Dates

✔ GROUP BY

===============================================================================
SQL SOLUTION
===============================================================================
*/

WITH RankedLogins AS
(
    SELECT

        id,

        login_date,

        ROW_NUMBER()

        OVER
        (
            PARTITION BY id
            ORDER BY login_date
        ) AS rn

    FROM Logins
),

GroupedLogins AS
(
    SELECT

        id,

        login_date,

        DATE_SUB(login_date, INTERVAL rn DAY) AS grp

    FROM RankedLogins
)

SELECT DISTINCT

    a.id,

    a.name

FROM Accounts a

JOIN
(
    SELECT

        id

    FROM GroupedLogins

    GROUP BY

        id,

        grp

    HAVING

        COUNT(*) >= 5

) ActiveUsers

ON a.id = ActiveUsers.id;

/*
===============================================================================
EXPLANATION
===============================================================================

Step 1

Assign a row number to each login
for every user.

----------------------------------------------------------

Step 2

Subtract the row number
from the login date.

Consecutive dates produce
the same value.

----------------------------------------------------------

Step 3

Group by

User

and

Calculated Group.

----------------------------------------------------------

Step 4

Count consecutive logins.

----------------------------------------------------------

Step 5

Return users having
at least five consecutive days.

===============================================================================
VISUAL REPRESENTATION
===============================================================================

User 1

Jan 1

Jan 2

Jan 3

Jan 4

Jan 5

↓

ROW_NUMBER()

1

2

3

4

5

↓

DATE_SUB(login_date,rn)

↓

Same Group

↓

Count = 5

↓

Active User

===============================================================================
EXPECTED OUTPUT
===============================================================================

+----+-------+
| id | name  |
+----+-------+
| 1  | Alice |
| 4  | David |
+----+-------+

===============================================================================
WHY DATE_SUB(login_date, INTERVAL rn DAY)?
===============================================================================

For consecutive dates,

subtracting the row number
produces the same value.

This allows consecutive logins
to be grouped together.

===============================================================================
ALTERNATIVE SOLUTION
===============================================================================

Use

LAG()

to compare each login date
with the previous login.

However,

the ROW_NUMBER() grouping technique
is the most common interview solution.

===============================================================================
TIME COMPLEXITY
===============================================================================

O(n log n)

Sorting login dates dominates execution.

===============================================================================
SPACE COMPLEXITY
===============================================================================

O(n)

For window function processing.

===============================================================================
INTERVIEW FOLLOW-UP QUESTIONS
===============================================================================

Q1. Why use ROW_NUMBER()?

To assign sequential numbers
to each user's logins.

----------------------------------------------------------

Q2. Why subtract the row number
from the date?

Consecutive dates produce
the same calculated value,
forming a group.

----------------------------------------------------------

Q3. Why GROUP BY grp?

Each group represents
one consecutive login streak.

----------------------------------------------------------

Q4. How would you find users
with 10 consecutive logins?

Replace

COUNT(*) >= 5

with

COUNT(*) >= 10.

===============================================================================
COMMON MISTAKES
===============================================================================

❌ Using COUNT(*) only.

It counts total logins,
not consecutive logins.

----------------------------------------------------------

❌ Forgetting PARTITION BY.

Logins from different users
would be mixed together.

----------------------------------------------------------

❌ Grouping only by user.

Consecutive streaks
cannot be identified.

===============================================================================
REAL-WORLD APPLICATIONS
===============================================================================

• User Retention Analysis

• Customer Engagement Tracking

• Mobile App Analytics

• Gaming Login Streaks

• Loyalty Programs

• Business Intelligence

===============================================================================
KEY TAKEAWAYS
===============================================================================

✔ ROW_NUMBER() identifies sequence positions.

✔ DATE_SUB() groups consecutive dates.

✔ Consecutive sequence analysis is a classic SQL interview topic.

✔ CTEs improve readability for multi-step logic.

✔ One of the highest-frequency SQL interview questions involving date sequences.

===============================================================================
