WITH order_details AS (
    SELECT 
        order_date
        , brand_name
        , quantity
        , price
        , quantity * price AS revenue
    FROM {{ ref('stg_order_details_task4') }}
)
SELECT 
    order_date
    , brand_name
    , SUM(quantity) AS total_quantity
    , SUM(revenue) AS total_revenue
FROM order_details
GROUP BY 
    order_date
    , brand_name