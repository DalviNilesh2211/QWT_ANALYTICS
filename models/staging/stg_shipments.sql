{{config(materialized='table'), schema = env_var('DBT_STAGE_SCHEMA','STAGING')}}
select OrderID , LineNo , ShipperID , CustomerID ,
       ProductID , EmployeeID ,
       split_part(ShipmentDate ,' ',1 )::date ShipmentDate, 
        Status 
  from {{ source('qwt_src', 'shipments') }}