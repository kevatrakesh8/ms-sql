-----bol bhai kya seeekhna haia ..--
---how to create database 
create database Project
---ojk yes
use Project 
---samjha yes
-----createing table 
create table employee_Table(id int ,fname varchar(40),lname varchar(20))-- 4 column h
select * from employee_Table
----how to add column in table 
alter table  employee_Table add salary varchar(max)
---if i want to change the datatye of column like salar datatypr is varchar so i wangt ot change as int 
alter table  employee_Table alter column  salary int
insert into employee_Table  values(1,'david','john',5400)
insert into employee_Table  values(2,'abdul kadir ','khan',5498522)
insert into employee_Table  values(3,'rakesh','kevat',500)
insert into employee_Table  values(4,'ram','gopal',20000)
select * from employee_Table
--  update table salary using name or last or id
update employee_Table set salary=6000 where id=3
update employee_Table set salary=38333 where fname='abdul kadir'
----samjha yes
--how to find max salary 
select  max(salary) as Maxsalary from employee_Table
--group by fname     fname likhana jaroori hai na ....nhiiiiiiiiiiiiiiiiiiiiiii woh agar dekhna hai ki kiski max salary hai tab    ok   ..delete kuch bhi mat karana ...ohk
select  max(salary)  from employee_Table
where salary !=(select  max(salary)  from employee_Table)
----second saLARY   matalab second max salary find karane ke liye hai na ..haa..ok ..ok
select * from employee_Table
--data dekh duplicate hogya hai dekha 
---ho to find duplicate data 
select id,fname,COUNT(id) as duplicate_Row from employee_Table 
group by id,fname
having COUNT(*)>1
----samjha yes... wait kar mujhe pura code eak bar copy karane de   ok ..

----how to delete duplicate row
with Koi_bhi_table_ka_name_rakh_sakta_hai as
(
select * ,ROW_NUMBER()over(PARTITION by id order by id desc) as Result
from employee_Table
)   
delete from  Koi_bhi_table_ka_name_rakh_sakta_hai where Result>1

select * from employee_Table order by id
select id,fname,COUNT(id) as duplicate_Row from employee_Table 
group by id,fname
having COUNT(*)>1
----how to find 1,2,,3,4,5,6, salary 
declare @result int
select top 3 @result=salary  from employee_Table order by salary desc
print  @result
------agar tujhe  second chahiye toh tu 2 likh 
--first salary max 38333
---second 20000 max 


bas kar aaj ke din itana ...mujhe ab yaad karane de ....mere liye bahot jayada hi ....ok...ohkl good night thanks but time lagaga yaad karane ko yad karne ke baad bolata ho ,..