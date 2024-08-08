with source as (
    select * from {{ ('source', 'seller') }}
)
select
    seller_id,
    seller_name,
    seller_city,
    seller_zip_code
from source;
