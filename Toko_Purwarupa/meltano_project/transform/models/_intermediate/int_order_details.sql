SELECT
    details.order_detail_id
    , orders.order_id
    , orders.order_date
    , brands.brand_id
    , brands.brand_name
    , products.product_id
    , products.product_name
    , details.order_qty
    , products.product_price
    , details.unit_sales
FROM {{ ref('stg_order_details') }} AS details
LEFT JOIN {{ ref('stg_orders') }} AS orders
    ON details.order_id = orders.order_id
LEFT JOIN {{ ref('stg_products') }} AS products
    ON details.product_id = products.product_id
LEFT JOIN {{ ref('stg_brands') }} AS brands
    ON products.brand_id = brands.brand_id
