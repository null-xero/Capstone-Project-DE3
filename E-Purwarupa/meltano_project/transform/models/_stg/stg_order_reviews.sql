with source as (
    select * from {{ source ('dab_schema', 'order_reviews') }}
)
select
    order_review_id,
    review_score,
    review_creation_date
from source