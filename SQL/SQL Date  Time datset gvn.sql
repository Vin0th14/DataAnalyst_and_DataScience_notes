create database date_time;
use date_time;

create table orders(id int,name varchar(20),product varchar(20),order_date date,delivery_date date);
insert into orders values(1,'simran','mobile phone','2022-01-01','2022-01-07');
insert into orders values(2,'harsh','laptop','2022-01-03','2022-01-08');
insert into orders values(3,'tanuja','dress','2022-02-03','2022-02-09');
insert into orders values(4,'vedant','earphones','2022-02-04','2022-02-09');
insert into orders values(5,'abhishek','microwave oven','2022-03-09','2022-03-15');
insert into orders values(6,'sanika','makeup','2022-03-14','2022-03-20');
insert into orders values(7,'sami','tablet','2022-04-05','2022-04-07');
select * from orders;

select now() as 'Current Timestamp';

select curdate() as 'Current Date',curtime() as 'Current Time';

SELECT id,order_date,DATE_ADD(order_date,INTERVAL 30 DAY) AS OrderPayDate FROM orders;

SELECT id,order_date,DATE_ADD(order_date,INTERVAL 1 YEAR) AS OrderPayDate FROM orders;

SELECT id,order_date,DATE_SUB(order_date,INTERVAL 7 DAY) AS OrderPayDate FROM orders;

select delivery_date,extract(year from delivery_date) as 'year',
extract(month from delivery_date) as 'month',
extract(day from delivery_date) as 'day' from orders;

select delivery_date,extract(week from delivery_date) as 'week of year' from orders;

select delivery_date,order_date,datediff(delivery_date,order_date) as 'difference' from orders;

create table birthday(name varchar(20),birth_date_time timestamp);

insert into birthday values('simran','2002-04-14 23:45:00');
insert into birthday values('harsh','2000-12-14 05:30:20');
insert into birthday values('tanuja','2001-12-12 09:10:10');
insert into birthday values('vedant','2001-08-18 13:25:00');
insert into birthday values('abhishek','2001-05-17 03:35:45');
insert into birthday values('srujan','2008-11-15 05:30:00');
insert into birthday values('sharvani','2004-03-21 19:05:15');
select * from birthday;

SELECT birth_date_time,ADDTIME(birth_date_time,'1 1:00:00') as 'new date time' from birthday;

select birth_date_time,hour(birth_date_time) as 'hour',
minute(birth_date_time) as 'minute',
second(birth_date_time) as 'second' from birthday;

select birth_date_time,timestampdiff(month,birth_date_time,'2004-03-21 19:05:15') as 'difference' from birthday;

