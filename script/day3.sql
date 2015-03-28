SELECT * FROM cat;

SELECT * FROM dept;

SELECT ename, empno, deptno
FROM emp
WHERE deptno = ( -->, < >=, <= IN NOT IN

  SELECT deptno
  FROM dept
  WHERE dname = 'SALES'--;?
);

SELECT deptno
FROM dept
WHERE dname = 'SALES';


SELECT e.ename, e.empno, d.deptno
FROM emp e, dept d
where e.deptno = d.deptno and d.dname = 'SALES'
;

--github for windows...

SELECT max(hiredate)
FROM emp
GROUP BY deptno
;

CREATE TABLE emp_test
  AS
  SELECT ename, empno
  FROM emp
  ;

SELECT *
FROM emp_test;

DELETE FROM emp_test;

INSERT INTO emp_test
    SELECT ename, empno FROM emp
WHERE deptno = 10
;

SELECT * FROM emp;

SELECT LEVEL, ename, empno
FROM emp
CONNECT BY PRIOR empno = mgr
START WITH empno = 7839
;

SELECT lower(ename) FROM emp; -- DQL DML

SELECT substr('character', 0, 5) FROM dual; --?

SELECT round(68.247, -3) FROM dual;

SELECT floor(99.9) FROM dual;

SELECT ceil(99.1) FROM dual;

SELECT sysdate FROM dual;
SELECT sysdate + 7 FROM dual;

SELECT ename, round(sysdate - hiredate, 0) 天
FROM emp;
SELECT ename, round(months_between(sysdate, hiredate), 0) 月
FROM emp;

SELECT next_day(sysdate, '星期日') FROM dual;

SELECT last_day(sysdate) FROM dual;

SELECT round(sysdate, 'year') FROM dual;

SELECT sysdate - trunc(sysdate) FROM dual;

SELECT *
FROM emp
WHERE hiredate < to_date('1985-01-01', 'yyyy-mm-dd');

SELECT  sal + nvl2(comm, comm, 0) FROM emp;

UPDATE emp
SET comm = nvl2(comm, comm*1.1, null)
;

SELECT * FROM emp;