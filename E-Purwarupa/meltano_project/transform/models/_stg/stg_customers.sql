with source as (
    select * from {{ source ('dab_schema','customers') }}
)
select
    customer_id,
    customer_name,
    customer_city,
    customer_zip_code
from source