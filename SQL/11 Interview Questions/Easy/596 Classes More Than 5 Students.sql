/*
===============================================================================
                           LEETCODE 596
                    Classes More Than 5 Students
===============================================================================

Difficulty    : Easy
Topics        : GROUP BY, HAVING, COUNT()
Companies     : Amazon, Google, Microsoft, Meta, Oracle

===============================================================================
QUESTION
===============================================================================

Table: Courses

+-------------+---------+
| Column Name | Type    |
+-------------+---------+
| student     | varchar |
| class       | varchar |
+-------------+---------+

(student, class) is the primary key.

Each row indicates that a student is enrolled in a class.

Write a solution to find all classes that have at least five students.

Return the result table in any order.

===============================================================================
BUSINESS SCENARIO
===============================================================================

A university wants to identify classes with high enrollment.

The academic department needs to know which classes have enough students
to continue offering them next semester.

As a Data Analyst, your task is to generate a report listing all classes
that have at least five enrolled students.

===============================================================================
OBJECTIVE
===============================================================================

Return:

• Class Name

for every class that has

5 or more students enrolled.

===============================================================================
CONCEPTS TESTED
===============================================================================

✔ GROUP BY

✔ HAVING

✔ COUNT()

✔ Aggregate Functions

===============================================================================
SQL SOLUTION
===============================================================================
*/

SELECT

    class

FROM Courses

GROUP BY

    class

HAVING

    COUNT(student) >= 5;

/*
===============================================================================
EXPLANATION
===============================================================================

Step 1

Group all records by class.

----------------------------------------------------------

Step 2

Count the number of students enrolled in each class.

----------------------------------------------------------

Step 3

Keep only those classes where the student count
is greater than or equal to five.

===============================================================================
VISUAL REPRESENTATION
===============================================================================

Courses

+---------+-----------+
| Student | Class     |
+---------+-----------+
| Alice   | Math      |
| Bob     | Math      |
| Carol   | Math      |
| David   | Math      |
| Emma    | Math      |
| Frank   | Science   |
| Grace   | Science   |
+---------+-----------+

After GROUP BY

Math

↓

5 Students

✔ Include

--------------------------

Science

↓

2 Students

✘ Exclude

===============================================================================
EXPECTED OUTPUT
===============================================================================

+--------+
| class  |
+--------+
| Math   |
+--------+

===============================================================================
WHY HAVING?
===============================================================================

HAVING filters grouped results.

COUNT(student) is an aggregate function.

Aggregate functions cannot be used in the WHERE clause.

===============================================================================
ALTERNATIVE SOLUTION
===============================================================================

SELECT

    class

FROM Courses

GROUP BY

    class

HAVING

    COUNT(*) >= 5;

COUNT(*)

and

COUNT(student)

produce the same result because student
is part of the primary key and cannot be NULL.

===============================================================================
TIME COMPLEXITY
===============================================================================

O(n)

One scan of the Courses table.

===============================================================================
SPACE COMPLEXITY
===============================================================================

O(n)

To store grouped class information.

===============================================================================
INTERVIEW FOLLOW-UP QUESTIONS
===============================================================================

Q1. Why use HAVING instead of WHERE?

HAVING filters grouped data.

WHERE filters individual rows before grouping.

----------------------------------------------------------

Q2. Why GROUP BY class?

Because the count must be calculated separately
for each class.

----------------------------------------------------------

Q3. Can COUNT(*) replace COUNT(student)?

Yes.

Since student cannot be NULL,
both return the same result.

----------------------------------------------------------

Q4. What if the requirement changes to
"more than 10 students"?

Simply change the condition to

HAVING COUNT(*) > 10;

===============================================================================
COMMON MISTAKES
===============================================================================

❌ Using

WHERE COUNT(*) >= 5

Aggregate functions cannot be used
inside WHERE.

----------------------------------------------------------

❌ Forgetting GROUP BY.

COUNT() would return the total number
of students across all classes.

----------------------------------------------------------

❌ Using DISTINCT unnecessarily.

GROUP BY already groups identical classes.

===============================================================================
REAL-WORLD APPLICATIONS
===============================================================================

• University Enrollment Reports

• Employee Training Programs

• Workshop Registration Analysis

• Event Participation Reports

• Customer Segmentation

• Business Intelligence Dashboards

===============================================================================
KEY TAKEAWAYS
===============================================================================

✔ GROUP BY creates one group per class.

✔ COUNT() calculates group size.

✔ HAVING filters aggregated results.

✔ WHERE cannot use aggregate functions.

✔ One of the most common GROUP BY interview questions.

===============================================================================
*/
