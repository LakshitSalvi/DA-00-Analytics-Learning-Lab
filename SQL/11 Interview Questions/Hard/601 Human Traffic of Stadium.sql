/*
===============================================================================
                           LEETCODE 601
                     Human Traffic of Stadium
===============================================================================

Difficulty    : Hard
Topics        : Window Functions, CTE, Consecutive Rows, Gaps & Islands
Companies     : Google, Amazon, Microsoft, Meta, Uber

===============================================================================
QUESTION
===============================================================================

Table: Stadium

+---------------+---------+
| Column Name   | Type    |
+---------------+---------+
| id            | int     |
| visit_date    | date    |
| people        | int     |
+---------------+---------+

id is the primary key.

Each row records the number of people
visiting the stadium on a particular day.

Write a solution to display records where

people >= 100

for

three or more consecutive rows.

Return the result ordered by visit_date.

===============================================================================
BUSINESS SCENARIO
===============================================================================

A stadium management team wants to identify
periods of consistently high attendance.

Only streaks of at least

three consecutive days

with

100 or more visitors

should be reported.

These insights help with staffing,
security planning,
and event scheduling.

===============================================================================
OBJECTIVE
===============================================================================

Return all rows belonging to streaks of

three or more consecutive records

where

people >= 100.

===============================================================================
CONCEPTS TESTED
===============================================================================

✔ Common Table Expressions (CTEs)

✔ ROW_NUMBER()

✔ Consecutive Sequence Detection

✔ Gaps and Islands

✔ Window Functions

===============================================================================
SQL SOLUTION
===============================================================================
*/

WITH HighTraffic AS
(
    SELECT

        id,

        visit_date,

        people,

        id - ROW_NUMBER()

        OVER
        (
            ORDER BY id
        ) AS grp

    FROM Stadium

    WHERE people >= 100
),

GroupedTraffic AS
(
    SELECT

        grp

    FROM HighTraffic

    GROUP BY

        grp

    HAVING

        COUNT(*) >= 3
)

SELECT

    h.id,

    h.visit_date,

    h.people

FROM HighTraffic h

JOIN GroupedTraffic g

ON h.grp = g.grp

ORDER BY

    h.visit_date;

/*
===============================================================================
EXPLANATION
===============================================================================

Step 1

Filter rows where

people >= 100.

----------------------------------------------------------

Step 2

Assign

ROW_NUMBER()

ordered by ID.

----------------------------------------------------------

Step 3

Compute

id - ROW_NUMBER().

Consecutive IDs produce
the same value.

----------------------------------------------------------

Step 4

Group rows using
the calculated value.

----------------------------------------------------------

Step 5

Keep only groups
containing

3 or more rows.

===============================================================================
VISUAL REPRESENTATION
===============================================================================

ID

5

6

7

10

11

↓

ROW_NUMBER()

1

2

3

4

5

↓

ID - ROW_NUMBER()

4

4

4

6

6

↓

Groups

4

↓

3 Rows

✔ Include

6

↓

2 Rows

✘ Exclude

===============================================================================
EXPECTED OUTPUT
===============================================================================

+----+------------+--------+
| id | visit_date | people |
+----+------------+--------+
| 5  | 2017-01-05 | 145    |
| 6  | 2017-01-06 | 180    |
| 7  | 2017-01-07 | 199    |
+----+------------+--------+

===============================================================================
WHY id - ROW_NUMBER()?
===============================================================================

For consecutive IDs,

both values increase together.

Their difference remains constant,

creating a natural group identifier.

===============================================================================
ALTERNATIVE SOLUTION
===============================================================================

LAG()

and

LEAD()

can compare neighboring rows,

but the

ROW_NUMBER()

grouping approach is shorter
and scales better.

===============================================================================
TIME COMPLEXITY
===============================================================================

O(n log n)

Sorting by ID dominates execution.

===============================================================================
SPACE COMPLEXITY
===============================================================================

O(n)

For CTE processing.

===============================================================================
INTERVIEW FOLLOW-UP QUESTIONS
===============================================================================

Q1. Why filter first?

Only high-traffic days
should participate
in consecutive grouping.

----------------------------------------------------------

Q2. Why use ROW_NUMBER()?

To detect consecutive sequences.

----------------------------------------------------------

Q3. Why does

id - ROW_NUMBER()

work?

Its value remains constant
for consecutive IDs.

----------------------------------------------------------

Q4. Can this detect

5 consecutive days?

Yes.

Simply replace

COUNT(*) >= 3

with

COUNT(*) >= 5.

===============================================================================
COMMON MISTAKES
===============================================================================

❌ Grouping before filtering.

Low-traffic days would break
the sequence logic.

----------------------------------------------------------

❌ Ordering by visit_date
instead of ID.

The problem defines
consecutive rows using IDs.

----------------------------------------------------------

❌ Using COUNT(*)
without grouping.

It counts all rows,
not consecutive streaks.

===============================================================================
REAL-WORLD APPLICATIONS
===============================================================================

• Website Traffic Analysis

• Store Footfall Monitoring

• Manufacturing Downtime Detection

• Machine Sensor Monitoring

• User Login Streak Analysis

• Event Attendance Reporting

===============================================================================
KEY TAKEAWAYS
===============================================================================

✔ ROW_NUMBER() helps identify consecutive sequences.

✔ id - ROW_NUMBER() is a classic Gaps & Islands technique.

✔ CTEs simplify complex sequence logic.

✔ Consecutive-event analysis is a high-frequency SQL interview topic.

✔ One of the most important Hard SQL interview questions.

===============================================================================
*/
