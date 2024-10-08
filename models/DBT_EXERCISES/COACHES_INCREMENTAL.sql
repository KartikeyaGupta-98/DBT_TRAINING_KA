{{
    config(
        materialized='incremental',
        unique_key='SNo'
    )
}}

select row_number() as SNo from HOCKEYDB.HOCKEY.COACHES