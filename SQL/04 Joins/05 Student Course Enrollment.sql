/*
==============================================================================
QUESTION
==============================================================================

Retrieve the list of students along with the courses they are enrolled in.

*/

/*
==============================================================================
BUSINESS SCENARIO
==============================================================================

A university wants to generate an enrollment report showing which students are
registered for which courses.

Since a student can enroll in multiple courses and a course can have multiple
students, a junction table is used to manage this many-to-many relationship.

Your task is to retrieve each student's enrolled courses.

*/

/*
==============================================================================
CONCEPTS COVERED
==============================================================================

- SELECT
- INNER JOIN
- Multiple Table Joins
- Many-to-Many Relationship
- Table Aliases

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
email

Sample Data
-----------

student_id | student_name | email
----------------------------------------------
101        | Rahul Sharma | rahul@email.com
102        | Priya Mehta  | priya@email.com
103        | Aman Verma   | aman@email.com


Table Name : Courses

Columns
--------
course_id
course_name
duration

Sample Data
-----------

course_id | course_name        | duration
------------------------------------------
C101      | SQL Fundamentals   | 6 Weeks
C102      | Python for Data    | 8 Weeks
C103      | Power BI           | 4 Weeks


Table Name : Enrollments

Columns
--------
student_id
course_id
enrollment_date

Sample Data
-----------

student_id | course_id | enrollment_date
-----------------------------------------
101        | C101      | 2026-01-10
101        | C102      | 2026-01-15
102        | C101      | 2026-01-12
102        | C103      | 2026-01-18
103        | C102      | 2026-01-20

*/

/*
==============================================================================
SQL SOLUTION
==============================================================================
*/

SELECT
    s.student_name,
    c.course_name,
    e.enrollment_date
FROM Students AS s
INNER JOIN Enrollments AS e
    ON s.student_id = e.student_id
INNER JOIN Courses AS c
    ON e.course_id = c.course_id;

/*
==============================================================================
EXPLANATION
==============================================================================

The Students table cannot be joined directly to the Courses table because they
have a many-to-many relationship.

The Enrollments table acts as a junction table that connects students and
courses.

The first INNER JOIN connects Students with Enrollments.

The second INNER JOIN connects Enrollments with Courses.

The result displays each student together with every course they have enrolled
in.

*/

/*
==============================================================================
EXPECTED OUTPUT
==============================================================================

student_name | course_name        | enrollment_date
---------------------------------------------------
Rahul Sharma | SQL Fundamentals   | 2026-01-10
Rahul Sharma | Python for Data    | 2026-01-15
Priya Mehta  | SQL Fundamentals   | 2026-01-12
Priya Mehta  | Power BI           | 2026-01-18
Aman Verma   | Python for Data    | 2026-01-20

*/

/*
==============================================================================
BEST PRACTICES
==============================================================================

✓ Use junction tables to represent many-to-many relationships.

✓ Join tables in the logical relationship order.

✓ Use meaningful table aliases for better readability.

✓ Select only the required columns instead of using SELECT *.

*/

/*
==============================================================================
REAL-WORLD APPLICATIONS
==============================================================================

✓ University Management Systems

✓ Learning Management Systems (LMS)

✓ Online Course Platforms

✓ Employee Training Portals

✓ Certification Management Systems

*/

/*
==============================================================================
RELATED CONCEPTS
==============================================================================

Previous:
→ Self Join
→ LEFT JOIN

Next:
→ Three-Table Joins
→ Sales Across Multiple Tables

*/
