with source as (
    select * from {{ source ('dab_schema', 'orders') }}
)
select
    order_id,
    customer_id,
    order_status,
    order_purchase_timestamp::datetime as order_purchase_timestamp,
    order_approved_at::datetime as order_approved_at,
    order_delivered_carrier_date,
    order_delivered_customer_date,
from source