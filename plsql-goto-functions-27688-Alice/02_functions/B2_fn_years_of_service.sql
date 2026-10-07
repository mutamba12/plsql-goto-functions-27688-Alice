CREATE OR REPLACE FUNCTION fn_years_of_service (
    p_hire_date IN DATE
)
RETURN NUMBER
IS
BEGIN
    IF p_hire_date IS NULL THEN
        RAISE_APPLICATION_ERROR(-20003,'Hire date cannot be NULL.');
    ELSIF p_hire_date > SYSDATE THEN
        RAISE_APPLICATION_ERROR(-20004,'Hire date cannot be in the future.');
    END IF;
    RETURN TRUNC(MONTHS_BETWEEN(SYSDATE,p_hire_date)/12);
EXCEPTION WHEN OTHERS THEN
    RAISE;
END fn_years_of_service;
/
SHOW ERRORS FUNCTION fn_years_of_service;
