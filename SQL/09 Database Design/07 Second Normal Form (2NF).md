# 📚 Second Normal Form (2NF)

## 📖 What is Second Normal Form (2NF)?

**Second Normal Form (2NF)** is the second step in the database normalization process.

A table is in **Second Normal Form (2NF)** if:

- It is already in **First Normal Form (1NF)**.
- Every non-key column depends on the **entire Primary Key**, not just part of it.

In simple words:

> Every piece of information should depend on the whole Primary Key.

---

# 🎯 Why Do We Need 2NF?

Suppose a university stores student course enrollments.

A student can enroll in multiple courses.

The table uses a **Composite Primary Key**:

```text
(StudentID, CourseID)
```

---

## ❌ Before Applying 2NF

| StudentID | CourseID | StudentName | CourseName | Instructor |
|------------|----------|-------------|------------|------------|
| 101 | C101 | Rahul | SQL | John |
| 101 | C102 | Rahul | Python | Sarah |
| 102 | C101 | Priya | SQL | John |

Primary Key

```text
(StudentID, CourseID)
```

---

# What's the Problem?

Let's analyze the dependencies.

```text
StudentName

depends only on

StudentID
```

---

```text
CourseName

depends only on

CourseID
```

---

```text
Instructor

depends only on

CourseID
```

None of these depend on the **entire Composite Primary Key**.

These are called **Partial Dependencies**.

This violates **Second Normal Form**.

---

# What is Partial Dependency?

A **Partial Dependency** occurs when a column depends on **only part of a Composite Primary Key**.

Example

```text
(StudentID, CourseID)

↓

StudentName

depends only on

StudentID
```

Not on both columns.

---

# Solution

Split the table into multiple related tables.

---

## Students

| StudentID | Student Name |
|------------|--------------|
| 101 | Rahul |
| 102 | Priya |

---

## Courses

| CourseID | Course Name | Instructor |
|----------|-------------|------------|
| C101 | SQL | John |
| C102 | Python | Sarah |

---

## Student_Courses

| StudentID | CourseID |
|------------|----------|
| 101 | C101 |
| 101 | C102 |
| 102 | C101 |

Now,

each table stores information about **one business entity**.

There are no partial dependencies.

The database is now in **Second Normal Form**.

---

# SQL Example

## Students

```sql
CREATE TABLE Students (

    student_id INT PRIMARY KEY,

    student_name VARCHAR(100)

);
```

---

## Courses

```sql
CREATE TABLE Courses (

    course_id VARCHAR(10) PRIMARY KEY,

    course_name VARCHAR(100),

    instructor VARCHAR(100)

);
```

---

## Student_Courses

```sql
CREATE TABLE Student_Courses (

    student_id INT,

    course_id VARCHAR(10),

    PRIMARY KEY (student_id, course_id),

    FOREIGN KEY (student_id)

        REFERENCES Students(student_id),

    FOREIGN KEY (course_id)

        REFERENCES Courses(course_id)

);
```

---

# Visual Representation

## Before 2NF

```text
Student_Courses

┌─────────────────────────────────────────────┐
│ StudentID │ CourseID │ Student │ Course     │
│---------------------------------------------│
│ 101       │ C101     │ Rahul   │ SQL        │
│ 101       │ C102     │ Rahul   │ Python     │
│ 102       │ C101     │ Priya   │ SQL        │
└─────────────────────────────────────────────┘

Student Name repeats.

Course Name repeats.
```

---

## After 2NF

```text
Students

┌──────────────────────────┐
│ StudentID │ StudentName  │
└──────────────────────────┘

Courses

┌──────────────────────────┐
│ CourseID │ CourseName    │
└──────────────────────────┘

Student_Courses

┌──────────────────────────┐
│ StudentID │ CourseID     │
└──────────────────────────┘
```

No repeated descriptive information.

---

# Business Scenario

An online shopping platform stores orders.

Bad Design

| OrderID | ProductID | ProductName | ProductPrice |
|----------|-----------|-------------|--------------|

If the same product appears in thousands of orders,

its name and price are repeated thousands of times.

Instead,

store product details separately.

```text
Products

↓

Order_Items
```

Now,

ProductName depends only on ProductID,

not on

```text
(OrderID, ProductID)
```

---

# Advantages

✅ Eliminates partial dependencies.

---

✅ Reduces duplicate data.

---

✅ Simplifies updates.

---

✅ Improves consistency.

---

✅ Makes the database easier to maintain.

---

# Disadvantages

❌ Requires additional tables.

---

❌ Queries require JOIN operations.

---

# Best Practices

✔ Apply 1NF before 2NF.

✔ Use Composite Primary Keys only when necessary.

✔ Move descriptive information into separate tables.

✔ Store each business entity in its own table.

✔ Use Foreign Keys to maintain relationships.

---

# Common Mistakes

### ❌ Confusing 1NF and 2NF

1NF removes repeating groups.

2NF removes partial dependencies.

---

### ❌ Keeping Product Details in Order_Items

Product information belongs in the Products table.

---

### ❌ Ignoring Composite Keys

Partial dependency only exists when a Composite Primary Key is involved.

---

### ❌ Repeating Customer Information

Customer details should not be repeated in every order.

---

# Interview Questions

## Q1. What is Second Normal Form?

A table is in **2NF** if it is already in **1NF** and every non-key column depends on the **entire Primary Key**.

---

## Q2. What is Partial Dependency?

When a non-key column depends on only part of a Composite Primary Key.

---

## Q3. Does every table need 2NF?

Every table should satisfy 2NF.

However, tables with a single-column Primary Key automatically satisfy the partial dependency requirement.

---

## Q4. Can Partial Dependency exist without a Composite Primary Key?

No.

Partial dependency only occurs when the Primary Key consists of multiple columns.

---

## Q5. Give a real-world example.

Order Items

```text
(OrderID, ProductID)

↓

ProductName

depends only on

ProductID
```

This violates 2NF.

---

# Summary

**Second Normal Form (2NF)** builds upon **1NF** by removing **Partial Dependencies**.

Every non-key attribute should depend on the **entire Primary Key**, ensuring that each table represents a single business entity.

Applying 2NF reduces data duplication, simplifies maintenance, and improves database consistency.

---

## Key Takeaways

- A table must already be in **1NF**.
- Remove Partial Dependencies.
- Every non-key column must depend on the whole Primary Key.
- Partial Dependency occurs only with Composite Primary Keys.
- Split large tables into smaller related tables.
- Use Foreign Keys to connect the new tables.
