{% test r_test_status(model, column_name) %}
select * from {{ model }} where {{ column_name }} = 'NO MATCH'
{% endtest %}