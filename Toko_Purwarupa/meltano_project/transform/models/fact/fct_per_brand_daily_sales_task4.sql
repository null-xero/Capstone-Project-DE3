SELECT 
    order_date
    , brand_name
    , total_quantity
    , total_revenue
FROM {{ ref('int_brand_daily_sales_task4') }}
