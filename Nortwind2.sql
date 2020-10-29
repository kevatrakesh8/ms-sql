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


--Section 18 --Views
--Section 19 --Indexes
--Section 20 -- Stored Procedures
--Section 21. -- Cursors
--Section 22.-- Handling Exceptions 
--Section 23 --Dynamic SQL
--Section 24 --Scalar Functions

--================================================================================================================================================================

--Section 18-- SQL Server Views(A view is a virtual table created according to the result set of an SQL statement.)

		--Create a view 
			Create View  Departments_info
			 As 
			Select * from Departments; 

		-- Rename a view 
		 -- Go to the  >>View>Rename

		--How to alter a view

			Alter View  Departments_info
			 As 
			Select * from Grade3Students; 

		---- How to Call the view
			Select * From Departments_info;
			select * From Departments_info Where DepartmentName = 'Civil';

		--How to drop a view in SQL
		   DROP VIEW IF EXISTS Departments_info;
--================================================================================================================================================================

--Section 19.
		--Indexes are special data structures associated with tables or views that help speed up the query. 
		--Server provides two types of indexes: clustered index and non-clustered index.

			--Clustered indexes – introduction to clustered indexes and learn how to create clustered indexes for tables.
			--Create nonclustered indexes – learn how to create non-clustered indexes using the CREATE INDEX statement.
			--Rename indexes – replace the current index name with the new name using sp_rename stored procedure and SQL Server Management Studio.
			--Disable indexes – show you how to disable indexes of a table to make the indexes ineffective.
			--Enable indexes – learn various statements to enable one or all indexes on a table.
			--Unique indexes – enforce the uniqueness of values in one or more columns.
			--Drop indexes – describe how to drop indexes from one or more tables.
			--Indexes with included columns – describe how to add non-key columns to a nonclustered index to improve the speed of queries.
			--Filtered indexes – learn how to create an index on a portion of rows in a table.
			--Indexes on computed columns – walk you through how to simulate function-based indexes using the indexes on computed columns.

			Create table tbl_Poly_Employee(
			ID int Primary Key,
			Name nvarchar(20),
			Gender nvarchar(25),
			Salary int
			);
			insert into tbl_Poly_Employee values 
			(1,'Suraj ','Male', 2500),
			(2,'Shubham','Male',3100),
			(3,'Shashikant', 'Male',4500),
			(4,'Rohit','Male',6500),
			(5,'Karan', 'Male',7500),
			(6,'Riya','FeMale',8500);

			select * from tbl_Poly_Employee;
			 
			--Create Index 
						Create index IX_tbl_Poly_Employee_Salary
						ON tbl_Poly_Employee(Salary ASC)
						-- location of index file
						   -- Northwind>Tables>dbo.tbl_Poly_Employee>Indexes>IX_tbl_Poly_Employee_Salary
	
						--Execution of custer index. 
						  Execute sp_helpIndex tbl_Poly_Employee  
	
						-- Always use Table name on index name.
						   sp_helpIndex tbl_Poly_Employee  

						-- Drop the index file 
						   Drop index tbl_Poly_Employee.IX_tbl_Poly_Employee_Salary 


			--Clustered indexes – introduction to clustered indexes and learn how to create clustered indexes for tables.
								Create table tbl_Poly_Employee(
								ID int Primary Key,    -- Primary key is clustered index.
								Name nvarchar(20),
								Gender nvarchar(25),
								Salary int
								);

								Create index Index_name
											 ON Table_name(Column1 Desc,Column2 ASC)  -- Create index of the table 
						
								--Examples
								Create index IX_tbl_Poly_Employee_Salary_Gender
								ON tbl_Poly_Employee(Gender Desc,Salary ASC)  -- First Gender and then Salary.
								select * from tbl_Poly_Employee;

			--Rename indexes – replace the current index name with the new name using sp_rename stored procedure and SQL Server Management Studio.
							--Path-- Northwind>Tables>dbo.tbl_Poly_Employee>Indexes>IX_tbl_Poly_Employee_Salary
		
							Create index IX_tbl_Poly_Employee_Salary_Gender_OLD
							ON tbl_Poly_Employee(Gender Desc,Salary ASC)  -- First Gender and then Salary.
							select * from tbl_Poly_Employee;
					

							EXEC sp_rename N'Table_name.Index_name1', N'Index_name2', N'INDEX';  

							--Examples
									--EXEC sp_rename 
									--	N'tbl.Index_name_Old,
									--	N'Index_name_New' ,
									--	N'INDEX'; 

									--EXEC sp_rename  
									--	N'tbl_Poly_Employee.IX_tbl_Poly_Employee_Salary_Gender_OLD',
									--	N'IX_tbl_Poly_Employee_Salary_Gender_New1',
									--	N'INDEX';
								

			--Disable indexes – show you how to disable indexes of a table to make the indexes ineffective.
								ALTER INDEX index_name
								ON table_name
								DISABLE;                   --Single index 
								--Examples 
										ALTER INDEX IX_tbl_Poly_Employee_Salary_Gender_New1
										ON tbl_Poly_Employee
										DISABLE;

										Execute sp_helpIndex tbl_Poly_Employee; 

				 
								ALTER INDEX ALL ON table_name
								DISABLE;                 -- Hole index of the table
								--Examples				
										ALTER INDEX ALL ON tbl_Poly_Employee
										DISABLE;

								Execute sp_helpIndex tbl_Poly_Employee; 
								Select * from tbl_Poly_Employee  -- it will show error because we disable the table.
			    
			--Enable indexes – learn various statements to enable one or all indexes on a table.
					ALTER INDEX index_name 
					ON table_name  
					REBUILD;
					
					--Examples
					ALTER INDEX IX_tbl_Poly_Employee_Salary_Gender_New1
					ON tbl_Poly_Employee  
					REBUILD;

					
					ALTER INDEX ALL ON tbl_Poly_Employee
					REBUILD;								-- Hole table index Enables

					Select * from tbl_Poly_Employee   -- Its values will be visible.
					Execute sp_helpIndex tbl_Poly_Employee; 

			--Drop indexes – describe how to drop indexes from one or more tables.
			
							DROP INDEX 
								Index_name1 ON TableName,
								Index_name2 ON TableName;
							--Examples
							DROP INDEX   
								IX_tbl_Poly_Employee_Salary_Gender_New1 ON tbl_Poly_Employee;

							Execute sp_helpIndex tbl_Poly_Employee; 
				 
			--Unique indexes – enforce the uniqueness of values in one or more columns.			
			--Indexes with included columns – describe how to add non-key columns to a nonclustered index to improve the speed of queries.
			--Filtered indexes – learn how to create an index on a portion of rows in a table.
			--Indexes on computed columns – walk you through how to simulate function-based indexes using the indexes on computed columns.
			 
					 
			-- Index Basic Operations.....
			   Create index Index_name
			   ON Table_name(Column1 Desc,Column2 ASC)  -- Create index of the table 

				Execute sp_helpIndex Table_name;   --Excution of index

				EXEC sp_rename N'Table_name.Index_name1', N'Index_name2', N'INDEX';    -- Rename Index
		
				ALTER INDEX index_name
					ON table_name
					DISABLE;      --Disable Index

				 ALTER INDEX index_name 
					ON table_name  
					REBUILD;     --Enable Index


				DROP INDEX [IF EXISTS] index_name
					ON table_name;     --Drop the index


