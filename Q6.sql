##Q5 Compare the average of sales in weekdays and weekend in each month for each store?
#Calculating the sales for weekdays and weekends
with Monthly_sales as(
Select month(transaction_date) as month,
store_location,
	case when dayofweek(transaction_date) in(1,7) then "Weekend"
	else "Weekday"
	end as day_type,
round(sum(transaction_qty*unit_price)) as Sales
from `coffee _shop_sales`
group by month,day_type,store_location),
## calculating the count of weekdays and week ends
Calender as ( 
with Transactins as (
select distinct(transaction_date) as date
from `coffee _shop_sales`)
select month(date) as month,
COUNT(CASE WHEN DAYOFWEEK(date) IN (1, 7) THEN 1 END) AS weekend,
COUNT(CASE WHEN DAYOFWEEK(date) BETWEEN 2 AND 6 THEN 1 END) AS weekday
from Transactins 
group by month(date))


# Comparing the diffrence between weekdays and weekend
select MS.month ,store_location,
max(case when MS.day_type = "weekday" then MS.Sales end) as weekday_sales,
max(case when MS.day_type = "weekend" then MS.Sales end)as weekend_sales,
round(max(case when MS.day_type = "weekday" then MS.Sales end) -
max(case when MS.day_type = "weekend" then MS.Sales end))as diff_between_weekdays_weekends,
Round(max(case when MS.day_type = "weekday" then MS.Sales end)/C.weekday) as avg_sales_weekdays,
round(max(case when MS.day_type = "weekend" then MS.Sales end)/C.weekend) as avg_sales_weekends,
case 
when max(case when MS.day_type = "weekday" then MS.Sales end)/C.weekday>max(case when MS.day_type = "weekend" then MS.Sales end)/C.weekend then "weekday"
when max(case when MS.day_type = "weekday" then MS.Sales end)/C.weekday<max(case when MS.day_type = "weekend" then MS.Sales end)/C.weekend then "weekend"
else "None" end as the_Higher

from Monthly_sales MS
join Calender C on C.month = MS.month
group by month,store_location