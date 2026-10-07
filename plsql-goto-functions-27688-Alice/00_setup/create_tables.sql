SET SERVEROUTPUT ON;

BEGIN
    EXECUTE IMMEDIATE 'DROP TABLE employees CASCADE CONSTRAINTS';
EXCEPTION WHEN OTHERS THEN
    IF SQLCODE != -942 THEN RAISE; END IF;
END;
/

BEGIN
    EXECUTE IMMEDIATE 'DROP TABLE departments CASCADE CONSTRAINTS';
EXCEPTION WHEN OTHERS THEN
    IF SQLCODE != -942 THEN RAISE; END IF;
END;
/

CREATE TABLE departments (
    department_id NUMBER(4) PRIMARY KEY,
    department_name VARCHAR2(100) NOT NULL
);

CREATE TABLE employees (
    employee_id NUMBER(6) PRIMARY KEY,
    first_name VARCHAR2(50) NOT NULL,
    last_name VARCHAR2(50) NOT NULL,
    department_id NUMBER(4) NOT NULL,
    monthly_salary NUMBER(10,2) NOT NULL,
    hire_date DATE NOT NULL,
    CONSTRAINT fk_employee_department FOREIGN KEY (department_id)
        REFERENCES departments(department_id),
    CONSTRAINT ck_employee_salary CHECK (monthly_salary > 0)
);

INSERT INTO departments VALUES (10, 'Accounting');
INSERT INTO departments VALUES (20, 'Human Resources');
INSERT INTO departments VALUES (30, 'Engineering');
INSERT INTO departments VALUES (40, 'Sales');

INSERT INTO employees VALUES (1001, 'Alice', 'Mutamba', 10, 450000, DATE '2021-02-15');
INSERT INTO employees VALUES (1002, 'Jean', 'Uwase', 20, 650000, DATE '2019-07-10');
INSERT INTO employees VALUES (1003, 'Eric', 'Niyonzima', 30, 900000, DATE '2017-03-20');
INSERT INTO employees VALUES (1004, 'Diane', 'Mukamana', 40, 1200000, DATE '2023-01-05');
INSERT INTO employees VALUES (1005, 'Paul', 'Habimana', 30, 150000, DATE '2025-06-01');

COMMIT;

SELECT * FROM departments ORDER BY department_id;
SELECT employee_id, first_name, last_name, department_id, monthly_salary,
       TO_CHAR(hire_date,'YYYY-MM-DD') hire_date
FROM employees ORDER BY employee_id;
