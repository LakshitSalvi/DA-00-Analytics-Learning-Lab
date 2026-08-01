/*
===============================================================================
                           LEETCODE 1097
                        Game Play Analysis V
===============================================================================

Difficulty    : Hard
Topics        : Window Functions, CTE, FIRST_VALUE(), Aggregation
Companies     : Meta, Google, Amazon, Microsoft, Riot Games

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

Each row records a player's activity on a particular day.

Write a solution to calculate

Day 1 Retention.

The fraction is defined as:

(Number of players who logged in again
exactly one day after their first login)

/

(Total number of players)

Round the answer to

2 decimal places.

===============================================================================
BUSINESS SCENARIO
===============================================================================

A gaming company wants to measure

Day-1 Retention,

one of the most important product metrics.

This KPI measures how many new players
return the day after installing the game.

Higher retention indicates better
player engagement.

===============================================================================
OBJECTIVE
===============================================================================

Return

• fraction

representing the Day-1 retention rate.

===============================================================================
CONCEPTS TESTED
===============================================================================

✔ Common Table Expressions (CTEs)

✔ MIN()

✔ DATE_ADD()

✔ LEFT JOIN

✔ ROUND()

✔ COUNT(DISTINCT)

===============================================================================
SQL SOLUTION
===============================================================================
*/

WITH FirstLogin AS
(
    SELECT

        player_id,

        MIN(event_date) AS first_login

    FROM Activity

    GROUP BY

        player_id
)

SELECT

    ROUND
    (
        COUNT(DISTINCT a.player_id)
        /
        COUNT(DISTINCT f.player_id),
        2
    ) AS fraction

FROM FirstLogin f

LEFT JOIN Activity a

ON f.player_id = a.player_id

AND a.event_date = DATE_ADD(f.first_login, INTERVAL 1 DAY);

/*
===============================================================================
EXPLANATION
===============================================================================

Step 1

Find each player's

first login date.

----------------------------------------------------------

Step 2

Look for another login

exactly one day later.

----------------------------------------------------------

Step 3

Count players
who returned.

----------------------------------------------------------

Step 4

Divide by

total players.

----------------------------------------------------------

Step 5

Round the answer
to two decimal places.

===============================================================================
VISUAL REPRESENTATION
===============================================================================

Player A

Jan 1

↓

First Login

Jan 2

↓

Returned

✔

----------------------------------

Player B

Jan 5

↓

First Login

Jan 7

↓

Not Day 1

✘

----------------------------------

Retention

1

/

2

↓

0.50

===============================================================================
EXPECTED OUTPUT
===============================================================================

+----------+
| fraction |
+----------+
| 0.50     |
+----------+

===============================================================================
WHY LEFT JOIN?
===============================================================================

Every player should appear,
even if they never logged in again.

LEFT JOIN preserves all players
from the first login list.

===============================================================================
ALTERNATIVE SOLUTION
===============================================================================

A window function using

LEAD()

can identify the next login date.

However,

MIN() + JOIN

is simpler and commonly preferred
for interviews.

===============================================================================
TIME COMPLEXITY
===============================================================================

O(n)

Grouping and joining dominate execution.

===============================================================================
SPACE COMPLEXITY
===============================================================================

O(n)

For storing first login dates.

===============================================================================
INTERVIEW FOLLOW-UP QUESTIONS
===============================================================================

Q1. Why use MIN(event_date)?

To identify each player's first login.

----------------------------------------------------------

Q2. Why use DATE_ADD()?

To check whether the player returned
exactly one day later.

----------------------------------------------------------

Q3. Why COUNT(DISTINCT)?

Each player should only be counted once.

----------------------------------------------------------

Q4. How would you calculate

Day-7 Retention?

Replace

INTERVAL 1 DAY

with

INTERVAL 7 DAY.

===============================================================================
COMMON MISTAKES
===============================================================================

❌ Counting all returning logins.

Only the first login
and the next day matter.

----------------------------------------------------------

❌ Using INNER JOIN.

Players who never returned
would disappear from the denominator.

----------------------------------------------------------

❌ Forgetting DISTINCT.

Duplicate records
can inflate the retention rate.

===============================================================================
REAL-WORLD APPLICATIONS
===============================================================================

• Mobile Game Analytics

• SaaS User Retention

• Customer Retention Dashboards

• Product Analytics

• Subscription Platforms

• Business Intelligence

===============================================================================
KEY TAKEAWAYS
===============================================================================

✔ MIN() identifies first events.

✔ DATE_ADD() compares sequential dates.

✔ LEFT JOIN preserves non-returning users.

✔ Retention analysis is one of the most important
product analytics interview topics.

✔ Frequently asked by gaming and product companies.

===============================================================================
*/
