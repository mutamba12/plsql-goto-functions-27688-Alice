# PL/SQL GOTO Statements and Functions

## INSY 8311 – Database Development with PL/SQL

**Individual Assignment III**

---

## Student Information

| Information | Details |
|---|---|
| **Student Name** | Mutamba Alice |
| **Student ID** | 27688 |
| **Course** | INSY 8311 – Database Development with PL/SQL |
| **Assignment** | Individual Assignment III – PL/SQL GOTO Statements and Functions |
| **Instructor** | Eric Maniraguha |
| **Database System** | Oracle Database |
| **SQL Environment** | Oracle SQL Developer / SQL*Plus |
| **Repository** | `plsql-goto-functions-27688-Alice` |

---

# 1. Project Overview

This repository contains my work for **Individual Assignment III** in the course **INSY 8311 – Database Development with PL/SQL**.

The assignment focuses on the use of:

- PL/SQL GOTO statements
- Labels
- Conditional control structures
- Stored functions
- Exception handling
- Functions used in SQL statements
- Payroll validation
- Testing and documentation
- GitHub repository organization

The project demonstrates both the practical implementation and testing of PL/SQL programs using Oracle Database.

---

# 2. Learning Objectives

The main objectives of this assignment are to:

1. Understand how the PL/SQL `GOTO` statement works.
2. Understand how labels are created and referenced.
3. Identify invalid GOTO statements and correct them.
4. Rewrite GOTO-based logic using structured programming.
5. Create and execute stored PL/SQL functions.
6. Apply parameter validation and exception handling.
7. Use functions inside SQL statements.
8. Combine functions and validation logic in a payroll-related task.
9. Test PL/SQL programs using Oracle SQL Developer or SQL*Plus.
10. Organize PL/SQL source files and documentation in GitHub.

---

# 3. Repository Structure

The project is organized as follows:

```text
plsql-goto-functions-27688-Alice/
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
├── docs/
│   └── REFLECTION.md
│
├── .gitignore
├── RUN_COMMANDS.txt
└── README.md
```

---

# 4. Database Setup

The database setup script creates the tables required for the assignment.

The main tables are:

- `departments`
- `employees`

The `departments` table stores department information, while the `employees` table stores employee information such as salary, department, and hire date.

The setup script also inserts sample data used for testing the PL/SQL functions.

## Setup File

```text
00_setup/create_tables.sql
```

Run this file before running the functions and test programs.

---

# 5. Part A – GOTO Statements

## A1 – Number Classifier

### File

```text
01_goto/A1_number_classifier.sql
```

### Description

The A1 program demonstrates the use of the PL/SQL `GOTO` statement to classify a number.

The program checks:

- Whether the number is positive, negative, or zero.
- Whether the number is even or odd.

The test number used is:

```text
25
```

The expected classification is:

```text
Positive
Odd
```

The program also displays:

```text
A1 completed
```

## A1 Screenshot

![A1 Oracle Screenshot](./plsql-goto-functions-27688-Alice/sceenshots/A1_output.PNG)

---

# 6. A2 – Salary Review

### File

```text
01_goto/A2_salary_review.sql
```

### Description

The A2 program demonstrates how a `GOTO` statement can transfer program control when a salary is below a defined threshold.

The salary used for testing is:

```text
8500
```

The program checks whether the salary is below the defined threshold of:

```text
10000
```

Because `8500` is less than `10000`, the program transfers control to the appropriate label and displays the salary review message.

## A2 Screenshot

![A2 Salary Review Output](./plsql-goto-functions-27688-Alice/screenshots/A2_output.PNG)

---

# 7. A3 – Illegal GOTO and Fix

### File

```text
01_goto/A3_illegal_goto.sql
```

### Description

The A3 task demonstrates an invalid use of the PL/SQL `GOTO` statement.

A GOTO statement cannot transfer control into an illegal scope.

The first version intentionally contains an invalid label reference. Oracle therefore generates a compilation error.

The program is then corrected by placing the label in a valid scope.

This demonstrates the importance of understanding PL/SQL scope rules when using GOTO statements.

## A3 Screenshot

The screenshot contains both the illegal GOTO error and the corrected execution.

