{{
    config(
        materialized='table'
    )
}}
{{ get_table('TRAINING', 'DBT_KALAPATI', 'AVG_1_1') }}