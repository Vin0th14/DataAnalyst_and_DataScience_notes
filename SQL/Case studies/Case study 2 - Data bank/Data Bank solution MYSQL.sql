use casestudy2;
select * from customer_nodes limit 10;
select * from customer_transactions limit 10;
select * from regions;

/* 1 */
select count( distinct node_id )as 'No of nodes' from customer_nodes;

/* 2 */
select r.region_name ,count(n.node_id) as 'No of nodes' from customer_nodes n,regions r where n.region_id=r.region_id group by r.region_name;

/* 3 */
select r.region_name ,count(n.customer_id) as 'No of people' from customer_nodes n,regions r where n.region_id=r.region_id group by r.region_name;

/* 4 */
select r.region_name ,sum(t.txn_amount) as 'Total amount' from customer_nodes n,regions r,customer_transactions t
where n.region_id=r.region_id and n.customer_id=t.customer_id group by r.region_name;

/* 5 */
select round(avg(datediff(end_date,start_date)),2) as 'Average date' from customer_nodes where end_date!='9999-12-31';

/* 6 */
select txn_type,count(*) as 'unique count' ,sum(txn_amount) from customer_transactions group by txn_type;

/* 7 */
SELECT round(count(customer_id)/
               (SELECT count(DISTINCT customer_id)
                FROM customer_transactions)) AS average_deposit_count,
       concat('$', round(avg(txn_amount), 2)) AS average_deposit_amount
FROM customer_transactions
WHERE txn_type = "deposit";

/* 8 */
WITH transaction_count_per_month_cte AS
  (SELECT customer_id,
          month(txn_date) AS txn_month,
          SUM(IF(txn_type="deposit", 1, 0)) AS deposit_count,
          SUM(IF(txn_type="withdrawal", 1, 0)) AS withdrawal_count,
          SUM(IF(txn_type="purchase", 1, 0)) AS purchase_count
   FROM customer_transactions
   GROUP BY customer_id,
            month(txn_date))
SELECT txn_month,
       count(DISTINCT customer_id) as customer_count
FROM transaction_count_per_month_cte
WHERE deposit_count>1
  AND (purchase_count = 1
       OR withdrawal_count = 1)
GROUP BY txn_month;
