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

--"Basic MS SQL query Index"
--Section 1. Querying data
--Section 2. Sorting data
--Section 3. Limiting rows
--Section 4. Filtering data
--Section 5. Joining tables
--Section 6. Grouping data
-- Section 7. Subquery
--Section 8. Set Operators
--Section 9. Common Table Expression (CTE)
--Section 10. Pivot
--Section 11. Modifying data
--Section 12. Data definition
--Section 13. SQL Server Data Types
--Section 14. Constraints
--Section 15. Expressions
--Section 16. Useful Tips



--Section 1. Querying data
	--Select the data from the table 
	select FirstName,LastName, city from  Employees;
	select CompanyName, Address from Customers;
===============================================================================================

--Section 2. Sorting data
	--sort the result set based on values in a specified list of columns
	select FirstName,LastName, city from  Employees Order By FirstName ASC ;
	select CompanyName, Address from Customers Order By CompanyName Desc;
===============================================================================================

--Section 3. Limiting rows
	--OFFSET FETCH – limit the number of rows returned by a query.
		select *  from EmployeeTerritories;
		select *  from EmployeeTerritories ORDER BY TerritoryID  OFFSET 10 rows;
		select *  from EmployeeTerritories ORDER BY TerritoryID  OFFSET 10 rows
												             FETCH NEXT 10 ROWS ONLY;  -- Remove starting 10 Lines and show only next 10 Records;

    --SELECT TOP – limit the number of rows or percentage of rows returned in a query’s result set.
	   select TOP 4 FirstName,LastName, city from  Employees Order By FirstName ASC ;
	   select tOP 6 CompanyName, Address from Customers Order By CompanyName Desc;
=====================================================================================================

--Section 4. Filtering data	
	--DISTINCT  – select distinct values in one or more columns of a table.
	SELECT DISTINCT FirstName,LastName, city FROM  Employees ORDER BY FirstName ASC ;
	SELECT DISTINCT CompanyName, Address FROM Customers ORDER BY  CompanyName DESC;

	--WHERE – filter rows in the output of a query based on one or more conditions.
	 SELECT FirstName,LastName, city FROM  Employees WHERE City = 'London' ORDER BY FirstName ASC ;
	 SELECT CompanyName, Address, Country FROM Customers WHERE Country ='UK' ORDER BY  CompanyName DESC;

	--AND – combine two Boolean expressions and return true if all expressions are true.
		 SELECT FirstName,LastName, city, Country FROM  Employees WHERE City = 'London' AND Country ='UK'  ORDER BY FirstName ASC ;
		 SELECT CompanyName, Address, Country FROM Customers WHERE Country ='USA' AND ContactTitle = 'owner' ORDER BY  CompanyName DESC;

	--OR–  combine two Boolean expressions and return true if either of conditions is true.
		 SELECT FirstName,LastName, city, Country FROM  Employees WHERE City = 'London' OR Country ='UK'  ORDER BY FirstName ASC ;
		 SELECT CompanyName, Address, Country FROM Customers WHERE Country ='USA' OR ContactTitle = 'owner' ORDER BY  CompanyName DESC;
		 SELECT FirstName,LastName, city, Country FROM  Employees WHERE (City = 'London' AND City = 'Tacoma')  OR Country ='UK'  ORDER BY FirstName ASC ;
		 
	--IN – check whether a value matches any value in a list or a subquery.
		SELECT *  FROM [Order Details] WHERE Quantity IN (10,12,14,18,20,25,40,30) ORDER BY OrderID ASC;
		SELECT FirstName,LastName, city FROM  Employees WHERE City  IN ('London','Tacoma','Seattle') ORDER BY FirstName ASC ;
		SELECT CompanyName, Address, Country FROM Customers WHERE Country  IN ('UK','France','Spain') ORDER BY  CompanyName DESC;

	--BETWEEN – test if a value is between a range of values.
		SELECT *  FROM [Order Details] WHERE Quantity BETWEEN 10 AND 15 ORDER BY OrderID ASC;
		SELECT *  FROM Orders WHERE OrderDate BETWEEN CONVERT(datetime,'1996-07-10 00:00:00.000') AND CONVERT(datetime,'1996-07-23 00:00:00.000');

	--LIKE  –  check if a character string matches a specified pattern.
		--The percent wildcard (%): any string of zero or more characters.
		--The underscore (_) wildcard: any single character.
		--The [list of characters] wildcard: any single character within the specified set.
		--The [character-character]: any single character within the specified range.
		--The [^]: any single character not within a list or a range.

		SELECT * From Customers WHERE CompanyName LIKE 'A%';    -- Start with Name of 'A' charactor.
		SELECT * From Customers WHERE CompanyName LIKE '%s';    -- END with Name of 's' charactor.
		SELECT * From Customers WHERE CompanyName LIKE 'F%S';   -- Start with 'F' And End with 'S' charactors.
		SELECT * From Customers WHERE CompanyName LIKE '_u%';   -- Second word with 'u' charactor.
		SELECT * From Customers WHERE CompanyName LIKE '__u%';  -- Third word with 'u' charactor.
		SELECT * From Customers WHERE CompanyName LIKE '[ABF]%';  -- represents a single character that must be one of the characters specified in the list.
		SELECT * From Customers WHERE CompanyName LIKE '[A-F]%';  -- single character that must be within a specified range.
		SELECT * From Customers WHERE CompanyName LIKE '[^A-B]%';  -- character list e.g., [ABC] represent a single character that is not in the specified range or character list.
		SELECT * From Customers WHERE CompanyName NOT LIKE 'A%';    -- Do not Start with Name of 'A' charactor.

	--Column & table aliases – show you how to use column aliases to change the heading of the query output and table alias to improve the readability of a query.
		 SELECT FirstName + '' + LastName AS Full_Name FROM  Employees WHERE City = 'London' AND Country ='UK'  ORDER BY FirstName ASC;
		
