# 🔤 Data Types

> Learn how Microsoft Excel stores different types of data and why understanding data types is essential for accurate calculations, sorting, filtering, and data analysis.

---

# 📖 Overview

Everything you enter into an Excel worksheet belongs to a **data type**.

Understanding data types is one of the most important skills for anyone working with Excel because formulas, charts, Pivot Tables, and dashboards all depend on data being stored correctly.

For example, if a date is stored as text instead of a date, Excel cannot calculate the number of days between two dates.

Similarly, if numbers are stored as text, mathematical calculations may not work as expected.

---

# 🎯 Learning Objectives

By the end of this lesson, you will be able to:

- Understand Excel's major data types
- Identify different types of values
- Distinguish between numbers and text
- Work with dates and times
- Understand logical values
- Recognize common error values
- Avoid data type mistakes

---

# 📚 What is a Data Type?

A **data type** defines the kind of information stored inside a cell.

Excel uses data types to determine how values should be:

- Displayed
- Calculated
- Sorted
- Filtered
- Formatted

Choosing the correct data type ensures accurate analysis.

---

# 📊 Types of Data in Excel

Excel primarily works with the following data types:

| Data Type | Example |
|-----------|---------|
| Number | 1250 |
| Text | John Smith |
| Date | 15-Jul-2026 |
| Time | 09:30 AM |
| Currency | ₹15,000 |
| Percentage | 82% |
| Logical Value | TRUE / FALSE |
| Error Value | #DIV/0! |

---

# 1️⃣ Number

Numbers are used for calculations.

Examples:

```text
100

2500

-75

99.95
```

You can perform operations such as:

- Addition
- Subtraction
- Multiplication
- Division
- Average
- Sum

Example:

```excel
=SUM(A2:A10)
```

---

# 2️⃣ Text

Text consists of letters, words, symbols, or combinations that Excel does not treat as numbers.

Examples:

```text
John

Laptop

New Delhi

Data Analyst
```

Text is commonly used for:

- Names
- Addresses
- Product IDs
- Categories
- Descriptions

---

# 3️⃣ Date

Excel stores dates as serial numbers behind the scenes, allowing date calculations.

Examples:

```text
01-Jan-2026

15-Jul-2026

31-Dec-2026
```

You can calculate:

- Number of days
- Months
- Years
- Age
- Deadlines

Example:

```excel
=TODAY()-A2
```

---

# 4️⃣ Time

Time values are stored as fractions of a day.

Examples:

```text
09:00 AM

02:45 PM

18:30
```

Time values can be used to calculate:

- Working hours
- Shift duration
- Time differences

---

# 5️⃣ Currency

Currency is simply a number displayed using a currency format.

Examples:

```text
₹25,000

$1,500

€850
```

Excel still performs calculations normally because the underlying value remains numeric.

---

# 6️⃣ Percentage

Percentages represent parts of a whole.

Examples:

```text
15%

80%

99.5%
```

Excel stores:

```text
50%
```

as

```text
0.5
```

Example:

```excel
=2500*10%
```

Result:

```text
250
```

---

# 7️⃣ Logical Values

Logical values are used in decision-making formulas.

There are only two values:

```text
TRUE

FALSE
```

Example:

```excel
=A2>100
```

Result:

```text
TRUE
```

or

```text
FALSE
```

Logical values are heavily used with:

- IF
- AND
- OR
- IFS
- SWITCH

---

# 8️⃣ Error Values

Errors indicate that Excel cannot complete a calculation.

Common errors include:

| Error | Meaning |
|--------|---------|
| #DIV/0! | Division by zero |
| #VALUE! | Incorrect value type |
| #NAME? | Unknown function or name |
| #REF! | Invalid cell reference |
| #NUM! | Invalid numeric value |
| #N/A | Value not available |
| #NULL! | Invalid range intersection |

Understanding these errors helps you troubleshoot formulas effectively.

---

# 🧩 How Excel Determines Data Types

Excel automatically identifies the type of data you enter.

Example:

| Input | Detected As |
|-------|-------------|
| 250 | Number |
| John | Text |
| 25/12/2026 | Date |
| 75% | Percentage |
| TRUE | Logical Value |

If Excel cannot recognize the format, it may store the value as text.

---

# 💼 Real-World Business Example

Suppose you're analyzing employee data.

| Employee | Salary | Joining Date | Active |
|----------|-------:|-------------|--------|
| Rahul | 45000 | 12-Jan-2024 | TRUE |
| Priya | 52000 | 25-Mar-2023 | TRUE |
| Amit | 39000 | 05-Aug-2022 | FALSE |

Each column uses a different data type:

- Employee → Text
- Salary → Number (Currency)
- Joining Date → Date
- Active → Logical Value

Using the correct data types allows Excel to sort, filter, calculate, and report accurately.

---

# 💡 Best Practices

- Store numbers as numbers, not text.
- Format dates consistently.
- Use currency formatting instead of typing symbols manually.
- Avoid mixing different data types in the same column.
- Validate imported data before analysis.

---

# ⚠️ Common Mistakes

❌ Numbers stored as text.

❌ Dates entered in inconsistent formats.

❌ Mixing text and numbers in one column.

❌ Typing currency symbols manually instead of applying formatting.

❌ Ignoring Excel error messages.

---

# 🎯 Interview Questions

### 1. What is a data type in Excel?

### 2. What are the major data types supported by Excel?

### 3. How does Excel store dates?

### 4. What is the difference between text and numbers?

### 5. What are logical values?

### 6. Name five common Excel error values.

### 7. Why is using the correct data type important?

---

# 📝 Practice Exercise

Create a worksheet with the following columns:

| Product | Price | Discount | Launch Date | In Stock |
|----------|------:|----------:|-------------|----------|
| Laptop | ₹55,000 | 10% | 10-Jan-2026 | TRUE |
| Mouse | ₹750 | 5% | 15-Feb-2026 | TRUE |
| Keyboard | ₹1,800 | 15% | 20-Mar-2026 | FALSE |

Tasks:

- Format the **Price** column as Currency.
- Format **Discount** as Percentage.
- Format **Launch Date** as Date.
- Sort the data by Launch Date.
- Filter products that are currently in stock.

---

# 📌 Summary

In this lesson, you learned:

- What data types are
- The major data types in Excel
- How Excel identifies different values
- Common error values
- Best practices for storing data correctly

Using the correct data type is the foundation of accurate calculations, reporting, and business analysis.

---

# 📚 Next Lesson

➡️ **06 Workbook Management.md**

In the next lesson, you'll learn how to create, save, organize, protect, and manage Excel workbooks like a professional.
