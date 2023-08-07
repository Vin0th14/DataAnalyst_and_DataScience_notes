create database sr;
use sr;

create table msg(id int, fname varchar(20),lname varchar(20),age int,state varchar(20),payment int,message varchar(50));
insert into msg values(1,'Simran','Surve',20,'maharashtra',20000,'I love my planet Earth');
insert into msg values(2,'John','Dsouza',27,'california',25000,'Happy birthday Mom!');
insert into msg values(3,'Suzane','Peter',34,'eastern cape',30000,'Save our Earth');
insert into msg values(4,'Sherlin','Fernandes',30,'Texas',23000,'Happy Birthday David');
insert into msg values(5,'Harsh','Shah',22,'Gujarat',21000,'stop the destruction of mother nature');
insert into msg values(6,'Celine','Sebastian',45,'Alaska',35000,'How you doin!');
insert into msg values(7,'Kieron','Pollard',35,'West Indies',32000,'Happy Birthday Jenna');
insert into msg values(8,'Quinton','Decock',30,'northern cape',23000,'I love cricket');
insert into msg values(9,'Tanuja','Patil',24,'West bengal',21000,'Happy Birthday Vedant');
insert into msg values(10,'Justin','Beiber',33,'Texas',40000,'Music is the peace on Earth');
select * from msg;

select ascii(fname) from msg;

select message,char_length(message) as length_of_message from msg;

select fname,lname,concat(fname,lname) as full_name from msg;

select fname,lname,concat_ws(' ',fname,lname) as full_name from msg;

select elt(3,id,lname,age,payment) from msg;

select field(age,id,lname,age,payment) as 'index' from msg;

select insert(state,4,3,fname) as 'new values' from msg;

select left(message,6) as 'left characters' from msg;

select right(state,4) as 'right characters' from msg;

select lower(message) as 'small message' from msg;

select upper(message) as 'big message' from msg;

select space(15) as '15 spaces';

select ltrim('   cloudml');
select rtrim('cloudml    ');

select repeat(fname,4) as 'multiple names' from msg;

select reverse(message) as 'reverse message' from msg;

select fname,state from msg where state regexp 'Texas';

select message from msg where message regexp '^Happy';

select fname from msg where fname regexp '[A-Z]';

select fname from msg where fname regexp '^[a-z]$';

select fname,payment from msg where payment regexp '[0-9]';

select fname,age from msg where age regexp '20|30';

select fname,message from msg where message regexp 'Earth$';

select fname,lname from msg where lname regexp 'S(u|e).';

select fname,payment from msg where payment regexp '^3([0-9]{4})';

select fname from msg where fname regexp '^[^S]';
