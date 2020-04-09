--  For Excute the code "Select the Query then then press F5  ----
------For Go Project Repository -----
use Project

----Create Database ------------
Create Database College

------------------------Create table ------------
Create table Student_details (id int , fname varchar(50), Lastname varchar(50))

-----------------Show the table all Column ----------
Select * from Student_details

----Add Table in Column ------------------
alter table student_details add fees varchar(max)

------------Change Datatype form varchar to int ---------
alter table student_details alter column fees int 

------------insert  Data in Table  --------
insert into student_details values (1,'Rakesh','Kevat',1000)
insert into student_details values (2,'Prashant','Mishra',2000)
insert into student_details values (3,'Shubham','Mishra',3000)
insert into student_details values (4,'Kishore','Poojari',4000)


-----Update the table data by using column -----------------
update Student_details set fees=5000  where id = 3
update Student_details set fees=6000 where fname = 'prashant'

---------Find the max Fees -------------------
select max(fees) as maximumfees from Student_details
Select * from Student_details

------find the second max fees    value>600---------- 
select max(fees) as maximumfees from Student_details
where fees!=(select max(fees) from Student_details)
Select * from Student_details

------Create Duplicate Data  -------------------------
insert into student_details values (4,'Kishore','Poojari',4000)
insert into student_details values (5,'Kishore','Poojari',4000)
insert into student_details values (3,'Shubham','Mishra',1000)
insert into student_details values (3,'Shubham','Mishra',1000)
Select * from Student_details

----------------find the duplicate data only in "id"  ----------------
select id,fname,count(id) as duplicate_Row from Student_details
group by id,fname
having count(*)>1
Select * from Student_details

------------Delete Duplicate Row -----------------

with Koi_bhi_table_ka_name_rakh_sakta_hai as
(
select * ,ROW_NUMBER()over(PARTITION by id order by id desc) as Result
from employee_Table
)

delete from  Koi_bhi_table_ka_name_rakh_sakta_hai where Result>1

select * from Student_details order by id

----------------Select Top fee ---------------------
select top 3 fees from Student_details
select * from Student_details

----------------Select from to below Top 3 fees amount by using store procedure  ---------------------
declare @result int 
select top 2 @result = fees from Student_details order by fees desc
print @result

select * from Student_details 5


