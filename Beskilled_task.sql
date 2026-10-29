create table sales(
    order_id numeric,	
	customer_name varchar(50),	
	order_date date,	
	category 	varchar(50),
	sub_category	varchar(50),
	product_name	varchar(50),
	quantity	numeric,
	unit_price	numeric,
	total_price	numeric,
	region varchar(20)

);
select * from sales;

ALTER TABLE sales
ALTER COLUMN product_name TYPE VARCHAR(50);
-- connect data with schema
COPY sales
FROM 'C:\Beskilled_task.csv'
DELIMITER ','
CSV HEADER;

-- Display 10 rows from the data
select * from sales limit 10;

-- Display only customer which purchased shoes only
select * from sales 
where sub_category='Shoes';

-- Display only customer_name and category from Sales.
select customer_name,category from sales;

-- Display all orders sorted by total_price from highest to lowest.
select * from sales order by total_price desc;

-- Calculate the total revenue across all orders .
select sum(total_price) As revenue from sales;

-- Calculate the average order amount.
select round(avg(total_price),2)as avg_amount from sales;

-- calculate top 20 customers
select * from sales 
order by total_price desc
limit 20;


-- Calculate sale category wise. which catgeory gets high sale.
select category,sum(total_price) as tot_price
from sales
group by category
order by tot_price desc;

-- -- Calculate sale region wise. which region gets high sale.
select region,sum(total_price) as tot_price
from sales
group by region
order by tot_price desc;
