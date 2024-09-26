{% macro get_min_orderdate() -%}

{% set minorderdate_query %}
select to_date(min(orderdate))
from {{ ref('stg_orders') }}
{% endset %}

{% set results = run_query(minorderdate_query) %}

{% if execute %}
{# Return the first column #}
{% set results_list = results.columns[0][0] %}
{% else %}
{% set results_list = [] %}
{% endif %}

{{ return(results_list) }}

{%- endmacro %}

{% macro get_max_orderdate() %}
 
{% set orderdate_query %}
 
select to_date(max(orderdate))
from {{ ref('stg_orders') }}
 
{% endset %}
 
{% set results = run_query(orderdate_query) %}
 
{% if execute %}
{# Return the first column #}
{% set results_list = results.columns[0][0] %}
{% else %}
{% set results_list = [] %}
{% endif %}
 
{{ return(results_list) }}
 
{%- endmacro %}
