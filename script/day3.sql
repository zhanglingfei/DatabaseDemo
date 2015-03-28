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
