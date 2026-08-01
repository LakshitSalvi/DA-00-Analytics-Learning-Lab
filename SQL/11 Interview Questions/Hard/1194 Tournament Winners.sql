/*
===============================================================================
                           LEETCODE 1194
                         Tournament Winners
===============================================================================

Difficulty    : Hard
Topics        : JOIN, CASE, SUM(), GROUP BY, Window Functions
Companies     : Google, Amazon, Microsoft, Riot Games, EA Sports

===============================================================================
QUESTION
===============================================================================

Table: Players

+---------------+---------+
| Column Name   | Type    |
+---------------+---------+
| player_id     | int     |
| group_id      | int     |
+---------------+---------+

player_id is the primary key.

----------------------------------------------------------

Table: Matches

+---------------+---------+
| Column Name   | Type    |
+---------------+---------+
| match_id      | int     |
| first_player  | int     |
| second_player | int     |
| first_score   | int     |
| second_score  | int     |
+---------------+---------+

match_id is the primary key.

Each match awards points equal to the score achieved.

Write a solution to report the winner of each group.

The winner is the player with the highest total score.

If multiple players have the same score,

return the player with the smallest player_id.

===============================================================================
BUSINESS SCENARIO
===============================================================================

A gaming tournament consists of several groups.

Players compete against others within their group.

Management wants to determine the champion
of every group based on the total points scored.

If multiple players finish with the same score,
the player with the smaller ID wins.

===============================================================================
OBJECTIVE
===============================================================================

Return

• group_id

• player_id

for each group's winner.

===============================================================================
CONCEPTS TESTED
===============================================================================

✔ UNION ALL

✔ CASE

✔ SUM()

✔ GROUP BY

✔ ROW_NUMBER()

✔ Window Functions

===============================================================================
SQL SOLUTION
===============================================================================
*/

WITH PlayerScores AS
(
    SELECT

        first_player AS player_id,

        first_score AS score

    FROM Matches

    UNION ALL

    SELECT

        second_player,

        second_score

    FROM Matches
),

TotalScores AS
(
    SELECT

        p.group_id,

        ps.player_id,

        SUM(ps.score) AS total_score

    FROM PlayerScores ps

    JOIN Players p

    ON ps.player_id = p.player_id

    GROUP BY

        p.group_id,

        ps.player_id
),

RankedPlayers AS
(
    SELECT

        group_id,

        player_id,

        total_score,

        ROW_NUMBER()

        OVER
        (
            PARTITION BY group_id

            ORDER BY

                total_score DESC,

                player_id ASC
        ) AS ranking

    FROM TotalScores
)

SELECT

    group_id,

    player_id

FROM RankedPlayers

WHERE

    ranking = 1

ORDER BY

    group_id;

/*
===============================================================================
EXPLANATION
===============================================================================

Step 1

Convert both players'

scores

into one table.

----------------------------------------------------------

Step 2

Calculate total score
for every player.

----------------------------------------------------------

Step 3

Associate players
with their groups.

----------------------------------------------------------

Step 4

Rank players
inside each group.

Highest Score

↓

First

If tied

↓

Smaller Player ID

wins.

----------------------------------------------------------

Step 5

Return

Rank = 1

===============================================================================
VISUAL REPRESENTATION
===============================================================================

Group A

Player

1

Score

18

------------------------

Player

2

Score

22

------------------------

Player

3

Score

22

↓

Tie

↓

Smaller ID

↓

Player 2

Wins

===============================================================================
EXPECTED OUTPUT
===============================================================================

+----------+-----------+
| group_id | player_id |
+----------+-----------+
| 1        | 2         |
| 2        | 5         |
+----------+-----------+

===============================================================================
WHY UNION ALL?
===============================================================================

Each match stores

two players.

UNION ALL

creates one row
per player's score.

===============================================================================
ALTERNATIVE SOLUTION
===============================================================================

DENSE_RANK()

can replace

ROW_NUMBER(),

but ROW_NUMBER()

handles the tie-breaking
more naturally.

===============================================================================
TIME COMPLEXITY
===============================================================================

O(n log n)

Grouping and ranking dominate execution.

===============================================================================
SPACE COMPLEXITY
===============================================================================

O(n)

For score aggregation
and ranking.

===============================================================================
INTERVIEW FOLLOW-UP QUESTIONS
===============================================================================

Q1. Why UNION ALL?

To combine both players'
scores into one dataset.

----------------------------------------------------------

Q2. Why GROUP BY player?

To calculate total tournament points.

----------------------------------------------------------

Q3. Why ROW_NUMBER()?

To identify exactly one winner
per group.

----------------------------------------------------------

Q4. How are ties handled?

ORDER BY

total_score DESC,

player_id ASC.

===============================================================================
COMMON MISTAKES
===============================================================================

❌ Forgetting the second player's score.

Only half the tournament
would be considered.

----------------------------------------------------------

❌ Using RANK().

Multiple winners could appear.

----------------------------------------------------------

❌ Forgetting tie-breaking
by player_id.

The result would be incorrect.

===============================================================================
REAL-WORLD APPLICATIONS
===============================================================================

• Tournament Analytics

• Sports Leaderboards

• Gaming Competitions

• Sales Competitions

• Employee Performance Rankings

• Business Intelligence

===============================================================================
KEY TAKEAWAYS
===============================================================================

✔ UNION ALL combines multiple participant roles.

✔ SUM() calculates total performance.

✔ ROW_NUMBER() determines a single winner.

✔ Window functions simplify ranking problems.

✔ One of the most common SQL ranking interview questions.

===============================================================================
*/
