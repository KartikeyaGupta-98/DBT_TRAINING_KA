{{
    config(
        materialized='table'
    )
}}

{% set check_height %}
    SELECT Height FROM HOCKEYDB.HOCKEY.master WHERE lastname = 'Aalto'
{% endset %}

{% set height_result = run_query(check_height) %}

{% if height_result and height_result.columns | length > 0 %}
    {% set aalto_height_column = height_result.columns[0] %}
    {% set aalto_height = aalto_height_column.values()[0] %}
{% else %}
    {% set aalto_height = null %}
{% endif %}

select
    playerid,
    firstname,
    lastname,
    weight,
    case
        when weight > {{ aalto_height }} then 'MORE height than Aalto'
        else 'LESS height than Aalto'
    end as status
from HOCKEYDB.HOCKEY.master
