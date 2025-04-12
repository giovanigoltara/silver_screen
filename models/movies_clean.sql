{{ config(materialized='table') }}

SELECT
    movie_id,
    movie_title,
    release_date,
    COALESCE(genre, 'Unknown') AS genre,
    country,
    studio,
    budget,
    director, 
    rating,
    minutes
FROM 
    {{ source('silver_screen', 'movie_catalog')}}

