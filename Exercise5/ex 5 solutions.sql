

-- Use the following insert queries



-- Q1) Create table warehouses as per schema depicted
create table WH(
Code int not null primary key,
Location varchar(50) not null,
Capacity int not null)


-- Q2) Create table boxes as per schema depicted

Create table BX(
Code varchar(4) not null primary key,
Contents varchar(200) not null,
value varchar(50) not null,
warehouse int not null,
foreign key (warehouse) references WH (Code))


-- Q3) Insert records into the table warehouses

INSERT INTO WH(Code,Location,Capacity) VALUES(1,'Chicago',3),
(2,'Chicago',4),
(3,'New York',7),
(4,'Los Angeles',2),
(5,'San Francisco',8)

-- Q4) Insert records into the table boxes

INSERT INTO BX(Code,Contents,Value,Warehouse) VALUES('0MN7','Rocks',180,3),
('4H8P','Rocks',250,1),
('4RT3','Scissors',190,4),
('7G3H','Rocks',200,1),
('8JN6','Papers',75,1),
('8Y6U','Papers',50,3),
('9J6F','Papers',175,2),
('LL08','Rocks',140,4),
('P0H6','Scissors',125,1),
('P2T6','Scissors',150,2),
('TU55','Papers',90,5)

-- Q5) Display location and capacity from warehouses

select location,capacity from WH

-- Q6) Select Code, location and capacity where location starts 
--     with 'C' from warehouses table

select Code,Location,capacity from wh where location like 'C%'

-- Q7) display distinct location from warehouses

select distinct location from wh

-- Q8) display contents and value from boxes where value is 
--     between 150 and 200

select contents ,value from bx where value between 150 and 200

-- Q9) Display sum of value based on contents

select contents,sum(value) from bx group by contents

-- Q10) Display avg capacity based on location from warehouses

select location,avg(capacity) from wh group by location order by location

-- Q11) Display max value based on Warehouse code in ascending
--      order of warehouse code

select code,max(value) from bx group by warehouse order by code

-- Q12) Display min value based on contents in descending order
--      of contents from boxes table when the box code is 
--      either 'OMN7','8JN6' or '4RT3' 
select * from bx
select contents,min(value) Min_value from bx where code in ('OMN7','8JN6','4RT3') group by contents order by contents desc

-- Q13) Select the warehouse code and the average value of the boxes
--      in each warehouse.

select code,avg(value) from bx group by code

-- Q14) Display the warehouse codes, along with the number of boxes 
--      in each warehouse from boxes table

select code,count(warehouse) from bx group by code

-- Queries on Joins
-- solve using inner join
-- Q15) Select Location, Capacity and code of each box

select w.location,w.capacity,b.code
from wh w
inner join
bx b
on b.code= w.code 

-- Q16) Select code and location of all the boxes which are either insert Chicago or new York
select * from bx -- code,contents,value,warehouse
select * from wh -- code,location,capacity

select w.code,w.location,b.contents 
from wh w 
left join 
bx b
on w.code = b.code
where w.location in ('Chicago','New York')

-- Q17) Select code, contents and location of all the boxes whose values are greater than 4 and location is not Chicago

select b.code,b.contents,w.location 
from bx b
inner join wh w
on b.code=w.code
where b.value >4
and w.location not in('Chicago')

-- Q18) Select avg value based on location of all the boxes

select avg(value),w.location
from bx b
inner join 
wh w on
b.code=w.code
group by w.location

-- Q19) Select avg value based on location and contents of all the boxes

select b.contents, w.location,avg(value)
from wh w 
inner join bx b
on w.code= b.code
group by b.contents

-- Q20) Select avg value based on location of all the boxes with avg value more than 120

select w.location, avg(value) 
from bx b
inner join wh w
on b.code= w.code
group by w.location
where avg(value)>120
-- Q21) Select sum of value based on location of all the boxes with sum value more than 120 and where capacity is greater than or equal to 3
