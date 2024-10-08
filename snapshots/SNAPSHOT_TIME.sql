{% snapshot MASTER_SCREENSHOT_TIME %}
    {{
        config(
            target_schema='DBT_KALAPATI',
            target_database='TRAINING',
            unique_key='PLAYERID',
            strategy='timestamp',
            updated_at='updated_at'
        )
    }}

    --select * from {{ source('DBT_SOURCES', 'MASTER') }}
    select * from {{ ref('SNAP_MASTER') }}
 {% endsnapshot %}