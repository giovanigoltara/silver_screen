{{ config(materialized='view') }}

SELECT
    DATE_TRUNC('month', date) AS month,
    movie_id,
    SUM(ticket_amount) AS total_tickets,     
    SUM(total_earned) AS total_revenue
FROM 
    {{ source('silver_screen', 'nj_002') }}
GROUP BY
    1, 2