CREATE OR REPLACE FUNCTION fn_calculate_tax (
    p_income IN NUMBER
)
RETURN NUMBER
IS
    v_tax NUMBER := 0;
BEGIN
    IF p_income IS NULL THEN
        RAISE_APPLICATION_ERROR(-20005,'Income cannot be NULL.');
    ELSIF p_income < 0 THEN
        RAISE_APPLICATION_ERROR(-20006,'Income cannot be negative.');
    END IF;

    -- Demonstration rates; assignment sheet supplied to me did not specify bands.
    IF p_income <= 500000 THEN
        v_tax := 0;
    ELSIF p_income <= 1000000 THEN
        v_tax := (p_income - 500000) * 0.10;
    ELSE
        v_tax := (1000000 - 500000) * 0.10
               + (p_income - 1000000) * 0.20;
    END IF;

    RETURN v_tax;
EXCEPTION WHEN OTHERS THEN
    RAISE;
END fn_calculate_tax;
/
SHOW ERRORS FUNCTION fn_calculate_tax;
