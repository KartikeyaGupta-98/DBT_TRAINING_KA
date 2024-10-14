{{
    config(
        materialized='table'
    )
}}

{% set check_weight %}
    SELECT weight FROM HOCKEYDB.HOCKEY.master WHERE lastname = 'Adair'
{% endset %}

{% set weight_result = run_query(check_weight) %}

{% if weight_result and weight_result.rows | length > 0 %}
    {% set adair_weight = weight_result.rows[0][0] %}  
{% else %}
    {% set adair_weight = null %}
{% endif %}


select
    playerid,
    firstname,
    lastname,
    weight,
    case
        when weight > {{ adair_weight }} then 'MORE WEIGHT THAN Adair'
        else 'LESS WEIGHT THAN Adair'
    end as status
from HOCKEYDB.HOCKEY.master



