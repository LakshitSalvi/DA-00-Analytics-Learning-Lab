/*
===============================================================================
                           LEETCODE 610
                          Triangle Judgement
===============================================================================

Difficulty    : Easy
Topics        : CASE Statement, Conditional Logic
Companies     : Amazon, Google, Microsoft, Meta, Oracle

===============================================================================
QUESTION
===============================================================================

Table: Triangle

+-------------+---------+
| Column Name | Type    |
+-------------+---------+
| x           | int     |
| y           | int     |
| z           | int     |
+-------------+---------+

(x, y, z) is the primary key.

Each row contains the lengths of three line segments.

Write a solution to determine whether the three segments can form
a triangle.

Return "Yes" if they can form a triangle; otherwise return "No".

===============================================================================
BUSINESS SCENARIO
===============================================================================

A construction company manufactures triangular support frames.

Before production begins, engineers need to verify whether the three
given side lengths satisfy the triangle inequality theorem.

As a Data Analyst, your task is to classify each set of measurements
as a valid or invalid triangle.

===============================================================================
OBJECTIVE
===============================================================================

Return:

• x
• y
• z
• triangle

Where triangle contains:

• Yes
• No

===============================================================================
CONCEPTS TESTED
===============================================================================

✔ CASE Statement

✔ Conditional Logic

✔ Mathematical Conditions

✔ Comparison Operators

===============================================================================
SQL SOLUTION
===============================================================================
*/

SELECT

    x,

    y,

    z,

    CASE

        WHEN x + y > z

         AND x + z > y

         AND y + z > x

        THEN 'Yes'

        ELSE 'No'

    END AS triangle

FROM Triangle;

/*
===============================================================================
EXPLANATION
===============================================================================

A valid triangle satisfies all three conditions:

x + y > z

x + z > y

y + z > x

----------------------------------------------------------

If every condition is TRUE,

the triangle is valid.

Otherwise,

it is invalid.

===============================================================================
VISUAL REPRESENTATION
===============================================================================

Example 1

Sides

3

4

5

3 + 4 > 5 ✔

3 + 5 > 4 ✔

4 + 5 > 3 ✔

↓

Triangle

Yes

----------------------------------------------------------

Example 2

Sides

1

2

3

1 + 2 > 3 ✘

↓

Triangle

No

===============================================================================
EXPECTED OUTPUT
===============================================================================

+---+---+---+----------+
| x | y | z | triangle |
+---+---+---+----------+
| 3 | 4 | 5 | Yes      |
| 1 | 2 | 3 | No       |
+---+---+---+----------+

===============================================================================
WHY CASE?
===============================================================================

CASE evaluates logical conditions
and returns different values
based on the result.

It is commonly used for
business classifications.

===============================================================================
ALTERNATIVE SOLUTION
===============================================================================

SELECT

    *,

    IF

    (

        x + y > z

        AND x + z > y

        AND y + z > x,

        'Yes',

        'No'

    ) AS triangle

FROM Triangle;

This solution works in MySQL,
but CASE is ANSI SQL compliant
and portable across databases.

===============================================================================
TIME COMPLEXITY
===============================================================================

O(n)

One evaluation per row.

===============================================================================
SPACE COMPLEXITY
===============================================================================

O(1)

===============================================================================
INTERVIEW FOLLOW-UP QUESTIONS
===============================================================================

Q1. Why are three conditions required?

Because every side must be smaller
than the sum of the other two sides.

----------------------------------------------------------

Q2. Can CASE be replaced?

Yes.

MySQL supports IF(),
but CASE is standard SQL.

----------------------------------------------------------

Q3. What happens if one condition fails?

The triangle is invalid.

----------------------------------------------------------

Q4. Why use CASE in SQL?

To classify records
based on business rules.

===============================================================================
COMMON MISTAKES
===============================================================================

❌ Checking only one condition.

All three inequalities
must be satisfied.

----------------------------------------------------------

❌ Using >=

The triangle inequality
requires >

not

>=

----------------------------------------------------------

❌ Forgetting ELSE.

Always define a default result.

===============================================================================
REAL-WORLD APPLICATIONS
===============================================================================

• Manufacturing Quality Control

• Engineering Validation

• Construction Analytics

• Product Testing

• CAD Systems

• Scientific Data Analysis

===============================================================================
KEY TAKEAWAYS
===============================================================================

✔ CASE is used for conditional classification.

✔ Triangle validation requires three inequalities.

✔ CASE is ANSI SQL standard.

✔ Business rules can be implemented directly in SQL.

✔ Frequently asked SQL interview question involving CASE.

===============================================================================
*/
