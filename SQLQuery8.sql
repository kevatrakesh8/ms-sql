USE [Test]
GO
/****** Object:  StoredProcedure [dbo].[SelectStudent]    Script Date: 3/19/2020 8:03:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
ALTER PROCEDURE [dbo].[SelectStudent]
	-- Add the parameters for the stored procedure here 
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here 
select * from student 
END




 ---@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@--------
 ---@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@--------
 ---@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@--------
 
  
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
 Exec spOneparameter raj
 print  @MystudentName
 --
