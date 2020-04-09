--1.----Create new login Id and Password for user (CUI => Create user id ) -------
    --whatever database user will create then only he can access that all database 
   create login rakesh with password ='1234'  
   -- Go and cheack in "Security>Login>abc "it will be created.
   ---- Close application=>Open Again>Server name :Rakesh/SQLExpress
			--						Authenfication : SQL Server Authetification
			--						Login : rakesh
			--						Password :1234

--2. How to create a new Database in SQL Server Using "CUI" and "GUI" 
 create database MyClassDB    
 ddl _ data definition language
 dml _ data manipulation language
 dql _ data query language
 dcl _ data control language..
 TCL _ transaction control language.

--working with Sub-Language of SQL (DDL,DML,DQL,TCL,DCL Command)
--Part A =>  "DDL" *data definition language *  (Crete,Alter,SP_rename,Turncate, & Drop Column)-----------------
     --Crete table :
		--1.Crete Database
		create database xaller		
		--2. Create a simple table 
		create table Employee_details(id int,fname varchar(50),Lastname varchar(50),salary int)	
				-- Go to database 
				use xaller	
			   --3. Show Structure of Table
				 sp_help Employee_details

	----Alter command  for column activity
	--   Alter -Alter Column 
	--   Alter -Add
	--   SP_Rename
	--   Alter-Drop

				-- Change datatype and size of column
				alter table Employee_details alter Column fname Varchar(100)

				-- AddColumn
				alter table Employee_details Add Address Varchar(500)

				-- SP_Rename table Column .
				Sp_RENAME 'Employee_details.fname','FirstName'
				-- Drop Column--
				alter table Employee_details Drop Column Address
				alter table Employee_details Drop Column [Employee_details.MyAddress]

	--Truncate Table: Delete all rows data form table    
				 Truncate table Employee_details 
	
	-- Drop Table:Drop the table with data     
				 Drop table Employee_details  
				 select * from Employee_details


--Part B=>  --DML (Data manupulation command ) => inset,Update,Delete-----------
				 create table Employee_details(id int, fname varchar(100), lastName varchar(200), salay int)

			-- insert data in Table 
			   --method I
			   insert into Employee_details values(4,'shubham','Vishwakrma',250000)
			   -- method II
			   insert into Employee_details(id,fname,salary) values(4,'shubham',500000)
 
			--update date in table
			   update Employee_details set fname='suaman' where id = 2;
			   update Employee_details set lastName= null where id = 3; 
			   update Employee_details set lastName= 'singh' where lastName is null;

			-- Delete data in table
			   Delete from Employee_details where salary=250000;
			   Delete from Employee_details where fname='rakesh' and salary = 10000;
			   Delete from Employee_details where fname='Prashant' or salary = 200000;  -- both condition data will be deleted.
			   select * from Employee_details

--Part C=>  --DQL/DRL (Data /QueryRead command ) => Select-----------
			insert into Employee_Details values (1,'rakesh','kevat',5000);
			insert into Employee_Details values(2,'prashant','Mishra',10000);
			insert into Employee_Details values (3,'Shravan','Singh',25000);
			insert into Employee_Details values (4,'shubham','Mishra',30000);

			Select * from Employee_details;
			select * from Employee_details where lastName = 'kevat';
			Select fname,lastName,salary from Employee_details;
			Select fname,lastName,salary from Employee_details where fname='rakesh';

--Part D=>  --Identiy (1,1)
         -- identity(1,1)       --Values ID--1,2,3,4,5,......
		Create table Student_details (id int identity, ename varchar(500),lname varchar(600),salary int)
		insert into Student_details values ('rakesh','kevat',12000);
		insert into Student_details values ('rakesh','kevat',12000),('Subham','Mishra',24000);
		insert into Student_details (ename,lname,salary) values ('rakesh','kevat',12000);
		Select * from Student_details;     
		-- identity(100,5)  -- Values if Id--100,105,110,115,120,125,...
		Create table Student_details1 (id int identity(100,5), ename varchar(500),lname varchar(600),salary int)
		insert into Student_details1 values ('rakesh','kevat',12000);
		insert into Student_details1 values ('rakesh','kevat',12000),('Subham','Mishra',24000);
		insert into Student_details1 (ename,lname,salary) values ('rakesh','kevat',12000);
		Select * from Student_details1;
		-- insert the identity in already created table,		
		Create table Student_details2 (id int identity, ename varchar(500),lname varchar(600),salary int)
		insert into Student_details2 (ename,lname,salary) values ('rakesh','kevat',5000);
		Select * from Student_details2;
		set identity_insert Student_details2 OFF
		insert into Student_details2 (ename,lname,salary) values ('rakesh','kevat',5000);
		set identity_insert Student_details2 ON

		


-- Set Opetrator --
			Create table Employee_Mumbai (id int,Ename varchar(100), salary int)
			Create table Employee_Delhi (id int,Ename varchar(100), salary int)
			select * from Employee_Mumbai
			union
			select * from Employee_Delhi

			select * from Employee_Mumbai
			union all 
			select * from Employee_Delhi	

			select * from Employee_Mumbai
			intersect
			select * from Employee_Delhi	

			select * from Employee_Mumbai
			except
			select * from Employee_Delhi

-- Add Primary key in table 
            create table registration_question ( question_id int not null  primary key  identity (1,1), question_ask varchar(200))

-- Add Primary key in existing table 
            ALTER TABLE registration_question ADD PRIMARY KEY (question_id);
--Primary key and foreign key
-- child foreign class id must be available in parent class.
			 -- Add primary key it table
			 Create table it (id int primary key, fname varchar(100), designation varchar(100));
			 insert into it values (1,'rakesh','information');
			 insert into it values (2,'raejesh','network'),(3,'suraj','account');
			 select * from it
			 --Add foreign key in emplyoee table
			create table employee(empid int, Ename varchar(100), salary int,
								  id int foreign key references it(id))  --child table
			--way of insert data in child "Employe" Table
			insert into employee values(10,'rakesh',40000,1),(11,'rajesh',10000,2);
			insert into employee values(10,'rakesh',40000,3);
		    insert into employee values(10,'rakesh',40000,4)  -- not allowed > 3 id not available in “it” table.
			select * from employee;
			select * from it;
			
-------------------------------------------------------------------------------------------------------------

--Joint of table  
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



----------------Select from to below Top 3 fees amount by using store procedure  ---------------------
declare @result int 
select top 2 @result = fees from Student_details order by fees desc
print @result

select * from Student_details


-------------- Procedure in table ----------------------
CREATE PROCEDURE GetProductDe
AS
BEGIN 
select * from student 
END

exec GetProductDe

---------------------------------------------------------------------------

 create procedure my 
 @student_id int
 as
 begin  
select * from student
 end 

 exec my

 ---------------------------------------------------------------------------

-- how to take backupd of table or copy the same table.

  use RealEstateDB
 
 select * from property

 select * into dbo.Employee_Backup_tbl from property   -- same database table backup file.

 select * into RegistrationDb.dbo.mydata_backup from property     -- table send to another database backup
