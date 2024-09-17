{{config(materialized='table')}}
select e.*, o.city from {{ source('qwt_src', 'employee') }} as e 
inner join {{ref('stg_office')}} o on e.office = o.officeid