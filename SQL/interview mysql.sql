
/* Between and IN operator */
select * from student where marks between 10 and 20;
select * from student where name in ('vk','gok');

/* DDL comments */
select * from students;
drop table students;
alter table students add id int(10);
truncate table students;
EXEC sp_rename 'table name','new name';

/*DML commands*/
insert into student values((1,"vk"),(2,"gok"));
update student set name='vk' where id=5;
delete from student where id=5;

/* Top 2nd highest salary */
select name, id from students order by marks desc limit 1 offset 1;

/* to find the pattern in SQl */
create database testing;
use testing;
create table student(id int(20),name varchar(20));
insert into student values(7,'vinoth');
insert into student values(8,'gokul');
select * from student;

/* to find the pattern in SQl     % - to mention start and end  _ to mention a single char */
select name from student where  name like "v%%o%%h";
SELECT * FROM EmployeeInfo WHERE EmpLname LIKE '____a';

SELECT now(); /* To print current date and time*/
select CURDATE(); 
SELECT id,order_date,DATE_ADD(order_date,INTERVAL 30 DAY) AS OrderPayDate FROM orders;
select delivery_date,extract(week from delivery_date) as 'week of year' from orders;
select delivery_date,order_date,datediff(delivery_date,order_date) as 'difference' from orders;


SELECT CONCAT(EmpFname, ' ', EmpLname) AS 'FullName' FROM EmployeeInfo;

/* to retrive duplicate records */
SELECT EmpID, EmpFname, Department, COUNT(*) FROM EmployeeInfo GROUP BY EmpID, EmpFname, Department HAVING COUNT(*) > 1;

SELECT Email FROM EmployeeInfo WHERE NOT REGEXP_LIKE(Email, ‘[A-Z0-9._%+-]+@[A-Z0-9.-]+.[A-Z]{2,4}’, ‘i’);

/* Sub query */
select pet_id , name from pets where pet_id in (select pet_id from vet);

/* Comman table expression*/
with new_table(name,id) as 
( select * from student)
select name,id from new_table;

/* case statements*/
SELECT OrderID, Quantity,
CASE
    WHEN Quantity > 30 THEN 'The quantity is greater than 30'
    WHEN Quantity = 30 THEN 'The quantity is 30'
    ELSE 'The quantity is under 30'
END AS QuantityText
FROM OrderDetails;

/* if statement*/
SELECT IF(500<1000, "YES", "NO");

/* String operations*/
SELECT SUBSTRING("SQL Tutorial", 5, 3) AS ExtractString;
SELECT LEFT("SQL Tutorial", 3) AS ExtractString;
SELECT MID("SQL Tutorial", 5, 3) AS ExtractString;
SELECT REVERSE("SQL Tutorial");

/* View*/
create view sample as select * from student;


/* Stored procedure */
DELIMITER &&  
CREATE PROCEDURE females() 
BEGIN  
    SELECT name,gender FROM patients WHERE gender = 'female';  
END &&  
DELIMITER ;  

call females();

/* rank function */
select  emp_id,emp_name,salary,rank() over (order by salary desc) from employee_1;
select *,FIRST_VALUE(emp_name) over(order by salary)as 'low salary' from employeee;

/* Self join */
SELECT A.CustomerName AS CustomerName1, B.CustomerName AS CustomerName2, A.City
FROM Customers A, Customers B
WHERE A.CustomerID <> B.CustomerID
AND A.City = B.City
ORDER BY A.City;
















