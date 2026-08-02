# 💾 AutoSave & Version History

> Learn how AutoSave and Version History protect your work, simplify collaboration, and help you recover previous versions of your Excel workbooks.

---

# 📖 Overview

Imagine spending several hours cleaning data, creating Pivot Tables, and designing dashboards—only to lose everything because your computer crashed.

Microsoft Excel provides two powerful features to help prevent this:

- **AutoSave**
- **Version History**

These features automatically save your work and allow you to restore previous versions whenever needed.

Understanding them is essential for anyone working with important business data.

---

# 🎯 Learning Objectives

By the end of this lesson, you will be able to:

- Understand what AutoSave is
- Understand Version History
- Know the difference between AutoSave and AutoRecover
- Restore previous versions of a workbook
- Recover unsaved work
- Follow best practices to avoid losing data

---

# 📚 What is AutoSave?

**AutoSave** is a Microsoft 365 feature that automatically saves changes to your workbook while you work.

Instead of clicking **Ctrl + S** repeatedly, Excel saves your changes continuously.

AutoSave works only when the workbook is stored in:

- OneDrive
- SharePoint

---

# 🔄 How AutoSave Works

```text
Open Workbook
       │
       ▼
Make Changes
       │
       ▼
Excel Automatically Saves
       │
       ▼
Latest Version Stored Online
```

Whenever you make changes, Excel updates the cloud copy automatically.

---

# ✅ Benefits of AutoSave

- Prevents accidental data loss
- Reduces the need for manual saving
- Makes collaboration easier
- Keeps the latest version synchronized
- Saves time

---

# ⚠️ When AutoSave Does NOT Work

AutoSave is unavailable if:

- The workbook is stored only on your local computer.
- You're using an older version of Excel.
- The workbook is in a format that doesn't support AutoSave.
- You're not signed in to a Microsoft account.

In these cases, continue using:

```text
Ctrl + S
```

frequently.

---

# 📚 What is Version History?

**Version History** stores previous versions of your workbook.

If you accidentally:

- Delete data
- Overwrite formulas
- Make incorrect changes

you can restore an earlier version.

Version History is especially useful when multiple people are working on the same workbook.

---

# 🔄 How Version History Works

```text
Version 1
      │
      ▼
Version 2
      │
      ▼
Version 3
      │
      ▼
Current Version
```

At any time, you can reopen one of the earlier versions.

---

# 📂 Opening Version History

In Microsoft Excel:

```text
File
   ↓
Info
   ↓
Version History
```

or

Click the workbook name at the top of the window and select:

```text
Version History
```

A list of saved versions will appear.

---

# 🔙 Restoring a Previous Version

Steps:

1. Open **Version History**
2. Select the version you want
3. Review the workbook
4. Click **Restore**

Excel creates the selected version as the current workbook.

---

# 💻 What is AutoRecover?

AutoRecover is different from AutoSave.

It automatically creates temporary recovery files while you're working.

If Excel crashes unexpectedly, AutoRecover attempts to restore the most recent temporary copy.

---

# 🔍 AutoSave vs AutoRecover

| Feature | AutoSave | AutoRecover |
|----------|----------|-------------|
| Saves automatically | ✅ | ✅ |
| Requires OneDrive/SharePoint | ✅ | ❌ |
| Protects against crashes | Partially | ✅ |
| Stores previous versions | Through Version History | ❌ |
| Works offline | ❌ | ✅ |

---

# 👥 Collaboration Example

Imagine three Data Analysts are working on the same sales workbook.

```text
Sales Dashboard.xlsx

│
├── Rahul
├── Priya
└── Aman
```

With AutoSave enabled:

- Everyone sees updates in near real time.
- Version History records changes.
- Older versions can be restored if needed.

This greatly reduces the risk of losing work.

---

# 💼 Real-World Business Example

You spend an entire afternoon building an executive dashboard.

Before presenting it, a teammate accidentally deletes several important formulas.

Without Version History:

❌ The workbook may need to be repaired manually.

With Version History:

✅ Restore the previous version in a few clicks.

---

# 💡 Best Practices

- Store important workbooks in OneDrive or SharePoint.
- Keep AutoSave enabled whenever possible.
- Press **Ctrl + S** regularly when working with local files.
- Review Version History before restoring a version.
- Save major milestones before making significant changes.
- Avoid creating multiple "Final" copies of the same workbook.

---

# ⚠️ Common Mistakes

❌ Assuming AutoSave works for every workbook.

❌ Disabling AutoSave without understanding the consequences.

❌ Working only with local copies of critical files.

❌ Ignoring Version History after accidental changes.

❌ Relying solely on AutoRecover instead of saving your work.

---

# 🎯 Interview Questions

### 1. What is AutoSave in Microsoft Excel?

### 2. How is AutoSave different from AutoRecover?

### 3. What is Version History?

### 4. Does AutoSave work for locally stored workbooks?

### 5. When would you use Version History?

### 6. How can you recover a workbook after Excel crashes?

### 7. Why is Version History important in collaborative environments?

---

# 📝 Practice Exercise

1. Create a workbook named:

```text
Monthly Sales Dashboard.xlsx
```

2. Save it to **OneDrive** (if available).

3. Enable AutoSave.

4. Make several edits over time.

5. Open **Version History** and review previous versions.

6. Restore an earlier version and observe the changes.

---

# 📌 Summary

In this lesson, you learned:

- What AutoSave is
- How Version History works
- The difference between AutoSave and AutoRecover
- How to restore previous versions
- Best practices for protecting important workbooks

Using these features helps safeguard your work, simplifies collaboration, and reduces the risk of losing valuable data.

---

# 📚 Next Lesson

➡️ **09 Best Practices.md**

In the next lesson, you'll learn the professional spreadsheet practices followed by experienced Data Analysts to create clean, maintainable, and reliable Excel workbooks.
