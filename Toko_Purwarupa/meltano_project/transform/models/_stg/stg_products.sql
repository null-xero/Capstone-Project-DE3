SELECT
    product_id::int AS product_id
    , brand_id::int AS brand_id
    , name AS product_name
    , price::float AS product_price
FROM {{ source ('store', 'products') }}