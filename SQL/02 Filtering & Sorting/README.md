# Filtering & Sorting

## Overview

Filtering and Sorting are fundamental SQL operations that allow Data Analysts to retrieve only the relevant records from a database and present them in a meaningful order.

In real-world business scenarios, datasets often contain thousands or even millions of records. Using filtering conditions and sorting techniques helps answer specific business questions efficiently.

---

## Learning Objectives

After completing this section, you will be able to:

- Filter records using `WHERE`
- Retrieve data based on multiple conditions
- Use comparison operators (`=`, `>`, `<`, `>=`, `<=`, `!=`)
- Filter data using `BETWEEN`
- Retrieve values using `IN` and `NOT IN`
- Search text using `LIKE`
- Handle `NULL` values using `IS NULL` and `IS NOT NULL`
- Sort records using `ORDER BY`
- Retrieve the top or latest records using `LIMIT`

---

## Contents

| No.| Topic                              |
|----|------------------------------------|
| 01 | Customers from New York            |
| 02 | Products Above ₹1000               |
| 03 | Employees in Sales Department      |
| 04 | Orders Between Two Dates           |
| 05 | Customers from Selected Cities     |
| 06 | Products Not in Electronics        |
| 07 | Customers Whose Name Starts with A |
| 08 | Products Ending with Pro           |
| 09 | Employees Without Manager          |
| 10 | Customers with Email Address       |
| 11 | Highest Paid Employees             |
| 12 | Latest Five Orders                 |

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
| phone       |
| city        |

---

### Products

| Column         |
|----------------|
| product_id     |
| product_name   |
| category       |
| price          |
| stock_quantity |

---

### Employees

| Column      |
|-------------|
| employee_id |
| first_name  |
| last_name   |
| department  |
| salary      |
| manager_id  |

---

### Orders

| Column       |
|--------------|
| order_id     |
| customer_id  |
| product_id   |
| order_date   |
| quantity     |
| total_amount |

---

## Prerequisites

Before starting this section, you should be familiar with:

- SELECT
- DISTINCT
- Aliases
- Basic SQL syntax

---

## Note

The examples in this section focus on retrieving specific subsets of data based on business requirements. Mastering filtering and sorting is essential before learning aggregate functions, joins, and advanced SQL concepts.

---

*This section will be updated as I progress through my Data Analytics learning journey.*
