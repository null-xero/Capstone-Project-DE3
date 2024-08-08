SELECT
    order_id::int AS order_id
    , order_date::TIMESTAMP AS order_date
    , customer_phone
FROM {{ source ('store', 'orders') }}