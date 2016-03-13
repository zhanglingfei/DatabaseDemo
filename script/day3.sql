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

SELECT substr('character', 1, 5) FROM dual; --?

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

--Oracle Objects

SELECT * FROM scott.emp;

SELECT *
FROM user_constraints
where lower(table_name) = 'emp'
;

SELECT  *
FROM user_indexes
where lower(table_name) = 'emp'
;

create index in_emp on emp(ename);

SELECT * FROM user_ind_columns;

--sequence
CREATE SEQUENCE s_test;

SELECT * FROM cat;

SELECT *
FROM user_sequences
;

CREATE TABLE test(
  id number CONSTRAINT pk_test_id PRIMARY KEY
);

INSERT into test VALUES (s_test.nextval);

SELECT * FROM test;

--view

CREATE or REPLACE VIEW v_d10
  AS
  SELECT ename, empno, sal
  FROM emp
  WHERE deptno = 10
  WITH READ ONLY
  ;

--GRANT DCL: grant create view to scott;

SELECT *
FROM user_views
;

SELECT * FROM v_d10;

UPDATE v_d10
SET sal = sal + 100;

SELECT sal FROM emp;

DELETE FROM v_d10
WHERE lower(ename) = 'king'
;

DELETE FROM emp
WHERE lower(ename) = 'king' and detpno = 10
;

--trigger

create or replace trigger t_emp
before update  or delete or insert
on emp
  begin
    if  to_char(sysdate,'dy')='星期日' then
        raise_application_error(-20000, 'you would not update the emp table  on Saturday') ;
     end if ;
  end ;

DELETE FROM emp;

--transaction
commit;


SELECT * FROM emp;

DELETE FROM emp;

ROLLBACK ;

SELECT * FROM emp_test;