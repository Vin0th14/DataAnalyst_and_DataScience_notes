use casestudy1;
select * from weekly_sales limit 5;

/* Data cleaning using given 7 steps */
create table clean_weekly_sales as 
(select week_date , week(week_date) as week_number,month(week_date) as month_number,year(week_date) as calendar_year,region,platform,
case
	when segment = 'null' then 'unknown' 
    else segment
end as segment,
case 
	when right(segment,1)='1' then 'Young Adults'
    when right(segment,1)='2' then 'Middle Aged'
    when right(segment,1)in ('3','4') then 'Retirees'
else 'unknown'
end as 'age_band',
case 
	when left(segment,1)='C' then 'Couples'
    when left(segment,1)='F' then 'Families'
else 'unknown'
end as 'demographic',customer_type,transactions,sales,round(sales/transactions,2) as 'avg_transaction' from weekly_sales);

select * from clean_weekly_sales limit 5;

/* Data Exploration */

create table seq100
(x int not null auto_increment primary key);
insert into seq100 values (),(),(),(),(),(),(),(),(),();
insert into seq100 values (),(),(),(),(),(),(),(),(),();
insert into seq100 values (),(),(),(),(),(),(),(),(),();
insert into seq100 values (),(),(),(),(),(),(),(),(),();
insert into seq100 values (),(),(),(),(),(),(),(),(),();
insert into seq100 select x + 50 from seq100;
select * from seq100;
create table seq52 as (select x from seq100 limit 52);

/* 1 */
select distinct x as week_day from seq52 where x not in (select distinct week_number from clean_weekly_sales);

/* 2 */
select  calendar_year,sum(transactions) as 'Total transactions' from clean_weekly_sales group by calendar_year;

/* 3 */
select region,month_number,sum(sales) as 'Total sales' from clean_weekly_sales group by region,month_number order by  region,month_number;

/* 4 */
select platform , sum(transactions) from clean_weekly_sales  group by platform;

/* 5 */
with monthly_sales_cte as
(select calendar_year,month_number ,platform, sum(sales)as 'monthly_sales' from clean_weekly_sales group by calendar_year,month_number,platform)
select month_number,calendar_year,
round(100*max(case when platform = 'Retail' then monthly_sales else null end )/sum(monthly_sales),2) as 'Retail percentage',
round(100*max(case when platform = 'Shopify' then monthly_sales else null end )/sum(monthly_sales),2) as 'shopify percentage'
from monthly_sales_cte group by calendar_year,month_number order by calendar_year,month_number;

/* 6 */
select calendar_year,demographic,sum(sales),round(100*sum(sales)/sum(sum(sales)) over (partition by demographic) , 2) as percentage 
from clean_weekly_sales group by calendar_year,demographic order by calendar_year,demographic;

/* 7 */
select age_band,demographic,sum(sales) as 'Retail sales' from clean_weekly_sales where platform = 'Retail' group by age_band,demographic
order by sum(sales) desc;

/*-----------------------------------------------------------------------------------------------------------------------------------------------*/