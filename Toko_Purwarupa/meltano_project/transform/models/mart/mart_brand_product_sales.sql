select
    brand_name
    , product_name
    , total_qty
    , floor(total_price) AS total_price
    , floor(total_unit_sales) AS total_unit_sales
from {{ ref('fct_brand_product_sales') }}