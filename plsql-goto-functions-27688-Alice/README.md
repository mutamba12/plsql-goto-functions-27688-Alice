# PL/SQL GOTO Statements and Functions

**Course:** INSY 8311 – Database Development with PL/SQL  
**Assignment:** Individual Assignment III – PL/SQL GOTO Statements and Functions  
**Student:** Mutamba Alice  
**Student ID:** 27688  
**Instructor:** Eric Maniraguha  
**Submission Date:** October 8, 2026  

---

## 1. Project Overview

This repository contains my work for **Individual Assignment III – PL/SQL GOTO Statements and Functions** for the Database Development with PL/SQL course.

The project demonstrates the use of:

- PL/SQL GOTO statements
- Labels and control flow
- Conditional statements
- Stored PL/SQL functions
- Function parameters and return values
- Exception handling
- Functions used inside SQL statements
- Payroll validation
- Testing and execution evidence

The project is organized into separate folders for database setup, GOTO programs, functions, tests, screenshots, and documentation.

---

## 2. Student Information

| Item | Information |
|---|---|
| Student Name | Mutamba Alice |
| Student ID | 27688 |
| Course | INSY 8311 – Database Development with PL/SQL |
| Assignment | Individual Assignment III |
| Instructor | Eric Maniraguha |
| Database | Oracle Database |
| Tools | Oracle SQL Developer / SQL*Plus |

---

## 3. Learning Objectives

The main objectives of this assignment are to:

- Understand the syntax and use of PL/SQL GOTO statements.
- Understand how labels are used with GOTO statements.
- Identify and correct an invalid GOTO statement.
- Rewrite a GOTO program using structured control flow.
- Create and execute stored PL/SQL functions.
- Use function parameters and return values.
- Implement exception handling.
- Call PL/SQL functions from SQL statements.
- Create a payroll validation function.
- Test PL/SQL programs and functions.
- Organize and document a PL/SQL project using GitHub.

---

# 4. Repository Structure

The repository is organized as follows:

```text
plsql-goto-functions-27688-Alice/
│
├── README.md
├── .gitignore
├── RUN_COMMANDS.txt
│
├── 00_setup/
│   └── create_tables.sql
│
├── 01_goto/
│   ├── A1_number_classifier.sql
│   ├── A2_salary_review.sql
│   ├── A3_illegal_goto.sql
│   └── A4_rewrite_no_goto.sql
│
├── 02_functions/
│   ├── B1_fn_annual_salary.sql
│   ├── B2_fn_years_of_service.sql
│   ├── B3_fn_calculate_tax.sql
│   ├── B4_fn_dept_name.sql
│   └── C1_fn_validate_payroll.sql
│
├── 03_tests/
│   ├── B5_functions_in_select.sql
│   ├── test_functions.sql
│   └── test_validate_payroll.sql
│
├── sceenshots/
│   ├── A1_output.PNG
│   ├── A2_output.PNG
│   ├── A3_error_and_fix.PNG
│   ├── A4_output1.PNG
│   ├── B5_select_output.PNG
│   └── C1_output.PNG
│
└── docs/
    └── REFLECTION.md
```

> **Note:** The screenshot folder is intentionally named `sceenshots` in this repository. All screenshot paths in this README use that exact folder name.

---

# 5. Database Setup

The database setup script is located at:

```text
00_setup/create_tables.sql
```

This script creates the required database tables:

- `departments`
- `employees`

It also inserts sample data used for testing the assignment.

### Departments

The sample departments include:

- Accounting
- Human Resources
- Engineering
- Sales

### Employees

The employee records contain:

- Employee ID
- First name
- Last name
- Department ID
- Monthly salary
- Hire date

### Running the Setup

In Oracle SQL Developer or SQL*Plus, run:

```sql
@00_setup/create_tables.sql
```

The tables can then be verified using:

```sql
SELECT * FROM departments;

SELECT * FROM employees;
```

---

# 6. Part A – GOTO Statements

## A1 – Number Classifier

**File:**

```text
01_goto/A1_number_classifier.sql
```

This program demonstrates the use of GOTO statements and labels to classify a number.

The program determines whether a number is:

- Positive
- Negative
- Zero

It also determines whether the number is:

- Even
- Odd

The test value used is:

```text
25
```

The program therefore identifies the number as **positive and odd**.

### A1 Execution Screenshot

The following screenshot shows the Oracle execution result:

![A1 Number Classifier Output](sceenshots/A1_output.PNG)

---

## A2 – Salary Review

**File:**

```text
01_goto/A2_salary_review.sql
```

This program demonstrates the use of a GOTO statement to transfer control when a salary is below the defined threshold.

The test salary used is:

```text
8500
```

The program identifies the salary as being below the defined salary threshold.

### A2 Execution Screenshot

The following screenshot shows the Oracle execution result:

![A2 Salary Review Output](sceenshots/A2_output.PNG)

---

## A3 – Illegal GOTO and Fix

**File:**

```text
01_goto/A3_illegal_goto.sql
```

This task demonstrates an invalid GOTO statement and its corrected version.

