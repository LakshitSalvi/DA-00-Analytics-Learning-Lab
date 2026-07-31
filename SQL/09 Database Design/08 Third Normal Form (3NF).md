# 📚 Third Normal Form (3NF)

## 📖 What is Third Normal Form (3NF)?

**Third Normal Form (3NF)** is the third step in the database normalization process.

A table is in **Third Normal Form (3NF)** if:

- It is already in **Second Normal Form (2NF)**.
- It contains **no Transitive Dependencies**.

In simple words:

> Every non-key column should depend **only on the Primary Key**, and **not on another non-key column**.

---

# 🎯 Why Do We Need 3NF?

Suppose an online retail company stores employee information.

---

## ❌ Before Applying 3NF

| EmployeeID | Employee Name | DepartmentID | Department Name |
|------------|---------------|--------------|-----------------|
| 101 | Rahul | D01 | Sales |
| 102 | Priya | D02 | HR |
| 103 | Aman | D01 | Sales |

Primary Key

```text
EmployeeID
```

---

# What's the Problem?

Let's examine the dependencies.

```text
EmployeeID

↓

DepartmentID

↓

Department Name
```

Notice that

```text
Department Name
```

does **not depend directly on EmployeeID**.

Instead,

it depends on

```text
DepartmentID
```

This is called a **Transitive Dependency**.

---

# What is Transitive Dependency?

A **Transitive Dependency** occurs when a **non-key attribute depends on another non-key attribute** instead of depending directly on the Primary Key.

Example

```text
EmployeeID

↓

DepartmentID

↓

Department Name
```

Department Name depends on DepartmentID,

not directly on EmployeeID.

This violates **Third Normal Form**.

---

# Solution

Separate department information into its own table.

---

## Employees

| EmployeeID | Employee Name | DepartmentID |
|------------|---------------|--------------|
| 101 | Rahul | D01 |
| 102 | Priya | D02 |
| 103 | Aman | D01 |

---

## Departments

| DepartmentID | Department Name |
|--------------|-----------------|
| D01 | Sales |
| D02 | HR |

Now

```text
Department Name
```

depends directly on

```text
DepartmentID
```

and not on

```text
EmployeeID
```

The database is now in **Third Normal Form**.

---

# SQL Example

## Departments

```sql
CREATE TABLE Departments (

    department_id VARCHAR(10) PRIMARY KEY,

    department_name VARCHAR(100)

);
```

---

## Employees

```sql
CREATE TABLE Employees (

    employee_id INT PRIMARY KEY,

    employee_name VARCHAR(100),

    department_id VARCHAR(10),

    FOREIGN KEY (department_id)

        REFERENCES Departments(department_id)

);
```

---

# Visual Representation

## Before 3NF

```text
Employees

┌─────────────────────────────────────────────┐
│ Employee │ DepartmentID │ Department Name   │
│---------------------------------------------│
│ Rahul    │ D01          │ Sales             │
│ Priya    │ D02          │ HR                │
│ Aman     │ D01          │ Sales             │
└─────────────────────────────────────────────┘

Department Name repeats.
```

---

## After 3NF

```text
Departments

┌────────────────────────────┐
│ DepartmentID │ Department  │
└────────────────────────────┘

Employees

┌────────────────────────────┐
│ EmployeeID │ DepartmentID  │
└────────────────────────────┘
```

Department information is stored only once.

---

# Another Example

## Customers

Bad Design

| CustomerID | CustomerName | CityID | CityName |
|------------|--------------|--------|----------|
| 101 | Rahul | C01 | Pune |
| 102 | Priya | C02 | Jaipur |
| 103 | Aman | C01 | Pune |

Problem

```text
CustomerID

↓

CityID

↓

CityName
```

CityName depends on CityID,

not CustomerID.

---

## Correct Design

### Customers

| CustomerID | Customer Name | CityID |
|------------|---------------|--------|
| 101 | Rahul | C01 |
| 102 | Priya | C02 |

---

### Cities

| CityID | City Name |
|--------|-----------|
| C01 | Pune |
| C02 | Jaipur |

---

# RetailHub Example

Suppose your RetailHub database contains

```text
Orders

OrderID

CustomerID

CustomerName

CustomerCity
```

Problems

- Customer Name repeats.
- Customer City repeats.
- Updating customer information requires changing many rows.

Correct Design

```text
Customers

↓

Orders
```

Orders should only store

```text
CustomerID
```

The customer details belong in the Customers table.

---

# Advantages

✅ Eliminates transitive dependencies.

---

✅ Reduces duplicate data.

---

✅ Prevents update anomalies.

---

✅ Improves consistency.

---

✅ Simplifies maintenance.

---

# Disadvantages

❌ More tables.

---

❌ More JOIN operations.

---

# Best Practices

✔ Apply 1NF before 2NF.

✔ Apply 2NF before 3NF.

✔ Store each business entity in its own table.

✔ Remove descriptive attributes that depend on other non-key columns.

✔ Use Foreign Keys to connect related tables.

---

# Common Mistakes

### ❌ Storing Department Name with Employees

Department information belongs in the Departments table.

---

### ❌ Storing City Name with Customers

City information belongs in the Cities table.

---

### ❌ Confusing 2NF with 3NF

2NF removes **Partial Dependencies**.

3NF removes **Transitive Dependencies**.

---

### ❌ Keeping Lookup Data Inside Transaction Tables

Store lookup information separately.

Examples

- Departments
- Cities
- Categories
- Countries
- Payment Methods

---

# Interview Questions

## Q1. What is Third Normal Form?

A table is in **3NF** if it is already in **2NF** and contains no Transitive Dependencies.

---

## Q2. What is Transitive Dependency?

A non-key column depending on another non-key column instead of directly on the Primary Key.

---

## Q3. How is 3NF achieved?

Move indirectly dependent attributes into separate tables and connect them using Foreign Keys.

---

## Q4. Give a real-world example.

Employee

```text
EmployeeID

↓

DepartmentID

↓

DepartmentName
```

DepartmentName should be moved to a Departments table.

---

## Q5. Why is 3NF important?

It reduces redundancy, prevents inconsistent updates, and improves database maintainability.

---

# Comparison of 1NF, 2NF and 3NF

| Normal Form | Removes | Main Goal |
|-------------|----------|-----------|
| **1NF** | Repeating Groups | One value per cell |
| **2NF** | Partial Dependencies | Every non-key column depends on the whole Primary Key |
| **3NF** | Transitive Dependencies | Every non-key column depends only on the Primary Key |

---

# Business Scenario

A multinational retail company has thousands of employees working across hundreds of departments.

If every employee record stores the department name, changing a department's name requires updating thousands of rows.

Instead, the company stores department information in a separate **Departments** table and references it using **DepartmentID**.

This approach reduces redundancy, prevents update anomalies, and keeps the database consistent.

---

# Summary

**Third Normal Form (3NF)** eliminates **Transitive Dependencies**, ensuring that every non-key attribute depends directly on the Primary Key.

By separating descriptive information into dedicated tables and linking them with Foreign Keys, databases become easier to maintain, more consistent, and less prone to anomalies.

Most production relational databases are designed to at least **Third Normal Form**, making it one of the most important concepts in database design.

---

## Key Takeaways

- A table must already satisfy **2NF**.
- Remove Transitive Dependencies.
- Non-key attributes should depend only on the Primary Key.
- Store lookup data in separate tables.
- Use Foreign Keys to maintain relationships.
- 3NF is the standard design goal for most relational databases.
