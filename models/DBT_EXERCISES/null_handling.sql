{{
    config(
        materialized='table'
    )
}}

select
COALESCE(PLAYERID, 'SYS') AS PLAYERID,  
    COALESCE(YEAR, 1999) AS YEAR,                  
    COALESCE(POS, 'SYS') AS POS,            
    COALESCE(GP, 0) AS GP
from {{ source('DBT_SOURCES', 'SCORING') }}