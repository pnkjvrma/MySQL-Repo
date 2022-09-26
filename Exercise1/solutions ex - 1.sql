
-- Exercise 1

-- Q1) Create a datbase exercise
use exercise
-- Q2) Create a table manufacturers as per the schema depicted

create table manufacturers(
Code int not null primary key,
Name varchar(50) not null)

-- Q3) Create a table products as per the schema depicted

create table Products(
Code_1 int not null primary key,
Name varchar(50) not null,
Price int not null,
Manufacturer int not null,
foreign key (Manufacturer) references manufacturers(Code))

-- Q4) Add records to the table manufacturers as depicted. 

insert into manufacturers values 
(1,'Sony'),
(2,'Creative labs'),
(3,'Hewlett-Packard'),
(4,'Iomega'),
(5,'Fujitsu'),
(6,'Winchester')

select * from manufacturers

-- Q5) Add records to the table products as depicted. 

insert into Products values
(1,'Hard Drive',240,5),
(2,'Memory',120,6),
(3,'Zip Drive',150,4),
(4,'Floppy Disk',50,6),
(5,'Monitor',240,1),
(6,'DVD Drive',180,2),
(7,'CD Drive',90,2),
(8,'Printer',270,3),
(9,'Toner Cartridge',66,3),
(10,'DVD Burner',180,2)
-- Q6)  Display the names of all the products in the store.

select name from products

-- Q7) Display the names and the prices of all the products in the store.

select name,price from products
-- Q8) Display the name of the products with a price less than or equal to $200.

select name,price from products where price>= 200


-- Q9) Dsiplay all the products with a price between $60 and $120.

select name,price from products where price between 60 and 120

-- Q10) Display avg price of all the products

select avg(price) AVG_Price from products

-- Q11) Compute the average price of all products with manufacturer code equal to 2.

select code_1 ,avg(price)from products where code_1=2
-- Q12) Compute the number of products with a price larger than or equal to $180 and set the column name as Prod_Count

select count(price) Prod_Count from products where price>= 180 

-- Q13) Select the name and price of all products with a price larger than or equal to $180, 
--      and sort by price (in descending order)

select name,price from products where price >=180 order by price desc

-- Q14) Display the average price of each manufacturer's products, showing only the manufacturer's code.

select name,manufacturer,avg(price) AVG_Price from products

-- Q15) Add a new product: Loudspeakers, $70, manufacturer 2.
insert into products value(11,'Loudspeakers', 70,2)

-- Q16) Update the name of product 8 to "Laser Printer".

update products set Name= "Laser Printer" where code_1 = 8
select * from products
-- Q17) Update the products table and set discount to 10% on all products
update products set price= 0.9*price
-- Q18) Delete the record where Product name is Loudspeakers.
delete from products where Name = 'Loudspeakers'

