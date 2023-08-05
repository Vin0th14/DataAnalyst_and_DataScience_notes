-----------------------------------------------------------------> UNIVERSITY ASSIGNMENT <-----------------------------------------------------------------------------------

create database university;
use university;

create table classroom
(building		varchar(15),
room_number		varchar(7) primary key,
capacity		numeric(4,0),
);

create table department
(dept_name		varchar(20),
building		varchar(15),
budget		        numeric(12,2) check (budget > 0),
primary key (dept_name)
);

create table course
(course_id		varchar(8),
title			varchar(50),
dept_name		varchar(20),
credits		numeric(2,0) check (credits > 0),
primary key (course_id),
foreign key (dept_name) references department (dept_name)
on delete set null
);

create table instructor
(ID			varchar(5),
name			varchar(20) not null,
dept_name		varchar(20),
salary			numeric(8,2) check (salary > 29000),
primary key (ID),
foreign key (dept_name) references department (dept_name)
on delete set null
);

create table time_slot
	(id int primary key,
	time_slot_id		varchar(4),
	 day			varchar(1),
	 start_hr		numeric(2) check (start_hr >= 0 and start_hr < 24),
	 start_min		numeric(2) check (start_min >= 0 and start_min < 60),
	 end_hr			numeric(2) check (end_hr >= 0 and end_hr < 24),
	 end_min		numeric(2) check (end_min >= 0 and end_min < 60)
	);

create table section
	(course_id		varchar(8), 
         sec_id			varchar(8),
	 semester		varchar(6)
		check (semester in ('Fall', 'Winter', 'Spring', 'Summer')), 
	 year			numeric(4,0) check (year > 1701 and year < 2100), 
	 building		varchar(15),
	 room_number		varchar(7),
	 time_slot_id		varchar(4),
	 id int,
	 primary key (course_id, sec_id, semester, year),
	 foreign key (course_id) references course (course_id)
		on delete cascade,
	 foreign key (room_number) references classroom (room_number)
		on delete set null,
	 foreign key (id) references time_slot (id)
		on delete set null,
	);
create table teaches
(ID			varchar(5),
course_id		varchar(8),
sec_id			varchar(8),
semester		varchar(6),
year			numeric(4,0),
primary key (ID, course_id, sec_id, semester, year),
foreign key (course_id, sec_id, semester, year) references section (course_id, sec_id, semester, year)
on delete cascade,
foreign key (ID) references instructor (ID)
on delete cascade
);

create table student
(ID			varchar(5),
name			varchar(20) not null,
dept_name		varchar(20),
tot_cred		numeric(3,0) check (tot_cred >= 0),
primary key (ID),
foreign key (dept_name) references department (dept_name)
on delete set null
);

create table takes
(ID			varchar(5),
course_id		varchar(8),
sec_id			varchar(8),
semester		varchar(6),
year			numeric(4,0),
grade		        varchar(2),
primary key (ID, course_id, sec_id, semester, year),
foreign key (course_id, sec_id, semester, year) references section (course_id, sec_id, semester, year)
on delete cascade,
foreign key (ID) references student (ID)
on delete cascade
);

create table advisor
(s_ID			varchar(5),
i_ID			varchar(5),
primary key (s_ID),
foreign key (i_ID) references instructor (ID)
on delete set null,
foreign key (s_ID) references student (ID)
on delete cascade
);

create table prereq
(course_id		varchar(8),
prereq_id		varchar(8),
primary key (course_id, prereq_id),
foreign key (course_id) references course (course_id)
on delete cascade,
foreign key (prereq_id) references course (course_id)
);

insert into classroom values ('Packard', '101', '500');
insert into classroom values ('Painter', '514', '10');
insert into classroom values ('Taylor', '3128', '70');
insert into classroom values ('Watson', '100', '30');
insert into classroom values ('Watson', '120', '50');
insert into classroom values ('Taylor', '112', '30');
insert into classroom values ('Painter', '234', '50');
insert into classroom values ('Packard', '303', '56');


insert into department values ('Biology', 'Watson', '90000');
insert into department values ('Comp. Sci.', 'Taylor', '100000');
insert into department values ('Elec. Eng.', 'Taylor', '85000');
insert into department values ('Finance', 'Painter', '120000');
insert into department values ('History', 'Painter', '50000');
insert into department values ('Music', 'Packard', '80000');
insert into department values ('Physics', 'Watson', '70000');

