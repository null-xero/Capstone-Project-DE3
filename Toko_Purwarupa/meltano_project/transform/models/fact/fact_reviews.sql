select
    product_id,
    avg_rating,
    total_reviews
from {{ ref('int_reviews_analysis') }};
