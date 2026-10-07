CREATE OR REPLACE FUNCTION fn_validate_payroll (
    p_employee_id IN employees.employee_id%TYPE
)
RETURN VARCHAR2
IS
    v_salary employees.monthly_salary%TYPE;
    v_department_id employees.department_id%TYPE;
    v_hire_date employees.hire_date%TYPE;
    v_department_count NUMBER;
BEGIN
    SELECT monthly_salary, department_id, hire_date
    INTO v_salary, v_department_id, v_hire_date
    FROM employees
    WHERE employee_id = p_employee_id;

    IF v_salary IS NULL OR v_salary <= 0 THEN
        RETURN 'INVALID: Monthly salary must be greater than zero.';
    END IF;

    SELECT COUNT(*) INTO v_department_count
    FROM departments
    WHERE department_id = v_department_id;

    IF v_department_count = 0 THEN
        RETURN 'INVALID: Employee department does not exist.';
    END IF;

    IF v_hire_date IS NULL OR v_hire_date > SYSDATE THEN
        RETURN 'INVALID: Hire date is missing or in the future.';
    END IF;

    RETURN 'VALID: Payroll data passed all checks.';
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        RETURN 'INVALID: Employee does not exist.';
    WHEN TOO_MANY_ROWS THEN
        RETURN 'INVALID: Duplicate employee records found.';
    WHEN OTHERS THEN
        RETURN 'ERROR: ' || SQLERRM;
END fn_validate_payroll;
/
SHOW ERRORS FUNCTION fn_validate_payroll;
