--INTRODUCTION TO MS SQL SERVER
--create database - collection of tables
create database TE
--create table - collection of rows and columns
--constraint - set a rules
--Types- Primary,Unique,default,check,Not Null,Foreign Key

use TE
create table Department
(
DID int Primary Key, --No null values,no duplicates,only one primary key per table
DName varchar(20) Unique Not Null, --no duplicates,more than one of unique contraint,accept one null value
)
create table Employee
(
EID int Primary Key,
EName varchar(20) Not Null,
EDesignation varchar(20) default 'Trainee', --if a value is not known,we can substiute with a default value
EAge int check(EAge>22), --based on the condition,the value can be inserted
EDeptNo int references Department(DID) --refers the values in the Department(DID) and inserts in the EDeptNo column
)
--DML - Data Manipulation Language (insert,update, delete)
--Department
insert into Department values(100,'IT'),(101,'Designing'),(102,'Development'),(103,'Training'),(104,'Admin')
--Employee
insert into Employee values(1,'John','Junior S/W Engineer',23,101);
insert into Employee values(2,'Peter','Junior S/W Engineer',24,101);
insert into Employee(EID,EName,EAge,EDeptNo) values(3,'Sam',24,102);
insert into Employee values(4,'Prince','Junior S/W Engineer',24,104);
insert into Employee values(5,'Shaun','Senior S/W Engineer',27,102);
insert into Employee values(6,'Jancy','Junior S/W Engineer',24,104);
insert into Employee values(7,'Dwayne','Junior S/W Engineer',24,103);
insert into Employee values(8,'Lea','Senior S/W Engineer',26,100);
insert into Employee values(9,'Lee','Junior S/W Engineer',24,103);

--update
--if where clause is not used in update -> all the rows will be affected
update Employee set EAge=23 where EID=4;
update Employee set EDeptNo=103 where EID=2;

--delete
delete from Employee where EID=5;

--DQL - Data Query Language
--select
-- * -> all columns
select * from Department;
select * from Employee;
-- selected columns
select EName,EDesignation from Employee
-- column alias
select EName Name,EDesignation Designation from Employee
select EName as Name,EDesignation as Designation from Employee
select EName as 'Employee Name',EDesignation as 'Employee Designation' from Employee
--where
select * from Employee where EDeptNo=104
--relational/Logical
select * from Employee where EDeptNo>102
select * from Employee where EDeptNo>102 and EAge>23
select * from Employee where EDeptNo>102 or EAge>23
--Like (% _)
select * from Employee where EName like 'S%'
select * from Employee where EName like '_e%'
select * from Employee where EName like '___'
select * from Employee where EName like '[PS]%'
select * from Employee where EName like '[A-N]%'
select * from Employee where EName not like '[A-N]%'
--Distinct - avoid duplicate values
select DISTINCT EDesignation from Employee

--DDL(create,alter,drop)
--create
create table demo
(
id int,
name varchar(15)
)
select * from demo

insert into demo values(1,'John')
insert into demo values(2,'Peter')
insert into demo values(3,'Sam')

--alter - add a column
alter table demo add Dept varchar(10)
--update 
--update demo set Dept=100 where id<3;
--update demo set Dept=101 where id=3;

--alter - drop a column
alter table demo drop column name

--drop - drop the table

drop table demo

--order by
--single column
select * from Employee order by EDeptNo --Asc order
select * from Employee order by EDeptNo desc
--multiple column
select * from Employee order by EDeptNo,EAge
select * from Employee order by EAge,EDeptNo
select * from Employee order by EAge,EDeptNo desc

--Aggregate func -sum ,count,min,max,avg
select avg(EAge) as 'Avg age ' from Employee
-- Group by
select EDesignation,avg(EAge) as 'Avg age ' from Employee group by EDesignation
--apply a condition -having clause
select EDesignation,avg(EAge) as 'Avg age ' from Employee group by EDesignation having avg(EAge)>23

--Btw And
select * from Employee where EDeptNo between 101 and 104
select * from Employee where EDeptNo not between 101 and 104

--IN and Not IN
select *from Employee where EDeptNo IN(101,103)
select *from Employee where EName Not IN('John','Sam','Lea')

--Schema -default schema dbo
--Staff Schema
create schema Staff
create table Staff.Registration
(
RID int,
RName varchar(20)
)
--Student schema
create schema Students
create table Students.Registration
(
RID int,
RName varchar(20)
)
--Admin Schema
create schema Admin
create table Admin.Registration
(
RID int,
RName varchar(20)
)

--drop schema

drop table Staff.Registration
drop schema if exists Staff

--Cascading Referential Integrity
--tables-orders and customers
create table customer 
(
CID int primary key,
CName varchar(20) Not Null,
CAddress varchar(25) Not Null,
OrderID int unique Not Null
)
create table orders
(
OrderNo int primary key IDENTITY(1,1),
OrderID int references customer(OrderID),
CID int references customer(CID)
)
insert into customer values(1,'John','Bangalore ',103);
insert into customer values(2,'Roman','Mangalore ',104);
insert into customer values(3,'Mark','Udupi ',105);
insert into customer values(4,'Ben','Karkala ',107);


select * from customer
select * from orders

update customers set CID=10 where CID=100

delete from customers where CID=101