SET SERVEROUTPUT ON;

DECLARE
    v_salary NUMBER := 8500;
BEGIN
    DBMS_OUTPUT.PUT_LINE('Salary entered: ' || v_salary);

    IF v_salary < 10000 THEN
        DBMS_OUTPUT.PUT_LINE('Salary is too low, consider a raise.');
    ELSE
        DBMS_OUTPUT.PUT_LINE('Salary is sufficient.');
    END IF;

    DBMS_OUTPUT.PUT_LINE('A4 completed without GOTO.');
END;
/
