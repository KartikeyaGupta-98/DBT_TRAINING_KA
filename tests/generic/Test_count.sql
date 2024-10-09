{% test Test_count(model, column_name) %}

    
select *
    from {{ model }}
    where len( {{ column_name }} )  > 4

{% endtest %}
