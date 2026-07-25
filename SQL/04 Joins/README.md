# Joins

## Overview

Joins are used to combine data from two or more related tables based on a common column. Since real-world databases are typically normalized, information is distributed across multiple tables. Joins enable Data Analysts to retrieve meaningful insights by connecting related datasets.

This section covers the most commonly used SQL joins through practical business scenarios that simulate real-world analytical tasks.

---

## Learning Objectives

After completing this section, you will be able to:

- Understand relationships between database tables
- Combine data using `INNER JOIN`
- Retrieve unmatched records using `LEFT JOIN`
- Understand the purpose of `RIGHT JOIN`
- Work with `FULL OUTER JOIN` (where supported)
- Use `SELF JOIN` to compare rows within the same table
- Analyze business data across multiple related tables
- Build comprehensive reports using joins

---

## Contents

| No.| Topic                        |
|----|------------------------------|
| 01 | Customer Orders              |
| 02 | Customers Without Orders     |
| 03 | Employees and Their Managers |
| 04 | Products Never Ordered       |
| 05 | Student Course Enrollment    |
| 06 | Supplier Product List        |
| 07 | Sales Across Multiple Tables |
| 08 | Customer Purchase Report     |

---

## Assumed Database Structure

The practice questions in this section use the following sample tables.

### Customers

| Column      |
|-------------|
| customer_id |
| first_name  |
| last_name   |
| email       |
| city        |

---

### Orders

| Column       |
|--------------|
| order_id     |
| customer_id  |
| order_date   |
| total_amount |

---

### Order_Details

| Column          |
|-----------------|
| order_detail_id |
| order_id        |
| product_id      |
| quantity        |
| unit_price      |

---

### Products

| Column       |
|--------------|
| product_id   |
| product_name |
| category     |
| supplier_id  |
| price        |

---

### Suppliers

| Column        |
|---------------|
| supplier_id   |
| supplier_name |
| city          |

---

### Employees

| Column      |
|-------------|
| employee_id |
| first_name  |
| last_name   |
| manager_id  |
| department  |
| salary      |

---

### Students

| Column       |
|--------------|
| student_id   |
| student_name |

---

### Courses

| Column      |
|-------------|
| course_id   |
| course_name |

---

### Enrollments

| Column        |
|---------------|
| enrollment_id |
| student_id    |
| course_id     |

---

## SQL Concepts Covered

| Concept           | Description                                                                        |
|-------------------|------------------------------------------------------------------------------------|
| `INNER JOIN`      | Returns matching records from both tables                                          |
| `LEFT JOIN`       | Returns all records from the left table and matching records from the right table  |
| `RIGHT JOIN`      | Returns all records from the right table and matching records from the left table  |
| `FULL OUTER JOIN` | Returns all matching and non-matching records from both tables *(where supported)* |
| `SELF JOIN`       | Joins a table with itself                                                          |
| Multiple Joins    | Combines data from more than two tables                                            |

---

## Prerequisites

Before starting this section, you should be familiar with:

- SQL Fundamentals
- Filtering & Sorting
- Aggregate Functions
- Primary Keys
- Foreign Keys

---

## Note

Joins are among the most frequently used SQL operations in Data Analytics. Business data is rarely stored in a single table, making joins essential for creating reports, dashboards, and analytical queries.

---

*This section will be updated as I progress through my Data Analytics learning journey.*
