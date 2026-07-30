/*
==============================================================================
QUESTION
==============================================================================

Classify employees into salary bands using the CASE statement.

*/

/*
==============================================================================
BUSINESS SCENARIO
==============================================================================

The Human Resources department wants to classify employees into salary bands
to analyze payroll distribution and compensation planning.

Employees should be grouped into the following salary bands:

• Executive : Salary ≥ 100,000
• Senior : Salary between 70,000 and 99,999
• Mid-Level : Salary between 40,000 and 69,999
• Junior : Salary below 40,000

Your task is to display each employee along with their salary band.

*/

/*
==============================================================================
CONCEPTS COVERED
==============================================================================

- CASE Statement
- Multiple WHEN Conditions
- Conditional Classification
- ORDER BY
- Business Rule Implementation

*/

/*
==============================================================================
ASSUMED TABLE
==============================================================================

Table Name : Employees

Columns
--------
employee_id
employee_name
department
salary

Sample Data
-----------

employee_id | employee_name | department | salary
--------------------------------------------------
101         | Rahul         | IT         | 115000
102         | Priya         | Finance    | 82000
103         | Aman          | HR         | 65000
104         | Neha          | Sales      | 39000
105         | Kavya         | IT         | 98000
106         | Arjun         | Marketing  | 45000
107         | Sneha         | HR         | 28000

*/

/*
==============================================================================
SQL SOLUTION
==============================================================================
*/

SELECT
    employee_id,
    employee_name,
    department,
    salary,

    CASE
        WHEN salary >= 100000 THEN 'Executive'
        WHEN salary >= 70000 THEN 'Senior'
        WHEN salary >= 40000 THEN 'Mid-Level'
        ELSE 'Junior'
    END AS salary_band

FROM Employees
ORDER BY salary DESC;

/*
==============================================================================
EXPLANATION
==============================================================================

Step 1:

The CASE statement evaluates each employee's salary.

Step 2:

Employees earning 100,000 or more are classified as 'Executive'.

Step 3:

Employees earning between 70,000 and 99,999 are classified as 'Senior'.

Step 4:

Employees earning between 40,000 and 69,999 are classified as 'Mid-Level'.

Step 5:

Employees earning below 40,000 are classified as 'Junior'.

The first matching condition determines the employee's salary band.

*/

/*
==============================================================================
EXPECTED OUTPUT
==============================================================================

employee_id | employee_name | department | salary | salary_band
---------------------------------------------------------------
101         | Rahul         | IT         | 115000 | Executive
105         | Kavya         | IT         | 98000  | Senior
102         | Priya         | Finance    | 82000  | Senior
103         | Aman          | HR         | 65000  | Mid-Level
106         | Arjun         | Marketing  | 45000  | Mid-Level
104         | Neha          | Sales      | 39000  | Junior
107         | Sneha         | HR         | 28000  | Junior

*/

/*
==============================================================================
BEST PRACTICES
==============================================================================

✓ Order CASE conditions from highest salary to lowest.

✓ Avoid overlapping salary ranges.

✓ Always include an ELSE clause.

✓ Use meaningful business-friendly labels.

✓ Keep salary thresholds configurable for future updates.

*/

/*
==============================================================================
REAL-WORLD APPLICATIONS
==============================================================================

✓ Payroll Analysis

✓ HR Dashboards

✓ Compensation Planning

✓ Salary Benchmarking

✓ Workforce Analytics

*/

/*
==============================================================================
RELATED CONCEPTS
==============================================================================

Previous:
→ Revenue by Customer Type

Next:
→ Product Stock Status
→ CASE with COUNT()
→ CASE with AVG()

*/
