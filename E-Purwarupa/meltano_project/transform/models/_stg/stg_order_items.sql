with source as (
    select * from {{ source ('dab_schema', 'order_items') }}
)
select
    order_items_id,
    product_id,
    seller_id,
    price
from source