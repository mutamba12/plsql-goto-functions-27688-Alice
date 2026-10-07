CREATE OR REPLACE FUNCTION fn_dept_name (
    p_department_id IN departments.department_id%TYPE
)
RETURN VARCHAR2
IS
    v_department_name departments.department_name%TYPE;
BEGIN
    SELECT department_name
    INTO v_department_name
    FROM departments
    WHERE department_id = p_department_id;

    RETURN v_department_name;
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        RETURN 'Unknown Department';
    WHEN TOO_MANY_ROWS THEN
        RETURN 'Data Error: Multiple Departments';
    WHEN OTHERS THEN
        RAISE;
END fn_dept_name;
/
SHOW ERRORS FUNCTION fn_dept_name;
