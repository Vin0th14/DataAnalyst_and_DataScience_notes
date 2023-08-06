use wfuncs;
select * from employee;

with nameage(name,age) as
(select name,age from employee)
select name,age from nameage;

with salarylimit(name,salary) as
(select name,if(salary>=35000,'greater than equal to 35000','less than 35000') as 'salary_range' from employee
where department='Marketing')
select name,salary from salarylimit;

with recursive
odd_no(sr_no,odd_n) as
(select 1,1
union all
select sr_no+1,odd_n+2 from odd_no where sr_no<5)
select * from odd_no;

WITH recursive cte_numbers(n, weekday) 
AS (
    SELECT 
        0, 
        DATE_FORMAT(CURDATE() + INTERVAL 0 DAY, '%W')
    UNION ALL
    SELECT    
        n + 1, 
        DATE_FORMAT(CURDATE() + INTERVAL n + 1 DAY, '%W')
    FROM    
        cte_numbers
    WHERE n < 6
)
SELECT 
    n, weekday
FROM 
    cte_numbers;

