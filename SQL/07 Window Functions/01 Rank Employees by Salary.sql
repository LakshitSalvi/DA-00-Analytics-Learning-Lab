/*
==============================================================================
QUESTION
==============================================================================

Rank employees based on their salary using different SQL ranking functions.

*/

/*
==============================================================================
BUSINESS SCENARIO
==============================================================================

The Human Resources department wants to prepare a company-wide salary ranking
report.

Management would like to understand how employees rank based on salary while
also seeing how different SQL ranking functions behave when duplicate salaries
exist.

Your task is to rank employees using:

- ROW_NUMBER()
- RANK()
- DENSE_RANK()

*/

/*
==============================================================================
CONCEPTS COVERED
==============================================================================

- Window Functions
- ROW_NUMBER()
- RANK()
- DENSE_RANK()
- OVER()
- ORDER BY

*/

/*
==============================================================================
ASSUMED TABLE
==============================================================================

Table Name : Employees

Columns
--------
employee_id
first_name
last_name
department
salary

Sample Data
-----------

employee_id | first_name | last_name | department | salary
------------------------------------------------------------
101         | Rahul      | Sharma    | IT         | 95000
102         | Priya      | Kapoor    | HR         | 80000
103         | Aman       | Verma     | Finance    | 95000
104         | Neha       | Singh     | Marketing  | 70000
105         | Rohan      | Patel     | IT         | 85000
106         | Kavya      | Iyer      | Finance    | 80000

*/

/*
==============================================================================
SQL SOLUTION
==============================================================================
*/

SELECT
    employee_id,
    first_name,
    last_name,
    department,
    salary,

    ROW_NUMBER() OVER
    (
        ORDER BY salary DESC
    ) AS row_number,

    RANK() OVER
    (
        ORDER BY salary DESC
    ) AS salary_rank,

    DENSE_RANK() OVER
    (
        ORDER BY salary DESC
    ) AS dense_salary_rank

FROM Employees
ORDER BY salary DESC;

/*
==============================================================================
EXPLANATION
==============================================================================

Window Functions perform calculations across a set of rows without collapsing
the result like GROUP BY.

ROW_NUMBER()

• Assigns a unique sequential number to every row.
• Duplicate salary values receive different numbers.

RANK()

• Employees with the same salary receive the same rank.
• The next rank is skipped.

Example:

1
1
3
4

DENSE_RANK()

• Employees with the same salary receive the same rank.
• No ranks are skipped.

Example:

1
1
2
3

*/

/*
==============================================================================
EXPECTED OUTPUT
==============================================================================

employee_id | employee_name | salary | row_number | salary_rank | dense_salary_rank
------------------------------------------------------------------------------------
101         | Rahul         | 95000  | 1          | 1           | 1
103         | Aman          | 95000  | 2          | 1           | 1
105         | Rohan         | 85000  | 3          | 3           | 2
102         | Priya         | 80000  | 4          | 4           | 3
106         | Kavya         | 80000  | 5          | 4           | 3
104         | Neha          | 70000  | 6          | 6           | 4

*/

/*
==============================================================================
BEST PRACTICES
==============================================================================

✓ Choose ROW_NUMBER() when every row needs a unique sequence.

✓ Use RANK() when ranking should preserve gaps after ties.

✓ Use DENSE_RANK() when consecutive rankings are preferred.

✓ Always specify ORDER BY inside OVER().

✓ Use descriptive aliases for ranking columns.

*/

/*
==============================================================================
REAL-WORLD APPLICATIONS
==============================================================================

✓ Employee Salary Reports

✓ Sales Leaderboards

✓ Student Rankings

✓ Product Performance Rankings

✓ Business Intelligence Dashboards

*/

/*
==============================================================================
RELATED CONCEPTS
==============================================================================

Previous:
→ Common Table Expressions (CTEs)

Next:
→ Dense Rank Products
→ NTILE()
→ LAG()
→ LEAD()

*/
