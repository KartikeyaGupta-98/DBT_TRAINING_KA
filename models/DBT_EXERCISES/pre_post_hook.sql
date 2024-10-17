{{ config(
    materialized='incremental',
    unique_key='id',
    on_schema_change='sync_all_columns',
    
    pre_hook=[
        "INSERT INTO {{ this.schema }}.audit_log (action, model_name, timestamp) VALUES ('start', '{{ this.name }}', CURRENT_TIMESTAMP)"
    ],
    post_hook=[
        "INSERT INTO {{ this.schema }}.audit_log (action, model_name, timestamp) VALUES ('end', '{{ this.name }}', CURRENT_TIMESTAMP)",
        "UPDATE {{ this .schema}}.pre_post_hook SET bond_duration_date = DATEADD(year, 2, HIRE_DATE)"
    ]
) }}
select *,null as bond_duration_date from TRAINING.DBT_KALAPATI.DBT_SNAP_TIME
{% if is_incremental() %}
-- Incremental logic to get only new records
WHERE HIRE_DATE > (SELECT MAX(HIRE_DATE) FROM {{ this }})
{% endif %}
