#What are the total sales for each product each month?
#calculating the total sales
with total_of_sale as(
select month(transaction_date) as month, sum(transaction_qty*unit_price)as total_monthly_sale
from `coffee _shop_sales`
group by month
)
#calculating the precentage
select month(CSS.transaction_date) as monthly_sales ,
CSS.product_category ,
round(sum(CSS.transaction_qty*CSS.unit_price)) as monthly_sale,
concat(round((sum(CSS.transaction_qty*CSS.unit_price)/tos.total_monthly_sale)*100),"%") as the_precentage_of_the_total_sales
from `coffee _shop_sales`  CSS
left join total_of_sale tos
on tos.month = month(CSS.transaction_date)
group by monthly_sales,product_category,tos.total_monthly_sale


