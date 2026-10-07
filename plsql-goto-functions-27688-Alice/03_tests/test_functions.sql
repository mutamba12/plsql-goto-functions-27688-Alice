SET SERVEROUTPUT ON;

DECLARE
    v_number NUMBER;
    v_text VARCHAR2(200);
BEGIN
    v_number := fn_annual_salary(100000);
    DBMS_OUTPUT.PUT_LINE('B1 annual salary test: ' || v_number);

    v_number := fn_years_of_service(DATE '2020-01-01');
    DBMS_OUTPUT.PUT_LINE('B2 years-of-service test: ' || v_number);

    v_number := fn_calculate_tax(1250000);
    DBMS_OUTPUT.PUT_LINE('B3 tax test: ' || v_number);

    v_text := fn_dept_name(30);
    DBMS_OUTPUT.PUT_LINE('B4 department test: ' || v_text);

    DBMS_OUTPUT.PUT_LINE('Function tests completed.');
EXCEPTION WHEN OTHERS THEN
    DBMS_OUTPUT.PUT_LINE('Function test error: ' || SQLERRM);
END;
/
