-- Part 1 intentionally produces a compilation error.
CREATE OR REPLACE PROCEDURE a3_illegal_goto
IS
BEGIN
    GOTO inner_label;
    DECLARE
    BEGIN
        NULL;
    <<inner_label>>
        NULL;
    END;
END;
/

SHOW ERRORS PROCEDURE a3_illegal_goto;

-- Part 2: corrected version.
CREATE OR REPLACE PROCEDURE a3_fixed_goto
IS
BEGIN
    GOTO valid_label;
    DBMS_OUTPUT.PUT_LINE('This line is skipped.');
<<valid_label>>
    DBMS_OUTPUT.PUT_LINE('A3 fixed: control reached the valid label.');
END;
/

SHOW ERRORS PROCEDURE a3_fixed_goto;

BEGIN
    a3_fixed_goto;
END;
/
