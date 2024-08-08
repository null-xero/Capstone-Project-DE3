SELECT
    order_detail_id::int AS order_detail_id
    , order_id::int AS order_id
    , product_id AS product_id
    , quantity AS order_qty
    , price::float AS unit_sales
FROM {{ source ('store', 'order_details') }}