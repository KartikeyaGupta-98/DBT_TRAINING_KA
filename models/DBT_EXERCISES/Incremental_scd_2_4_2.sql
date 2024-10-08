{{
    config(
        materialized='incremental',
        unique_key=['TMID','YEAR','MONTH']
    )
}}

select * from TRAINING.DBT_KALAPATI.INCREMENTAL_SCD_2_4 
where  DATES >= DATEADD(day, -7, CURRENT_DATE)