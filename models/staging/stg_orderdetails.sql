{{
    config(
        materialized='incremental', schema = env_var('DBT_STAGE_SCHEMA','STAGING'), unique_key=['orderid','lineno']
    )
}}

     select OD.*, O.ORDERDATE 
       from {{ source('qwt_src', 'OrderDetails') }} OD 
 inner join {{ ref('stg_orders') }} O  
         on O.ORDERID=OD.ORDERID 

{% if is_incremental() %}
  -- this filter will only be applied on an incremental run
  where  O.ORDERDATE  > (select max(orderdate) from {{ this }})

{% endif %}
