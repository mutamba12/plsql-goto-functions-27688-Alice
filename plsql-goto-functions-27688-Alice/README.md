# PL/SQL GOTO Statements and Functions — Individual Assignment III

Student: Mutamba Alice
Student ID: 27688
Course: INSY 8311 — Database Development with PL/SQL
Instructor: Eric Maniraguha

## Important note
The assignment sheet supplied lists the task names A1-A4, B1-B5 and C1-C2, but does not include detailed business rules for every task. This implementation therefore uses clear demonstration rules based on the lecture material. The assumptions are documented below and inside the SQL files.

## Structure
```text
plsql-goto-functions-27688-Alice/
├── README.md
├── .gitignore
├── 00_setup/create_tables.sql
├── 01_goto/A1_number_classifier.sql
├── 01_goto/A2_salary_review.sql
├── 01_goto/A3_illegal_goto.sql
├── 01_goto/A4_rewrite_no_goto.sql
├── 02_functions/B1_fn_annual_salary.sql
├── 02_functions/B2_fn_years_of_service.sql
├── 02_functions/B3_fn_calculate_tax.sql
├── 02_functions/B4_fn_dept_name.sql
├── 02_functions/C1_fn_validate_payroll.sql
├── 03_tests/B5_functions_in_select.sql
├── 03_tests/test_functions.sql
├── 03_tests/test_validate_payroll.sql
├── screenshots/
└── docs/REFLECTION.md
```

## Run order
```sql
SET SERVEROUTPUT ON;
@00_setup/create_tables.sql
@02_functions/B1_fn_annual_salary.sql
@02_functions/B2_fn_years_of_service.sql
@02_functions/B3_fn_calculate_tax.sql
@02_functions/B4_fn_dept_name.sql
@02_functions/C1_fn_validate_payroll.sql
@01_goto/A1_number_classifier.sql
@01_goto/A2_salary_review.sql
@01_goto/A3_illegal_goto.sql
@01_goto/A4_rewrite_no_goto.sql
@03_tests/B5_functions_in_select.sql
@03_tests/test_functions.sql
@03_tests/test_validate_payroll.sql
```

## Implementation assumptions
- A1: classify positive/negative/zero and parity.
- A2: salary below 10,000 is treated as low, following the lecture's salary-review example.
- B1: annual salary = monthly salary × 12.
- B2: completed years = TRUNC(MONTHS_BETWEEN(SYSDATE, hire_date)/12).
- B3: demonstration progressive tax bands: 0% through 500,000; 10% from 500,001 through 1,000,000; 20% above 1,000,000. These rates are an implementation assumption because the supplied assignment sheet does not specify tax bands.
- B4: department names are stored in the setup table.
- C1: validates employee existence, positive salary, existing department and non-future hire date.

## Screenshots
Capture real Oracle output for A1, A2, A3, A4, B5 and C1. Do not fabricate screenshots.

## Git commits
Suggested meaningful commits:
1. Initial repository structure and README
2. Add setup tables and sample data
3. Add GOTO tasks
4. Add functions
5. Add tests and reflection
6. Add real screenshots and final cleanup

## AI disclosure
If AI was used, include:
"I used an AI assistant to help organize the project structure, explain PL/SQL syntax, and review the SQL scripts. I tested the scripts in Oracle and remain responsible for understanding and explaining all submitted code."
