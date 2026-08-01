/*
===============================================================================
                           LEETCODE 1412
                 Find the Quiet Students in All Exams
===============================================================================

Difficulty    : Hard
Topics        : Window Functions, DENSE_RANK(), CTE, Anti Join
Companies     : Google, Amazon, Microsoft, Meta, Oracle

===============================================================================
QUESTION
===============================================================================

Table: Student

+---------------+---------+
| Column Name   | Type    |
+---------------+---------+
| student_id    | int     |
| student_name  | varchar |
+---------------+---------+

student_id is the primary key.

----------------------------------------------------------

Table: Exam

+---------------+---------+
| Column Name   | Type    |
+---------------+---------+
| exam_id       | int     |
| student_id    | int     |
| score         | int     |
+---------------+---------+

There may be multiple students
in each exam.

A student is considered

Quiet

if

• They participated in at least one exam.

AND

• They never achieved the highest score
  in any exam.

AND

• They never achieved the lowest score
  in any exam.

Return

• student_id

• student_name

ordered by student_id.

===============================================================================
BUSINESS SCENARIO
===============================================================================

A university wants to identify students
who consistently perform in the middle range.

These students never rank first
or last in any exam,
making them ideal candidates
for balanced performance analysis.

===============================================================================
OBJECTIVE
===============================================================================

Return students who

• Appeared in exams

• Were never the top scorer

• Were never the lowest scorer

===============================================================================
CONCEPTS TESTED
===============================================================================

✔ DENSE_RANK()

✔ Window Functions

✔ Common Table Expressions (CTEs)

✔ Anti Join

✔ DISTINCT

===============================================================================
SQL SOLUTION
===============================================================================
*/

WITH RankedScores AS
(
    SELECT

        exam_id,

        student_id,

        score,

        DENSE_RANK()

        OVER
        (
            PARTITION BY exam_id
            ORDER BY score DESC
        ) AS highest_rank,

        DENSE_RANK()

        OVER
        (
            PARTITION BY exam_id
            ORDER BY score ASC
        ) AS lowest_rank

    FROM Exam
),

ExtremeStudents AS
(
    SELECT DISTINCT

        student_id

    FROM RankedScores

    WHERE

        highest_rank = 1

        OR

        lowest_rank = 1
)

SELECT

    s.student_id,

    s.student_name

FROM Student s

JOIN
(
    SELECT DISTINCT

        student_id

    FROM Exam
) Participants

ON s.student_id = Participants.student_id

LEFT JOIN ExtremeStudents e

ON s.student_id = e.student_id

WHERE

    e.student_id IS NULL

ORDER BY

    s.student_id;

/*
===============================================================================
EXPLANATION
===============================================================================

Step 1

Rank students

within every exam.

----------------------------------------------------------

Highest Score

↓

Rank = 1

Lowest Score

↓

Rank = 1

----------------------------------------------------------

Step 2

Collect every student
who was

Highest

or

Lowest

in any exam.

----------------------------------------------------------

Step 3

Find students
who participated
in exams.

----------------------------------------------------------

Step 4

Remove every

Highest

or

Lowest

student.

Remaining students are

Quiet Students.

===============================================================================
VISUAL REPRESENTATION
===============================================================================

Exam 1

Alice

95

Highest

✘

Bob

82

✔

Charlie

60

Lowest

✘

----------------------------------

Exam 2

Bob

78

✔

David

90

Highest

✘

Emma

65

Lowest

✘

----------------------------------

Quiet Student

↓

Bob

===============================================================================
EXPECTED OUTPUT
===============================================================================

+------------+--------------+
| student_id | student_name |
+------------+--------------+
| 2          | Bob          |
+------------+--------------+

===============================================================================
WHY DENSE_RANK()?
===============================================================================

Multiple students

may tie

for

Highest

or

Lowest

score.

DENSE_RANK()

assigns

Rank = 1

to every tied student.

===============================================================================
ALTERNATIVE SOLUTION
===============================================================================

MIN()

and

MAX()

can identify extreme scores,

but

DENSE_RANK()

handles ties more naturally
and is preferred for interviews.

===============================================================================
TIME COMPLEXITY
===============================================================================

O(n log n)

Ranking dominates execution.

===============================================================================
SPACE COMPLEXITY
===============================================================================

O(n)

For ranking and CTE storage.

===============================================================================
INTERVIEW FOLLOW-UP QUESTIONS
===============================================================================

Q1. Why DENSE_RANK() instead of ROW_NUMBER()?

Tied highest or lowest scores
should all receive Rank = 1.

----------------------------------------------------------

Q2. Why LEFT JOIN?

To exclude students
who were ever
highest or lowest.

----------------------------------------------------------

Q3. Why DISTINCT?

A student may appear
in multiple exams.

----------------------------------------------------------

Q4. What if only the highest scorer
should be excluded?

Remove

lowest_rank = 1

from the WHERE clause.

===============================================================================
COMMON MISTAKES
===============================================================================

❌ Using ROW_NUMBER().

Tied students
would not all be identified.

----------------------------------------------------------

❌ Forgetting students
must participate in at least one exam.

----------------------------------------------------------

❌ Using INNER JOIN
instead of LEFT JOIN.

The anti-join would fail.

----------------------------------------------------------

❌ Ignoring ties.

Every tied highest
and lowest scorer
must be excluded.

===============================================================================
REAL-WORLD APPLICATIONS
===============================================================================

• Academic Performance Analysis

• Employee Performance Reviews

• Sales Leaderboards

• Customer Behavior Segmentation

• Competition Analytics

• Business Intelligence

===============================================================================
KEY TAKEAWAYS
===============================================================================

✔ DENSE_RANK() correctly handles ties.

✔ Window functions simplify ranking.

✔ Anti joins exclude unwanted records.

✔ Combining ranking with filtering
is a common interview pattern.

✔ One of the most advanced SQL ranking questions.

===============================================================================
*/