--Section 5. Joining tables
		--INNER JOIN – select rows from a table that have matching rows in another table.
		--LEFT JOIN – return all rows from the left table and matching rows from the right table. In case the right table does not have the matching rows, use null values for the column values from the right table.
		--RIGHT JOIN – learn a reversed version of the left join.
		--FULL OUTER JOIN – return matching rows from both left and right tables, and rows from each side if no matching rows exist.
		--CROSS JOIN – join multiple unrelated tables and create Cartesian products of rows in the joined tables.
		--Self join – show you how to use the self-join to query hierarchical data and compare rows within the same table.

	
		--INNER JOIN –	
		SELECT * FROM  Employees;
	    SELECT * FROM Orders;
		SELECT e.FirstName, e.LastName, o.ShipName, o.ShipCountry FROM Employees e INNER JOIN Orders o ON e.EmployeeID = o.EmployeeID;
		
		--LEFT JOIN –	
		SELECT e.FirstName, e.LastName, o.ShipName, o.ShipCountry FROM Employees e LEFT JOIN Orders o ON e.EmployeeID = o.EmployeeID;
		
		--RIGHT JOIN –
		SELECT e.FirstName, e.LastName, o.ShipName, o.ShipCountry FROM Employees e RIGHT JOIN Orders o ON e.EmployeeID = o.EmployeeID;
		
		--FULL OUTER JOIN –
		SELECT e.FirstName, e.LastName, o.ShipName, o.ShipCountry FROM Employees e FULL OUTER JOIN Orders o ON e.EmployeeID = o.EmployeeID;
		
		--CROSS JOIN--
		SELECT FirstName, LastName, ShipName, ShipCountry FROM Employees CROSS JOIN Orders;  
		
		--Self join –
		SELECT FirstName + ''+ LastName FullName, ShipName, ShipCountry FROM Employees CROSS JOIN Orders;  
		
