with source as (
    select * from {{ ('source', 'products') }}
)
select
    product_id,
    product_category_name,
    product_name,
    product_description
from source;
