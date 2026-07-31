# 📚 First Normal Form (1NF)

## 📖 What is First Normal Form (1NF)?

**First Normal Form (1NF)** is the first step in the database normalization process.

A table is said to be in **First Normal Form** if:

- Every column contains **atomic (single) values**.
- Each row is unique.
- There are **no repeating groups** or multiple values stored in a single column.

In simple words:

> One cell should contain **only one value**.

---

# 🎯 Why Do We Need 1NF?

Suppose you're designing a database for an online learning platform.

A student can enroll in multiple courses.

A beginner might design the table like this.

---

## ❌ Before 1NF

| StudentID | Student Name | Courses |
|------------|--------------|-------------------------|
| 101 | Rahul | SQL, Python, Excel |
| 102 | Priya | SQL |
| 103 | Aman | Java, C++, Python |

Problem:

The **Courses** column contains multiple values.

This makes searching and updating data very difficult.

---

# Problems with This Design

Imagine finding all students studying SQL.

The database must search inside text like

```text
SQL, Python, Excel
```

instead of comparing a single value.

Other issues include:

- Difficult searching
- Difficult sorting
- Difficult filtering
- Difficult updates
- Duplicate information

---

# ✅ After Applying 1NF

### Students

| StudentID | Student Name |
|------------|--------------|
| 101 | Rahul |
| 102 | Priya |
| 103 | Aman |

---

### Student_Courses

| StudentID | Course |
|------------|----------|
| 101 | SQL |
| 101 | Python |
| 101 | Excel |
| 102 | SQL |
| 103 | Java |
| 103 | C++ |
| 103 | Python |

Now,

every row contains **exactly one course**.

Every cell stores **only one value**.

The table is now in **First Normal Form**.

---

# Rules of First Normal Form

A table satisfies **1NF** when:

✔ Every column contains atomic values.

✔ No repeating groups exist.

✔ Every row is unique.

✔ Every record can be uniquely identified using a Primary Key.

---

# Atomic Values

Atomic means **indivisible**.

Good Example

| CustomerID | City |
|------------|------|
| 101 | Pune |
| 102 | Jaipur |

Each cell contains one value.

---

Bad Example

| CustomerID | City |
|------------|------------------|
| 101 | Pune, Mumbai |

The City column stores two values.

This violates **1NF**.

---

# SQL Example

## ❌ Bad Design

```sql
CREATE TABLE Students (

    student_id INT,

    student_name VARCHAR(100),

    courses VARCHAR(255)

);
```

Possible data

```text
SQL, Python, Excel
```

---

## ✅ Good Design

```sql
CREATE TABLE Students (

    student_id INT PRIMARY KEY,

    student_name VARCHAR(100)

);
```

```sql
CREATE TABLE Student_Courses (

    student_id INT,

    course_name VARCHAR(100),

    FOREIGN KEY (student_id)

        REFERENCES Students(student_id)

);
```

---

# Another Example

## ❌ Customers

| CustomerID | Phone Numbers |
|------------|-----------------------------|
| 101 | 9876543210, 8765432109 |

---

## ✅ Customer_Phones

| CustomerID | Phone Number |
|------------|--------------|
| 101 | 9876543210 |
| 101 | 8765432109 |

Now every row contains one phone number.

---

# Business Scenario

An e-commerce company stores customer addresses.

Bad Design

| CustomerID | Addresses |
|------------|--------------------------------------|
| 101 | Pune, Mumbai, Jaipur |

Instead,

create

```text
Customer_Addresses
```

where every address is stored separately.

This allows customers to have multiple addresses while keeping the database normalized.

---

# Advantages

✅ Eliminates repeating groups.

---

✅ Makes searching easier.

---

✅ Simplifies filtering.

---

✅ Improves indexing.

---

✅ Makes JOIN operations possible.

---

# Disadvantages

❌ More tables may be required.

---

❌ Queries often require JOIN operations.

---

# Best Practices

✔ Store only one value per column.

✔ Use separate tables for multiple values.

✔ Always define a Primary Key.

✔ Avoid comma-separated lists.

✔ Design tables around business entities.

---

# Common Mistakes

### ❌ Multiple Phone Numbers

```text
9876543210,8765432109
```

---

### ❌ Multiple Skills

```text
Java, Python, SQL
```

---

### ❌ Multiple Cities

```text
Delhi, Mumbai
```

---

### ❌ Multiple Products

```text
Laptop, Mouse, Keyboard
```

All of these violate **First Normal Form**.

---

# Interview Questions

## Q1. What is First Normal Form?

A table is in **1NF** if every column contains atomic values and there are no repeating groups.

---

## Q2. What are atomic values?

Values that cannot be divided into smaller meaningful parts.

---

## Q3. Does 1NF remove duplicate rows?

No.

It removes repeating groups and ensures atomic values.

Duplicate data is addressed further during normalization.

---

## Q4. Is a Primary Key required?

Yes.

Each row should be uniquely identifiable.

---

## Q5. Give examples of violating 1NF.

- Multiple phone numbers in one cell
- Multiple courses in one cell
- Multiple email addresses in one column
- Comma-separated product lists

---

# Visual Representation

## Before 1NF

```text
Students

┌─────────────────────────────────────┐
│ Rahul │ SQL, Python, Excel          │
│ Priya │ SQL                         │
└─────────────────────────────────────┘
```

---

## After 1NF

```text
Students

┌──────────────────────────┐
│ Rahul                    │
│ Priya                    │
└──────────────────────────┘

            │

            ▼

Student_Courses

┌──────────────────────────┐
│ Rahul │ SQL              │
│ Rahul │ Python           │
│ Rahul │ Excel            │
│ Priya │ SQL              │
└──────────────────────────┘
```

---

# Summary

**First Normal Form (1NF)** is the foundation of database normalization.

It requires every column to store a single value, eliminates repeating groups, and ensures that each row is uniquely identifiable.

By following 1NF, databases become easier to query, update, and maintain while reducing the risk of inconsistent data.

---

## Key Takeaways

- One cell = One value.
- Remove repeating groups.
- Avoid comma-separated values.
- Use additional tables when necessary.
- Define a Primary Key.
- 1NF is the first step toward a well-designed relational database.
