
--------------------------------------------Data Defenition Language [DDL]----------------------------------------------------
----Creating databse
create database demo;

----Creating table
create table Table_1
(
Num Int,
FName Varchar(10),
Age Int
);
create table Table_2
(
Num Int,
FName Varchar(10),
Age Int
);

----View the table
select*from Table_1;

---Inserting values  (Post adding we have to commit to table we can do it by clicking tick symbol near execute)
insert into Table_1 values(3,'Govar',21);

-------Alter 
---Add column
alter table Table_1 add LName varchar(10);
---Delete column
alter table Table_1 drop column LName;
---modify
alter table Table_1 alter column FName varchar(20);
---Rename
EXEC sp_rename 'Table_1.FName','StudentName';
---rename table 
EXEC sp_rename 'Table_11','Table_1';

------Truncate(Delete all value but structure will be there)

truncate Table Table_2;

----Deleting table(Delete entire table )
drop table Table_2;
---drop database demo;



--------------------------------------------------- Data Manipulation language [DML] -----------------------------------------------------------------------------

---Inserting a single value in table (Post adding we have to commit to table we can do it by clicking tick symbol near execute)
insert into Table_1 values(4,'Sudarr',20);

--Inserting multiple values 
insert into Table_1
values
(5,'saran',20),
(6,'Ice',21);

select*from Table_1;
--- To create a table from another table
select * into Table_new from  Table_1 where 1=2;
--(Condition is false so it wont take values)
select*from Table_new;
---Copying the values from another table
insert into Table_new select * from Table_1;

---Update command
update Table_1 set StudentName = 'vk' where Num = 3;
--update table name set col_name =the vallue to change where condition to find the row

--Update multiple columns
update Table_1 set StudentName = 'vk',Age=22 where Num = 3;

--Delete command
delete from Table_1 where Num=5;

--To delete entire row in table
delete from Table_new;

select*from Table_1;


--------------------------------------------------------------------Constraints--------------------------------------------------------------------------------------

----Not null constraint 
create table college (
clg_id int NOT NULL,
clg_code varchar(10) Not null );
insert into college values(1,null);
--It will throw an error because of not null constraint

----Unique constraint
create table college_unique (
clg_id int NOT NULL Unique,
clg_code varchar(10) Not null );
insert into college_unique values(1,'sci');
insert into college_unique values(1,'mat');
select * from college_unique;
--It will throw error because of duplicate value. it shuld be unique


---Primary key constraint
create table person_1 (
id int primary key,
name varchar(20),
Age int );
---Foreign key constraint
create table order_1 (
order_id int primary key,
NumOrder int not null,
id int,
foreign key (id) references person_1(id) );

--- check constraint
create table order_2 (
order_id int primary key,
amount int check (amount>=100) );
insert into order_2 values (2,90);
---It will throw an error  coz amt is less that 100 and check constraint is useed

--default constraint

create table colg_chck (
clg_id int primary key,
clg_code varchar(10),
clg_cntry varchar(20) default 'India' );

insert into colg_chck(clg_id,clg_code) values (1,'sci');
select * from colg_chck;
--By default india is entered even if we  didnt insert the value 


------------------------------------------------------------Order of keyword execution ------------------------------------------------------------------------------
--Order	Clause	   Function
--1	FROM	         Tables are joined to get the base data. [from which table ,the data is taken ]
--2	WHERE	         The base data is filtered.
--3	GROUP BY	   The filtered base data is grouped. [ mostly work with agg functions like sum(),avg(),count(),max(),min() ][agg func must]
--4	HAVING	   The grouped base data is filtered. [it is bought because we cantt agg functins with where func ]
--5	SELECT	   The final data is returned.  [  used to select the column from table ]
--6	ORDER BY	   The final data is sorted. 
--7	LIMIT	         The returned data is limited to row count


create table exams (student_id int, subject varchar(20), marks int);
delete from exams;
insert into exams values (1,'Chemistry',91),(1,'Physics',91)
,(2,'Chemistry',80),(2,'Physics',90)
,(3,'Chemistry',80)
,(4,'Chemistry',71),(4,'Physics',54);

select * from exams;

--getting student with same mark in phy and chem
select student_id from exams where subject in ('Physics','Chemistry') group by student_id 
having count(distinct subject )=2 and count(distinct marks)=1 
order by  student_id desc ;

--distinct-fetch unique values --sub shud have 2 uniq value and marks shuld have one uniq value so both marks are same
 
 ------------------------------------------------------- example for keywordss -----------------------------------------------------------------------------------
 
 create table  pets ( pet_id int,name varchar(20),kind varchar(20),gender varchar(10),age int ,owner_id int);
 
insert into pets values(101,'Blackie','Dog','male',11,5168),
(102,'Roomba','Cat','male',9,5508),
(103,'Simba','Cat','male',1,3086),
(104,'Keller','Parrot','female',2,7908),
(105,'Cuddles','Dog','male',13,4378),
(106,'Vuitton','Parrot','female',11,7581),
(107,'Priya','Cat','female',7,7343),
(108,'Simba','Cat','male',0,2700),
(109,'Cookie','Cat','female',8,7606),
(110,'Heisenberg','Dog','male',3,1319),
(111,'Stowe','Cat','female',15,1132),
(112,'Scout','Dog','female',2,7846),
(113,'Lily','Dog','female',3,7846),
(114,'Danger','Dog','male',9,9037),
(115,'Scooter','Dog','male',9,9850),
(116,'Bandit','Parrot','male',11,6102);