The first procedure intentionally attempts to jump to a label that is not valid in the required scope. Oracle therefore produces a compilation error.

The corrected procedure uses a valid label and executes successfully.

This task demonstrates:

- Correct label declaration
- Valid GOTO targets
- PL/SQL scope rules
- Compilation error analysis
- Correcting an invalid GOTO statement

### A3 Execution Screenshot

The screenshot shows both the illegal GOTO compilation error and the successful corrected execution.

![A3 Illegal GOTO Error and Fix](sceenshots/A3_error_and_fix.PNG)

---

## A4 – Rewrite Without GOTO

**File:**

```text
01_goto/A4_rewrite_no_goto.sql
```

This program performs the salary review logic without using GOTO.

Instead, it uses structured conditional logic:

```sql
IF
ELSE
END IF
```

This demonstrates a structured alternative to GOTO-based control flow.

### A4 Execution Screenshot

![A4 Rewrite Without GOTO Output](sceenshots/A4_output1.PNG)

---

# 7. Part B – PL/SQL Functions

## B1 – Annual Salary Function

**File:**

```text
02_functions/B1_fn_annual_salary.sql
```

**Function:**

```text
fn_annual_salary
```

This function receives a monthly salary and returns the annual salary.

The calculation is:

```text
Annual Salary = Monthly Salary × 12
```

The function also validates the input and rejects NULL or negative salary values.

### Example

```sql
SELECT fn_annual_salary(500000)
FROM dual;
```

---

## B2 – Years of Service Function

**File:**

```text
02_functions/B2_fn_years_of_service.sql
```

**Function:**

```text
fn_years_of_service
```

This function receives an employee hire date and calculates the number of completed years of service.

The function validates:

- NULL hire dates
- Future hire dates

### Example

```sql
SELECT fn_years_of_service(DATE '2020-01-01')
FROM dual;
```

---

## B3 – Tax Calculator Function

**File:**

```text
02_functions/B3_fn_calculate_tax.sql
```

**Function:**

```text
fn_calculate_tax
```

This function demonstrates progressive tax calculation.

The demonstration tax bands implemented in this project are:

| Income Range | Rate |
|---|---:|
| Up to 500,000 | 0% |
| 500,001 – 1,000,000 | 10% on amount above 500,000 |
| Above 1,000,000 | 10% on the first taxable band and 20% on the amount above 1,000,000 |

These rates are implementation assumptions for demonstration because specific tax rates were not provided in the assignment instructions.

---

## B4 – Department Name Function

**File:**

```text
02_functions/B4_fn_dept_name.sql
```

**Function:**

```text
fn_dept_name
```

This function receives a department ID and returns the corresponding department name.

### Example

```sql
SELECT fn_dept_name(10)
FROM dual;
```

If the department does not exist, the function returns:

```text
Unknown Department
```

---

# 8. B5 – Functions in SQL

**File:**

```text
03_tests/B5_functions_in_select.sql
```

This task demonstrates how stored PL/SQL functions can be called directly from SQL statements.

### Example

```sql
SELECT fn_annual_salary(monthly_salary)
FROM employees;
```

Another example is:

```sql
SELECT employee_id,
       first_name,
       last_name,
       fn_annual_salary(monthly_salary) AS annual_salary
FROM employees;
```

This demonstrates the integration of PL/SQL functions with SQL queries.

### B5 Execution Screenshot

![B5 Functions in SQL Output](sceenshots/B5_select_output.PNG)

---

# 9. Part C – Combined Payroll Task

## C1 – Payroll Validator

**File:**

```text
02_functions/C1_fn_validate_payroll.sql
```

**Function:**

```text
fn_validate_payroll
```

The payroll validation function combines several validation checks.

The function validates:

- Employee existence
- Monthly salary
- Department existence
- Hire date
- Future hire dates
- Invalid payroll information

The function returns a descriptive validation message.

### Example

```sql
SELECT fn_validate_payroll(1001)
FROM dual;
```

The function is also tested with an employee ID that does not exist.

### C1 Execution Screenshot

![C1 Payroll Validator Output](sceenshots/C1_output.PNG)

---

# 10. Testing

The testing scripts are stored in:

```text
03_tests/
```

The testing files are:

```text
B5_functions_in_select.sql
test_functions.sql
test_validate_payroll.sql
```

The tests verify that:

- Functions compile successfully.
- Functions return expected results.
- Functions handle invalid inputs.
- Functions can be called from SQL.
- Payroll validation produces appropriate messages.

---

# 11. How to Run the Project

The recommended execution order is shown below.

## Step 1 – Create Database Tables

```sql
@00_setup/create_tables.sql
```

## Step 2 – Create the Functions

```sql
@02_functions/B1_fn_annual_salary.sql
@02_functions/B2_fn_years_of_service.sql
@02_functions/B3_fn_calculate_tax.sql
@02_functions/B4_fn_dept_name.sql
@02_functions/C1_fn_validate_payroll.sql
```

## Step 3 – Run the GOTO Programs

```sql
@01_goto/A1_number_classifier.sql
@01_goto/A2_salary_review.sql
@01_goto/A3_illegal_goto.sql
@01_goto/A4_rewrite_no_goto.sql
```

