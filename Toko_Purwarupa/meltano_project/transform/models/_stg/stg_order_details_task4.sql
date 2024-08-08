SELECT
    o.order_date
    , od.quantity AS quantity
    , FLOOR(od.price) AS price
    , b.name AS brand_name
    , p.name AS product_name
FROM {{ source('store', 'order_details') }} od
JOIN {{ source('store', 'orders') }} o
    ON od.order_id = o.order_id
JOIN {{ source('store', 'products') }} p
    ON od.product_id = p.product_id
JOIN {{ source('store', 'brands') }} b
    ON p.brand_id = b.brand_id