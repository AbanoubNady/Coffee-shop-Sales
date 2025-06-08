#What are the total sales for each month, and did they increase? What are the total orders for each month, and did they increase? What is the quantity and did they increase?
with Monthly_report as (
select month(transaction_date) as month ,
count(transaction_ID) as count_of_orders,
sum(transaction_qty) as Quantity_of_orders,
sum(transaction_qty*unit_price) as Sales
from `coffee _shop_sales`
group by month )

select Month , Sales ,
	case 
    when Sales > lag(Sales) over (order by Month)  then "Yes"
	when Sales < lag(Sales) over (order by Month)  then "No"
	when Sales = lag(Sales) over (order by Month)  then "equal"
	else "NA"
	end as increasement_of_sales,
    count_of_orders,
    case 
	when count_of_orders > lag(count_of_orders) over(order by month) then "Yes"
	when count_of_orders < lag(count_of_orders) over(order by month) then  "No"
	when count_of_orders = lag(count_of_orders) over(order by month) then  "equal"
	else "NA"
	end as increasement_of_orders,
    Quantity_of_orders,
    case when Quantity_of_orders > lag(Quantity_of_orders) over(order by month) then "Yes"
when Quantity_of_orders < lag(Quantity_of_orders) over(order by month) then "No"
when Quantity_of_orders = lag(Quantity_of_orders) over(order by month) then "equal"
else "NA"
end as Increasement_of_Quantity
    
from Monthly_report
    