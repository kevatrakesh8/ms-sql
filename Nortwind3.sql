use northwind;	
select *  from Customers;
select *  from Categories;
select *  from CustomerCustomerDemo;
select *  from CustomerDemographics;
select *  from Categories;
select *  from Employees;
select *  from EmployeeTerritories;
select *  from [Order Details];
select *  from Orders;
select *  from Products;
select *  from Region;
select *  from Shippers;
select *  from Suppliers;
select *  from Territories;


--Section 18 --Triggers
--Section 19 --Aggregate Functions 
--Section 20 -- String Functions


--Section 18 --Triggers
					--   Triggers are special stored procedures that are executed automatically in response to the database object, database, 
					--   and server events. SQL Server provides three type of triggers: 

						--SQL Server triggers are special stored procedures that are executed automatically in response to the database object, database, and server events. SQL Server provides three type of triggers:

						--Data manipulation language (DML) triggers which are invoked automatically in response to INSERT, UPDATE, and DELETE events against tables.
						--Data definition language (DDL) triggers which fire in response to CREATE, ALTER, and DROP statements. DDL triggers also fire in response to some system stored procedures that perform DDL-like operations.
						--Logon triggers which fire in response to LOGON events
						--In this section, you will learn how to effectively use triggers in SQL Server.

						--Creating a trigger in SQL Server – show you how to create a trigger in response to insert and delete events.
						--Creating an INSTEAD OF trigger – learn about the INSTEAD OF trigger and its practical applications.
						--Creating a DDL trigger – learn how to create a DDL trigger to monitor the changes made to the structures of database objects such as tables, views, and indexes.
						--Disabling triggers – learn how to disable a trigger of a table temporarily so that it does not fire when associated events occur.
						--Enabling triggers – show you how to enable a trigger.
						--Viewing the definition of a trigger – provide you with various ways to view the definition of a trigger.
						--Listing all triggers in SQL Server – show you how to list all triggers in a SQL Server by querying data from the sys.triggers view.
						--Removing triggers – guide you how to drop one or more existing trigger.


						-- Note : what ever process do in one table that process maintained in another table that is kown as trigger (insert, Drop,Update data)
						        -- all data store in another table t2
								-->> northwind>Table>TblEmployee>Trigger>trgAfterInsert
						--A--Creating a trigger in SQL Server – show you how to create a trigger in response to insert and delete events.
						
								 CREATE TABLE tblemployee(Emp_ID INT Identity,Emp_name Varchar(100),Emp_Sal Decimal (10,2))
									INSERT INTO tblemployee VALUES ('Anand',15000);
									INSERT INTO tblemployee VALUES ('Neha',12400);
									INSERT INTO tblemployee VALUES ('Sohan',11500);
									INSERT INTO tblemployee  VALUES ('Vijay',15500);
									INSERT INTO tblemployee VALUES ('Sapna',14000); 

									CREATE TABLE Employee_Log(Emp_ID int,Emp_name varchar(100),Emp_Sal decimal (10,2),Log_Action varchar(100),log_Timestamp datetime);

									Select * from tblEmployee;
									Select * from Employee_Log;


									CREATE TRIGGER trgAfterInsert ON tblemployee     -- Trigger after insert data 
									After  INSERT
									AS
									 declare @empid int
									 declare @empname varchar(100)
									 declare @empsal decimal(10,2)
									 declare @log_action varchar(100)

									 select @empid=i.Emp_ID, @empname=i.Emp_Name, @empsal=i.Emp_Sal from inserted i; 
									 set @log_action='Inserted Record -- After Insert Trigger.';

									 insert into Employee_log
											   (Emp_ID,Emp_Name,Emp_Sal,Log_Action,Log_Timestamp) 
									 values(@empid,@empname,@empsal,@log_action,getdate());

									 PRINT 'AFTER INSERT trigger fired.'
									GO



									INSERT INTO tblemployee VALUES ('suman',48000)  -- When insert the records.
									Select * from tblEmployee;
									Select * from Employee_Log;
									--====================================================================================

									CREATE TRIGGER trgAfterUpdate ON tblemployee  -- After Update the trigger 
									After UPDATE
									AS
									 declare @empid int;
									 declare @empname varchar(100);
									 declare @empsal decimal(10,2);
									 declare @log_action varchar(100);

									 select @empid=i.Emp_ID, @empname=i.Emp_Name, @empsal=i.Emp_Sal from inserted i; 
									  
 
									 if update(Emp_Name)
									  set @log_action='Updated Record -- After Update Trigger.';
									 if update(Emp_Sal)
									  set @log_action='Updated Record -- After Update Trigger.';

									 insert into Employee_Log(Emp_ID,Emp_Name,Emp_Sal,Log_Action,Log_Timestamp) 
									 values(@empid,@empname,@empsal,@log_action,getdate());

									 PRINT 'AFTER UPDATE Trigger fired.'
									GO

									INSERT INTO tblemployee VALUES ('suraj',4000)  -- When insert the records.
									update tblemployee set Emp_name = 'Shravan' where Emp_ID = 5;  -- when update the previouse inserted data.
									Select * from tblEmployee;
									Select * from Employee_Log;
									--======================================================================================================
									CREATE TRIGGER trgAfterDelete ON tblemployee 
									AFTER DELETE
									AS
									 declare @empid int;
									 declare @empname varchar(100);
									 declare @empsal decimal(10,2);
									 declare @log_action varchar(100);

									 select @empid=d.Emp_ID, @empname=d.Emp_Name, @empsal=d.Emp_Sal from deleted d;  
									 set @log_action='Deleted -- After Delete Trigger.';

									 insert into Employee_log
									(Emp_ID,Emp_Name,Emp_Sal,Log_Action,Log_Timestamp) 
									 values(@empid,@empname,@empsal,@Log_action,getdate());

									 PRINT 'AFTER DELETE TRIGGER fired.'
									GO


									INSERT INTO tblemployee VALUES ('suraj',4000);  -- When insert the records.
									update tblemployee set Emp_name = 'Shravan' where Emp_ID = 5;  -- when update the previouse inserted data.
									INSERT INTO tblemployee VALUES ('Isha',40000);
									delete tblemployee where Emp_ID = 6 and Emp_ID =7; --When delete the records 
									delete tblemployee where  Emp_ID =7;   --When delete the records 
									
									Select * from tblEmployee;
									Select * from Employee_Log; 
						
						--B--Creating an INSTEAD OF trigger – learn about the INSTEAD OF trigger and its practical applications.
							  -- INSTEAD OF : not allow to (rather then this) insert,update,delete;
							   CREATE TABLE tblEmployees(Emp_ID INT Identity,Emp_name Varchar(100),Emp_Sal Decimal (10,2))
									INSERT INTO tblEmployees VALUES ('Anand',15000);
									INSERT INTO tblEmployees VALUES ('Neha',12400);
									INSERT INTO tblEmployees VALUES ('Sohan',11500);
									INSERT INTO tblEmployees  VALUES ('Vijay',15500);
									INSERT INTO tblEmployees VALUES ('Sapna',14000); 
									 
									Select * from tblEmployees; 
									
									--CREATE TRIGGER [schema_name.] trigger_name
									--	ON {table_name | view_name }
									--	INSTEAD OF {[INSERT] [,] [UPDATE] [,] [DELETE] }
									--	AS
									--	{sql_statements}
									 Create trigger tr_Employees_InsteatedOf_Insert
									 on tblEmployees
									 instead of insert
									 as
									 begin
										print 'You are not allowed to insert data in this table '
									 end

									 
									INSERT INTO tblEmployees VALUES ('Rangeet',850000);  -- you can't insert this values in the table.									
									Select * from tblEmployees; -- same data will get.
									=============================================================================================

									 Create trigger tr_Employees_InsteatedOf_Update    -- you can't Update this values in the table.
									 on tblEmployees
									 instead of Update
									 as
									 begin
										print 'You are not allowed to Update data in this table '
									 end

									 
									update tblEmployees set Emp_name = 'rajesh' where Emp_ID = 1;
									Select * from tblEmployees; -- same data will get.
									===========================================================================================
									 Create trigger tr_Employees_InsteatedOf_Delete    -- you can't Update this values in the table.
									 on tblEmployees
									 instead of Delete
									 as
									 begin
										print 'You are not allowed to Delete data in this table '
									 end

									 delete from tblEmployees where Emp_ID = 5;
									Select * from tblEmployees; -- same data will get.
									===========================================================================================
									--Note : Alter trigger (perfrom one or many task like insert and update and delete)
									   --    Insted trigger (Perform only on task like insert or update or delete)

									   
		--------------------------Instead of Triggger:
									Create table Employees_Audit_table( Audit_ID int Primary key identity , Audit_informantion varchar(Max));
									Select * from Employees_Audit_table;


									Create trigger tr_Employees_InsteatedOf_Insert_Audit   
									 on tblEmployees                                      -- Drop this table insert command Trigger then only this application runs.
									 instead of insert
									 as
									 begin
										 insert into  Employees_Audit_table values ('Someone tries to insert data in the Employee Table at:' + Cast(getdate()as nvarchar(50))); 
									 end
									 
									Drop Trigger tr_Employees_InsteatedOf_Insert;-- One table cannot prefor two insert query of the triggers.
									 
									INSERT INTO tblEmployees VALUES ('Rangeet',850000);  -- you can't insert this values in the table.									
									Select * from tblEmployees; -- same data will get.
									Select * from Employees_Audit_table; -- same data will get.

									=============================================================================================

									 Create trigger tr_Employees_InsteatedOf_Update_Audit    -- you can't Update this values in the table.
									 on tblEmployees
									 instead of Update
									 as
									 begin
										insert into  Employees_Audit_table values ('Someone tries to Update data in the Employee Table at:' + Cast(getdate()as nvarchar(50))); 
									 end

									Drop Trigger tr_Employees_InsteatedOf_Update;-- One table cannot prefor two insert query of the triggers.
									 
									update tblEmployees set Emp_name = 'rajesh' where Emp_ID = 1;
									Select * from tblEmployees; -- same data will get.
									Select * from Employees_Audit_table; -- same data will get.

									===========================================================================================
									 Create trigger tr_Employees_InsteatedOf_Delete_Audit    -- you can't Update this values in the table.
									 on tblEmployees
									 instead of Delete
									 as
									 begin
										insert into  Employees_Audit_table values ('Someone tries to Delete data in the Employee Table at:' + Cast(getdate()as nvarchar(50))); 
									 end
                                     

									Drop Trigger tr_Employees_InsteatedOf_Delete;-- One table cannot prefor two insert query of the triggers.

									delete from tblEmployees where Emp_ID = 2;
									Select * from tblEmployees; -- same data will get.
									Select * from Employees_Audit_table; -- same data will get.
									 
									sp_helptext tr_Employees_InsteatedOf_Insert; --- Any one operation perform...
									sp_helptext tr_Employees_InsteatedOf_Update;
									sp_helptext tr_Employees_InsteatedOf_Delete;
									or
									sp_helptext tr_Employees_InsteatedOf_Insert_Audit;
									sp_helptext tr_Employees_InsteatedOf_Update_Audit;
									sp_helptext tr_Employees_InsteatedOf_Delete_Audit;

									
									===========================================================================================
									--Enable trigger 
									ENABLE TRIGGER tr_Employees_InsteatedOf_Insert_Audit
									ON tblEmployees;

									ENABLE TRIGGER ALL ON tblEmployees;

									--Disable trigger 
									Disable TRIGGER tr_Employees_InsteatedOf_Insert_Audit
									ON tblEmployees;

									Disable TRIGGER ALL ON tblEmployees;


									--List of triger which is created.
                                    SELECT  name, is_instead_of_trigger FROM  sys.triggers  WHERE  type = 'TR';

									--Drop the trigger
									Drop trigger tr_Employees_InsteatedOf_Delete_Audit;


