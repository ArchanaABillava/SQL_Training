use ORG

--1. From the following table, create a view for those salespeople who belong to the city of New York.

CREATE TABLE salesmans (
    Salesman_id int primary key,
    Sname varchar(255),
    City varchar(255),
	Commission int
);
insert into salesmans values(5001,'James Hoog','New York',0.15),(5002,'Nail Knite','Paris',0.13),(5005,'Pit Alex','London',0.11),(5006,'Mc Lyon','Paris',0.14),(5007,'Paul Adam','Rome',0.13),(5003,'Lauson Hen','San Jose',0.12)

CREATE VIEW newyorkstaffs
AS SELECT *
FROM salesmans
WHERE city = 'New York';

select * from newyorkstaffs;

--2. From the following table, create a view for all salespersons. Return salesperson ID, name, and city.

CREATE VIEW salesowns
 AS SELECT salesman_id, Sname, city
 FROM salesmans;

 SELECT * FROM salesowns;

 --3. From the following table, create a view to count the number of salespeople in each city. Return city, number of salespersons.

CREATE VIEW citynum
AS SELECT City, COUNT (Salesman_id) as Count
FROM salesmans
GROUP BY City;
select * from  citynum

--4.From the following table, create a view that counts the number of customers in each grade.
CREATE TABLE customers (
    customer_id int primary key,
	Salesman_ID int,
    cust_name varchar(255),
    City varchar(255),
	grade int,
	FOREIGN KEY (Salesman_ID) REFERENCES  Salesmans(Salesman_id)
);
insert into customers(Customer_id,cust_name,City,grade,Salesman_ID) values
(3002,'Nick Rimando','New York',100,5001),
(3007,'Brad Davis','New York',200,5001),
(3005,'Graham Zusi','California',200,5002),
(3008,'Julian Green','London',300,5002),
(3004,'Fabian Johnson','Paris',300,5006),
(3009,'Geoff Cameron','Berlin',100,5003),
(3003,'Jozy Altidor','Moscow',200,5007),
(3001,'Brad Guzan','London',100,5005);
 select * from customers

CREATE VIEW gradecount (grade, number)
AS SELECT grade, COUNT(*)
FROM customer
GROUP BY grade;

select * FROM gradecount WHERE number = 2;

--5.From the following tables, create a view to get the salesperson and customer by name. Return order name, purchase amount, salesperson ID, name, customer name.

CREATE TABLE orders (
    order_no int,
	purch_amt int,
    ord_date Date,
    customer_id int,
	salesman_id int
	FOREIGN KEY (Salesman_id) REFERENCES  Salesmans(Salesman_id),
	FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);
insert into orders values
(70001,150.5,'2012-10-05',  3005    ,     5002),
(70009,270.65,'2012-09-10',  3001     ,    5005),
(70002,65.26,'2012-10-05 ', 3002 ,5001),
(70004,110.5,'2012-08-17', 3009,5003),
(70007 ,948.5      , '2012-09-10',  3005   ,      5002),
(70005 ,2400.6     , '2012-07-27',  3007    ,     5001),
(70008  ,     5760      ,  '2012-09-10',  3002    ,     5001),
(70010   ,    1983.43   ,  '2012-10-10 ', 3004    ,     5006),
(70003    ,   2480.4   ,   '2012-10-10',  3009    ,     5003),
(70012      , 250.45      ,'2012-06-27',  3008    ,     5002),
(70011     ,  75.29      , '2012-08-17',  3003     ,    5007),
(70013       ,3045.6    ,  '2012-04-25',  3002     ,    5001);

CREATE VIEW nameorders
AS SELECT order_no, purch_amt, a.salesman_id, Sname, cust_name
FROM orders a, customers b, salesmans c
WHERE a.customer_id = b.customer_id
AND a.salesman_id = c.salesman_id;

SELECT *
 FROM nameorders
 WHERE Sname = 'Mc Lyon';