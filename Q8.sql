## Q8 What is the peak hour what we make the most sales? And the percentage?
# Calculating the sales per hour
with total_of_sale as( 
select hour(css.transaction_time) as hour,round(sum(css.transaction_qty*css.unit_price),2)as total_hourly_sale
from `coffee _shop_sales` as css
group by hour(css.transaction_time)
)
# calculating the precentage 
select tos.hour as Hour,tos.total_hourly_sale as Total_sales,
concat(round(tos.total_hourly_sale/sum(CSS.unit_price*CSS.transaction_qty)*100,2),"%") as precentage
from total_of_sale tos
join `coffee _shop_sales` CSS
on 1 = 1 
group by tos.hour
order by tos.total_hourly_sale/sum(CSS.unit_price*CSS.transaction_qty) desc