{{
    config(
        materialized='table'
    )
}}
select CURRENT_DATE as DATES,* from HOCKEYDB.HOCKEY.COMBINEDSHOOTOUTS