insert into course values ('BIO-101', 'Intro. to Biology', 'Biology', '4');
insert into course values ('BIO-301', 'Genetics', 'Biology', '4');
insert into course values ('BIO-399', 'Computational Biology', 'Biology', '3');
insert into course values ('CS-101', 'Intro. to Computer Science', 'Comp. Sci.', '4');
insert into course values ('CS-190', 'Game Design', 'Comp. Sci.', '4');
insert into course values ('CS-315', 'Robotics', 'Comp. Sci.', '3');
insert into course values ('CS-319', 'Image Processing', 'Comp. Sci.', '3');
insert into course values ('CS-347', 'Database System Concepts', 'Comp. Sci.', '3');
insert into course values ('EE-181', 'Intro. to Digital Systems', 'Elec. Eng.', '3');
insert into course values ('FIN-201', 'Investment Banking', 'Finance', '3');
insert into course values ('HIS-351', 'World History', 'History', '3');
insert into course values ('MU-199', 'Music Video Production', 'Music', '3');
insert into course values ('PHY-101', 'Physical Principles', 'Physics', '4');


insert into instructor values ('10101', 'Srinivasan', 'Comp. Sci.', '65000');
insert into instructor values ('12121', 'Wu', 'Finance', '90000');
insert into instructor values ('15151', 'Mozart', 'Music', '40000');
insert into instructor values ('22222', 'Einstein', 'Physics', '95000');
insert into instructor values ('32343', 'El Said', 'History', '60000');
insert into instructor values ('33456', 'Gold', 'Physics', '87000');
insert into instructor values ('45565', 'Katz', 'Comp. Sci.', '75000');
insert into instructor values ('58583', 'Califieri', 'History', '62000');
insert into instructor values ('76543', 'Singh', 'Finance', '80000');
insert into instructor values ('76766', 'Crick', 'Biology', '72000');
insert into instructor values ('83821', 'Brandt', 'Comp. Sci.', '92000');
insert into instructor values ('98345', 'Kim', 'Elec. Eng.', '80000');
insert into time_slot values (1,'A', 'M', '8', '0', '8', '50');
insert into time_slot values (2,'A', 'W', '8', '0', '8', '50');
insert into time_slot values (3,'A', 'F', '8', '0', '8', '50');
insert into time_slot values (4,'B', 'M', '9', '0', '9', '50');
insert into time_slot values (5,'B', 'W', '9', '0', '9', '50');
insert into time_slot values (6,'B', 'F', '9', '0', '9', '50');
insert into time_slot values (7,'C', 'M', '11', '0', '11', '50');
insert into time_slot values (8,'C', 'W', '11', '0', '11', '50');
insert into time_slot values (9,'C', 'F', '11', '0', '11', '50');
insert into time_slot values (10,'D', 'M', '13', '0', '13', '50');
insert into time_slot values (11,'D', 'W', '13', '0', '13', '50');
insert into time_slot values (12,'D', 'F', '13', '0', '13', '50');
insert into time_slot values (13,'E', 'T', '10', '30', '11', '45 ');
insert into time_slot values (14,'E', 'R', '10', '30', '11', '45 ');
insert into time_slot values (15,'F', 'T', '14', '30', '15', '45 ');
insert into time_slot values (16,'F', 'R', '14', '30', '15', '45 ');
insert into time_slot values (17,'G', 'M', '16', '0', '16', '50');
insert into time_slot values (18,'G', 'W', '16', '0', '16', '50');
insert into time_slot values (19,'G', 'F', '16', '0', '16', '50');
insert into time_slot values (20,'H', 'W', '10', '0', '12', '30');


