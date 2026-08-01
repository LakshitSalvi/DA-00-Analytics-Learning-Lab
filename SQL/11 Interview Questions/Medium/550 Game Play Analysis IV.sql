/*
===============================================================================
                           LEETCODE 550
                       Game Play Analysis IV
===============================================================================

Difficulty    : Medium
Topics        : JOIN, Window Functions, Aggregate Functions
Companies     : Amazon, Google, Meta, Microsoft, Uber

===============================================================================
QUESTION
===============================================================================

Table: Activity

+---------------+---------+
| Column Name   | Type    |
+---------------+---------+
| player_id     | int     |
| device_id     | int     |
| event_date    | date    |
| games_played  | int     |
+---------------+---------+

(player_id, event_date) is the primary key.

Write a solution to report the fraction of players that logged in again
on the day immediately after their first login.

Round the answer to 2 decimal places.

===============================================================================
BUSINESS SCENARIO
===============================================================================

A gaming company wants to measure Day-1 user retention.

The product team defines a retained player as someone who logs in
again exactly one day after their first login.

This metric helps evaluate user engagement and onboarding success.

As a Data Analyst, your task is to calculate the Day-1 retention rate.

===============================================================================
OBJECTIVE
===============================================================================

Return:

• fraction

where

fraction =
(players returning the next day after first login)

÷

(total unique players)

===============================================================================
CONCEPTS TESTED
===============================================================================

✔ INNER JOIN

✔ GROUP BY

✔ MIN()

✔ DATEDIFF()

✔ COUNT()

✔ ROUND()

===============================================================================
SQL SOLUTION
===============================================================================
*/

SELECT

    ROUND
    (
        COUNT(DISTINCT a.player_id)
        /
        (
            SELECT COUNT(DISTINCT player_id)
            FROM Activity
        ),
        2
    ) AS fraction

FROM Activity AS a

INNER JOIN
(
    SELECT

        player_id,

        MIN(event_date) AS first_login

    FROM Activity

    GROUP BY

        player_id

) AS FirstLogin

ON a.player_id = FirstLogin.player_id

AND DATEDIFF(a.event_date, FirstLogin.first_login) = 1;

/*
===============================================================================
EXPLANATION
===============================================================================

Step 1

Find each player's first login date.

----------------------------------------------------------

Step 2

Join the Activity table back to the first login.

----------------------------------------------------------

Step 3

Keep only records where the login occurred

exactly one day later.

----------------------------------------------------------

Step 4

Count those players.

----------------------------------------------------------

Step 5

Divide by the total number of unique players.

----------------------------------------------------------

Step 6

Round the result to two decimal places.

===============================================================================
VISUAL REPRESENTATION
===============================================================================

Player 1

Jan 1

↓

Jan 2

✔ Retained

------------------------

Player 2

Jan 5

↓

Jan 8

✘ Not Retained

------------------------

Player 3

Feb 1

↓

Feb 2

✔ Retained

Retained Players

↓

2

Total Players

↓

3

Fraction

↓

2 / 3 = 0.67

===============================================================================
EXPECTED OUTPUT
===============================================================================

+----------+
| fraction |
+----------+
| 0.67     |
+----------+

===============================================================================
WHY MIN()?
===============================================================================

MIN(event_date)

identifies each player's first login.

The retention calculation always starts
from the first login date.

===============================================================================
ALTERNATIVE SOLUTION (WINDOW FUNCTION)
===============================================================================

WITH RankedLogins AS
(
    SELECT

        player_id,

        event_date,

        FIRST_VALUE(event_date)

        OVER
        (
            PARTITION BY player_id
            ORDER BY event_date
        ) AS first_login

    FROM Activity
)

SELECT

ROUND
(
COUNT(DISTINCT player_id) /
(
SELECT COUNT(DISTINCT player_id)
FROM Activity
),
2
) AS fraction

FROM RankedLogins

WHERE DATEDIFF(event_date, first_login) = 1;

Window functions make identifying
the first login straightforward.

===============================================================================
TIME COMPLEXITY
===============================================================================

O(n log n)

Grouping and joining dominate execution.

===============================================================================
SPACE COMPLEXITY
===============================================================================

O(n)

For grouped player data.

===============================================================================
INTERVIEW FOLLOW-UP QUESTIONS
===============================================================================

Q1. Why use MIN(event_date)?

To determine the player's first login.

----------------------------------------------------------

Q2. Why COUNT(DISTINCT player_id)?

A player may have multiple qualifying logins,
but should only be counted once.

----------------------------------------------------------

Q3. What does DATEDIFF() = 1 represent?

The player logged in again
exactly one day later.

----------------------------------------------------------

Q4. How would you calculate
Day-7 retention?

Replace

DATEDIFF(...)=1

with

DATEDIFF(...)=7

===============================================================================
COMMON MISTAKES
===============================================================================

❌ Counting login records instead of players.

Always count DISTINCT players.

----------------------------------------------------------

❌ Comparing consecutive logins.

The comparison must be made against
the first login date.

----------------------------------------------------------

❌ Forgetting ROUND().

The required output is rounded
to two decimal places.

===============================================================================
REAL-WORLD APPLICATIONS
===============================================================================

• User Retention Analysis

• SaaS Customer Analytics

• Mobile App Engagement

• Gaming Analytics

• Product Growth Metrics

• Customer Lifecycle Reporting

===============================================================================
KEY TAKEAWAYS
===============================================================================

✔ MIN() identifies the first event.

✔ DATEDIFF() measures retention periods.

✔ COUNT(DISTINCT) avoids duplicate counting.

✔ Retention analysis is one of the most common
analytics interview topics.

✔ Frequently asked by product-based companies.

===============================================================================
*/
