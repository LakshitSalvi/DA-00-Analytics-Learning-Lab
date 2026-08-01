/*
===============================================================================
                           LEETCODE 1112
                    Highest Grade For Each Student
===============================================================================

Difficulty    : Medium
Topics        : Window Functions, ROW_NUMBER(), PARTITION BY
Companies     : Amazon, Google, Microsoft, Meta, Oracle

===============================================================================
QUESTION
===============================================================================

Table: Enrollments

+---------------+---------+
| Column Name   | Type    |
+---------------+---------+
| student_id    | int     |
| course_id     | int     |
| grade         | int     |
+---------------+---------+

(student_id, course_id) is the primary key.

Each row represents a student's grade in a course.

Write a solution to find the highest grade for each student.

If multiple courses have the same highest grade,
return the course with the smallest course_id.

Return the result table ordered by student_id.

===============================================================================
BUSINESS SCENARIO
===============================================================================

A university wants to generate academic reports showing each student's
best-performing course.

If a student earns the same highest grade in multiple courses,
the course with the smallest course ID should be reported.

===============================================================================
OBJECTIVE
===============================================================================

Return:

• student_id

• course_id

• grade

for each student's highest grade.

===============================================================================
CONCEPTS TESTED
===============================================================================

✔ ROW_NUMBER()

✔ PARTITION BY

✔ ORDER BY

✔ Window Functions

✔ Tie Breaking

===============================================================================
SQL SOLUTION
===============================================================================
*/

SELECT

    student_id,

    course_id,

    grade

FROM
(
    SELECT

        student_id,

        course_id,

        grade,

        ROW_NUMBER()

        OVER
        (
            PARTITION BY student_id

            ORDER BY

                grade DESC,

                course_id ASC
        ) AS GradeRank

    FROM Enrollments

) RankedGrades

WHERE

    GradeRank = 1

ORDER BY

    student_id;

/*
===============================================================================
EXPLANATION
===============================================================================

Step 1

Partition records by student.

----------------------------------------------------------

Step 2

Sort each student's grades.

Highest grade first.

----------------------------------------------------------

Step 3

If grades are equal,

smaller course_id comes first.

----------------------------------------------------------

Step 4

Assign ROW_NUMBER().

----------------------------------------------------------

Step 5

Keep only Rank = 1.

===============================================================================
VISUAL REPRESENTATION
===============================================================================

Student 1

+--------+-------+
| Course | Grade |
+--------+-------+
| 101    | 95    |
| 103    | 95    |
| 105    | 90    |
+--------+-------+

ORDER BY

Grade DESC

Course ASC

↓

101

↓

Rank 1

103

↓

Rank 2

===============================================================================
EXPECTED OUTPUT
===============================================================================

+------------+-----------+-------+
| student_id | course_id | grade |
+------------+-----------+-------+
| 1          | 101       | 95    |
| 2          | 201       | 89    |
+------------+-----------+-------+

===============================================================================
WHY ROW_NUMBER()?
===============================================================================

ROW_NUMBER()

returns exactly one row
for every student.

It also supports custom tie-breaking
using ORDER BY.

===============================================================================
ALTERNATIVE SOLUTION
===============================================================================

SELECT

    e.student_id,

    MIN(e.course_id) AS course_id,

    e.grade

FROM Enrollments e

JOIN
(
    SELECT

        student_id,

        MAX(grade) AS max_grade

    FROM Enrollments

    GROUP BY student_id

) m

ON e.student_id = m.student_id

AND e.grade = m.max_grade

GROUP BY

    e.student_id,

    e.grade;

This solution also works,

but ROW_NUMBER() is cleaner
and easier to extend.

===============================================================================
TIME COMPLEXITY
===============================================================================

O(n log n)

Sorting within each student
dominates execution.

===============================================================================
SPACE COMPLEXITY
===============================================================================

O(n)

For window function processing.

===============================================================================
INTERVIEW FOLLOW-UP QUESTIONS
===============================================================================

Q1. Why use ROW_NUMBER() instead of RANK()?

ROW_NUMBER() guarantees
exactly one row per student.

----------------------------------------------------------

Q2. Why sort by course_id?

To break ties when grades are equal.

----------------------------------------------------------

Q3. Why PARTITION BY student_id?

Each student must have
an independent ranking.

----------------------------------------------------------

Q4. What if the requirement changes
to Top 3 courses?

Filter

GradeRank <= 3.

===============================================================================
COMMON MISTAKES
===============================================================================

❌ Using RANK().

Multiple rows could be returned
for the same student.

----------------------------------------------------------

❌ Forgetting course_id
in ORDER BY.

Tie-breaking would be incorrect.

----------------------------------------------------------

❌ Forgetting PARTITION BY.

Ranking would occur
across all students.

===============================================================================
REAL-WORLD APPLICATIONS
===============================================================================

• Academic Performance Reports

• Employee Performance Reviews

• Sales Leaderboards

• Product Ranking

• Customer Scoring

• Business Intelligence Dashboards

===============================================================================
KEY TAKEAWAYS
===============================================================================

✔ ROW_NUMBER() returns one row per group.

✔ PARTITION BY creates independent rankings.

✔ ORDER BY supports custom tie-breaking.

✔ Window functions simplify Top-1 problems.

✔ A frequently asked SQL interview question.

===============================================================================
*/
