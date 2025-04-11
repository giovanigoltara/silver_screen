SELECT 
    *
FROM 
    {{ ref('final_table') }}
WHERE 
    rental_cost < 0
   OR tickets_sold < 0
   OR revenue < 0