{{ config(materialized='table') }}

WITH source_data AS (
    SELECT * 
    FROM {{ source('resale_flat', 'public_resale_flat_prices_from_jan_2017') }}
)

SELECT
    * EXCEPT(floor_area_sqm, resale_price),
    CAST(floor_area_sqm AS NUMERIC) AS floor_area_sqm,
    CAST(resale_price AS NUMERIC) AS resale_price, -- Added this cast
    CAST(resale_price AS NUMERIC) / CAST(floor_area_sqm AS NUMERIC) AS price_per_sqm
FROM source_data