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