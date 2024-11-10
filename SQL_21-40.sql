№21
select maker, max(price)from PC join Product on Product.model=PC.model group by maker

№22
Select speed, avg(price) from PC where speed>600 group by speed

№23
select Maker from Product join Laptop on Laptop.model=Product.model where speed>=750
INTERSECT select Maker from Product join PC on PC.model=Product.model where speed>=750

№24
select model from (select max(b.price) pr, b.model from Product a join PC b on b.model=a.model group by b.model 
union
select max(c.price) pr, c.model from Laptop c join Product a on c.model=a.model group by c.model
union
select max(d.price) pr, d.model from Printer d join Product a on d.model=a.model group by d.model) aa where pr=(select max(pr) from (select max(b.price) pr, b.model from Product a join PC b on b.model=a.model group by b.model 
union
select max(c.price) pr, c.model from Laptop c join Product a on c.model=a.model group by c.model
union
select max(d.price) pr, d.model from Printer d join Product a on d.model=a.model group by d.model) bb)

№25
select DISTINCT maker from product where model IN (
select model from pc where ram = (select min(ram) from pc)
and speed = (select max(speed) from pc where ram = (select min(ram) from pc ))) and maker IN (select maker from product where type='printer')

№26
select avg(pr) avg_price from (select code, price pr, lp.model, ram, hd from Laptop lp
where model in(select a.model from Product a where maker='A')
union
select code, price pr, pc.model, ram, hd from pc
where model in(select a.model from Product a where maker='A')) x

№27
select pr.maker,avg(hd) from pc join product pr on pc.model=pr.model
where pr.maker in(select DISTINCT maker from product where maker in(select maker from product where type='printer')) group by pr.maker

№28
select count(maker) from (select maker from product pr group by maker having count(*)=1) x

№29
select a.point, a.date, inc, out from income_o a left join outcome_o s on a.date=s.date and a.point=s.point
union
select s.point, s.date, inc, out from income_o a right join outcome_o s on a.date=s.date and a.point=s.point

№30
select point, date, sum(a), sum(b)
from (select point, date, sum(out) a, null b from outcome group by point, date
union
select point, date, null, sum(inc) from income group by point, date) x group by point, date

№31
select class, country from classes where bore>=16

№32
select country, cast(avg((power(bore,3)/2)) as numeric(6,2)) as weight 
from (select country, classes.class, bore, name from classes left join ships on classes.class=ships.class 
union all 
select distinct country, class, bore, ship from classes t1 left join outcomes t2 on t1.class=t2.ship 
where ship=class and ship not in (select name from ships)) a where name is not null group by country

№33
select ship from outcomes o join battles b on b.name=o.battle where result='sunk' and name='North Atlantic'

№34
select name from ships s join classes c on c.class=s.class where launched >=1922 and type='bb' and displacement > 35000

№35
select model, type from product where model not like '%[^A-Z]%' or model not like '%[^0-9]%'

№36
select name from ships where name=class
union 
select ship from outcomes o full join ships s on s.name=o.ship join classes c on c.class=o.ship

№37
select class from (select class, name from ships s join outcomes o on o.ship=s.name
union all
select class, ship as name from outcomes o join classes c on c.class=o.ship 
union 
select class, name from ships) x group by class having count(class)=1

№38
select country from classes where type='bb' group by country
intersect 
select country from classes where type='bc' group by country

№39
select distinct ship from (select ship, battle, date from outcomes o join battles b on b.name=o.battle where result='damaged'
and ship in (select ship from outcomes join battles ba on battle=name where b.date< ba.date)) x

№40
select maker, type from product where maker in(
select maker from (select maker, type from product group by maker, type) aa 
group by maker having count(*)=1) group by maker, type having count(*)>1