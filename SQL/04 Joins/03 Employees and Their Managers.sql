/*
==============================================================================
QUESTION
==============================================================================

Retrieve each employee along with their manager's name.

*/

/*
==============================================================================
BUSINESS SCENARIO
==============================================================================

The Human Resources department wants to generate an organizational hierarchy
report showing each employee and their respective manager.

Since both employees and managers are stored in the same table, the table must
be joined with itself.

Your task is to retrieve every employee along with their manager's name.

*/

/*
==============================================================================
CONCEPTS COVERED
==============================================================================

- SELECT
- SELF JOIN
- LEFT JOIN
- ON
- Table Aliases
- Column Aliases (AS)

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
manager_id

Sample Data
-----------

employee_id | first_name | last_name | department | salary | manager_id
-------------------------------------------------------------------------
201         | Amit       | Sharma    | Management | 120000 | NULL
202         | Priya      | Kapoor    | Management | 115000 | NULL
203         | Rahul      | Mehta     | IT         | 70000  | 201
204         | Sneha      | Verma     | IT         | 68000  | 201
205         | Aman       | Singh     | HR         | 60000  | 202
206         | Neha       | Patel     | Finance    | 65000  | 202
207         | Rohan      | Joshi     | Sales      | 58000  | 201

*/

/*
==============================================================================
SQL SOLUTION
==============================================================================
*/

SELECT
    e.employee_id,
    CONCAT(e.first_name, ' ', e.last_name) AS employee_name,
    e.department,
    CONCAT(m.first_name, ' ', m.last_name) AS manager_name
FROM Employees AS e
LEFT JOIN Employees AS m
    ON e.manager_id = m.employee_id;

/*
==============================================================================
EXPLANATION
==============================================================================

A Self Join joins a table with itself.

In this query:

- The first instance of the Employees table (e) represents employees.
- The second instance (m) represents managers.

The LEFT JOIN matches each employee's manager_id with the manager's
employee_id.

Employees without managers (such as top-level executives) will display NULL
for the manager's name.

*/

/*
==============================================================================
EXPECTED OUTPUT
==============================================================================

employee_id | employee_name | department | manager_name
--------------------------------------------------------
201         | Amit Sharma   | Management | NULL
202         | Priya Kapoor  | Management | NULL
203         | Rahul Mehta   | IT         | Amit Sharma
204         | Sneha Verma   | IT         | Amit Sharma
205         | Aman Singh    | HR         | Priya Kapoor
206         | Neha Patel    | Finance    | Priya Kapoor
207         | Rohan Joshi   | Sales      | Amit Sharma

*/

/*
==============================================================================
BEST PRACTICES
==============================================================================

✓ Use meaningful table aliases when joining a table with itself.

✓ Prefer LEFT JOIN so employees without managers are still included.

✓ Clearly distinguish employee and manager columns using aliases.

*/

/*
==============================================================================
REAL-WORLD APPLICATIONS
==============================================================================

✓ Organization Hierarchy Reports

✓ Employee-Manager Relationships

✓ HR Analytics

✓ Organizational Charts

✓ Corporate Directory Systems

*/

/*
==============================================================================
RELATED CONCEPTS
==============================================================================

Previous:
→ LEFT JOIN

Next:
→ LEFT JOIN with Multiple Tables
→ RIGHT JOIN
→ FULL OUTER JOIN

*/
