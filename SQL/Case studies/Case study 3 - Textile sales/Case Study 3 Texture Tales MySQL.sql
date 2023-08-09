use casestudy3;

select * from product_details;
select * from product_hierarchy;
select * from product_prices;
select * from sales limit 10;

/* 1 */
select pd.product_name,sum(s.qty) as 'Total Quantity sold' from sales s inner join product_details pd on s.prod_id= pd.product_id group by pd.product_name;

/* 2 */
select sum(price*qty)as 'Total revenue without discount' from sales;

/* 3 */
select sum(price*qty*discount)/100 as 'Total discount amount' from sales;

/* 4 */
select count(distinct txn_id )as 'Number of unique transactions' from sales;

/* 5 */
with cte_transaction as (
select txn_id,count(distinct prod_id)as 'product_count' from sales group by txn_id)
select round(avg(product_count)) as 'Average of unique products' from cte_transaction;

/* 6 */
with cte_discount as (
select txn_id , sum(price*qty*discount)/100 as 'Total_discount' from sales group by txn_id)
select avg(Total_discount) as 'Average of total discount value' from cte_discount;

/* 7 */
with cte_revenue as (
select member,txn_id , sum(price*qty) as 'Total_price' from sales group by txn_id,member order by member)
select member,avg(Total_price) as 'Average revenue' from cte_revenue group by member;

/* 8 */
select  pd.product_name,sum(s.qty*s.price)as 'Total_price' from sales s inner join product_details pd on s.prod_id=pd.product_id group by product_name order by Total_price desc limit 3;

/* 9 */
select pd.segment_id,pd.segment_name as 'Segment',sum(s.qty) as 'Total quantity',sum(s.price*s.qty) as 'Total price',sum(s.discount*s.qty*s.price)/100 as 'Total discount' 
from sales s inner join product_details pd on s.prod_id=pd.product_id group by Segment,pd.segment_id;

/* 10 */
select pd.segment_id,pd.segment_name , pd.product_name ,sum(s.qty) as 'total_quantity' from sales s 
inner join product_details pd on s.prod_id=pd.product_id group by pd.product_name,pd.segment_name,pd.segment_id ORDER BY total_quantity DESC limit 5;

/* 11 */
select ph.level_text as 'Category',sum(s.qty) as 'Total quantity',sum(s.price*s.qty) as 'Total price',sum(s.discount*s.qty*s.price)/100 as 'Total discount' 
from sales s inner join product_details pd on s.prod_id=pd.product_id inner join product_hierarchy ph on pd.category_id=ph.id  group by Category;

/* 12 */
select ph.level_text as 'Category',pd.product_name,sum(s.qty) as 'Total_quantity' 
from sales s inner join product_details pd on s.prod_id=pd.product_id inner join product_hierarchy ph on pd.category_id=ph.id  group by Category,pd.product_name order by Total_quantity desc;



