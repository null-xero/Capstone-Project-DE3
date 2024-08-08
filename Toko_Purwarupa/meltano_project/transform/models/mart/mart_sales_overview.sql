select
    p.product_category_name,
    fsbp.product_id,
    fsbp.total_sales,
    fsbp.avg_sales_per_period,
    fsbp.avg_sales_growth
from {{ ref('fact_sales_by_product') }} fsbp
join {{ ref('stg_products') }} p on fsbp.product_id = p.product_id;
