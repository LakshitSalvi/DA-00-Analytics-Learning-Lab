/*
===============================================================================
                           LEETCODE 577
                           Employee Bonus
===============================================================================

Difficulty    : Easy
Topics        : LEFT JOIN, NULL Handling
Companies     : Amazon, Microsoft, Google, Meta, Deloitte

===============================================================================
QUESTION
===============================================================================

Table: Employee

+-------------+---------+
| Column Name | Type    |
+-------------+---------+
| empId       | int     |
| name        | varchar |
| supervisor  | int     |
| salary      | int     |
+-------------+---------+

empId is the primary key.

----------------------------------------------------------

Table: Bonus

+-------------+---------+
| Column Name | Type    |
+-------------+---------+
| empId       | int     |
| bonus       | int     |
+-------------+---------+

empId is unique.

Write a solution to report the name and bonus amount of each employee
with a bonus less than 1000.

Employees who do not have a bonus should also be included.

Return the result table in any order.

===============================================================================
BUSINESS SCENARIO
===============================================================================

The HR department wants to review employee bonuses before the annual
performance appraisal.

Employees receiving bonuses below ₹1000 or employees who have not
received any bonus should be identified for further evaluation.

As a Data Analyst, your task is to prepare this report.

===============================================================================
OBJECTIVE
===============================================================================

Return:

• Employee Name

• Bonus

Include employees who:

• Have bonus < 1000

OR

• Have no bonus assigned.

===============================================================================
CONCEPTS TESTED
===============================================================================

✔ LEFT JOIN

✔ NULL Handling

✔ OR Condition

✔ Filtering

===============================================================================
SQL SOLUTION
===============================================================================
*/

SELECT

    e.name,

    b.bonus

FROM Employee AS e

LEFT JOIN Bonus AS b

ON e.empId = b.empId

WHERE

    b.bonus < 1000

    OR b.bonus IS NULL;

/*
===============================================================================
EXPLANATION
===============================================================================

Step 1

Start with the Employee table.

Every employee should be considered.

----------------------------------------------------------

Step 2

LEFT JOIN the Bonus table.

Employees without bonuses will have NULL values.

----------------------------------------------------------

Step 3

Filter employees who:

• Bonus is less than 1000

OR

• Bonus is NULL

===============================================================================
VISUAL REPRESENTATION
===============================================================================

Employee

+-------+
| Alice |
| Bob   |
| Carol |
+-------+

Bonus

+-------+-------+
| Alice | 500   |
| Bob   | 1500  |
+-------+-------+

LEFT JOIN

Alice → 500

Bob → 1500

Carol → NULL

↓

Result

Alice

Carol

===============================================================================
EXPECTED OUTPUT
===============================================================================

+-------+-------+
| name  | bonus |
+-------+-------+
| Alice | 500   |
| Carol | NULL  |
+-------+-------+

===============================================================================
WHY LEFT JOIN?
===============================================================================

The question requires employees without bonus records
to appear in the result.

LEFT JOIN keeps every employee.

Missing bonus records become NULL.

===============================================================================
ALTERNATIVE SOLUTION
===============================================================================

SELECT

    e.name,

    b.bonus

FROM Employee e

LEFT JOIN Bonus b

USING(empId)

WHERE

    COALESCE(b.bonus,0) < 1000;

COALESCE() replaces NULL with 0,
allowing a single comparison.

===============================================================================
TIME COMPLEXITY
===============================================================================

O(n)

assuming empId is indexed.

===============================================================================
SPACE COMPLEXITY
===============================================================================

O(1)

===============================================================================
INTERVIEW FOLLOW-UP QUESTIONS
===============================================================================

Q1. Why use LEFT JOIN?

Because employees without bonus records
must also appear.

----------------------------------------------------------

Q2. Why check

bonus IS NULL?

Because NULL represents employees
who never received a bonus.

----------------------------------------------------------

Q3. Why not use INNER JOIN?

INNER JOIN removes employees
without matching bonus records.

----------------------------------------------------------

Q4. Can COALESCE() replace

bonus IS NULL?

Yes.

COALESCE(bonus,0)

treats NULL as zero.

===============================================================================
COMMON MISTAKES
===============================================================================

❌ Using INNER JOIN.

Employees without bonuses disappear.

----------------------------------------------------------

❌ Writing

bonus = NULL

Always use

IS NULL.

----------------------------------------------------------

❌ Forgetting the OR condition.

Both employees with small bonuses
and employees with no bonuses
must be included.

===============================================================================
REAL-WORLD APPLICATIONS
===============================================================================

• HR Payroll Reports

• Bonus Distribution Analysis

• Compensation Reviews

• Employee Performance Dashboards

• Annual Salary Audits

• HR Analytics

===============================================================================
KEY TAKEAWAYS
===============================================================================

✔ LEFT JOIN preserves all employees.

✔ NULL indicates missing bonus records.

✔ IS NULL is required for NULL comparisons.

✔ COALESCE() provides an alternative approach.

✔ Frequently asked SQL interview question.

===============================================================================
*/
