/*
==============================================================================
QUESTION
==============================================================================

Assign grades to students based on their marks using the CASE statement.

*/

/*
==============================================================================
BUSINESS SCENARIO
==============================================================================

A university wants to automatically assign letter grades to students after
their final examination.

The grading criteria are:

• A : 90 and above
• B : 80 - 89
• C : 70 - 79
• D : 60 - 69
• F : Below 60

Your task is to display each student's marks along with their assigned grade.

*/

/*
==============================================================================
CONCEPTS COVERED
==============================================================================

- CASE Statement
- Multiple WHEN Conditions
- ELSE Clause
- Conditional Logic
- Data Classification

*/

/*
==============================================================================
ASSUMED TABLE
==============================================================================

Table Name : Students

Columns
--------
student_id
student_name
marks

Sample Data
-----------

student_id | student_name | marks
----------------------------------
101        | Rahul        | 95
102        | Priya        | 87
103        | Aman         | 74
104        | Neha         | 66
105        | Kavya        | 58
106        | Arjun        | 81

*/

/*
==============================================================================
SQL SOLUTION
==============================================================================
*/

SELECT
    student_id,
    student_name,
    marks,

    CASE
        WHEN marks >= 90 THEN 'A'
        WHEN marks >= 80 THEN 'B'
        WHEN marks >= 70 THEN 'C'
        WHEN marks >= 60 THEN 'D'
        ELSE 'F'
    END AS grade

FROM Students
ORDER BY marks DESC;

/*
==============================================================================
EXPLANATION
==============================================================================

The CASE statement evaluates each student's marks from top to bottom.

Step 1:

Students scoring 90 or above receive Grade A.

Step 2:

Students scoring between 80 and 89 receive Grade B.

Step 3:

Students scoring between 70 and 79 receive Grade C.

Step 4:

Students scoring between 60 and 69 receive Grade D.

Step 5:

Students scoring below 60 receive Grade F.

Since CASE stops after the first matching condition, checking the highest
grade first avoids unnecessary comparisons.

*/

/*
==============================================================================
EXPECTED OUTPUT
==============================================================================

student_id | student_name | marks | grade
------------------------------------------
101        | Rahul        | 95    | A
102        | Priya        | 87    | B
106        | Arjun        | 81    | B
103        | Aman         | 74    | C
104        | Neha         | 66    | D
105        | Kavya        | 58    | F

*/

/*
==============================================================================
BEST PRACTICES
==============================================================================

✓ Arrange conditions from highest marks to lowest.

✓ Avoid overlapping ranges.

✓ Always include an ELSE condition.

✓ Use descriptive aliases for calculated columns.

✓ Keep grading rules easy to modify.

*/

/*
==============================================================================
REAL-WORLD APPLICATIONS
==============================================================================

✓ School Management Systems

✓ University Result Portals

✓ Certification Platforms

✓ Employee Training Assessments

✓ Performance Evaluation Reports

*/

/*
==============================================================================
RELATED CONCEPTS
==============================================================================

Previous:
→ Categorize Customer Age Groups

Next:
→ Revenue by Customer Type
→ Conditional Aggregation
→ CASE with SUM()

*/
