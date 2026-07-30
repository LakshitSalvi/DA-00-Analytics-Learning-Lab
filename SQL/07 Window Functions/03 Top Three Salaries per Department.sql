/*
==============================================================================
QUESTION
==============================================================================

Retrieve the top three highest-paid employees from each department using
window functions.

*/

/*
==============================================================================
BUSINESS SCENARIO
==============================================================================

The Human Resources department wants to identify the top three highest-paid
employees within each department for compensation reviews and executive
reporting.

Instead of ranking employees across the entire company, rankings should restart
for every department.

Your task is to retrieve the top three highest-paid employees from each
department.

*/

/*
==============================================================================
CONCEPTS COVERED
==============================================================================

- Window Functions
- DENSE_RANK()
- PARTITION BY
- ORDER BY
- Common Table Expression (CTE)
- Filtering Window Function Results

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
101         | Rahul      | Sharma    | IT         | 98000
102         | Priya      | Kapoor    | IT         | 90000
103         | Aman       | Verma     | IT         | 85000
104         | Neha       | Singh     | IT         | 78000
105         | Rohan      | Patel     | Finance    | 105000
106         | Kavya      | Iyer      | Finance    | 97000
107         | Arjun      | Mehta     | Finance    | 97000
108         | Sneha      | Gupta     | Finance    | 85000
109         | Mohit      | Jain      | HR         | 72000
110         | Pooja      | Shah      | HR         | 68000
111         | Ankit      | Joshi     | HR         | 62000

*/

/*
==============================================================================
SQL SOLUTION
==============================================================================
*/

WITH EmployeeRanking AS
(
    SELECT
        employee_id,
        first_name,
        last_name,
        department,
        salary,

        DENSE_RANK() OVER
        (
            PARTITION BY department
            ORDER BY salary DESC
        ) AS salary_rank

    FROM Employees
)

SELECT
    employee_id,
    first_name,
    last_name,
    department,
    salary,
    salary_rank
FROM EmployeeRanking
WHERE salary_rank <= 3
ORDER BY
    department,
    salary_rank,
    salary DESC;

/*
==============================================================================
EXPLANATION
==============================================================================

Step 1:

The CTE assigns a salary rank within each department.

PARTITION BY department divides the data into separate groups before applying
the ranking function.

Each department starts ranking from 1 independently.

Step 2:

The outer query filters only employees whose rank is 3 or less.

Because DENSE_RANK() is used, employees with the same salary receive the same
rank without gaps.

If multiple employees tie for third place, all are included.

*/

/*
==============================================================================
EXPECTED OUTPUT
==============================================================================

employee_id | first_name | department | salary | salary_rank
-------------------------------------------------------------
105         | Rohan      | Finance    | 105000 | 1
106         | Kavya      | Finance    | 97000  | 2
107         | Arjun      | Finance    | 97000  | 2
108         | Sneha      | Finance    | 85000  | 3

109         | Mohit      | HR         | 72000  | 1
110         | Pooja      | HR         | 68000  | 2
111         | Ankit      | HR         | 62000  | 3

101         | Rahul      | IT         | 98000  | 1
102         | Priya      | IT         | 90000  | 2
103         | Aman       | IT         | 85000  | 3

*/

/*
==============================================================================
BEST PRACTICES
==============================================================================

✓ Use PARTITION BY to perform calculations within groups.

✓ Use DENSE_RANK() when tied values should share the same rank.

✓ Use a CTE to separate ranking logic from filtering logic.

✓ Apply filters after the ranking has been calculated.

✓ Order the final result for easy reporting.

*/

/*
==============================================================================
REAL-WORLD APPLICATIONS
==============================================================================

✓ Department Leaderboards

✓ Compensation Reviews

✓ Top Performer Reports

✓ HR Analytics

✓ Executive Dashboards

*/

/*
==============================================================================
RELATED CONCEPTS
==============================================================================

Previous:
→ Dense Rank Products

Next:
→ Divide Customers into Quartiles
→ NTILE()
→ LAG()
→ LEAD()

*/
