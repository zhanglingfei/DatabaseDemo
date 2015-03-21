select * from cat;--catalog

--student
create table student(
  sno   VARCHAR2(10),
  sname varchar2(20),
  sex   char(1),
  birthday date,
--address varchar2(100),
  dno      varchar2(5)--,
);

create table dep(
  dno   varchar2(5),
  dname varchar2(20),
  tel   varchar2(20)
);

create table course(
  cno   varchar2(5),
  cname varchar2(20),
  credit   number(1)
);

create table sc(
  sno   varchar2(10),
  cno   varchar2(5),
  grade number(3)
);

select * from emp;

select * from student;

drop table student;

alter table student
add (address varchar2(100));

alter table student
modify (sex char(2));

alter table student
drop (address);

insert into student values('s2015001', '张三', '男', '1-2月-1995', 'D01', '清华大学xxx');

alter table stu
rename to student;

alter table student
rename column gender to sex;

--主键约束

SELECT * FROM cat;

--student
create table student(
  sno   VARCHAR2(10)  CONSTRAINT pk_student_sno PRIMARY KEY ,
  sname varchar2(20),
  sex   char(1),
  birthday date,
--address varchar2(100),
  dno      varchar2(5)--,
);

select * from student;

PURGE RECYCLEBIN ;

INSERT INTO student VALUES (NULL , 'zhangsan', 'm', '1-2月-1995', 'd01');

DROP TABLE student;


--外键约束

DROP TABLE student;

create table student(
  sno   VARCHAR2(10)  CONSTRAINT pk_student_sno PRIMARY KEY ,
  sname varchar2(20) NOT NULL ,
  sex   char(1),
  birthday date,
--address varchar2(100),
  dno      varchar2(5) CONSTRAINT fk_student_dno REFERENCES dep(dno) ON DELETE SET NULL -- CASCADE -- Cascading Style Sheet
);

SELECT * FROM dep;
SELECT * FROM student;

DELETE FROM dep; -- 删除dep表的所有记录

DROP TABLE dep;

-- 唯一约束

create table dep(
  dno   varchar2(5) CONSTRAINT pk_dep_dno PRIMARY KEY ,
  dname varchar2(20) CONSTRAINT un_dep_dname UNIQUE ,
  tel   varchar2(20)
);

INSERT INTO dep VALUES ('d02', NULL , '62780001');