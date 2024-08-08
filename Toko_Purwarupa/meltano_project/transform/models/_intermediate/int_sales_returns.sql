with sales_returns as (
    select
        s.product_id,
        sum(case when r.return_id is not null then 1 else 0 end) as total_returns,
        count(s.order_id) as total_sales
    from {{ ref('stg_order_items') }} s
    left join {{ ref('stg_returned_product') }} r on s.order_id = r.order_id and s.product_id = r.product_id
    group by s.product_id
)
select
    product_id,
    total_returns,
    total_sales,
    total_returns::float / nullif(total_sales, 0) as return_rate
from sales_returns;
