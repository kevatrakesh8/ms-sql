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

														 