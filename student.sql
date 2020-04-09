 create database test2
use Test2
Create table student(student_id int primary key identity (1,1),student_name varchar(50),student_mail varchar(50)) 
Create table course (course_id int primary key identity (1,1),course_name varchar(50),course_fees int,student_id int ) 
Create table mysubject (mysubject_id int primary key identity (1,1), mysubject_name varchar(50),course_id int) 
insert into student values ('raj','raj@gmail.com'),('Prashant','Prashant@gmail.com'),('rakesh','rakesh@gmail.com');
insert into course values ('Science',20000,1),('Commerce',7500,2),('Arts',1300,3);
insert into mysubject values('dotnet',1),('php',1),('python',1),('Testing',1)
insert into mysubject values('ECO',2),('Account',2),('Sp',2),('Maths',2)
insert into mysubject values('hand',3),('cotton',3),('drg',3),('craft',3)

select * from student
select * from course	
select * from mysubject

--drop table student
--drop table course
--drop table mysubject

-- join Two table  (Student and course)> with help of create object.
--inner join 
select student_name, student_mail, course_name from student obj_s inner join course obj_c on obj_s.student_id = obj_c.student_id;
select * from student obj_s inner join course obj_c on obj_s.student_id = obj_c.student_id;

-- full outer join
select student_name, student_mail, course_name from student obj_s full outer join course obj_c on obj_s.student_id = obj_c.student_id;
select * from student obj_s full outer join course obj_c on obj_s.student_id = obj_c.student_id;

