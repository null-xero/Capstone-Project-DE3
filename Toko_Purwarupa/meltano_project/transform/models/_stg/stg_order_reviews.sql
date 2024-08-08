with source as (
    select * from {{ ('source','order_reviews') }}
)
select
    order_review_id,
    review_score,
    review_creation_date
from source;
