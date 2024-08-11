with sales as (
    select
        oi.product_id,
        sum(oi.price) as total_sales,
        count(oi.order_items_id) as total_orders,
        date_trunc('month', o.order_purchase_timestamp) as sales_month
    from {{ ref('stg_order_items') }} oi
    join {{ ref('stg_orders') }} o on oi.order_items_id = o.order_id
    group by 1, 4
)
select
    product_id,
    total_sales,
    avg(total_sales) over (partition by product_id) as avg_sales_per_period,
    (total_sales - lag(total_sales) over (partition by product_id order by sales_month)) / nullif(lag(total_sales) over (partition by product_id order by sales_month), 0) as sales_growth,
    sales_month
from sales