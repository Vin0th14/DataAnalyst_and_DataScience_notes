/*    SQL ADV  */
create database adv;
use adv;
create table employee_1
(
emp_id int ,
emp_name varchar(50),
department_id int,
salary int
);

insert into employee_1 values(1,'Ankit',100,10000);
insert into employee_1 values(2,'Mohit',100,15000);
insert into employee_1 values(3,'Vikas',100,10000);
insert into employee_1 values(4,'Rohit',100,5000);
insert into employee_1 values(5,'Mudit',200,12000);
insert into employee_1 values(6,'Agam',200,12000);
insert into employee_1 values(7,'Sanjay',200,9000);
insert into employee_1 values(8,'Ashish',200,5000);

select * from employee_1;

/*----------------------------------------------------------------> String functions <------------------------------------------------------------*/
/* ASCII (str) [ it will return ascii value of  left most char ]*/

select ascii(emp_name) from employee_1;

/*Char length [ will return length of given string]*/

SELECT char_length(emp_name) from  employee_1;

/*CONCAT[join without space] and CONCAT_WS(char between two strings,s1,s2) [ we can place space or  any char btw 2 strs ] is used to Concat strings of two columns*/

/* ELT(N,str1,str2,etc..) returns str 1 or 2 based on N */

select elt(1,emp_name) from employee_1;

/* Insert(str,pos,len,newstr) [ replace new string with given position in place of  lenght of char from postion ] 
Left(str,N) [ select n number of char from str from left ]
Right(str,N) [select n number of char from str from right] 
Lower(str) [ converts the string to lower  case ]
Upper(str) [ converts the string to upper  case ]
space(N) [ return strinng with N number of spaces ]
LTRIM(str) [ Removes the spaces from left side ]
RTRIM(str) [ Removes the spaces from right side ]
Repeat(str,N) [ Repeat the string for N num of times ]
Reverse(str) [ reverces the string ] */

/* -------------------------------------------------------> Regular expression <--------------------------------------------------------------------------*/
/*     /^?([a-z0-9]{5}|[h-z0-7]{7})$/
^ - matches the begining of string
# - number scigns
? - matches zero or one instance of preciding string
[a-z0-9]-the letters it can have [a-d0-5]{4}
{N} - Num of car it can have 
| - OR
& - AND
* -  matches zero or more instance of preciding string
+ - matches one or more instance of preciding string
. - shows that it can have any number of charcters
$ - matches end of the string
^[^S] - inner ^ represents not - it will return string not start with s .
*/
/* Syntax select clmn_name from tab_name where col_name Regexp 'pattern ';   */