--================================================================================================================================================================

--Section 20 -- Stored Procedures
			--Section A. Getting started with SQL Server Stored Procedures
					--A basic guide to stored procedures – show you how to create, execute, modify, and drop a stored procedure in SQL Server.
						--Create Procedure
						CREATE PROCEDURE sp_name
							AS
							BEGIN
								SELECT 
									c1,c2
								FROM 
									T1
								ORDER BY 
									p1;
							END;

						--EXECUTE the Procedure 
						  EXECUTE sp_name;
						 

						--Modifying(Alter) a stored procedure
						 Alter PROCEDURE sp_name
							AS
							BEGIN
								SELECT 
									c1,c2
								FROM 
									T1
								ORDER BY 
									p1;
							END;

						--Drop  the Procedure
							DROP PROCEDURE sp_name;

			  --Examples
					--Create Procedure
						Select * From Customers
						CREATE PROCEDURE sp_ShowAllCustomerData
							AS
							BEGIN
								SELECT 
									CompanyName,ContactName
								FROM 
									Customers
								ORDER BY 
									CompanyName ASC;
							END;

						--EXECUTE the Procedure       //>Northwind>Programmability>Store Procedures>sp_ShowAllCustomerData
						  EXECUTE sp_ShowAllCustomerData;
						 

						--Modifying(Alter) a stored procedure
						 	 
						ALTER PROCEDURE sp_ShowAllCustomerData
							AS
							BEGIN
								SELECT 
									CompanyName,ContactName
								FROM 
									Customers
								ORDER BY 
									CompanyName Desc;
							END;

						--Drop  the Procedure
							DROP PROCEDURE sp_ShowAllCustomerData;


					--Parameters – learn how to create stored procedures with parameters, including optional parameters.
						Select * From Orders;
						Select OrderID, ShipName from Orders Where  Freight >10 ;
						Select OrderID, ShipName, Freight, ShipVia from Orders Where  Freight >10  And ShipVia =3 ;

						-- No Parameter 
						CREATE PROCEDURE sp_FindOrders
								AS
								BEGIN
									 Select OrderID, ShipName, Freight from Orders Where  Freight >10 ;
								END;
							Exec sp_FindOrders; 

						-- One parameter
							CREATE PROCEDURE sp_FindOrders_one_parameter(@a AS DECIMAL)
								AS
								BEGIN
									 Select OrderID, ShipName, Freight from Orders Where  Freight > @a ;
								END;
							Exec sp_FindOrders_one_parameter 25;  
						-- Two Parameter 
						CREATE PROCEDURE sp_FindOrders_two_parameter(@a AS DECIMAL, @b int)
								AS
								BEGIN
									 Select OrderID, ShipName, Freight, ShipVia from Orders Where  Freight >@a  And ShipVia =@b ;
								END;
							Exec sp_FindOrders_two_parameter 10, 3;  --or
							Exec sp_FindOrders_two_parameter @a=10, @b=3;
							

					--Variables  –  introduce you to Transact-SQL variables and how to manipulate variables in stored procedures.
					--Output Parameters –-guide you on how to return data from a stored procedure back to the calling program using the output parameters.
										--The simple logic is this — If you want to return 1 value then use 1 output parameter, 
										--for returning 5 values use 5 output parameters,
										--for 10 use 10, and so on.

										Select * from orders
										Select COUNT(OrderID)  FROM Orders Where ShipVia = 3;

										ALTER PROCEDURE spGetOrderCount
												@Ship_Number nvarchar(20),
												 @Orderid_count int Output
												AS
												BEGIN
												 Select @Orderid_count = COUNT(OrderID)  FROM Orders Where ShipVia = @Ship_Number;
												END

												DECLARE @OrderTotal int
												EXECUTE spGetOrderCount 3,  @OrderTotal output
												PRINT @OrderTotal

												DECLARE @OrderTotal int
												EXECUTE spGetOrderCount @Orderid_count = @OrderTotal OUT, @Ship_Number = 3
												PRINT @OrderTotal


						



										select *  from Customers;
										Select Count(CustomerID) From Customers Where Country = 'UK';
											
										Create Procedure Sp_Customers_Count
										 @CustomerCount int OUTPUT,	
										 @Customer_Country nvarchar(20) 
										As
										BEGIN
										Select @CustomerCount = Count(CustomerID)  From Customers Where Country =  @Customer_Country ;
										SELECT @CustomerCount = @@ROWCOUNT;
										END										 


										DECLARE @count INT;
										EXEC Sp_Customers_Count
											@Customer_Country = UK,
											@CustomerCount = @count OUTPUT;
										SELECT @count AS 'Number of products found';

											
											
						--BEGIN…END – create a statement block that consists of multiple Transact-SQL statements that execute together.
						--IF ELSE – execute a statement block based on a condition.
						--WHILE – repeatedly execute a set of statements based on a condition as long as the condition is true.
						--BREAK – exit the loop immediately and skip the rest of the code after it within a loop.
						--CONTINUE – skip the current iteration of the loop immediately and continue the next one.

						--BEGIN…END – create a statement block that consists of multiple Transact-SQL statements that execute together.
						           --The following illustrates the syntax of the BEGIN...END statement:

									--BEGIN
									--    { sql_statement | statement_block}
									--END

						Example : 
								  BEGIN
									SELECT OrderID,CustomerID,Freight From Orders WHERE Freight > 10;							 
									IF @@ROWCOUNT= 0
										PRINT 'No product with price greater than 100000 found';
									END

					   Example :SELECT TOP 1 ProductName FROM Products ORDER BY	UnitPrice DESC;
								
								BEGIN
									DECLARE @name VARCHAR(MAX);

									SELECT TOP 5 @name = ProductName FROM Products ORDER BY	UnitPrice DESC;
    
										IF @@ROWCOUNT <> 0
									BEGIN
										PRINT 'The most expensive product is ' + @name
									END
										ELSE
									BEGIN
										PRINT 'No product found';
									END;
								END

					 --IF ELSE – execute a statement block based on a condition.
					 -- Select SUM(UnitPrice * Quantity) from [Order Details];
					 --Examples -
						BEGIN
							DECLARE @sales INT;
							SELECT @sales = SUM(UnitPrice * Quantity) FROM [Order Details] WHERE Discount = 0;

							IF @sales > 100
							BEGIN
								PRINT 'Great! The sales amount in 2018 is greater than 1,000,000';
							END
						END
						Example 2 : 

						BEGIN
							DECLARE @x INT = 10,
									@y INT = 20;

							IF (@x > 0)
							BEGIN
								IF (@x < @y)
									PRINT 'x > 0 and x < y';
								ELSE
									PRINT 'x > 0 and x >= y';
							END			
						END

						--WHILE – repeatedly execute a set of statements based on a condition as long as the condition is true.
						--Examples : 
								DECLARE @counter INT = 1;

									WHILE @counter <= 5
									BEGIN
										PRINT @counter;
										SET @counter = @counter + 1;
									END
						--BREAK – exit the loop immediately and skip the rest of the code after it within a loop.
						

									DECLARE @counter INT = 0;

										WHILE @counter <= 5
									BEGIN
										SET @counter = @counter + 1;
										IF @counter = 4
											BREAK;
										PRINT @counter;
									END	


					--CONTINUE – skip the current iteration of the loop immediately and continue the next one.
						--Examples : 
							DECLARE @counter INT = 0;
								WHILE @counter < 5
								BEGIN
									SET @counter = @counter + 1;
									IF @counter = 3
										CONTINUE;	
									PRINT @counter;
								END

