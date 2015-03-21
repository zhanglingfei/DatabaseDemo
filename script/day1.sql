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
