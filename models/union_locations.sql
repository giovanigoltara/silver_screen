{{ config(materialized='table') }}

SELECT
    'nj_001' AS location_id,
    month,
    movie_id,
    total_tickets,
    total_revenue
FROM
    {{ ref("monthly_aggregation_001")}}
UNION ALL
SELECT
    'nj_002' AS location_id,
    month,
    movie_id,
    total_tickets,
    total_revenue
FROM
    {{ ref("monthly_aggregation_002")}}
UNION ALL
SELECT
    'nj_003' AS location_id,
    month,
    movie_id,
    total_tickets,
    total_revenue
FROM
    {{ ref("monthly_aggregation_003")}}