
 use Test
 --?
 ---@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@--------
 ---@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@--------
 ---@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@--------
 
 -- Vbm Practical 1 
 -- Question : without parameter execute the function

 SELECT TOP (1000) [student_id]
      ,[student_name]
      ,[student_mail]
  FROM [Test].[dbo].[student]
  
--?
 select * from student
--?  

--Create PROCEDURE  SelectAllStudent
Alter PROCEDURE  SelectAllStudent

AS
BEGIN
       select * from student 
END

exec SelectAllStudent
 


 ---@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@--------
 ---@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@--------
 ---@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@--------
 

 -- Vbm Practical 2 
 -- Question : with 'One' parameter execute the function
 SELECT TOP (1000) [student_id]
      ,[student_name]
      ,[student_mail]
  FROM [Test].[dbo].[student]
  
--?
 select * from student
--?  
 
 --Create Procedure spOneparameter
	 Alter Procedure spOneparameter
	 @MystudentName nvarchar(50)
	 As
	 Begin
		Select * from student where student_id like '%'+ @MystudentName + '%'
	 End
 
	 Declare   @MystudentName nvarchar(50)
	 Exec spOneparameter 1
	 print  @MystudentName
 --
 --Controller 
-- var MystudentName =  1;
--            //return View(db.students.ToList());
--           // var data = sqldb.students.SqlQuery("select * from student ").ToList();
--           // var data = sqldb.students.SqlQuery("exec SelectStudent").ToList();
-

 ---@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@--------
 ---@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@--------
 ---@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@--------
 


 -- Vbm Practical 3
 ----' https://www.youtube.com/watch?v=Ah5_HOcdlq8 '
 -- Stored Procedure Output Parameter 

 SELECT TOP (1000) [student_id]
      ,[student_name]
      ,[student_mail]
  FROM [Test].[dbo].[student]
  
--?

 select * from student
--?
  
--First create Procedure  then replace line with alter create
 --Create procedure GetEmployeeById(@student_id int, @student_details varchar(50) output)
 Alter procedure GetEmployeeById(@student_id int, @student_details varchar(50) output)
 As
 Begin
 --Select * From student
 Select @student_details = student_name + '  ' + student_mail From student Where [student_id] =@student_id
 End

 Declare  @student_details varchar(50)
 Exec GetEmployeeById 1, @student_details out         -- out will return ouput
 print  @student_details

--?
-- Note :    --  '@student_id' Used for pass  the id in our Procedure 
             --  '@student_details' used for where we want show data

 