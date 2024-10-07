{{
    config(
        materialized='incremental',
        unique_key=''
    )
}}

select * from HOCKEYDB.HOCKEY.COACHES