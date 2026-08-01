/*
===============================================================================
                           LEETCODE 1633
               Percentage of Users Attended a Contest
===============================================================================

Difficulty    : Medium
Topics        : GROUP BY, COUNT(), ROUND(), JOIN
Companies     : Google, Amazon, Microsoft, Meta, LinkedIn

===============================================================================
QUESTION
===============================================================================

Table: Users

+-------------+---------+
| Column Name | Type    |
+-------------+---------+
| user_id     | int     |
| user_name   | varchar |
+-------------+---------+

user_id is the primary key.

----------------------------------------------------------

Table: Register

+-------------+---------+
| Column Name | Type    |
+-------------+---------+
| contest_id  | int     |
| user_id     | int     |
+-------------+---------+

(contest_id, user_id) is the primary key.

Each row indicates that a user registered
for a contest.

Write a solution to find the percentage of users
registered in each contest.

Round the percentage to

2 decimal places.

Return the result ordered by

percentage DESC

then

contest_id ASC.

===============================================================================
BUSINESS SCENARIO
===============================================================================

An online competition platform hosts multiple contests.

Management wants to know the popularity of each contest by calculating
what percentage of all registered users participated.

This KPI helps evaluate contest engagement and marketing effectiveness.

===============================================================================
OBJECTIVE
===============================================================================

Return:

• contest_id

• percentage

where

percentage =

(Number of registered users)

/

(Total users)

×

100

===============================================================================
CONCEPTS TESTED
===============================================================================

✔ GROUP BY

✔ COUNT()

✔ ROUND()

✔ ORDER BY

✔ Aggregate Functions

===============================================================================
SQL SOLUTION
===============================================================================
*/

SELECT

    r.contest_id,

    ROUND
    (
        COUNT(r.user_id) * 100.0
        /
        (
            SELECT COUNT(*)
            FROM Users
        ),
        2
    ) AS percentage

FROM Register r

GROUP BY

    r.contest_id

ORDER BY

    percentage DESC,

    r.contest_id ASC;

/*
===============================================================================
EXPLANATION
===============================================================================

Step 1

Count the number of users
registered in each contest.

----------------------------------------------------------

Step 2

Count the total number
of users.

----------------------------------------------------------

Step 3

Calculate

Contest Users

/

Total Users

×

100.

----------------------------------------------------------

Step 4

Round the percentage
to two decimal places.

----------------------------------------------------------

Step 5

Sort by

Percentage DESC

and

Contest ID ASC.

===============================================================================
VISUAL REPRESENTATION
===============================================================================

Users

10 Total Users

------------------------

Contest 1

7 Users

↓

70%

------------------------

Contest 2

5 Users

↓

50%

------------------------

Contest 3

2 Users

↓

20%

===============================================================================
EXPECTED OUTPUT
===============================================================================

+------------+------------+
| contest_id | percentage |
+------------+------------+
| 1          | 70.00      |
| 2          | 50.00      |
| 3          | 20.00      |
+------------+------------+

===============================================================================
WHY SUBQUERY?
===============================================================================

The total number of users

is required for every contest.

A scalar subquery retrieves
this value once
and uses it in every calculation.

===============================================================================
ALTERNATIVE SOLUTION
===============================================================================

WITH TotalUsers AS
(
    SELECT COUNT(*) AS total_users
    FROM Users
)

SELECT

    contest_id,

    ROUND
    (
        COUNT(*) * 100.0 / total_users,
        2
    ) AS percentage

FROM Register

CROSS JOIN TotalUsers

GROUP BY

    contest_id,

    total_users

ORDER BY

    percentage DESC,

    contest_id;

Both solutions are valid.

The scalar subquery is shorter
and commonly used in interviews.

===============================================================================
TIME COMPLEXITY
===============================================================================

O(n)

Each registration is processed once.

===============================================================================
SPACE COMPLEXITY
===============================================================================

O(n)

For grouped contest statistics.

===============================================================================
INTERVIEW FOLLOW-UP QUESTIONS
===============================================================================

Q1. Why multiply by 100?

To convert the fraction
into a percentage.

----------------------------------------------------------

Q2. Why use ROUND()?

The problem requires
two decimal places.

----------------------------------------------------------

Q3. Why order by contest_id
after percentage?

To resolve ties consistently.

----------------------------------------------------------

Q4. What if we wanted only contests
with more than 50% participation?

Add

HAVING

ROUND
(
COUNT(*) * 100.0 /
(SELECT COUNT(*) FROM Users),
2
) > 50

===============================================================================
COMMON MISTAKES
===============================================================================

❌ Forgetting 100.0.

Integer division may truncate
the decimal value.

----------------------------------------------------------

❌ Ordering only by percentage.

Tie-breaking requires
contest_id ASC.

----------------------------------------------------------

❌ Dividing by registered users.

The denominator must be

all users,

not registered users.

===============================================================================
REAL-WORLD APPLICATIONS
===============================================================================

• Event Participation Analysis

• Webinar Attendance Reports

• Employee Training Completion

• Survey Response Rates

• Product Adoption Metrics

• Business Intelligence Dashboards

===============================================================================
KEY TAKEAWAYS
===============================================================================

✔ COUNT() measures participation.

✔ Scalar subqueries simplify percentage calculations.

✔ ROUND() formats KPI values.

✔ ORDER BY supports deterministic ranking.

✔ A common SQL analytics interview question.

===============================================================================
*/
