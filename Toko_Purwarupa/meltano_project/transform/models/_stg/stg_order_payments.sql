with source as (
    select * from {{ source ('dab_schema', 'order_payments') }}
)
select
    order_payment_id,
    payment_type,
    payment_value
from source