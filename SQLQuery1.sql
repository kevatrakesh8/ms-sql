USE [Test]
GO
/****** Object:  StoredProcedure [dbo].[spOneparameter]    Script Date: 3/19/2020 9:02:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--ALTER Procedure [dbo].[spOneparameter]
-- @MystudentName nvarchar(50)
-- As
-- Begin
--	--Select * from student where student_id like '%'+ @MystudentName + '%'
--	Select * from student where student_id = @MystudentName 
-- End

-- exec [dbo].[spOneparameter] raj 

 
ALTER Procedure [dbo].[spOneparameter]
 @MystudentName nvarchar(50)
 
 As
 Begin
	--Select * from student where student_id like '%'+ @MystudentName + '%'
	Select * from student where student_id = @MystudentName
 End

	 exec spOneparameter @MystudentName = 1

--Controller 
-- var MystudentName =  1;
--            //return View(db.students.ToList());
--           // var data = sqldb.students.SqlQuery("select * from student ").ToList();
--           // var data = sqldb.students.SqlQuery("exec SelectStudent").ToList();
--            var data = sqldb.students.SqlQuery("spOneparameter @MystudentName", new SqlParameter("MystudentName", MystudentName)).ToList();