{% snapshot MASTER_SCREENSHOT_TIME %}
    {{
        config(
            target_schema='DBT_KALAPATI',
            target_database='TRAINING',
            unique_key='PLAYERID',
            strategy='check',
            check_cols=['FIRSTNAME']
        )
    }}

    --select * from {{ source('DBT_SOURCES', 'MASTER') }}
    select * from {{ ref('SNAP_MASTER') }}
 {% endsnapshot %}