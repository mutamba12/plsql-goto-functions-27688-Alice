# PL/SQL GOTO Statements and Functions

**Course:** INSY 8311 – Database Development with PL/SQL
**Assignment:** Individual Assignment III – PL/SQL GOTO Statements and Functions
**Student:** Mutamba Alice
**Student ID:** 27688
**Instructor:** Eric Maniraguha
**Submission Date:** October 8, 2026

---

## 1. Project Overview

This repository contains my work for Individual Assignment III in the Database Development with PL/SQL course.

The project focuses on two main areas of PL/SQL:

1. **GOTO statements and control flow**
2. **Stored PL/SQL functions and function testing**

The assignment demonstrates how PL/SQL programs can use conditional logic, labels, GOTO statements, exception handling, stored functions, and SQL queries that call functions.

The project also includes a combined payroll validation task, testing scripts, execution evidence, and a reflection on the concepts learned.

---

## 2. Student Information

| Item         | Information                                  |
| ------------ | -------------------------------------------- |
| Student Name | Mutamba Alice                                |
| Student ID   | 27688                                        |
| Course       | INSY 8311 – Database Development with PL/SQL |
| Assignment   | Individual Assignment III                    |
| Instructor   | Eric Maniraguha                              |
| Database     | Oracle Database                              |
| Main Tool    | Oracle SQL*Plus / Oracle SQL Developer       |

---

## 3. Learning Objectives

The main objectives of this assignment are to:

* Understand the syntax and use of PL/SQL GOTO statements.
* Understand how labels are used with GOTO statements.
* Identify an invalid GOTO statement and correct it.
* Rewrite a GOTO-based program using structured control flow.
* Create and execute stored PL/SQL functions.
* Use parameters and return values in functions.
* Implement exception handling in functions.
* Call PL/SQL functions from SQL statements.
* Combine validation rules into a reusable payroll function.
* Test PL/SQL programs and document their results.
* Organize PL/SQL work in a GitHub repository.

---

# 4. Repository Structure

The repository is organized into separate folders according to the assignment requirements.

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
├── screenshots/
│   ├── A1_output.png
│   ├── A2_output.png
│   ├── A3_error_and_fix.png
│   ├── A4_output.png
│   ├── B5_select_output.png
│   └── C1_output.png
│
└── docs/
    └── REFLECTION.md
```

---

# 5. Database Setup

The database setup is located in:

```text
00_setup/create_tables.sql
```

This script creates the tables required for the assignment:

* `departments`
* `employees`

It also inserts sample department and employee data for testing.

The sample departments include:

* Accounting
* Human Resources
* Engineering
* Sales

The sample employee records contain employee IDs, names, department IDs, monthly salaries, and hire dates.

### Running the setup

In Oracle SQL*Plus or SQL Developer, run:

```sql
@00_setup/create_tables.sql
```

After execution, the tables can be checked with:

```sql
SELECT * FROM departments;

