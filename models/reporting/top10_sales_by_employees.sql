select e.EMPLOYEENAME, o.ordermonth, e.city,
sum(o.linesalesamount) as sales,
avg(o.margin) margin
from {{ref('fct_orders')}} as o 
inner join {{ref('dim_employee')}}  e 
on e.empid = o.employeeid 
where e.city = {{var('city','Paris')}}' and o.orderyear=2010
group by e.EMPLOYEENAME, o.ordermonth, e.city
order by sales desc