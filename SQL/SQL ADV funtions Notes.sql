-----------------------------------------------------------------------> ADV SQL functions  <--------------------------------------------------------------------------
use adv;

create table employeee(
    emp_id int,
    emp_name varchar(20),
    dept_id int,
    salary int,
    manager_id int,
    emp_age int
);

insert into employeee values(1,'Raj',500,10000,4,39);
insert into employeee values(2,'Mohit',500,15000,5,48);
insert into employeee values(3,'Vikas',500,10000,4,37);
insert into employeee values(4,'Rohit',500,5000,2,16);
insert into employeee values(5,'Arpit',600,12000,6,55);
insert into employeee values(6,'Sugam',600,12000,2,14);
insert into employeee values(7,'Sanjay',600,9000,2,13);
insert into employeee values(8,'Mithun',600,8000,2,12);
insert into employeee values(9,'Deb',300,6000,6,51);
insert into employeee values(10,'Rakesh',700,7000,6,50);

select * from employee_1;
select * from employeee;

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------

--rank function is used to give rank based on values rank will skip the number if anyone has same amount where dense dont skip to understand see example below 

select  emp_id,emp_name,salary,rank() over (order by salary desc) from employee_1;
select  emp_id,emp_name,salary,dense_rank() over (order by salary desc) from employee_1;

--row number assigns row number based on values

select  emp_id,emp_name,salary,row_number() over (order by salary desc) from employee_1;

--Partion ranking based on groups

select  emp_id,emp_name,department_id,salary,row_number() over (partition by department_id order by salary desc) from employee_1 order by department_id;

-- to get the max salary of each department 

select * from (select  emp_id,emp_name,department_id,salary,rank() over (partition by department_id order by salary desc)as rnk from employee_1 ) a where a.rnk=1;

-- First value function [ display the first value of column inside braked bsed on over (column_name) ]

select *,FIRST_VALUE(emp_name) over(order by salary)as 'low salary' from employeee;

select *,FIRST_VALUE(emp_name) over(order by emp_age desc)as 'oldest age' from employeee;

select *,FIRST_VALUE(emp_name) over(partition by dept_id order by emp_age desc)as 'oldest age' from employeee order by dept_id;

--Last value function [ display the first value of column inside braked bsed on over (column_name) ]

select *,LAST_VALUE(emp_name) over(order by emp_age )as 'oldest age' from employeee; --it wont show correctly because it dont know the last one

select *,LAST_VALUE(emp_name) over(order by emp_age rows between current row and unbounded following)as 'oldest age' from employeee ;


--=============================================================================================================================================================================================


