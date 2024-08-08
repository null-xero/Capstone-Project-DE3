SELECT
    order_detail_id
    , order_id
    , order_date
    , brand_name
    , product_name
    , order_qty
    , product_price
    , unit_sales
FROM {{ ref('fct_order_details') }}