--================================================================================================================================================================

--Section 21. Cursors
			 --Cursor  – show you how to handle cursors.
			 --Only Used for Row by Row Print.
			 -- One ID fetch next id row by row process.
			---Process:  --Declare
						 --Declare cursor_name 
						 --Select Table ID
						 --Open Cursor
						 --Fetch next ID
						 --While loop
						 --Close Courser
						 --Deallocate Courser
select *  from [Order Details];					
select Ceiling(Rand() *100);
Select OrderID, UnitPrice, Ceiling(Rand() *100)  As Discount From  [Order Details];
 
 Declare @MyID int      --Custom ID

 Declare order_cursor Cursor for
 Select OrderID From [Order Details]      

 Open order_cursor
 Fetch next from order_cursor into @MyID              

While (@@FETCH_STATUS = 0)  --USE LOOP
BEGIN
	Select OrderID, UnitPrice, Ceiling(Rand() *100)  As Discount From  [Order Details]  --Basic Query
	WHERE OrderID = @MyID; 
	Fetch next from order_cursor into @MyID           
END

Close order_cursor
DEALLOCATE order_cursor
--================================================================================================================================================================

--Section 22. Handling Exceptions
			--TRY CATCH – learn how to handle exceptions gracefully in stored procedures.
			--RAISERROR – show you how to generate user-defined error messages and return it back to the application using the same format as the system error.
			--THROW – walk you through the steps of raising an exception and transferring the execution to the CATCH block of a TRY CATCH construct.


			--TRY CATCH – learn how to handle exceptions gracefully in stored procedures.
					--The following illustrates a complete TRY CATCH construct:

					--	BEGIN TRY  
					--	   -- statements that may cause exceptions
					--	END TRY 
					--	BEGIN CATCH  
					--	   -- statements that handle exception
					--	END CATCH 

		       Examples : 
							CREATE PROC usp_divide(
								@a decimal,
								@b decimal,
								@c decimal output
							) AS
							BEGIN
								BEGIN TRY
									SET @c = @a / @b;
								END TRY
								BEGIN CATCH
									SELECT  
										 ERROR_NUMBER() AS ErrorNumber  
										,ERROR_SEVERITY() AS ErrorSeverity  
										,ERROR_STATE() AS ErrorState  
										,ERROR_PROCEDURE() AS ErrorProcedure  
										,ERROR_LINE() AS ErrorLine  
										,ERROR_MESSAGE() AS ErrorMessage;  
								END CATCH
							END;
				      GO	
			--		  Examples : 1
					    DECLARE @r decimal;
						EXEC usp_divide 10, 2, @r output;
						PRINT @r;
			--		Examples 2: 
						DECLARE @r2 decimal;
						EXEC usp_divide 10, 0, @r2 output;
						PRINT @r2;
			--		Examples 3: 			   
						CREATE TABLE sales.persons
						(
							person_id  INT
							PRIMARY KEY IDENTITY, 
							first_name NVARCHAR(100) NOT NULL, 
							last_name  NVARCHAR(100) NOT NULL
						);

						CREATE TABLE sales.deals
						(
							deal_id   INT
							PRIMARY KEY IDENTITY, 
							person_id INT NOT NULL, 
							deal_note NVARCHAR(100), 
							FOREIGN KEY(person_id) REFERENCES sales.persons(
							person_id)
						);

						insert into 
							sales.persons(first_name, last_name)
						values
							('John','Doe'),
							('Jane','Doe');

						insert into 
							sales.deals(person_id, deal_note)
						values
							(1,'Deal for John Doe');

			--		Block to report the detailed information of an error:3:  --
						CREATE PROC usp_report_error
								AS
									SELECT   
										ERROR_NUMBER() AS ErrorNumber  
										,ERROR_SEVERITY() AS ErrorSeverity  
										,ERROR_STATE() AS ErrorState  
										,ERROR_LINE () AS ErrorLine  
										,ERROR_PROCEDURE() AS ErrorProcedure  
										,ERROR_MESSAGE() AS ErrorMessage;  
								GO

			--	deletes a row from the sales.persons
						CREATE PROC usp_delete_person(
						@person_id INT
							) AS
							BEGIN
								BEGIN TRY
									BEGIN TRANSACTION;
									-- delete the person
									DELETE FROM sales.persons 
										WHERE person_id = @person_id;
									-- if DELETE succeeds, commit the transaction
									COMMIT TRANSACTION;  
								END TRY
								BEGIN CATCH
									-- report exception
									EXEC usp_report_error;
        
									-- Test if the transaction is uncommittable.  
									IF (XACT_STATE()) = -1  
									BEGIN  
										PRINT  N'The transaction is in an uncommittable state.' +  
												'Rolling back transaction.'  
										ROLLBACK TRANSACTION;  
									END;  
        
									-- Test if the transaction is committable.  
									IF (XACT_STATE()) = 1
									BEGIN
										PRINT N'The transaction is committable.' +
											'Committing transaction.' 
										COMMIT TRANSACTION;     
									END;  
								END CATCH
							END;
							GO

							EXEC usp_delete_person 2;  --row affected
							EXEC usp_delete_person 1;  --Catch error show


