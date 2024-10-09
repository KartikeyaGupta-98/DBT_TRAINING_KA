{% macro get_table(database_name, schema_name, table_name) %}
    SELECT *
    FROM {{ database_name }}.{{ schema_name }}.{{ table_name }}
{% endmacro %}

