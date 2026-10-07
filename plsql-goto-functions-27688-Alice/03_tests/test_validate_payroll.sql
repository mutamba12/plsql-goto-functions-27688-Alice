SET SERVEROUTPUT ON;

SELECT employee_id,
       first_name || ' ' || last_name AS employee_name,
       fn_validate_payroll(employee_id) AS validation_result
FROM employees ORDER BY employee_id;

SELECT fn_validate_payroll(1001) AS employee_1001 FROM dual;
SELECT fn_validate_payroll(9999) AS employee_9999 FROM dual;
