SET SERVEROUTPUT ON;

SELECT employee_id,
       first_name || ' ' || last_name AS employee_name,
       monthly_salary,
       fn_annual_salary(monthly_salary) AS annual_salary
FROM employees ORDER BY employee_id;

SELECT employee_id,
       first_name || ' ' || last_name AS employee_name,
       TO_CHAR(hire_date,'YYYY-MM-DD') AS hire_date,
       fn_years_of_service(hire_date) AS years_of_service
FROM employees ORDER BY employee_id;

SELECT employee_id,
       first_name || ' ' || last_name AS employee_name,
       department_id,
       fn_dept_name(department_id) AS department_name
FROM employees ORDER BY employee_id;

SELECT fn_calculate_tax(1250000) AS tax_amount FROM dual;
