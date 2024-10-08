{{
    config(
        materialized='table'
    )
}}

select a.name as team_name,AVG(b.g) as goals
from {{ ref('TEAMS_MODEl') }} a  
join {{ ref('SCORING_MODEL') }} b
on a.TMID=b.TMID 
group by 1