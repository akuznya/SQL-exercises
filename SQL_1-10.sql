№1
select model, speed, hd from PC where price < 500

№2
select maker from Product where type='Printer' group by maker

№3
select model, ram, screen from Laptop where price>1000

№4
select * from Printer where color='y'

№5
select model, speed,hd from PC WHERE cd in ('12x','24x') and price<600

№6
select  distinct maker, speed from Laptop join Product on Product.model=Laptop.model where hd>=10

№7
select PC.model, PC.price from Product join PC on PC.model=Product.model where maker like 'B' union select Laptop.model, Laptop.price from Laptop join Product  on Laptop.model=Product.model where maker like 'B' union select Printer.model, Printer.price from Printer join Product on Printer.model=Product.model where maker like 'B'

№8
select maker from Product where maker not in (select maker from Product where type in ('Laptop') group by maker,type) and type  like 'PC' group by maker

№9


№10
select model, price from Printer group by model, price having price= (select max(price) as price from Printer)