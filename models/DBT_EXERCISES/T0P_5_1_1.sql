{{
    config(
        materialized='table'
    )
}}

select  top 5 a.name  as team_name,b.YEAR as year,sum(b.g) as goals
from {{ ref('TEAMS_MODEl') }} a  
join {{ ref('SCORING_MODEL') }} b
on a.TMID=b.TMID where b.YEAR='2011'
group by 1,2
order by goals desc