---From keyword
select * from pets;

---where keyword 
select name from pets where kind='Dog';
select name from pets where age >5 ;

--Groupby keyword
select kind,count(*) as no_of_cats from pets where kind = 'Cat' group by kind ;
select kind,avg(age) as Average_of_kind from pets group by kind ;
select gender,max(age) as max_ag, min(age) as min_age from pets group by gender;

---Having keyword
select kind,count(*) as count_of_kind from pets group by kind having count(*)>=5;
select kind from pets group by kind having avg(age)=7;

--Order By keyword
select name from pets order by name;
select kind , sum(age) from pets group by kind order by sum(age) desc;

--Top keyboard 
select top 10* from pets;
select top 5 name,age from pets order by age desc;

---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------Subquery-------------------------------------------------------------------------------------------

--Subquery - query inside query

create table owners(owner_id int,name varchar(40),gender varchar(10),occupation varchar(30),age int,city varchar(20),state_ varchar(30));

insert into owners values(5168,'Aarti Yadav','female','student',14,'Navi Mumbai','Maharashtra'),
(5508,'Hasan Ansari','male','chef',22,'Jaipur','Rajasthan'),
(3086,'Mayank Kamble','male','gamer',25,'Kolkata','West Bengal'),
(7908,'Atharva Thube','male','doctor',37,'Mumbai','Maharashtra'),
(4378,'Tanishka Ahire','female','teacher',33,'Nagpur','Maharashtra'),
(7581,'Brijesh Chaudhari','male','swimming coach',28,'Jodhpur','Uttar Pradesh'),
(7343,'Stanley Dsouza','male','lawyer',30,'Kanpur','Uttar Pradesh'),
(2700,'Aditya Varma','male','teacher',34,'Hyderabad','Andhra Pradesh'),
(7606,'Uzma Shaikh','female','chef',26,'Kochi','Kerala'),
(1319,'Raj Shah','male','cyber security analyst',26,'Navi Mumbai','Maharashtra'),
(1132,'Mehul Jain','male','student',18,'Kolkata','West Bengal'),
(7846,'Vijay Bhosale','male','police inspector',29,'Mumbai','Maharashtra'),
(7847,'Seema Jamdade','female','police subinspector',27,'Mumbai','Maharashtra'),
(9037,'Gagan Sharma','male','businessman',46,'Kanpur','Uttar Pradesh'),
(9850,'Geet Kaur','female','doctor',32,'Jaipur','Rajasthan'),
(6102,'Rajat Chabra','male','youtuber',24,'Hyderabad','Andhra Pradesh'),
(1122,'Khushboo Singh','female','fashion designer',25,'Kolkata','West Bengal'),
(3344,'Khushi Gada','female','student',19,'Surat','Gujarat'),
(4567,'Preeti Varma','female','lawyer',48,'Jodhpur','Uttar Pradesh');

select * from owners;

create table vet(vet_id int,name varchar(30),clinic_name varchar(40),pet_id int,disease varchar(30),treatment_date date);

insert into vet values(1,'Dr.Tanvi Ahuja','SuperPets',102,'Ear Infection','2023-05-12');
insert into vet values(1,'Dr.Tanvi Ahuja','SuperPets',105,'Skin Infection','2023-05-13');
insert into vet values(1,'Dr.Tanvi Ahuja','SuperPets',111,'Diarrhea','2023-05-12');
insert into vet values(1,'Dr.Tanvi Ahuja','SuperPets',107,'Skin Infection','2023-05-13');
insert into vet values(2,'Dr.Rahul Nene','K-9',104,'Injury','2023-05-14');
insert into vet values(2,'Dr.Rahul Nene','K-9',113,'Diarrhea','2023-05-14');
insert into vet values(2,'Dr.Rahul Nene','K-9',103,'Injury','2023-05-15');
insert into vet values(2,'Dr.Rahul Nene','K-9',115,'Dental Disease','2023-05-15');
insert into vet values(3,'Dr.Karan Malhotra','PetZone',114,'Ear Infection','2023-05-14');
insert into vet values(3,'Dr.Karan Malhotra','PetZone',112,'Eye Infection','2023-05-13');
insert into vet values(3,'Dr.Karan Malhotra','PetZone',106,'Injury','2023-05-14');
insert into vet values(3,'Dr.Karan Malhotra','PetZone',110,'Obesity','2023-05-15');

select * from vet;

--We can use to compare 2 tables and get output
--Give names and ID of pets who have been treated by a vet.
select pet_id , name from pets where pet_id in (select pet_id from vet);

--Give names and occupation of owners who have a pet treated for ear or skin infection
select name,occupation from owners where owner_id in (select owner_id from pets where pet_id in (select pet_id from vet where disease='Ear Infection'or disease='Skin Infection' ) );

--Display name, kind and age of pets whose age is equal to average age of all pets.
select name,kind,age from pets where age = (select avg(age) from pets);

--=========================================================================================================================================================================================
