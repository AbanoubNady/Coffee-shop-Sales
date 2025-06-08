### What is the quantity of each product sold each month, and did it increase?
## Grouping the data
with Quantity_table as (
select month(transaction_date) as month , product_type,sum(transaction_qty) as Quantity 
from `coffee _shop_sales`
group by month , product_type)

## calculating the Answer
select month ,product_type, Quantity , lag(Quantity) over(order by month) as prev_monthh,
case when Quantity > lag(Quantity) over(order by month) then "Yes"
when Quantity < lag(Quantity) over(order by month) then "No"
when Quantity = lag(Quantity) over(order by month) then "equal"
else "NA"
end as Increasement
from Quantity_table