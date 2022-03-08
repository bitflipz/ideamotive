select count(distinct recclass) AS 'unique class' from meteor;


select avg(mass) as 'avg mass', recclass as 'class'
from meteor
group by recclass;


select avg(mass) as 'avg mass', recclass as 'class'
from meteor
group by recclass
having avg(mass)<5000
order by avg(mass) DESC;