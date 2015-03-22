--列约束，表约束

SELECT * FROM cat;

--student
create table student(
  sno   VARCHAR2(10)  CONSTRAINT pk_student_sno PRIMARY KEY ,
  sname varchar2(20),
  sex   char(1),
  birthday date,
--address varchar2(100),
  dno      varchar2(5)  CONSTRAINT fk_student_dno REFERENCES dep(dno)
);

create table dep(
  dno   varchar2(5) CONSTRAINT pk_dep_dno PRIMARY KEY ,
  dname varchar2(20),
  tel   varchar2(20)
);

create table course(
  cno   varchar2(5) CONSTRAINT pk_course_cno  PRIMARY KEY ,
  cname varchar2(20),
  credit   number(1)
);

--sc
create table sc(
  sno   varchar2(10),
  cno   varchar2(5),
  grade number(3),
  CONSTRAINT pk_sc_sno_cno  PRIMARY KEY(sno, cno) ,
  CONSTRAINT fk_sc_sno  FOREIGN KEY (sno) REFERENCES student(sno),
  CONSTRAINT fk_sc_cno  FOREIGN KEY (cno) REFERENCES course(cno)
);

--disable constraint

SELECT * FROM dep;
INSERT INTO dep VALUES ('d01', 'cs', '123');
INSERT INTO dep VALUES ('d01', 'ee', '456');

ALTER TABLE dep
ENABLE CONSTRAINT pk_dep_dno;

DELETE FROM dep;

SELECT *
FROM user_constraints
where table_name = 'STUDENT'
;


--DML

SELECT * FROM course;

INSERT INTO course  VALUES ('c01', 'Java SE', 3); -- Ctrl + D(Duplicate)
INSERT INTO course(cno)  VALUES ('c02'); -- Ctrl + Y

UPDATE course
SET credit = credit+1
WHERE cno = 'c01'
;

DELETE FROM course
WHERE cno = 'c02'
;