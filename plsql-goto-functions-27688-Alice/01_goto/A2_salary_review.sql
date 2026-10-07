SET SERVEROUTPUT ON;

DECLARE
    v_salary NUMBER := 8500;
BEGIN
    DBMS_OUTPUT.PUT_LINE('Salary entered: ' || v_salary);

    IF v_salary < 10000 THEN
        GOTO low_salary;
    END IF;

    DBMS_OUTPUT.PUT_LINE('Salary is sufficient.');
    GOTO end_program;

<<low_salary>>
    DBMS_OUTPUT.PUT_LINE('Salary is too low, consider a raise.');

<<end_program>>
    DBMS_OUTPUT.PUT_LINE('A2 completed.');
END;
/
