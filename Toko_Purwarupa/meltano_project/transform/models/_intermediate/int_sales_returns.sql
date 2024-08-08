with sales_returns as (
    select
        oi.product_id,
        sum(case when r.order_returned_id is not null then 1 else 0 end) as total_returns,
        count(oi.order_items_id) as total_sales
    from {{ ref('stg_order_items') }} oi
    left join {{ ref('stg_returned_product') }} r on oi.order_items_id = r.order_returned_id
    group by oi.product_id
)
select
    product_id,
    total_returns,
    total_sales,
    total_returns::float / nullif(total_sales, 0) as return_rate
from sales_returns