SELECT * FROM `coffee _shop_sales` ;

-- Convert the date format transaction_time from STR to time
UPDATE `coffee _shop_sales`
SET  transaction_time= STR_TO_DATE(transaction_time, '%H:%i:%s');

-- Alter the column to proper DATE type transaction_time from STR to time
ALTER TABLE `coffee _shop_sales`
MODIFY COLUMN transaction_time time;

-- Convert the date format transaction_date from STR to date
UPDATE `coffee _shop_sales`
SET  transaction_date= STR_TO_DATE(transaction_date, '%m/%d/%Y');

-- Alter the column to proper DATE type
ALTER TABLE `coffee _shop_sales`
MODIFY COLUMN transaction_date Date;
describe `coffee _shop_sales`;
-- Alter the column transaction_id Name and format
alter table `coffee _shop_sales`
change column transaction_id transaction_ID int ;