--Section 6. Grouping data
	--GROUP BY– group the query result based on the values in a specified list of column expressions.
	--HAVING – specify a search condition for a group or an aggregate.
	 
	--Group By--(selected and Group parameter should be same. )
	SELECT CustomerId, ContactTitle FROM Customers WHERE City  IN ('London','Tacoma','Seattle') GROUP BY ContactTitle,CustomerId ORDER BY ContactTitle;
	SELECT Title,City FROM EmployeeS WHERE City  IN ('London','Tacoma','Seattle') GROUP BY Title,City ORDER BY City;
 	
	Select * From Orders
	Select ShipName From Orders GROUP BY ShipName;
	Select Count(OrderID), ShipName From Orders GROUP BY ShipName;

	--HAVING –The following SQL statement lists the number of customers in each country. Only include countries with more than 5 customers:
	SELECT Count(CustomerID) as CustomerCount, Country FROM Customers GROUP BY Country;
	SELECT COUNT(CustomerID), Country FROM Customers GROUP BY Country HAVING COUNT(CustomerID) > 5; 
	
	Select * From Orders
	Select ShipName From Orders GROUP BY ShipName;
	Select Count(OrderID), ShipName From Orders GROUP BY ShipName;


-- Section 7. Subquery
	--Subquery – explain the subquery concept and show you how to use various subquery type to select data.
	--Correlated subquery – introduce you to the correlated subquery concept.
	--EXISTS – test for the existence of rows returned by a subquery.
	--ANY – compare a value with a single-column set of values returned by a subquery and return TRUE the value matches any value in the set.
	--ALL – compare a value with a single-column set of values returned by a subquery and return TRUE the value matches all values in the set.
	--Subquery –
	Select * From Customers;  
	Select  Country From Customers GROUP BY Country;
	Select  CustomerID From Customers Where Country = 'USA';
	select * From Orders
	Select CustomerID, EmployeeID From Orders Where CustomerID IN ( Select  CustomerID From Customers Where Country = 'USA');  -- above the statement data.
	
	--EXISTS – {WHERE EXISTS ( subquery )};
	  DELETE FROM contacts
WHERE EXISTS (SELECT *
              FROM employees
              WHERE employees.last_name = contacts.last_name);  P -- Dont Use this command. 
		
	----ANY – 
	Select CustomerID, CompanyName,City From Customers Where CustomerID  = 'ANTON'
	Select CustomerID From Orders Where Freight > 50;
	--<BR>
	Select CustomerID, CompanyName,City From Customers Where CustomerID  = ANY(Select CustomerID From Orders Where Freight > 50)
	
	--ALL –	
	 Select * From Orders Where Freight < 50; 
	 Select  Freight From Orders Where Freight > 50;
	 --<BR>--
	Select * From Orders Where Freight < ALL(Select  Freight From Orders Where Freight > 50 );	  

--Section 8. Set Operators;
            --UNION – combine the result sets of two or more queries into a single result set.
			Select CustomerID From Customers UNION Select  CustomerID From Orders;

			--INTERSECT – return the intersection of the result sets of two or more queries.
			Select CustomerID From Customers INTERSECT Select  CustomerID From Orders;

			--EXCEPT – find the difference between the two result sets of two input queries.
			Select CustomerID From Customers EXCEPT Select  CustomerID From Orders;
 
--Section 11. Modifying data
  --DDL Command 
		-- Create Database 
			CREATE DATABASE TestDb;
			DROP DATABASE IF EXISTS TestDb;

