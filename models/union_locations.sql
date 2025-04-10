{{ config(materialized='table') }}

SELECT
    'loc_001' AS location_id,
    month,
    movie_id,
    total_tickets,
    total_revenue
FROM
    {{ ref("monthly_aggregation_001")}}
UNION ALL
SELECT
    'loc_002' AS location_id,
    month,
    movie_id,
    total_tickets,
    total_revenue
FROM
    {{ ref("monthly_aggregation_002")}}
UNION ALL
SELECT
    'loc_003' AS location_id,
    month,
    movie_id,
    total_tickets,
    total_revenue
FROM
    {{ ref("monthly_aggregation_003")}}