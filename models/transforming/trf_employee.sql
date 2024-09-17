{{
    config(
        materialized='table', schema='transforming'
    )
}}
select emp.empid,
emp.firstname Employeename,
emp.title as role,
emp.hiredate as doj,
emp.extension,
emp.yearsalary as salary,
iff(mgr.firstname is null, emp.firstname, mgr.firstname) as managername ,
iff(mgr.title is null, emp.title, mgr.title) as managerrole,
emp.city

from {{ref ( 'stg_employee')}} as emp 
left join  {{ref ( 'stg_employee')}} as mgr
on emp.reportsto = mgr.empid