-- Create Table--

		CREATE TABLE sales.visits (
			visit_id INT PRIMARY KEY IDENTITY (1, 1),
			first_name VARCHAR (50) NOT NULL,
			last_name VARCHAR (50) NOT NULL,
			visited_at DATETIME,
			phone VARCHAR(20),
			store_id INT NOT NULL,
			FOREIGN KEY (store_id) REFERENCES sales.stores (store_id)
		);	

		--</BR>-- Crete the table 
		CREATE TABLE marketing.visits (
			visit_id INT PRIMARY KEY IDENTITY (1, 1),
			first_name VARCHAR (50) NOT NULL,
			last_name VARCHAR (50) NOT NULL,
			visited_at DATETIME,
			phone VARCHAR(20),
			store_id INT NOT NULL
		);
		EXEC sp_rename 'T1', 'T2'; -- Rename the table 
		DROP TABLE T1; -- Drop the table 
		

		ALTER TABLE T1 ADD C VARCHAR (255) NOT NULL;    -- Add the column in the table 
		ALTER TABLE T1 ALTER COLUMN C VARCHAR (50);  -- Change the variable size of the table.
		EXEC sp_RENAME 'table_name.old_name', 'new_name', 'COLUMN'
		EXEC sp_RENAME 'T.C', 'Cn', 'COLUMN'        -- Rename the collumn of the table.
		ALTER TABLE T1 DROP COLUMN C,D;             -- Drop the column of the table. 
		TRUNCATE TABLE T1;                          -- Remove all the data of the talbe.


		CREATE SCHEMA marketing;                     ---Create new schema "Norhtwind>Security>Marketing".
		GO
		CREATE SCHEMA marketing;                     ---Create new schema "Norhtwind>Security>Sales".
		CREATE SCHEMA Sales;					 
		GO		
		Select * INTO Sales.Myvisits From marketing.visits;   -- One table data moves to another tables. 
		   
		 

  --DMLComman--
		--INSERT 
		INSERT INTO javatpoint (Author, Subject) VALUES ("Sonoo", "DBMS");  
		--UPDATE--
		UPDATE students  SET User_Name = 'Sonoo'  WHERE Student_Id = '3';
		--Delete 
		DELETE FROM javatpoint WHERE Author="Sonoo";  
  -- DCL Command --
	DCL commands are used to grant and take back authority from any database user.
	Here are some commands that come under DCL:
	Grant	
	Revoke
	--Command 
    REVOKE SELECT, UPDATE ON MY_TABLE FROM USER1, USER2;  


--Section 14. Constraints
		--Primary key  – explain you to the primary key concept and show you how to use the primary key constraint to manage a primary key of a table.
		CREATE TABLE sales.activities (
				activity_id INT PRIMARY KEY IDENTITY,
				activity_name VARCHAR (255) NOT NULL,
				activity_date DATE NOT NULL
			);
		--Foreign key – introduce you to the foreign key concept and show you use the FOREIGN KEY constraint to enforce the link of data in two tables.
			CREATE TABLE sales.visits (
			visit_id INT PRIMARY KEY IDENTITY (1, 1),
			first_name VARCHAR (50) NOT NULL,
			last_name VARCHAR (50) NOT NULL,
			visited_at DATETIME,
			phone VARCHAR(20),
			store_id INT NOT NULL,
			FOREIGN KEY (store_id) REFERENCES sales.stores (store_id)
		);
		
		--NOT NULL constraint – show you how to ensure a column not to accept NULL.
		--Create Not Null data 
		CREATE TABLE hr.persons(
				person_id INT IDENTITY PRIMARY KEY,
				first_name VARCHAR(255) NOT NULL,
				last_name VARCHAR(255) NOT NULL,
				email VARCHAR(255) NOT NULL,
				phone VARCHAR(20)
			);
	 --Add NOT NULL constraint to an existing column
			UPDATE table_name
			SET column_name = <value>
			WHERE column_name IS NULL;
			--or
			ALTER TABLE table_name
			ALTER COLUMN column_name data_type NOT NULL;
			
	 --Removing NOT NULL constraint
			ALTER TABLE hr.pesons
			ALTER COLUMN phone VARCHAR(20) NULL;

		--UNIQUE constraint – ensure that data contained in a column, or a group of columns, is unique among rows in a table.
		CREATE TABLE hr.persons(
			person_id INT IDENTITY PRIMARY KEY,
			first_name VARCHAR(255) NOT NULL,
			last_name VARCHAR(255) NOT NULL,
			email VARCHAR(255) UNIQUE
		);
		--or
		CREATE TABLE hr.person_skills (
			id INT IDENTITY PRIMARY KEY,
			person_id int,
			skill_id int,
			updated_at DATETIME,
			UNIQUE (person_id, skill_id)
		);

		-- Alter the table 
				ALTER TABLE hr.persons
		ADD CONSTRAINT unique_email UNIQUE(email);
		
		--Delete UNIQUE constraints 
		ALTER TABLE table_name
		DROP CONSTRAINT constraint_name;

		--CHECK constraint – walk you through the process of adding logic for checking data before storing them in tables.
		CREATE TABLE test.products(
			product_id INT IDENTITY PRIMARY KEY,
			product_name VARCHAR(255) NOT NULL,
			unit_price DEC(10,2) CHECK(unit_price > 0),
			discounted_price DEC(10,2) CHECK(discounted_price > 0),
			CHECK(discounted_price < unit_price)
		);

		--or --
		CREATE TABLE test.products(
			product_id INT IDENTITY PRIMARY KEY,
			product_name VARCHAR(255) NOT NULL,
			unit_price DEC(10,2),
			discounted_price DEC(10,2),
			CHECK(unit_price > 0),
			CHECK(discounted_price > 0),
			CONSTRAINT valid_prices CHECK(discounted_price > unit_price)
		);

		--OR
		--Add CHECK constraints to an existing table
		ALTER TABLE test.products
		ADD CONSTRAINT positive_price CHECK(unit_price > 0);

		--Remove CHECK constraints
			ALTER TABLE table_name
			DROP CONSTRAINT constraint_name;

		--Disable CHECK constraints for insert or update
			ALTER TABLE test.products
			NO CHECK CONSTRAINT valid_price;

