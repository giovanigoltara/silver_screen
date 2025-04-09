{{ config(materialize='view') }}

SELECT
    DATE_TRUNC('month', timestamp) AS month,
    movie_id,
    SUM(ticket_amount) AS total_ticktes,
    SUM(transaction_total) AS total_revenue
FROM 
    {{ source('silver_screen', 'nj_001') }}
GROUP BY
    1, 2