insert into section values ('BIO-101', '1', 'Summer', '2017', 'Painter', '514', 'B',1);
insert into section values ('BIO-301', '1', 'Summer', '2018', 'Painter', '514', 'A',2);
insert into section values ('CS-101', '1', 'Fall', '2017', 'Packard', '101', 'H',3);
insert into section values ('CS-101', '1', 'Spring', '2018', 'Packard', '101', 'F',4);
insert into section values ('CS-190', '1', 'Spring', '2017', 'Taylor', '3128', 'E',5);
insert into section values ('CS-190', '2', 'Spring', '2017', 'Taylor', '3128', 'A',6);
insert into section values ('CS-315', '1', 'Spring', '2018', 'Watson', '120', 'D',7);
insert into section values ('CS-319', '1', 'Spring', '2018', 'Watson', '100', 'B',8);
insert into section values ('CS-319', '2', 'Spring', '2018', 'Taylor', '3128', 'C',9);
insert into section values ('CS-347', '1', 'Fall', '2017', 'Taylor', '3128', 'A',10);
insert into section values ('EE-181', '1', 'Spring', '2017', 'Taylor', '3128', 'C',11);
insert into section values ('FIN-201', '1', 'Spring', '2018', 'Packard', '101', 'B',12);
insert into section values ('HIS-351', '1', 'Spring', '2018', 'Painter', '514', 'C',13);
insert into section values ('MU-199', '1', 'Spring', '2018', 'Packard', '101', 'D',14);
insert into section values ('PHY-101', '1', 'Fall', '2017', 'Watson', '100', 'A',15);



insert into teaches values ('10101', 'CS-101', '1', 'Fall', '2017');
insert into teaches values ('10101', 'CS-315', '1', 'Spring', '2018');
insert into teaches values ('10101', 'CS-347', '1', 'Fall', '2017');
insert into teaches values ('12121', 'FIN-201', '1', 'Spring', '2018');
insert into teaches values ('15151', 'MU-199', '1', 'Spring', '2018');
insert into teaches values ('22222', 'PHY-101', '1', 'Fall', '2017');
insert into teaches values ('32343', 'HIS-351', '1', 'Spring', '2018');
insert into teaches values ('45565', 'CS-101', '1', 'Spring', '2018');
insert into teaches values ('45565', 'CS-319', '1', 'Spring', '2018');
insert into teaches values ('76766', 'BIO-101', '1', 'Summer', '2017');
insert into teaches values ('76766', 'BIO-301', '1', 'Summer', '2018');
insert into teaches values ('83821', 'CS-190', '1', 'Spring', '2017');
insert into teaches values ('83821', 'CS-190', '2', 'Spring', '2017');
insert into teaches values ('83821', 'CS-319', '2', 'Spring', '2018');
insert into teaches values ('98345', 'EE-181', '1', 'Spring', '2017');



insert into student values ('00128', 'Zhang', 'Comp. Sci.', '102');
insert into student values ('12345', 'Shankar', 'Comp. Sci.', '32');
insert into student values ('19991', 'Brandt', 'History', '80');
insert into student values ('23121', 'Chavez', 'Finance', '110');
insert into student values ('44553', 'Peltier', 'Physics', '56');
insert into student values ('45678', 'Levy', 'Physics', '46');
insert into student values ('54321', 'Williams', 'Comp. Sci.', '54');
insert into student values ('55739', 'Sanchez', 'Music', '38');
insert into student values ('70557', 'Snow', 'Physics', '0');
insert into student values ('76543', 'Brown', 'Comp. Sci.', '58');
insert into student values ('76653', 'Aoi', 'Elec. Eng.', '60');
insert into student values ('98765', 'Bourikas', 'Elec. Eng.', '98');
insert into student values ('98988', 'Tanaka', 'Biology', '120');



