select * from {{ source('DBT_SOURCES', 'MASTER') }}

select * from {{ source('DBT_SOURCES', 'TEAMS') }}


