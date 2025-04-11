--{{ config(materialized='table') }}

SELECT
    mc.movie_id,
    mc.movie_title,
    mc.genre,
    mc.studio,
    i.month,
    i.location_id,
    SUM(i.total_invoice_sum) AS rental_cost,
    SUM(uc.total_tickets) AS tickets_sold,
    SUM(uc.total_revenue) AS revenue
FROM
    {{ ref("movies_clean") }} AS mc 
    JOIN {{ ref("invoices_clean") }} AS i  
        ON mc.movie_id = i.movie_id
    JOIN {{ ref("union_locations") }} AS uc 
        ON i.location_id = uc.location_id AND i.month = uc.month
GROUP BY
    mc.movie_id,
    mc.movie_title,
    mc.genre,
    mc.studio,
    i.month,
    i.location_id