insert into takes values ('00128', 'CS-101', '1', 'Fall', '2017', 'A');
insert into takes values ('00128', 'CS-347', '1', 'Fall', '2017', 'A-');
insert into takes values ('12345', 'CS-101', '1', 'Fall', '2017', 'C');
insert into takes values ('12345', 'CS-190', '2', 'Spring', '2017', 'A');
insert into takes values ('12345', 'CS-315', '1', 'Spring', '2018', 'A');
insert into takes values ('12345', 'CS-347', '1', 'Fall', '2017', 'A');
insert into takes values ('19991', 'HIS-351', '1', 'Spring', '2018', 'B');
insert into takes values ('23121', 'FIN-201', '1', 'Spring', '2018', 'C+');
insert into takes values ('44553', 'PHY-101', '1', 'Fall', '2017', 'B-');
insert into takes values ('45678', 'CS-101', '1', 'Fall', '2017', 'F');
insert into takes values ('45678', 'CS-101', '1', 'Spring', '2018', 'B+');
insert into takes values ('45678', 'CS-319', '1', 'Spring', '2018', 'B');
insert into takes values ('54321', 'CS-101', '1', 'Fall', '2017', 'A-');
insert into takes values ('54321', 'CS-190', '2', 'Spring', '2017', 'B+');
insert into takes values ('55739', 'MU-199', '1', 'Spring', '2018', 'A-');
insert into takes values ('76543', 'CS-101', '1', 'Fall', '2017', 'A');
insert into takes values ('76543', 'CS-319', '2', 'Spring', '2018', 'A');
insert into takes values ('76653', 'EE-181', '1', 'Spring', '2017', 'C');
insert into takes values ('98765', 'CS-101', '1', 'Fall', '2017', 'C-');
insert into takes values ('98765', 'CS-315', '1', 'Spring', '2018', 'B');
insert into takes values ('98988', 'BIO-101', '1', 'Summer', '2017', 'A');
insert into takes values ('98988', 'BIO-301', '1', 'Summer', '2018', null);



insert into advisor values ('00128', '45565');
insert into advisor values ('12345', '10101');
insert into advisor values ('23121', '76543');
insert into advisor values ('44553', '22222');
insert into advisor values ('45678', '22222');
insert into advisor values ('76543', '45565');
insert into advisor values ('76653', '98345');
insert into advisor values ('98765', '98345');
insert into advisor values ('98988', '76766');

insert into prereq values ('BIO-301', 'BIO-101');
insert into prereq values ('BIO-399', 'BIO-101');
insert into prereq values ('CS-190', 'CS-101');
insert into prereq values ('CS-315', 'CS-101');
insert into prereq values ('CS-319', 'CS-101');
insert into prereq values ('CS-347', 'CS-101');
insert into prereq values ('EE-181', 'PHY-101');

select * from classroom;
select * from department;
select * from course;
select * from instructor;
select * from time_slot;
select * from section;
select * from teaches;
select * from student;
select * from takes;
select * from advisor;
select * from prereq;

--===================================================================================================================================================================================================
select dept_name ,avg(salary) as 'average salary' from instructor group by dept_name;

select s.name,t.course_id from student s ,takes t where s.ID=t.ID;

select s.name,count(t.course_id) from student s ,takes t where s.ID=t.ID group by s.name;

select se.semester,se.course_id,pr.prereq_id from section se,prereq pr where  se.course_id=pr.course_id;

select top 5 s.name , i.name,s.tot_cred from student s, instructor i where s.dept_name=i.dept_name order by s.tot_cred desc;

select top 1 se.semester , c.dept_name , count(c.course_id) as max from course c,section se where c.course_id=se.course_id group by se.semester,c.dept_name order  by count(c.course_id) desc;

select se.course_id,ts.start_hr from time_slot ts ,section se  where se.time_slot_id=ts.time_slot_id and start_hr=8 group by se.course_id,ts.start_hr;

select name,salary,dept_name from instructor where dept_name in (select dept_name from department where building = 'Watson');

select title,day from course c,time_slot ts,section s where s.time_slot_id=ts.time_slot_id and s.course_id=c.course_id and ts.day='M';

select start_hr,end_hr,count(course_id) as 'no of course' from time_slot ts,section s where ts.time_slot_id=s.time_slot_id and ts.start_hr=8 and ts.end_hr=8 group by start_hr,end_hr;

select name,salary from instructor where salary > 90000;

select * from takes where year < 2018;

select * from takes where semester='fall' and sec_id=2;

select * from takes where semester='summer' and sec_id=1 and year=2017;

select * from takes where semester='fall' and grade='A';

select * from takes where semester='summer' and grade='A';

select * from section where time_slot_id='B' and room_number=514 and building='Painter';

select title from course where course_id like 'CS%' and credits=3;

select course_id,name from course,instructor where course.dept_name=instructor.dept_name and name='Einstein' ;

select course_id from course where course_id like 'CS%';

select dept_name, max(salary) from instructor group by dept_name;

select sec_id ,count(ID) as 'No of students',semester,year from takes where year=2017 and semester = 'Fall' group by sec_id,semester,year;

update instructor set salary=salary*1.1 where salary between 0 and 90000;

select name ,salary from instructor where dept_name='Biology' and salary >50000;

