use TE
USE org

--SQL Task , Task-20
--SYNONYMS--
select * from Department
Select * from sys.synonyms

--INDEX--
create clustered index ind_TID on demo(TID)

CREATE TABLE Persons (
    PersonID int,
    LastName varchar(255),
    FirstName varchar(255),
    Address varchar(255),
    City varchar(255)
);
INSERT INTO Persons (PersonID, LastName, FirstName, Address, City)
VALUES (001,'Cardinal', 'Tom',  'Stavanger','Norway'),
(002,'Steve', 'John',  'Street 2','Norway'),
(003,'Candy', 'Sam',  '2nd cross','Norway');

create clustered index ind_PID on Persons(PersonID)
select * from Persons

--Simple and Complex Views
--Simple Views
create view Person_View
as
select * from Persons  where FirstName ='Tom'
select * from Person_View

--Complex Views
create view Person_CV
as
select s.PersonID,s.LastName,s.FirstName
from Persons as s ;
select * from Person_CV;

--Sequence
create table people
(
TID int,
TName varchar(20)
)
create sequence TrainID as int start with 100 increment by 2

insert into people values(NEXT VALUE FOR TrainID,'John')
insert into people values(NEXT VALUE FOR TrainID,'Sam')
insert into people values(NEXT VALUE FOR TrainID,'Paul')
insert into people values(NEXT VALUE FOR TrainID,'James')
select * from people

--String  function
SELECT CHAR(65) AS NumberCodeToCharacter;

--Math function
Select abs(-6);
Select power(2,5);

--Datetime functions
CREATE TABLE work (
WORKER_ID INT NOT NULL PRIMARY KEY ,
FIRST_NAME CHAR(25),
LAST_NAME CHAR(25),
SALARY INT,
JOINING_DATE DATETIME,
DEPARTMENT CHAR(25)
);
INSERT INTO Work
(WORKER_ID, FIRST_NAME, LAST_NAME, SALARY, JOINING_DATE, DEPARTMENT) VALUES
(001,'NIHARIKA', 'ARORA', 20000, '2013-02-25 09:00:00', 'HR'),
(002,'AYUSHI', 'GURONDIA', 5000, '2015-02-10 09:00:00', 'ADMIN'),
(003,'DEVYANI', 'PATIDAR', 18000, '2014-05-02 09:00:00', 'ACCOUNT');

select * from work