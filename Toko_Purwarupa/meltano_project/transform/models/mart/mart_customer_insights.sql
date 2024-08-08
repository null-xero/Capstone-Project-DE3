select
    p.product_category_name,
    fr.product_id,
    fr.avg_rating,
    fr.total_reviews,
    frr.return_rate
from {{ ref('fact_reviews') }} fr
join {{ ref('fact_return_rates') }} frr on fr.product_id = frr.product_id
join {{ ref('stg_products') }} p on fr.product_id = p.product_id