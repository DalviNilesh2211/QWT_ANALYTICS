{{
    config(
        materialized='view', schema='salesmart'
    )
}}
select emp.*
from {{ ref('trf_employee')}} emp   
