select
    product_id,
    return_rate
from {{ ref('int_sales_returns') }};
