{{
    config(
        materialized='table'
    )
}}
{% set tables=['MASTER','TEAMS','SCORING','COACHES'] %}

{% for item in tables %}
        SELECT 
         COUNT(*) AS TABLE_ROW_COUNT,
        '{{ item }}' AS table_column
    FROM HOCKEYDB.HOCKEY.{{ item }} 
    {% if not loop.last %} UNION ALL {% endif %}
    
{% endfor %}

