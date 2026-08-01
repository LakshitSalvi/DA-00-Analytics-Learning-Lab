/*
===============================================================================
                           LEETCODE 615
                Average Salary: Departments VS Company
===============================================================================

Difficulty    : Hard
Topics        : CTE, GROUP BY, AVG(), JOIN, CASE
Companies     : Amazon, Google, Microsoft, Oracle, Deloitte

===============================================================================
QUESTION
===============================================================================

Table: Salary

+---------------+---------+
| Column Name   | Type    |
+---------------+---------+
| id            | int     |
| employee_id   | int     |
| amount        | int     |
| pay_date      | date    |
+---------------+---------+

id is the primary key.

----------------------------------------------------------

Table: Employee

+---------------+---------+
| Column Name   | Type    |
+---------------+---------+
| employee_id   | int     |
| department_id | int     |
+---------------+---------+

employee_id is the primary key.

Write a solution to compare each department's
average salary against the company's average salary
for every month.

Return:

• pay_month
• department_id
• comparison

comparison should be:

'higher'

'lower'

'same'

===============================================================================
BUSINESS SCENARIO
===============================================================================

A company's HR department wants to compare
department salaries against the company's overall average.

Each month, executives review whether departments are paying

Higher

Lower

or

the Same

compared to the company's average salary.

===============================================================================
OBJECTIVE
===============================================================================

Return

• Month

• Department

• Salary Comparison

===============================================================================
CONCEPTS TESTED
===============================================================================

✔ Common Table Expressions (CTEs)

✔ AVG()

✔ GROUP BY

✔ CASE

✔ JOIN

✔ DATE_FORMAT()

===============================================================================
SQL SOLUTION
===============================================================================
*/

WITH CompanyAverage AS
(
    SELECT

        DATE_FORMAT(pay_date,'%Y-%m') AS pay_month,

        AVG(amount) AS company_avg

    FROM Salary

    GROUP BY

        DATE_FORMAT(pay_date,'%Y-%m')
),

DepartmentAverage AS
(
    SELECT

        DATE_FORMAT(s.pay_date,'%Y-%m') AS pay_month,

        e.department_id,

        AVG(s.amount) AS department_avg

    FROM Salary s

    JOIN Employee e

    ON s.employee_id = e.employee_id

    GROUP BY

        DATE_FORMAT(s.pay_date,'%Y-%m'),

        e.department_id
)

SELECT

    d.pay_month,

    d.department_id,

    CASE

        WHEN d.department_avg > c.company_avg

        THEN 'higher'

        WHEN d.department_avg < c.company_avg

        THEN 'lower'

        ELSE 'same'

    END AS comparison

FROM DepartmentAverage d

JOIN CompanyAverage c

ON d.pay_month = c.pay_month

ORDER BY

    d.pay_month,

    d.department_id;

/*
===============================================================================
EXPLANATION
===============================================================================

Step 1

Calculate the company's
average salary
for each month.

----------------------------------------------------------

Step 2

Calculate each department's
average salary
for each month.

----------------------------------------------------------

Step 3

Join both results
using the month.

----------------------------------------------------------

Step 4

Compare

Department Average

with

Company Average.

----------------------------------------------------------

Step 5

Return

higher

lower

or

same.

===============================================================================
VISUAL REPRESENTATION
===============================================================================

January

Company Average

↓

5000

----------------------------------

Department A

↓

5500

↓

Higher

----------------------------------

Department B

↓

4700

↓

Lower

----------------------------------

Department C

↓

5000

↓

Same

===============================================================================
EXPECTED OUTPUT
===============================================================================

+-----------+---------------+------------+
| pay_month | department_id | comparison |
+-----------+---------------+------------+
|2020-01    | 1             | higher     |
|2020-01    | 2             | lower      |
|2020-01    | 3             | same       |
+-----------+---------------+------------+

===============================================================================
WHY TWO CTEs?
===============================================================================

One CTE computes

Company Average.

The second computes

Department Average.

Joining them makes
comparison straightforward.

===============================================================================
ALTERNATIVE SOLUTION
===============================================================================

Subqueries can replace the CTEs.

However,

CTEs improve readability
and simplify maintenance.

===============================================================================
TIME COMPLEXITY
===============================================================================

O(n)

Salary records are scanned once
for each aggregation.

===============================================================================
SPACE COMPLEXITY
===============================================================================

O(n)

For monthly aggregated results.

===============================================================================
INTERVIEW FOLLOW-UP QUESTIONS
===============================================================================

Q1. Why calculate the company average separately?

It serves as the benchmark
for every department.

----------------------------------------------------------

Q2. Why GROUP BY month?

Comparisons are required
for each month independently.

----------------------------------------------------------

Q3. Why use CASE?

To convert salary comparisons
into business-friendly labels.

----------------------------------------------------------

Q4. Can this compare teams instead
of departments?

Yes.

Replace

department_id

with

team_id

and keep the same logic.

===============================================================================
COMMON MISTAKES
===============================================================================

❌ Comparing department averages
against all-time company averages.

The comparison must be

month-wise.

----------------------------------------------------------

❌ Forgetting DATE_FORMAT().

Monthly grouping
would not occur.

----------------------------------------------------------

❌ Using WHERE instead of CASE.

CASE returns the required label.

===============================================================================
REAL-WORLD APPLICATIONS
===============================================================================

• HR Compensation Analytics

• Payroll Reporting

• Budget Planning

• Department Performance Dashboards

• Executive Salary Reviews

• Business Intelligence

===============================================================================
KEY TAKEAWAYS
===============================================================================

✔ CTEs simplify multi-stage calculations.

✔ AVG() computes business KPIs.

✔ CASE converts numeric comparisons
into readable business labels.

✔ Monthly benchmarking is common
in enterprise reporting.

✔ A classic SQL interview problem
combining multiple aggregations.

===============================================================================
*/