--================================================================================================================================================================
			 
--Section 23 --Dynamic SQL

				'SELECT * FROM Products';
				EXEC sp_executesql N'SELECT * FROM  products';

				--sp_executesql accepts the dynamic SQL as a Unicode string,
				--@table for holding the name of the table from which you want to query and 
				--@sql for holding the dynamic SQL.

				DECLARE 
					@table1 NVARCHAR(128),
					@sql1 NVARCHAR(MAX);

					SET @table1 = N'products';
					SET @sql1 = N'SELECT * FROM ' + @table1;

					DECLARE 
						@table NVARCHAR(128),
						@sql NVARCHAR(MAX);

					SET @table = N'production.products';

					SET @sql = N'SELECT * FROM ' + @table1;

					EXEC sp_executesql @sql1;
					--or
					SELECT * FROM  products;

				--Examples : 
				       CREATE OR ALTER PROC usp_query_topn(
							@table NVARCHAR(128),
							@topN INT,
							@byColumn NVARCHAR(128)
						)
						AS
						BEGIN
							DECLARE 
								@sql NVARCHAR(MAX),
								@topNStr NVARCHAR(MAX);

							SET @topNStr  = CAST(@topN as nvarchar(max));

							-- construct SQL
							SET @sql = N'SELECT TOP ' +  @topNStr  + 
										' * FROM ' + @table + 
											' ORDER BY ' + @byColumn + ' DESC';
							-- execute the SQL
							EXEC sp_executesql @sql;
    
						END;

		   --Examples :  

				CREATE OR ALTER PROC usp_query_topn(
						@table NVARCHAR(128),
						@topN INT,
						@byColumn NVARCHAR(128)
					)
					AS
					BEGIN
						DECLARE 
							@sql NVARCHAR(MAX),
							@topNStr NVARCHAR(MAX);

						SET @topNStr  = CAST(@topN as nvarchar(max));

						-- construct SQL
						SET @sql = N'SELECT TOP ' +  @topNStr  + 
									' * FROM ' + @table + 
										' ORDER BY ' + @byColumn + ' DESC';
						-- execute the SQL
						EXEC sp_executesql @sql;
    
					END;

					EXEC usp_query_topn 'products',	10, 'Unit_Price';


