SELECT
    brand_id
    , brand_name
    , product_id
    , product_name
    , sum(order_qty) AS total_qty
    , sum(floor(product_price)) AS total_price
    , sum(floor(unit_sales)) AS total_unit_sales
FROM {{ ref('int_order_details') }}
GROUP BY 1, 2, 3, 4
