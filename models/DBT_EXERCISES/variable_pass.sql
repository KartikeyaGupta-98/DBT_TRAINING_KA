{{
    config(
        materialized='table'
    )
}}
SELECT *
FROM {{ source('DBT_SOURCES', 'MASTER') }}
WHERE FIRSTNAME = {{ filter_value }}