SELECT * FROM employees;
```

---

# 6. Part A – GOTO Statements

## A1 – Number Classifier

File:

```text
01_goto/A1_number_classifier.sql
```

This program demonstrates the use of GOTO statements and labels to classify a number.

The program checks whether the number is:

* Positive
* Negative
* Zero

It also determines whether the number is:

* Even
* Odd

The test value used in the program is:

```text
25
```

The program therefore identifies the number as positive and odd.

SCREENSHOT 1

![A1 Number Classifier Output](sceenshots/A1_output.PNG)

This program demonstrates a GOTO statement used to transfer control when a salary is below the defined threshold.

The test salary used is:

```text
8500
```

The program identifies the salary as being below the defined salary threshold.

### Screenshot

Save the Oracle execution result as:

```text
sceenshots/A2_output.PNG
```

---

## A3 – Illegal GOTO and Fix

File:

```text
01_goto/A3_illegal_goto.sql
```

This task demonstrates an invalid GOTO statement and the corrected version.

The first procedure intentionally attempts to jump to a label that is not valid in the required scope. Oracle therefore produces a compilation error.

The corrected procedure uses a valid label and successfully executes.

This task demonstrates the importance of:

* Correct label declaration
* Valid GOTO targets
* PL/SQL scope rules
* Compilation error analysis

### Screenshot

The screenshot should contain both:

1. The compilation error from the illegal GOTO.
2. The successful output from the corrected version.

Save it as:

```text
screenshots/A3_error_and_fix.png
```

---

## A4 – Rewrite Without GOTO

File:

```text
01_goto/A4_rewrite_no_goto.sql
```

This program performs the same salary review logic as A2 but uses structured conditional logic instead of GOTO.

The program demonstrates the use of:

```sql
IF
ELSE
END IF
```

This provides a more structured alternative to the GOTO-based approach.

### Screenshot

Save the execution output as:

```text
screenshots/A4_output.png
```

---

# 7. Part B – PL/SQL Functions

## B1 – Annual Salary Function

File:

```text
02_functions/B1_fn_annual_salary.sql
```

Function:

```text
fn_annual_salary
```

The function receives a monthly salary and returns the annual salary.

The calculation is:

```text
Annual Salary = Monthly Salary × 12
```

The function also validates the input and rejects NULL or negative salary values.

Example:

```sql
SELECT fn_annual_salary(500000)
FROM dual;
```

---

## B2 – Years of Service Function

File:

```text
02_functions/B2_fn_years_of_service.sql
```

Function:

```text
fn_years_of_service
```

This function receives an employee hire date and calculates the number of completed years of service.

The function checks for:

* NULL hire dates
* Future hire dates

An exception is raised when an invalid hire date is supplied.

Example:

```sql
SELECT fn_years_of_service(DATE '2020-01-01')
FROM dual;
```

---

## B3 – Tax Calculator Function

File:

```text
02_functions/B3_fn_calculate_tax.sql
```

Function:

```text
fn_calculate_tax
```

This function demonstrates progressive tax calculation.

The demonstration tax bands implemented in this project are:

| Income Range        |                                                                Rate |
| ------------------- | ------------------------------------------------------------------: |
| Up to 500,000       |                                                                  0% |
| 500,001 – 1,000,000 |                                         10% on amount above 500,000 |
| Above 1,000,000     | 10% on the first taxable band and 20% on the amount above 1,000,000 |

These rates are implementation assumptions for the assignment demonstration because the assignment instructions did not provide specific tax rates.

The function validates the income input before calculating tax.

---

## B4 – Department Name Function

File:

```text
02_functions/B4_fn_dept_name.sql
```

Function:

```text
fn_dept_name
```

This function receives a department ID and returns the corresponding department name.

Example:

```sql
SELECT fn_dept_name(10)
FROM dual;
```

If the department ID does not exist, the function returns:

```text
Unknown Department
```

---

# 8. B5 – Functions in SQL

File:

```text
03_tests/B5_functions_in_select.sql
```

This task demonstrates calling stored functions directly from SQL statements.

Examples include:

```sql
SELECT fn_annual_salary(monthly_salary)
FROM employees;
```

and:

```sql
SELECT employee_id,
       first_name,
       last_name,
       fn_annual_salary(monthly_salary) AS annual_salary
