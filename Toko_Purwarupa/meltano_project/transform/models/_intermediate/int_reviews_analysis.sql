with reviews as (
    select
        product_id,
        avg(review_score) as avg_rating,
        count(order_review_id) as total_reviews
    from {{ ref('stg_order_reviews') }} r
    join {{ ref('stg_order_items') }} oi on r.order_review_id = oi.order_items_id
    group by product_id
)
select
    product_id,
    avg_rating,
    total_reviews
from reviews