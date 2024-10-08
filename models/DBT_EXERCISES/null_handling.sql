{{
    config(
        materialized='table'
    )
}}

select COALESCE(playerid, 'SYS') as playerid, 
COALESCE(year, 1999) as year,
COALESCE(POS, 'SYS') as POS,
COALESCE(GP, 0) as GP,
* from {{ ref('SCORING_MODEL') }}