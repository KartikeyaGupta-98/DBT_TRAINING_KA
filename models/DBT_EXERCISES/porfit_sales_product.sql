{{
    config(
        materialized='table'
    )
}}
SELECT 
    product_id,
    product_name,
  concat(month(month_year),year(month_year)) as month_year,
    sales,
    quantity,
    unit_price,
   sum( (profit / sales) * 100) AS profit 
from TRAINING.DBT_KALAPATI.Product_Sales
group by month_year,product_id, product_name,sales,quantity,unit_price
