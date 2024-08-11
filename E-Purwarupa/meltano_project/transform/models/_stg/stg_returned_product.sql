with source as (
    select * from {{ source ('dab_schema', 'returned_product') }}
)
select
    order_returned_id,
    returned_confirmation::boolean as returned_confirmation
from source