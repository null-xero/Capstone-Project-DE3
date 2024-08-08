with source as (
    select * from {{ ('source','returned_product') }}
)
select
    order_returned_id,
    returned_confirmation
from source;
