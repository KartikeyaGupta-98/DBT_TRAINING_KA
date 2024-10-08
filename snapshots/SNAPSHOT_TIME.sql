{% snapshot MASTER_SCREENSHOT_TIME %}
    {{
        config(
            target_schema='DBT_KALAPATI',
            target_database='TRAINING',
            unique_key='ID',
            strategy='timestamp',
            updated_at='HIRE_DATE'
        )
    }}

    select * from {{ ref('SNAPSHOT_TIME_SAMPLE') }}
 {% endsnapshot %}