![A3 Illegal GOTO Error and Fix](./plsql-goto-functions-27688-Alice/screenshots/A3_error_and_fix.PNG)

---

# 8. A4 – Rewrite Without GOTO

### File

```text
01_goto/A4_rewrite_no_goto.sql
```

### Description

A4 rewrites the salary review logic from A2 without using a GOTO statement.

Instead of transferring control using a label, the program uses a structured `IF/ELSE` statement.

This approach demonstrates that structured programming can make simple decision-making logic easier to understand and maintain.

The same salary review condition is applied.

## A4 Screenshot

![A4 Rewrite Without GOTO Output](./plsql-goto-functions-27688-Alice/screenshots/A4_output1.PNG)

---

# 9. Part B – PL/SQL Functions

Part B focuses on creating stored PL/SQL functions.

Each function returns one value and includes appropriate validation and exception handling.

---

# 10. B1 – Annual Salary Function

### File

```text
02_functions/B1_fn_annual_salary.sql
```

### Function

```text
fn_annual_salary
```

### Purpose

The function calculates annual salary from a monthly salary.

The calculation is:

```text
Annual Salary = Monthly Salary × 12
```

For example:

```text
Monthly Salary = 450000
Annual Salary = 5400000
```

The function validates the input and does not accept:

- NULL salary
- Negative salary

---

# 11. B2 – Years of Service Function

### File

```text
02_functions/B2_fn_years_of_service.sql
```

### Function

```text
fn_years_of_service
```

### Purpose

The function calculates an employee's years of service from the employee's hire date.

The calculation uses the current system date and the employee's hire date.

The function validates that:

- The hire date is not NULL.
- The hire date is not in the future.

---

# 12. B3 – Tax Calculator Function

### File

```text
02_functions/B3_fn_calculate_tax.sql
```

### Function

```text
fn_calculate_tax
```

### Purpose

The tax calculator demonstrates the use of conditional logic inside a PL/SQL function.

The demonstration tax bands used in this assignment are:

| Income Range | Tax Rule |
|---|---|
| Up to 500,000 | 0% |
| 500,001 – 1,000,000 | 10% on amount above 500,000 |
| Above 1,000,000 | 10% on first 500,000 above the threshold and 20% on the amount above 1,000,000 |

The function also validates the income value.

---

# 13. B4 – Department Name Function

### File

```text
02_functions/B4_fn_dept_name.sql
```

### Function

```text
fn_dept_name
```

### Purpose

The function receives a department ID and returns the corresponding department name from the `departments` table.

Example:

```text
Department ID: 10
Department Name: Accounting
```

If the department does not exist, the function returns:

```text
Unknown Department
```

---

# 14. B5 – Functions Used in SQL

### File

```text
03_tests/B5_functions_in_select.sql
```

### Description

This task demonstrates how stored functions can be called directly from SQL statements.

The functions created in Part B are used in `SELECT` statements.

Examples include:

- Annual salary calculation
- Years of service
- Tax calculation
- Department name lookup

The SQL results demonstrate that the functions can be integrated into SQL queries.

## B5 Screenshot

![B5 Functions in SQL Output](./plsql-goto-functions-27688-Alice/screenshots/B5_select_output.PNG)

---

# 15. Part C – Combined Task

## C1 – Payroll Validator

### File

```text
02_functions/C1_fn_validate_payroll.sql
```

### Function

```text
fn_validate_payroll
```

### Purpose

The payroll validator combines multiple validation rules into a single PL/SQL function.

The function validates important employee payroll information.

The validation includes:

1. Checking whether the employee exists.
2. Checking whether the salary is valid.
3. Checking whether the department exists.
4. Checking whether the hire date is valid.
5. Checking that the hire date is not in the future.

The function returns a descriptive validation message.

This task demonstrates how PL/SQL functions can be used to centralize business validation logic.

## C1 Screenshot

![C1 Payroll Validator Output](./plsql-goto-functions-27688-Alice/screenshots/C1_output.PNG)

---

# 16. Exception Handling

Exception handling is used throughout the project to deal with invalid inputs and unexpected conditions.

Examples include:

