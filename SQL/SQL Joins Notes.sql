---------------------------------------------------------- > SQL Joins < --------------------------------------------------------------------------------
create database inter;
use inter;
create table student_final
(
roll_no int,
name varchar(20),
city varchar(20),
age int
);

insert into student_final values(1,'Harsh','Delhi',18);
insert into student_final values(2,'Pratik','Bihar',19);
insert into student_final values(3,'Riyanka','Bihar',20);
insert into student_final values(4,'Deep','Bihar',18);
insert into student_final values(5,'Saptarhi','Bihar',19);
insert into student_final values(6,'Dhanraj','Bihar',20);
insert into student_final values(7,'Rohit','Bihar',18);
insert into student_final values(8,'Niraj','Bihar',19);

create table Studentcourse
(
course_id int,
roll_no int,
course varchar(50)
);

insert into Studentcourse values (1,1,'Data Science'),(2,2,'Big Data'),(2,3,'SQL'),(3,4,'Web Development'),(1,5,'Full Stack'),(4,9,'Visualization'),(5,10,'Data Analytics'),(4,11,'Data Structures');

select * from student_final;
select * from Studentcourse;

create table members (id int ,name varchar(10) );
create table city ( city_id int , city_name varchar(20));

insert into members values (1,'A'),(2,'B'),(3,'C'),(4,'D'),(5,'E');
insert into city values (1,'DEL'),(2,'MUM'),(3,'KOL');

SELECT* from members;
select * from city;

create table self
(
emp_id int,
emp_name varchar(50), salary int, manager_id int
);

insert into self values (1, 'Warner',10000,4);
insert into self values (2,'Knight',15000,5);
insert into self values (3, 'Gardner',10000,4);
insert into self values (4, 'Kapp',5000,2);
insert into self values (5, 'Cummins',12000,6);
insert into self values(6, 'Sutherland',12000,2);
insert into self values (7, 'Lanning', 9000,2);
insert into self values (8, 'Capsey' ,5000,2);

select * from self;
select * from self;
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--- > Inner join [ It will join based on comman values ]
select Studentcourse.course_id,Studentcourse.roll_no,course,name,age from student_final inner join Studentcourse on Student_final.roll_no=Studentcourse.roll_no;

---> Left join [ all values from left table are taken and comman values from right table taken remaining values will be null ]
select Studentcourse.course_id,Studentcourse.roll_no,course,name,age from student_final left join Studentcourse on Student_final.roll_no=Studentcourse.roll_no;

---> Right join [ all values from Right table are taken and comman values from left table taken remaining values will be null ]
select Studentcourse.course_id,Studentcourse.roll_no,course,name,age from student_final right join Studentcourse on Student_final.roll_no=Studentcourse.roll_no;

---> Full outer join [ Joins both table and diplays comman value and uncomman rows with Null values ]
select Studentcourse.course_id,Studentcourse.roll_no,course,name,age from student_final full join Studentcourse on Student_final.roll_no=Studentcourse.roll_no;

---> Cross join [ combines both tables and displays all possiblities ]
select * from members cross join city;

---> Self join [ joining within a single table and finding data] [ using with function we can create table with given query ]
with main as (select a.emp_id,a.emp_name,b.emp_name as 'Manager name',a.salary ,b.salary as 'Manager salary' from self a inner join self b on a.manager_id=b.emp_id where a.salary>b.salary )
select emp_name from main ; 