--Section 15. Expressions
				--A--CASE – add if-else logic to SQL queries by using simple and searched CASE expressions.
				   SELECT    
					EmployeeID, 
					COUNT(OrderID) order_count FROM orders WHERE YEAR(OrderDate) = 1996 GROUP BY EmployeeID;


					-- Case Statement 
					SELECT  
					EmployeeID, 
					CASE EmployeeID
						WHEN 1 THEN 'Pending'
						WHEN 2 THEN 'Processing'
						WHEN 3 THEN 'Rejected'
						WHEN 4 THEN 'Completed'
					END AS EmployeeID,
					COUNT(OrderID) order_count FROM orders WHERE YEAR(OrderDate) = 1996 GROUP BY EmployeeID;
				--B-- Using simple CASE expression in aggregate function example
				 SELECT    
					SUM(CASE
							WHEN EmployeeID = 1
							THEN 1
							ELSE 0
						END) AS 'Pending', 
					SUM(CASE
							WHEN EmployeeID = 2
							THEN 1
							ELSE 0
						END) AS 'Processing', 
					SUM(CASE
							WHEN EmployeeID = 3
							THEN 1
							ELSE 0
						END) AS 'Rejected', 
					SUM(CASE
							WHEN EmployeeID = 4
							THEN 1
							ELSE 0
						END) AS 'Completed', 
					COUNT(*) AS Total
				FROM  orders WHERE     YEAR(OrderDate) = 1996;

				-- OR --A) Using searched CASE expression in the SELECT clause
					SELECT    
					id.ProductID, 
					SUM(id.UnitPrice * Quantity) order_value,
					CASE
						WHEN SUM(id.UnitPrice * Quantity) <= 500 
							THEN 'Very Low'
						WHEN SUM(id.UnitPrice * Quantity) > 500 AND 
							SUM(id.UnitPrice * Quantity) <= 1000 
							THEN 'Low'
						WHEN SUM(id.UnitPrice * Quantity) > 1000 AND 
							SUM(id.UnitPrice * Quantity) <= 5000 
							THEN 'Medium'
						WHEN SUM(id.UnitPrice * Quantity) > 5000 AND 
							SUM(id.UnitPrice * Quantity) <= 10000 
							THEN 'High'
						WHEN SUM(id.UnitPrice * Quantity) > 10000 
							THEN 'Very High'
					END order_priority
				FROM    
					Products p
				INNER JOIN  [Order Details] id ON p.ProductID = id.ProductID
				WHERE 
				 Discount = 0
				GROUP BY 
				   id.ProductID
				order By 
				  id.ProductID;
				   
