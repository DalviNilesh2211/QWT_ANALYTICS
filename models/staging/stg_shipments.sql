{{config(materialized='table')}}
select OrderID , LineNo , ShipperID , CustomerID ,
       ProductID , EmployeeID ,
       split_part(ShipmentDate ,' ',1 )::date ShipmentDate, 
        Status 
  from {{ source('qwt_src', 'shipments') }}