FROM employees;
```

This demonstrates how reusable PL/SQL functions can be integrated into SQL queries.

### Screenshot

Save the SQL query output as:

```text
screenshots/B5_select_output.png
```

The screenshot should show the actual query and the returned results.

---

# 9. Part C – Combined Payroll Task

## C1 – Payroll Validator

File:

```text
02_functions/C1_fn_validate_payroll.sql
```

Function:

```text
fn_validate_payroll
```

The payroll validation function combines multiple validation checks.

The function validates:

* Employee existence
* Monthly salary
* Department existence
* Hire date
* Future hire dates
* Invalid payroll information

The function returns a descriptive validation message.

Example:

```sql
SELECT fn_validate_payroll(1001)
FROM dual;
```

The function is also tested using an employee ID that does not exist.

### Screenshot

Save the execution output as:

```text
screenshots/C1_output.png
```

The screenshot should show the validation results.

---

# 10. Testing

Testing scripts are stored in:

```text
03_tests/
```

The testing files are:

```text
B5_functions_in_select.sql
test_functions.sql
test_validate_payroll.sql
```

The tests are used to verify that:

* Functions compile successfully.
* Functions return expected results.
* Functions handle invalid inputs.
* Functions can be called from SQL.
* Payroll validation produces appropriate messages.

---

# 11. How to Run the Project

The recommended execution order is:

### Step 1 – Create the database tables

```sql
@00_setup/create_tables.sql
```

### Step 2 – Create the functions

Run:

```sql
@02_functions/B1_fn_annual_salary.sql
@02_functions/B2_fn_years_of_service.sql
@02_functions/B3_fn_calculate_tax.sql
@02_functions/B4_fn_dept_name.sql
@02_functions/C1_fn_validate_payroll.sql
```

### Step 3 – Run the GOTO programs

Run:

```sql
@01_goto/A1_number_classifier.sql
@01_goto/A2_salary_review.sql
@01_goto/A3_illegal_goto.sql
@01_goto/A4_rewrite_no_goto.sql
```

### Step 4 – Run function tests

Run:

```sql
@03_tests/B5_functions_in_select.sql
@03_tests/test_functions.sql
@03_tests/test_validate_payroll.sql
```

### Step 5 – Capture screenshots

After each required program produces the expected result, capture the Oracle SQL*Plus or SQL Developer output.

Place the screenshots in:

```text
screenshots/
```

---

# 12. Screenshot Evidence

The repository contains a dedicated `screenshots` folder.

The required screenshots are:

| Assignment Task         | Screenshot File                    |
| ----------------------- | ---------------------------------- |
| A1 Number Classifier    | `screenshots/A1_output.png`        |
| A2 Salary Review        | `screenshots/A2_output.png`        |
| A3 Illegal GOTO and Fix | `screenshots/A3_error_and_fix.png` |
| A4 Rewrite Without GOTO | `screenshots/A4_output.png`        |
| B5 Functions in SQL     | `screenshots/B5_select_output.png` |
| C1 Payroll Validator    | `screenshots/C1_output.png`        |

The screenshots are execution evidence and should be taken from the actual Oracle environment.

**Important:** The screenshots must show the real results from my own Oracle execution. Placeholder or fabricated screenshots should not be used.

---

# 13. Screenshot Examples in This README

The screenshots can also be displayed directly in this README using relative Markdown paths.

For example:

### A1 Output

![A1 Number Classifier Output](screenshots/A1_output.png)

### A2 Output

![A2 Salary Review Output](screenshots/A2_output.png)

### A3 Error and Fix

![A3 Illegal GOTO Error and Fix](screenshots/A3_error_and_fix.png)

### A4 Output

![A4 Rewrite Without GOTO Output](screenshots/A4_output.png)

### B5 SQL Function Output

![B5 Functions in SQL Output](screenshots/B5_select_output.png)

### C1 Payroll Validation Output

![C1 Payroll Validation Output](screenshots/C1_output.png)

---

# 14. Exception Handling

Exception handling is used to make the functions safer and more reliable.

Examples of invalid input include:

* NULL salary
* Negative salary
* NULL hire date
* Future hire date
* Non-existent employee
* Non-existent department

The functions return or raise appropriate results when invalid data is supplied.

---

# 15. Files and Their Purpose

| File                         | Purpose                                 |
| ---------------------------- | --------------------------------------- |
| `create_tables.sql`          | Creates tables and sample data          |
| `A1_number_classifier.sql`   | Demonstrates GOTO number classification |
| `A2_salary_review.sql`       | Demonstrates GOTO salary review         |
| `A3_illegal_goto.sql`        | Demonstrates invalid and corrected GOTO |
| `A4_rewrite_no_goto.sql`     | Rewrites the salary task without GOTO   |
| `B1_fn_annual_salary.sql`    | Creates annual salary function          |
| `B2_fn_years_of_service.sql` | Creates years of service function       |
| `B3_fn_calculate_tax.sql`    | Creates tax calculation function        |
| `B4_fn_dept_name.sql`        | Creates department name function        |
| `C1_fn_validate_payroll.sql` | Creates payroll validation function     |
| `B5_functions_in_select.sql` | Demonstrates functions in SQL           |
| `test_functions.sql`         | Tests B1–B4 functions                   |
| `test_validate_payroll.sql`  | Tests payroll validation                |
| `REFLECTION.md`              | Contains assignment reflection          |

---

# 16. GitHub Commit Organization

The repository should contain meaningful commits that show the development process.

Recommended commits:

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

These commits make the development history easier to understand.

---

# 17. AI Usage Disclosure

AI assistance was used as a learning and development support tool during preparation of this assignment.

The assistance included:

* Understanding PL/SQL syntax.
* Organizing the repository structure.
* Reviewing SQL and PL/SQL logic.
* Helping explain GOTO statements and stored functions.
* Helping prepare documentation and testing procedures.

I reviewed the generated material, executed the SQL/PLSQL code in my Oracle environment, and take responsibility for understanding and submitting the final work.

---

# 18. Academic Responsibility

Although development assistance was used, the final submission should be based on my own understanding and verification.

All SQL and PL/SQL scripts should be executed and tested in Oracle before submission.

The screenshots included in the repository should represent actual execution results from the Oracle environment.

---

# 19. Conclusion

This project demonstrates the use of PL/SQL GOTO statements, labels, structured control flow, stored functions, SQL function calls, and exception handling.

The assignment also demonstrates how reusable functions can be used to perform calculations, retrieve department information, and validate payroll information.

Organizing the project into setup, GOTO programs, functions, tests, screenshots, and documentation makes the work easier to execute, verify, and maintain.

---

## Author

**Mutamba Alice**
**Student ID: 27688**
**INSY 8311 – Database Development with PL/SQL**

---

## Submission

The completed project is maintained in a public GitHub repository and submitted through the required assignment Google Form.

**Repository name:**

```text
plsql-goto-functions-27688-Alice
```