--Section 19 --Aggregate Functions 
				--1.  AVG()
				--2.  CHECKSUM_AGG()
				--3.  COUNT()
				--4.  COUNT_BIG()
				--5.  Max()
				--6.  Min()
				--7.  STDEV()
				--8.  STDEVP() 
				--9.  SUM() 
				--10. VAR() 
				--11. VARP()


				--1.  AVG()  : Total product count /number of item.
				
					select *  from Products;
					Select AVG(SupplierID) From Products;

			--2.  CHECKSUM_AGG() :

					select *  from Products;
					Select CHECKSUM_AGG(SupplierID) From Products;

		   --3.  COUNT() :  Counting
		            select *  from Products;
					Select COUNT(SupplierID) From Products;

		   --4.  COUNT_BIG() : 
		            select *  from Products;
					Select COUNT_BIG(SupplierID) From Products;
			--5.  Max()  : Max Value		 		
		            select *  from Products;
					Select Max(SupplierID) From Products;

			--6.  Min()	: Min value	 	
		            select *  from Products;
					Select Min(SupplierID) From Products;

			--7.  STDEV()
					select *  from Products;
					Select CAST(ROUND(STDEV(UnitPrice),2) as DEC(10,2)) stdevUnitPrice From Products;

			--8.  STDEVP()  : Division by 2
					select *  from Products;
					Select CAST(ROUND(STDEVP(UnitPrice),2) as DEC(10,2)) stdevUnitPrice From Products;

			--9.  SUM()  : total sum
			        select *  from Products;
					Select SUM(UnitPrice) as Total_Price From Products;

					
			--10. VAR() 
			        select *  from Products;
					Select VAR(UnitPrice) as Total_Price From Products;

					
			--11. VARP()
			        select *  from Products;
					Select VARP(UnitPrice) as Total_Price From Products;

						 
						  
--Section 20 -- Date Functions
				
