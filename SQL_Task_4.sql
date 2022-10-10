

--1.Scalar Function with 2 parameters 
use ORG
use TE
create function Fn_Add(@num1 int, @num2 int)
returns int
as
begin
	return  @num1 + @num2
end

select dbo.Fn_Add(6,9) as Result

--2.Procedure with OUTPUT parameter
select * from Employee

create procedure sp_TotalEmployee(@totalemp int OUTPUT)
as
Begin
	Select @totalemp=count(EID) from Employee
End

Declare @Result int
exec sp_TotalEmployee @Result OUTPUT --OUPUT is mandatory
Print @Result

--3. Trigger to restrict DML access between 6:00PM to 10.00AM
use TE


create trigger trg_demo_insert_task
on demo -- table name
FOR INSERT
as
begin
	print 'You cannot insert into the demo table'
	Rollback transaction
end

select * from demo

create trigger trg_demo_dml_tasks --trigger name
on demo -- table name
FOR INSERT, UPDATE, DELETE
as
begin
	if DATEPART(HH,GETDATE())>6  
	BEGIN
		print 'You cannot insert into the demo table between 6:00PM to 10.00AM'
		Rollback transaction -- like the working of ctrl+z
	END
	else if DATEPART(HH,GETDATE())<10
	BEGIN
		print 'You cannot insert into the demo table between 6:00PM to 10.00AM'
		Rollback transaction -- like the working of ctrl+z
	END
end
insert into demo values(108,'Lisa','01/01/2022 07:00:00')


 --4.Server-scope trigger to restrict DDL access

--Change to another database
create database DLithe
use DLithe

create table demo4
(
id int
)

--SERVER SCOPE
create trigger trg_DDL_AllDB
on ALL Server
For Create_Table,Alter_Table,Drop_Table
as
Begin
	Print 'You cannot perform DDL on any Database'
	Rollback Transaction
End
create table test
(
tid int
)

Disable trigger trg_DDL_TE on Database

--5. Working of explicit transaction with Save transaction

select * from demo1
BEGIN TRANSACTION
	insert into demo1 values(1007,'Anna');
	SAVE TRANSACTION insert_stmt
	delete from demo1 where TID=1006;
	ROLLBACK TRANSACTION insert_stmt
COMMIT TRANSACTION

--6. Difference between throw and Raiserror in exception handling
--Both RAISERROR and THROW statements are used to raise an error in Sql Server.
--The journey of RAISERROR started from Sql Server 7.0; whereas the journey of the THROW statement has just begun with Sql Server 2012.
--RAISERROR can’t be used in the Sql Server 2014’s d Stored Procedures it supports  more  towards THROW 
--RAISERROR can be used for non-error conditions, whereas THROW cannot

