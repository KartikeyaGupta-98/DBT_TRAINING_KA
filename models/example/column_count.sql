{{
    config(
        materialized='table'
    )
}}

{% set tables=['MASTER','TEAMS','SCORING','COACHES'] %}

{% for item in tables %}
    SELECT 
        '{{ item }}' AS table_name, 
        COUNT(*) AS column_count
    FROM information_schema.columns 
    WHERE table_name = '{{ item }}'
   {% if not loop.last %} 
   UNION ALL 
   {% endif %}
{% endfor %}