- NULL values
- Negative salary values
- Invalid hire dates
- Future hire dates
- Missing employees
- Missing departments

Exception handling helps prevent the program from terminating unexpectedly and allows meaningful messages to be returned to the user.

---

# 17. Testing

Testing was performed using Oracle SQL Developer / SQL*Plus.

The project contains separate testing scripts.

### Function Tests

```text
03_tests/test_functions.sql
```

This script tests the functions created in Part B.

### Payroll Validation Tests

```text
03_tests/test_validate_payroll.sql
```

This script tests the payroll validation function using valid and invalid employee information.

### SQL Function Tests

```text
03_tests/B5_functions_in_select.sql
```

This script demonstrates the use of functions directly inside SQL `SELECT` statements.

---

# 18. How to Run the Project

The following order should be used when executing the project.

## Step 1 – Open Oracle SQL Developer or SQL*Plus

Connect to the Oracle database using the appropriate user account.

---

## Step 2 – Create the Tables

Run:

```text
00_setup/create_tables.sql
```

This creates:

```text
departments
employees
```

and inserts the sample data.

---

## Step 3 – Create the Functions

Run the following files:

```text
02_functions/B1_fn_annual_salary.sql
02_functions/B2_fn_years_of_service.sql
02_functions/B3_fn_calculate_tax.sql
02_functions/B4_fn_dept_name.sql
02_functions/C1_fn_validate_payroll.sql
```

---

## Step 4 – Run the GOTO Programs

Run:

```text
01_goto/A1_number_classifier.sql
01_goto/A2_salary_review.sql
01_goto/A3_illegal_goto.sql
01_goto/A4_rewrite_no_goto.sql
```

---

## Step 5 – Run the Tests

Run:

```text
03_tests/B5_functions_in_select.sql
03_tests/test_functions.sql
03_tests/test_validate_payroll.sql
```

---

# 19. Screenshot Evidence

Screenshots are included as evidence of the execution of the PL/SQL programs.

The screenshots included in this repository are:

| Task | Screenshot |
|---|---|
| A1 | `A1_output.PNG` |
| A2 | `A2_output.PNG` |
| A3 | `A3_error_and_fix.PNG` |
| A4 | `A4_output1.PNG` |
| B5 | `B5_select_output.PNG` |
| C1 | `C1_output.PNG` |

---

# 20. Screenshot Gallery

## A1 – Number Classifier

The following screenshot shows the execution output of the A1 number classifier.

![A1 Number Classifier](./plsql-goto-functions-27688-Alice/screenshots/A1_output.PNG)

---

## A2 – Salary Review

The following screenshot shows the execution output of the A2 salary review program.

![A2 Salary Review](./plsql-goto-functions-27688-Alice/screenshots/A2_output.PNG)

---

## A3 – Illegal GOTO and Fix

The following screenshot shows the illegal GOTO compilation error and the corrected program execution.

![A3 Illegal GOTO and Fix](./plsql-goto-functions-27688-Alice/screenshots/A3_error_and_fix.PNG)

---

## A4 – Rewrite Without GOTO

The following screenshot shows the structured version of the salary review program without using GOTO.

![A4 Without GOTO](./plsql-goto-functions-27688-Alice/screenshots/A4_output1.PNG)

---

## B5 – Functions in SQL

The following screenshot shows the functions being used inside SQL statements.

![B5 Functions in SQL](./plsql-goto-functions-27688-Alice/screenshots/B5_select_output.PNG)

---

## C1 – Payroll Validator

The following screenshot shows the payroll validation results.

![C1 Payroll Validator](./plsql-goto-functions-27688-Alice/screenshots/C1_output.PNG)

---

# 21. Files and Their Purposes

## Setup

### `00_setup/create_tables.sql`

Creates and populates the database tables required for the assignment.

---

## GOTO Programs

### `01_goto/A1_number_classifier.sql`

Demonstrates number classification using GOTO and labels.

### `01_goto/A2_salary_review.sql`

Demonstrates salary review using GOTO.

### `01_goto/A3_illegal_goto.sql`

Demonstrates an illegal GOTO statement and its correction.

### `01_goto/A4_rewrite_no_goto.sql`

Rewrites the salary review without GOTO.

---

