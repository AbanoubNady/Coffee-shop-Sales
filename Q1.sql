-- Q1 Q1 What are the total sales for each month, and did they increase? --
#Grouping the data
with Monthly_sales as(
Select month(transaction_date) as month,sum(transaction_qty*unit_price) as Sales
from `coffee _shop_sales`
group by month)

#comparing with the prev month
select Month , Sales , lag(Sales) over (order by Month) as Prev_month,
Sales-lag(Sales) over (order by Month) as  difference ,
	case 
    when Sales > lag(Sales) over (order by Month)  then "Yes"
	when Sales < lag(Sales) over (order by Month)  then "No"
	when Sales = lag(Sales) over (order by Month)  then "equal"
	else "NA"
	end as increasement
from Monthly_Sales

#####################

