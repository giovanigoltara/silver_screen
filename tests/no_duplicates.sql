SELECT 
    movie_id, 
    month, 
    location_id, 
    COUNT(*)
FROM 
    {{ ref('final_table') }}
GROUP BY 
    movie_id, 
    month, 
    location_id
HAVING 
    COUNT(*) > 1