--================================================================================================================================================================
--Section 24 --Scalar Functions
			--User-defined scalar functions – cover the user-defined scalar functions that allow you to encapsulate complex formula or business logic and reuse them in every query.
			--Table variables – learn how to use table variables as a return value of user-defined functions.
			--Table-valued functions – introduce you to inline table-valued function and multi-statement table-valued function to develop user-defined functions that return data of table types.
			--Removing user-defined functions – learn how to drop one or more existing user-defined functions from the database.

				 -->   Section A > Creating Or Alter a scalar function : SQL Server scalar function takes one or more parameters and returns a single value.
				 --> Northwind>Programmability>Function>Scalar_valued Function>Sales.fnNetPrice
					  --Examples: CREATE OR ALTER FUNCTION [schema_name.]function_name (parameter_list)
							--RETURNS data_type AS
							--BEGIN
							--    statements
							--    RETURN value
							--END
 

							CREATE OR ALTER FUNCTION sales.fnNetPrice(
									@quantity INT,
									@UnitPrice DEC(10,2),
									@discount DEC(4,2)
								)
								RETURNS DEC(10,2)
								AS 
								BEGIN
									RETURN @quantity * @UnitPrice * (1 - @discount);
								END;
				
								--Excution (parameter) :
									SELECT sales.fnNetPrice(12,14,0) Net_profit; 

								-- called the function  :
									SELECT 
										OrderID, 
										SUM(sales.fnNetPrice(quantity, UnitPrice, discount)) net_amount
									FROM 
										[Order Details]
									GROUP BY 
										OrderID
									ORDER BY
										net_amount DESC;

			-->   B> Removing  a scalar function
			         --DROP FUNCTION [schema_name.]function_name;
			           DROP FUNCTION sales.udfNetSale;
		--Sec A	-- Table variable : Table variables are kinds of variables that allow you to hold rows of data, which are similar to temporary tables.
			--// https://www.sqlshack.com/the-table-variable-in-sql-server/
			--its same as Temp table but not similar to Temp Table. 
					   DECLARE @Department TABLE
						(DepartmentID INT PRIMARY KEY,
						DepName VARCHAR(40) UNIQUE)
        
						INSERT INTO @Department VALUES(1,'Marketing')
						INSERT INTO @Department VALUES(2,'Finance')
						INSERT INTO @Department VALUES(3,'Operations ')
        
						DECLARE @Employee TABLE
						(EmployeeID INT PRIMARY KEY IDENTITY(1,1),
						EmployeeName VARCHAR(40),
						DepartmentID VARCHAR(40))
        
						INSERT INTO @Employee VALUES('Jodie Holloway','1')
						INSERT INTO @Employee VALUES('Victoria Lyons','2')
						INSERT INTO @Employee VALUES('Callum Lee','3')
        
						select * from @Department Dep inner join @Employee Emp
						on Dep.DepartmentID = Emp.DepartmentID




						-- You cannot used turn turncate  to delete this 'table variable' Because this is not permanent table its.
						--Can't use Turncate syntaxt 
						--Can't use   explicit index
						--created index 
					 	DECLARE @TestTable TABLE
						(
							Col1 INT NOT NULL PRIMARY KEY ,
							Col2 INT NOT NULL INDEX Cluster_I1 (Col1,Col2),
							Col3 INT NOT NULL UNIQUE
						)
        
        
						SELECT 
						ind.name,type_desc
						FROM 
							 tempdb.sys.indexes ind 
        
						where ind.object_id=(
						SELECT OBJECT_ID FROM tempdb.sys.objects obj WHERE obj.name  IN (
						SELECT TABLE_NAME FROM tempdb.INFORMATION_SCHEMA.COLUMNS 
						WHERE  (COLUMN_NAME = 'Col1' OR COLUMN_NAME='Col2' OR COLUMN_NAME='Col3')

			   --Table-valued functions – introduce you to inline table-valued function and multi-statement table-valued function to develop user-defined functions that return data of table types.
					 --learn how to use SQL Server table-valued function including inline table-valued function and multi-statement valued functions.
						--A table-valued function is a user-defined function that returns data of a table type.
						--The return type of a table-valued function is a table, therefore,
						--you can use the table-valued function just like you would use a table.
					 --Examples 
						   -- Create a function and call the fucntion.
						   -->>rogrammability > Functions > Table-valued Functions
						   --Keyword : udf(User Define Funcion)
						   --eg. Show the list of the order on "ShipVia tool "
						      Select * FROM Orders where ShipVia= 1;
							Create or   alter FUNCTION udfOrderInYear (
									@model_year INT
								)
								RETURNS TABLE
								AS
								RETURN
							    Select * FROM Orders where ShipVia = @model_year; 

								---EXCE
								SELECT * FROM udfOrderInYear(1);
                        
						
						--Removing user-defined functions – learn how to drop one or more existing user-defined functions from the database.
						--DROP FUNCTION statement	
						-- DROP FUNCTION [ IF EXISTS ] [ schema_name. ] function_name;
						
						--Exmp
						--DROP FUNCTION [IF EXISTS] 
						--schema_name.function_name1, 
						--schema_name.function_name2,
						--...;

						DROP FUNCTION IF EXISTS  [dbo].[udfOrderInYear];





