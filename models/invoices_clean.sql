{{ config(materialized='view') }}

SELECT
    movie_id, 
	invoice_id,
	month,
	LOWER(location_id) AS location_id,
	studio,
	release_date,
	weekly_price,
	total_invoice_sum
FROM    
    {{ source("silver_screen", "invoices")}}