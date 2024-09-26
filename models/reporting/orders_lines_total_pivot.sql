{{
    config(
        materialized='view', schema='reporting'
    )
}}
{% set each_lineno = get_order_lineno() %}

select orderid,
{% for linenumber in each_lineno %}
sum(case when Lineno = {{linenumber}} then linesalesamount end) as lineno_{{linenumber}}_amount,
{% endfor %}

/*sum(case when Lineno = 1 then linesalesamount end) as lineno1_amount,
sum(case when Lineno = 2 then linesalesamount end) as lineno2_amount,
sum(case when Lineno = 3 then linesalesamount end) as lineno3_amount,
*/
sum(linesalesamount) as total_amount
 from {{ref ( 'trf_orderdetails')}}
group by orderid
 
