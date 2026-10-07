SET SERVEROUTPUT ON;

DECLARE
    v_number NUMBER := 25;
BEGIN
    DBMS_OUTPUT.PUT_LINE('Number entered: ' || v_number);

    IF v_number = 0 THEN
        GOTO zero_number;
    ELSIF v_number < 0 THEN
        GOTO negative_number;
    ELSE
        GOTO positive_number;
    END IF;

<<positive_number>>
    DBMS_OUTPUT.PUT_LINE('Classification: Positive');
    IF MOD(v_number,2) = 0 THEN
        DBMS_OUTPUT.PUT_LINE('Parity: Even');
    ELSE
        DBMS_OUTPUT.PUT_LINE('Parity: Odd');
    END IF;
    GOTO finish;

<<negative_number>>
    DBMS_OUTPUT.PUT_LINE('Classification: Negative');
    IF MOD(ABS(v_number),2) = 0 THEN
        DBMS_OUTPUT.PUT_LINE('Parity: Even');
    ELSE
        DBMS_OUTPUT.PUT_LINE('Parity: Odd');
    END IF;
    GOTO finish;

<<zero_number>>
    DBMS_OUTPUT.PUT_LINE('Classification: Zero');
    DBMS_OUTPUT.PUT_LINE('Parity: Neither for this exercise.');

<<finish>>
    DBMS_OUTPUT.PUT_LINE('A1 completed.');
END;
/
