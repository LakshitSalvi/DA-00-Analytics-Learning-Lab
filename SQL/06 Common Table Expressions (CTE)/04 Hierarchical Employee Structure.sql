/*
==============================================================================
QUESTION
==============================================================================

Retrieve the complete organizational hierarchy starting from the CEO using a
Recursive Common Table Expression (CTE).

*/

/*
==============================================================================
BUSINESS SCENARIO
==============================================================================

The HR department wants to visualize the organization's reporting structure.

Each employee reports to a manager, who may also report to another manager.
The company needs a hierarchical report showing every employee's reporting
level from the CEO down to the lowest level.

Your task is to generate the complete employee hierarchy.

*/

/*
==============================================================================
CONCEPTS COVERED
==============================================================================

- Recursive Common Table Expression (Recursive CTE)
- WITH RECURSIVE
- UNION ALL
- Self Join
- Hierarchical Queries
- Recursive Queries

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
manager_id
department

Sample Data
-----------

employee_id | employee_name | manager_id | department
------------------------------------------------------
1           | Alice         | NULL       | Executive
2           | Bob           | 1          | IT
3           | Charlie       | 1          | Finance
4           | David         | 2          | IT
5           | Emma          | 2          | IT
6           | Frank         | 3          | Finance
7           | Grace         | 4          | IT

*/

/*
==============================================================================
SQL SOLUTION
==============================================================================
*/

WITH RECURSIVE EmployeeHierarchy AS
(
    -- Anchor Member
    SELECT
        employee_id,
        employee_name,
        manager_id,
        department,
        1 AS hierarchy_level
    FROM Employees
    WHERE manager_id IS NULL

    UNION ALL

    -- Recursive Member
    SELECT
        e.employee_id,
        e.employee_name,
        e.manager_id,
        e.department,
        eh.hierarchy_level + 1
    FROM Employees AS e
    INNER JOIN EmployeeHierarchy AS eh
        ON e.manager_id = eh.employee_id
)

SELECT
    employee_id,
    employee_name,
    manager_id,
    department,
    hierarchy_level
FROM EmployeeHierarchy
ORDER BY
    hierarchy_level,
    employee_id;

/*
==============================================================================
EXPLANATION
==============================================================================

A Recursive CTE consists of two parts.

1. Anchor Member

The anchor query retrieves the root of the hierarchy (the CEO), whose
manager_id is NULL.

2. Recursive Member

The recursive query repeatedly joins Employees with the rows already produced
by the CTE.

Each execution retrieves the next reporting level until no additional
employees remain.

The recursion automatically terminates when no more child records are found.

*/

/*
==============================================================================
EXPECTED OUTPUT
==============================================================================

employee_id | employee_name | manager_id | department | hierarchy_level
-----------------------------------------------------------------------
1           | Alice         | NULL       | Executive  | 1
2           | Bob           | 1          | IT         | 2
3           | Charlie       | 1          | Finance    | 2
4           | David         | 2          | IT         | 3
5           | Emma          | 2          | IT         | 3
6           | Frank         | 3          | Finance    | 3
7           | Grace         | 4          | IT         | 4

*/

/*
==============================================================================
BEST PRACTICES
==============================================================================

✓ Always define a clear anchor member.

✓ Use UNION ALL instead of UNION for recursive CTEs.

✓ Ensure recursive joins eventually terminate.

✓ Keep recursion logic simple and readable.

✓ Test recursive queries with small datasets first.

*/

/*
==============================================================================
REAL-WORLD APPLICATIONS
==============================================================================

✓ Organizational Charts

✓ Employee Reporting Structures

✓ Bill of Materials (BOM)

✓ Folder & Directory Structures

✓ Category Hierarchies

✓ Family Trees

*/

/*
==============================================================================
RELATED CONCEPTS
==============================================================================

Previous:
→ Department Salary Analysis

Next:
→ Customer Retention Analysis
→ Recursive Queries
→ Graph Traversal
→ Tree Structures

*/
