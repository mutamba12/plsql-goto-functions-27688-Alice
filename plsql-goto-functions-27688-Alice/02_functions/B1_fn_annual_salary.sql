CREATE OR REPLACE FUNCTION fn_annual_salary (
    p_monthly_salary IN NUMBER
)
RETURN NUMBER
IS
BEGIN
    IF p_monthly_salary IS NULL THEN
        RAISE_APPLICATION_ERROR(-20001,'Monthly salary cannot be NULL.');
    ELSIF p_monthly_salary < 0 THEN
        RAISE_APPLICATION_ERROR(-20002,'Monthly salary cannot be negative.');
    END IF;
    RETURN p_monthly_salary * 12;
EXCEPTION WHEN OTHERS THEN
    RAISE;
END fn_annual_salary;
/
SHOW ERRORS FUNCTION fn_annual_salary;