## Step 4 – Run the Tests

```sql
@03_tests/B5_functions_in_select.sql
@03_tests/test_functions.sql
@03_tests/test_validate_payroll.sql
```

## Step 5 – Capture Execution Evidence

After executing the required programs, screenshots of the actual Oracle results are stored in:

```text
sceenshots/
```

---

# 12. Screenshot Evidence

The repository contains a dedicated folder called:

```text
sceenshots/
```

The screenshots are actual execution evidence from the Oracle environment.

| Task | Screenshot |
|---|---|
| A1 Number Classifier | `sceenshots/A1_output.PNG` |
| A2 Salary Review | `sceenshots/A2_output.PNG` |
| A3 Illegal GOTO and Fix | `sceenshots/A3_error_and_fix.PNG` |
| A4 Rewrite Without GOTO | `sceenshots/A4_output1.PNG` |
| B5 Functions in SQL | `sceenshots/B5_select_output.PNG` |
| C1 Payroll Validator | `sceenshots/C1_output.PNG` |

The screenshots are displayed in the relevant sections of this README using relative image paths.

---

# 13. Screenshot Gallery

The following section provides a quick view of all execution evidence.

## A1 – Number Classifier

![A1 Number Classifier Output](sceenshots/A1_output.PNG)

---

## A2 – Salary Review

![A2 Salary Review Output](sceenshots/A2_output.PNG)

---

## A3 – Illegal GOTO and Fix

![A3 Illegal GOTO Error and Fix](sceenshots/A3_error_and_fix.PNG)

---

## A4 – Rewrite Without GOTO

![A4 Rewrite Without GOTO Output](sceenshots/A4_output1.PNG)

---

## B5 – Functions in SQL

![B5 Functions in SQL Output](sceenshots/B5_select_output.PNG)

---

## C1 – Payroll Validator

![C1 Payroll Validator Output](sceenshots/C1_output.PNG)

---

# 14. Exception Handling

Exception handling is used to make the PL/SQL functions safer and more reliable.

Examples of invalid input include:

- NULL salary
- Negative salary
- NULL hire date
- Future hire date
- Non-existent employee
- Non-existent department

The functions provide appropriate results or raise exceptions when invalid data is supplied.

---

# 15. Files and Their Purpose

| File | Purpose |
|---|---|
| `create_tables.sql` | Creates tables and sample data |
| `A1_number_classifier.sql` | Demonstrates GOTO number classification |
| `A2_salary_review.sql` | Demonstrates GOTO salary review |
| `A3_illegal_goto.sql` | Demonstrates invalid and corrected GOTO |
| `A4_rewrite_no_goto.sql` | Rewrites the salary task without GOTO |
| `B1_fn_annual_salary.sql` | Creates annual salary function |
| `B2_fn_years_of_service.sql` | Creates years of service function |
| `B3_fn_calculate_tax.sql` | Creates tax calculation function |
| `B4_fn_dept_name.sql` | Creates department name function |
| `C1_fn_validate_payroll.sql` | Creates payroll validation function |
| `B5_functions_in_select.sql` | Demonstrates functions in SQL |
| `test_functions.sql` | Tests B1–B4 functions |
| `test_validate_payroll.sql` | Tests payroll validation |
| `REFLECTION.md` | Contains assignment reflection |

---

# 16. GitHub Commit Organization

The repository should contain meaningful commits that demonstrate the development process.

Recommended commits include:

```text
Initial repository structure and README
```

```text
Add database setup tables and sample data
```

```text
Add GOTO tasks A1-A4
```

```text
Add PL/SQL functions B1-B4 and C1
```

```text
Add function and payroll validation tests
```

```text
Add Oracle execution screenshots
```

These commits provide a clear development history for the project.

---

# 17. AI Usage Disclosure

AI assistance was used as a learning and development support tool during preparation of this assignment.

The assistance included:

- Understanding PL/SQL syntax.
- Organizing the repository structure.
- Reviewing SQL and PL/SQL logic.
- Understanding GOTO statements and stored functions.
- Preparing documentation and testing procedures.

I reviewed and tested the SQL/PLSQL code in my Oracle environment and take responsibility for understanding the final submission.

---

# 18. Academic Responsibility

All SQL and PL/SQL scripts should be executed and tested in Oracle before submission.

The screenshots included in this repository represent execution evidence from the Oracle environment.

The student is responsible for understanding the submitted code and results.

---

# 19. Conclusion

This project demonstrates the use of PL/SQL GOTO statements, labels, structured control flow, stored functions, SQL function calls, exception handling, and payroll validation.

The project is organized into setup scripts, GOTO programs, functions, tests, screenshots, and documentation to make the work easy to execute, review, and maintain.

---

## Author

**Mutamba Alice**  
**Student ID:** 27688  
**Course:** INSY 8311 – Database Development with PL/SQL

---

## Submission

**Repository Name:**

```text
plsql-goto-functions-27688-Alice
```

The completed project is maintained in a public GitHub repository and submitted through the required assignment Google Form.
