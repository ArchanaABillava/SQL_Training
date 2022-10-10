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