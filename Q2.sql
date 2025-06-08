## Q2 What are the total orders for each month, and did they increase?
## Grouping the data
with Count_sales as (
select month(transaction_date) as month ,count(transaction_ID) as count_of_orders
from `coffee _shop_sales`
group by month )
## calculating the Answer
select month,count_of_orders,lag(count_of_orders) over(order by month) as prev_month,
count_of_orders - lag(count_of_orders) over(order by month) as difference ,
	case 
	when count_of_orders > lag(count_of_orders) over(order by month) then "yes"
	when count_of_orders < lag(count_of_orders) over(order by month) then  "No"
	when count_of_orders = lag(count_of_orders) over(order by month) then  "equal"
	else "NA"
	end as increasement
from Count_sales
