{{
    config(
        materialized='table'
    )
}}


WITH filtered_data AS (
    SELECT *
    FROM {{ source('DBT_SOURCES', 'MASTER') }}
    WHERE  WEIGHT BETWEEN {{ var('min_value') }} AND {{ var('max_value') }}
)
SELECT * FROM filtered_data