--Section 16. Useful Tips
	--Find duplicates – show you how to find duplicate values in one or more columns of a table.

			SELECT Name, EmailID, COUNT(*)
			FROM HouseOwner
			GROUP BY Name, EmailID
			HAVING COUNT(*) > 1
	--Delete duplicates – describe how to remove duplicate rows from a table.
--HouseOwner
--ID  NAME    EMAILID
--1	Rakesh	kevatrakesh81@gmail.com
--2	Rakesh	kevatrakesh81@gmail.com
--3	Rajesh	Rajesh52@gmail.com
--4	Rajesh	Rajesh52@gmail.com
--5	Suraj	Suraj58@gmail.com
--6	Shubham	Shubham5@gmail.com

	 Select * from HouseOwner

				WITH cte AS (
				SELECT 
					ID
					Name, 
					EmailID,  
					ROW_NUMBER() OVER (
						PARTITION BY 
							Name, 
							EmailID  
						ORDER BY 
							Name, 
							EmailID
					) row_num
				 FROM 
					HouseOwner
			)
			DELETE FROM cte
			WHERE row_num > 1; 

--Section 17.	--Create database as you want to like name of the database.

				USE [master]
				GO
				CREATE DATABASE record ON 
				   (FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\MilkDatabase.mdf' )
				FOR ATTACH_REBUILD_LOG;
				GO 
-------------------------------------------------------------------------------------------------------------------------------------
-- Section = 18 
-------------------------------------------------------------------------------------------------------------------------------------
			-- Department Table 
						DROP TABLE IF EXISTS Departments

						CREATE TABLE Departments
						(
						DepartmentId   int PRIMARY KEY,
						DepartmentName varchar(20)
						)
						-- insert data in department database 
						INSERT INTO Departments VALUES (1, 'Mechanical') 
						INSERT INTO Departments VALUES (2, 'Chemical') 
						INSERT INTO Departments VALUES (3, 'Electronic') 
						INSERT INTO Departments VALUES (4, 'Textile') 
						INSERT INTO Departments VALUES (5, 'Civil')

			-- Grade3Students Table
						DROP TABLE IF EXISTS Grade3Students
						CREATE TABLE Grade3Students
						(
						StudentId int PRIMARY KEY IDENTITY(1,1),
						FirstName varchar(20) NOT NULL, 
						LastName varchar(20) NOT NULL,
						DateOfBirth date NOT NULL,
						Address varchar(30) NULL,
						PhoneNumber nvarchar(10) NULL,
						DepartmentId int NOT NULL,
						CONSTRAINT FK_Grade3Students_DepartmentId FOREIGN KEY (DepartmentId) REFERENCES Departments
						(DepartmentId)
						) 


						-- inset data into the table.
						INSERT INTO Grade3Students VALUES( 'Mark', 'Miller', '1980-05-31','Frank E Road', '5513478930', 1)
						INSERT INTO Grade3Students VALUES( 'Joseph', 'Ruffalo', '1978-02-02','Chelliof Boulevard','5347893090', 1)
						INSERT INTO Grade3Students VALUES( 'Tiffany', 'Paleo', '1982-07-29','300 Somerset Street', '2018978734', 2)
						INSERT INTO Grade3Students VALUES( 'Jennifer', 'Lotus', '1977-01-21','Ferry Rogger Road', '3450982348', 3)
						INSERT INTO Grade3Students VALUES( 'Shermus', 'Shroff', '1988-10-10','Angelio Clifflio Boulevard', '7719838970', 4)
						INSERT INTO Grade3Students VALUES( 'Kelly', 'Vercher', '1975-01-01','Woodbridge lane', '7719838970',4 )

			Select * from Departments;
			Select * from Grade3Students;





 -- SQL Server Views(A view is a virtual table created according to the result set of an SQL statement.)

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

			Create index IX_tbl_Poly_Employee_Salary_Gender
	        ON tbl_Poly_Employee(Gender Desc,Salary ASC)  -- First Gender and then Salary.
			select * from tbl_Poly_Employee;