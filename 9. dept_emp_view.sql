
CREATE TABLE SCOTT.DEPT
(
    ID  NUMBER(10)  PRIMARY KEY,
    DEPT    VARCHAR2(20),
    SALARY  NUMBER(10),
    DUTIES VARCHAR2(100)
);

CREATE TABLE SCOTT.EMP
(
    ID  NUMBER(10)  PRIMARY KEY,
    SURNAME VARCHAR2 (50),
    NAME VARCHAR2 (50),
    PATRONYMIC VARCHAR2 (50),
    AGE NUMBER(3),
    DEPT_ID NUMBER(10),
    PHOTO BLOB,
    CHARACTERISTIC VARCHAR2 (100)
);

CREATE OR REPLACE VIEW dept_emp AS
SELECT surname || name || patronymic as FIO,
       dept, 
       age, 
       photo, 
       characteristic, 
       salary, 
       duties 
FROM emp e
JOIN dept d ON e.dept_id = d.id;
