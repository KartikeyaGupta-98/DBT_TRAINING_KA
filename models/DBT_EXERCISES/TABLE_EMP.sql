{{
    config(
        materialized='ephemeral'
    )
}}

select * from {{ ref('SNAP_MASTER') }}