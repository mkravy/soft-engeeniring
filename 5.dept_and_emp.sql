-- Создаем справочник отделов
CREATE TABLE SCOTT.DEPT
(
    DEPTNO  NUMBER(10)  PRIMARY KEY,
    DEPT    VARCHAR2(20)
);

-- Сиквенс для автоинкремента deptno
CREATE SEQUENCE dept_sequence
START WITH 1
INCREMENT BY 1;

-- Триггер на автоинкремент deptno
CREATE TRIGGER seq_trigger 
BEFORE INSERT ON dept FOR EACH ROW
BEGIN
  SELECT dept_sequence.nextval
  INTO :new.deptno 
  FROM dual;
END;

-- Создаем справочник работников
CREATE TABLE SCOTT.EMP
(
    ENAME VARCHAR2(20),
    SAL NUMBER(10),
    DEPTNO NUMBER(10)
);

-- Запрос из задания #5
SELECT d.DEPT,
       e.ename, 
       e.sal, 
       (SELECT ROUND(AVG(sal), 2) FROM emp WHERE deptno = e.deptno) AS abg_by_deptno, 
       (SELECT MAX(sal) FROM emp WHERE deptno = e.deptno) AS max_by_deptno
       FROM emp e
JOIN dept d ON d.deptno = e.deptno;
