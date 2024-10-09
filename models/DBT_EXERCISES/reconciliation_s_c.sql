{{
    config(
        materialized='table'
    )
}}
with source_data as (
    select 
        count(*) as source_count,
        sum(YEAR) as total_source_amount
    from {{ source('DBT_SOURCES', 'TEAMS') }}
),

target_data as (
    select 
        count(*) as target_count,
        sum(YEAR) as total_target_amount
    from TRAINING.DBT_KALAPATI.MODEL_COACHES
)

select 
    source_count,
    target_count,
    total_source_amount,
    total_target_amount,
    case 
        when source_count = target_count and total_source_amount = total_target_amount then 'MATCH'
        else 'NO MATCH' 
    end as reconciliation_status
from source_data, target_data
