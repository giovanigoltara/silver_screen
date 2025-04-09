{{ config(materialize='view') }}

SELECT
    DATE_TRUNC('month', timestamp) AS month,
    details AS movie_id,
    SUM(amount) AS total_ticktes,
    SUM(total_value) AS total_revenue
FROM 
    {{ source('silver_screen', 'nj_003') }}
WHERE
    product_type = 'ticket'
GROUP BY
    1, 2