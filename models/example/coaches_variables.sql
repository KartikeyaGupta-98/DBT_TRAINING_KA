{{
    config(
        materialized='table'
    )
}}


WITH filtered_data AS (
    SELECT *
    FROM {{ source('DBT_SOURCES', 'COACHES') }}
    WHERE  YEAR BETWEEN {{ var('min_YEAR') }} AND {{ var('max_YEAR') }}
)
SELECT * FROM filtered_data
