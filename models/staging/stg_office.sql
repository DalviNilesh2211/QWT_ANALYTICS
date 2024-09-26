{{config(materialized='table')}}
select 
Office OfficeID ,
OfficeAddress as Address,
OfficePostalCode PostalCode,
OfficeCity City,
OfficeStateProvince StateProvince,
OfficePhone Phone,
OfficeFax Fax,
OfficeCountry Country

from {{ source('qwt_src', 'office') }}