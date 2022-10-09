CREATE DATABASE ORG;
SHOW DATABASES;
USE ORG;
CREATE TABLE Worker (
WORKER_ID INT NOT NULL PRIMARY KEY ,
FIRST_NAME CHAR(50),
LAST_NAME CHAR(50),
SALARY INT,
JOINING_DATE DATETIME,
DEPARTMENT CHAR(25)
);

INSERT INTO Worker
(WORKER_ID, FIRST_NAME, LAST_NAME, SALARY,
JOINING_DATE, DEPARTMENT) VALUES
(001, 'Monika', 'Arora', 1000, '14-02-20 09.00.00', 'HR'),
(002, 'Niharika', 'Verma',8000, '14-06-11 09.00.00', 'Admin'),
(003, 'Vishal', 'Singhal', 3000, '14-02-20 09.00.00', 'HR'),
(004, 'Amitabh', 'Singh', 5000, '14-02-20 09.00.00', 'Admin'),
(005, 'Vivek', 'Bhati', 5000, '14-06-11 09.00.00', 'Admin'),
(006, 'Vipul', 'Diwan', 2000, '14-06-11 09.00.00', 'Account'),
(007, 'Satish', 'Kumar', 7000, '14-01-20 09.00.00', 'Account'),
(008, 'Geetika', 'Chauhan', 9000, '14-04-11 09.00.00', 'Admin');
