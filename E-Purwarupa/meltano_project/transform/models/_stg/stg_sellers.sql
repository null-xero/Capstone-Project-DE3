with source as (
    select * from {{ source ('dab_schema', 'sellers') }}
)
select
    seller_id,
    seller_name,
    seller_city,
    seller_zip_code
from source