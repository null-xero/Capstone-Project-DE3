SELECT
    brand_id::int AS brand_id
    , name AS brand_name
FROM {{ source ('store', 'brands') }}