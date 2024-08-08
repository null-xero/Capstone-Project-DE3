with source as (
    select * from {{ ('source', 'orders') }}
)
select
    order_id,
    customer_id,
    order_status,
    order_purchase_timestamp,
    order_approved_at,
    order_delivered_carrier_date,
    order_delivered_customer_date,
from source;
