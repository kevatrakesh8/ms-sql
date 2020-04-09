Create database xaller
create table Registration (reg_id int primary key identity(1,1),reg_firstname varchar(100),reg_lastname varchar(100),
reg_email varchar(100),reg_phone varchar(100),reg_password nvarchar(100), reg_confirmpassword nvarchar(100),
req_question varchar(100), req_answer varchar(100));
select * from Registration
insert into Registration values ('Rakesh','Kevat','kevatrakesh8@gmail.com','9152723040','Rakesh@123','Rakesh@123','','') 
update Registration set reg_email = 'kevatrakesh8@gmail.com' where reg_id = 1; 
Select * from Registration
alter table Registration add reg_gender varchar(50);
update Registration set reg_gender = 'Male' where reg_id = 1;