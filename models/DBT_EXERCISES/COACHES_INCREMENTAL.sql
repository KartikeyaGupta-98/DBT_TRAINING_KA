{{
    config(
        materialized='incremental',
        unique_key=['coachid','year','STINT']
    )
}}

select * from TRAINING.DBT_KALAPATI.MODEL_COACHES