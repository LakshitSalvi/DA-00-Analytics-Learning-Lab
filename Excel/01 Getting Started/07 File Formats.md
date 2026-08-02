# 📄 File Formats

> Learn the different Microsoft Excel file formats, understand when to use each one, and choose the right format for data analysis, reporting, sharing, and automation.

---

# 📖 Overview

When you save an Excel workbook, you can choose from several file formats.

Each format is designed for a different purpose.

Choosing the correct file format helps you:

- Improve compatibility
- Reduce file size
- Enable advanced features
- Share data easily
- Prevent data loss

As a Data Analyst, you'll frequently work with **XLSX**, **CSV**, **XLSM**, and **PDF** files.

Understanding the differences between them is an essential professional skill.

---

# 🎯 Learning Objectives

By the end of this lesson, you will be able to:

- Understand common Excel file formats
- Know when to use each format
- Choose the correct format for different scenarios
- Understand the advantages and limitations of each format
- Avoid common mistakes when saving workbooks

---

# 📚 Why File Formats Matter

Imagine you've created a dashboard with:

- Charts
- Pivot Tables
- Conditional Formatting
- Formulas

If you accidentally save it as a **CSV** file, almost everything except the raw data will be lost.

Choosing the correct file format ensures your work remains intact.

---

# 📂 Common Excel File Formats

| Extension | Name | Supports Formulas | Supports Charts | Supports Macros | Typical Use |
|-----------|------|:----------------:|:---------------:|:---------------:|-------------|
| `.xlsx` | Excel Workbook | ✅ | ✅ | ❌ | Standard workbook |
| `.xlsm` | Macro-Enabled Workbook | ✅ | ✅ | ✅ | Automation with VBA |
| `.xls` | Excel 97–2003 Workbook | ✅ | ✅ | Limited | Legacy compatibility |
| `.csv` | Comma-Separated Values | ❌ | ❌ | ❌ | Data exchange |
| `.pdf` | Portable Document Format | ❌ | Visual Only | ❌ | Sharing reports |
| `.xltx` | Excel Template | ✅ | ✅ | ❌ | Reusable templates |
| `.xltm` | Macro-Enabled Template | ✅ | ✅ | ✅ | Automated templates |

---

# 1️⃣ XLSX (.xlsx)

The **XLSX** format is the default file format used by modern versions of Microsoft Excel.

### Features

- Supports formulas
- Supports charts
- Supports Pivot Tables
- Supports formatting
- Supports multiple worksheets

### Does NOT support

- VBA Macros

### Best For

- Data analysis
- Dashboards
- Reports
- General business work

### Example

```text
Sales Dashboard.xlsx
```

---

# 2️⃣ XLSM (.xlsm)

The **XLSM** format is used when a workbook contains VBA macros.

### Features

- Everything available in XLSX
- Supports VBA
- Supports automation

### Best For

- Automated reports
- Repetitive tasks
- VBA projects

### Example

```text
Monthly Report Generator.xlsm
```

---

# 3️⃣ XLS (.xls)

The **XLS** format is used by older versions of Microsoft Excel.

### Features

- Compatible with Excel 97–2003
- Limited compared to XLSX
- Larger file size

### Best For

- Working with legacy systems

Generally, new workbooks should be saved as **XLSX** unless compatibility requires XLS.

---

# 4️⃣ CSV (.csv)

CSV stands for **Comma-Separated Values**.

It stores only raw data.

Example:

```csv
Name,Department,Salary
John,Sales,50000
Sarah,Finance,65000
David,HR,42000
```

### Advantages

- Very small file size
- Easy to import into databases
- Supported by almost every software

### Limitations

CSV does **not** save:

- Formulas
- Charts
- Formatting
- Images
- Multiple worksheets
- Pivot Tables

### Best For

- Importing/exporting data
- SQL databases
- Python
- Power BI
- Tableau

---

# 5️⃣ PDF (.pdf)

PDF files preserve the appearance of a workbook but cannot be edited like Excel files.

### Best For

- Sharing reports
- Printing dashboards
- Presentations
- Final business reports

### Example

```text
Executive Dashboard.pdf
```

---

# 6️⃣ Excel Templates (.xltx)

Templates allow you to create standardized workbooks.

Instead of starting from scratch every time, you can reuse a predefined layout.

### Best For

- Monthly reports
- Invoice templates
- KPI dashboards
- Budget planners

---

# 7️⃣ Macro Templates (.xltm)

A macro-enabled template combines reusable layouts with VBA automation.

### Best For

- Automated reporting
- Repetitive business processes
- Organization-wide templates

---

# 🔄 Save vs Export

Understanding the difference between **Save** and **Export** is important.

| Save | Export |
|------|--------|
| Keeps workbook editable | Creates a new output format |
| Used for ongoing work | Used for sharing or publishing |
| Example: XLSX | Example: PDF |

---

# 💼 Real-World Business Example

Suppose you're preparing a monthly sales report.

During different stages, you might use different formats:

| Task | File Format |
|------|-------------|
| Working on analysis | XLSX |
| Automating reports | XLSM |
| Sending raw data to SQL | CSV |
| Sharing with management | PDF |
| Creating next month's report | XLTX |

Choosing the appropriate format makes collaboration more efficient.

---

# 🧠 How to Choose the Right Format

| Situation | Recommended Format |
|-----------|--------------------|
| Daily analysis | XLSX |
| Automation using VBA | XLSM |
| Import into SQL | CSV |
| Executive presentation | PDF |
| Report template | XLTX |

---

# 💡 Best Practices

- Save working files as **XLSX**.
- Use **CSV** only for data exchange.
- Export dashboards as **PDF** when sharing.
- Use templates for recurring reports.
- Keep backup copies of important workbooks.
- Avoid using the older XLS format unless necessary.

---

# ⚠️ Common Mistakes

❌ Saving dashboards as CSV.

❌ Sending editable reports instead of PDFs.

❌ Using XLS for new projects.

❌ Forgetting that CSV removes formulas and formatting.

❌ Opening unknown XLSM files without verifying their source, as they may contain macros.

---

# 🎯 Interview Questions

### 1. What is the default Excel file format?

### 2. What is the difference between XLSX and XLSM?

### 3. When would you use a CSV file?

### 4. Why can't CSV store formulas?

### 5. What format would you use to send a dashboard to management?

### 6. What is an Excel template?

### 7. Which format supports VBA macros?

---

# 📝 Practice Exercise

Create a workbook named:

```text
Employee Performance Report
```

Save the workbook in the following formats:

- XLSX
- PDF
- CSV

Compare the files and answer:

- Which formatting is preserved?
- Which formulas remain?
- Which file is the smallest?
- Which format would you send to your manager?
- Which format would you import into SQL?

---

# 📌 Summary

In this lesson, you learned:

- The most common Excel file formats
- The strengths and limitations of each format
- When to use XLSX, XLSM, CSV, PDF, and templates
- How to choose the right format for different business scenarios
- Best practices for saving and sharing workbooks

Selecting the correct file format helps ensure compatibility, protects your work, and makes collaboration with colleagues and other tools much smoother.

---

# 📚 Next Lesson

➡️ **08 AutoSave & Version History.md**

In the next lesson, you'll learn how AutoSave and Version History help protect your work, recover previous versions, and collaborate safely with others.
