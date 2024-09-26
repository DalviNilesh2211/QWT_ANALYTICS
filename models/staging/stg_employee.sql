{{config(materialized='table',schema = env_var('DBT_STAGE_SCHEMA','STAGING'))}}
select e.*, o.city from {{ source('qwt_src', 'employee') }} as e 
inner join {{ref('stg_office')}} o on e.office = o.officeid