## Functions

### `02_functions/B1_fn_annual_salary.sql`

Creates the annual salary function.

### `02_functions/B2_fn_years_of_service.sql`

Creates the years of service function.

### `02_functions/B3_fn_calculate_tax.sql`

Creates the tax calculation function.

### `02_functions/B4_fn_dept_name.sql`

Creates the department name function.

### `02_functions/C1_fn_validate_payroll.sql`

Creates the payroll validation function.

---

## Tests

### `03_tests/B5_functions_in_select.sql`

Demonstrates functions being called from SQL.

### `03_tests/test_functions.sql`

Tests the stored functions.

### `03_tests/test_validate_payroll.sql`

Tests the payroll validation function.

---

# 22. GitHub Commit Organization

The project was organized into meaningful commits so that the development process can be tracked.

A suitable commit sequence is:

```text
1. Initial project structure and README
2. Add database setup and sample tables
3. Add GOTO programs A1-A4
4. Add PL/SQL functions B1-B4
5. Add payroll validator and tests
6. Add screenshots and documentation
7. Update README and final documentation
```

Each commit should represent a meaningful stage of the project rather than multiple unrelated changes.

---

# 23. Documentation

Additional reflection information is available in:

```text
docs/REFLECTION.md
```

The reflection discusses the use of:

- GOTO statements
- Structured programming
- Functions
- Exception handling
- Validation
- Testing
- Lessons learned

---

# 24. AI Usage Disclosure

AI tools were used as a learning and development support resource during this assignment.

The assistance was used for purposes such as:

- Understanding PL/SQL concepts
- Reviewing SQL and PL/SQL syntax
- Organizing the repository
- Improving documentation
- Reviewing errors and debugging approaches
- Improving the README structure

The final work was reviewed and tested by the student.

The student is responsible for understanding the submitted code and being able to explain the implementation and results.

---

# 25. Academic Responsibility

Although tools were used to support the learning and development process, the student remains responsible for:

- Understanding the submitted programs.
- Testing the SQL and PL/SQL code.
- Understanding the output.
- Explaining the use of GOTO statements.
- Explaining the stored functions.
- Understanding exception handling.
- Understanding the payroll validation logic.
- Following the assignment requirements.

---

# 26. Key Concepts Demonstrated

This project demonstrates the following PL/SQL concepts:

### GOTO

The `GOTO` statement transfers control to a labeled statement within a valid PL/SQL scope.

### Labels

Labels identify locations within PL/SQL blocks where control can be transferred.

### IF/ELSE

Structured conditional statements are used to make decisions without unnecessary GOTO statements.

### Functions

Stored functions return a value and can be called from PL/SQL and appropriate SQL statements.

### Exception Handling

Exceptions allow the program to handle errors and invalid conditions in a controlled way.

### SQL Integration

PL/SQL functions can be called from SQL queries where appropriate.

### Validation

Input and database values are validated before processing.

---

# 27. Expected Project Outcome

After running the project successfully:

- The database tables should exist.
- The sample employee and department data should be available.
- The GOTO programs should execute successfully except for the intentionally invalid GOTO example.
- The invalid GOTO should demonstrate the expected compilation error.
- The corrected GOTO program should compile and execute.
- The functions should compile without errors.
- The functions should return the expected values.
- The functions should work inside SQL queries.
- The payroll validator should return meaningful validation messages.
- The screenshots should provide evidence of execution.

---

# 28. Conclusion

This assignment provided practical experience with PL/SQL control structures and stored functions.

The GOTO exercises demonstrated how control can be transferred using labels and also showed why structured programming can be preferable for simple decision-making logic.

The function exercises demonstrated how reusable PL/SQL logic can be created, validated, and called from SQL statements.

The payroll validator combined several concepts into one practical task, including database queries, validation, conditional logic, and exception handling.

Overall, the project improved my understanding of PL/SQL programming, debugging, testing, database functions, and GitHub-based project organization.

---

# 29. Author

**Mutamba Alice**

**Student ID:** 27688

**Course:** INSY 8311 – Database Development with PL/SQL

**Assignment:** Individual Assignment III – PL/SQL GOTO Statements and Functions

---

## End of README
