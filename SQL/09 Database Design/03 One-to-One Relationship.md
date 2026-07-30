# 🔗 One-to-One Relationship (1:1)

## 📖 What is a One-to-One Relationship?

A **One-to-One (1:1) Relationship** is a relationship where **one record in the first table is associated with exactly one record in the second table**, and vice versa.

In simple words:

> One parent record can have only one matching child record.

---

# 🎯 Why Do We Need One-to-One Relationships?

Sometimes all information about an entity shouldn't be stored in a single table.

Reasons include:

- Security
- Better organization
- Optional information
- Performance
- Easier maintenance

Instead of storing everything together, we split the data into two related tables.

---

# Real-World Example

Consider an employee management system.

Every employee has one ID card.

Every ID card belongs to only one employee.

Relationship:

```text
One Employee
      │
      │
      ▼
One ID Card
```

---

# Visual Representation

```text
Employees

┌───────────────────────────┐
│ 🔑 EmployeeID             │
│ Name                      │
│ Department                │
└───────────────────────────┘
            │
            │ 1
            │
            │
            │ 1
            ▼
┌───────────────────────────┐
│ 🔑 CardID                 │
│ 🔗 EmployeeID             │
│ CardNumber                │
│ IssueDate                 │
└───────────────────────────┘

Employee → One Card

Card → One Employee
```

---

# SQL Example

### Employees

```sql
CREATE TABLE Employees (

    employee_id INT PRIMARY KEY,

    employee_name VARCHAR(100),

    department VARCHAR(50)

);
```

---

### Employee_ID_Cards

```sql
CREATE TABLE Employee_ID_Cards (

    card_id INT PRIMARY KEY,

    employee_id INT UNIQUE,

    card_number VARCHAR(20),

    issue_date DATE,

    FOREIGN KEY (employee_id)

        REFERENCES Employees(employee_id)

);
```

Notice

```text
UNIQUE(employee_id)
```

This makes sure that one employee cannot have multiple ID cards.

---

# Sample Data

### Employees

| EmployeeID | Name | Department |
|------------|------|------------|
| 101 | Rahul | IT |
| 102 | Priya | HR |
| 103 | Aman | Sales |

---

### Employee_ID_Cards

| CardID | EmployeeID | Card Number |
|--------|------------|-------------|
| 1 | 101 | EMP1001 |
| 2 | 102 | EMP1002 |
| 3 | 103 | EMP1003 |

Each employee has exactly one ID card.

---

# Another Example

### Users & User Profiles

```text
Users

UserID

↓

UserProfile

UserID
```

A website stores:

Users Table

- Username
- Email
- Password

Profile Table

- Bio
- Profile Picture
- Website
- Social Links

One user has one profile.

One profile belongs to one user.

---

# Banking Example

```text
Customer

↓

Locker
```

Each customer can own only one locker.

Each locker belongs to one customer.

---

# Passport Example

```text
Citizen

↓

Passport
```

One citizen has one passport.

One passport belongs to one citizen.

---

# Why Split the Tables?

Suppose Employees table contains

- Name
- Department
- Salary
- Passport Number
- Passport Issue Date
- Passport Expiry Date
- Passport Scan

Not every employee has a passport.

Those columns become

```text
NULL
NULL
NULL
NULL
```

Instead,

store passport information separately.

This keeps the database clean.

---

# Advantages

✅ Better security

Sensitive information stays in another table.

---

✅ Reduces NULL values

Only employees with passports have passport records.

---

✅ Easier maintenance

Updating passport information doesn't affect employee data.

---

✅ Better organization

Each table stores one type of information.

---

# Disadvantages

❌ Requires JOIN operations.

❌ More tables to manage.

❌ Slightly more complex queries.

---

# Best Practices

✔ Use the same Primary Key or a UNIQUE Foreign Key.

✔ Split optional information into another table.

✔ Store confidential data separately.

✔ Name tables clearly.

✔ Avoid unnecessary One-to-One relationships.

---

# Common Mistakes

### ❌ Forgetting UNIQUE

Without

```sql
UNIQUE(employee_id)
```

one employee could receive multiple ID cards.

That becomes a One-to-Many relationship.

---

### ❌ Storing Everything Together

Large tables become difficult to manage.

---

### ❌ Using One-to-One When Not Needed

Don't split tables unless there is a valid business reason.

---

# Interview Questions

## Q1. What is a One-to-One Relationship?

A relationship where one record matches exactly one record in another table.

---

## Q2. How is it implemented?

Using

- Primary Key
- Foreign Key
- UNIQUE constraint

---

## Q3. Give real-world examples.

- Employee → ID Card
- User → Profile
- Citizen → Passport
- Patient → Medical Record
- Customer → Locker

---

## Q4. How is One-to-One different from One-to-Many?

| One-to-One | One-to-Many |
|------------|-------------|
| One employee → One ID card | One customer → Many orders |
| Uses UNIQUE FK | FK allows duplicates |

---

# Business Scenario

An HR system stores employee details.

Sensitive information such as

- PAN Card
- Passport
- Aadhaar
- Driving License

is stored separately.

Only HR managers have access to that table.

This improves

- Security
- Privacy
- Database organization

---

# Summary

A One-to-One relationship is used when a single record in one table corresponds to exactly one record in another table.

It is commonly used to separate optional or sensitive information, improve database organization, reduce NULL values, and enforce strict relationships between entities.

Although less common than One-to-Many relationships, One-to-One relationships are an important part of well-designed relational databases.

---

## Key Takeaways

- One parent record matches one child record.
- Implement using a UNIQUE Foreign Key.
- Useful for optional or confidential data.
- Helps normalize databases.
- Common examples include Employee–ID Card, User–Profile, and Citizen–Passport.
