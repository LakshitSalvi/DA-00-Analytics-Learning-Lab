/*
===============================================================================
                           LEETCODE 511
                       Game Play Analysis I
===============================================================================

Difficulty    : Easy
Topics        : GROUP BY, Aggregate Functions, MIN()
Companies     : Google, Amazon, Meta, Microsoft, Uber

===============================================================================
QUESTION
===============================================================================

Table: Activity

+--------------+---------+
| Column Name  | Type    |
+--------------+---------+
| player_id    | int     |
| device_id    | int     |
| event_date   | date    |
| games_played | int     |
+--------------+---------+

(player_id, event_date) is the primary key.

Each row represents the activity of a player on a particular day.

Write a solution to find the first login date for each player.

Return the result table in any order.

===============================================================================
BUSINESS SCENARIO
===============================================================================

An online gaming company wants to analyze player engagement.

The product team needs to identify the first day each player logged into
the platform. This information is useful for onboarding analysis,
retention calculations, and customer lifecycle tracking.

As a Data Analyst, your task is to generate each player's first login date.

===============================================================================
OBJECTIVE
===============================================================================

For every player,

return:

• Player ID
• First Login Date

===============================================================================
CONCEPTS TESTED
===============================================================================

✔ GROUP BY

✔ MIN()

✔ Aggregate Functions

✔ Date Analysis

===============================================================================
SQL SOLUTION
===============================================================================
*/

SELECT

    player_id,

    MIN(event_date) AS first_login

FROM Activity

GROUP BY

    player_id;

/*
===============================================================================
EXPLANATION
===============================================================================

Step 1

Group all activity records by player_id.

----------------------------------------------------------

Step 2

For each player,

find the earliest event_date using MIN().

----------------------------------------------------------

Step 3

Return the player_id along with the first login date.

===============================================================================
VISUAL REPRESENTATION
===============================================================================

Activity

+-----------+------------+
| player_id | event_date |
+-----------+------------+
| 1         | 2024-01-05 |
| 1         | 2024-01-03 |
| 1         | 2024-01-10 |
| 2         | 2024-02-01 |
| 2         | 2024-01-28 |
+-----------+------------+

After GROUP BY

Player 1

MIN(Date)

↓

2024-01-03

----------------------------

Player 2

MIN(Date)

↓

2024-01-28

===============================================================================
EXPECTED OUTPUT
===============================================================================

+-----------+-------------+
| player_id | first_login |
+-----------+-------------+
| 1         | 2024-01-03  |
| 2         | 2024-01-28  |
+-----------+-------------+

===============================================================================
WHY MIN()?
===============================================================================

MIN() returns the earliest value within each group.

Since event_date is a DATE,

MIN(event_date)

returns the player's first login date.

===============================================================================
ALTERNATIVE SOLUTION
===============================================================================

SELECT DISTINCT

    player_id,

    FIRST_VALUE(event_date)

        OVER
        (
            PARTITION BY player_id
            ORDER BY event_date
        ) AS first_login

FROM Activity;

Window functions are useful for more advanced analytical queries,
but MIN() is simpler and more efficient for this problem.

===============================================================================
TIME COMPLEXITY
===============================================================================

O(n)

assuming player_id is indexed.

===============================================================================
SPACE COMPLEXITY
===============================================================================

O(1)

===============================================================================
INTERVIEW FOLLOW-UP QUESTIONS
===============================================================================

Q1. Why use MIN() instead of ORDER BY?

MIN() directly returns the earliest date for each player
without sorting the final output.

----------------------------------------------------------

Q2. Can MAX() be used?

Yes.

MAX(event_date)

returns the player's most recent login.

----------------------------------------------------------

Q3. Why GROUP BY player_id?

Because the first login date must be calculated separately
for every player.

----------------------------------------------------------

Q4. Can window functions solve this?

Yes.

FIRST_VALUE() is another valid solution.

===============================================================================
COMMON MISTAKES
===============================================================================

❌ Forgetting GROUP BY.

MIN() would return only one date
for the entire table.

----------------------------------------------------------

❌ Using ORDER BY with LIMIT 1.

That returns only one player's record,
not one record for every player.

----------------------------------------------------------

❌ Grouping by event_date.

The grouping should be based on player_id.

===============================================================================
REAL-WORLD APPLICATIONS
===============================================================================

• Customer First Purchase Analysis

• Employee Joining Date Reports

• User Registration Analytics

• Mobile App User Analytics

• SaaS Customer Lifecycle Analysis

• Cohort Analysis

===============================================================================
KEY TAKEAWAYS
===============================================================================

✔ MIN() returns the earliest value in a group.

✔ GROUP BY creates separate groups for each player.

✔ Aggregate functions summarize grouped data.

✔ First login analysis is widely used in product analytics.

✔ A common SQL interview pattern involving dates.

===============================================================================
*/