select s.name,t.course_id,c.title from student s inner join takes t on s.ID=t.ID inner join course c on t.course_id=c.course_id where s.name='Shankar';

select dept_name , sum(credits) as 'Total no of credits' from course group by dept_name;

select s.building ,count(t.course_id),t.grade from section s,takes t where s.course_id=t.course_id and t.grade='A' group by building,grade;

select s.dept_name,count(s.ID) as 'No of students' from student s,course c where s.dept_name=c.dept_name and s.tot_cred % c.credits=0 group by s.dept_name,c.dept_name;

select building,count(course_id) as 'No of cources' from department d,course c where c.dept_name=d.dept_name group by building;

select dept_name, count(name) from instructor where name like '%a%e%' group by  dept_name;

select s.room_number,c.capacity,count(s.course_id) as 'No of cources' from section s,classroom c where s.room_number=c.room_number and c.capacity>20 group by c.room_number,s.room_number,c.capacity;

update  department set budget=budget+1000;

select s.room_number,count(t.ID) as 'No of students' from section s,takes t where s.course_id=t.course_id group by s.room_number;

select s.name,p.prereq_id from takes t,student s,prereq p where s.ID=t.ID and t.course_id=p.course_id ;

select ts.day,count(t.ID) as 'No of students' from takes t ,time_slot ts, section s where ts.time_slot_id=s.time_slot_id and s.course_id=t.course_id and ts.day='W' group by ts.day;

select s.dept_name ,count(s.ID) as 'Total num of students and Instructors' from student s group by s.dept_name union all select i.dept_name ,count(i.ID) as 'Total num of Instructors' from instructor i group by i.dept_name ;

select t.semester,count(t.ID) as 'no of students',sum(s.tot_cred) as 'No of credits' from takes t,student s where t.ID=s.ID group by t.semester;

select s.building,count(t.ID) as 'no of instructors' from section s , teaches t where s.course_id=t.course_id group by s.building;

select building,i.name,s_id from advisor a,instructor i,section s,teaches t where i.ID=t.ID and t.course_id=s.course_id and a.i_ID=i.ID and building='Painter';

select s.name,ts.start_hr,s.tot_cred from student s,time_slot ts,section se , takes t where s.ID=t.ID and t.course_id=se.course_id and se.time_slot_id=ts.time_slot_id and start_hr=9 ;

select s.name,se.room_number from student s ,section se ,takes t where t.ID=s.ID and se.course_id=t.course_id order by se.room_number;

select cr.room_number,cr.capacity-count(t.ID) as 'remaining capacity' from classroom cr,takes t,section s where cr.room_number=s.room_number and s.course_id=t.course_id group by cr.room_number,cr.capacity,s.room_number;

select s.name,t.course_id,end_hr-start_hr as 'duration',end_min-start_min as'duration in min' from student s,takes t , time_slot ts,section se where s.ID=t.ID and t.course_id=se.course_id and se.time_slot_id=ts.time_slot_id group by s.name,t.course_id,end_hr,start_hr,end_min,start_min;

select ts.day,s.building,s.room_number,s.course_id from time_slot ts , section s where ts.time_slot_id=s.time_slot_id;

select c.title,avg(i.salary) from instructor i , course c where c.dept_name=i.dept_name group by c.title order by avg(i.salary) desc;

select s.course_id , avg(ts.end_min-ts.start_min) as 'Duration' from section s , time_slot ts where ts.time_slot_id=s.time_slot_id group by s.course_id;

select dept_name,name,max(salary) from instructor group by dept_name ,name;

with student_advisor_data as ( select * from student s join advisor a on s.id=a.s_ID) select i.name, tot_cred_data.sum_of_credits
from ( select i_id, sum(tot_cred) as 'sum_of_credits' from student_advisor_data group by i_id) as tot_cred_data join instructor i on tot_cred_data.i_id = i.id;

with base as (select dept_name,sum(credits) as credits from course  group by dept_name) select s.name,s.tot_cred/b.credits from student s join base b on s.dept_name=b.dept_name;

with building as (select building,count(room_number)as 'num_room' from classroom group by building) select b1.building,b1.budget/b2.num_room from building b2 join (select building,sum(budget)as budget from department  group by building) as b1 on b1.building=b2.building;
