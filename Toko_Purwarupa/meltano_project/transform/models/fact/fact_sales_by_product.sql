select
    product_id,
    sum(total_sales) as total_sales,
    avg(avg_sales_per_period) as avg_sales_per_period,
    avg(sales_growth) as avg_sales_growth
from {{ ref('int_sales_aggregated') }}
group by product_id